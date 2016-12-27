module block4_1136
!/* Experiment: IMSC physical values                     */ 
!/* Waveform of 1 component of the Magnetic field in the */
!/* VLF range.   APIP = 1136                             */

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


! Data unit: "nT             "
! String length.
integer, parameter :: B404 = 16

! Sampling frequency: "40000."
! 4-byte REAL number. Unit: Hz
integer, parameter :: B405 = 1

! Sample data number per component: 8192
! 2-BYTE INTEGER number
integer, parameter :: B406 = 1

! The duration of one data array: 8192/40000.
! 4-BYTE REAL number. Unit: s
integer, parameter :: B407 = 1


!> Waveform Data
! Component name: "Bi", is is the sensor number.
! String length.
integer, parameter :: B408 = 3

! Waveform sample array
! The dimension of 4-BYTE REAL array, Unit: nT
integer, parameter :: B409 = 8192



!/* Block 4 variables */
!/* Data header */
character(len=B401)         ::  DType
integer(I1B),dimension(B402)::  HouseKeep
character(len=B403)         ::  DCoord
character(len=B404)         ::  DUnit
real(SP)                    ::  SampFreq
integer(I2B)                ::  SampNum
real(SP)                    ::  TDuration

!/* Component name */
character(len=B408)         ::  component
real(SP),dimension(B409)    ::  Waveform


end module block4_1136
