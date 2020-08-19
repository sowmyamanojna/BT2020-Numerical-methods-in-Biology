import numpy as np
import math

def factorial(n):
	fact = 1
	for i in range(1,n+1):
		fact *= i
	return fact


summation = 1
for i in range(1,7):
	val = (-1)**i * (math.pi/3)**(2*i) / factorial(2*i)
	summation += val
	print "val: ", val
	print "summation: ", summation

print "Final summation: ", summation