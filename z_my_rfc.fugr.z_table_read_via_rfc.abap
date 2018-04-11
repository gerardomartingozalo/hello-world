FUNCTION Z_TABLE_READ_VIA_RFC.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(ID_TABNAME) TYPE  TABNAME
*"  EXPORTING
*"     VALUE(ED_XSTRING) TYPE  XSTRING
*"  EXCEPTIONS
*"      SYSTEM_FAILURE
*"      COMMUNICATION_FAILURE
*"      ERROR
*"----------------------------------------------------------------------



  DATA: ldo_data   TYPE REF TO data.
  FIELD-SYMBOLS: <lt_itab>    TYPE table.

  CREATE DATA ldo_data TYPE TABLE OF (id_tabname).
  ASSIGN ldo_data->* TO <lt_itab>.

  SELECT * FROM (id_tabname)
    INTO CORRESPONDING FIELDS OF TABLE <lt_itab>.

  CALL TRANSFORMATION id_indent
    SOURCE itab = <lt_itab>
    RESULT XML ed_xstring.




ENDFUNCTION.
