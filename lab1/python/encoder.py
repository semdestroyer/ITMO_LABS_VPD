#!/usr/bin/env python3
from ev3dev.ev3 import *
import time
data = open('log.txt','w')
motorD = LargeMotor('outD')
timeStart = time.time()
motorD.position = 0
while True:
    timeNow = time.time() - timeStart
    motorD.run_direct(duty_cycle_sp = -100)
    data.write(str(motorD.position) + ' ' + str(timeNow) + '\n')
    if timeNow > 1:
        motorD.run_direct(duty_cycle_sp = 0)
        break