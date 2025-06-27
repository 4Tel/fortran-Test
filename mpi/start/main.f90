PROGRAM main
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  INTEGER::ierr, rank, size

  ! Start MPI
  CALL MPI_INIT(ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierr)

  ! Print.
  IF (rank == 0) THEN
    WRITE (*, *) "There are total ", size, " processors."
  END IF
  CALL mpi_barrier(MPI_COMM_WORLD, ierr)
  WRITE (*, "(t4,a,i1,a)") "from ", rank, "th processor: Hello World!"

  ! End MPI.
  CALL MPI_FINALIZE(ierr)

END PROGRAM main
