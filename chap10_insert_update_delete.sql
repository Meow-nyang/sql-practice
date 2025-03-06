
-- INSERT
-- 테이블 구조 확인
DESC departments;

-- INSERT의 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정해서 삽입)


-- 에러 -> 컬럼을 지정하지 않고 값만 주는 경우에는 모든 값을 다줘야 한다.
INSERT INTO departments
VALUES(301, '영업부');

SELECT * FROM departments;

-- INSERT의 두번재 방법 (직접 컬럼을 지정해서 저장, NOT NULL 컬럼 확인!)
INSERT INTO departments
    (department_id, department_name)
VALUES
    (301, 101); -- 에러
    
ROLLBACK; --실행 시점을 다시 뒤로 되돌리는 키워드.


-- 사본 테이블 생성
-- 사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE절에 false(1=2)를 주면 -> 테이블의 구조만 복사되고 데이터는 복사 X
-- 제약조건은 복사되지 않습니다.
CREATE TABLE emps2 AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM emps;
DROP TABLE emps2;

-- INSERT (서브쿼리)

INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);



-----------------------------------------------------------------------

-- UPDATE
-- UPDATE 테이블이름 SET 컬럼=값 ..... WHERE 누구를 수정할지(조건)
UPDATE emps
SET first_name = '춘식이'; -- 조건 지정 안하면 대상이 테이블 전체가 됨!
ROLLBACK;

UPDATE emps
SET first_name = '춘식이'
WHERE employee_id = 100;



UPDATE emps
SET 
    first_name = '야옹이',
    job_id = '백수',
    hire_date = sysdate
WHERE employee_id = 100;

SELECT * FROM emps;

-- UPDATE 서브쿼리
UPDATE emps
SET (job_id, hire_date) = 
    (
    SELECT
        job_id, hire_date
    FROM emps
    WHERE employee_id = 100
    )
WHERE employee_id = 101;


--------------------------------------------------


-- DELETE
-- DELETE도 WHERE 지정하지 않으면 테이블 전체 행이 대상이 됩니다.
DELETE FROM emps
WHERE employee_id = 101;

-- DELETE (서브쿼리)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'IT');

