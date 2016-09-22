p=print
p("Hello Nodemcu")

print("\n" .. "Heap is : " .. node.heap()/1024 .. " KB" .. "\n")

dofile("init_conf.lua")
--dofile("dht22.lua")

p("Chip ID : " .. node.chipid())
p("MAC : " .. wifi.sta.getmac())

p("connect to wifi : SSID="..SSID)

wifi.setmode(wifi.STATION)
wifi.sta.config(SSID,PWD)
wifi.sta.connect()

p()

function heap()
     print("\n" .. "Heap is : " .. node.heap()/1024 .. " KB" .. "\n")
end

function heapB()
     print("\n" .. "Heap is : " .. node.heap() .. " B" .. "\n")
end

function getTemp(pin)
    dofile("ds18b20-func.lua")
    local temp = getTemperature(pin)
    getTemperature=nil
    return temp
end

function showConnectStatus()

     local table_wifiStatus={
             "STATION_IDLE",
             "STATION_CONNECTING",
             "STATION_WRONG_PASSWORD",
             "STATION_NO_AP_FOUND",
             "STATION_CONNECT_FAIL",
             "STATION_GOT_IP"
      }

     local function changeWifiStatusFromIntToString(status)
          return table_wifiStatus[status + 1]
     end

     wifi_status=wifi.sta.status()
     p("wifi status is : " .. changeWifiStatusFromIntToString(wifi.sta.status()) .. "\n") 
     if( wifi_status == 5)
     then
           p(wifi.sta.getip())
           p("Connect to WIFI")
           heap()
           dofile("mqtt.lua")
           showConnectStatus=nil
     else
           tmr.alarm(2, 5000, 0, 
                 function() 
                       showConnectStatus()
                 end
          )
     end
end

--showConnectStatus()