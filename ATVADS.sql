CREATE DATABASE detran;
USE DETRAN;
CREATE TABLE veiculos (
						vei_placa VARCHAR (7) UNIQUE, 
                        vei_chassi VARCHAR (17) PRIMARY KEY,  
                        vei_cor VARCHAR (45) NOT NULL, 
                        vei_ano_fab DATE NOT NULL,
                        mode_id INT (7) NOT NULL,
						cat_id INT (3) NOT NULL,
                        pro_cpf VARCHAR (11) NOT NULL

                  -- FOREIGN KEY (mode_id) REFERENCES modelo(mod_id),
                      --  FOREIGN KEY (cat_id) REFERENCES categoria(cat_id),
                     --   FOREIGN KEY (pro_cpf) REFERENCES proprietario(pro_cpf)
                        );
					

CREATE TABLE modelo (
					   mod_id INT (7) PRIMARY KEY,
					   mod_nome VARCHAR (45) NOT NULL
					);
                    
CREATE TABLE categoria (
						cat_id INT (3) PRIMARY KEY,
                        cat_nome VARCHAR (45) NOT NULL
					   );
                       
CREATE TABLE proprietario (
							pro_cpf VARCHAR (11) PRIMARY KEY,
							pro_nome VARCHAR (60) NOT NULL, 
                            pro_logradouro VARCHAR (60)NOT NULL, 
							pro_uf VARCHAR(2) NOT NULL,
                            pro_bairro VARCHAR (100) NOT NULL,
							pro_sexo VARCHAR (1) NOT NULL,   
							pro_dataNasc DATE NOT NULL,
                            pro_numero INT NOT NULL,
                            cid_id INT,
                            uf_sigla VARCHAR (2)
						-- FOREIGN KEY (cid_id) REFERENCES cidade(cid_id),
						-- FOREIGN KEY (uf_sigla) REFERENCES uf(uf_sigla)
                            );


CREATE TABLE telefone (  
							pro_telefone VARCHAR (20) NOT NULL,
							pro_cpf INT (11)
							-- FOREIGN KEY (pro_cpf) REFERENCES proprietario(pro_cpf)
                           
					  );

CREATE TABLE cidade (
						cid_id INT PRIMARY KEY AUTO_INCREMENT,
                        cid_nome VARCHAR (45) NOT NULL,
                        uf_sigla VARCHAR (2)
                        -- FOREIGN KEY (uf_sigla) REFERENCES uf(uf_sigla)
					);

CREATE TABLE uf(
						uf_sigla VARCHAR (2) PRIMARY KEY,
                        uf_nome VARCHAR (45) NOT NULL
				);


CREATE TABLE infracao (
						inf_data DATE PRIMARY KEY,
                        inf_valor DECIMAL (11,2) NOT NULL,
                        vei_chassi VARCHAR (17),
                        tipo_infracao_tif_id INT NOT NULL,
                        inf_velocidade DECIMAL (4,2),
                        age_matricula INT,
                        loc_id INT
					-- FOREIGN KEY (vei_chassi) REFERENCES veiculo(vei_chassi),
					-- FOREIGN KEY (tipo_infracao_tif_id) REFERENCES tipo_infracao(tif_id),
					-- FOREIGN KEY (age_matricula) REFERENCES agente(age_matricula),
                     --   FOREIGN KEY (loc_id) REFERENCES localidade(loc_id)
                       
					   );

CREATE TABLE localidade (
							loc_id INT PRIMARY KEY AUTO_INCREMENT,
                            loc_velMaxima INT NOT NULL,
							loc_latitude DECIMAL(2.8) NOT NULL,
                            loc_longitude DECIMAL (3.8) NOT NULL
						);

CREATE TABLE tipo_infracao (
							tif_id INT PRIMARY KEY AUTO_INCREMENT,
                            tif_nome VARCHAR (45) NOT NULL
							);
                            
CREATE TABLE  agente(
						age_matricula INT PRIMARY KEY AUTO_INCREMENT,
                        age_nome VARCHAR (45) NOT NULL,
                        age_dataContratado DATE NOT NULL
					);
                    
                    
ALTER TABLE veiculos ADD FOREIGN KEY (mode_id) REFERENCES modelo(mod_id);
ALTER TABLE veiculos ADD FOREIGN KEY (cat_id) REFERENCES categoria(cat_id);
ALTER TABLE veiculos ADD FOREIGN KEY (pro_cpf) REFERENCES proprietarios(pro_cpf);

ALTER TABLE proprietarios ADD FOREIGN KEY (cid_id) REFERENCES cidade(cid_id);
ALTER TABLE proprietarios ADD FOREIGN KEY (uf_sigla) REFERENCES uf(uf_sigla);

-- ALTER TABLE telefone ADD FOREIGN KEY (pro_cpf) REFERENCES  proprietarios(pro_cpf);
 
ALTER TABLE cidade ADD FOREIGN KEY (uf_sigla) REFERENCES   uf(uf_sigla);
  
ALTER TABLE infracao ADD FOREIGN KEY (vei_chassi) REFERENCES veiculos(vei_chassi);
ALTER TABLE infracao ADD FOREIGN KEY (tipo_infracao_tif_id) REFERENCES tipo_infracao(tif_id);
ALTER TABLE infracao ADD FOREIGN KEY (age_matricula) REFERENCES agente(age_matricula);
ALTER TABLE infracao ADD FOREIGN KEY (loc_id) REFERENCES localidade(loc_id);
 
