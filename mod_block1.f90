module block1

! General header
! Waveform of the ELF Magnetic field (APID 1135)

use datatype
implicit none


!> Standard CCSDS date
! P field (demimal value=76)
! 1-BYTE INTEGER number.
integer, parameter :: B101 = 1
! Number of days from 01/01/1950.
! 3-BYTE INTEGER number.
integer, parameter :: B102 = 1
! Number of milliseconds in the day.
! 4-BYTE INTEGER number.
integer, parameter :: B103 = 1


!> Time and orbit information
! UT time of the first point of the data array as: year, month,
! day, hour, minute, second, millisecond (year as 20xx).
! 2-BYTE INTEGER array.
integer, parameter :: B104 = 7
! Obrit number
! 2-BYTE INTEGER number.
integer, parameter :: B105 = 1
! Sub-orbit type: 0: downward
!				  1: upward
! 2-BYTE INTEGER number.
integer, parameter :: B106 = 1
! Telemetry station: "TOULOUSE"
! String lenth.
integer, parameter :: B107 = 8


!> Code and calibration version
! Version (edition number) of the processing software: from
! 0 to 9.
! 1-BYTE INTEGER number.
integer, parameter :: B108 = 1
! Sub-version (revision number) of the processing software: from
! 0 to 9.
! 1-BYTE INTEGER number.
integer, parameter :: B109 = 1
! Version (edition number) of the calibration file: from 0 to 9.
! 1-BYTE INTEGER number.
integer, parameter :: B110 = 1
! Sub-version (revision number) of the processing software: from
! 0 to 63.
! 1-BYTE INTEGER number.
integer, parameter :: B111 = 1

    !/* Block 1 parameters */
    !/* Standard CCSDS date */
    integer(I1B) :: pField = 0
    integer(I4B) :: nDateFrom1950 = 0
    integer(I4B) :: nMillisecond = 0, iTemp
    
    !/* Time and orbit information
    integer(I2B), dimension(B104) :: UTfirstPoint = 0
    integer(I2B) :: nOrbit = 0, subOrbit = 0
    character(len=B107) :: TelemetryStation
    
end module block1
