const cds = require('@sap/cds')
module.exports = (srv) => {

  srv.on ('PUT', 'AdminService.Practitioners', each => {
    console.log("------->" , each)
  })

}