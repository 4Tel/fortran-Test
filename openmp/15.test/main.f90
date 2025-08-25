MODULE m
  IMPLICIT NONE
  REAL, ALLOCATABLE :: a(:)
!$omp threadprivate(a)
END MODULE

PROGRAM p
  USE m
  INTEGER :: n
  n = 100000
  ALLOCATE (a(n)); a = 1.0      ! 마스터에서 한 번만 준비

!$omp parallel
  IF (.NOT. ALLOCATED(a)) WRITE (*, *) 1
  ! 여기서부터 각 스레드의 a가 "할당됨 + 값=1.0"
  a = a + 1.0
!$omp end parallel

  ! 필요 시 해제: 병렬 밖에서 deallocate하면 마스터 복사본만 해제됨
  ! 모든 스레드에서 해제하려면 병렬 안에서:
!$omp parallel
  IF (ALLOCATED(a)) DEALLOCATE (a)
!$omp end parallel
END PROGRAM
