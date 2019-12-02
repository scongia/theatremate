const cds = require('@sap/cds')
module.exports = (srv) => {

  srv.before ('POST', 'Practitioners', each => {
    console.log("------->" , each)
  })

}