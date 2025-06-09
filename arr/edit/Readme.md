# Result
## Output
```
 ---------------------------------------------
 Array size:  1000000000
 Array initialization and assignment performance test
 ---------------------------------------------
 Initializing to zero
 CPU time   :    3.220102    
 Wall time  :    3.228000    
 
 Set value to one
 CPU time   :   0.8413069    
 Wall time  :   0.8434000    
 
 Set value to 100
 CPU time   :   0.4539828    
 Wall time  :   0.4551000    
 
 Set partial value using a subroutine
 CPU time   :   1.9073486E-06
 Wall time  :   0.0000000E+00
 
 Partial write test result
 Partial write test passed
 ```

## Analysis
### Initialization
* No cached values
* No initialized
* Initialization to zero is the slowest operation, as expected.
### Assignment to 1
* No cached values
* initialized
* Assignment to 1 is faster than initialization to zero, as expected.
### Assignment to 100
* cached values
* initialized
* Assignment to 100 is faster than assignment to 1, as expected.
### Partial write
* Very fast.
* Unchanged values are not written.
* Subroutine call is fast, as expected.
* `INTENT(OUT)` is good for performance.
