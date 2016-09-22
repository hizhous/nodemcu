dofile("i2c.lua")

local dev_addr=2

local read_type_bouth=0
local read_type_tmpr=1
local read_type_humi=2

function read_temp()
      write_reg(dev_addr,read_type_tmpr)
      local c=read_reg(dev_addr,5)
      return c
end

function read_humi()
      write_reg(dev_addr,read_type_humi)
      local c=read_reg(dev_addr,5)
      return c
end