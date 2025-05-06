-- Question 1: Create ProductDetail table in 1NF
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100), -- Renamed from Products to Product for clarity (single product per row)
    PRIMARY KEY (OrderID, Product) -- Composite key to ensure uniqueness
);

-- Insert data (each row represents a single product, satisfying 1NF)
INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Verify the data
SELECT * FROM ProductDetail;

-- Question 2: Transform into 2NF by removing partial dependencies

-- Step 1: Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

-- Step 2: Insert data into Orders
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Step 3: Create Product table
CREATE TABLE Product (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert data into Product
INSERT INTO Product (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Step 5: Verify the results
SELECT * FROM Orders;
SELECT * FROM Product;
