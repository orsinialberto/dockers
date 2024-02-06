CREATE SCHEMA IF NOT EXISTS kata;

CREATE TABLE IF NOT EXISTS kata.players (
    id VARCHAR(36),
    email VARCHAR(100),
    team VARCHAR(100),
    role VARCHAR(100),
    created_at TIMESTAMP,
    version INTEGER,
    PRIMARY KEY (id)
);
