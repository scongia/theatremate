namespace com.persons.db;

using { managed, temporal, cuid } from '@sap/cds/common';

type BusinessKey : String(50);
 
entity BusinessPartner: cuid, managed {
         PhoneNumber	: String(20)	@title: "Phone Number";
         FirstName		: String(200)	@title: "First Name";
         LastName		: String(200)	@title: "Last Name";
         Title			: String(4)		@title: "Title";
         DoB			: Date			@title: "Date of Birth";
         IDNum			: String(20)	@title: "ID Number";
         Email			: String(100)	@title: "Email";
         Addresses		: Association to Addresses;
         Role			: Association to many PartnerRole on Role.BusinessPartner=$self;
};

entity PartnerRole {
	key BusinessPartner	: Association to BusinessPartner;
	key Role			: Association to Role;
};

entity Role {
	key RoleID			: String(5);
		RoleName		: String(100);
		BusinessPartner : Association to many PartnerRole on BusinessPartner.Role=$self;
};

//[01] - Medical Practitioner
entity Practitioner : managed {
    key BusinessPartner	: Association to BusinessPartner;
		PracticeNo		: String(50);
		SubDiscipline	: Association to SubDiscipline;
}

//[02] - Patient
entity Patient : managed {
    key	BusinessPartner	: Association to BusinessPartner;
		MedicalAid		: String(50);
		MedicalAidNo	: String(10);
		Admissions		: Association to many Admissions on Admissions.Patient=$self;
}

//Admission
entity Admissions: cuid, temporal{
		Procedure		: String(200);
		Ward			: String(50);
		Discharged		: Boolean;
		Patient			: Association to Patient;
}

//Address
entity Addresses: temporal {
    key BusinessPartner	: Association to BusinessPartner;
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
entity Discipline {
    key DisciplineID	: String(4);
		Description		: String(100);
		SubDisciplines	: Association to many SubDiscipline on SubDisciplines.Discipline=$self;
};

entity SubDiscipline {
    key DisciplineID	: String(4);
    key SubDisciplineID	: String(4);
    	Discipline		: Association to Discipline on Discipline.DisciplineID = DisciplineID;
        Description		: String(100);
        Title			: String(150);
};