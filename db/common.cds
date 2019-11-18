namespace common;

// ---------------------------------------------------------------------------------------------------------------------
// Define an ID field to be of type UUID (Universal Unique Identifier).
// Such a field is typically used as a key field and the UUID value is generated automatically.
// ---------------------------------------------------------------------------------------------------------------------
abstract entity Managed {
  key ID : UUID;
}

context EPM {
	type BusinessKey	: String(10);
	type DisciplineKey	: String(4);
	type PhoneT 		: String(30);
	type SString		: String(40);
	type MString		: String(60);
	type SDate			: Date;
} 