namespace com.persons.db;

using { managed, temporal } from '@sap/cds/common';
using common.Managed from './common';
using common.EPM from './common';
 
entity BusinessPartner: managed {
    key  PartnerID		: EPM.BusinessKey;
         PhoneNumber	: EPM.PhoneT	@title: "Phone Number";
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
entity Practitioner {
	key PractitionerID	: EPM.BusinessKey;
		PracticeNo		: String(50);
		BusinessPartner	: Association to BusinessPartner on BusinessPartner.PartnerID = PractitionerID @jpa.readOnly;
		SubDiscipline	: Association to SubDiscipline;
}

//[02] - Patient
entity Patient {
	key PatientID		: EPM.BusinessKey;
		MedicalAid		: String(50);
		MedicalAidNo	: String(10);
		BusinessPartner	: Association to BusinessPartner on BusinessPartner.PartnerID = PatientID @jpa.readOnly;
		Admissions		: Association to many Admissions on Admissions.Patient=$self;
		
}

//Admission
entity Admissions: temporal{
	Key AdmissionID 	: EPM.BusinessKey;
	Key	PatientID		: EPM.BusinessKey;
		Procedure		: String(200);
		Ward			: String(50);
		Discharged		: Boolean;
		Patient			: Association to Patient on Patient.PatientID = PatientID;
}

//Address
entity Addresses: temporal {
    key AddressID		: EPM.BusinessKey;
        City			: EPM.SString;
        PostalCode		: EPM.BusinessKey;
        Street			: EPM.MString;
        Building		: EPM.BusinessKey;
        Country			: String(5);
        Region			: String(4);
        AddressType		: String(2);  
        Latitude		: Double;
        Longitude		: Double; 
};

//Lookup
entity Discipline {
    key DiciplineID		: EPM.DisciplineKey;
		Description		: String(100);
		SubDisciplines	: Association to many SubDiscipline on SubDisciplines.Discipline=$self;
};

entity SubDiscipline {
    key DiciplineID		: EPM.DisciplineKey;
    key SubDiciplineID	: EPM.DisciplineKey;
    	Discipline		: Association to Discipline on Discipline.DiciplineID = DiciplineID;
        Description		: String(100);
        Title			: String(150);
};