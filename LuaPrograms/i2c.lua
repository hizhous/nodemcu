local id=0
local sda=1
local scl=2

    -- 初始化i2c, 将pin1设置为sda, 将pin2设置为scl
i2c.setup(id,sda,scl,i2c.SLOW)

    -- 用户定义函数:读取地址dev_addr的寄存器reg_addr中的内容。
function read_reg(dev_addr,len)
      i2c.start(id)
      i2c.address(id, dev_addr,i2c.RECEIVER)
      local c=i2c.read(id,len)
      i2c.stop(id)
      return c
end

function write_reg(dev_addr,reg_addr)
      i2c.start(id)
      i2c.address(id, dev_addr ,i2c.TRANSMITTER)
      i2c.write(id,reg_addr)
      i2c.stop(id)
end

    -- 读取0x77的寄存器0xAA中的内容。
    --reg = read_reg(0x77, 33)
    --print(string.byte(reg))