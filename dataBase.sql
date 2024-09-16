CREATE TABLE customer (
    IdCustomer INT PRIMARY KEY,              
    firstName VARCHAR(16) NOT NULL,           
    lastName VARCHAR(16) NOT NULL,            
    email VARCHAR(50) NOT NULL UNIQUE,        
    phoneNumber VARCHAR(15)                   
);

CREATE TABLE product (
    idProduct INT PRIMARY KEY,                
    dateExpiration DATE NOT NULL,            
    nameProduct VARCHAR(20) NOT NULL,        
    price DECIMAL(10, 2) NOT NULL,            
    stockQuantity INT NOT NULL DEFAULT 0     
);

CREATE TABLE OrderDetail(
    idOrderDetail INT PRIMARY KEY,           
    nameOrder VARCHAR(20) NOT NULL,           
    timeToPrepareOrder DATE NOT NULL,         
    nameOfTheClient VARCHAR(20),              
    customerId INT,                           
    FOREIGN KEY (customerId) REFERENCES customer(IdCustomer)
);

CREATE TABLE CartItem(
    idCartItem INT PRIMARY KEY,               
    productId INT,                            
    customerId INT,                           
    quantity INT NOT NULL,                    
    FOREIGN KEY (productId) REFERENCES product(idProduct),
    FOREIGN KEY (customerId) REFERENCES customer(IdCustomer)
);

CREATE TABLE payment(
    idPayment INT PRIMARY KEY,                
    nameOfSender VARCHAR(50),               
    nameOfReceiver VARCHAR(50),               
    amount DECIMAL(10, 2) NOT NULL,           
    customerId INT,                         
    orderDetailId INT,                        
    FOREIGN KEY (customerId) REFERENCES customer(IdCustomer),
    FOREIGN KEY (orderDetailId) REFERENCES OrderDetail(idOrderDetail)
);
