using com.persons.db as db from '../db/persons-model';

 @(path:'/admin')
service AdminService{
  // @read @update 	entity Practitioner		as projection on person.PractitionerView;
  // @read @update 	entity Patient			as projection on person.PatientView;

  entity Practitioners as SELECT from db.Practitioner  {
    key BusinessPartner.ID					    as ID,
      PracticeNo							          as PracticeNo,
      BusinessPartner.Role.Role.RoleID	as RoleID,
      BusinessPartner.Title   			    as Title,
      BusinessPartner.FirstName   		  as FirstName,
      BusinessPartner.LastName        	as LastName,
      BusinessPartner.Email             as Email,
      SubDiscipline.DisciplineID			  as Discipline,
      SubDiscipline.Description			    as DisciplineTxt,
      SubDiscipline.SubDisciplineID		  as SubDiscipline,
      SubDiscipline.Title					      as SubDisciplineTxt
  } where BusinessPartner.Role.Role.RoleID = '01';	  //Practitioner

  entity Patients as SELECT from db.Patient{
    key BusinessPartner.ID					    as ID,
      BusinessPartner.Role.Role.RoleID	as RoleID,
      BusinessPartner.Title   			    as Title,
      BusinessPartner.FirstName   		  as FirstName,
      BusinessPartner.LastName        	as LastName,
      Admissions.Procedure				      as Procedure,
      Admissions.Ward						        as Ward
  } where BusinessPartner.Role.Role.RoleID = '02';		//Patient


  //@readonly entity BusinessPartner		as projection on db.BusinessPartner;
  //@readonly entity Discipline		      as projection on db.Discipline;
  //@readonly entity SubDiscipline	    as projection on db.SubDiscipline;
} 