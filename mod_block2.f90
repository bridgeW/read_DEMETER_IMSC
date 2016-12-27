module block2
    
! Orbital and geomagnetic parameters
! Waveform of the ELF Magnetic field (APID 1135)

use datatype
implicit none


!> Orbital parameters
! Geomagnetic latitude (-90, +90)degree
! 4-BYTE REAL number
integer, parameter :: B201 = 1
! Geomagnetic latitude (0, +360)degree
! 4-BYTE REAL number
integer, parameter :: B202 = B201
! Altitude, Unit: km
! 4-BYTE REAL number
integer, parameter :: B203 = B201
! Local time of the first point of the data array (0,24h) 
! 4-BYTE REAL number, Unit: hour
integer, parameter :: B204 = B201

!> Geomagnetic parameters
! Geomagnetic latitude (-90, +90)degree
! 4-BYTE REAL number
integer, parameter :: B205 = B201
! Geomagnetic latitude (0, +360)degree
! 4-BYTE REAL number
integer, parameter :: B206 = B201
! Magnetic local time of the first point
! 4-BYTE REAL number, Unit: Hour
integer, parameter :: B207 = B201
! Invariant latitude, (-90, +90)degree
! 4-BYTE REAL number, Unit: degree
integer, parameter :: B208 = B201
! Mc IIwain parameter L (0, 999)
! 4-BYTE REAL number, Unit: none
integer, parameter :: B209 = B201
! Geocentric latitude of the conjugate point
! at the satellite altitude (-90, +90)
! 4-BYTE REAL number, Unit: degree
integer, parameter :: B210 = B201
! Geocentric longitude of the conjugate point
! at the satellite altitude (0, +360)
! 4-BYTE REAL number, Unit: degree
integer, parameter :: B211 = B201
! Geocentric latitude of North conjugate point
! at the 110km altitude (-90, +90)
! 4-BYTE REAL number, Unit: degree
integer, parameter :: B212 = B201
! Geocentric longitude of North conjugate point
! at the 110km altitude (0, +360)
! 4-BYTE REAL number, Unit: degree
integer, parameter :: B213 = B201
! Geocentric latitude of South conjugate point
! at the 110km altitude (-90, +90)
! 4-BYTE REAL number, Unit: degree
integer, parameter :: B214 = B201
! Geocentric longitude of South conjugate point
! at the 110km altitude (0, +360)
! 4-BYTE REAL number, Unit: degree
integer, parameter :: B215 = B201
! Components of the magnetic field model at the 
! satellite point (geographic coordinate system)
! 4-BYTE REAL array, Unit: nT
integer, parameter :: B216 = 3
! Proton gyrofrequency at satellite point
! 4-BYTE REAL number
integer, parameter :: B217 = B201

!> Solar parameters
! Solar position, Xs, Ys, Zs in the geographic coordinate system.
! 4-BYTE REAL array, Unit: none.
integer, parameter :: B218 = 3

!> Code version
! Version (edition number) of the software
! component: from 0 to 9.
! 1-BYTE INTEGER number.
integer, parameter :: B219 = B201
! Sub-version (revision number) of the software
! component: from 0 to 9.
! 1-BYTE INTEGER number.
integer, parameter :: B220 = B201


    !/* Block 2 parameters */
    !/* Orbital parameters */
    real(SP):: GeocentricLat,GeocentricLon,Alti,LTFirstPoint
    !/* Geomagnetic parameters */
    real(SP):: GeomagLat, GeomagLon, MagnetLTfirstPoint
    real(SP):: InvarLat, McIIwainL
    real(SP):: ConjGeocenLat, ConjGeocenLon
    real(SP):: NorthConjGeocenLat, NorthConjGeocenLon
    real(SP):: SouthConjGeocenLat, SouthConjGeocenLon
    real(SP),dimension(B216):: MagModel
    real(SP):: ProtonGyrofreq
    !/* Solar parameters */
    real(SP),dimension(B218):: SolarPos
    
    !/* 
        
    
end module block2
