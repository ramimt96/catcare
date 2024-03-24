use 336Homeworks;

DROP TABLE IF EXISTS PetAppointment;
DROP TABLE IF EXISTS NailAppointment;
DROP TABLE IF EXISTS Review;

DROP TABLE IF EXISTS Pet;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS SitterSchedule;
DROP TABLE IF EXISTS Sitter;

DROP TABLE IF EXISTS TechnicianSchedule;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Technician;



CREATE TABLE Customer(
	CustomerID INT NOT NULL PRIMARY KEY,
    Username VARCHAR(100),
    Password VARCHAR(64),
    Name VARCHAR(32),
    Address VARCHAR(255),
    Email VARCHAR(64),
    Number BIGINT(10)
);

CREATE TABLE Sitter(
	SitterID INT NOT NULL PRIMARY KEY,
    Username VARCHAR(100),
    Password VARCHAR(64),
    Name VARCHAR(32),
    Address VARCHAR(255),
    Email VARCHAR(64),
    Number BIGINT(10),
    PriceRate INT,
    Rating INT
);

CREATE TABLE SitterSchedule(
	ScheduleID INT NOT NULL PRIMARY KEY,
    Day DATE,
    StartTime DATETIME,
    EndTime DATETIME,
    SitterID INT,
    FOREIGN KEY (SitterID) REFERENCES Sitter(SitterID)
);

CREATE TABLE Pet(
	PetID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(64),
    Age INT,
    Species VARCHAR(3),
    Breed VARCHAR(32),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Technician(
	TechnicianID INT NOT NULL PRIMARY KEY,
    Username VARCHAR(100),
    Password VARCHAR(64),
    Name VARCHAR(32),
    Address VARCHAR(255),
    Email VARCHAR(64),
    Number BIGINT(10),
    Specialization VARCHAR(64),
    Company VARCHAR(64),
    Rating INT
);

CREATE TABLE TechnicianSchedule(
	ScheduleID INT NOT NULL PRIMARY KEY,
    Day DATE,
    StartTime DATETIME,
    EndTime DATETIME,
    TechnicianID INT,
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);



CREATE TABLE Service(
	ServiceID INT NOT NULL PRIMARY KEY,
    ServiceType VARCHAR(64),
    PriceRate INT,
	TechnicianID INT,
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);



CREATE TABLE PetAppointment(
	ScheduleID INT NOT NULL PRIMARY KEY,
    SitterID INT,
    PetID INT,
    FOREIGN KEY (SitterID) REFERENCES Sitter(SitterID),
    FOREIGN KEY (PetID) REFERENCES Pet(PetID),
    Status VARCHAR(32),
    BorrowDate DATETIME,
    ReturnDate DATETIME,
    Cost INT
);


CREATE TABLE NailAppointment(
	ScheduleID INT NOT NULL PRIMARY KEY,
    TechnicianID INT,
    CustomerID INT,
    ServiceID INT,
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    Status VARCHAR(32),
    BorrowDate DATETIME,
    ReturnDate DATETIME,
    Cost INT
);



SELECT * FROM Customer;
SELECT * FROM Sitter;
SELECT * FROM SitterSchedule;
SELECT * FROM Technician;
SELECT * FROM TechnicianSchedule;
SELECT * FROM Service;
SELECT * FROM Pet;
SELECT * FROM PetAppointment;
SELECT * FROM NailAppointment;
