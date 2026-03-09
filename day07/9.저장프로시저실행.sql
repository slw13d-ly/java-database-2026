-- out 파라미터 저장 프로시저 실행
DECLARE 
	v_empno emp.empno%TYPE;
	v_ename emp.ename%TYPE;
BEGIN 
	v_ename := 7844;
	prc_inoutparam(v_empno, v_ename)

	DBMS_OUTPUT.PUT_LINE('v_empno = ' || v_empno);
	DBMS_OUTPUT.PUT_LINE('v_ename = ' || v_ename);
END;