#!/usr/bin/env python3
from time import sleep
import numpy as np

time, speed, temp, pos = np.loadtxt('input.dat', unpack=True)

# custom logic

if time<2:
  new_speed = time**2
  new_temp = temp
  lcontrol_temp = True
else:
  new_speed = speed
  new_temp = temp *0.5
  lcontrol_temp = False

with open('output.dat', 'w') as f:
  f.write(f"{new_speed} {new_temp} {lcontrol_temp}\n")

print("Waiting 1 second before next step...")
sleep(1)