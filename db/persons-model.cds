namespace com.persons.db;

using { managed, temporal, cuid } from '@sap/cds/common';

type BusinessKey : String(50);
 
entity BusinessPartners: cuid, managed {
         PhoneNumber	: String(20);
         FirstName		: String(200);
         LastName		: String(200);
         Title			: String(4);
         DoB			: Date;
         IDNum			: String(20);
         Email			: String(100);
         Addresses		: Association to Addresses;
         Role			: Association to many PartnerRole on Role.BusinessPartner=$self;
};

entity PartnerRole {
	key BusinessPartner	: Association to BusinessPartners;
	key Role			: Association to Roles;
};

entity Roles {
	key RoleID			: String(5);
		RoleName		: String(100);
		BusinessPartner : Association to many PartnerRole on BusinessPartner.Role=$self;
};

//[01] - Medical Practitioner
entity Practitioners : managed {
    key BusinessPartner	: Association to BusinessPartners;
		PracticeNo		: String(50);
        SubDiscipline	: Association to SubDisciplines;
}

//[02] - Patient
entity Patients : managed {
    key	BusinessPartner	: Association to BusinessPartners;
		MedicalAid		: String(50);
		MedicalAidNo	: String(10);
		Admissions		: Association to many Admissions on Admissions.Patient=$self;
}

//Admission
entity Admissions: cuid, temporal{
        Patient			: Association to Patients;
        Practitioner	: Association to Practitioners;
		Procedure		: String(200);
		Ward			: String(50);
		Discharged		: Boolean;
}

//Address
entity Addresses: temporal {
    key BusinessPartner	: Association to BusinessPartners;
        City			: String(50);
        PostalCode		: String(50);
        Street			: String(100);
        Building		: String(100);
        Country			: String(5);
        Region			: String(4);
        AddressType		: String(2);  
        Latitude		: Double;
        Longitude		: Double; 
};

//Lookup
entity Disciplines {
    key DisciplineID	: String(4);
		Description		: String(100);
		SubDisciplines	: Association to many SubDisciplines on SubDisciplines.Discipline=$self;
};

entity SubDisciplines {
    key DisciplineID	: String(4);
    key SubDisciplineID	: String(4);
    	Discipline		: Association to Disciplines on Discipline.DisciplineID = DisciplineID;
        Description		: String(100);
        Title			: String(150);
};