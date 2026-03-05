SELECT * FROM dept_tcl;
UPDATE dept_tcl
   SET loc = 'SEOUL'
 WHERE deptno =60; 

 INSERT INTO dept_tcl (deptno, dname, loc)
VALUES (90, 'TEST', 'DELI');
