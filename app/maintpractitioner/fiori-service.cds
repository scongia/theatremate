using PersonsService as srv from '../../srv/admin-service';

// ---------------------------------------------------------------------------------------------------------------------
// Practitioner
// ---------------------------------------------------------------------------------------------------------------------
annotate srv.Practitioner with {
  PartnerID
    @title: 'ID'
    @UI.TextArrangement: #TextOnly;
  PracticeNo
	  @title: 'Practice Number';
  Title
    @title: 'Title';
  FirstName  
    @title: 'First Name'
    @Common.FieldControl: #Mandatory;
  LastName  
    @title: 'Last Name'
    @Common.FieldControl: #Mandatory;
  Email
    @title: 'Email'
    @Common.FieldControl: #Mandatory;
	//	BusinessPartner.Role.Role.RoleID	as RoleID,
	//	SubDiscipline.DiciplineID			as DisceplineID,
	//	SubDiscipline.SubDiciplineID		as SubDisceplineID,
};

// ---------------------------------------------------------------------------
// List Report
// ---------------------------------------------------------------------------
annotate srv.Practitioner with @(
    UI:{
        LineItem: [
            {$Type: 'UI.DataField', Value: Title, Label: 'Title'},
            {$Type: 'UI.DataField', Value: LastName, Label : 'Last Name'},
            {$Type: 'UI.DataField', Value: FirstName, Label : 'First Name'}
        ]
    }
);

// ---------------------------------------------------------------------------
// Object Page
// ---------------------------------------------------------------------------
annotate srv.Practitioner with @(
// Page Header
  UI :{
        HeaderInfo: {
            Title: { Value: LastName },
            Description: { Value: SpecialistTitle },
            TypeName: 'Practitioner',
            TypeNamePlural: 'Practitioners'
        },
//         FieldGroup#HeaderInfo: {
//             Label: 'Header Info',
//             Data: [
//                 {$Type: 'UI.DataField', Value: PracticeNo}
//             ]
//          },
  
// // Page Facets
//   UI.Facets: [
//     {
//       $Type:'UI.CollectionFacet',
//       Facets: [
//         { $Type: 'UI.ReferenceFacet', Label: 'General Info',  Target: '@UI.FieldGroup#GeneralInfo' }
//       ],
//       Label:'General Details',
//     },
//     {
//       $Type:'UI.CollectionFacet',
//       Facets: [
//         { $Type: 'UI.ReferenceFacet', Label: 'General Info',  Target: '@UI.FieldGroup#Email' }
//       ],
//       Label:'Contact Details',
//     }
//   ],
//   UI.FieldGroup#GeneralInfo: {
//     Label: 'General Info',
//     Data: [
//       {$Type: 'UI.DataField', Value: Title},
//       {$Type: 'UI.DataField', Value: FirstName},
//       {$Type: 'UI.DataField', Value: LastName},
//       {$Type: 'UI.DataField', Value: PracticeNo}
//     ]
//   },
//   UI.FieldGroup#Email: {
//     Label: 'E-Mail',
//     Data: [
//       {$Type: 'UI.DataField', Value: Email}
//     ]
  }
);