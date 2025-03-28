const invModel = require("../models/inventory-model")
const utilities = require("../utilities/")

const invCont = {}

/* ***************************
 *  Build inventory by classification view
 * ************************** */
invCont.buildByClassificationId = async function (req, res, next) {
  const classification_id = req.params.classificationId
  const data = await invModel.getInventoryByClassificationId(classification_id)
  //console.log(data);
  const grid = await utilities.buildClassificationGrid(data)
  let nav = await utilities.getNav()
  const className = data[0].classification_name
  res.render("./inventory/classification", {
    title: className + " vehicles",
    nav,
    grid,
  })
}

/* ***************************
 *  Get Vehicle details
 * ************************** */
invCont.getVehicleDetails = async function (req, res, next)  {
  const inv_id = req.params.invId
  console.log("INVENTORY ID: ", inv_id);
  const vehicle = await invModel.getVehicleDetails(inv_id)
  console.log("DETAILS OF VEHICLE: ", vehicle);
  let nav = await utilities.getNav()
  res.render("./inventory/detail", {
    title: `${vehicle.inv_make} ${vehicle.inv_model}`,
    nav,
    vehicle,
    utilities,
  })
}



module.exports = invCont