/*
Database name is yadwee
*/
CREATE TABLE `yadwee`.`users` ( `userid` INT NOT NULL AUTO_INCREMENT , `username` TEXT NOT NULL , `useremail` TEXT NOT NULL , `password` TEXT NOT NULL , `isVerified` INT(1) NOT NULL DEFAULT '0' COMMENT '0 is not verified 1 is verified' , `isAdmin` INT(1) NOT NULL DEFAULT '0' COMMENT '0 is not admin 1 is admin' , PRIMARY KEY (`userid`)) ENGINE = InnoDB;
ALTER TABLE `users` ADD `mobile` INT NOT NULL AFTER `isAdmin`;
CREATE TABLE `yadwee`.`govern` ( `GovernID` INT NOT NULL AUTO_INCREMENT , `GovernName` TEXT NOT NULL , PRIMARY KEY (`GovernID`)) ENGINE = InnoDB;
CREATE TABLE `yadwee`.`City` ( `CityID` INT NOT NULL AUTO_INCREMENT , `GovernID` INT NOT NULL , `CityName` TEXT NOT NULL , PRIMARY KEY (`CityID`)) ENGINE = InnoDB;
CREATE TABLE `yadwee`.`AccessToken` ( `userid` INT NOT NULL , `token` TEXT NOT NULL ) ENGINE = InnoDB;
CREATE TABLE `yadwee`.`Verification` ( `email` TEXT NOT NULL , `code` TEXT NOT NULL ) ENGINE = InnoDB;
CREATE TABLE `yadwee`.`category` ( `catid` INT NOT NULL AUTO_INCREMENT , `catname` TEXT NOT NULL , PRIMARY KEY (`catid`)) ENGINE = InnoDB;
CREATE TABLE `yadwee`.`Products` ( `productid` INT NOT NULL AUTO_INCREMENT , `productname` TEXT NOT NULL , `productdescription` TEXT NOT NULL , `price` DECIMAL NOT NULL , `govern` INT NOT NULL , `city` INT NOT NULL , `category` INT NOT NULL , PRIMARY KEY (`productid`)) ENGINE = InnoDB;
ALTER TABLE `Products` ADD `sellerid` INT NOT NULL AFTER `category`;
ALTER TABLE Products ADD FOREIGN KEY (sellerid) REFERENCES users(userid)
ALTER TABLE Products ADD FOREIGN KEY (govern) REFERENCES govern(GovernID)
ALTER TABLE Products ADD FOREIGN KEY (city) REFERENCES City(CityID)
ALTER TABLE Products ADD FOREIGN KEY (category) REFERENCES category(catid)
ALTER TABLE City ADD FOREIGN KEY (GovernID) REFERENCES govern(GovernID)
ALTER TABLE AccessToken ADD FOREIGN KEY (userid) REFERENCES users(userid)