using { 
	com.persons.db as person, 
  sap.common as common
} from '../db/persons-model';

service PersonsService @(path:'/admin'){
  // @read @update 	entity Practitioner		as projection on person.PractitionerView;
  // @read @update 	entity Patient			as projection on person.PatientView;

  // Views combining BusinessPartner with respecive role..
  @readonly entity Practitioner as SELECT from person.Practitioner  {
    key PractitionerID						      as PactitionerID ,
      PracticeNo							          as PracticeNo,
      BusinessPartner.Role.Role.RoleID	as RoleID,
      BusinessPartner.Title   			    as Title,
      BusinessPartner.FirstName   		  as FirstName,
      BusinessPartner.LastName        	as LastName,
      SubDiscipline.DiciplineID			    as DisceplineID,
      SubDiscipline.SubDiciplineID		  as SubDisceplineID,
      SubDiscipline.Title					      as SpecialistTitle
  } where BusinessPartner.Role.Role.RoleID = '01';	//Practitioner

  @readonly entity Patient as SELECT from person.Patient{
    key Patient.PatientID					      as PatientID,
      BusinessPartner.Role.Role.RoleID	as RoleID,
      BusinessPartner.Title   			    as Title,
      BusinessPartner.FirstName   		  as FirstName,
      BusinessPartner.LastName        	as LastName,
      Admissions.Procedure				      as Procedure,
      Admissions.Ward						        as Ward
  } where BusinessPartner.Role.Role.RoleID = '02';		//Patient


  @readonly 		entity BusinessPartner		as projection on person.BusinessPartner;
  @readonly 		entity Discipline		as projection on person.Discipline;
  @readonly 		entity SubDiscipline	as projection on person.SubDiscipline;
} 