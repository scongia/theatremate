using AdminService as srv from '../../srv/admin-service';

// ---------------------------------------------------------------------------------------------------------------------
// Practitioner
// ---------------------------------------------------------------------------------------------------------------------
annotate srv.Practitioners with {
  ID                  @title: 'ID'          @UI.TextArrangement: #TextOnly;
  PracticeNo          @title: 'Practice Number';
  Title               @title: 'Title';
  FirstName           @title: 'First Name'  @Common.FieldControl: #Mandatory;
  LastName            @title: 'Last Name'   @Common.FieldControl: #Mandatory;
  Email               @title: 'Email'       @Common.FieldControl: #Mandatory; 
	//	BusinessPartner.Role.Role.RoleID	as RoleID,
	Discipline		      @title: 'Discipline';
  DisciplineTxt		    @title: 'Discipline Text';
  SubDiscipline       @title: 'Sub Discipline';
	SubDisciplineTxt    @title: 'Sub Discipline Text';
};
 
// ---------------------------------------------------------------------------
// List Report
// ---------------------------------------------------------------------------
annotate srv.Practitioners with @(
    UI:{
        //SelectionFields: [ PactitionerID, FirstName, LastName, DisciplineID, SubDisciplineID ],
        SelectionFields: [ FirstName, LastName, Discipline ],
        LineItem: [
            {$Type: 'UI.DataField', Value: Title,     Label: 'Title'},
            {$Type: 'UI.DataField', Value: LastName,  Label : 'Last Name'},
            {$Type: 'UI.DataField', Value: FirstName, Label : 'First Name'},
            //{$Type: 'UI.DataField', Value: DisciplineTxt, Label : 'Discipline'},
            {$Type: 'UI.DataField', Value: SubDisciplineTxt, Label : 'Specialisation'}
        ]
    }
)
{
	Discipline @ValueList.entity:'Disciplines';
  //SubDisciplineID @ValueList.entity:'SubDiscipline';
};

// ---------------------------------------------------------------------------
// Object Page
// ---------------------------------------------------------------------------
annotate srv.Practitioners with @(
  UI :{
    HeaderInfo: {
        Title: { Value: LastName },
        Description: { Value: SubDisciplineTxt },
        TypeName: 'Practitioner',
        TypeNamePlural: 'Practitioners'
    },
    Facets: [{
        $Type:'UI.CollectionFacet',
        Facets: [
          { $Type: 'UI.ReferenceFacet', Label: 'General Info',  Target: '@UI.FieldGroup#GeneralInfo' }
        ],
        Label:'General Details',
      }
    ],
    FieldGroup #GeneralInfo: {
      Label: 'General Info',
      Data: [
        {$Type: 'UI.DataField', Value: Title},
        {$Type: 'UI.DataField', Value: FirstName},
        {$Type: 'UI.DataField', Value: LastName},
        {$Type: 'UI.DataField', Value: PracticeNo}
      ]
    }
  }
);