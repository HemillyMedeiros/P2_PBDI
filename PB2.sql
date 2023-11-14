-- Criar o esquema se ainda não existir
CREATE SCHEMA IF NOT EXISTS tab_youtubers;
-- Selecionar o esquema
SET search_path TO tab_youtubers;

---Criando tabela
CREATE TABLE tab_youtubers (
    id SERIAL PRIMARY KEY,
	rank INT,
    youtuber VARCHAR(255),
	subscriber VARCHAR(255),
	video_view VARCHAR(255),
	video_count VARCHAR(255),
	category VARCHAR(255),
	started VARCHAR(255)
);
