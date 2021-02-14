SELECT ACCOUNTING.EMPLOYEE_ID AS EMPLOYEE_ID,
	EMPLOYEE.EMPLOYEE_NAME AS EMPLOYEE_NAME,
	ALLOCATED.HOURS_ALLOCATED,
	SUM(ACCOUNTING.HOURS_DONE) AS HOURS_SPENT,
	ALLOCATED.HOURS_ALLOCATED - SUM(ACCOUNTING.HOURS_DONE) AS ALLOWANCE
FROM PUBLIC.ACCOUNTING ACCOUNTING
INNER JOIN
				(SELECT EMPLOYEE_NAME,
						EMPLOYEE_ID
					FROM PUBLIC.EMPLOYEES GROUP
            BY EMPLOYEE_ID) EMPLOYEE ON EMPLOYEE.EMPLOYEE_ID = ACCOUNTING.EMPLOYEE_ID
INNER JOIN
				(SELECT HOURS_ALLOCATED,
						EMPLOYEE_ID
					FROM PUBLIC.ALLOCATION GROUP
	  BY EMPLOYEE_ID,
						HOURS_ALLOCATED) ALLOCATED ON ALLOCATED.EMPLOYEE_ID = ACCOUNTING.EMPLOYEE_ID GROUP
    BY ACCOUNTING.EMPLOYEE_ID,
	EMPLOYEE_NAME,
	ALLOCATED.HOURS_ALLOCATED
ORDER
	BY EMPLOYEE_NAME ASC 
	