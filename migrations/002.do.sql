CREATE TABLE IF NOT EXISTS download_batches (
  id UUID PRIMARY KEY NOT NULL DEFAULT GEN_RANDOM_UUID(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  batch_tag TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS upload_batches (
  id UUID PRIMARY KEY NOT NULL DEFAULT GEN_RANDOM_UUID(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  exposure_count INT NOT NULL,
  last_exposure_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS metrics_payloads (
  id UUID PRIMARY KEY NOT NULL DEFAULT GEN_RANDOM_UUID(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  event TEXT NOT NULL,
  payload JSON NOT NULL
);

ALTER TABLE exposures ADD COLUMN IF NOT EXISTS regions TEXT[];

ALTER TABLE exposure_export_files
  ADD COLUMN IF NOT EXISTS region TEXT,
  ADD COLUMN IF NOT EXISTS since_exposure_id INT NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS first_exposure_created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE registrations ADD COLUMN IF NOT EXISTS last_refresh TIMESTAMPTZ NULL;

ALTER TABLE settings ADD COLUMN IF NOT EXISTS is_language BOOLEAN DEFAULT FALSE;

ALTER TABLE tokens ADD COLUMN IF NOT EXISTS description TEXT;

ALTER TABLE upload_tokens ALTER COLUMN onset_date DROP NOT NULL;

ALTER TABLE verifications ALTER COLUMN onset_date DROP NOT NULL;