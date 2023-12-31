/* Begin - ReqID:SRS-SQL-SYSVIEW */
/* DBA_PROCEDURES */
CREATE OR REPLACE VIEW SYS.DBA_PROCEDURES AS
	SELECT
		SYS.ORA_CASE_TRANS(
			PG_GET_USERBYID(P.PROOWNER)::VARCHAR2
		)::VARCHAR2(128) AS OWNER,
		SYS.ORA_CASE_TRANS(P.PRONAME::VARCHAR2)::VARCHAR2(128) AS OBJECT_NAME,
		NULL::VARCHAR2(128) AS PROCEDURE_NAME,
		P.OID::VARCHAR2(10)::NUMBER AS OBJECT_ID,
		1::NUMBER AS SUBPROGRAM_ID,
		NULL::VARCHAR2(40) AS OVERLOAD,
		CASE
			WHEN P.PROKIND = 'p'
				THEN 'PROCEDURE'
			WHEN P.PROKIND = 'f'
				THEN 'FUNCTION'
			ELSE NULL
		END::VARCHAR2(13) AS OBJECT_TYPE,
		CASE
			WHEN P.PROKIND = 'a'
				THEN 'YES'
			ELSE 'NO'
		END::VARCHAR2(3) AS AGGREGATE,
		'NO'::VARCHAR2(3) AS PIPELINED,
		NULL::VARCHAR2(128) AS IMPLTYPOWNER,
		NULL::VARCHAR2(128) AS IMPLTYPNAME,
		CASE
			WHEN P.PROPARALLEL = 'u'
				THEN 'NO'
			ELSE 'YES'
		END::VARCHAR2(3) AS PARALLEL,
		'NO'::VARCHAR2(3) AS INTERFACE,
		CASE
			WHEN P.PROVOLATILE = 'i'
				THEN 'YES'
			ELSE 'NO'
		END::VARCHAR2(3) AS DETERMINISTIC,
		CASE
			WHEN P.PROSECDEF = 't'
				THEN 'DEFINER'
			ELSE 'CURRENT_USER'
		END::VARCHAR2(12) AS AUTHID,
		'NO'::VARCHAR2(3) AS RESULT_CACHE,
		0::VARCHAR2(256) AS ORIGIN_CON_ID,
		'NULL'::VARCHAR2(5) AS POLYMORPHIC,
		'NULL'::VARCHAR2(6) AS SQL_MACRO,
		NULL::VARCHAR2(3) AS BLOCKCHAIN,
		NULL::VARCHAR2(4000) AS BLOCKCHAIN_MANDATORY_VOTES
	FROM
		PG_PROC AS P
		LEFT JOIN PG_TRIGGER AS T
			ON P.OID = T.TGFOID
	WHERE
		T.OID IS NULL
		AND P.PRONAMESPACE != 'PG_CATALOG'::REGNAMESPACE::OID
		AND P.PRONAMESPACE != 'PG_TOAST'::REGNAMESPACE::OID
		AND P.PRONAMESPACE != 'INFORMATION_SCHEMA'::REGNAMESPACE::OID
UNION ALL
	SELECT
		SYS.ORA_CASE_TRANS(
			PG_GET_USERBYID(P.PROOWNER)::VARCHAR2
		)::VARCHAR2(128) AS OWNER,
		SYS.ORA_CASE_TRANS(T.TGNAME::VARCHAR2)::VARCHAR2(128) AS OBJECT_NAME,
		NULL::VARCHAR2(128) AS PROCEDURE_NAME,
		T.OID::VARCHAR2(10)::NUMBER AS OBJECT_ID,
		1::NUMBER AS SUBPROGRAM_ID,
		NULL::VARCHAR2(40) AS OVERLOAD,
		'TRIGGER'::VARCHAR2(13) AS OBJECT_TYPE,
		'NO'::VARCHAR2(3) AS AGGREGATE,
		'NO'::VARCHAR2(3) AS PIPELINED,
		NULL::VARCHAR2(128) AS IMPLTYPOWNER,
		NULL::VARCHAR2(128) AS IMPLTYPNAME,
		'NO'::VARCHAR2(3) AS PARALLEL,
		'NO'::VARCHAR2(3) AS INTERFACE,
		'NO'::VARCHAR2(3) AS DETERMINISTIC,
		'DEFINER'::VARCHAR2(12) AS AUTHID,
		'NO'::VARCHAR2(3) AS RESULT_CACHE,
		0::VARCHAR2(256) AS ORIGIN_CON_ID,
		NULL::VARCHAR2(5) AS POLYMORPHIC,
		NULL::VARCHAR2(6) AS SQL_MACRO,
		NULL::VARCHAR2(3) AS BLOCKCHAIN,
		NULL::VARCHAR2(4000) AS BLOCKCHAIN_MANDATORY_VOTES
	FROM
		PG_TRIGGER AS T
		LEFT JOIN PG_PROC AS P
			ON T.TGFOID = P.OID
ORDER BY
	OWNER, OBJECT_ID
;

/* GRANT SELECT PRIVILEGE TO PUBLIC */
GRANT SELECT ON SYS.DBA_PROCEDURES TO PUBLIC;

/* ALL_PROCEDURES */
CREATE OR REPLACE VIEW SYS.ALL_PROCEDURES AS
	SELECT
		SYS.ORA_CASE_TRANS(
			PG_GET_USERBYID(P.PROOWNER)::VARCHAR2
		)::VARCHAR2(128) AS OWNER,
		SYS.ORA_CASE_TRANS(P.PRONAME::VARCHAR2)::VARCHAR2(128) AS OBJECT_NAME,
		NULL::VARCHAR2(128) AS PROCEDURE_NAME,
		P.OID::VARCHAR2(10)::NUMBER AS OBJECT_ID,
		1::NUMBER AS SUBPROGRAM_ID,
		NULL::VARCHAR2(40) AS OVERLOAD,
		CASE
			WHEN P.PROKIND = 'p'
				THEN 'PROCEDURE'
			WHEN P.PROKIND = 'f'
				THEN 'FUNCTION'
			ELSE NULL
		END::VARCHAR2(13) AS OBJECT_TYPE,
		CASE
			WHEN P.PROKIND = 'a'
				THEN 'YES'
			ELSE 'NO'
		END::VARCHAR2(3) AS AGGREGATE,
		'NO'::VARCHAR2(3) AS PIPELINED,
		NULL::VARCHAR2(128) AS IMPLTYPOWNER,
		NULL::VARCHAR2(128) AS IMPLTYPNAME,
		CASE
			WHEN P.PROPARALLEL = 'u'
				THEN 'NO'
			ELSE 'YES'
		END::VARCHAR2(3) AS PARALLEL,
		'NO'::VARCHAR2(3) AS INTERFACE,
		CASE
			WHEN P.PROVOLATILE = 'i'
				THEN 'YES'
			ELSE 'NO'
		END::VARCHAR2(3) AS DETERMINISTIC,
		CASE
			WHEN P.PROSECDEF = 't'
				THEN 'DEFINER'
			ELSE 'CURRENT_USER'
		END::VARCHAR2(12) AS AUTHID,
		'NO'::VARCHAR2(3) AS RESULT_CACHE,
		0::VARCHAR2(256) AS ORIGIN_CON_ID,
		'NULL'::VARCHAR2(5) AS POLYMORPHIC,
		'NULL'::VARCHAR2(6) AS SQL_MACRO,
		NULL::VARCHAR2(3) AS BLOCKCHAIN,
		NULL::VARCHAR2(4000) AS BLOCKCHAIN_MANDATORY_VOTES
	FROM
		PG_PROC AS P
		LEFT JOIN PG_TRIGGER AS T
			ON P.OID = T.TGFOID
	WHERE
		T.OID IS NULL
		AND P.PRONAMESPACE != 'PG_CATALOG'::REGNAMESPACE::OID
		AND P.PRONAMESPACE != 'PG_TOAST'::REGNAMESPACE::OID
		AND P.PRONAMESPACE != 'INFORMATION_SCHEMA'::REGNAMESPACE::OID
		AND HAS_FUNCTION_PRIVILEGE(P.OID, 'EXECUTE')
UNION ALL
	SELECT
		SYS.ORA_CASE_TRANS(
			PG_GET_USERBYID(P.PROOWNER)::VARCHAR2
		)::VARCHAR2(128) AS OWNER,
		SYS.ORA_CASE_TRANS(T.TGNAME::VARCHAR2)::VARCHAR2(128) AS OBJECT_NAME,
		NULL::VARCHAR2(128) AS PROCEDURE_NAME,
		T.OID::VARCHAR2(10)::NUMBER AS OBJECT_ID,
		1::NUMBER AS SUBPROGRAM_ID,
		NULL::VARCHAR2(40) AS OVERLOAD,
		'TRIGGER'::VARCHAR2(13) AS OBJECT_TYPE,
		'NO'::VARCHAR2(3) AS AGGREGATE,
		'NO'::VARCHAR2(3) AS PIPELINED,
		NULL::VARCHAR2(128) AS IMPLTYPOWNER,
		NULL::VARCHAR2(128) AS IMPLTYPNAME,
		'NO'::VARCHAR2(3) AS PARALLEL,
		'NO'::VARCHAR2(3) AS INTERFACE,
		'NO'::VARCHAR2(3) AS DETERMINISTIC,
		'DEFINER'::VARCHAR2(12) AS AUTHID,
		'NO'::VARCHAR2(3) AS RESULT_CACHE,
		0::VARCHAR2(256) AS ORIGIN_CON_ID,
		NULL::VARCHAR2(5) AS POLYMORPHIC,
		NULL::VARCHAR2(6) AS SQL_MACRO,
		NULL::VARCHAR2(3) AS BLOCKCHAIN,
		NULL::VARCHAR2(4000) AS BLOCKCHAIN_MANDATORY_VOTES
	FROM
		PG_TRIGGER AS T
		LEFT JOIN PG_PROC AS P
			ON T.TGFOID = P.OID
	WHERE
		HAS_FUNCTION_PRIVILEGE(T.TGFOID, 'EXECUTE')
ORDER BY
	OWNER, OBJECT_ID
;

/* GRANT SELECT PRIVILEGE TO PUBLIC */
GRANT SELECT ON SYS.ALL_PROCEDURES TO PUBLIC;

/* USER_PROCEDURES */
CREATE OR REPLACE VIEW SYS.USER_PROCEDURES AS
	SELECT
		SYS.ORA_CASE_TRANS(P.PRONAME::VARCHAR2)::VARCHAR2(128) AS OBJECT_NAME,
		NULL::VARCHAR2(128) AS PROCEDURE_NAME,
		P.OID::VARCHAR2(10)::NUMBER AS OBJECT_ID,
		1::NUMBER AS SUBPROGRAM_ID,
		NULL::VARCHAR2(40) AS OVERLOAD,
		CASE
			WHEN P.PROKIND = 'p'
				THEN 'PROCEDURE'
			WHEN P.PROKIND = 'f'
				THEN 'FUNCTION'
			ELSE NULL
		END::VARCHAR2(13) AS OBJECT_TYPE,
		CASE
			WHEN P.PROKIND = 'a'
				THEN 'YES'
			ELSE 'NO'
		END::VARCHAR2(3) AS AGGREGATE,
		'NO'::VARCHAR2(3) AS PIPELINED,
		NULL::VARCHAR2(128) AS IMPLTYPOWNER,
		NULL::VARCHAR2(128) AS IMPLTYPNAME,
		CASE
			WHEN P.PROPARALLEL = 'u'
				THEN 'NO'
			ELSE 'YES'
		END::VARCHAR2(3) AS PARALLEL,
		'NO'::VARCHAR2(3) AS INTERFACE,
		CASE
			WHEN P.PROVOLATILE = 'i'
				THEN 'YES'
			ELSE 'NO'
		END::VARCHAR2(3) AS DETERMINISTIC,
		CASE
			WHEN P.PROSECDEF = 't'
				THEN 'DEFINER'
			ELSE 'CURRENT_USER'
		END::VARCHAR2(12) AS AUTHID,
		'NO'::VARCHAR2(3) AS RESULT_CACHE,
		0::VARCHAR2(256) AS ORIGIN_CON_ID,
		'NULL'::VARCHAR2(5) AS POLYMORPHIC,
		'NULL'::VARCHAR2(6) AS SQL_MACRO,
		NULL::VARCHAR2(3) AS BLOCKCHAIN,
		NULL::VARCHAR2(4000) AS BLOCKCHAIN_MANDATORY_VOTES
	FROM
		PG_PROC AS P
	LEFT JOIN PG_TRIGGER AS T
		ON P.OID = T.TGFOID
	WHERE
		T.OID IS NULL
		AND P.PRONAMESPACE != 'PG_CATALOG'::REGNAMESPACE::OID
		AND P.PRONAMESPACE != 'PG_TOAST'::REGNAMESPACE::OID
		AND P.PRONAMESPACE != 'INFORMATION_SCHEMA'::REGNAMESPACE::OID
		AND P.PROOWNER::REGROLE = CURRENT_USER::REGROLE
UNION ALL
	SELECT
		SYS.ORA_CASE_TRANS(T.TGNAME::VARCHAR2)::VARCHAR2(128) AS OBJECT_NAME,
		NULL::VARCHAR2(128) AS PROCEDURE_NAME,
		T.OID::VARCHAR2(10)::NUMBER AS OBJECT_ID,
		1::NUMBER AS SUBPROGRAM_ID,
		NULL::VARCHAR2(40) AS OVERLOAD,
		'TRIGGER'::VARCHAR2(13) AS OBJECT_TYPE,
		'NO'::VARCHAR2(3) AS AGGREGATE,
		'NO'::VARCHAR2(3) AS PIPELINED,
		NULL::VARCHAR2(128) AS IMPLTYPOWNER,
		NULL::VARCHAR2(128) AS IMPLTYPNAME,
		'NO'::VARCHAR2(3) AS PARALLEL,
		'NO'::VARCHAR2(3) AS INTERFACE,
		'NO'::VARCHAR2(3) AS DETERMINISTIC,
		'DEFINER'::VARCHAR2(12) AS AUTHID,
		'NO'::VARCHAR2(3) AS RESULT_CACHE,
		0::VARCHAR2(256) AS ORIGIN_CON_ID,
		NULL::VARCHAR2(5) AS POLYMORPHIC,
		NULL::VARCHAR2(6) AS SQL_MACRO,
		NULL::VARCHAR2(3) AS BLOCKCHAIN,
		NULL::VARCHAR2(4000) AS BLOCKCHAIN_MANDATORY_VOTES
	FROM
		PG_TRIGGER AS T
		LEFT JOIN PG_PROC AS P
			ON T.TGFOID = P.OID
	WHERE
		P.PROOWNER::REGROLE = CURRENT_USER::REGROLE
ORDER BY
	OBJECT_ID
;

/* GRANT SELECT PRIVILEGE TO PUBLIC */
GRANT SELECT ON SYS.USER_PROCEDURES TO PUBLIC;
/* End - ReqID:SRS-SQL-SYSVIEW */
