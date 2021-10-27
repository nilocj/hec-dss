      SUBROUTINE zrrts ( IFLTAB, CPATH, CDATE, CTIME, NVALS, SVALUES,
     * CUNITS, CTYPE, IOFSET, ISTAT)
C
C     Short version for retrieving regular interval time series data
C
      implicit none
C
C
      INTEGER IFLTAB(*),zdssVersion
      CHARACTER CPATH*(*), CDATE*(*), CTIME*(*), CUNITS*(*), CTYPE*(*)
      REAL SVALUES(*)
      DOUBLE PRECISION DVALUES(1)
      INTEGER NVALS, NUHEAD, ISTAT, IOFSET
      INTEGER JQUAL(1), IUHEAD(1)
      LOGICAL LQUAL
C
      INTEGER KVALS, JCOMP, KUHEAD
      LOGICAL LFILDOB, LQREAD
C
      real COORDS(1)
      LOGICAL LCOORDS
      INTEGER ICDESC(1)
C
C
      LQUAL = .FALSE.
      KUHEAD = 0
      KVALS = NVALS
      LCOORDS = .FALSE.
C
      IF (zdssVersion(IFLTAB).EQ.6) THEN
         CALL zrrtsi6(IFLTAB, CPATH, CDATE, CTIME, KVALS, NVALS,
     *      .FALSE., LFILDOB, SVALUES, DVALUES, JQUAL, LQUAL, LQREAD,
     *      CUNITS, CTYPE, IUHEAD, KUHEAD, NUHEAD, IOFSET, JCOMP,
     *      COORDS, ICDESC, LCOORDS, ISTAT)
      ELSE
           call zrrtsi7 (IFLTAB, CPATH, CDATE, CTIME, KVALS, NVALS,
     *      .FALSE., LFILDOB, SVALUES, DVALUES, JQUAL, LQUAL, LQREAD,
     *      CUNITS, CTYPE, IUHEAD, KUHEAD, NUHEAD, IOFSET,
     *      JCOMP, COORDS, ICDESC, LCOORDS, ISTAT)
      ENDIF
C
C
      RETURN
      END
