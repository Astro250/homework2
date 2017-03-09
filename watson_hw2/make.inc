.SUFFIXES : .o .f90


F90=ftn
OFLAGS = -O3
OFLAGS = -g -C

#
# Remember to: module load ipm
# in order to be able to compile with the profiler
# Also doing a: export IPM_REPORT=full
# is useful for a full report
#
IPM=-L/usr/common/software/ipm/2.0.5/intel/lib -lipmf -lipm
IPM=
