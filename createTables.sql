CREATE DATABASE BalloonShop

GO                                                                                     

USE BalloonShop

GO

CREATE TABLE Department(
	DepartmentID INT IDENTITY(1,1) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Description VARCHAR(1000) NULL,
 CONSTRAINT PK_Department PRIMARY KEY CLUSTERED (DepartmentID ASC)
)

GO


INSERT INTO Department(Name, Description)		
VALUES ('Anniversary Balloons', 'These sweet balloons are the perfect gift for someone you love.')
GO

INSERT INTO Department(Name, Description )		
VALUES ('Balloons for Children', 'The colorful and funny balloons will make any child smile!')
GO

CREATE TABLE Category(
	CategoryID INT IDENTITY(1,1) NOT NULL,
	DepartmentID INT NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Description VARCHAR(1000) NULL,
 CONSTRAINT PK_Category_1 PRIMARY KEY CLUSTERED(CategoryID ASC)
)

GO

ALTER TABLE Category ADD CONSTRAINT FK_Category_Department FOREIGN KEY(DepartmentID)
REFERENCES Department (DepartmentID)

GO

CREATE TABLE Product(
	ProductID INT IDENTITY(1,1) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Description VARCHAR(5000) NOT NULL,
	Price MONEY NOT NULL,
	Image1FileName VARCHAR(50) NULL,
	Image2FileName VARCHAR(50) NULL,
	OnCatalogPromotion BIT NOT NULL,
	OnDepartmentPromotion BIT NOT NULL,
 CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (ProductID ASC)
) 

GO

CREATE TABLE ProductCategory(
	ProductID INT NOT NULL,
	CategoryID INT NOT NULL,
 CONSTRAINT PK_ProductCategory PRIMARY KEY CLUSTERED (ProductID ASC, CategoryID ASC)
) 

GO

ALTER TABLE ProductCategory  WITH CHECK ADD CONSTRAINT FK_ProductCategory_Category FOREIGN KEY(CategoryID)
REFERENCES Category (CategoryID)

GO

ALTER TABLE ProductCategory  WITH CHECK ADD  CONSTRAINT FK_ProductCategory_Product FOREIGN KEY(ProductID)
REFERENCES Product (ProductID)

GO

