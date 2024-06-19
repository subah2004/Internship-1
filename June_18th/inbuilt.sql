
import DATETIME;
--String Functions
-- A) CHAR_LENGTH(str):
SELECT CHAR_LENGTH("Hello this is a sample string");
SELECT CHAR_LENGTH("Hello");


-- B) ASCII(str)

SELECT ASCII("HI");
SELECT ASCII("SAMPLE");

--CONCAT(str1, str2, ...)
SELECT CONCAT("HI"," * ","Sample");
SELECT CONCAT("Factor"," ","Sample");


-- D) INSTR(str, substr)

SELECT INSTR("Hello this is a sample string","t");
SELECT INSTR("Hello this is a sample string","g");


-- E) LCASE(str) or LOWER(str):

SELECT LOWER("SAMPLE");
SELECT LCASE("JaCOb");

-- F) UCASE(str)
SELECT UCASE('SAMPLE');
SELECT UPPER('jAcOB');

-- G) SUBSTR

SELECT SUBSTR('Hello this is a sample string', 2, 5);
SELECT SUBSTR('Hello this is a sample string', 4, 7);

-- Date and Time Functions
-- A) CURRENT_DATE()
SELECT CURRENT_DATE() as today;

-- B) DATEDIFF(date1, date2)
SELECT DATEDIFF("2024-07-20","2024-06-20");

-- C) CURRENT_TIME()
SELECT CURRENT_TIME() as today;

-- D) LAST_DAY(date):
SELECT LAST_DAY("2024-07-01") AS Last_day_of_month;

