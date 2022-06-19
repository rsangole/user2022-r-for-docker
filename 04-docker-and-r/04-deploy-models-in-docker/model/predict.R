#* @param cyl cylinders
#* @param disp displacement
#* @param hp horsepower
#* @post /predict
function(req, cyl = 4, disp = 100, hp = 120) {

  message(sprintf("Running prediction function with {cyl: %s, disp: %s, hp: %s}",
  cyl, disp, hp))

  newdata <- data.frame(
                        cyl = as.numeric(cyl),
                        disp = as.numeric(disp),
                        hp = as.numeric(hp)
                        )  

  predict(lm_model, newdata)
}