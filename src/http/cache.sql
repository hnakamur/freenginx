CREATE TABLE IF NOT EXISTS caches (
  key        BLOB,
  count      INTEGER NOT NULL DEFAULT 0,
  uses       INTEGER NOT NULL DEFAULT 0,
  valid_msec INTEGER NOT NULL DEFAULT 0,
  error      INTEGER NOT NULL DEFAULT 0,
  exists_    INTEGER NOT NULL DEFAULT 0,
  updating   INTEGER NOT NULL DEFAULT 0,
  deleting   INTEGER NOT NULL DEFAULT 0,
  purged     INTEGER NOT NULL DEFAULT 0,
  uniq       INTEGER NOT NULL DEFAULT 0,
  expire     INTEGER NOT NULL DEFAULT 0,
  valid_sec  INTEGER NOT NULL DEFAULT 0,
  body_start INTEGER NOT NULL DEFAULT 0,
  fs_size    INTEGER NOT NULL DEFAULT 0,
  lock_time  INTEGER NOT NULL DEFAULT 0,
  ref_time   INTEGER NOT NULL,
  PRIMARY KEY (key)
);

CREATE INDEX IF NOT EXISTS caches_ref_time_idx ON caches (ref_time);

DROP TABLE IF EXISTS caches;

INSERT INTO caches (key, ref_time) VALUES (x'aabbcc', datetime('now', 'localtime'));

.mode quote
SELECT * FROM caches;

INSERT INTO caches (key, ref_time) VALUES (x'aabbcc', datetime('now'));
DELETE FROM caches WHERE key = x'aabbcc';
