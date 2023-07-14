DROP TABLE BOM_Details;
DROP TABLE BOM;
DROP TABLE Ingredient_Master;
SET LINESIZE 200;

CREATE TABLE Ingredient_Master
( 
    Ingredient_ID 	number(3,0) 	NOT NULL  PRIMARY KEY ,
    Ingredient_Name varchar2(20) NOT NULL  ,
    ingredient_detail varchar2(30)
);

CREATE TABLE BOM
( 
    BOM_ID 	    number(2,0)    NOT NULL PRIMARY KEY ,
    BOM_NAME    varchar2(30) NOT NULL,
    BOM_Price	number
);

CREATE TABLE  BOM_Details
( 
    BOMDet_ID 	number(3,0) 	NOT NULL PRIMARY KEY,
    BOMDet_NAME varchar2(20) NOT NULL ,
    BOMDet_Unit	number,
    Ingredient_ID  number(2,0) REFERENCES Ingredient_Master(INGREDIENT_ID),
    bom_id number(2,0) REFERENCES Ingredient_Master(INGREDIENT_ID)
);

DESCRIBE Ingredient_Master;
DESCRIBE BOM;
DESCRIBE BOM_Details;

INSERT INTO Ingredient_Master  VALUES (1,'Pork','TOPS SUPERMARKET');
INSERT INTO Ingredient_Master  VALUES (2,'Garlic','TOPS SUPERMARKET');
INSERT INTO Ingredient_Master  VALUES (3,'Oil','TOPS SUPERMARKET');
INSERT INTO Ingredient_Master  VALUES (4,'Red Chili','TOPS SUPERMARKET');
INSERT INTO Ingredient_Master  VALUES (5,'Basil Leave','TOPS SUPERMARKET');
INSERT INTO Ingredient_Master  VALUES (6,'Spaghetti','Lotus');
INSERT INTO Ingredient_Master  VALUES (7,'Pork Ham','Lotus');
INSERT INTO Ingredient_Master  VALUES (8,'Egg','Lotus');
INSERT INTO Ingredient_Master  VALUES (9,'Thai Black Pepper','Lotus');
INSERT INTO Ingredient_Master  VALUES (10,'Salt','lotus');

INSERT INTO BOM_Details  VALUES (1,'Pork',500,1,1);
INSERT INTO BOM_Details  VALUES (2,'Garlic',200,2,1);
INSERT INTO BOM_Details  VALUES (3,'Oil',100,3,1);
INSERT INTO BOM_Details  VALUES (4,'Red Chili',200,4,1);
INSERT INTO BOM_Details  VALUES (5,'Basil leave',100,5,1);
INSERT INTO BOM_Details  VALUES (6,'Spaghetti',200,5,2);
INSERT INTO BOM_Details  VALUES (7,'Pork ham',150,5,2);
INSERT INTO BOM_Details  VALUES (8,'Egg',100,5,2);
INSERT INTO BOM_Details  VALUES (9,'Thai Black Pepper',100,5,2);
INSERT INTO BOM_Details  VALUES (10,'Salt',100,5,2);

INSERT INTO BOM  VALUES (1,'thai green curry',60);
INSERT INTO BOM  VALUES (2,'Carbonara Spaghetti',70);

select * from Ingredient_Master;
select * from Ingredient_Master order by Ingredient_Name;


select * from BOM_Details join BOM on BOM_Details.BOM_ID = BOM.BOM_ID;

select * from BOM_Details;
select * from bom;

select BOMDet_NAME,BOMDet_Unit from BOM_Details where BOMDet_NAME like '%a%' or BOMDet_Unit = 100;


select * from BOM_Details join BOM on BOM_Details.BOM_ID = BOM.BOM_ID ;

select sum(BOMDet_Unit) total_Ingredient_per_dish ,BOM_NAME dish_name from BOM_Details join BOM on BOM_Details.BOM_ID = BOM.BOM_ID  group by BOM.BOM_NAME;






