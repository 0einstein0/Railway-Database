/* Retrieve table data*/

/* 	ROUTE  */
SELECT route_id,description FROM route;

/* STATION */
SELECT station_id, city FROM station;

/* TRAIN_SCHEDULE with foreign key IDs replaced with corresponding textual description */
SELECT (SELECT description FROM route WHERE train_schedule.Route_ID = route.Route_ID) AS 'route', (SELECT city FROM station WHERE train_schedule.station_ID = station.Station_ID) AS 'city', station_order, arrival_time, departure_time
FROM train_schedule WHERE route_id=$selected_val
ORDER BY route_id asc,station_order asc;

/* CABIN_PRICE */
SELECT cabin, price FROM cabin_price;

/* Retrieve data based on entered parameters */

/* Suggest a route from station A to station B for a train to run today */
/* Replace $selected_val1 with starting station ID and $selected_val2 with ending station ID */
/* If you would like to suggest a route for a day other than today, replace all instances of curdate() with chosen data */
SELECT route_id, description
FROM route
WHERE route_id IN
(SELECT IF(DAYOFWEEK(curdate()) = 2 OR DAYOFWEEK(curdate()) = 4 OR DAYOFWEEK(curdate()) = 6, EvenDayRoute, OddDayRoute)
FROM train JOIN Route ON (IF(DAYOFWEEK(curdate()) = 2 OR DAYOFWEEK(curdate()) = 4 OR DAYOFWEEK(curdate()) = 6, train.EvenDayRoute, train.OddDayRoute)) = Route.Route_ID JOIN train_schedule AS A USING (Route_ID) JOIN train_schedule AS B USING (Route_ID)
WHERE A.Station_ID = $selected_val1  AND B.Station_ID = $selected_val2   AND A.Station_Order < B.Station_Order
);

/* Retrieve available seats on a train on given date */
/* replace $selected_val with selected train ID and $date with date */ 
SELECT Seat_No, Cabin
FROM Seat
WHERE (Seat_No, Cabin) NOT IN (SELECT Seat_No, Cabin
FROM Seat JOIN Booking USING (Seat_No, Cabin) JOIN Route USING (Route_ID) JOIN Train ON Route.route_ID = IF(DAYOFWEEK($date) = 2 OR DAYOFWEEK($date) = 4 OR DAYOFWEEK($date) = 6, train.EvenDayRoute, train.OddDayRoute)
WHERE Train_ID = $selected_val  AND Booking.travel_date = '$date');

/* print ticket data */
/* replace $booking_id with booking ID of ticket */
SELECT description,travel_date, passenger_name,phone_no, cnic,booking_id, seat_no,cabin FROM booking join passenger on booking.passenger_id=passenger.passenger_id join route 
on booking.route_id=route.route_id where booking_id=$booking_id;

SELECT tname,cabin,seat_no
FROM Train join Booking ON IF(DAYOFWEEK(booking.travel_date) = 2 OR DAYOFWEEK(booking.travel_date) = 4 OR DAYOFWEEK(booking.travel_date) = 6, train.EvenDayRoute, train.OddDayRoute) = booking.route_ID
join Route USING (Route_ID)
WHERE Booking_ID = $booking_id;

SELECT Departure_Time,city
FROM booking JOIN Station ON booking.Arrival_Station = station.Station_ID JOIN train_schedule USING (station_ID, route_ID)
WHERE booking_ID = $booking_id;

SELECT Arrival_Time,city
FROM booking JOIN Station ON booking.Departure_Station = station.Station_ID JOIN train_schedule USING (station_ID, route_ID)
WHERE booking_ID = $booking_id;



/* Insert data */

/* INSERT PASSENGER AND BOOKING */
INSERT INTO passenger (passenger_id, passenger_name,phone_no,cnic)
VALUES (((SELECT max(passenger_id) from (SELECT * FROM passenger) as x)+1), '$name', '$number', '$cnic');

INSERT INTO booking(passenger_ID, route_id, arrival_station, departure_station, travel_date, booking_id, cabin, seat_no) VALUES ((SELECT max(passenger_id) from (SELECT * FROM passenger) as x), (SELECT route_id FROM route WHERE route_id IN
(SELECT IF(DAYOFWEEK('$travel_date') = 2 OR DAYOFWEEK('$travel_date') = 4 OR DAYOFWEEK('$travel_date') = 6, EvenDayRoute, OddDayRoute)
FROM train JOIN Route ON (IF(DAYOFWEEK('$travel_date') = 2 OR DAYOFWEEK('$travel_date') = 4 OR DAYOFWEEK('$travel_date') = 6, train.EvenDayRoute, train.OddDayRoute)) = Route.Route_ID JOIN train_schedule AS A USING (Route_ID) JOIN train_schedule AS B USING (Route_ID)
WHERE A.Station_ID = $A  AND B.Station_ID = $B   AND A.Station_Order < B.Station_Order))
, '$A', '$B', '$travel_date', ((SELECT max(booking_id) from (SELECT * FROM booking) as x)+1),'$cabin', '$seat_no')


