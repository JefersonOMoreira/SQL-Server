CREATE FUNCTION conta_dias (@indate datetime, @outdate datetime)
RETURNS INT
AS
BEGIN
  RETURN 
  
  (SELECT DATEDIFF (DAY,@indate, @outdate))
		
  END;



  select dbo.conta_dias ('01-01-2022', '01-01-2023')


CREATE FUNCTION media_ns (@n1 int, @n2 int, @n3 int, @n4 int)
RETURNS INT
AS
	BEGIN
	declare @media int
			
			set @media = (@n1 + @n2 + @n3 + @n4) / 4

	RETURN @media
	END;

	select dbo.media_ns (4, 4, 4, 4)


CREATE FUNCTION quadrado (@lado float)
RETURNS float
AS
	BEGIN
	declare @area float
			
			set @area = @lado * @lado

	RETURN @area
	END;

	select dbo.quadrado (4)