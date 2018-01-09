use  HealthCare;

drop view if exists BillCoveredInsurance;

/* This report is created to provide the details of total how much amount has to be received from 
Insurance company for particular Patient*/
create view BillCoveredInsurance
as 
select PatientName, sum(AmountCoveredInsurance) as TotalAmountCovered, 
HealthInsuranceName,InsuranceCompany from 
(select FirstName as PatientName, AmountCoveredInsurance,
HealthInsuranceId
from Bill join Patient on Bill.PatientId=Patient.PatientId join Person 
on Patient.PersonId=Person.PersonId ) P1
join HealthInsurance on P1.HealthInsuranceId=HealthInsurance.HealthInsuranceId 
group by 
P1.PatientName,
HealthInsurance.InsuranceCompany,
HealthInsurance.HealthInsuranceName;

go

select * from BillCoveredInsurance;



/*drop view PatientDetails;*/

/* This report is created to show the details of the Patient and which Doctor is 
treating the Patient*/

create view PatientDetails 
as 
Select  Person.FirstName as PatientName, temp.Doctor as DoctorName, 
weight,HeightInCM,HeartRate,BloodPressure,Symptoms,MedicationInfo
from (select Person.Firstname as Doctor, Employee.EmployeeId as DoctorId  from 
Person join Employee on Person.PersonId=Employee.PersonId join Doctor 
on Doctor.EmployeeId=Employee.EmployeeId) temp join Patient on Patient.DoctorId=temp.DoctorId 
join Person on Person.PersonId=Patient.PatientId join PatientHealthHistory 
on Patient.PatientId=PatientHealthHistory.PatientId;



