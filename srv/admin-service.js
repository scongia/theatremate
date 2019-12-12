const cds = require('@sap/cds')
module.exports = (srv) => {

  const BusinessPartners = cds.entities['com.persons.db.BusinessPartners']

  srv.on ('UPDATE', 'Practitioners', async (req) => {
    const tx = cds.transaction(req)
    const practitioner = req.data
    const affectedRows = await tx.run(
      UPDATE (BusinessPartners)
        .set    ({ Email: practitioner.Email})
        .where  ({ ID: practitioner.BusinessPartner_ID})
    )
    if( affectedRows === 0 ) req.error(409, "No Update")
  })

}