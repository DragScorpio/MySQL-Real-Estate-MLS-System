/* create tables of attributes */
CREATE TABLE Property(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INT,
	PRIMARY KEY(address)
);

CREATE TABLE House(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INT,
	bedrooms INT,
	bathrooms INT,
	size INT,
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE BusinessProperty(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INT,
	type CHAR(20),
	size INT,
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Firm(
	id INT NOT NULL,
	name VARCHAR(30),
	address VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE Agent(
	agentId INT NOT NULL,
	name VARCHAR(30),
	phone CHAR(12),
	firmId INT NOT NULL,
	dateStarted DATE,
	PRIMARY KEY(agentId),
	FOREIGN KEY(firmId) REFERENCES Firm(id)
);

CREATE TABLE Listing(
	address VARCHAR(50),
	agentId INT,
	mlsNumber INT PRIMARY KEY,
	dataListed DATE,
	FOREIGN KEY(agentId) REFERENCES Agent(agentId),
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Buyer(
	id INT NOT NULL,
	name VARCHAR(30),
	phone CHAR(12),
	propertyType CHAR(20),
	bedrooms INT,
	bathrooms INT,
	businessPropertyType CHAR(20),
	minimumPreferredPrice INT,
	maximumPreferredPrice INT,
	PRIMARY KEY(id)
);

CREATE TABLE Work_With(
	buyerId INT,
	agentId INT,
	FOREIGN KEY(buyerId) REFERENCES Buyer(id),
	FOREIGN KEY(agentId) REFERENCES Agent(agentId)
);

/* create an assertion */
/*
CREATE ASSERTION PROPERTY_AGENT_PROJECTION CHECK
	(NOT EXISTS
        	(SELECT L1.address
           	 FROM Listings L1, Listings L2
           	 WHERE L1.address = L2.address AND L1.agentId != L2.agentId
		)
	);
*/
/* insert records to each tables, each table has at least 5 records */
/* 10 records into Property */
INSERT INTO Property
VALUES('2350 Gibson Road', 'John Smith', 235000);

INSERT INTO Property
VALUES('197 Watson Street', 'Raymond Chou', 789000);

INSERT INTO Property
VALUES('2525 Pottsdamer Street', 'Jim Lee', 100500);

INSERT INTO Property
VALUES('193 Love BLVD', 'Kim Abudal', 930000);

INSERT INTO Property
VALUES('647 Maston Road', 'Robert Clue', 135000);

INSERT INTO Property
VALUES('1350 Navada Street', 'Jack Green', 674090);

INSERT INTO Property
VALUES('256 Florida Street', 'Michael Kohen', 179280);

INSERT INTO Property
VALUES('1717 Kansas Street', 'Leah Mars', 345000);

INSERT INTO Property
VALUES('2613 Academic Way', 'Marry Song', 997050);

INSERT INTO Property
VALUES('179 Tinker Road', 'Leon Kant', 90000);

/* 5 records into House */
INSERT INTO House
VALUES('2350 Gibson Road', 'John Smith', 235000, 3, 2, 196);

INSERT INTO House
VALUES('197 Watson Street', 'Raymond Chou', 789000, 2, 4, 203);

INSERT INTO House
VALUES('2525 Pottsdamer Street', 'Jim Lee', 100500, 2, 3, 180);

INSERT INTO House
VALUES('193 Love BLVD', 'Kim Abudal', 930000, 3, 2, 401);

INSERT INTO House
VALUES('647 Maston Road', 'Robert Clue', 135000, 3, 2, 102);

/* 5 records into BusinessProperty */
INSERT INTO BusinessProperty
VALUES('1350 Navada Street', 'Jack Green', 674090, 'office space', 467);

INSERT INTO BusinessProperty
VALUES('256 Florida Street', 'Michael Kohen', 179280, 'gas station', 245);

INSERT INTO BusinessProperty
VALUES('1717 Kansas Street', 'Leah Mars', 345000, 'office space', 356);

INSERT INTO BusinessProperty
VALUES('2613 Academic Way', 'Marry Song', 997050, 'office space', 670);

INSERT INTO BusinessProperty
VALUES('179 Tinker Road', 'Leon Kant', 90000, 'store front', 128);

/* 5 records into Firm */
INSERT INTO Firm
VALUES(135210, 'Goldman Sash', '799 Georgia Way');

INSERT INTO Firm
VALUES(146277, 'Holloway', '124 Texas Street');

INSERT INTO Firm
VALUES(165034, 'Good Target', '135 California Street');

INSERT INTO Firm
VALUES(230754, 'Cozy Home', '277 Beach Road');

INSERT INTO Firm
VALUES(210211, 'Fast Searcher', '1010 Alas Road');

/* 10 records into Agent */
INSERT INTO Agent
VALUES(100, 'Leet Kim', '135145636', 210211, '2012-01-23');

INSERT INTO Agent
VALUES(112, 'Jim Alpha', '171135636', 210211, '2012-03-26');

INSERT INTO Agent
VALUES(123, 'George Grey', '176321636', 135210, '2015-02-23');

INSERT INTO Agent
VALUES(145, 'Sarah Core', '135145909', 135210, '2016-07-03');

INSERT INTO Agent
VALUES(168, 'Livia Watson', '137145638', 146277, '2014-01-17');

INSERT INTO Agent
VALUES(189, 'Nik Ray', '135873630', 146277, '2014-01-28');

INSERT INTO Agent
VALUES(201, 'Cris Paul', '136141236', 165034, '2016-05-23');

INSERT INTO Agent
VALUES(223, 'Lena Clay', '137145123', 165034, '2014-08-19');

INSERT INTO Agent
VALUES(267, 'Kevin Nil', '190145636', 230754, '2011-07-20');

INSERT INTO Agent
VALUES(310, 'Hugh Grant', '132145639', 230754, '2012-12-31');

/* 10 records into Listing */
INSERT INTO Listing
VALUES('2350 Gibson Road', 100, 1212, '2013-02-04');

INSERT INTO Listing
VALUES('197 Watson Street', 112, 1500, '2013-05-06');

INSERT INTO Listing
VALUES('2525 Pottsdamer Street', 123, 1617, '2016-12-04');

INSERT INTO Listing
VALUES('193 Love BLVD', 145, 1718, '2016-02-09');

INSERT INTO Listing
VALUES('647 Maston Road', 168, 1900, '2014-12-19');

INSERT INTO Listing
VALUES('1350 Navada Street', 189, 2101, '2015-06-06');

INSERT INTO Listing
VALUES('256 Florida Street', 201, 2305, '2017-05-25');

INSERT INTO Listing
VALUES('1717 Kansas Street', 223, 2500, '2014-12-04');

INSERT INTO Listing
VALUES('2613 Academic Way', 267, 2790, '2013-10-01');

INSERT INTO Listing
VALUES('179 Tinker Road', 310, 3001, '2015-09-05');

/* 6 records into Buyer */
INSERT INTO Buyer
VALUES(799, 'John Nay', '125345790', 'house', 3, 2, 'not applied', 100000, 635000);

INSERT INTO Buyer
VALUES(801, 'Retina Grey', '146345790', 'house', 3, 2, 'not applied', 100000, 400000);

INSERT INTO Buyer
VALUES(813, 'Reg Neal', '189345791', 'house', 2, 3, 'not applied', 300000, 635000);

INSERT INTO Buyer
VALUES(845, 'Gena Sarah', '789345790', 'house', 3, 2, 'not applied', 200000, 960000);

INSERT INTO Buyer
VALUES(875, 'Bill Clay', '888345798', 'not applied', 0, 0, 'office space', 100000, 900000);

INSERT INTO Buyer
VALUES(999, 'Hilton Clag', '999345792', 'not applied', 0, 0, 'office space', 300000, 790000);

/* 6 records into Works_With */
INSERT INTO Work_With
VALUES(799, 100);

INSERT INTO Work_With
VALUES(801, 145);

INSERT INTO Work_With
VALUES(813, 123);

INSERT INTO Work_With
VALUES(845, 168);

INSERT INTO Work_With
VALUES(875, 189);

INSERT INTO Work_With
VALUES(999, 223);

/* queries */
/* 1st query */
SELECT Listing.address
FROM Listing, House
WHERE Listing.address = House.address;

/* 2nd query */
SELECT Listing.address, Listing.mlsNumber
FROM Listing, House
WHERE Listing.address = House.address;

/* 3rd query */
SELECT Listing.address
FROM Listing, House
WHERE Listing.address = House.address AND House.bedrooms = 3 AND House.bathrooms = 2;

/* 4th query */
SELECT address, price
FROM House
WHERE bedrooms = 3 AND bathrooms = 2 AND price >= 100000 AND price <= 250000
ORDER BY price DESC;

/* 5th query */
SELECT address, price
FROM BusinessProperty
WHERE type = 'office space'
ORDER BY price DESC;

/* 6th query */
SELECT agentId, Agent.name, phone, Firm.name, dateStarted
FROM Agent, Firm
WHERE Agent.firmId = Firm.id;

/* 7th query, agentId is indicated as 201 here */
SELECT Property.*
FROM Property, Listing
WHERE Property.address = Listing.address AND Listing.agentId = 201;

/* 8th query */
SELECT Agent.name AS Agent_Name, Buyer.name AS Buyer_Name
FROM Agent, Buyer, Work_With
WHERE Agent.agentId = Work_With.agentId AND Buyer.id = Work_With.buyerId;

/* 9th query, suppose the buyer's Id is 799 in our case */
SELECT House.*
FROM House, Buyer
WHERE Buyer.id = 799 AND
      Buyer.bedrooms = House.bedrooms AND
      Buyer.bathrooms = House.bathrooms AND
      Buyer.minimumPreferredPrice <= House.price AND
      Buyer.maximumPreferredPrice >= House.price;

/* the end of program */
