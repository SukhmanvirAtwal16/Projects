/*
@author: Sukhmanvir Atwal
Reference 1: https://www.w3schools.com/sql/sql_join.asp
Reference 2: https://www.w3schools.com/sql/sql_union.asp
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE Customer
(
    customerID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    firstname VARCHAR(20) NOT NULL, 
    surname VARCHAR(20) NOT NULL,
    phoneNumber VARCHAR(11) UNIQUE NOT NULL, 
    email VARCHAR(254) UNIQUE NOT NULL,
    address VARCHAR(50) NOT NULL,
    postcode VARCHAR(8) NOT NULL
);

CREATE TABLE Vehicle
(
   customerID INT NOT NULL, 
   FOREIGN KEY (customerID) REFERENCES Customer (customerID),
   registrationNumber VARCHAR(7) PRIMARY KEY NOT NULL, 
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL, 
    year INT NOT NULL

);


CREATE TABLE Policy 
(
    customerID INT NOT NULL, 
    FOREIGN KEY (customerID) REFERENCES Customer (customerID),
    policyID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    policyType VARCHAR(40) NOT NULL,
    startDate INT NOT NULL, 
    endDate INT NOT NULL, 
    pricePaid DECIMAL(10,2) NOT NULL,
    paymentMethod VARCHAR(10) NOT NULL
    );


CREATE TABLE Claim
(
    claimID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    policyID INT NOT NULL, 
    FOREIGN KEY (policyID) REFERENCES Policy (policyID),
    dateOfClaim INT NOT NULL, 
    incidentDescription VARCHAR(750) NOT NULL,
    claimAmount decimal(10,2) NOT NULL
);

CREATE TABLE corporateCustomer
(
    customerID INT PRIMARY KEY NOT NULL,  
    FOREIGN KEY (customerID) REFERENCES Customer (customerID),
    companyName VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE individualCustomer
(
    customerID INT PRIMARY KEY NOT NULL, 
    FOREIGN KEY (customerID) REFERENCES Customer (customerID),
    driversLicenseNumber VARCHAR(30) UNIQUE NOT NULL, 
    NCD INT

);

/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO Customer VALUES
	 (0001, 'John', 'Doe', '07489210386', 'johndoe13@gmail.com', '213 Windsworth Road', 'SE123PR'),
	 (0002, 'Knox', 'Hester', '07843201257', 'knoxHester@yahoo.com', '112 Barclays Road', 'ME132DF'),
	 (0003, 'Jane', 'Smith', '07491209378', 'janesmith221@hotmail.com', '21 Station Road', 'ST275BI'),
	 (0004, 'Jack', 'Matthew', '07487123098', 'jackmatthew@hotmail.com', '89 Park Road', 'PR3245FK'),
	 (0005, 'Shane', 'Jenkins', '07843123076', 'shanejenkins123@hotmail.com', '201 Windsworth Road', 'SE123PR'),
	 (0006, 'Johnny', 'Myers', '07312098453', 'johnnymyers@gmail.com', '24 London Road', 'LR324GH'),
	 (0007, 'Sam', 'Wilkinsons', '07834091234', 'samwilkinsons@yahoo.com', '213 Victoria Road', 'ME324OL'),
	 (0008, 'Josh', 'Peterson', '07845091239', 'joshpeterson@yahoo.com.com', '12 Abbey Road', 'AR234DK'),
	 (0009, 'Fredrick', 'Johnson', '07854209347', 'fredrickjohnson@hotmail.com', '324 Adams Street', 'DE213OF'),
	 (0010, 'Joe', 'Davis', '07237850443', 'joedavis21343@yahoo.com', '23 Clifton Road', 'CR356DW'),
	 (0011, 'Dave', 'Rider', '07918309234', 'daverider2341@yahoo.com', '92 Kings Street', 'KS134PO'),
	 (0012, 'Katie', 'Smith', '0787230123', 'katie.smith112@yahoo.com', '21 Station Road', 'ST275BI'),
	 (0013, 'Kiera', 'Jòse', '07812093457', 'kiera.jòse@yahoo.com', '439 Grand Street', 'GS324DR'),
	 (0014, 'James', 'Gard', '07861209345', 'james.gard@gmail.com', '32 Smiths Road', 'WE3243DO'),
	 (0015, 'Michael', 'Seria', '07862109347', 'seria.michael@hotmail.com', '27 Erith Road', 'EW3043FI'),
	 (0016, 'Jake', 'Hester', '07894365986', 'jakehester@gmail.com', '112 Barclays Road', 'ME132DF'),
	 (0017, 'Mary', 'Hen', '07861092334', 'mary.hen@yahoo.com', '32 Henrys Road', 'HR3241OK'),
	 (0018, 'Sam', 'Gin', '07861209869', 'sam.gin@hotmail.com', '89 Cornwall Road', 'CR231KF'),
	 (0019, 'Copper', 'Rider', '07858987012', 'rider.copper@yahoo.com', '92 Kings Street', 'KS134PO'),
	 (0020, 'Katie', 'Jones', '07812093847', 'katie.jones1@yahoo.com', '56 Fountain Court', 'FC0201PR');

	INSERT INTO Vehicle VALUES
	(0001, 'YE19DEW', 'Audi', 'Q3', 2019),
	(0002, 'CW15FSF', 'Volkswagen', 'Polo', 2015),
	(0003, 'A11ME', 'Range Rover', 'Sport', 2024),
	(0004, 'KR70WDR', 'Audi', 'A3', 2020),
	(0005, 'GF23KJB', 'BMW', '3 Series', 2023),
	(0006, 'MR71VDK', 'Mercedes', 'A-Class', 2021),
	(0007, 'WU17IFG', 'Toyota', 'Yaris', 2017),
	(0008, 'DR21KGF', 'Ford', 'Fiesta', 2021),
	(0009, 'BT20KOW', 'Ford', 'Transit', 2020),
	(0010, 'PR61WEK', 'Peugeot', '308', 2017),
	(0011, 'GM20OGE', 'Volkswagen', 'Transporter', 2020),
	(0012, 'EM24DEI', 'Fiat', '500', 2024),
	(0013, 'KO20FKG', 'BMW', 'X4', 2020),
	(0014, 'AE22DFR', 'Audi', 'S-Line Q5', 2022),
	(0015, 'YE05D', 'Lamborghini', 'SVJ', 2018),
	(0016, 'MS62JEF', 'Ford', 'Mustang', 2012),
	(0017, 'NM23OMF', 'Toyota', 'Prius', 2023),
	(0018, 'GH05MAS', 'Citroén', 'C4', 2005),
	(0019, 'SW17DLR', 'Mercedes', 'C63', 2017),
	(0020, 'DE69OWQ', 'Ford', 'Focus', 2019);


	INSERT INTO Policy VALUES
	(0001, 1000, 'Comprehensive', 11092024, 10092025, 890.00, 'Annual'),
	(0002, 1001, 'Third-Party', 05042024, 04042025, 344.02, 'Annual'),
	(0003, 1002, 'Comprehensive', 13022024, 12022025, 2453.43, 'Monthly'),
	(0004, 1003, 'Comprehensive', 13042024, 12042025, 923.93, 'Annual'),
	(0005, 1004, 'Comprehensive', 16122023, 15012024, 1240.12, 'Monthly'),
	(0006, 1005, 'Third-Party', 22122024, 21122025, 943.56, 'Annual'),
	(0007, 1006, 'Third-Party', 09022024, 08022025, 454.09, 'Annual'),
	(0008, 1007, 'Comprehensive', 21052024, 20052025, 1100.33, 'Monthly'),
	(0009, 1008, 'Third-Party', 14022024, 13022025, 521.54, 'Annual'),
	(0010, 1009, 'Third-Party', 16022024, 15022025, 312.48, 'Monthly'),
	(0011, 1010, 'Comprehensive', 30122023, 29122024, 983.48, 'Annual'),
	(0012, 1011, 'Comprehensive', 05092024, 04092025, 1200.24, 'Monthly'),
	(0013, 1012, 'Comprehensive', 04022024, 03022025, 900.12, 'Monthly'),
	(0014, 1013, 'Comprehensive', 01012024, 31122025, 1400.54, 'Annual'),
	(0015, 1014, 'Comprehensive', 04042024, 03042025, 10231.81, 'Monthly'),
	(0016, 1015, 'Third-Party', 09112024, 08112025, 1400.00, 'Annual'),
	(0017, 1016, 'Comprehensive', 24022024, 23022025, 450.42, 'Monthly'),
	(0018, 1017, 'Third-Party', 11032024, 10032025, 242.11, 'Annual'),
	(0019, 1018, 'Comprehensive', 31012024, 30012025, 1001.15, 'Monthly'),
	(0020, 1019, 'Comprehensive', 23092024, 22092025, 1500.20, 'Annual');


	INSERT INTO Claim VALUES
	(3232, 1000, 30112024, "Rear-end collision occurred and the customer came at an extreme speed, underestimating their speed and then rear-ended the other driver's vehicle, causing damage to the exhaust system of the other driver's car, and damage to the coolant system to the customer's car. Both vehicles were covered by the customer's insurance.",5340.34),
	(1520, 1001, 20082024, "Involved the young driver (customer) driving at high speeds at night and overtaking other road users, which eventually resulted in the driver losing control of the vehicle and damaging the steering, suspension and hitting another driver on the road but not much damage caused to the other driver's car.",3240.21),
	(1249, 1003, 09112024, "This customer's car was stolen from their driveway by car thieves, who used a hacking device to unlock and start the vehicle, and a claim was made to cover for the stolen car, which the market value of the car was paid out to the customer.", 23454.40),
	(3240, 1004, 05032024, "The customer was trying to pull out at a four-way junction, where there are no traffic lights at all. The driver was unattentive and didn't see the vehicle behind the lorry and decided to move out after the lorry had passed, and then crashed into the car behind the lorry, causing serious damage to the rear side of the customer's and other driver's car. The insurance paying out for both the damage on the customer's and other driver's car.",9320.58),
	(2304, 1006, 28092024, "The young driver was on a duel carriageway approaching a roundabout and decided to change lanes at the last minute, and the vehicle in the other lane barely came to a halt, but resulted in crashing into the back of the young driver's car, damaging the bumper. In this case, the young driver was at fault since it was a poor decision made on the road, endangering the lives of other road users. Damage was only covered of the other road driver, not the young driver.", 250.23),
	(0985, 1007, 05072024, "This involved the customer being at a busy supermarket, trying to park their car, and resulted in crashing into another driver's side whilst trying to park and payout was given to both the customer and the other car involved the collision.", 301.03),
	(9845, 1009, 15052024, "This invovled the customer driving over the speed limit on a street, when a vehicle pulled out and the customer crashed into the front side of the other vehicle trying to pull out, resulting in damages to the coolant system, and damaging the whole left side of the other driver's car.",5593.01),
	(4387, 1010, 05112024, "This involved the customer driving at speed limit on the road, and then being overtaken by an uninsured driver, and the uninsured driver crashed into the front-rear side of customer's vehicle. Due to customer's policy not covering from uninsured drivers, resulting in a payout from the insurer.", 250.00),
	(1286, 1017, 10112024, "The customer was driving in the snow and didn't change their driving style as a result of the weather, causing them to skid out and crash into the driver in the opposite lane. The crash wasn't at a great impact, hence causing less damage. ", 210.01),
	(4256, 1019, 29102024, "The customer's light turned green and started driving, and another car coming from the other direction (for whom the lights were red for), decided to run the red light, rear-ending the customer's car, causing damage to the exhaust and transmission system to the customer's car and damage to the alternator, coolant system to the other driver's car.", 940.79);


	INSERT INTO corporateCustomer VALUES
	(0001, 'The Multi-Company'),
	(0003, 'Kuflink'),
	(0005, 'New Bank Inc.'),
	(0006, 'Housing Estates Co.'),
	(0009, 'John Constructs'),
	(0011, 'British Gas'),
	(0013, 'Thames Water'),
	(0015, 'UBS'),
	(0016, 'Barclays'),
	(0019, 'My Wine Inc.');

	INSERT INTO individualCustomer VALUES
	(0002, 'HESTER982019HS0NH', NULL),
	(0004, 'MATTHEW901238KK9LM', 6),
	(0007, 'WILKINSONS092348JM9KW', NULL),
	(0008, 'PETERSON908423NM9NP', NULL),
	(0010, 'DAVIS902385IU9FD', NULL),
	(0012, 'SMITH921340LK9JS', 5),
	(0014, 'GARD900213ER9NG', 20),
	(0017, 'HEN905634KJ9NH', 9),
	(0018, 'GIN905687GV9NG', NULL),
	(0020, 'JONES906590KS9NJ', NULL);


/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/*
1) Customer who has a policyID of '1006' decided to change their payment method from 'Annual' to 'Monthly'.
*/

UPDATE Policy
SET paymentMethod = 
(
    SELECT 
        CASE 
            WHEN policyType = 'Third-Party' THEN 'Monthly'
            ELSE 'Annual'
        END
    FROM Customer
    WHERE Customer.customerID = Policy.customerID
)
WHERE policyID = 1006;

/*
2) Customer called 'Jack Matthew' has recently moved out from their current home and now live at '47 Main Street' with the postocde 'MS117NW'.
*/

UPDATE Customer 
SET address = '47 Main Street', postcode = 'MS118NW'
WHERE firstname = 'Jack' AND surname = 'Matthew';


/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/

/*
1) Find the vehicle's make and model which was produced post-2015 and has the registration number starting with 'B'.
*/


select '1)' AS '';

SELECT make, model
FROM Vehicle
WHERE make = 'Ford' AND year > 2015 AND registrationNumber LIKE 'B%'; 


/*
2) Provide a list of customers who have an NCD. 
*/

select '2)' AS '';

SELECT customerID, NCD
FROM individualCustomer 
WHERE NCD IS NOT NULL;


/*
3) Show the most popular cars for insurance. In other words, show the number of makes of cars which are insured. 
*/

select '3)' AS '';

SELECT V.make, COUNT(*) AS numberOfCarsInsured
FROM Vehicle V
JOIN Policy P ON V.customerID = P.customerID
GROUP BY V.make
ORDER BY numberOfCarsInsured DESC
LIMIT 15; 


/*
4) Calculate the revenue which has been made by the insurance company, by using the figures of the price paid paid by customers and the claims paid out. 
*/

select '4)' AS  '';

SELECT P.policyType, SUM(P.pricePaid) AS totalInsurancePaid, SUM(cl.claimAmount) AS totalClaimAmount, SUM(P.pricePaid) - SUM(cl.claimAmount) AS Revenue
FROM Policy P
LEFT JOIN Claim cl ON P.PolicyID = cl.PolicyID
GROUP BY P.policyType;

/*
5) Find the customers who haven't made a claim.
*/

select '5)' AS '';

SELECT C.customerID, C.firstname, C.surname
FROM Customer C
WHERE NOT EXISTS
(
	SELECT *
	FROM Claim cl
	JOIN Policy P ON cl.policyID = P.policyID
	WHERE P.customerID = C.customerID
);

/*
6) Provide the list of cars which have insurance which is higher than the average amount.  
*/

select '6)' AS '';

SELECT V.registrationNumber, V.make, V.model, P.pricePaid
FROM Vehicle V
INNER JOIN Policy P ON V.customerID = P.customerID
WHERE P.pricePaid > 
(
	SELECT AVG(pricePaid)
	FROM Policy 
	WHERE policyType = 'Comprehensive' OR 'Third-Party'
);


/*
7) Provide a table which shows the number of claims which have been made by each policy type, including the total claim amount of each type.
*/

select '7)' AS '';

SELECT P.policyType, COUNT(cl.claimID) AS totalClaims, SUM(cl.claimAmount) AS totalClaimAmount
FROM Claim cl
INNER JOIN Policy P ON cl.policyID = P.policyID
INNER JOIN Customer C ON p.customerID= C.customerID
GROUP BY P.policyType
HAVING SUM(cl.claimAmount) > 3000
ORDER BY totalClaimAmount DESC;


/*
8) Show the list of customers who have purchased a policy and also have made a claim as well, including their claim description. 
*/

select '8)' AS '';

SELECT C.customerID, C.firstname, C.surname, 'Purchased a Policy' AS customerActivity, P.policyType AS 'policyType/ClaimDescription', COUNT(Cl.claimID) AS totalClaims
FROM Customer C
INNER JOIN Policy P ON C.customerID = P.customerID
LEFT JOIN Claim Cl ON P.policyID = Cl.policyID  
WHERE EXISTS
 (
    SELECT 1
    FROM Claim Cl2
    INNER JOIN Policy P2 ON Cl2.policyID = P2.policyID
    WHERE C.customerID = P2.customerID
)

GROUP BY C.customerID, C.firstname, C.surname, P.policyType
HAVING COUNT(Cl.claimID) > 0
UNION ALL

SELECT C.customerID, C.firstname, C.surname, 
       'Claim Made' AS customerActivity, Cl.incidentDescription, 
       NULL AS totalClaims
FROM Customer C
INNER JOIN Policy P ON C.customerID = P.customerID
INNER JOIN Claim cl ON P.policyID = Cl.policyID
ORDER BY customerID, customerActivity;



/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/*
1) Delete the duplicate Policy records in this database (JUST TO MAKE SURE THERE ISN'T ANY REDUNDANCY)
*/

DELETE FROM Policy
WHERE policyID NOT IN
 (
    SELECT policyID
    FROM
	 (
        SELECT MIN(policyID) AS policyID
        FROM Policy
        GROUP BY customerID, policyID
    ) AS subquery
);

/*
2) Three false claims were made which needs to be deleted from the database. These false claims have a claimID of '3232', '1520', '0985'.
*/

DELETE FROM Claim
WHERE claimID IN (3232, 1520, 0985);


/* SECTION 6 - DROP TABLES */

DROP TABLE Vehicle;
DROP TABLE Claim;
DROP TABLE Policy;
DROP TABLE corporateCustomer;
DROP TABLE individualCustomer;
DROP TABLE Customer;

SHOW TABLES;