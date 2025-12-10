@echo off
IF EXIST wrath-of-the-vanilla.sql DEL /F wrath-of-the-vanilla.sql
FOR /R %%f IN (*.sql) DO (type "%%f" >> wrath-of-the-vanilla.sql)
