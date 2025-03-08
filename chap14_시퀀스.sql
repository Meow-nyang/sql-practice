
-- 시퀀스 (순차적으로 증가, 감소하는 값을 만들어 주는 객체)

CREATE SEQUENCE test_seq
    START WITH 1 -- 시작값 (기본값은 증가할 땐 최소값, 감소할 땐 최대값)
    INCREMENT BY 1 -- 증감값 (기본값 1. 양수는 증가, 음수는 감소)
    MAXVALUE 10 -- 최대값 (기본값 1027, 감소일 떄는 -1)
    MINVALUE 1 -- 최소값 (증가일 때 1, 감소일 때 -1028)
    NOCACHE -- 캐시 메모리 사용 여부
    NOCYCLE; -- 순환 여부 (기본값 NOCYCLE)
    

CREATE TABLE test_tbl (
    test_no NUMBER(2) PRIMARY KEY,
    test_msg VARCHAR2(100)
);


INSERT INTO test_tbl
VALUES(test_seq.NEXTVAL,'test'); -- INSERT 실행 시 시퀀스의 다음 값 활용.



SELECT * FROM test_tbl;

SELECT 
    test_seq.NEXTVAL
FROM dual;

-- 시퀀스 속성 수정
-- START WITH은 수정이 불가능합니다.
ALTER SEQUENCE test_seq MAXVALUE 9999;
ALTER SEQUENCE test_seq INCREMENT BY -5;

DROP SEQUENCE test_seq;



