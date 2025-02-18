CREATE TABLE IF NOT EXISTS ps_endpoints (
  id              VARCHAR(40) NOT NULL PRIMARY KEY,
  transport       VARCHAR(40),
  aors            VARCHAR(200),
  auth            VARCHAR(40),
  context         VARCHAR(40),
  disallow        VARCHAR(100),
  allow           VARCHAR(100),
  direct_media    VARCHAR(10) DEFAULT 'no',
  mailboxes       VARCHAR(255) DEFAULT NULL,
  rtp_symmetric   VARCHAR(10) DEFAULT 'yes',
  force_rport     VARCHAR(10) DEFAULT 'yes',
  rewrite_contact VARCHAR(10) DEFAULT 'yes',
  dtmf_mode       VARCHAR(20) DEFAULT 'rfc4733'
);

CREATE TABLE IF NOT EXISTS ps_auths (
  id         VARCHAR(40) NOT NULL PRIMARY KEY,
  auth_type  VARCHAR(40),
  password   VARCHAR(40),
  username   VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS ps_aors (
  id            VARCHAR(40) NOT NULL PRIMARY KEY,
  max_contacts  INTEGER DEFAULT 1
);

CREATE TABLE IF NOT EXISTS extensions (
  id BIGSERIAL NOT NULL,
  context   VARCHAR(40) NOT NULL,
  exten     VARCHAR(40) NOT NULL,
  priority  INTEGER NOT NULL,
  app       VARCHAR(40) NOT NULL,
  appdata   VARCHAR(256) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (context, exten, priority)
);

CREATE TABLE IF NOT EXISTS cdr (
  id BIGSERIAL PRIMARY KEY,
  calldate TIMESTAMP NOT NULL,
  clid VARCHAR(80) NOT NULL DEFAULT '',
  src VARCHAR(80) NOT NULL DEFAULT '',
  dst VARCHAR(80) NOT NULL DEFAULT '',
  dcontext VARCHAR(80) NOT NULL DEFAULT '',
  channel VARCHAR(80) NOT NULL DEFAULT '',
  dstchannel VARCHAR(80) NOT NULL DEFAULT '',
  lastapp VARCHAR(80) NOT NULL DEFAULT '',
  lastdata VARCHAR(80) NOT NULL DEFAULT '',
  duration INT NOT NULL DEFAULT 0,
  billsec INT NOT NULL DEFAULT 0,
  disposition VARCHAR(45) NOT NULL DEFAULT '',
  amaflags INT NOT NULL DEFAULT 0,
  accountcode VARCHAR(80) NOT NULL DEFAULT '',
  uniqueid VARCHAR(150) NOT NULL DEFAULT '',
  linkedid VARCHAR(150) NOT NULL DEFAULT '',
  userfield VARCHAR(255) NOT NULL DEFAULT '',
  did VARCHAR(80) NOT NULL DEFAULT '',
  recordingfile VARCHAR(255) NOT NULL DEFAULT '',
  cnum VARCHAR(80) NOT NULL DEFAULT '',
  cnam VARCHAR(80) NOT NULL DEFAULT '',
  outbound_cnum VARCHAR(80) NOT NULL DEFAULT '',
  outbound_cnam VARCHAR(80) NOT NULL DEFAULT '',
  dst_cnam VARCHAR(80) NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS calldate_idx ON cdr (calldate);
CREATE INDEX IF NOT EXISTS dst_idx ON cdr (dst);
CREATE INDEX IF NOT EXISTS accountcode_idx ON cdr (accountcode);
CREATE INDEX IF NOT EXISTS uniqueid_idx ON cdr (uniqueid);
CREATE INDEX IF NOT EXISTS linkedid_idx ON cdr (linkedid);
CREATE INDEX IF NOT EXISTS did_idx ON cdr (did);

