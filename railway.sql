create database railway; //create database

use railway; //set default


/* Relations */

create table Cabin_Price(
Cabin char(2) primary key,
Price int
);

create table Station(
Station_ID int Primary Key,
City varchar(20)
);

create table Route(
Route_ID integer Primary key,
Description varchar(30)
);

create table Passenger(
Passenger_ID int Primary Key AUTO_INCREMENT,
Passenger_Name varchar(20),
Phone_No int,
CNIC varchar(16) unique 
);

create table Train(
Train_ID int primary key,
TName varchar(80) UNIQUE,
EvenDayRoute int UNIQUE,
OddDayRoute int UNIQUE,
foreign key (EvenDayRoute) references Route(Route_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
foreign key (OddDayRoute) references Route(Route_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table Seat(
Seat_No int ,
Cabin char(2),
primary key(Seat_No,Cabin),
foreign key (Cabin) references Cabin_Price(Cabin) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table Train_Schedule(
Route_ID int,
Station_ID int,
Station_Order int,
Arrival_Time time,
Departure_Time time,
Primary key(Route_ID ,
Station_ID ,Station_Order ),
foreign key (Route_ID) references Route(Route_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
foreign key (Station_ID) references Station(Station_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table Booking(
Passenger_ID int NOT NULL,
Route_ID int NOT NULL,
Arrival_Station int NOT NULL,
Departure_Station int NOT NULL,
Travel_Date date NOT NULL,
Booking_ID int Primary Key AUTO_INCREMENT,
Cabin char(2) NOT NULL,
Seat_No int NOT NULL,    
UNIQUE KEY (Travel_Date,Seat_No,Cabin),
foreign key (Seat_No,Cabin) references Seat(Seat_No,Cabin) ON DELETE RESTRICT ON UPDATE CASCADE,
foreign key (Route_ID) references Route(Route_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
foreign key (Arrival_Station) references Station(Station_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
foreign key (Passenger_ID) references Passenger(Passenger_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
foreign key (Departure_Station) references Station(Station_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);




/* Data Insertion */

INSERT INTO Station(Station_ID,City) VALUES (1,'Asgard');
INSERT INTO Station(Station_ID,City) VALUES (2,'Middle Earth');
INSERT INTO Station(Station_ID,City) VALUES (3,'District 12');
INSERT INTO Station(Station_ID,City) VALUES (4,'Townsville');
INSERT INTO Station(Station_ID,City) VALUES (5,'Wonderland');
INSERT INTO Station(Station_ID,City) VALUES (6,'Olympus');
INSERT INTO Station(Station_ID,City) VALUES (7,'Lilliput');
INSERT INTO Station(Station_ID,City) VALUES (8,'Capitol');
INSERT INTO Station(Station_ID,City) VALUES (9,'Gotham City');
INSERT INTO Station(Station_ID,City) VALUES (10,'El Dorado');
INSERT INTO Station(Station_ID,City) VALUES (11,'King''s Landing');
INSERT INTO Station(Station_ID,City) VALUES (12,'Emerald City');
INSERT INTO Station(Station_ID,City) VALUES (13,'Far Far Away');
INSERT INTO Station(Station_ID,City) VALUES (14,'Springfield');
INSERT INTO Station(Station_ID,City) VALUES (15,'Azkaban');
INSERT INTO Station(Station_ID,City) VALUES (16,'The Shire');
INSERT INTO Station(Station_ID,City) VALUES (17,'Neverland');
INSERT INTO Station(Station_ID,City) VALUES (18,'Nok Kundi');
INSERT INTO Station(Station_ID,City) VALUES (19,'Narnia');
INSERT INTO Station(Station_ID,City) VALUES (20,'Hogwarts');
INSERT INTO Station(Station_ID,City) VALUES (21,'Metropolis');
INSERT INTO Station(Station_ID,City) VALUES (22,'Vice City');
INSERT INTO Station(Station_ID,City) VALUES (23,'Whoville');
INSERT INTO Station(Station_ID,City) VALUES (24,'Stars Hollow');


INSERT INTO Route(Route_ID,Description) VALUES (1,'AZK-NRA');
INSERT INTO Route(Route_ID,Description) VALUES (2,'NRA-AZK');
INSERT INTO Route(Route_ID,Description) VALUES (3,'AZK-OLP');
INSERT INTO Route(Route_ID,Description) VALUES (4,'OLP-AZK');
INSERT INTO Route(Route_ID,Description) VALUES (5,'EMC-HWT');
INSERT INTO Route(Route_ID,Description) VALUES (6,'HWT-EMC');
INSERT INTO Route(Route_ID,Description) VALUES (7,'ELD-D12');
INSERT INTO Route(Route_ID,Description) VALUES (8,'D12-ELD');
INSERT INTO Route(Route_ID,Description) VALUES (9,'OLP-D12');
INSERT INTO Route(Route_ID,Description) VALUES (10,'D12-OLP');
INSERT INTO Route(Route_ID,Description) VALUES (11,'MDE-GTC');
INSERT INTO Route(Route_ID,Description) VALUES (12,'GTC-MDE');

INSERT INTO Cabin_Price(Cabin,Price) VALUES ('EC',500);
INSERT INTO Cabin_Price(Cabin,Price) VALUES ('AC',1000);
INSERT INTO Cabin_Price(Cabin,Price) VALUES ('PC',1500);
INSERT INTO Cabin_Price(Cabin,Price) VALUES ('SL',2000);

INSERT INTO Seat(Seat_No,Cabin) VALUES (1,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (2,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (3,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (4,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (5,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (6,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (7,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (8,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (9,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (10,'EC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (1,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (2,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (3,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (4,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (5,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (6,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (7,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (8,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (9,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (10,'PC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (1,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (2,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (3,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (4,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (5,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (6,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (7,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (8,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (9,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (10,'AC');
INSERT INTO Seat(Seat_No,Cabin) VALUES (1,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (2,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (3,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (4,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (5,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (6,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (7,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (8,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (9,'SL');
INSERT INTO Seat(Seat_No,Cabin) VALUES (10,'SL');

INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (1,'Golden Eagle I',1,2);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (2,'Golden Eagle II',2,1);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (3,'Orient Express I',3,4);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (4,'Orient Express II',4,3);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (5,'Hogwarts Express I',5,6);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (6,'Hogwarts Express II',6,5);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (7,'Royal Express I',7,8);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (8,'Royal Express II',8,7);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (9,'Polar Express I',9,10);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (10,'Polar Express II',10,9);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (11,'Thomas the Tank Engine I',11,12);
INSERT INTO Train(Train_ID,Tname,EvenDayRoute,OddDayRoute) VALUES (12,'Thomas the Tank Engine II',12,11);

INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,15,1,NULL,'8:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,14,2,'9:00','9:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,12,3,'10:00','10:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,11,4,'11:00','11:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,10,5,'12:00','12:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,9,6,'13:00','13:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,8,7,'14:00','14:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,7,8,'15:00','15:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (3,6,9,'16:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,6,1,NULL,'8:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,7,2,'9:00','9:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,8,3,'10:00','10:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,9,4,'11:00','11:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,10,5,'12:00','12:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,11,6,'13:00','13:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,12,7,'14:00','14:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,14,8,'15:00','15:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (4,15,9,'16:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (1,15,1,NULL,'10:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (1,16,2,'11:00','11:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (1,17,3,'12:00','12:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (1,18,4,'13:00','13:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (1,19,5,'14:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (2,19,1,NULL,'10:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (2,18,2,'11:00','11:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (2,17,3,'12:00','12:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (2,16,4,'13:00','13:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (2,15,5,'14:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (5,12,1,NULL,'6:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (5,13,2,'7:00','7:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (5,19,3,'8:00','8:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (5,20,4,'9:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (6,20,1,NULL,'6:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (6,19,2,'7:00','7:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (6,13,3,'8:00','8:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (6,12,4,'9:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (7,10,1,NULL,'13:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (7,21,2,'14:00','14:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (7,22,3,'15:00','15:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (7,3,4,'16:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (8,3,1,NULL,'13:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (8,22,2,'14:00','14:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (8,21,3,'15:00','15:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (8,10,4,'16:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (9,6,1,NULL,'16:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (9,5,2,'17:00','17:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (9,4,3,'18:00','18:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (9,2,4,'19:00','19:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (9,1,5,'20:00','20:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (9,3,6,'21:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (10,3,1,NULL,'16:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (10,1,2,'17:00','17:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (10,2,3,'18:00','18:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (10,4,4,'19:00','19:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (10,5,5,'20:00','20:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (10,6,6,'21:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,2,1,NULL,'1:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,4,2,'2:00','2:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,5,3,'3:00','3:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,6,4,'4:00','4:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,23,5,'5:00','5:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,24,6,'6:00','6:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,8,7,'7:00','7:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (11,9,8,'8:00',NULL);
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,9,1,NULL,'1:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,8,2,'2:00','2:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,24,3,'3:00','3:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,23,4,'4:00','4:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,6,5,'5:00','5:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,5,6,'6:00','6:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,4,7,'7:00','7:10');
INSERT INTO Train_Schedule(Route_ID,Station_ID,Station_Order,Arrival_Time,Departure_Time) VALUES (12,2,8,'8:00',NULL);

