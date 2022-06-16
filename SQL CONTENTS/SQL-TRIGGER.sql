​
create table empregado​
(cpf numeric(14) not null,​
nome varchar(40) not null,​
data_nasc datetime,​
sexo char(1),​
endereco varchar(100),​
salario numeric(12,2),​
num_dept numeric(5),​
cpf_supervisor numeric(14),​

constraint pk_empregado primary key(cpf))


create trigger t_validacao on empregado
for insert,update
as
declare 
@cpf numeric(14),
@cpf_supervisor numeric(14)
set @cpf = ( select cpf from inserted )
set @cpf_supervisor = ( select cpf_supervisor from inserted )
if 
(@cpf = @cpf_supervisor)
begin
print 'Não é permitido ser o própio supervisor'
rollback
end

create trigger t_ajus_salario on empregado
for update
as
declare 
@salario_atual numeric(12,2),
@salario_novo numeric(12,2)
set @salario_atual = ( select salario from deleted )
set @salario_novo = ( select salario from inserted )
if 
(@salario_atual > @salario_novo)
begin
print 'Não permitido a redução do salário atual'
rollback
end

insert into empregado values (1234, 'jeferson', '2003/09/07', 'm', 'sla', 10000, 3, 12345)

select * from empregado

update empregado set salario = 11000