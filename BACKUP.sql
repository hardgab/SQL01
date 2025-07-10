---- FAZENDO O BACKUP DO BANCO (ajustar o local se necessário 
--- C:\Users\noturno\Desktop\SQL Gabriel

BACKUP DATABASE bd_16_byciclon
TO DISK = 'C:\Users\noturno\Desktop\SQL Gabriel\Backup\bd_16_byciclon_10072025.BAK'
WITH /*COM*/ FORMAT/*FORMATO*/, MEDIANAME /* QUAL NOME DO BANCO*/ = 'bd_16_bycicle_backup', NAME = 'Full Backup do BD Byciclon' 

---- Restaurar o backup feito anteriormente
RESTORE DATABASE bd_16_byciclon
FROM DISK = 'C:\Users\noturno\Desktop\SQL Gabriel\Backup'
WITH REPLACE 