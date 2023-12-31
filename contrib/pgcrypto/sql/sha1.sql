--
-- SHA1 message digest
--
SET ivorysql.enable_emptystring_to_null to off;
SELECT digest('', 'sha1');
reset ivorysql.enable_emptystring_to_null;
SELECT digest('a', 'sha1');
SELECT digest('abc', 'sha1');
SELECT digest('message digest', 'sha1');
SELECT digest('abcdefghijklmnopqrstuvwxyz', 'sha1');
SELECT digest('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789', 'sha1');
SELECT digest('12345678901234567890123456789012345678901234567890123456789012345678901234567890', 'sha1');
