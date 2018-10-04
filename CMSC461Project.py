# run mysql:  /usr/local/mysql/bin/mysql -uroot -p Mysql123
# run python: /usr/bin/python
# run python on gl.umbc.edu:
#   ssh username@gl.umbc.edu
#   emacs
#   /usr/bin/scl enable python33 bashimport sys

# import the mysql connect to connect to the database
import mysql.connector
from mysql.connector import errorcode

# login information for the mysql database
login = {
    'user' : 'root',
    'password' : 'Mysql123',
    'database' : 'mydb',
    'host' : 'localhost',
    'port' : '3306'}

# connect to the mysql throught connector/python 
conn = mysql.connector.connect(**login)

# execute all the queries

cur = conn.cursor()

user_input = int(input("1. Show all tables in database\n"
                       + "2. Show values of one tables"
                       + "3. Enter information into a table\n"
                       + "4. Update information of a table\n"
                       + "5. Delete information of a table\n"
                       + "enter other number to quit program\n"
                       + "Enter your number:"))

if user_input == 1:
    cur.execute("show tables")

    results = cur.fetchall()
    widths = []
    columns = []
    tavnit = '|'
    separator = '+'

    for cd in cur.description:
        widths.append(max(cd[2], len(cd[0])))
        columns.append(cd[0])

    for w in widths:
        tavnit += " %-" + "%ss |" % (w,)
        separator += '-' * w + '--+'

    print(separator)
    print(tavnit % tuple(columns))
    print(separator)
    for row in results:
        print(tavnit % row)
    print(separator)

elif user_input == 2:
    tableName = raw_input("Please enter the table name: ")
    show = "select * from `%s`" %(tableName)

    cur.execute(show)

    results = cur.fetchall()
    widths = []
    columns = []
    tavnit = '|'
    separator = '+'

    for cd in cur.description:
        widths.append(max(cd[2], len(cd[0])))
        columns.append(cd[0])

    for w in widths:
        tavnit += " %-" + "%ss |" % (w,)
        separator += '-' * w + '--+'

    print(separator)
    print(tavnit % tuple(columns))
    print(separator)
    for row in results:
        print(tavnit % row)
    print(separator)

elif user_input == 3:
    tableName = raw_input("Please enter the table name: ")

    if tableName == "Professors":

        # asking for input value
        var1, var2 = raw_input("Please enter Professors ID and Name split comma: ").split(",")

        # create a statement
        statmt = "INSERT INTO Professors(`Professors ID`, Name) VALUES('%i', '%s')" % (int(var1), var2)
        
    elif tableName == "Department":
        values = raw_input("Please enter Department Name: ")

        statmt = "insert into Department(`Departemnt name`) VALUES ('%s')" %(values,)
        
    elif tableName == "Graduate Degree Program":
        Degree, PhoneNumber, Email, Director, Name = raw_input\
            ("Please enter Degree, PhoneNumber, Email, Director, Dept. Name split by comma: ").split(",")

        statmt = "insert into `Graduate Degree Program` (Degree, `Phone number`, Email, Director, " \
                 "`Department_Departemnt name`) values('%s', '%s', '%s', '%s', '%s')" \
                 % (Degree, PhoneNumber, Email, Director, Name)
        
    elif tableName == "Applicant":
        values = input("Please enter values of table split by comma")
        
    elif tableName == "Application":
        values = input("Please enter values of table split by comma")
        
    elif tableName == "GRE Score":
        values = input("Please enter values of table split by comma")

    elif tableName == "Application Evaluation":
        values = input("Please enter values of table split by comma")
        
    elif tableName == "Proir Education":
        values = input("Please enter values of table split by comma")
        
    elif tableName == "Admission Requirement":
        values = input("Please enter values of table split by comma")
        
    elif tableName == "Admission Rubrics":
        values = input("Please enter values of table split by comma")
        
    elif tableName == "Contact Infor":
        values = input("Please enter values of table split by comma")
        
    elif tableName == "Course":
        values = input("Please enter values of table split by comma")

    else:
        print("Error in selection table name")

    cur.execute(statmt)
    

elif user_input == 4:

    tableName = raw_input("Please enter the table name: ")

    if tableName == "Professors":

        tableName = raw_input("please enter the table name: ")

        cur.execute("UPDATE Professors SET ='4' WHERE `Professors ID`='4'")

    elif tableName == "Department":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Graduate Degree Program":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Applicant":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Application":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "GRE Score":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Application Evaluation":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Proir Education":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Admission Requirement":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Admission Rubrics":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Contact Infor":
        values = input("Please enter Professors ID and Name split by comma")

    elif tableName == "Course":
        values = input("Please enter Professors ID and Name split by comma")

    else:
        print("Error in selection table name")

elif user_input == 5:

    tableName = raw_input("Please enter the table name: ")

    if tableName == "Professors":

        delVal = raw_input("Please enter Professors ID you want to delete: ")
        delstatmt = "DELETE FROM `Professors` WHERE `Professors id` = '%s'" % (delVal,)
        cur.execute(delstatmt)


    elif tableName == "Department":
        delVal = input("Please enter Department Name ")
        delstatmt = "DELETE FROM `Deaprtment` WHERE `Name` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Graduate Degree Program":
        delVal = input("Please enter Degree Program: ")
        delstatmt = "DELETE FROM `Graduate Degree Program` WHERE `Degree` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Applicant":
        delVal = input("Please enter Applicant ID: ")
        delstatmt = "DELETE FROM `Applicant` WHERE `Applicant ID` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Application":
        delVal = input("Please enter Application ID: ")
        delstatmt = "DELETE FROM `Application` WHERE `Application ID` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "GRE Score":
        delVal = input("Please enter Application ID: ")
        delstatmt = "DELETE FROM `GRE Score` WHERE `Application_Application ID` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Application Evaluation":
        delVal = input("Please enter Application ID: ")
        delstatmt = "DELETE FROM `Application Evalution` WHERE `Application_Application ID` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Proir Education":
        delVal = input("Please enter Application ID: ")
        delstatmt = "DELETE FROM `Proir Education` WHERE `Application_Application ID` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Admission Requirement":
        delVal = input("Please enter Degree Program: ")
        delstatmt = "DELETE FROM `Admission Requirement` WHERE `Graduate Degree Program_Department` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Admission Rubrics":
        delVal = input("Please enter Degree Program: ")
        delstatmt = "DELETE FROM `Admission Rubrics` WHERE `Graduate Degree Program_Department` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Contact Infor":
        delVal = input("Please enter Applicant ID: ")
        delstatmt = "DELETE FROM `Contact Infor` WHERE `Applicant_Applicant ID` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    elif tableName == "Course":
        delVal = input("Please enter Course ID: ")
        delstatmt = "DELETE FROM `Course` WHERE `Course ID` = '%s'" % (delVal,)
        cur.execute(delstatmt)

    else:
        print("Error in selection table name")


else:
    print("Please select correct number")

conn.commit()

cur.close()
conn.close()

