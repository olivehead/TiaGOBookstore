CREATE TABLE Customer
(
  Email VARCHAR NOT NULL,
  Phone INT NOT NULL,
  Province VARCHAR NOT NULL,
  Postal_Code VARCHAR NOT NULL,
  City VARCHAR NOT NULL,
  StreetNumber INT NOT NULL,
  Street VARCHAR NOT NULL,
  Appartment INT NOT NULL,
  CardNum INT NOT NULL,
  ExpDate INT NOT NULL,
  SecureID INT NOT NULL,
  PRIMARY KEY (Email)
);

CREATE TABLE Publisher
(
  Name VARCHAR NOT NULL,
  Address VARCHAR NOT NULL,
  Email VARCHAR NOT NULL,
  Bank_Account INT NOT NULL,
  PRIMARY KEY (Name)
);

CREATE TABLE Warehouse
(
  Address VARCHAR NOT NULL,
  ID INT NOT NULL,
  Phone INT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE ShoppingCart
(
  CartID INT NOT NULL,
  Total INT NOT NULL,
  Email VARCHAR,
  PRIMARY KEY (CartID),
  FOREIGN KEY (Email) REFERENCES Customer(Email)
);

CREATE TABLE Publisher_Phone
(
  Phone INT NOT NULL,
  Name VARCHAR NOT NULL,
  PRIMARY KEY (Phone, Name),
  FOREIGN KEY (Name) REFERENCES Publisher(Name)
);

CREATE TABLE Book
(
  Title VARCHAR NOT NULL,
  ISBN INT NOT NULL,
  Price FLOAT NOT NULL,
  PageCount INT NOT NULL,
  Count INT NOT NULL,
  SalesPercentage INT NOT NULL,
  Name VARCHAR NOT NULL,
  PRIMARY KEY (ISBN),
  FOREIGN KEY (Name) REFERENCES Publisher(Name)
);

CREATE TABLE Purchase
(
  Shipping_Address VARCHAR NOT NULL,
  Billing_Address VARCHAR NOT NULL,
  Timestamp INT NOT NULL,
  Status VARCHAR NOT NULL,
  Email VARCHAR NOT NULL,
  CartID INT NOT NULL,
  PRIMARY KEY (Email, CartID),
  FOREIGN KEY (Email) REFERENCES Customer(Email),
  FOREIGN KEY (CartID) REFERENCES ShoppingCart(CartID)
);

CREATE TABLE CartItem
(
  Count INT NOT NULL,
  CartID INT NOT NULL,
  ISBN INT NOT NULL,
  PRIMARY KEY (CartID, ISBN),
  FOREIGN KEY (CartID) REFERENCES ShoppingCart(CartID),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Review
(
  Text INT NOT NULL,
  Send_ts INT NOT NULL,
  Rating INT NOT NULL,
  Email VARCHAR NOT NULL,
  ISBN INT NOT NULL,
  PRIMARY KEY (Email, ISBN),
  FOREIGN KEY (Email) REFERENCES Customer(Email),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Book_Author
(
  Author VARCHAR NOT NULL,
  ISBN INT NOT NULL,
  PRIMARY KEY (Author, ISBN),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Book_Genre
(
  Genre VARCHAR NOT NULL,
  ISBN INT NOT NULL,
  PRIMARY KEY (Genre, ISBN),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);