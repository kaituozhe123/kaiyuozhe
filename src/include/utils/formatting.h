/* -----------------------------------------------------------------------
 * formatting.h
 *
 * src/include/utils/formatting.h
 *
 *
 *	 Portions Copyright (c) 1999-2022, PostgreSQL Global Development Group
 *
 *	 The PostgreSQL routines for a DateTime/int/float/numeric formatting,
 *	 inspired by the Oracle TO_CHAR() / TO_DATE() / TO_NUMBER() routines.
 *
 *	 Karel Zak
 *
 * -----------------------------------------------------------------------
 */

#ifndef _FORMATTING_H_
#define _FORMATTING_H_

/* to support the compatibility of ',' and '.' */
typedef enum
{
	FMT_GROUP_LAST_LEN_MATCH,
	FMT_GROUP_NO_MATCH,
	FMT_GROUP_LAST_LEN_NO_MATCH,
	FMT_GROUP_LAST_NO_MATCH
} FORMAT_MATCH_FLAG;

#define DCH_DATED	0x01
#define DCH_TIMED	0x02
#define DCH_ZONED	0x04

extern char *str_tolower(const char *buff, size_t nbytes, Oid collid);
extern char *str_toupper(const char *buff, size_t nbytes, Oid collid);
extern char *str_initcap(const char *buff, size_t nbytes, Oid collid);

extern char *asc_tolower(const char *buff, size_t nbytes);
extern char *asc_toupper(const char *buff, size_t nbytes);
extern char *asc_initcap(const char *buff, size_t nbytes);

extern Datum parse_datetime(text *date_txt, text *fmt, Oid collid, bool strict,
							Oid *typid, int32 *typmod, int *tz,
							bool *have_error);

#endif
