create database db01; -- 新增db01
create database if not exists db02; -- 新增db02
use db01; -- switch database db01
use db02; -- switch database db02
drop database db01; -- 刪掉db01
drop database db02; -- 刪掉db02

show databases; -- 顯示database(schemas)
show character set; -- 顯示所有字元
show collation; 
show collation like 'big5%';
alter database db02 -- 變更字元
character set big5
collate big5_bin;
select@@character_set_database,@@collation_database; -- 確認字元