using com.persons.db as db from '../db/persons-model';


service AdminService  @(path:'/admin') {
 
  // entity Practitioners as SELECT from db.BusinessPartners  
  //     join db.Practitioners as Practitioners on (ID = Practitioners.BusinessPartner.ID) {
  //   key ID					                                as ID,
  //     BusinessPartner.Role.Role.RoleID	            as RoleID,
  //     BusinessPartner.Title   			                as Title,
  //     BusinessPartner.FirstName   		              as FirstName,
  //     BusinessPartner.LastName        	            as LastName,
  //     BusinessPartner.Email                         as Email,
  //     Practitioners.PracticeNo					            as PracticeNo,
  //     Practitioners.SubDiscipline.DisciplineID		  as Discipline,
  //     Practitioners.SubDiscipline.Description			  as DisciplineTxt,
  //     Practitioners.SubDiscipline.SubDisciplineID	  as SubDiscipline,
  //     Practitioners.SubDiscipline.Title					    as SubDisciplineTxt
  // } where BusinessPartner.Role.Role.RoleID = '01';	  //Practitioner
  
  entity Practitioners as SELECT from db.Practitioners{
    key BusinessPartner.ID					                as ID,
      BusinessPartner.Role.Role.RoleID	            as RoleID,
      BusinessPartner.Title   			                as Title,
      BusinessPartner.FirstName   		              as FirstName,
      BusinessPartner.LastName        	            as LastName,
      BusinessPartner.Email                         as Email,
      Practitioners.PracticeNo					            as PracticeNo,
      Practitioners.SubDiscipline.DisciplineID		  as Discipline,
      Practitioners.SubDiscipline.Description			  as DisciplineTxt,
      Practitioners.SubDiscipline.SubDisciplineID	  as SubDiscipline,
      Practitioners.SubDiscipline.Title					    as SubDisciplineTxt
  } where BusinessPartner.Role.Role.RoleID = '01';	  //Practioner

  // entity Patients as SELECT from db.Patients{
  //   key BusinessPartner.ID					    as ID,
  //     BusinessPartner.Role.Role.RoleID	as RoleID,
  //     BusinessPartner.Title   			    as Title,
  //     BusinessPartner.FirstName   		  as FirstName,
  //     BusinessPartner.LastName        	as LastName,
  //     Admissions.Procedure				      as Procedure,
  //     Admissions.Ward						        as Ward
  // } where BusinessPartner.Role.Role.RoleID = '02';		//Patient


  //entity BusinessPartner		as projection on db.BusinessPartners;
  // @readonly entity PartnerRole		as projection on db.PartnerRole;
  // entity Roles		as projection on db.Roles;
  // @readonly entity Addresses		as projection on db.Addresses;
  // @readonly entity Practitioner		as projection on db.Practitioner;
  // @readonly entity Patient		as projection on db.Patient;
  //entity Admissions		as projection on db.Admissions;
  //  annotate Admissions with @odata.draft.enabled;
  //entity Disciplines		      as projection on db.Disciplines;
  // @readonly entity SubDiscipline	    as projection on db.SubDiscipline;
} 