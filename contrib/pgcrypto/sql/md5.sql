--
-- MD5 message digest
--
SET ivorysql.enable_emptystring_to_null to off;
SELECT digest('', 'md5');
reset ivorysql.enable_emptystring_to_null;
SELECT digest('a', 'md5');
SELECT digest('abc', 'md5');
SELECT digest('message digest', 'md5');
SELECT digest('abcdefghijklmnopqrstuvwxyz', 'md5');
SELECT digest('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789', 'md5');
SELECT digest('12345678901234567890123456789012345678901234567890123456789012345678901234567890', 'md5');
