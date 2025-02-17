CREATE TABLE IF NOT EXISTS ps_endpoints (
  id              VARCHAR(40) NOT NULL PRIMARY KEY,
  transport       VARCHAR(40),
  aors            VARCHAR(200),
  auth            VARCHAR(40),
  context         VARCHAR(40),
  disallow        VARCHAR(100),
  allow           VARCHAR(100),
  direct_media    VARCHAR(10)
  -- и т.д.
);

CREATE TABLE IF NOT EXISTS ps_auths (
  id         VARCHAR(40) NOT NULL PRIMARY KEY,
  auth_type  VARCHAR(40),
  password   VARCHAR(40),
  username   VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS ps_aors (
  id            VARCHAR(40) NOT NULL PRIMARY KEY,
  max_contacts  INTEGER
);

CREATE TABLE IF NOT EXISTS extensions_table (
  context   VARCHAR(40) NOT NULL,
  exten     VARCHAR(40) NOT NULL,
  priority  INT NOT NULL,
  app       VARCHAR(40) NOT NULL,
  appdata   VARCHAR(255),
  PRIMARY KEY (context, exten, priority)
);
