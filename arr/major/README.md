# Column-major array access performance in Fortran
* use `arr(jdx, idx)` instead of `arr(idx, jdx)` for better performance
* idx is outer loop variable
* jdx is inner loop variable

 ---------------------------------------------
 Array size:                 30000
 array assignment performance test
 ---------------------------------------------
 arr = 1
 CPU time   :    2.336579    
 Wall time  :    2.342300    
 
 ---------------------------------------------
 s = SUM(arr)
 ---------------------------------------------
 CPU time   :    3.556213    
 Wall time  :    3.564900    
 
 ---------------------------------------------
 s += SUM(arr(:, jdx))
 ---------------------------------------------
 CPU time   :   0.3725972    
 Wall time  :   0.3735000    
 
 ---------------------------------------------
 s += SUM(arr(jdx, :))
 ---------------------------------------------
 CPU time   :    13.45665    
 Wall time  :    13.48960    
 
 ---------------------------------------------
 s += arr(idx, jdx)
 ---------------------------------------------
 CPU time   :    14.07375    
 Wall time  :    14.10850    
 
 ---------------------------------------------
 s += arr(jdx, idx)
 ---------------------------------------------
 CPU time   :    6.125080    
 Wall time  :    6.140000    