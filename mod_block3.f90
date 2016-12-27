module block3

! Attitude parameters
! Waveform of the ELF Magnetic field (APID 1135)

use datatype
implicit none

!> Attitude parameters
! M_sat2geo: Matrix from satellite coordinate system 
! to geographic coordinate system.
! 4-BYTE REAL array
integer, parameter :: B301 = 9
! M_geo2lgm: Matrix from geographic coordinate system 
! to local geomagnetic coordinate system.
! 4-BYTE REAL array
integer, parameter :: B302 = 9
! Quality index of attitude parameters
integer, parameter :: B303 = 1

!> Code version
! Version (edition number) of the software
! component: from 0 to 9.
! 1-BYTE INTEGER number.
integer, parameter :: B304 = 1
! Sub-version (revision number) of the software
! component: from 0 to 9.
! 1-BYTE INTEGER number.
integer, parameter :: B305 = 1


!/* Attitude parameters */
real(SP),dimension(B301):: Msat2geo, Mgeo2lgm
integer(I2B):: Quality


end module block3
