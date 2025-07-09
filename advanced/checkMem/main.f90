PROGRAM main
  USE mem, ONLY: usages, update_mem_usage
  IMPLICIT NONE
  INTEGER::size
  INTEGER::tmp
  INTEGER::incr
  REAL::expected
  REAL, ALLOCATABLE::arr(:)
  WRITE (*, *) "=================================================="
  WRITE (*, *) "Memory usage before allocation:"
  CALL update_mem_usage()
  tmp = usages%ru_maxrss
  !
  WRITE (*, *) "=================================================="
  size = 1000000
  WRITE (*, *) "Allocating real numbers of", size
  ALLOCATE (arr(size))
  CALL update_mem_usage()
  !
  WRITE (*, *) "=================================================="
  WRITE (*, *) "Initilize Array"
  arr = 0
  CALL update_mem_usage()
  incr = usages%ru_maxrss - tmp
  !
  WRITE (*, *) "=================================================="
  DEALLOCATE (arr)
  WRITE (*, *) "Deallocate Array"
  CALL update_mem_usage()
  !
  WRITE (*, *) "=================================================="
  WRITE (*, *) "Expected increase in memory usage: ", size*4/1024, " KB"
  WRITE (*, *) "Actual increase in memory usage: ", incr, " KB"
END PROGRAM main
