module block4_1135

! Waveform of 3 components of the Magnetic field in the ELF range.
! This module is to give the format of block4 (APID 1135)
    
use datatype
implicit none


!> Data Header
! Data type: "ELF MAGNETIC WAVEFORM".
! String length.
integer, parameter :: B401 = 21
! House-keepings and Status (see DR1).
! The dimension of 1-BYTE INTEGER array.
integer, parameter :: B402 = 32
! Data coordinate system: "Senesor ", "Satellite" or "B0field ".
! String length.
integer, parameter :: B403 = 9
! M_sen2sat: Matrix from sensor coordinate system to satellite
! coordinate system.
! The dimension of 4-BYTE REAL array.
integer, parameter :: B404 = 9
! Data unit: "nT             "
! String length.
integer, parameter :: B405 = 16
! Sampling frequency: "2500."
! 4-byte REAL number. Unit: Hz
integer, parameter :: B406 = 1
! Sample data number per component: 4096
! 2-BYTE INTEGER number
integer, parameter :: B407 = 1
! The duration of one data array: 4096/2500.
! 4-BYTE REAL number. Unit: s
integer, parameter :: B408 = 1


!> First component waveform
! First component name: "B1" in sensor coordinate system,
!						"Bx" in the other coordinate systems.
! String length.
integer, parameter :: B409 = 3
! Waveform sample array of the first component.
! The dimension of 4-BYTE REAL array, Unit: nT
integer, parameter :: B410 = 4096


!> Second component waveform
! Second component name: "B2" in sensor coordinate system,
!						 "By" in the other coordinate systems.
! String length.
integer, parameter :: B411 = 3
! Waveform sample array of the second component.
! The dimension of 4-BYTE REAL array, Unit: nT
integer, parameter :: B412 = 4096


!> Third component waveform
! Second component name: "B3" in sensor coordinate system,
!						 "Bz" in the other coordinate systems.
! String length.
integer, parameter :: B413 = 3
! Waveform sample array of the third component.
! The dimension of 4-BYTE REAL array, Unit: nT
integer, parameter :: B414 = 4096


!/* Block 4 variables */
!/* Data header */
character(len=B401)         ::  DType
integer(I1B),dimension(B402)::  HouseKeep
character(len=B403)          ::  DCoord
real(SP),dimension(B404)    ::  Msen2sat
character(len=B405)         ::  DUnit
real(SP)                    ::  SampFreq
integer(I2B)                ::  SampNum
real(SP)                    ::  TDuration

!/* First component waveform */
character(len=B409)         ::  component1
real(SP),dimension(B410)    ::  Waveform1
!/* Second component waveform */
character(len=B411)         ::  component2
real(SP),dimension(B412)    ::  Waveform2
!/* Third component waveform */
character(len=B413)         ::  component3
real(SP),dimension(B414)    ::  Waveform3



end module block4_1135
