USE master;
GO

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'FoodDataCentral'
)
BEGIN
    ALTER DATABASE FoodDataCentral SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FoodDataCentral;
END

-- Create FoodDataCentral database
CREATE DATABASE FoodDataCentral;


-- Alter database to set file growth
ALTER DATABASE FoodDataCentral
MODIFY FILE 
(
    NAME = FoodDataCentral,
    FILEGROWTH = 1GB
);

ALTER DATABASE FoodDataCentral
MODIFY FILE 
(
    NAME = FoodDataCentral_log,
    FILEGROWTH = 500MB
);

-- Add description to FoodDataCentral database
EXEC [FoodDataCentral].sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Database for storing FoodData Central information from the U.S. Department of Agriculture Agricultural Research Service. Reference: https://fdc.nal.usda.gov/download-datasets.html' 
GO

USE FoodDataCentral
GO

-- Recreate the schema
CREATE SCHEMA USDA AUTHORIZATION dbo;
GO

CREATE TABLE USDA.acquisition_samples (
    fdc_id_of_sample_food INT,-- CONSTRAINT PK_acquisition_samples PRIMARY KEY,
    fdc_id_of_acquisition_food INT
);
-- Add description to the acquisition_samples table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Acquisitions may be blended with other acquisitions to create a sample food, and an acquisition can be used to created more than one sample food. This file stores which acquisitions and sample foods are related to each other.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'acquisition_samples';

-- Add description to fdc_id_of_sample_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the sample food that uses the acquisitioned food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'acquisition_samples', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_sample_food';

-- Add description to fdc_id_of_acquisition_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the acquisitioned food used in the sample food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'acquisition_samples', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_acquisition_food';


CREATE TABLE USDA.agricultural_samples (
    fdc_id INT CONSTRAINT PK_agricultural_samples PRIMARY KEY,
    acquisition_date DATE,
    market_class VARCHAR(50),
    treatment VARCHAR(50),
    state VARCHAR(2)
);

-- Add description to the agricultural_samples table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Non-processed foods obtained directly from the location where they are produced.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to acquisition_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The date this food was obtained.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'acquisition_date';

-- Add description to market_class column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The name of the specific kind of this food (eg. "Pinto" for pinto beans).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'market_class';

-- Add description to treatment column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Any special condition relevant to the production of this food - typically "drought" or "control".', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'treatment';

-- Add description to state column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The state in which this food was produced.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'agricultural_samples', 
    @level2type = N'COLUMN', @level2name = N'state';


CREATE TABLE USDA.branded_food (
    fdc_id INT CONSTRAINT PK_branded_food PRIMARY KEY,
    brand_owner VARCHAR(255),
    brand_name VARCHAR(255),
    subbrand_name VARCHAR(255),
    gtin_upc VARCHAR(20),
    ingredients VARCHAR(MAX),
    not_a_significant_source_of VARCHAR(2000),
    serving_size VARCHAR(25),
    serving_size_unit VARCHAR(50),
    household_serving_fulltext VARCHAR(255),
    branded_food_category VARCHAR(1000),
    data_source VARCHAR(255),
    package_weight VARCHAR(255),
    modified_date DATE,
    available_date DATE,
    market_country VARCHAR(255),
    discontinued_date DATE,
    preparation_state_code VARCHAR(255),
    trade_channel VARCHAR(255),
    short_description VARCHAR(255)
);
-- Add description to the branded_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foods whose nutrient values are typically obtained from food label data provided by food brand owners.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to brand_owner column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Brand owner for the food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'brand_owner';

-- Add description to brand_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Brand name for the food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'brand_name';

-- Add description to subbrand_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Sub-brand and variation descriptions.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'subbrand_name';

-- Add description to gtin_upc column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Global Trade Item Number (GTIN) or Universal Product Code (UPC) identifying the food. Duplicate codes signify an update to the product, use the publication_date found in the food table to distinguish when each update was published, e.g. the latest publication date will be the most recent update of the product.
.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'gtin_upc';

-- Add description to ingredients column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The list of ingredients (as it appears on the product label).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'ingredients';

-- Add description to not_a_significant_source_of column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Full text for the "not a significant source of…" label claim.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'not_a_significant_source_of';

-- Add description to serving_size column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The amount of the serving size when expressed as gram or ml.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'serving_size';

-- Add description to serving_size_unit column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The unit used to express the serving size (gram or ml).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'serving_size_unit';

-- Add description to household_serving_fulltext column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The amount and unit of serving size when expressed in household units.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'household_serving_fulltext';

-- Add description to branded_food_category column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The category of the branded food, assigned by GDSN or Label Insight.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'branded_food_category';

-- Add description to data_source column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The source of the data for this food. GDSN (for GS1) or LI (for Label Insight)..', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'data_source';

-- Add description to package_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Weight of the package.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'package_weight';

-- Add description to modified_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'This date reflects when the product data was last modified by the data provider, i.e., the manufacturer.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'modified_date';

-- Add description to available_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'This is the date when the product record was available for inclusion in the database.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'available_date';

-- Add description to market_country column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The primary country where the product is marketed.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'market_country';

-- Add description to discontinued_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'This is the date when the product was discontinued.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'discontinued_date';

-- Add description to preparation_state_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code to describe the preparation of the food.  Defined in GS1 link https://www.gs1.org/voc/PreparationTypeCode', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'preparation_state_code';

-- Add description to trade_channel column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Includes a list of locations or programs in which the food is available.  Primarily used for Child Nutrition Food Programs.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'trade_channel';

-- Add description to short_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Manufacturers short description of the product.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'branded_food', 
    @level2type = N'COLUMN', @level2name = N'short_description';


CREATE TABLE USDA.fndds_derivation (
    SR_28_derivation_code VARCHAR(10) CONSTRAINT PK_fndds_derivation PRIMARY KEY,
    SR_28_derivation_description VARCHAR(255)
);

-- Add description to the fndds_derivation table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Describes derivations for SR-28 data.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_derivation';

-- Add description to SR_28_derivation_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Derivation code as defined by FDC', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_derivation', 
    @level2type = N'COLUMN', @level2name = N'SR_28_derivation_code';

-- Add description to SR_28_derivation_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The description of the derivation code.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_derivation', 
    @level2type = N'COLUMN', @level2name = N'SR_28_derivation_description';


CREATE TABLE USDA.fndds_ingredient_nutrient_value (
    ingredient_code VARCHAR(10),-- CONSTRAINT PK_fndds_ingredient_nutrient_value PRIMARY KEY,
    ingredient_description VARCHAR(255),
    nutrient_code INT,
    nutrient_value DECIMAL(18, 2),
    nutrient_value_source VARCHAR(50),
    fdc_id INT,
    derivation_code VARCHAR(10),
    SR_AddMod_year INT,
    Foundation_year_acquired INT,
    Start_date VARCHAR(25),
    End_date DATE
);

-- Add description to the fndds_ingredient_nutrient_value table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores nutrient values for ingredients in FNDDS.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value';


-- Add description to ingredient_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifies only NDB number.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'ingredient_code';

-- Add description to ingredient_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of NDB number.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'ingredient_description';

-- Add description to nutrient_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'3-digit identification number.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'nutrient_code';

-- Add description to nutrient_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Amount per 100g edible portion for energy and 64 nutrients.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'nutrient_value';

-- Add description to nutrient_value_source column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'FDC or other source for nutrient value.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'nutrient_value_source';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier of food in FDC.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to derivation_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Derivation code as defined by FDC.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'derivation_code';

-- Add description to SR_AddMod_year column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Year value added or last modified as defined by SR.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'SR_AddMod_year';

-- Add description to Foundation_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Initial year acquired as defined by FDC.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'Foundation_year_acquired';

-- Add description to Start_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Start date of FNDDS version released.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'Start_date';

-- Add description to End_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'End date of FNDDS version released.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'fndds_ingredient_nutrient_value', 
    @level2type = N'COLUMN', @level2name = N'End_date';



CREATE TABLE USDA.food (
    fdc_id INT CONSTRAINT PK_food PRIMARY KEY,
    data_type VARCHAR(50),
    description VARCHAR(MAX),
    food_category_id INT,
    publication_date DATE
);

-- Add description to the food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Any substance consumed by humans for nutrition, taste and/or aroma.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique permanent identifier of the food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to data_type column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Type of food data (see Files tab for possible values).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'data_type';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'description';

-- Add description to food_category_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Id of the food category the food belongs to.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'food_category_id';

-- Add description to publication_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the food was published to FoodData Central.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food', 
    @level2type = N'COLUMN', @level2name = N'publication_date';


CREATE TABLE USDA.food_attribute (
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
    @value = N'The value for a generic property of a food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food attribute.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food this food attribute pertains to.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to seq_num column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The order the attribute will be displayed on the released food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'seq_num';

-- Add description to food_attribute_type_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the type of food attribute to which this value is associated for a specific food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'food_attribute_type_id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the food attribute.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The actual value of the attribute.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute', 
    @level2type = N'COLUMN', @level2name = N'value';



CREATE TABLE USDA.food_attribute_type (
    id INT CONSTRAINT PK_food_attribute_type PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(MAX)
);

-- Add description to the food_attribute_type table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The list of supported attributes associated with a food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food attribute type.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the food attribute type.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food attribute type.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_attribute_type', 
    @level2type = N'COLUMN', @level2name = N'description';


CREATE TABLE USDA.food_calorie_conversion_factor (
    food_nutrient_conversion_factor_id INT CONSTRAINT PK_food_calorie_conversion_factor PRIMARY KEY,
    protein_value DECIMAL(18, 2),
    fat_value DECIMAL(18, 2),
    carbohydrate_value DECIMAL(18, 2)
);

-- Add description to the food_calorie_conversion_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The multiplication factors to be used when calculating energy from macronutrients for a specific food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor';

-- Add description to food_nutrient_conversion_factor_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the related row in the nutrient_conversion_factor table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'food_nutrient_conversion_factor_id';

-- Add description to protein_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The multiplication factor for protein.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'protein_value';

-- Add description to fat_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The multiplication factor for fat.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'fat_value';

-- Add description to carbohydrate_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The multiplication factor for carbohydrates.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_calorie_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'carbohydrate_value';



CREATE TABLE USDA.food_category (
    id INT CONSTRAINT PK_food_category PRIMARY KEY,
    code VARCHAR(10),
    description VARCHAR(255)
);

-- Add description to the food_category table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foods of defined similarity.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_category';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food category.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_category', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Food group code.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_category', 
    @level2type = N'COLUMN', @level2name = N'code';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food group.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_category', 
    @level2type = N'COLUMN', @level2name = N'description';


CREATE TABLE USDA.food_component (
    id INT CONSTRAINT PK_food_component PRIMARY KEY,
    fdc_id INT,
    name VARCHAR(255),
    pct_weight DECIMAL(18, 2),
    is_refuse VARCHAR(1),
    gram_weight DECIMAL(18, 2),
    data_points INT,
    min_year_acquired INT
);
-- Add description to the food_component table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A constituent part of a food (e.g. bone is a component of meat).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food component.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food this food component pertains to.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The kind of component, e.g., bone.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to pct_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The weight of the component as a percentage of the total weight of the food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'pct_weight';

-- Add description to is_refuse column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Whether the component is refuse, i.e., not edible.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'is_refuse';

-- Add description to gram_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The weight of the component in grams.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'gram_weight';

-- Add description to data_points column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The number of observations on which the measure is based.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'data_points';

-- Add description to min_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The minimum purchase year of all acquisitions used to derive the component value.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_component', 
    @level2type = N'COLUMN', @level2name = N'min_year_acquired';

CREATE TABLE USDA.food_nutrient (
    id INT CONSTRAINT PK_food_nutrient PRIMARY KEY,
    fdc_id INT,
    nutrient_id INT,
    amount VARCHAR(25),
    data_points INT,
    derivation_id INT,
    min DECIMAL(18, 2),
    max VARCHAR(25),
    median VARCHAR(25),
    loq DECIMAL(18, 2),
    footnote VARCHAR(255),
    min_year_acquired INT,
    percent_daily_value DECIMAL(18, 2)
);

-- Add description to the food_nutrient table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A nutrient value for a food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food nutrient record.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food this food nutrient pertains to.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the nutrient to which the food nutrient pertains.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'nutrient_id';

-- Add description to amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Amount of the nutrient per 100g of food. Specified in unit defined in the nutrient table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'amount';

-- Add description to data_points column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Number of observations on which the value is based.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'data_points';

-- Add description to derivation_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food nutrient derivation technique used to derive the value.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'derivation_id';

-- Add description to min column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum amount of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'min';

-- Add description to max column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Maximum amount of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'max';

-- Add description to median column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Median amount of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'median';

-- Add description to loq column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Limit of quantification for the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'loq';

-- Add description to footnote column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Comments on any unusual aspects of the food nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'footnote';

-- Add description to min_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum year when the nutrient data was acquired.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'min_year_acquired';

-- Add description to percent_daily_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Percent daily value of the nutrient in the food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient', 
    @level2type = N'COLUMN', @level2name = N'percent_daily_value';


CREATE TABLE USDA.food_nutrient_conversion_factor (
    id INT CONSTRAINT PK_food_nutrient_conversion_factor PRIMARY KEY,
    fdc_id INT
);

-- Add description to the food_nutrient_conversion_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Top level type for all types of nutrient conversion factors. A separate row is stored for each of these 3 types of conversion factor.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_conversion_factor';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the conversion factor record.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food that this food nutrient conversion factor pertains to.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';


CREATE TABLE USDA.food_nutrient_derivation (
    id INT CONSTRAINT PK_food_nutrient_derivation PRIMARY KEY,
    code VARCHAR(10),
    description VARCHAR(MAX)
);

-- Add description to the food_nutrient_derivation table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Procedure indicating how a food nutrient value was obtained.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the derivation record.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code used for the derivation (e.g. A means analytical).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation', 
    @level2type = N'COLUMN', @level2name = N'code';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the derivation.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_derivation', 
    @level2type = N'COLUMN', @level2name = N'description';

CREATE TABLE USDA.food_nutrient_source (
    id INT CONSTRAINT PK_food_nutrient_source PRIMARY KEY,
    code VARCHAR(2),
    description VARCHAR(255)
);

-- Add description to the food_nutrient_source table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'An information source from which we can obtain food nutrient values.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the nutrient source.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code used for the source (e.g. 4 means calculated or imputed).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source', 
    @level2type = N'COLUMN', @level2name = N'code';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the source.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_nutrient_source', 
    @level2type = N'COLUMN', @level2name = N'description';


CREATE TABLE USDA.food_portion (
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
    @value = N'Discrete amount of food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the food portion.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food this food portion pertains to.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to seq_num column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The order the measure will be displayed on the released food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'seq_num';

-- Add description to amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The number of measure units that comprise the measure.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'amount';

-- Add description to measure_unit_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The unit used for the measure.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'measure_unit_id';

-- Add description to portion_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Comments that provide more specificity on the measure.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'portion_description';

-- Add description to modifier column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Qualifier of the measure.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'modifier';

-- Add description to gram_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The weight of the measure in grams.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'gram_weight';

-- Add description to data_points column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Number of observations on which the measure is based.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'data_points';

-- Add description to footnote column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Comments on any unusual aspects of the measure.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'footnote';

-- Add description to min_year_acquired column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum purchase year of all acquisitions used to derive the measure value.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_portion', 
    @level2type = N'COLUMN', @level2name = N'min_year_acquired';


CREATE TABLE USDA.food_protein_conversion_factor (
    food_nutrient_conversion_factor_id INT CONSTRAINT PK_food_protein_conversion_factor PRIMARY KEY,
    value DECIMAL(18, 2)
);

-- Add description to the food_protein_conversion_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Stores protein conversion factors for food items.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_protein_conversion_factor';

-- Add description to food_nutrient_conversion_factor_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Id of the related row in the nutrient_conversion_factor table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_protein_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'food_nutrient_conversion_factor_id';

-- Add description to value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The multiplication factor used to calculate protein from nitrogen.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_protein_conversion_factor', 
    @level2type = N'COLUMN', @level2name = N'value';

CREATE TABLE USDA.food_update_log_entry (
    id INT CONSTRAINT PK_food_update_log_entry PRIMARY KEY,
    description VARCHAR(MAX),
    last_updated DATE
);

-- Add description to the food_update_log_entry table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Historical record of an update of food data.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_update_log_entry';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table an update pertains to..', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_update_log_entry', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the update.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_update_log_entry', 
    @level2type = N'COLUMN', @level2name = N'description';

-- Add description to last_updated column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the update was last performed.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'food_update_log_entry', 
    @level2type = N'COLUMN', @level2name = N'last_updated';

CREATE TABLE USDA.foundation_food (
    fdc_id INT CONSTRAINT PK_foundation_food PRIMARY KEY,
    NDB_number INT,
    footnote VARCHAR(255)
);

-- Add description to the foundation_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foods whose nutrient and food component values are derived primarily by chemical analysis. Foundation data also include extensive underlying metadata, such as the number of samples, the location and dates on which samples were obtained, analytical approaches used, and if appropriate, cultivar, genotype, and production practices.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'foundation_food';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'foundation_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to NDB_number column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique number assigned for the food, different from fdc_id, assigned in SR.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'foundation_food', 
    @level2type = N'COLUMN', @level2name = N'NDB_number';

-- Add description to footnote column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Comments on any unusual aspects. These are released to the public. Examples might include unusual aspects of the food overall.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'foundation_food', 
    @level2type = N'COLUMN', @level2name = N'footnote';

CREATE TABLE USDA.input_food (
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
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the FDC ID of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to fdc_id_of_input_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the FDC ID of the input food item being measured.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_input_food';

-- Add description to seq_num column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Sequence number indicating the order of input for a food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'seq_num';

-- Add description to amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Amount of the input food item in the specified unit.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'amount';

-- Add description to sr_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'SR code indicating the food item from the Standard Reference database.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'sr_code';

-- Add description to sr_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the food item from the Standard Reference database.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'sr_description';

-- Add description to unit column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unit of measurement for the amount of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'unit';

-- Add description to portion_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code indicating the portion size of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'portion_code';

-- Add description to portion_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the portion size of the input food item.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'portion_description';

-- Add description to gram_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Weight of the input food item in grams.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'gram_weight';

-- Add description to retention_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code indicating the retention factor for nutrient calculation.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'retention_code';

-- Add description to survey_flag column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Flag indicating if the food item was part of a survey.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'input_food', 
    @level2type = N'COLUMN', @level2name = N'survey_flag';


CREATE TABLE USDA.lab_method (
    id INT CONSTRAINT PK_lab_method PRIMARY KEY,
    description VARCHAR(255),
    technique VARCHAR(100)
);

-- Add description to the lab_method table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A chemical procedure used to measure the amount of one or more nutrients in a food.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method', 
    @level2type = N'COLUMN', @level2name = N'description';

-- Add description to technique column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'General chemical analysis approach used by the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method', 
    @level2type = N'COLUMN', @level2name = N'technique';

CREATE TABLE USDA.lab_method_code (
    lab_method_id INT,
    code VARCHAR(100)
);

-- Add description to the lab_method_code table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A short, sometimes lab-specific, sequence of characters used to identify a lab method.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method_code';

-- Add description to lab_method_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the lab method the code refers to.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method_code', 
    @level2type = N'COLUMN', @level2name = N'lab_method_id';

-- Add description to code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Value of the method code.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method_code', 
    @level2type = N'COLUMN', @level2name = N'code';

CREATE TABLE USDA.lab_method_nutrient (
    lab_method_id INT,
    nutrient_id INT
);

-- Add description to the lab_method_nutrient table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A nutrient whose amount can be measured by a lab method.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method_nutrient';

-- Add description to lab_method_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the lab method the nutrient is measured by.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method_nutrient', 
    @level2type = N'COLUMN', @level2name = N'lab_method_id';

-- Add description to nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the nutrient that can be measured by the lab method.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'lab_method_nutrient', 
    @level2type = N'COLUMN', @level2name = N'nutrient_id';

CREATE TABLE USDA.market_acquisition (
    fdc_id INT CONSTRAINT PK_market_acquisition PRIMARY KEY,
    brand_description VARCHAR(255),
    expiration_date DATE,
    label_weight VARCHAR(50),
    location VARCHAR(255),
    acquisition_date DATE,
    sales_type VARCHAR(100),
    sample_lot_nbr VARCHAR(50),
    sell_by_date DATE,
    store_city VARCHAR(255),
    store_name VARCHAR(255),
    store_state VARCHAR(255),
    upc_code VARCHAR(50)
);

-- Add description to the market_acquisition table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A food obtained for chemical analysis.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Primary key for the market_acquisition table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to brand_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the brand.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'brand_description';

-- Add description to expiration_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date when the acquisition expires.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'expiration_date';

-- Add description to label_weight column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Weight of the label.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'label_weight';

-- Add description to location column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Location of the market acquisition.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'location';

-- Add description to acquisition_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date of the market acquisition.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'acquisition_date';

-- Add description to sales_type column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Type of sales for the market acquisition.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'sales_type';

-- Add description to sample_lot_nbr column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Lot number of the sample.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'sample_lot_nbr';

-- Add description to sell_by_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date by which the item needs to be sold.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'sell_by_date';

-- Add description to store_city column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'City where the store is located.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'store_city';

-- Add description to store_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the store.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'store_name';

-- Add description to store_state column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'State where the store is located.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'store_state';

-- Add description to upc_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Universal Product Code.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'market_acquisition', 
    @level2type = N'COLUMN', @level2name = N'upc_code';

CREATE TABLE USDA.measure_unit (
    id INT CONSTRAINT PK_measure_unit PRIMARY KEY,
    name VARCHAR(255)
);

-- Add description to measure_unit table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Units for measuring quantities of foods.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'measure_unit';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the measure unit.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'measure_unit', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the unit.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'measure_unit', 
    @level2type = N'COLUMN', @level2name = N'name';

CREATE TABLE USDA.microbe (
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
    @value = N'Representation of the live microbe colony forming units of product at expiration date.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'microbe';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to foodId column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the food associated with the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'foodId';

-- Add description to method column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Method used for microbe analysis.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'method';

-- Add description to microbe_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code representing the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'microbe_code';

-- Add description to min_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Minimum value for the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'min_value';

-- Add description to max_value column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Maximum value for the microbe.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'max_value';

-- Add description to uom column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unit of measurement for the microbe values.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'microbe', 
    @level2type = N'COLUMN', @level2name = N'uom';


CREATE TABLE USDA.nutrient (
    id INT CONSTRAINT PK_nutrient PRIMARY KEY,
    name VARCHAR(255),
    unit_name VARCHAR(255),
    nutrient_nbr DECIMAL(18,2),
    rank DECIMAL(18,2)
);

-- Add description to nutrient table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The chemical constituent of a food (e.g. calcium, vitamin E) officially recognized as essential to human health.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'nutrient';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to unit_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The standard unit of measure for the nutrient (per 100g of food).', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'unit_name';

-- Add description to nutrient_nbr column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique code identifying a nutrient or food constituent.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'nutrient_nbr';

-- Add description to rank column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'An alternate way of ordering nutrients instead of listing alphabetically.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient', 
    @level2type = N'COLUMN', @level2name = N'rank';

CREATE TABLE USDA.nutrient_incoming_name (
    id INT CONSTRAINT PK_nutrient_incoming_name PRIMARY KEY,
    name VARCHAR(255),
    nutrient_id INT
);

-- Add description to nutrient_incoming_name table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing incoming names for nutrients.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'nutrient_incoming_name';

-- Add description to id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the incoming nutrient name.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient_incoming_name', 
    @level2type = N'COLUMN', @level2name = N'id';

-- Add description to name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the incoming nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient_incoming_name', 
    @level2type = N'COLUMN', @level2name = N'name';

-- Add description to nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key referencing the nutrient table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'nutrient_incoming_name', 
    @level2type = N'COLUMN', @level2name = N'nutrient_id';

CREATE TABLE USDA.retention_factor (
    n_gid INT CONSTRAINT PK_retention_factor PRIMARY KEY,
    n_code INT,
    n_foodGroupId INT,
    n_description VARCHAR(255)
);

-- Add description to retention_factor table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Table containing retention factors, definitions are available from: www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/retn/retn06.pdf.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'retention_factor';

-- Add description to n_gid column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_gid';

-- Add description to n_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code for the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_code';

-- Add description to n_foodGroupId column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the food group associated with the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_foodGroupId';

-- Add description to n_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description of the retention factor.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'retention_factor', 
    @level2type = N'COLUMN', @level2name = N'n_description';

CREATE TABLE USDA.sample_food (
    fdc_id INT CONSTRAINT PK_sample_food PRIMARY KEY
);

-- Add description to sample_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A food that is acquired as a representative sample of the food supply. It may be created from a single acquired food, or from a composite of multiple acquired foods.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'sample_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sample_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';


CREATE TABLE USDA.sr_legacy_food (
    fdc_id INT CONSTRAINT PK_sr_legacy_food PRIMARY KEY,
    NDB_number INT
);

-- Add description to sr_legacy_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foods from the April 2018 release of the USDA National Nutrient Database for Standard Reference. Nutrient and food component values are derived from chemical analysis and calculation.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'sr_legacy_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sr_legacy_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to NDB_number column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique number assigned for final food, starts from the minimum number of 100,000.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sr_legacy_food', 
    @level2type = N'COLUMN', @level2name = N'NDB_number';

CREATE TABLE USDA.sub_sample_food (
    fdc_id INT CONSTRAINT PK_sub_sample_food PRIMARY KEY,
    fdc_id_of_sample_food INT
);

-- Add description to sub_sample_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A portion of a sample food used for the purpose of specific chemical analysis.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'sub_sample_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to fdc_id_of_sample_food column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the sample food from which the sub sample originated.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id_of_sample_food';

CREATE TABLE USDA.sub_sample_result (
    food_nutrient_id INT CONSTRAINT PK_sub_sample_result PRIMARY KEY,
    adjusted_amount VARCHAR(25),
    lab_method_id INT,
    nutrient_name VARCHAR(255)
);

-- Add description to sub_sample_result table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The result of chemical analysis of a lab on a particular sub sample for a particular nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'sub_sample_result';

-- Add description to food_nutrient_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique ID for row, same as the food_nutrient ID.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'food_nutrient_id';

-- Add description to adjusted_amount column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Amount after adjusting for unit.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'adjusted_amount';

-- Add description to lab_method_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the lab method used to measure the nutrient.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'lab_method_id';

-- Add description to nutrient_name column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The name of the nutrient as supplied by the lab.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'sub_sample_result', 
    @level2type = N'COLUMN', @level2name = N'nutrient_name';

CREATE TABLE USDA.survey_fndds_food (
    fdc_id INT CONSTRAINT PK_survey_fndds_food PRIMARY KEY,
    food_code INT,
    wweia_category_code INT,
    start_date DATE,
    end_date DATE
);

-- Add description to survey_fndds_food table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foods whose consumption is measured by the What We Eat In America dietary survey component of the National Health and Nutrition Examination Survey (NHANES). Survey nutrient values are usually calculated from Branded and SR Legacy data.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'survey_fndds_food';

-- Add description to fdc_id column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'ID of the food in the food table.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'fdc_id';

-- Add description to food_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique ID identifying the food within FNDDS.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'food_code';

-- Add description to wweia_category_code column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique Identification code for WWEIA food category to which this food is assigned.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'wweia_category_code';

-- Add description to start_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Start date indicates time period corresponding to WWEIA data.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'start_date';

-- Add description to end_date column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'End date indicates time period corresponding to WWEIA data.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'survey_fndds_food', 
    @level2type = N'COLUMN', @level2name = N'end_date';

CREATE TABLE USDA.wweia_food_category (
    wweia_food_category INT CONSTRAINT PK_wweia_food_category PRIMARY KEY,
    wweia_food_category_description VARCHAR(255)
);

-- Add description to wweia_food_category table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Food categories for fndds.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE', @level1name = N'wweia_food_category';

-- Add description to wweia_food_category column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identifier for the WWEIA food category.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'wweia_food_category', 
    @level2type = N'COLUMN', @level2name = N'wweia_food_category';

-- Add description to wweia_food_category_description column
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Description for a WWEIA Category.', 
    @level0type = N'SCHEMA', @level0name = N'USDA', 
    @level1type = N'TABLE',  @level1name = N'wweia_food_category', 
    @level2type = N'COLUMN', @level2name = N'wweia_food_category_description';

ALTER TABLE USDA.acquisition_samples
ADD CONSTRAINT FK_acquisition_samples_fdc_id_of_acquisition_food
FOREIGN KEY (fdc_id_of_acquisition_food) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.agricultural_samples
ADD CONSTRAINT FK_agricultural_samples_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.food_attribute
ADD CONSTRAINT FK_food_attribute_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.food_attribute
ADD CONSTRAINT FK_food_attribute_food_attribute_type_id
FOREIGN KEY (food_attribute_type_id) REFERENCES USDA.food_attribute_type (id);

ALTER TABLE USDA.food_calorie_conversion_factor
ADD CONSTRAINT FK_food_calorie_conversion_factor_food_nutrient_conversion_factor_id
FOREIGN KEY (food_nutrient_conversion_factor_id) REFERENCES USDA.food_nutrient_conversion_factor (id);

ALTER TABLE USDA.food_component
ADD CONSTRAINT FK_food_component_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.food_nutrient
ADD CONSTRAINT FK_food_nutrient_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.food_nutrient
ADD CONSTRAINT FK_food_nutrient_nutrient_id
FOREIGN KEY (nutrient_id) REFERENCES USDA.nutrient (id);

ALTER TABLE USDA.food_nutrient
ADD CONSTRAINT FK_food_nutrient_derivation_id
FOREIGN KEY (derivation_id) REFERENCES USDA.food_nutrient_derivation (id);

ALTER TABLE USDA.food_portion
ADD CONSTRAINT FK_food_portion_measure_unit_id
FOREIGN KEY (measure_unit_id) REFERENCES USDA.measure_unit (id);

ALTER TABLE USDA.input_food
ADD CONSTRAINT FK_input_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.input_food
ADD CONSTRAINT FK_input_food_fdc_id_of_input_food
FOREIGN KEY (fdc_id_of_input_food) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.lab_method_code
ADD CONSTRAINT FK_lab_method_code_lab_method_id
FOREIGN KEY (lab_method_id) REFERENCES USDA.lab_method (id);

ALTER TABLE USDA.lab_method_nutrient
ADD CONSTRAINT FK_lab_method_nutrient_lab_method_id
FOREIGN KEY (lab_method_id) REFERENCES USDA.lab_method (id);

ALTER TABLE USDA.market_acquisition
ADD CONSTRAINT FK_market_acquisition_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.microbe
ADD CONSTRAINT FK_microbe_foodId
FOREIGN KEY (foodId) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.sub_sample_food
ADD CONSTRAINT FK_sub_sample_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.sub_sample_food
ADD CONSTRAINT FK_sub_sample_food_fdc_id_of_sample_food
FOREIGN KEY (fdc_id_of_sample_food) REFERENCES USDA.sample_food (fdc_id);

ALTER TABLE USDA.sub_sample_result
ADD CONSTRAINT FK_sub_sample_result_food_nutrient_id
FOREIGN KEY (food_nutrient_id) REFERENCES USDA.food_nutrient (id);

ALTER TABLE USDA.sub_sample_result
ADD CONSTRAINT FK_sub_sample_result_lab_method_id
FOREIGN KEY (lab_method_id) REFERENCES USDA.lab_method (id);

ALTER TABLE USDA.survey_fndds_food
ADD CONSTRAINT FK_survey_fndds_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.survey_fndds_food
ADD CONSTRAINT FK_survey_fndds_food_wweia_category_code
FOREIGN KEY (wweia_category_code) REFERENCES USDA.wweia_food_category (wweia_food_category);

ALTER TABLE USDA.sample_food
ADD CONSTRAINT FK_sample_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.sr_legacy_food
ADD CONSTRAINT FK_sr_legacy_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.food
ADD CONSTRAINT FK_food_food_category_id
FOREIGN KEY (food_category_id) REFERENCES USDA.food_Category (id);

ALTER TABLE USDA.fndds_ingredient_nutrient_value
ADD CONSTRAINT FK_fndds_ingredient_nutrient_value_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.food_portion
ADD CONSTRAINT FK_food_portion_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.branded_food
ADD CONSTRAINT FK_branded_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);

ALTER TABLE USDA.foundation_food
ADD CONSTRAINT FK_foundartion_food_fdc_id
FOREIGN KEY (fdc_id) REFERENCES USDA.food (fdc_id);



-- Load Order

--USDA.food_attribute_type
--USDA.measure_unit
--USDA.lab_method
--USDA.lab_method_code
--USDA.lab_method_nutrient
--USDA.food_nutrient_derivation
--USDA.food_nutrient_source
--USDA.food_calorie_conversion_factor
--USDA.food_nutrient_conversion_factor
--USDA.retention_factor
--USDA.nutrient
--USDA.food_portion
--USDA.food
--USDA.acquisition_samples
--USDA.agricultural_samples
--USDA.sample_food
--USDA.sr_legacy_food
--USDA.sub_sample_food
--USDA.sub_sample_result
--USDA.market_acquisition
--USDA.survey_fndds_food
--USDA.food_attribute
--USDA.input_food
--USDA.food_component
--USDA.microbe