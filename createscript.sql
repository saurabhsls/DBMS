drop database couriermanage;
CREATE DATABASE couriermanage;

\c couriermanage
CREATE TABLE BRANCH (
    Branch_Id INT PRIMARY KEY,
    Branch_city CHAR(50) NOT NULL,
    Branch_Address CHAR(50) NOT NULL

);
CREATE TABLE EMPLOYEE (
    Employee_Name VARCHAR(50) NOT NULL,
    Employee_Address VARCHAR(50) NOT NULL,
    Phone_number FLOAT NOT NULL,
    Employee_Id INT PRIMARY KEY,
    Designation CHAR(50) NOT NULL,
    Salary FLOAT(10) NOT NULL,
    B_id INT,
    FOREIGN KEY (B_id) REFERENCES BRANCH(Branch_Id)
);

CREATE TABLE CUSTOMER(
    Customer_name CHAR(50) NOT NULL,
    Customer_Address CHAR(50) NOT NULL,
    Customer_Id INT PRIMARY KEY
);

CREATE TABLE POST_BOY(
    Locat CHAR(50) ,
    Date_ DATE,
    Shift INT NOT NULL,
    E_id INT,
    Foreign KEY (E_id) REFERENCES EMPLOYEE(Employee_Id)
);

CREATE TABLE CITY_RATES(
    City CHAR(50) NOT NULL,
    Weights FLOAT(10) NOT NULL,
    Rate_id INT PRIMARY KEY,
    Rate_type INT NOT NULL
);

CREATE TABLE CUSTOMER_PACKAGES(
    Package_Id INT PRIMARY KEY,
    Receiving_date DATE NOT NULL,
    Departure_date DATE NOT NULL,
    Total_bill FLOAT(10) NOT NULL,
    Cust_Id INt,
    FOREIGN KEY (Cust_Id) REFERENCES CUSTOMER(Customer_Id)
);

CREATE TABLE PRODUCT(
    Product_Id INT PRIMARY KEY,
    Product_Name CHAR(50) NOT NULL,
    Unit_Price FLOAT(10) NOT NULL,
    Stock_Qty INT
);

CREATE TABLE CONTAINS(
    Quant INT ,
    Pro_id INt,
    Pac_Id INT,
    FOREIGN KEY(Pro_id) REFERENCES PRODUCT(Product_Id),
    FOREIGN KEY(Pac_Id) REFERENCES CUSTOMER_PACKAGES(Package_Id)
)