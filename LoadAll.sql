-- insert 5 professors with their id and name into the database --

insert into Professors(`Professors ID`, Name)
values(4111, "Chelsey Judy");

insert into Professors(`Professors ID`, Name)
values(4112, "Benjamin Roberto");

insert into Professors(`Professors ID`, Name)
values(4113, "Jackson Cox");

insert into Professors(`Professors ID`, Name)
values(4114, "Carol Bradley");

insert into Professors(`Professors ID`, Name)
values(4115, "Susan Howard");

-- insert 3 department into the database -- 

insert into Department(`Departemnt name`)
value("Computer Science");

insert into Department(`Departemnt name`)
value("Math");

insert into Department(`Departemnt name`)
value("Engineering");


-- insert 2 graduate degree program into the database --

insert into `Graduate Degree Program` (Degree, `Phone number`, Email, Director, `Department_Departemnt name`)
values("PHD" , "301-456-5456", "ms@umbc.edu", (select `Professors ID` from Professors where `Professors ID`= 4111), (select `Departemnt name` from Department where `Departemnt name` = "Computer Science"));

insert into `Graduate Degree Program` (Degree, `Phone number`, Email, Director, `Department_Departemnt name`)
values("Master Degree" , "301-456-7553", "bs@umbc.edu", (select `Professors ID` from Professors where `Professors ID`= 4112), (select `Departemnt name` from Department where `Departemnt name` = "Engineering"));

-- insert 8 course into database --

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3111, "CMSC212", (select `Departemnt name` from Department where `Departemnt name` = "Computer Science"), "Fall");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3112, "CMSC312", (select `Departemnt name` from Department where `Departemnt name` = "Computer Science"), "Fall");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3113, "MATH123", (select `Departemnt name` from Department where `Departemnt name` = "Math"), "Fall/Spring");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3114, "MATH345", (select `Departemnt name` from Department where `Departemnt name` = "Math"), "Fall/Spring");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3115, "CMSC415", (select `Departemnt name` from Department where `Departemnt name` = "Computer Science"), "Spring");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3116, "ENCE434", (select `Departemnt name` from Department where `Departemnt name` = "Engineering"), "Fall/Spring");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3117, "CMCE345", (select `Departemnt name` from Department where `Departemnt name` = "Engineering"), "Spring");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3118, "CMSC342", (select `Departemnt name` from Department where `Departemnt name` = "Computer Science"), "Fall/Spring");

insert into Course(`course ID`,`Course Name`, `Department_Departemnt name`, offering)
values(3119, "CMSC100", (select `Departemnt name` from Department where `Departemnt name` = "Computer Science"), "Fall");


-- applicant and applicantion into database --

-- Student 1 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2111, "John White", "M", "02/14/1978");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("l23 wood st", "123-412-3445", "jonh@gmail.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2111));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1111, "Fall/2016", 2015, "YES", "what@umbc.edu", "steven@umbc.edu", "mark@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2111));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1111, "UCSS", "Computer Science", "Master Degree", 3.45, "May 2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(435, 600, 434, (select `Application ID` from Application where `Application ID` = 1111));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1111), (select `Professors ID` from Professors where `Professors ID`= 4112), (select `Professors ID` from Professors where `Professors ID`= 4114), 80, "Pass", '2016-04-17 02:39:55');

-- Student 2 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2112, "Seven Kim", "M", "05/17/1978");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("l34 12 st", "123-44-335", "kim@gmail.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2112));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1112, "Fall/2017", 2015, "YES", "w123@umbc.edu", "GA@umbc.edu", "mde@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2112));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1112, "UMCC", "Computer Science", "Master Degree", 3.00, "May 2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(335, 700, 534, (select `Application ID` from Application where `Application ID` = 1112));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1112), (select `Professors ID` from Professors where `Professors ID`= 4113), (select `Professors ID` from Professors where `Professors ID`= 4114), 90, "Pass", '2016-12-07 07:59:59');

-- Student 3 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2113, "star sed", "M", "03/03/1972");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("34234 food st", "324-432-6445", "star@gmail.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2113));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1113, "Fall/2017", 2016, "YES", "whaye2234@umbc.edu", "sd345@umbc.edu", "m764@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2113));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1113, "UMCP", "Computer Science", "Master Degree", 3.78, "May2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(445, 700, 234, (select `Application ID` from Application where `Application ID` = 1113));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1113), (select `Professors ID` from Professors where `Professors ID`= 4112), (select `Professors ID` from Professors where `Professors ID`= 4114), 85, "Pass", '2016-12-5 11:19:22');


-- Student 4 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2114, "Rebecca W. Bottoms", "F", "05/15/1937");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("4763 Sycamore Circle", "682-667-9946", "RebeccaWBottoms@jourrapide.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2114));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1114, "Spring/2016", 2015, "YES", "ws4@umbc.edu", "st5sd8@umbc.edu", "jhy45@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2114));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1114, "UMBC", "Computer Science", "Master Degree", 3.55, "May2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(754, 441, 723, (select `Application ID` from Application where `Application ID` = 1114));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1114), (select `Professors ID` from Professors where `Professors ID`= 4111), (select `Professors ID` from Professors where `Professors ID`= 4114), 87, "Pass", '2016-11-17 04:50:09');


-- Student 5 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2115, "Mayer White", "F", "02/17/1989");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("4233 streen st", "401-432-3467", "may@gmail.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2115));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1115, "Spring/2016", 2015, "YES", "ws4@umbc.edu", "st5sd8@umbc.edu", "jhy45@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2115));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1115, "UMBC", "Engineering", "Master Degree", 3.66, "May2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(654, 471, 423, (select `Application ID` from Application where `Application ID` = 1115));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1115), (select `Professors ID` from Professors where `Professors ID`= 4111), (select `Professors ID` from Professors where `Professors ID`= 4114), 76, "Pass", '2016-10-26 07:51:29');

-- Student 6 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2116, "Lakeshia Lisi", "F", "07/29/1933");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("6456 65 st", "903-437-7498", "TimothyLRobey@dayrep.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2116));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1116, "Fall/2016", 2015, "YES", "RebeccaC@umbc.edu", "steven@umbc.edu", "mark@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2116));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1116, "UMBC", "Engineering", "Master Degree", 3.45, "May2017");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(45, 660, 434, (select `Application ID` from Application where `Application ID` = 1116));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1116), (select `Professors ID` from Professors where `Professors ID`= 4112), (select `Professors ID` from Professors where `Professors ID`= 4114), 80, "Pass", '2016-11-11 12:56:11');

-- Student 7 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2117, "Ralph E. Hayes", "M", "10/07/1975");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("4788 County Line Road", "727-725-1070", "RalphEHayes@armyspy.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2117));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1117, "Spring/2016", 2015, "YES", "Dominic@umbc.edu", "CarolR@umbc.edu", "JamesB@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2117));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1117, "UMCP", "Engineering", "Master Degree", 3.05, "May2017");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(735, 860, 834, (select `Application ID` from Application where `Application ID` = 1117));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1117), (select `Professors ID` from Professors where `Professors ID`= 4113), (select `Professors ID` from Professors where `Professors ID`= 4114), 91, "Pass", '2015-10-23 09:36:45');

-- Student 8 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2118, "Latoya S. Bland", "F", "01/13/1990");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("2565 Pick Street", "970-641-2171", "LatoyaSBland@ide.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2118));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1118, "Spring/2016", 2015, "YES", "BrandiR@umbc.edu", "ws4@umbc.edu", "Kathy@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "Master Degree"), (select `Applicant ID` from Applicant where `Applicant ID` = 2118));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1118, "UMBC", "Engineering", "Bachelor Degree", 3.15, "May2017");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(735, 860, 934, (select `Application ID` from Application where `Application ID` = 1118));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1118), (select `Professors ID` from Professors where `Professors ID`= 4111), (select `Professors ID` from Professors where `Professors ID`= 4114), 97, "Pass", '2016-11-23 10:36:11');

-- Student 9 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2119, "Bobby K. Birch", "M", "03/27/1987");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("3235 Chestnut Street", "727-368-0824", "BobbyKBirch@rhyta.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2119));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1119, "Spring/2017", 2016, "YES", "Maria@umbc.edu", "Vernice@umbc.edu", "euice@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2119));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1119, "UMBC", "MATH", "Master Degree", 3.65, "May2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(755, 865, 844, (select `Application ID` from Application where `Application ID` = 1119));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1119), (select `Professors ID` from Professors where `Professors ID`= 4113), (select `Professors ID` from Professors where `Professors ID`= 4114), 91, "Pass", '2015-11-09 12:06:45');

-- Student 10 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2120, "Norma T. Vasquez", "F", "10/17/1992");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("4788 County Line Road", "208-373-9523", "RalphEHayes@armyspy.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2120));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1120, "Spring/2017", 2015, "YES", "euice@umbc.edu", "Katherine@umbc.edu", "MorrisM@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "PHD"), (select `Applicant ID` from Applicant where `Applicant ID` = 2120));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1120, "UMBC", "Computer Science", "Master Degree", 3.15, "May2017");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(535, 260, 834, (select `Application ID` from Application where `Application ID` = 1120));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1120), (select `Professors ID` from Professors where `Professors ID`= 4111), (select `Professors ID` from Professors where `Professors ID`= 4112), 91, "Pass", '2016-10-23 10:36:44');

-- Student 11 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2121, "Laurie C. Miller", "F", "04/17/1990");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("1401 Locust Street", "229-712-4960", "RalphEHayes@armyspy.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2121));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1121, "Fall/2017", 2016, "YES", "DavidSChampion@umbc.edu", "GeorgeBGarcia@umbc.edu", "Matthew@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "Master Degree"), (select `Applicant ID` from Applicant where `Applicant ID` = 2121));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1121, "UMBC", "MATH", "Bachelor Degree", 3.85, "May2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(745, 861, 734, (select `Application ID` from Application where `Application ID` = 1121));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1121), (select `Professors ID` from Professors where `Professors ID`= 4113), (select `Professors ID` from Professors where `Professors ID`= 4114), 99, "Pass", '2016-07-13 10:36:54');

-- Student 12 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2122, "Margaret R. Miller", "F", "12/08/1988");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("4947 Private Lane", "229-392-8732", "MargaretRMiller@rhyta.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2122));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1122, "Spring/2016", 2016, "YES", "crandall@umbc.edu", "drezet@umbc.edu", "miyop@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "Master Degree"), (select `Applicant ID` from Applicant where `Applicant ID` = 2122));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1122, "UMBC", "MATH", "Bachelor Degree", 3.05, "May2017");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(735, 860, 634, (select `Application ID` from Application where `Application ID` = 1122));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1122), (select `Professors ID` from Professors where `Professors ID`= 4113), (select `Professors ID` from Professors where `Professors ID`= 4114), 90, "Pass", '2016-02-23 09:36:55');

-- Student 13 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2123, "Sherri C. Toledo", "M", "03/20/1994");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("3856 Tibbs Avenue", "406-765-6468", "RalphEHayes@armyspy.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2123));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1123, "Spring/2016", 2015, "YES", "euice@umbc.edu", "jguyer@umbc.edu", "sakusha@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "Master Degree"), (select `Applicant ID` from Applicant where `Applicant ID` = 2123));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1123, "UMBC", "Computer Science", "Bachelor Degree", 3.05, "May2017");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(835, 350, 534, (select `Application ID` from Application where `Application ID` = 1123));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1123), (select `Professors ID` from Professors where `Professors ID`= 4113), (select `Professors ID` from Professors where `Professors ID`= 4114), 91, "Pass", '2015-12-23 09:54:34');

-- Student 14 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2124, "Lucy D. Caudill", "F", "07/23/1985");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("3725 Woodland Terrace", "916-924-0311", "LucyDCaudill@rhyta.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2124));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1124, "Fall/2017", 2016, "YES", "euice@umbc.edu", "mxiao@umbc.edu", "firstpr@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "Master Degree"), (select `Applicant ID` from Applicant where `Applicant ID` = 2124));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1124, "UMBC", "Engineering", "Bachelor Degree", 3.75, "May2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(635, 960, 734, (select `Application ID` from Application where `Application ID` = 1124));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1124), (select `Professors ID` from Professors where `Professors ID`= 4113), (select `Professors ID` from Professors where `Professors ID`= 4114), 90, "Pass", '2016-02-22 09:36:22');

-- Student 15 --
INSERT INTO Applicant (`Applicant ID`, `Name`, `Gender`, `Date of Birth`)
values(2125, "Debra T. Rohn", "M", "08/19/1987");

insert into `Contact Infor` (`address`, `phone number`, `email address`, `Applicant_Applicant ID`)
values("2516 Oakmound Drive", "773-403-9583", "RalphEHayes@armyspy.com", (select `Applicant ID` from Applicant where `Applicant ID` = 2125));

insert into Application (`Application ID`, `semester/year`, `Date of GRE`, essay, `emails of references1`,`emails of references3`,`emails of references2`, `application Answer`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`)
values(1125, "Spring/2016", 2015, "YES", "mthurn@umbc.edu", "euice@umbc.edu", "fangorn@umbc.edu", "YES", (select Degree from `Graduate Degree Program` where Degree = "Master Degree"), (select `Applicant ID` from Applicant where `Applicant ID` = 2125));

insert into `Proir Education`(`Application_Application ID`, `college/university name`, major, Degree, GPA, `graduation date`)
values(1125, "UMBC", "Computer Science", "Bachelor Degree", 3.00, "May2016");

insert into `GRE Score`(verbal, Quantitative, Analytical,`Application_Application ID`)
values(765, 864, 734, (select `Application ID` from Application where `Application ID` = 1125));

insert into `Application Evaluation`(`Application_Application ID`, Professors1, Professors2, score, `final decision`, `Date Time`)
values((select `Application ID` from Application where `Application ID` = 1125), (select `Professors ID` from Professors where `Professors ID`= 4111), (select `Professors ID` from Professors where `Professors ID`= 4112), 98, "Pass", '2016-01-12 09:39:11');
