create table parking_info (
    c_num   varchar2(30 char),
    c_entra number(38,0),
    c_nredu number(3,0),
    c_exit  number(38,0),
    c_ptime number(38,0),
    c_pfee  number(10, 0),
    
    constraint pk_c_num primary key (c_num),
    constraint nn_c_nredu check (c_nredu is not null)
);

create table parking_area (
    p_area  varchar2(10 char),
    p_check number(2,0),
    c_num   varchar2(30 char),
    
    constraint pk_p_area primary key (p_area),
    constraint ck_p_check check (p_check between 0 and 1),
    constraint fk_c_num foreign key (c_num) references parking_info (c_num)
);

create table parking_reduction (
    c_nredu number(3, 0),
    r_name  varchar2(20 char),
    r_ratio number(3, 1),
    
    constraint fk_c_nredu primary key (c_nredu),
    constraint pk_r_rname check (r_name is not null),
    constraint ck_r_ratio check (r_ratio is not null)
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


insert into parking_reduction values (1, '해당없음', 1);
insert into parking_reduction values (2, '경차 - 50%', 0.5);
insert into parking_reduction values (3, '다자녀 2인 - 30%', 0.7);
insert into parking_reduction values (4, '다자녀 3인 - 50%', 0.5);
insert into parking_reduction values (5, '저공해 1,2종 - 50% ', 0.5);
insert into parking_reduction values (6, '저공해 3종 - 30%', 0.7);
insert into parking_reduction values (7, '긴급/군 차량 - 면제', 0);

/*
drop table parking_area;
drop table parking_reduction;
drop table parking_info;
*/