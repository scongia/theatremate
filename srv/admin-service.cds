using { 
	com.persons.db as person
	, sap.common as common
} from '../db/persons-model';

service PersonsService @(path:'/admin'){
  @read @update 	entity Practitioner		as projection on person.PractitionerView;
  @read @update 	entity Patient			as projection on person.PatientView;
  @readonly 		entity BusinessPartner		as projection on person.BusinessPartner;
  @readonly 		entity Discipline		as projection on person.Discipline;
  @readonly 		entity SubDiscipline	as projection on person.SubDiscipline;
} 