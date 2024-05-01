using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;

namespace FileToDatabase
{
    class Program
    {
        static void Main(string[] args)
        {
            string directoryPath = @"C:\GitHubDev\TechnovitySolutions\FoodDataCentral-DB\DataFiles\Trouble Files";
            string connectionString = @"";

            // Get all file names in the directory
            string[] files = Directory.GetFiles(directoryPath);

            foreach (string file in files)
            {
                // Get table name from file name
                string tableName = Path.GetFileNameWithoutExtension(file);

                // Create DataTable dynamically based on column definitions from SQL Server
                DataTable dataTable = GetDataTableFromSQL(connectionString, tableName);

                // Populate DataTable with data from file
                PopulateDataTableFromFile(dataTable, file, connectionString, tableName);

                // Bulk copy the data to SQL Server
                BulkCopyDataTable(connectionString, dataTable, tableName);

                Console.WriteLine($"Data from file '{file}' imported to table '{tableName}' successfully.");
            }

            Console.ReadLine();
        }

        static DataTable GetDataTableFromSQL(string connectionString, string tableName)
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Query column definitions from SQL Server
                string query = $"SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{tableName}'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Add columns to DataTable based on column definitions
                        while (reader.Read())
                        {
                            string columnName = reader["COLUMN_NAME"].ToString();
                            string dataType = reader["DATA_TYPE"].ToString();

                            Type columnType = GetCSharpType(dataType);
                            dataTable.Columns.Add(columnName, columnType);
                        }
                    }
                }
            }

            return dataTable;
        }

        static void PopulateDataTableFromFile(DataTable dataTable, string file, string connectionString, string tableName)
        {
            // Read data from file and populate DataTable, skipping the first line (header row)
            using (StreamReader reader = new StreamReader(file))
            {
                // Skip the first line (header row)
                reader.ReadLine();

                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string[] values = ParseCsvLine(line);

                    // Convert data types dynamically based on column definitions
                    ConvertDataTypes(dataTable, values, connectionString, tableName);
                }
            }
        }

        static string[] ParseCsvLine(string line)
        {
            List<string> parsedValues = new List<string>();
            StringBuilder value = new StringBuilder();
            bool inQuotes = false;

            foreach (char c in line)
            {
                if (c == '"')
                {
                    inQuotes = !inQuotes;
                }
                else if (c == ',' && !inQuotes)
                {
                    parsedValues.Add(value.ToString());
                    value.Clear();
                }
                else
                {
                    value.Append(c);
                }
            }

            // Add the last value
            parsedValues.Add(value.ToString());

            // Remove leading and trailing spaces from each parsed value
            for (int i = 0; i < parsedValues.Count; i++)
            {
                parsedValues[i] = parsedValues[i].Trim();
            }

            return parsedValues.ToArray();
        }



        static void ConvertDataTypes(DataTable dataTable, string[] values, string connectionString, string tableName)
        {
            if (values.Length != dataTable.Columns.Count)
            {
                Console.WriteLine($"Invalid number of columns in data row. Skipping row...");
                return;
            }

            DataRow row = dataTable.NewRow();

            for (int i = 0; i < values.Length; i++)
            {
                DataColumn column = dataTable.Columns[i];
                Type columnType = column.DataType;

                // Convert data based on column data type
                object convertedValue = ConvertValue(values[i], columnType);

                if (convertedValue != null)
                {
                    row[column.ColumnName] = convertedValue; // Add value to the correct column
                }
                else
                {
                    Console.WriteLine($"Error converting value '{values[i]}' for column '{column.ColumnName}' in table '{tableName}'. Skipping row...");
                    return;
                }
            }

            dataTable.Rows.Add(row); // Add the row to the DataTable
        }


        static object ConvertValue(string value, Type targetType)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                // Handle empty or blank values based on target type
                if (targetType == typeof(int) || targetType == typeof(decimal))
                {
                    return 0; // Return DBNull.Value for int or decimal columns
                }
                else if (targetType == typeof(DateTime))
                {
                    return DateTime.Parse("01/01/1900"); // Return DBNull.Value for int or decimal columns
                }
                else
                {
                    // For other data types, try direct conversion
                    try
                    {
                        return Convert.ChangeType(value, targetType);
                    }
                    catch (Exception)
                    {
                        // Handle conversion errors gracefully
                        return null;
                    }
                }
            }
            else
            {
                if (targetType == typeof(int))
                {
                    // Remove leading and trailing spaces
                    value = value.Trim();

                    // Attempt to parse the value as an integer
                    if (int.TryParse(value, out int intValue))
                    {
                        return intValue;
                    }
                    else
                    {
                        // Handle conversion failure
                        return null;
                    }
                }
                else
                {
                    // For other data types, try direct conversion
                    try
                    {
                        return Convert.ChangeType(value, targetType);
                    }
                    catch (Exception)
                    {
                        // Handle conversion errors gracefully
                        return null;
                    }
                }
            }
            
        }



        static void BulkCopyDataTable(string connectionString, DataTable dataTable, string tableName)
        {
            // Bulk copy the data to SQL Server
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection))
                {
                    bulkCopy.DestinationTableName = "USDA." + tableName;
                    bulkCopy.BatchSize = 1000; // Adjust batch size as needed
                    bulkCopy.BulkCopyTimeout = 600; // Adjust timeout as needed


                    try
                    {
                        bulkCopy.WriteToServer(dataTable);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Error importing data to table '{tableName}': {ex.Message}");
                    }
                }
            }
        }

        static Type GetCSharpType(string sqlType)
        {
            switch (sqlType.ToLower())
            {
                case "int":
                    return typeof(int);
                case "nvarchar":
                case "varchar":
                    return typeof(string);
                case "datetime":
                    return typeof(DateTime);
                case "date":
                    return typeof(DateTime);
                case "decimal":
                    return typeof(decimal);
                // Add more cases as needed for other SQL data types
                default:
                    return typeof(object); // Default to object type if type mapping is not defined
            }
        }
    }
}