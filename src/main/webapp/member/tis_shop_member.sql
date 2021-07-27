drop table member;

create table member(
    idx number(8) constraint member_pk primary key,
    name varchar2(30) not null,
    userid varchar2(20) constraint member_userid_uk unique,
    pwd varchar2(20) not null,
    hp1 char(3) not null, -- 연락처 앞자리
    hp2 char(4) not null,
    hp3 char(4) not null,
    zipcode char(5),
    addr1 varchar2(200),
    addr2 varchar2(200),
    indate date default sysdate, --등록일
    mileage number(10) default 1000,
    mstate number(1) default 0 --회원상태(활동회원:0, 정지회원:1, 탈퇴회원:-1)
    constraint member_mstate_ck check (mstate in (-1, 0, 1))
);

drop sequence member_seq;

create sequence member_seq
start with 1
increment by 1
nocache;

create or replace view member_view
as
select*from member where mstate>-1;

drop table zipcode;

create table zipcode(
   new_post_code char(5),
   sido_kor varchar2(40),
   sido_eng varchar2(40),
   sigungu_kor varchar2(30),
   sigungu_eng varchar2(30),
   upmyon_kor varchar2(30),
   upmyon_eng varchar2(30),
   doro_num varchar2(20),
   doro_kor varchar2(100),
   doro_eng varchar2(100),
   under_flag number(10),
   bld_origin_num number(5),
   bld_refer_num number(5),
   bld_manage_num varchar2(30),
   multi_deliver_name varchar2(40),
   sigungu_bld_name varchar2(200),
   law_dong_num varchar2(30),
   law_dong_name varchar2(30),
   ri_name varchar2(30),
   admin_dong_name varchar2(40),
   san_flag varchar2(10),
   jibeon_bonbeon number(4),
   upmyondong_seq varchar2(5),
   jibeon_bubeon number(4),
   old_post_code  varchar2(6),
   post_code_seq varchar2(3)
);



