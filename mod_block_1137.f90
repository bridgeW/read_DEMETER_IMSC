module block4_1137
!/* Experiment: IMSC physical values                     */ 
!/* Power spectrum of 1 component of the Magnetic field  */
!/* in the VLF range.   APIP = 1137                             */

use datatype
implicit none


!> Data Header
! Data type: "VLF MAGNETIC WAVEFORM".
! String length.
integer, parameter :: B401 = 21

! House-keepings and Status (see DR1).
! The dimension of 1-BYTE INTEGER array.
integer, parameter :: B402 = 32

! Data coordinate system: "Senesor ".
! String length.
integer, parameter :: B403 = 9

! Component name: "Bi ", i is the sensor number
! String length.
integer, parameter :: B404 = 3

! Data unit: "log(nT^2/Hz)   "
! String length.
integer, parameter :: B405 = 16

! Number of consecutive spectra (Nb): 2 or 8
! 1-byte INTEGER number
integer, parameter :: B406 = 1

! Number of spectrum frequencies(Nbf): 1024 or 256
! 2-byte INTEGER number
integer, parameter :: B407 = 1

! Total time duration of Nb spectra: 16.384, 4.096 or 1.024
! 4-Byte REAL number
integer, parameter :: B408 = 1

! Frequency resolution: 19.53125 or 78.125
! 4-Byte REAL number
integer, parameter :: B409 = 1

! Frequency range: [19.53125 or 78.125 ~ 20000]
! 4-Byte REAL array
integer, parameter :: B410 = 2

! UT time of the first spectrum as: year, month, day, hour,
! minute, second, millisecond
! 2-Byte Integer array
integer, parameter :: B411 = 7



!/* Block 4 variables */
!/* Data header */
character(len=B401)         ::  DType
integer(I1B),dimension(B402)::  HouseKeep
character(len=B403)         ::  DCoord
character(len=B404)         ::  component
character(len=B405)         ::  DUnit
integer(I1B)                ::  ConsecutiveSpectrNum
integer(I2B)                ::  SpectrFreqNum
real(SP)                    ::  TDuration
real(SP)                    ::  FreqResolution
real(SP),dimension(B410)    ::  FreqRange
integer(I2B),dimension(B411)::  UTime1Spectr

!/* Power Spectrum Data */
! REAL array's size is (Nb * Nbf, 1), Unit: log(nT^2/Hz)
real(SP),dimension(:,:),allocatable :: NbPowerSpectra


end module block4_1137
