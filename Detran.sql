CREATE DATABASE detran;

USE DETRAN;

CREATE TABLE veiculo (
    vei_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Utilizando o ID ao invés do Chassi para evitar problemas futuros
    vei_placa VARCHAR(7) UNIQUE, -- Veiculo pode n estar emplacado no momento da infracao (ex: carro novo)
    vei_chassi VARCHAR(17) UNIQUE NOT NULL,
    vei_cor VARCHAR(45) NOT NULL,
    vei_ano_fab DATE NOT NULL,
    mar_id INT NOT NULL,
    mod_id INT NOT NULL,
    cat_id INT NOT NULL,
    pro_id INT  NOT NULL
);

CREATE TABLE marca (
    mar_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- Marca do veículo
    mar_nome VARCHAR(45) NOT NULL
);

CREATE TABLE modelo (
    mod_id INT auto_increment PRIMARY KEY NOT NULL,
    mar_id INT NOT NULL,
    mod_nome VARCHAR(45) NOT NULL
);

                    
CREATE TABLE categoria (
    cat_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cat_nome VARCHAR(45) NOT NULL
);

CREATE TABLE proprietario (
    pro_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    pro_cpf VARCHAR(11) UNIQUE NOT NULL ,
    pro_nome VARCHAR(60) NOT NULL,
    pro_logradouro VARCHAR(60) NOT NULL,
    pro_bairro VARCHAR(100) NOT NULL,
    pro_sexo VARCHAR(1) NOT NULL,
    pro_cep VARCHAR(10) NOT NULL,
    pro_dataNasc DATE NOT NULL,
    pro_numero INT UNSIGNED NOT NULL, -- Numero da casa
    cid_id INT NOT NULL,
    cnh_id INT NOT NULL,
    uf_sigla VARCHAR(2) NOT NULL
);

CREATE TABLE cnh (
    cnh_id INT PRIMARY KEY NOT NULL,
    cnh_registro VARCHAR (11) UNIQUE NOT NULL,
    cnh_dataEmissao DATE NOT NULL,
    cnh_vencimento DATE NOT NULL,
    cnh_categoria VARCHAR(2) NOT NULL,
    cnh_pontos INT NOT NULL
);

CREATE TABLE telefone (
    pro_tel_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    pro_tel VARCHAR(20) NOT NULL, -- Possibilita o cadastro de telefones de outros países
    pro_id INT NOT NULL
);

CREATE TABLE cidade (
    cid_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cid_nome VARCHAR(45) NOT NULL,
    uf_sigla VARCHAR(2) NOT NULL
);

CREATE TABLE uf (
    uf_sigla VARCHAR(2) PRIMARY KEY NOT NULL,
    uf_nome VARCHAR(45) NOT NULL
);


CREATE TABLE infracao ( -- A infração é indentificada pelo veiculo infrator, data e tipo de infração
    inf_data DATETIME NOT NULL,
    inf_valor DECIMAL(10 , 2 ) NOT NULL,
    vei_id INT NOT NULL,
    tif_id INT NOT NULL,
    inf_velocidade DECIMAL(4 , 2 ) NOT NULL,
    age_matricula INT NOT NULL,
    loc_id INT NOT NULL,
    PRIMARY KEY (inf_data , tif_id , vei_id)
);

CREATE TABLE localidade (
    loc_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    loc_velMaxima INT UNSIGNED NOT NULL NOT NULL,
    loc_latitude VARCHAR(11) NOT NULL,
    loc_longitude VARCHAR(11) NOT NULL
);

CREATE TABLE tipo_infracao (
    tif_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tif_nome VARCHAR(45) NOT NULL
);
                            
CREATE TABLE agente (
    age_matricula INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    age_nome VARCHAR(45) NOT NULL,
    age_dataContratado DATE NOT NULL
);
                    
                    
ALTER TABLE veiculo ADD FOREIGN KEY (mod_id) REFERENCES modelo(mod_id);
ALTER TABLE veiculo ADD FOREIGN KEY (cat_id) REFERENCES categoria(cat_id);
ALTER TABLE veiculo ADD FOREIGN KEY (pro_id) REFERENCES proprietario(pro_id);
ALTER TABLE veiculo ADD FOREIGN KEY (mar_id) REFERENCES marca(mar_id);

ALTER TABLE modelo ADD FOREIGN KEY (mar_id) REFERENCES marca(mar_id);

ALTER TABLE proprietario ADD FOREIGN KEY (cid_id) REFERENCES cidade(cid_id);
ALTER TABLE proprietario ADD FOREIGN KEY (uf_sigla) REFERENCES uf(uf_sigla);
ALTER TABLE proprietario ADD FOREIGN KEY (cnh_id) REFERENCES cnh(cnh_id);

ALTER TABLE telefone ADD FOREIGN KEY (pro_id) REFERENCES  proprietario(pro_id);
 
ALTER TABLE cidade ADD FOREIGN KEY (uf_sigla) REFERENCES   uf(uf_sigla);
  
ALTER TABLE infracao ADD FOREIGN KEY (vei_id) REFERENCES veiculo(vei_id);
ALTER TABLE infracao ADD FOREIGN KEY (tif_id) REFERENCES tipo_infracao(tif_id);
ALTER TABLE infracao ADD FOREIGN KEY (age_matricula) REFERENCES agente(age_matricula);
ALTER TABLE infracao ADD FOREIGN KEY (loc_id) REFERENCES localidade(loc_id);

