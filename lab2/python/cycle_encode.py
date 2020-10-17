#!/usr/bin/env python3
from ev3dev.ev3 import *

import time

motorD = LargeMotor('outD')


for i in range(-100, 110, 10):
    timeStart = time.time()
    motorD.position = 0
    data = open('log' + str(i) + '.txt', 'w')
    while True:



        timeNow = time.time() - timeStart
        motorD.run_direct(duty_cycle_sp = i)
        data.write(str(motorD.position) + ' ' + str(timeNow) + '\n')
        if timeNow > 1:
            motorD.run_direct(duty_cycle_sp = 0)
            motorD.stop()
            time.sleep(2)
            break
