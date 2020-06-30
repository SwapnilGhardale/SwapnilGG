CREATE TABLE `users` (
  `user` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `test`.`users`
(`user`,
`pwd`,
`fname`,
`lname`,
`email`)
VALUES
('Admin',
'invent',
'Sales & Inventory',
'System',
'ghardaleswapnil@gmail.com');

CREATE TABLE `stock` (
  `p_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` float DEFAULT NULL,
  `stk` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `test`.`stock`
(`p_id`,
`name`,
`price`,
`stk`)
VALUES
('1',
'Almonds',
150,
245);

INSERT INTO `test`.`stock`
(`p_id`,
`name`,
`price`,
`stk`)
VALUES
('2',
'Nirma',
50,
124);

INSERT INTO `test`.`stock`
(`p_id`,
`name`,
`price`,
`stk`)
VALUES
('3',
'Oreo',
30,
50);

INSERT INTO `test`.`stock`
(`p_id`,
`name`,
`price`,
`stk`)
VALUES
('4',
'Walnuts',
100,
100);

INSERT INTO `test`.`stock`
(`p_id`,
`name`,
`price`,
`stk`)
VALUES
('5',
'Cashewnuts',
250,
200);

INSERT INTO `test`.`stock`
(`p_id`,
`name`,
`price`,
`stk`)
VALUES
('6',
'Basmati Rice',
250,
50);

INSERT INTO `test`.`stock`
(`p_id`,
`name`,
`price`,
`stk`)
VALUES
('7',
'Wheat',
200,
100);


CREATE TABLE `ordertbl` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` varchar(45) NOT NULL,
  `PaymentMethod` varchar(45) NOT NULL,
  `CustomerName` varchar(45) NOT NULL,
  `Transtotal` int(11) NOT NULL,
  `Transtype` varchar(45) NOT NULL,
  `CustomerAddress` varchar(90) DEFAULT NULL,
  `MobileNumber` varchar(45) DEFAULT NULL,
  `AltMobileNumber` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `orderlinetbl` (
  `OrderID` int(11) NOT NULL,
  `ProductID` varchar(45) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `contactq` (
  `userid` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phn` varchar(45) NOT NULL,
  `sbjt` varchar(45) DEFAULT NULL,
  `msg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
