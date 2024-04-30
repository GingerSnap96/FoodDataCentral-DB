USE Technovity;
GO

-- Drop all foreign keys

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_acquisition_samples_fdc_id_of_acquisition_food')
ALTER TABLE FoodDataCentral.acquisition_samples DROP CONSTRAINT IF EXISTS FK_acquisition_samples_fdc_id_of_acquisition_food;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_agricultural_samples_fdc_id')
ALTER TABLE FoodDataCentral.agricultural_samples DROP CONSTRAINT IF EXISTS FK_agricultural_samples_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_attribute_fdc_id')
ALTER TABLE FoodDataCentral.food_attribute DROP CONSTRAINT IF EXISTS FK_food_attribute_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_attribute_food_attribute_type_id')
ALTER TABLE FoodDataCentral.food_attribute DROP CONSTRAINT IF EXISTS FK_food_attribute_food_attribute_type_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_calorie_conversion_factor_food_nutrient_conversion_factor_id')
ALTER TABLE FoodDataCentral.food_calorie_conversion_factor DROP CONSTRAINT IF EXISTS FK_food_calorie_conversion_factor_food_nutrient_conversion_factor_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_component_fdc_id')
ALTER TABLE FoodDataCentral.food_component DROP CONSTRAINT IF EXISTS FK_food_component_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_nutrient_fdc_id')
ALTER TABLE FoodDataCentral.food_nutrient DROP CONSTRAINT IF EXISTS FK_food_nutrient_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_nutrient_nutrient_id')
ALTER TABLE FoodDataCentral.food_nutrient DROP CONSTRAINT IF EXISTS FK_food_nutrient_nutrient_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_nutrient_derivation_id')
ALTER TABLE FoodDataCentral.food_nutrient DROP CONSTRAINT IF EXISTS FK_food_nutrient_derivation_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_food_portion_measure_unit_id')
ALTER TABLE FoodDataCentral.food_portion DROP CONSTRAINT IF EXISTS FK_food_portion_measure_unit_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_input_food_fdc_id')
ALTER TABLE FoodDataCentral.input_food DROP CONSTRAINT IF EXISTS FK_input_food_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_input_food_fdc_id_of_input_food')
ALTER TABLE FoodDataCentral.input_food DROP CONSTRAINT IF EXISTS FK_input_food_fdc_id_of_input_food;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_lab_method_code_lab_method_id')
ALTER TABLE FoodDataCentral.lab_method_code DROP CONSTRAINT IF EXISTS FK_lab_method_code_lab_method_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_lab_method_nutrient_lab_method_id')
ALTER TABLE FoodDataCentral.lab_method_nutrient DROP CONSTRAINT IF EXISTS FK_lab_method_nutrient_lab_method_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_market_acquisition_fdc_id')
ALTER TABLE FoodDataCentral.market_acquisition DROP CONSTRAINT IF EXISTS FK_market_acquisition_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_microbe_foodId')
ALTER TABLE FoodDataCentral.microbe DROP CONSTRAINT IF EXISTS FK_microbe_foodId;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_sub_sample_food_fdc_id')
ALTER TABLE FoodDataCentral.sub_sample_food DROP CONSTRAINT IF EXISTS FK_sub_sample_food_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_sub_sample_food_fdc_id_of_sample_food')
ALTER TABLE FoodDataCentral.sub_sample_food DROP CONSTRAINT IF EXISTS FK_sub_sample_food_fdc_id_of_sample_food;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_sub_sample_result_food_nutrient_id')
ALTER TABLE FoodDataCentral.sub_sample_result DROP CONSTRAINT IF EXISTS FK_sub_sample_result_food_nutrient_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_sub_sample_result_lab_method_id')
ALTER TABLE FoodDataCentral.sub_sample_result DROP CONSTRAINT IF EXISTS FK_sub_sample_result_lab_method_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_survey_fndds_food_fdc_id')
ALTER TABLE FoodDataCentral.survey_fndds_food DROP CONSTRAINT IF EXISTS FK_survey_fndds_food_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_survey_fndds_food_wweia_category_code')
ALTER TABLE FoodDataCentral.survey_fndds_food DROP CONSTRAINT IF EXISTS FK_survey_fndds_food_wweia_category_code;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_sample_food_fdc_id')
ALTER TABLE FoodDataCentral.sample_food DROP CONSTRAINT IF EXISTS FK_sample_food_fdc_id;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'FoodDataCentral' AND CONSTRAINT_NAME = 'FK_sr_legacy_food_fdc_id')
ALTER TABLE FoodDataCentral.sr_legacy_food DROP CONSTRAINT IF EXISTS FK_sr_legacy_food_fdc_id;


-- Drop all tables
DROP TABLE IF EXISTS FoodDataCentral.acquisition_samples;
DROP TABLE IF EXISTS FoodDataCentral.agricultural_samples;
DROP TABLE IF EXISTS FoodDataCentral.branded_food;
DROP TABLE IF EXISTS FoodDataCentral.fndds_derivation;
DROP TABLE IF EXISTS FoodDataCentral.fndds_ingredient_nutrient_value;
DROP TABLE IF EXISTS FoodDataCentral.food;
DROP TABLE IF EXISTS FoodDataCentral.food_attribute;
DROP TABLE IF EXISTS FoodDataCentral.food_attribute_type;
DROP TABLE IF EXISTS FoodDataCentral.food_calorie_conversion_factor;
DROP TABLE IF EXISTS FoodDataCentral.food_category;
DROP TABLE IF EXISTS FoodDataCentral.food_component;
DROP TABLE IF EXISTS FoodDataCentral.food_nutrient;
DROP TABLE IF EXISTS FoodDataCentral.food_nutrient_conversion_factor;
DROP TABLE IF EXISTS FoodDataCentral.food_nutrient_derivation;
DROP TABLE IF EXISTS FoodDataCentral.food_nutrient_source;
DROP TABLE IF EXISTS FoodDataCentral.food_portion;
DROP TABLE IF EXISTS FoodDataCentral.food_protein_conversion_factor;
DROP TABLE IF EXISTS FoodDataCentral.food_update_log_entry;
DROP TABLE IF EXISTS FoodDataCentral.foundation_food;
DROP TABLE IF EXISTS FoodDataCentral.input_food;
DROP TABLE IF EXISTS FoodDataCentral.lab_method;
DROP TABLE IF EXISTS FoodDataCentral.lab_method_code;
DROP TABLE IF EXISTS FoodDataCentral.lab_method_nutrient;
DROP TABLE IF EXISTS FoodDataCentral.market_acquisition;
DROP TABLE IF EXISTS FoodDataCentral.measure_unit;
DROP TABLE IF EXISTS FoodDataCentral.microbe;
DROP TABLE IF EXISTS FoodDataCentral.nutrient;
DROP TABLE IF EXISTS FoodDataCentral.nutrient_incoming_name;
DROP TABLE IF EXISTS FoodDataCentral.retention_factor;
DROP TABLE IF EXISTS FoodDataCentral.sample_food;
DROP TABLE IF EXISTS FoodDataCentral.sr_legacy_food;
DROP TABLE IF EXISTS FoodDataCentral.sub_sample_food;
DROP TABLE IF EXISTS FoodDataCentral.sub_sample_result;
DROP TABLE IF EXISTS FoodDataCentral.survey_fndds_food;
DROP TABLE IF EXISTS FoodDataCentral.wweia_food_category;
GO

-- Drop the schema
DROP SCHEMA IF EXISTS FoodDataCentral;
GO

-- Recreate the schema
CREATE SCHEMA FoodDataCentral AUTHORIZATION dbo;
GO

CREATE TABLE FoodDataCentral.acquisition_samples (
    fdc_id_of_sample_food INT CONSTRAINT PK_acquisition_samples PRIMARY KEY,
    fdc_id_of_acquisition_food INT
);
-- Add description to the acquisition_samples table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Describes the samples acquired for analysis.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'acquisition_samples';

-- Add description to fdc_id_of_sample_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the sample food in the acquisition process.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'acquisition_samples', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_sample_food';

-- Add description to fdc_id_of_acquisition_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the acquisition food associated with the sample.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'acquisition_samples', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_acquisition_food';


CREATE TABLE FoodDataCentral.agricultural_samples (
    fdc_id INT CONSTRAINT PK_agricultural_samples PRIMARY KEY,
    acquisition_date DATE,
    market_class VARCHAR(50),
    treatment VARCHAR(50),
    state VARCHAR(2)
);

-- Add description to the agricultural_samples table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Describes samples collected from agricultural sources.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the agricultural sample.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to acquisition_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the sample was acquired.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'acquisition_date';

-- Add description to market_class column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Market classification of the agricultural sample.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'market_class';

-- Add description to treatment column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Treatment applied to the agricultural sample.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'treatment';

-- Add description to state column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'State where the agricultural sample was collected.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'state';


CREATE TABLE FoodDataCentral.branded_food (
    fdc_id INT CONSTRAINT PK_branded_food PRIMARY KEY,
    brand_owner VARCHAR(255),
    brand_name VARCHAR(255),
    subbrand_name VARCHAR(255),
    gtin_upc VARCHAR(20),
    ingredients VARCHAR(MAX),
    not_a_significant_source_of VARCHAR(255),
    serving_size INT,
    serving_size_unit VARCHAR(50),
    household_serving_fulltext VARCHAR(255),
    branded_food_category VARCHAR(255),
    data_source VARCHAR(255),
    package_weight INT,
    modified_date DATE,
    available_date DATE,
    market_country VARCHAR(255),
    discontinued_date DATE,
    preparation_state_code VARCHAR(10),
    trade_channel VARCHAR(255),
    short_description VARCHAR(255)
);
-- Add description to the branded_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Describes branded food products.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the branded food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to brand_owner column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Owner of the brand for the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'brand_owner';

-- Add description to brand_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the brand for the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'brand_name';

-- Add description to subbrand_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Sub-brand name for the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'subbrand_name';

-- Add description to gtin_upc column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Global Trade Item Number (GTIN) or Universal Product Code (UPC) for the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'gtin_upc';

-- Add description to ingredients column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Ingredients used in the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'ingredients';

-- Add description to not_a_significant_source_of column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Indicates if the food product is not a significant source of a particular nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'not_a_significant_source_of';

-- Add description to serving_size column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Serving size of the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'serving_size';

-- Add description to serving_size_unit column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unit of measurement for the serving size of the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'serving_size_unit';

-- Add description to household_serving_fulltext column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the household serving size for the food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'household_serving_fulltext';

-- Add description to branded_food_category column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Category of the branded food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'branded_food_category';

-- Add description to data_source column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Data source for information about the branded food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'data_source';

-- Add description to package_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Weight of the package containing the branded food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'package_weight';

-- Add description to modified_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the branded food product was last modified.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'modified_date';

-- Add description to available_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the branded food product became available.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'available_date';

-- Add description to market_country column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Country where the branded food product is marketed.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'market_country';

-- Add description to discontinued_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the branded food product was discontinued.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'discontinued_date';

-- Add description to preparation_state_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code indicating the preparation state of the branded food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'preparation_state_code';

-- Add description to trade_channel column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Trade channel through which the branded food product is distributed.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'trade_channel';

-- Add description to short_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Short description of the branded food product.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'short_description';


CREATE TABLE FoodDataCentral.fndds_derivation (
    SR_28_derivation_code VARCHAR(2) CONSTRAINT PK_fndds_derivation PRIMARY KEY,
    SR_28_derivation_description VARCHAR(255)
);

-- Add description to the fndds_derivation table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Describes derivations for SR-28 data.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_derivation';

-- Add description to SR_28_derivation_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the SR-28 derivation.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_derivation', 
    @level2type = N'COLUMN', @level2name = N'SR_28_derivation_code';

-- Add description to SR_28_derivation_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description for the SR-28 derivation.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_derivation', 
    @level2type = N'COLUMN', @level2name = N'SR_28_derivation_description';


CREATE TABLE FoodDataCentral.fndds_ingredient_nutrient_value (
    ingredient_code VARCHAR(10) CONSTRAINT PK_fndds_ingredient_nutrient_value PRIMARY KEY,
    ingredient_description VARCHAR(255),
    nutrient_code INT,
    nutrient_value DECIMAL(18, 2),
    nutrient_value_source VARCHAR(50),
    fdc_id INT,
    derivation_code VARCHAR(10),
    SR_AddMod_year INT,
    Foundation_year_acquired INT,
    Start_date DATE,
    End_date DATE
);

-- Add description to the fndds_ingredient_nutrient_value table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores nutrient values for ingredients in FNDDS.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value';

-- Add description to ingredient_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the ingredient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'ingredient_code';

-- Add description to ingredient_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description for the ingredient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'ingredient_description';

-- Add description to nutrient_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'nutrient_code';

-- Add description to nutrient_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Value of the nutrient in the ingredient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'nutrient_value';

-- Add description to nutrient_value_source column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Source of the nutrient value.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'nutrient_value_source';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to link to FDC.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to derivation_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the derivation.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'derivation_code';

-- Add description to SR_AddMod_year column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Year of addition or modification for SR data.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'SR_AddMod_year';

-- Add description to Foundation_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Year when foundation data was acquired.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'Foundation_year_acquired';

-- Add description to Start_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Start date of data relevance.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'Start_date';

-- Add description to End_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'End date of data relevance.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'End_date';


CREATE TABLE FoodDataCentral.food (
    fdc_id INT CONSTRAINT PK_food PRIMARY KEY,
    data_type VARCHAR(50),
    description VARCHAR(255),
    food_category_id INT,
    publication_date DATE
);

-- Add description to the food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores information about food items in the database.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to data_type column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Type of data for the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'data_type';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'description';

-- Add description to food_category_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to link to food categories.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'food_category_id';

-- Add description to publication_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date of publication for the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'publication_date';


CREATE TABLE FoodDataCentral.food_attribute (
    id INT CONSTRAINT PK_food_attribute PRIMARY KEY,
    fdc_id INT,
    seq_num INT,
    food_attribute_type_id INT,
    name VARCHAR(255),
    value VARCHAR(MAX)
);

-- Add description to the food_attribute table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores attributes related to food items in the database.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food attribute.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to link to food items.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to seq_num column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Sequential number for the food attribute.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'seq_num';

-- Add description to food_attribute_type_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to link to food attribute types.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'food_attribute_type_id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the food attribute.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Value of the food attribute.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'value';


CREATE TABLE FoodDataCentral.food_attribute_type (
    id INT CONSTRAINT PK_food_attribute_type PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(MAX)
);

-- Add description to the food_attribute_type table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores types of attributes related to food items in the database.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food attribute type.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the food attribute type.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food attribute type.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type', 
    @level2type = N'COLUMN', @level2name = N'description';


CREATE TABLE FoodDataCentral.food_calorie_conversion_factor (
    food_nutrient_conversion_factor_id INT CONSTRAINT PK_food_calorie_conversion_factor PRIMARY KEY,
    protein_value DECIMAL(18, 2),
    fat_value DECIMAL(18, 2),
    carbohydrate_value DECIMAL(18, 2)
);

-- Add description to the food_calorie_conversion_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores calorie conversion factors for different nutrients in food items.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor';

-- Add description to food_nutrient_conversion_factor_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the calorie conversion factor.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'food_nutrient_conversion_factor_id';

-- Add description to protein_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Calorie conversion factor for protein.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'protein_value';

-- Add description to fat_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Calorie conversion factor for fat.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'fat_value';

-- Add description to carbohydrate_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Calorie conversion factor for carbohydrates.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'carbohydrate_value';


CREATE TABLE FoodDataCentral.food_category (
    id INT CONSTRAINT PK_food_category PRIMARY KEY,
    code VARCHAR(10),
    description VARCHAR(255)
);

-- Add description to the food_category table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores information about different categories of food items.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_category';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food category.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_category', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code representing the food category.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_category', 
    @level2type = N'COLUMN', @level2name = N'code';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food category.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_category', 
    @level2type = N'COLUMN', @level2name = N'description';


CREATE TABLE FoodDataCentral.food_component (
    id INT CONSTRAINT PK_food_component PRIMARY KEY,
    fdc_id INT,
    name VARCHAR(255),
    pct_weight DECIMAL(5, 2),
    is_refuse VARCHAR(1),
    gram_weight DECIMAL(5, 2),
    data_points INT,
    min_year_acquired INT
);
-- Add description to the food_component table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores information about components of food items.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food component.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the FDC ID of the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the food component.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to pct_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Percentage weight of the food component.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'pct_weight';

-- Add description to is_refuse column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Flag indicating if the food component is refuse.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'is_refuse';

-- Add description to gram_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Gram weight of the food component.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'gram_weight';

-- Add description to data_points column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Number of data points for the food component.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'data_points';

-- Add description to min_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum year when the food component was acquired.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'min_year_acquired';


CREATE TABLE FoodDataCentral.food_nutrient (
    id INT CONSTRAINT PK_food_nutrient PRIMARY KEY,
    fdc_id INT,
    nutrient_id INT,
    amount DECIMAL(18, 2),
    data_points INT,
    derivation_id INT,
    min DECIMAL(18, 2),
    max DECIMAL(18, 2),
    median DECIMAL(18, 2),
    loq DECIMAL(18, 2),
    footnote VARCHAR(255),
    min_year_acquired INT,
    percent_daily_value INT
);

-- Add description to the food_nutrient table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores information about nutrients in food items.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food nutrient record.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the FDC ID of the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'nutrient_id';

-- Add description to amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Amount of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'amount';

-- Add description to data_points column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Number of data points for the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'data_points';

-- Add description to derivation_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the derivation of the nutrient value.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'derivation_id';

-- Add description to min column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum value of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'min';

-- Add description to max column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Maximum value of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'max';

-- Add description to median column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Median value of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'median';

-- Add description to loq column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Limit of quantitation for the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'loq';

-- Add description to footnote column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Footnote for the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'footnote';

-- Add description to min_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum year when the nutrient data was acquired.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'min_year_acquired';

-- Add description to percent_daily_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Percent daily value of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'percent_daily_value';


CREATE TABLE FoodDataCentral.food_nutrient_conversion_factor (
    id INT CONSTRAINT PK_food_nutrient_conversion_factor PRIMARY KEY,
    fdc_id INT
);

-- Add description to the food_nutrient_conversion_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores conversion factors for nutrients in food items.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_conversion_factor';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the conversion factor record.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the FDC ID of the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';


CREATE TABLE FoodDataCentral.food_nutrient_derivation (
    id INT CONSTRAINT PK_food_nutrient_derivation PRIMARY KEY,
    code VARCHAR(2),
    description VARCHAR(255)
);

-- Add description to the food_nutrient_derivation table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores derivations for food nutrient values.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the derivation record.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code representing the derivation.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation', 
    @level2type = N'COLUMN', @level2name = N'code';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the derivation.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation', 
    @level2type = N'COLUMN', @level2name = N'description';

CREATE TABLE FoodDataCentral.food_nutrient_source (
    id INT CONSTRAINT PK_food_nutrient_source PRIMARY KEY,
    code VARCHAR(2),
    description VARCHAR(255)
);

-- Add description to the food_nutrient_source table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores sources of food nutrient data.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the nutrient source.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code representing the nutrient source.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source', 
    @level2type = N'COLUMN', @level2name = N'code';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the nutrient source.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source', 
    @level2type = N'COLUMN', @level2name = N'description';


CREATE TABLE FoodDataCentral.food_portion (
    id INT CONSTRAINT PK_food_portion PRIMARY KEY,
    fdc_id INT,
    seq_num INT,
    amount DECIMAL(18, 2),
    measure_unit_id INT,
    portion_description VARCHAR(255),
    modifier VARCHAR(255),
    gram_weight DECIMAL(18, 2),
    data_points INT,
    footnote VARCHAR(255),
    min_year_acquired INT
);

-- Add description to the food_portion table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores information about food portions.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to link to the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to seq_num column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Sequence number for the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'seq_num';

-- Add description to amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Amount of the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'amount';

-- Add description to measure_unit_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the measure unit of the portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'measure_unit_id';

-- Add description to portion_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'portion_description';

-- Add description to modifier column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Modifier for the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'modifier';

-- Add description to gram_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Weight of the food portion in grams.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'gram_weight';

-- Add description to data_points column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Number of data points for the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'data_points';

-- Add description to footnote column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Footnote for the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'footnote';

-- Add description to min_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum year when the portion was acquired.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'min_year_acquired';

CREATE TABLE FoodDataCentral.food_protein_conversion_factor (
    food_nutrient_conversion_factor_id INT CONSTRAINT PK_food_protein_conversion_factor PRIMARY KEY,
    value DECIMAL(18, 2)
);

-- Add description to the food_protein_conversion_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores protein conversion factors for food items.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_protein_conversion_factor';

-- Add description to food_nutrient_conversion_factor_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to link to the food nutrient conversion factor.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_protein_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'food_nutrient_conversion_factor_id';

-- Add description to value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Protein conversion factor value.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_protein_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'value';

CREATE TABLE FoodDataCentral.food_update_log_entry (
    id INT CONSTRAINT PK_food_update_log_entry PRIMARY KEY,
    description VARCHAR(255),
    last_updated DATE
);

-- Add description to the food_update_log_entry table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Keeps track of updates made to food data entries.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_update_log_entry';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the update.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_update_log_entry', 
    @level2type = N'COLUMN', @level2name = N'description';

-- Add description to last_updated column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the update was last performed.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'food_update_log_entry', 
    @level2type = N'COLUMN', @level2name = N'last_updated';

CREATE TABLE FoodDataCentral.foundation_food (
    fdc_id INT CONSTRAINT PK_foundation_food PRIMARY KEY,
    NDB_number INT,
    footnote VARCHAR(255)
);

-- Add description to the foundation_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores foundation food data including FDC ID, NDB number, and footnotes.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'foundation_food';

-- Add description to NDB_number column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Nutrient Database Number identifying the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'foundation_food', 
    @level2type = N'COLUMN', @level2name = N'NDB_number';

-- Add description to footnote column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Additional notes or comments about the food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'foundation_food', 
    @level2type = N'COLUMN', @level2name = N'footnote';

CREATE TABLE FoodDataCentral.input_food (
    id INT CONSTRAINT PK_input_food PRIMARY KEY,
    fdc_id INT,
    fdc_id_of_input_food INT,
    seq_num INT,
    amount DECIMAL(18, 2),
    sr_code INT,
    sr_description VARCHAR(255),
    unit VARCHAR(10),
    portion_code INT,
    portion_description VARCHAR(255),
    gram_weight DECIMAL(18, 2),
    retention_code INT,
    survey_flag INT
);

-- Add description to the input_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores input food data including FDC ID, sequence number, amount, SR code, and survey flags.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the FDC ID of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to fdc_id_of_input_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the FDC ID of the input food item being measured.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_input_food';

-- Add description to seq_num column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Sequence number indicating the order of input for a food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'seq_num';

-- Add description to amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Amount of the input food item in the specified unit.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'amount';

-- Add description to sr_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'SR code indicating the food item from the Standard Reference database.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'sr_code';

-- Add description to sr_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food item from the Standard Reference database.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'sr_description';

-- Add description to unit column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unit of measurement for the amount of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'unit';

-- Add description to portion_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code indicating the portion size of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'portion_code';

-- Add description to portion_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the portion size of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'portion_description';

-- Add description to gram_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Weight of the input food item in grams.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'gram_weight';

-- Add description to retention_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code indicating the retention factor for nutrient calculation.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'retention_code';

-- Add description to survey_flag column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Flag indicating if the food item was part of a survey.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'survey_flag';

CREATE TABLE FoodDataCentral.lab_method (
    id INT CONSTRAINT PK_lab_method PRIMARY KEY,
    description VARCHAR(255),
    technique VARCHAR(50)
);

-- Add description to the lab_method table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores information about lab methods including ID, description, and technique.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method', 
    @level2type = N'COLUMN', @level2name = N'description';

-- Add description to technique column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Technique used in the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method', 
    @level2type = N'COLUMN', @level2name = N'technique';

CREATE TABLE FoodDataCentral.lab_method_code (
    lab_method_id INT,
    code VARCHAR(20)
);

-- Add description to the lab_method_code table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores codes related to lab methods including ID and code.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method_code';

-- Add description to lab_method_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the lab_method table.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method_code', 
    @level2type = N'COLUMN', @level2name = N'lab_method_id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code associated with the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method_code', 
    @level2type = N'COLUMN', @level2name = N'code';

CREATE TABLE FoodDataCentral.lab_method_nutrient (
    lab_method_id INT,
    nutrient_id INT
);

-- Add description to the lab_method_nutrient table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores the relationship between lab methods and nutrients.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method_nutrient';

-- Add description to lab_method_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the lab_method table.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method_nutrient', 
    @level2type = N'COLUMN', @level2name = N'lab_method_id';

-- Add description to nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the nutrient table.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'lab_method_nutrient', 
    @level2type = N'COLUMN', @level2name = N'nutrient_id';

CREATE TABLE FoodDataCentral.market_acquisition (
    fdc_id INT CONSTRAINT PK_market_acquisition PRIMARY KEY,
    brand_description VARCHAR(255),
    expiration_date DATE,
    label_weight DECIMAL(18, 9),
    location VARCHAR(255),
    acquisition_date DATE,
    sales_type VARCHAR(10),
    sample_lot_nbr VARCHAR(50),
    sell_by_date DATE,
    store_city VARCHAR(255),
    store_name VARCHAR(255),
    store_state VARCHAR(10),
    upc_code VARCHAR(50)
);

-- Add description to the market_acquisition table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores information about market acquisitions.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Primary key for the market_acquisition table.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to brand_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the brand.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'brand_description';

-- Add description to expiration_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the acquisition expires.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'expiration_date';

-- Add description to label_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Weight of the label.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'label_weight';

-- Add description to location column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Location of the market acquisition.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'location';

-- Add description to acquisition_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date of the market acquisition.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'acquisition_date';

-- Add description to sales_type column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Type of sales for the market acquisition.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'sales_type';

-- Add description to sample_lot_nbr column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Lot number of the sample.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'sample_lot_nbr';

-- Add description to sell_by_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date by which the item needs to be sold.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'sell_by_date';

-- Add description to store_city column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'City where the store is located.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'store_city';

-- Add description to store_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the store.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'store_name';

-- Add description to store_state column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'State where the store is located.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'store_state';

-- Add description to upc_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Universal Product Code.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'upc_code';

CREATE TABLE FoodDataCentral.measure_unit (
    id INT CONSTRAINT PK_measure_unit PRIMARY KEY,
    name VARCHAR(255)
);

-- Add description to measure_unit table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing information about measure units.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'measure_unit';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the measure unit.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'measure_unit', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the measure unit.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'measure_unit', 
    @level2type = N'COLUMN', @level2name = N'name';

CREATE TABLE FoodDataCentral.microbe (
    id INT CONSTRAINT PK_microbe PRIMARY KEY,
    foodId INT,
    method VARCHAR(255),
    microbe_code VARCHAR(255),
    min_value INT,
    max_value INT,
    uom VARCHAR(10)
);

-- Add description to microbe table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing information about microbes.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'microbe';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to foodId column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the food associated with the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'foodId';

-- Add description to method column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Method used for microbe analysis.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'method';

-- Add description to microbe_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code representing the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'microbe_code';

-- Add description to min_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum value for the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'min_value';

-- Add description to max_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Maximum value for the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'max_value';

-- Add description to uom column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unit of measurement for the microbe values.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'uom';

CREATE TABLE FoodDataCentral.nutrient (
    id INT CONSTRAINT PK_nutrient PRIMARY KEY,
    name VARCHAR(255),
    unit_name VARCHAR(255),
    nutrient_nbr INT,
    rank INT
);

-- Add description to nutrient table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing information about nutrients.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'nutrient';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to unit_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unit name for the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'unit_name';

-- Add description to nutrient_nbr column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Nutrient number.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'nutrient_nbr';

-- Add description to rank column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Rank of the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'rank';

CREATE TABLE FoodDataCentral.nutrient_incoming_name (
    id INT CONSTRAINT PK_nutrient_incoming_name PRIMARY KEY,
    name VARCHAR(255),
    nutrient_id INT
);

-- Add description to nutrient_incoming_name table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing incoming names for nutrients.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'nutrient_incoming_name';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the incoming nutrient name.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient_incoming_name', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the incoming nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient_incoming_name', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the nutrient table.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'nutrient_incoming_name', 
    @level2type = N'COLUMN', @level2name = N'nutrient_id';

CREATE TABLE FoodDataCentral.retention_factor (
    n_gid INT CONSTRAINT PK_retention_factor PRIMARY KEY,
    n_code INT,
    n_foodGroupId INT,
    n_description VARCHAR(255)
);

-- Add description to retention_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing retention factors for nutrients.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'retention_factor';

-- Add description to n_gid column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_gid';

-- Add description to n_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_code';

-- Add description to n_foodGroupId column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the food group associated with the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_foodGroupId';

-- Add description to n_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_description';

CREATE TABLE FoodDataCentral.sample_food (
    fdc_id INT CONSTRAINT PK_sample_food PRIMARY KEY
);

-- Add description to sample_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing sample foods.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'sample_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the sample food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sample_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';


CREATE TABLE FoodDataCentral.sr_legacy_food (
    fdc_id INT CONSTRAINT PK_sr_legacy_food PRIMARY KEY,
    NDB_number INT
);

-- Add description to sr_legacy_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing legacy foods.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'sr_legacy_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the legacy food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sr_legacy_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to NDB_number column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'NDB number for the legacy food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sr_legacy_food', 
    @level2type = N'COLUMN', @level2name = N'NDB_number';

CREATE TABLE FoodDataCentral.sub_sample_food (
    fdc_id INT CONSTRAINT PK_sub_sample_food PRIMARY KEY,
    fdc_id_of_sample_food INT
);

-- Add description to sub_sample_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing sub-samples of foods.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'sub_sample_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the sub-sample food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to fdc_id_of_sample_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the parent sample food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_sample_food';

CREATE TABLE FoodDataCentral.sub_sample_result (
    food_nutrient_id INT CONSTRAINT PK_sub_sample_result PRIMARY KEY,
    adjusted_amount DECIMAL(18, 2),
    lab_method_id INT,
    nutrient_name VARCHAR(255)
);

-- Add description to sub_sample_result table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing results of sub-samples for nutrients.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'sub_sample_result';

-- Add description to food_nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the food nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'food_nutrient_id';

-- Add description to adjusted_amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Adjusted amount for the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'adjusted_amount';

-- Add description to lab_method_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the laboratory method.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'lab_method_id';

-- Add description to nutrient_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'nutrient_name';

CREATE TABLE FoodDataCentral.survey_fndds_food (
    fdc_id INT CONSTRAINT PK_survey_fndds_food PRIMARY KEY,
    food_code INT,
    wweia_category_code INT,
    start_date DATE,
    end_date DATE
);

-- Add description to survey_fndds_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing survey data for Fndds food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'survey_fndds_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the Fndds food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to food_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the Fndds food.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'food_code';

-- Add description to wweia_category_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the WWEIA food category.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'wweia_category_code';

-- Add description to start_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Start date for the survey data.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'start_date';

-- Add description to end_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'End date for the survey data.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'end_date';

CREATE TABLE FoodDataCentral.wweia_food_category (
    wweia_food_category INT CONSTRAINT PK_wweia_food_category PRIMARY KEY,
    wweia_food_category_description VARCHAR(255)
);

-- Add description to wweia_food_category table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing WWEIA food categories.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE', @level1name = N'wweia_food_category';

-- Add description to wweia_food_category column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the WWEIA food category.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'wweia_food_category', 
    @level2type = N'COLUMN', @level2name = N'wweia_food_category';

-- Add description to wweia_food_category_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the WWEIA food category.', 
    @level0type = N'SCHEMA', @level0name = N'FoodDataCentral', 
    @level1type = N'TABLE',  @level1name = N'wweia_food_category', 
    @level2type = N'COLUMN', @level2name = N'wweia_food_category_description';

ALTER TABLE FoodDataCentral.acquisition_samples
ADD CONSTRAINT FK_acquisition_samples_fdc_id_of_acquisition_food
FOREIGN KEY (fdc_id_of_acquisition_food) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.agricultural_samples
ADD CONSTRAINT FK_agricultural_samples_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.food_attribute
ADD CONSTRAINT FK_food_attribute_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.food_attribute
ADD CONSTRAINT FK_food_attribute_food_attribute_type_id
FOREIGN KEY (food_attribute_type_id) REFERENCES FoodDataCentral.food_attribute_type (id);

ALTER TABLE FoodDataCentral.food_calorie_conversion_factor
ADD CONSTRAINT FK_food_calorie_conversion_factor_food_nutrient_conversion_factor_id
FOREIGN KEY (food_nutrient_conversion_factor_id) REFERENCES FoodDataCentral.food_nutrient_conversion_factor (id);

ALTER TABLE FoodDataCentral.food_component
ADD CONSTRAINT FK_food_component_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.food_nutrient
ADD CONSTRAINT FK_food_nutrient_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.food_nutrient
ADD CONSTRAINT FK_food_nutrient_nutrient_id
FOREIGN KEY (nutrient_id) REFERENCES FoodDataCentral.nutrient (id);

ALTER TABLE FoodDataCentral.food_nutrient
ADD CONSTRAINT FK_food_nutrient_derivation_id
FOREIGN KEY (derivation_id) REFERENCES FoodDataCentral.food_nutrient_derivation (id);

ALTER TABLE FoodDataCentral.food_portion
ADD CONSTRAINT FK_food_portion_measure_unit_id
FOREIGN KEY (measure_unit_id) REFERENCES FoodDataCentral.measure_unit (id);

ALTER TABLE FoodDataCentral.input_food
ADD CONSTRAINT FK_input_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.input_food
ADD CONSTRAINT FK_input_food_fdc_id_of_input_food
FOREIGN KEY (fdc_id_of_input_food) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.lab_method_code
ADD CONSTRAINT FK_lab_method_code_lab_method_id
FOREIGN KEY (lab_method_id) REFERENCES FoodDataCentral.lab_method (id);

ALTER TABLE FoodDataCentral.lab_method_nutrient
ADD CONSTRAINT FK_lab_method_nutrient_lab_method_id
FOREIGN KEY (lab_method_id) REFERENCES FoodDataCentral.lab_method (id);

ALTER TABLE FoodDataCentral.market_acquisition
ADD CONSTRAINT FK_market_acquisition_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.microbe
ADD CONSTRAINT FK_microbe_foodId
FOREIGN KEY (foodId) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.sub_sample_food
ADD CONSTRAINT FK_sub_sample_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.sub_sample_food
ADD CONSTRAINT FK_sub_sample_food_fdc_id_of_sample_food
FOREIGN KEY (fdc_id_of_sample_food) REFERENCES FoodDataCentral.sample_food (fdc_id);

ALTER TABLE FoodDataCentral.sub_sample_result
ADD CONSTRAINT FK_sub_sample_result_food_nutrient_id
FOREIGN KEY (food_nutrient_id) REFERENCES FoodDataCentral.food_nutrient (id);

ALTER TABLE FoodDataCentral.sub_sample_result
ADD CONSTRAINT FK_sub_sample_result_lab_method_id
FOREIGN KEY (lab_method_id) REFERENCES FoodDataCentral.lab_method (id);

ALTER TABLE FoodDataCentral.survey_fndds_food
ADD CONSTRAINT FK_survey_fndds_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.survey_fndds_food
ADD CONSTRAINT FK_survey_fndds_food_wweia_category_code
FOREIGN KEY (wweia_category_code) REFERENCES FoodDataCentral.wweia_food_category (wweia_food_category);

ALTER TABLE FoodDataCentral.sample_food
ADD CONSTRAINT FK_sample_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);

ALTER TABLE FoodDataCentral.sr_legacy_food
ADD CONSTRAINT FK_sr_legacy_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES FoodDataCentral.food (fdc_id);
