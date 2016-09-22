GPIO16=0
GPIO5=1
GPIO4=2
GPIO0=3
GPIO2=4
GPIO14=5
GPIO12=6
GPIO13=7
GPIO15=8
GPIO3=9
GPIO1=10
GPIO9=11
GPIO10=12

mode=gpio.mode
out=gpio.OUTPUT
--in=gpio.INPUT
low=gpio.LOW
high=gpio.HIGH

gpio.mode(0, gpio.OUTPUT)
gpio.mode(1, gpio.OUTPUT)
gpio.mode(2, gpio.OUTPUT)
gpio.mode(3, gpio.OUTPUT)
gpio.mode(4, gpio.OUTPUT)
gpio.mode(5, gpio.OUTPUT)
gpio.mode(6, gpio.OUTPUT)
gpio.mode(7, gpio.OUTPUT)
gpio.mode(8, gpio.OUTPUT)
--gpio.mode(9, gpio.OUTPUT)--GPIO3不能作为OUTPUT
--gpio.mode(10, gpio.OUTPUT)--GPIO1不能作为OUTPUT
--gpio.mode(11, gpio.OUTPUT)--GPIO9不能作为OUTPUT
--gpio.mode(12, gpio.OUTPUT)--GPIO10不能作为OUTPUT

gpio.write(0, low)
gpio.write(1, low)
gpio.write(2, low)
gpio.write(3, low)
gpio.write(4, low)
gpio.write(5, low)
gpio.write(6, low)
gpio.write(7, low)
gpio.write(8, low)