dofile("mqtt_conf.lua")
pinConnect=0
pinLight=1
gpio.mode(pinConnect, gpio.OUTPUT)
gpio.mode(pinLight, gpio.OUTPUT)
gpio.write(pinLight, gpio.LOW)

print "Connecting to MQTT broker. Please wait..."
--m=mqtt.Client(CLIENTID,120,BRUSER,BRPWD)
m=mqtt.Client()

m:connect(BROKER,BRPORT,0,function(conn)
     print("Connected to MQTT:" .. BROKER .. ":" .. BRPORT .. " as " .. CLIENTID)
     gpio.write(pinConnect, gpio.LOW)
     m:on("message",on_message)
     m:on("offline", function(con) 
                  print ("mcu connect offline")
                  m:close() 
                  m=nil
                  print("release mqtt")
                  gpio.write(pinConnect, gpio.HIGH)
            end)
     heap()
     subscribe_topics()
end)

current_topic=1
function subscribe_topics()
     if table.getn(Mcu_Topics) < current_topic then
          --run_main_prog()
          print("subscribe end")
     else
          m:subscribe(Mcu_Topics[current_topic],0,function(conn) print("subscribe topic " .. Mcu_Topics[current_topic -1]) end)
          current_topic=current_topic+1
          tmr.alarm(5, 50, 0, subscribe_topics )
     end
end

function on_message(conn, topic, data)
     print(topic .. " : " .. data )
     if(topic == "mcu" or topic == CLIENTID)then
          print("topic " .. topic)
          if(data == "on")then
                 print("data on")
                 gpio.write(pinLight,gpio.HIGH)
          elseif(data == "off") then
                 print("data off")
                 gpio.write(pinLight,gpio.LOW)
          elseif(data == "switch")then
                 print("data switch")
                 local isLightOn=gpio.read(pinLight)
                 local changeLight=(isLightOn==gpio.HIGH)  and gpio.LOW or gpio.HIGH
                 gpio.write(pinLight,changeLight)
          else
                 print("data unknow " .. data)
          end
     else 
          print("topic unknow " .. topic)
     end
end

function pub(topic,msg)
     m:publish(topic,msg,0,0,function(conn) print("publish message : " .. topic .. " : " .. msg) end )
end
