create table parking_reduction (
    r_nredu number(3, 0),
    r_name  varchar2(20 char),
    r_ratio number(3, 1),
    
    constraint pk_c_nredu primary key (r_nredu),
    constraint ck_r_name check (r_name is not null),
    constraint ck_r_ratio check (r_ratio is not null)
);

insert into parking_reduction values (1, '해당없음', 1);
insert into parking_reduction values (2, '경차 - 50%', 0.5);
insert into parking_reduction values (3, '다자녀 2인 - 30%', 0.7);
insert into parking_reduction values (4, '다자녀 3인 - 50%', 0.5);
insert into parking_reduction values (5, '저공해 1,2종 - 50% ', 0.5);
insert into parking_reduction values (6, '저공해 3종 - 30%', 0.7);
insert into parking_reduction values (7, '긴급/군 차량 - 면제', 0);

create table parking_info (
    c_num   varchar2(30 char),
    c_entra number(38,0),
    c_nredu number(3,0),
    c_exit  number(38,0),
    c_ptime number(38,0),
    c_pfee  number(10, 0),
    
    constraint pk_c_num primary key (c_num),
    constraint fk_c_nredu foreign key (c_nredu) references parking_reduction (r_nredu)
);

create table parking_area (
    p_area  varchar2(10 char),
    p_check number(2,0) default 0,
    c_num   varchar2(30 char),
    
    constraint pk_p_area primary key (p_area),
    constraint ck_p_check check (p_check between 0 and 1),
    constraint uq_c_num unique (c_num)
);

insert into parking_area (p_area) values ('1f01');
insert into parking_area (p_area) values ('1f02');
insert into parking_area (p_area) values ('1f03');
insert into parking_area (p_area) values ('1f04');
insert into parking_area (p_area) values ('1f05');
insert into parking_area (p_area) values ('1f06');
insert into parking_area (p_area) values ('1f07');
insert into parking_area (p_area) values ('1f08');
insert into parking_area (p_area) values ('1f09');
insert into parking_area (p_area) values ('1f10');
insert into parking_area (p_area) values ('1f11');
insert into parking_area (p_area) values ('1f12');

create table parking_finish_data (
    f_num   varchar2(30 char),
    f_ptime number(38, 0),
    f_pfee  number(10, 0),
    f_nredu number(3,0),
    
    constraint ch_f_num check (f_num is not null),
    constraint ch_f_ptime check (f_ptime is not null),
    constraint ch_f_pfee check (f_pfee is not null),
    constraint ch_f_nredu check (f_nredu is not null)
);

commit;

/*
drop table parking_area;
drop table parking_info;
drop table parking_reduction;
drop table parking_finish_data;
*/

