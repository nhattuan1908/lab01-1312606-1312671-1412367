
--CAU 7

CONN BTVN_1/btvn1;

CREATE OR REPLACE FUNCTION CHI_TIEU_DU_AN(P_SCHEMA VARCHAR2, P_OBJ VARCHAR2)
RETURN VARCHAR2
AS
  PRAGMA AUTONOMOUS_TRANSACTION;
  USERNAME VARCHAR2(10);
  TEMP VARCHAR2(200);
BEGIN
  USERNAME := SYS_CONTEXT('USERENV', 'SESSION_USER');    
  SELECT MADA INTO TEMP
  FROM DU_AN
  WHERE TRUONGDA = USERNAME; 
  IF (TEMP = NULL)
  THEN
    RETURN '';
  END IF;
  
  TEMP := 'DUAN = ' || TEMP;
  RETURN TEMP;
  
  EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('No Data Found');
END CHI_TIEU_DU_AN;

BEGIN
  DBMS_RLS.ADD_POLICY (OBJECT_SCHEMA => 'KHANH_TOAN_2',
  OBJECT_NAME => 'CHI_TIEU',
  POLICY_NAME => 'p_CHI_TIEU',
  FUNCTION_SCHEMA => 'KHANH_TOAN_2',
  POLICY_FUNCTION => 'CHI_TIEU_DU_AN',
  STATEMENT_TYPES => 'SELECT, INSERT',
  UPDATE_CHECK => TRUE);
END;