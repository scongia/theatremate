const cds = require('@sap/cds')
module.exports['AdminService'] = cds.service.impl (async (srv) => {

    const AdminService = await cds.connect.to ('AdminService')
    const { Practitioners } = AdminService.entities

    // delegate requests to reviews service
    srv.on('READ', 'Practitioners', async (req) => {
        const { SELECT } = cds.ql(req)
        const results = await SELECT.from (Practitioners)

        console.debug ('lajfsl;dkfjsalkdjfa;lkdsfj;alkj')

        // TODO: Should actually be using .where of fluent query API
        // if (req.query.SELECT.where) {
        //     return results.filter (row => row.subject === req.query.SELECT.where[2].val)
        // }

        return results
    })



})