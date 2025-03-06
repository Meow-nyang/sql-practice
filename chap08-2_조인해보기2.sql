
-- 이너(내부) 조인
SELECT 
    e.first_name,
    e.department_id,
    d.department_name
FROM employees e 
JOIN departments d -- JOIN이라고만 써도 INNER JOIN 
ON e.department_id = d.department_id
WHERE e.department_id = 50;


-- 아우터(외부) 조인
SELECT 
    e.first_name,
    d.department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id;



-- 풀 아우터 조인(좌측 테이블과 우측 테이블 데이터를 모두 읽어 표현하는 외부 조인)
-- LEFT + RIGHT JOIN
SELECT 
    e.first_name,
    d.department_name
FROM employees e FULL JOIN departments d
ON e.department_id = d.department_id;


-- CROSS JOIN은 JOIN 조건을 설정하지 않기 때문에
-- 단순히 모든 칼럼에 대한 JOIN을 수행합니다.
-- 실제로는 거의 사용하지 않습니다.
-- (실행 결과 행의 수: 각 테이블의 행을 곱해주면 됨.)
SELECT
    *
FROM employees
CROSS JOIN departments;

SELECT * FROM employees, departments;


-- 여러 개 테이블 조인 -> 조인 조건에 사용할 키 값을 찾아
-- 연결해서 쓰면 됩니다.
SELECT 
    *
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id;


-- SELF JOIN이란 동일 테이블 사이의 조인을 말합니다.
-- 동일 테이블 컬럼을 통해 기존의 존재하는 값을 매칭시켜 가져올 때 사용합니다.

-- 각 사원별 매니저의 이름을 조회
SELECT
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id;


-- 각 매니저가 담당하는 사원의 명수
-- 매니저 아이디, 매니저 이름, 사원수
SELECT
    m.employee_id AS manager_id,
    m.first_name AS manager_name,
    COUNT(e.employee_id) AS 사원수
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name;


-- Natural Join
-- 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인조건을 생성하는 기법입니다.
-- 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER JOIN을 수행합니다.
-- 조인되는 동일 이름의 컬럼은 타입이 같아야 하며,
-- ALIAS나 테이블명을 자동 조인 컬럼 앞에 표기하면 안됩니다.
-- 조회하려는 컬럼에 *을 붙이면, 공통 컬럼은 한 번만 표기됩니다.
SELECT
    e.employee_id, e.first_name,
    department_id, d.department_name
FROM employees e
NATURAL JOIN departments d;


-- USING JOIN
-- NATURAL JOIN과는 다르게, USING을 사용하면 원하는 컬럼에 대해서만 선택적 조인조건을
-- 부여할 수 있습니다.
-- USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 표기하시면 안됩니다.

SELECT
    e.employee_id, e.first_name,
    department_id, d.department_name
FROM employees e
JOIN departments d USING(department_id);

