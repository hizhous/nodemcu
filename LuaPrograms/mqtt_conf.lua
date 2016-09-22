-- Configuration to connect to the MQTT broker.

BROKER = "192.168.137.1"   -- Ip/hostname of MQTT broker
BRPORT = 1874             -- MQTT broker port
BRUSER = "hi_Zhous"           -- If MQTT authenitcation is used then define the user
BRPWD  = "zhouswifi"            -- The above user password


--BROKER = "192.168.12.1"   -- Ip/hostname of MQTT broker
--BRPORT = 1874           -- MQTT broker port
--BRUSER = "pi"           -- If MQTT authenitcation is used then define the user
--BRPWD  = "88888888"            -- The above user password

CLIENTID="mcu_white"

Mcu_Topics={"mcu",CLIENTID}
