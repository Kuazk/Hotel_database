
DROP TABLE Floor;
CREATE TABLE Floor (
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

DROP TABLE ROOM_SERVICE_STAFF;
CREATE TABLE ROOM_SERVICE_STAFF(
  Employee_id INT AUTO_INCREMENT,
  Assigned_room INT,
  Request_details VARCHAR(300),

  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Assigned_room,Employee_id)
);

DROP TABLE HOUSEKEEPING_STAFF;
CREATE TABLE HOUSEKEEPING_STAFF (
  Employee_id INT AUTO_INCREMENT,
  Current_floor INT,
  Requested_room INT,

  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Requested_room,Employee_id)
);

DROP TABLE MANAGER;
CREATE TABLE MANAGER (
  Employee_id INT AUTO_INCREMENT,
  Managed_floors SET(1,2,3,4,5,6,7,8,9,10,11),
  Managed_employees VARCHAR(300)

  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id)
);


DROP TABLE Guest;    
CREATE TABLE Guest (
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

DROP TABLE ARE_SERVED_BY;
CREATE TABLE ARE_SERVED_BY (
  Employee_id INT AUTO_INCREMENT,
  Room_number INT,

  PRIMARY KEY (Employee_id,Room_number),
  FOREIGN KEY (Employee_id,Room_number)
);

CREATE TABLE UPKEEPS(
  Employee_id INT AUTO_INCREMENT,
  Floor_number INT,

  PRIMARY KEY (Employee_id,Floor_number)
  FOREIGN KEY (Employee_id,Floor_number)
)

CREATE TABLE BOOKING(
  Guest_id INT AUTO_INCREMENT,
  Room_number INT,
  Booking_id INT,

  PRIMARY KEY (Guest_id,Room_number,Booking_id),
  FOREIGN KEY (Guest_id,Room_number,Booking_id)
)

CREATE TABLE ARE_MANAGED_BY(
  Employee_id INT AUTO_INCREMENT,
  Floor_number INT,

  PRIMARY KEY (Employee_id, Floor_number)
  FOREIGN KEY (Employee_id,Floor_number)
)


 