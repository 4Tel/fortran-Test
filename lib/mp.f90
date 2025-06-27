MODULE mp
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  PRIVATE
  !
  INTEGER, PUBLIC::rank
  INTEGER, PUBLIC::mp_size
  INTEGER, PUBLIC::ierr
  PUBLIC:: mp_start, mp_end, mp_bcast

  INTERFACE mp_bcast
    MODULE PROCEDURE r1_bcast, rv_bcast
  END INTERFACE
CONTAINS
  SUBROUTINE mp_start()
    CALL MPI_INIT(ierr)
    CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
    CALL MPI_COMM_SIZE(MPI_COMM_WORLD, mp_size, ierr)
  END SUBROUTINE mp_start
  !
  SUBROUTINE mp_end()
    CALL MPI_FINALIZE(ierr)
  END SUBROUTINE mp_end
  ! ==================================================
  SUBROUTINE bcast_real(msg, msglen)
    INTEGER, INTENT(IN)::msglen
    REAL::msg(msglen)
    CALL mpi_barrier(MPI_COMM_WORLD, ierr)
    CALL MPI_BCAST(msg, msglen, MPI_REAL, 0, MPI_COMM_WORLD, ierr)
  END SUBROUTINE bcast_real
  ! ==================================================
  SUBROUTINE r1_bcast(msg)
    REAL :: msg
    CALL bcast_real(msg, 1)
  END SUBROUTINE r1_bcast
  !
  SUBROUTINE rv_bcast(msg)
    REAL::msg(:)
    INTEGER:: msglen
    msglen = SIZE(msg)
    CALL bcast_real(msg, msglen)
  END SUBROUTINE rv_bcast
END MODULE mp
