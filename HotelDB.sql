
DROP TABLE Floor;
CREATE TABLE hoteldb.Floor (
	Floor_number INT,
    Ameneties VARCHAR(100),
    PRIMARY KEY (Floor_number)
);
    
DROP TABLE Room;
CREATE TABLE Room (
	Room_number INT,
    Room_type ENUM("King", "Queen", "Twin", "Standard Suite", "Presidential Suite"),
    Occupancy INT,
    Daily_room_cost DOUBLE,
    Floor_number INT,
    PRIMARY KEY (Room_number),
    FOREIGN KEY (Floor_number)
		REFERENCES Floor (Floor_number)
);

DROP TABLE Employee;    
CREATE TABLE Employee (
	Employee_id INT AUTO_INCREMENT,
    Name VARCHAR(40),
    Gender VARCHAR(10),
    Phone_number INT,
    Date_of_birth DATE,
    Email VARCHAR(40),
    Address VARCHAR(40),
    PRIMARY KEY (Employee_id)
);

DROP TABLE Guest;    
CREATE TABLE Employee (
	Guest_id INT AUTO_INCREMENT,
    Name VARCHAR(40),
    Room_number INT,
    Date_of_birth DATE,
    Email VARCHAR(40),
    Address VARCHAR(40),
    PRIMARY KEY (Guest_id),
    FOREIGN KEY (Room_number)
		REFERENCES Room (Room_number)
);

DROP TABLE Requests;    
CREATE TABLE Requests (
	Request_id INT AUTO_INCREMENT,
    Date_issued DATETIME,
    Date_fufilled DATETIME,
    Request_specifications VARCHAR(300),
    Room_number INT,
    Employee_id INT,
    PRIMARY KEY (Request_id),
    FOREIGN KEY (Room_number)
		REFERENCES Room (Room_number),
	FOREIGN KEY (Employee_id)
		REFERENCES Employee (Employee_id)
);

DROP TABLE Reservations;    
CREATE TABLE Reservations (
	RBooking_id INT AUTO_INCREMENT,
    Check_in DATE,
    Check_out  DATE,
    Name_of_Reserver VARCHAR(40),
    Rooms_rented VARCHAR(30),
    PRIMARY KEY (Booking_id),
    FOREIGN KEY (Name_of_Reserver)
		REFERENCES Guest (Guest_id)
);

SELECT * from hoteldb.Floor;


 