
CREATE TABLE "product" (
    "idProduct" INT PRIMARY KEY,                
    "dateExpiration" DATE NOT NULL,            
    "nameProduct" VARCHAR(20) NOT NULL,        
    "price" DECIMAL(10, 2) NOT NULL,            
    "stockQuantity" INT NOT NULL DEFAULT 0     
);



CREATE TABLE "cashRegister" (
    "idCashRegister" INT PRIMARY KEY,
    "cashInRegister" FLOAT                     
);

CREATE TABLE "establishment" (
    "idEtablissement" INT PRIMARY KEY,
    "localisation" VARCHAR(20) NOT NULL,      
    "dateOpenAndClose" DATE,
    "idRegisterCashManual" INT, 
    "idRegisterCashAuto" INT,   
    FOREIGN KEY ("idRegisterCashManual") REFERENCES "cashRegister"("idCashRegister"), 
    FOREIGN KEY ("idRegisterCashAuto") REFERENCES "cashRegister"("idCashRegister")
);

CREATE TABLE "boss" (
    "idBoss" INT PRIMARY KEY,
    "locationOfWorkId" INT NOT NULL,          
    FOREIGN KEY ("locationOfWorkId") REFERENCES "establishment"("idEtablissement")  
);


CREATE TABLE "user" (
    "IdUser" INT PRIMARY KEY,              
    "firstName" VARCHAR(16) NOT NULL,           
    "lastName" VARCHAR(16) NOT NULL,            
    "email" VARCHAR(50) NOT NULL UNIQUE,        
    "phoneNumber" VARCHAR(15), 
    "favoriteStoreId" INT,                             
    FOREIGN KEY ("favoriteStoreId") REFERENCES "establishment"("idEtablissement") 
);

CREATE TABLE "OrderDetail"(
    "idOrderDetail" INT PRIMARY KEY,           
    "nameOrder" VARCHAR(20) NOT NULL UNIQUE,           
    "timeToPrepareOrder" TIME NOT NULL,
    "nameOfTheClient" VARCHAR(20),              
    "customerId" INT,                           
    FOREIGN KEY ("customerId") REFERENCES "user"("IdUser")  
);

CREATE TABLE "CartItem"(
    "idCartItem" INT PRIMARY KEY,               
    "productId" INT,                            
    "customerId" INT,                           
    "quantity" INT NOT NULL,                    
    FOREIGN KEY ("productId") REFERENCES "product"("idProduct"),
    FOREIGN KEY ("customerId") REFERENCES "user"("IdUser")  
);

CREATE TABLE "payment"(
    "idPayment" INT PRIMARY KEY,                
    "nameOfSender" VARCHAR(50),               
    "nameOfReceiver" VARCHAR(50),               
    "amount" DECIMAL(10, 2) NOT NULL,           
    "customerId" INT NOT NULL,            
    "orderDetailId" INT NOT NULL,             
    FOREIGN KEY ("customerId") REFERENCES "user"("IdUser"),  
    FOREIGN KEY ("orderDetailId") REFERENCES "OrderDetail"("idOrderDetail")
);
