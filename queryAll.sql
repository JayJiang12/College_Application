-- Queries and Reports --

-- 1. List the names of all applicants for a given degree program and period (semester/year); 

select Applicant.Name, Application.`Graduate Degree Program_Degree`, Application.`semester/year`
 from Applicant
 left join Application on Applicant.`Applicant ID` = Application.`Applicant_Applicant ID`;
 
-- 2. Find the total number of applicants by program and period --

select
	count(`Graduate Degree Program_Degree`) as `Total`,
    count(if(`Graduate Degree Program_Degree`="PHD" and `semester/year` = "Fall/2017", 1, null)) as `Fall/2017 PHD`,
    count(if(`Graduate Degree Program_Degree`="Master Degree" and `semester/year` = "Fall/2017", 1, null)) as `Fall/2017 Master Degree`,
    count(if(`Graduate Degree Program_Degree`="PHD" and `semester/year` = "Spring/2017", 1, null)) as `Spring/2017 PHD`,
    count(if(`Graduate Degree Program_Degree`="Master Degree" and `semester/year` = "Spring/2017", 1, null)) as `Spring/2017 Master Degree`,
    count(if(`Graduate Degree Program_Degree`="PHD" and `semester/year` = "Fall/2016", 1, null)) as `Fall/2016 PHD`,
    count(if(`Graduate Degree Program_Degree`="Master Degree" and `semester/year` = "Fall/2016", 1, null)) as `Fall/2016 Master Degree`,
	count(if(`Graduate Degree Program_Degree`="PHD" and `semester/year` = "Spring/2016", 1, null)) as `Spring/2016 PHD`,
    count(if(`Graduate Degree Program_Degree`="Master Degree" and `semester/year` = "Spring/2016", 1, null)) as `Spring/2016 Master Degree`
from Application;

-- 3. Find the most "popular" major amount the applicants in 2017 --

select `Graduate Degree Program_Degree` as `Degree in 2017`, (`Graduate Degree Program_Degree`) as count
from Application where `semester/year` = "Fall/2017" or `semester/year` = "Spring/2017"
Group by `Graduate Degree Program_Degree`
order by count(`Graduate Degree Program_Degree`) desc;


-- 4. Find those applicants with the lowest GPA that have been admitted in the Fall/2017. --

select Application.`Application ID`, min(format(PE.GPA, 2)) as GPA, Application.`semester/year`
from Application, `Proir Education` as PE
where Application.`Application ID` = PE.`Application_Application ID` and Application.`semester/year` = "Fall/2017"
union
select Application.`Application ID`, min(format(PE.GPA, 2)) as GPA, Application.`semester/year`
from Application, `Proir Education` as PE
where Application.`Application ID` = PE.`Application_Application ID` and Application.`semester/year` = "Spring/2017"
union
select Application.`Application ID`, min(format(PE.GPA, 2)) as GPA, Application.`semester/year`
from Application, `Proir Education` as PE
where Application.`Application ID` = PE.`Application_Application ID` and Application.`semester/year` = "Fall/2016"
union
select Application.`Application ID`, min(format(PE.GPA, 2)) as GPA, Application.`semester/year`
from Application, `Proir Education` as PE
where Application.`Application ID` = PE.`Application_Application ID` and Application.`semester/year` = "Spring/2016";


-- 5. Find the number of students applying to a PHD and Master Degree, for each degree program by prior degree. --

select Application.`Graduate Degree Program_Degree` as Degree, count(Application.`Graduate Degree Program_Degree`) as `Degree Number`, PE.Degree as `prior degree`
from Application, `Proir Education` as PE
where Application.`Application ID` = PE.`Application_Application ID` and Application.`Graduate Degree Program_Degree` = "PHD"
union
select Application.`Graduate Degree Program_Degree` Degree, count(Application.`Graduate Degree Program_Degree`) as `Degree Number`, PE.Degree as `prior degree`
from Application, `Proir Education` as PE
where Application.`Application ID` = PE.`Application_Application ID` and Application.`Graduate Degree Program_Degree` = "Master Degree";


-- 6. Find the applications that have not been evaluated by anyone till '2016-02-01 08:00:00'.  --

select `Application_Application ID` as `Application ID`, `Date Time`
from `Application Evaluation` where `Date Time`> '2016-02-01 08:00:00';


-- 7. Find the number of applications accepted by PHD and master degree in 2017 . --

select
count(A.`Application ID`) as Count, AE.`Final Decision` as 
	Accepted, A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2017" then "2017"
        when A.`semester/year` = "Spring/2017" then "2017"
       
end as year
from Application as A,`Application Evaluation` as AE
where AE.`Final Decision` = "Pass" 
	and AE.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "PHD"
    and (A.`semester/year` = "Fall/2017" or A.`semester/year` = "Spring/2017")
union
select
count(A.`Application ID`) as Count, AE.`Final Decision` as 
	Accepted, A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2017" then "2017"
        when A.`semester/year` = "Spring/2017" then "2017"
       
	end as year
from Application as A,`Application Evaluation` as AE
where AE.`Final Decision` = "Pass" 
	and AE.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "Master Degree"
    and (A.`semester/year` = "Fall/2017" or A.`semester/year` = "Spring/2017")
union
select
count(A.`Application ID`) as Count, AE.`Final Decision` as 
	Accepted, A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2016" then "2016"
        when A.`semester/year` = "Spring/2016" then "2016"
       
end as year
from Application as A,`Application Evaluation` as AE
where AE.`Final Decision` = "Pass" 
	and AE.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "PHD"
    and (A.`semester/year` = "Fall/2016" or A.`semester/year` = "Spring/2016")
union
select
count(A.`Application ID`) as Count, AE.`Final Decision` as 
	Accepted, A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2016" then "2016"
        when A.`semester/year` = "Spring/2016" then "2016"
       
	end as year
from Application as A,`Application Evaluation` as AE
where AE.`Final Decision` = "Pass" 
	and AE.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "Master Degree"
    and (A.`semester/year` = "Fall/2016" or A.`semester/year` = "Spring/2016");


-- 8. Find the emails of those references that resulted in the most acceptance decisions. --

-- list content email of references that reference at least 3 students.


SELECT `emails of references1` as email,
    COUNT(*) AS Count
FROM(
    SELECT `emails of references1` FROM Application
    UNION ALL
    SELECT `emails of references3` FROM Application
    UNION ALL
    SELECT `emails of references3` FROM Application
)t
GROUP BY email
HAVING count > 2;


-- 9. Find the minimum, maximum, average, and standard deviation of the GRE scores of the applicants, by program and application year. --

select
	format(min(G.verbal + G.Quantitative + G.Analytical), 0) as `min score`,
    format(max(G.verbal + G.Quantitative + G.Analytical), 0) as `max score`,
    format(avg(G.verbal + G.Quantitative + G.Analytical), 2) as `average score`,
    format(stddev(G.verbal + G.Quantitative + G.Analytical), 2) as `Std Dev score`,
	A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2017" then "2017"
        when A.`semester/year` = "Spring/2017" then "2017"
       
end as year
from Application as A, `GRE Score` as G
where G.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "PHD"
    and (A.`semester/year` = "Fall/2017" or A.`semester/year` = "Spring/2017")
union
select
	format(min(G.verbal + G.Quantitative + G.Analytical), 0) as `min score`,
    format(max(G.verbal + G.Quantitative + G.Analytical), 0) as `max score`,
    format(avg(G.verbal + G.Quantitative + G.Analytical), 2) as `average score`,
    format(stddev(G.verbal + G.Quantitative + G.Analytical), 2) as `Std Dev score`,
	A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2017" then "2017"
        when A.`semester/year` = "Spring/2017" then "2017"
       
end as year
from Application as A, `GRE Score` as G
where G.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "Master Degree"
    and (A.`semester/year` = "Fall/2017" or A.`semester/year` = "Spring/2017")
union
select
	format(min(G.verbal + G.Quantitative + G.Analytical), 0) as `min score`,
    format(max(G.verbal + G.Quantitative + G.Analytical), 0) as `max score`,
    format(avg(G.verbal + G.Quantitative + G.Analytical), 2) as `average score`,
    format(stddev(G.verbal + G.Quantitative + G.Analytical), 2) as `Std Dev score`,
	A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2016" then "2016"
        when A.`semester/year` = "Spring/2016" then "2016"
       
end as year
from Application as A, `GRE Score` as G
where G.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "PHD"
    and (A.`semester/year` = "Fall/2016" or A.`semester/year` = "Spring/2016")
union
select
	format(min(G.verbal + G.Quantitative + G.Analytical), 0) as `min score`,
    format(max(G.verbal + G.Quantitative + G.Analytical), 0) as `max score`,
    format(avg(G.verbal + G.Quantitative + G.Analytical), 2) as `average score`,
    format(stddev(G.verbal + G.Quantitative + G.Analytical), 2) as `Std Dev score`,
	A.`Graduate Degree Program_Degree` as Program, 
    case 
		when A.`semester/year` = "Fall/2016" then "2016"
        when A.`semester/year` = "Spring/2016" then "2016"
       
end as year
from Application as A, `GRE Score` as G
where G.`Application_Application ID` = A.`Application ID`
    and A.`Graduate Degree Program_Degree` = "Master Degree"
    and (A.`semester/year` = "Fall/2016" or A.`semester/year` = "Spring/2016");


-- 10. Find the college(s) attended by most applicants over the last 5 years. --

-- last 5 year of Fall 2017 is Fall 2012

select distinct PE.`College/University name` as college 
from `Proir Education` as PE, Application as A
where A.`semester/year` > "Fall/2012";
