C     Vertical Datums
      CHARACTER*16 CVDATUM    ! current default vertical datum (char)
      CHARACTER*16 CVD_UNSET  ! UNSET   vertical datum (char)
      CHARACTER*16 CVD_NAVD88 ! NAVD-88 vertical datum (char)
      CHARACTER*16 CVD_NGVD29 ! NGVD-20 vertical datum (char)
      CHARACTER*16 CVD_OTHER  ! OTHER   vertical datum (char)
      CHARACTER*16 CVD_LOCAL  ! LOCAL   vertical datum (char) [SAME AS OTHER]
      INTEGER IVD_UNSET       ! UNSET   vertical datum (int)
      INTEGER IVD_NAVD88      ! NAVD-88 vertical datum (int)
      INTEGER IVD_NGVD29      ! NGVD-20 vertical datum (int)
      INTEGER IVD_OTHER       ! OTHER   vertical datum (int)
      INTEGER IVD_LOCAL       ! OTHER   vertical datum (int) [SAME AS OTHER]
      DOUBLE PRECISION UNDEFINED_VERTICAL_DATUM_VALUE
      CHARACTER*17 VERTICAL_DATUM_INFO_PARAM 
      COMMON /VERTICAL_DATUM/ 
     *        CVDATUM, 
     *        CVD_UNSET, 
     *        CVD_NAVD88,
     *        CVD_NGVD29, 
     *        CVD_OTHER, 
     *        CVD_LOCAL,
     *        IVDATUM, 
     *        IVD_UNSET, 
     *        IVD_NAVD88, 
     *        IVD_NGVD29, 
     *        IVD_OTHER,
     *        IVD_LOCAL,
     *        UNDEFINED_VERTICAL_DATUM_VALUE,
     *        VERTICAL_DATUM_INFO_PARAM
