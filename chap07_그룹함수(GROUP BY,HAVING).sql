
-- 집계함수 AVG, MAX, MIN, SUM, COUNT
-- 여러 행을 묶어서 한 번에 함수를 적용
-- 그룹화를 따로 하지 않으면 그룹은 테이블 전체가 됩니다.
SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; -- 총 행의 데이터 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; -- null이 아닌 행의 수
SELECT COUNT(manager_id) FROM employees; -- null은 카운팅되지 않습니다.


-- 부서별로 그룹화, 집계함수 사용
SELECT
    department_id,
    AVG(salary),
    COUNT(*)
FROM employees
GROUP BY department_id;


-- 그룹 함수는 단독적으로 사용할 때는 테이블 전체가 그룹의 대상이 되지만
-- 일반 컬럼과 동시에 출력할 수 없습니다. 일반 컬럼을 그룹화 해야 합니다.
SELECT
    department_id,
    AVG(salary),
    COUNT(*)
FROM employees; -- 에러

-- GROUP BY절을 사용할 때 GROUP절에 묶이지 않은 컬럼은 조회할 수 없습니다.
SELECT
    job_id,
    department_id,
    AVG(salary),
    COUNT(*)
FROM employees
GROUP BY department_id; --에러


-- GROUP BY절 2개 이상 사용
SELECT
    job_id,
    department_id,
    AVG(salary),
    COUNT(*)
FROM employees
GROUP BY department_id, job_id;

-- GROUP BY를 통해 그룹화 할 때, 조건을 지정할 경우 HAVING을 사용.
-- WHERE은 일반 조건절. GROUP BY보다 먼저 진행됩니다.
SELECT
    department_id,
    SUM(salary),
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;


-- 부서 아이디가 50 이상인 것들을 그룹화 시키고, 
-- 그룹 급여 평균이 5000 이상만 조회

SELECT
    department_id,
    AVG(salary) AS 평균급여
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY 평균급여 DESC;
