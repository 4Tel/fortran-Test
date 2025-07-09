PROGRAM main
  USE mem, ONLY: init_mem_usage, print_mem_usage
  IMPLICIT NONE
  CALL init_mem_usage()
  CALL print_mem_usage()
END PROGRAM main
