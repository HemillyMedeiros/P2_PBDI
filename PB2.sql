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

-- Criação do Trigger
CREATE OR REPLACE FUNCTION valida_numerico()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.campo_numerico < 0 OR NEW.outro_campo_numerico < 0 THEN
        RAISE EXCEPTION 'Não são permitidos valores negativos em campos numéricos.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
 
-- Associação do Trigger à tabela
CREATE TRIGGER trigger_valida_numerico
BEFORE INSERT OR UPDATE ON tab_youtubers
FOR EACH ROW
EXECUTE FUNCTION valida_numerico();

-- Altera a tabela para adicionar a coluna "ativo"
ALTER TABLE tab_youtubers
ADD COLUMN ativo INTEGER DEFAULT 1 CHECK (ativo IN (0, 1));

--1.4: Tabela log
-- Criação da tabela de log
CREATE TABLE log_youtubers (
    log_id SERIAL PRIMARY KEY,
    youtuber_nome VARCHAR(255),
    youtuber_categoria VARCHAR(255),
    youtuber_ano_inicio INTEGER
    -- Adicione outras colunas conforme necessário
);