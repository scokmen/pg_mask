CREATE FUNCTION pg_mask()
    RETURNS text
    AS 'MODULE_PATHNAME'
    LANGUAGE C;