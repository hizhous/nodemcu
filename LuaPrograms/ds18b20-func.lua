function getTemperature(pin)
 
 if (pin == nil) then return end
 
 t = require("ds18b20")

 t.setup(pin)

 local temp = t.read()
 t = nil
 ds18b20 = nil
 package.loaded["ds18b20"]=nil

 return temp
end
