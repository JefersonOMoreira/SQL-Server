CREATE PROCEDURE SP_INCLUSAO

(
	@CPF NUMERIC(14,0),
	@NOME VARCHAR(40),
	@DATA_NASC DATETIME,
	@SEXO CHAR(1),
	@ENDERECO VARCHAR(100),
	@SARARIO NUMERIC (12,2),
	@NUMR_DEPT NUMERIC(5,0),
	@CPF_SUPER NUMERIC(14,0)
)
AS
BEGIN
	IF EXISTS (SELECT cpf FROM empregado where cpf = @CPF)
	begin
		print('CPF/EMPREGADO J� CADASTRADO')
		return
	end
	else
	insert into empregado values (@CPF, @NOME, @DATA_NASC, @SEXO, @ENDERECO, @SARARIO, @NUMR_DEPT, @CPF_SUPER)
end

EXEC SP_INCLUSAO @CPF = 123, @NOME = 'JEFF', @DATA_NASC = '2003-07-09', @SEXO = 'M', @ENDERECO = 'SLAAAA', @SARARIO = 100000000.00, @NUMR_DEPT = 1, @CPF_SUPER = 6546944

CREATE PROCEDURE SP_AJUSTE
(
	@PERCENT_AJUSTE FLOAT
)
AS
BEGIN
	UPDATE EMPREGADO SET SARARIO = SARARIO + ((@PERCENT_AJUSTE * SARARIO) / 100)
END

EXEC SP_AJUSTE @PERCENT_AJUSTE = 100

SELECT * FROM EMPREGADO