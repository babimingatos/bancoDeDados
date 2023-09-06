CREATE DATABASE detran;



CREATE TABLE veiculos (
						vei_id int PRIMARY KEY AUTO_INCREMENT, 
						vei_placa VARCHAR (7) NOT NULL UNIQUE, 
                        vei_chassi VARCHAR (17) NOT NULL UNIQUE,  
                        vei_cor VARCHAR (45) NOT NULL, 
                        vei_modelo VARCHAR (45) NOT NULL, 
                        vei_categoria VARCHAR (45) NOT NULL, 
                        vei_ano_fab INT (4) NOT NULL, 
                        pro_id INT,
                        vei_modelo INT,
						FOREIGN KEY (pro_id) REFERENCES proprietarios(pro_id),
                        FOREIGN KEY (vei_modelo) REFERENCES vei_modelos(modelos_id)
                        );

CREATE TABLE proprietarios (
							pro_id int PRIMARY KEY AUTO_INCREMENT, 
							pro_cpf VARCHAR (14) UNIQUE NOT NULL,
							pro_nome VARCHAR (100) NOT NULL, 
                            pro_endereco VARCHAR (100)NOT NULL, 
                            pro_bairro VARCHAR (100) NOT NULL,
                            pro_telefone VARCHAR (20) NOT NULL,
                            pro_cidade VARCHAR (100) NOT NULL, 
                            pro_estado VARCHAR(45) NOT NULL,
                            vei_id INT,
                            FOREIGN KEY (vei_id) REFERENCES veiculos(vei_id),
                            FOREIGN KEY (pro_telefone) REFERENCES pro_telefones(pro_id)
                            );

CREATE TABLE pro_telefones (
							pro_id INT,
                            pro_telefone VARCHAR (20) NOT NULL,
                            pro_tel_id INT PRIMARY KEY AUTO_INCREMENT,
							FOREIGN KEY (pro_id) REFERENCES proprietarios(pro_id)
						   );

CREATE TABLE vei_modelos(
						 modelos_id INT (6)PRIMARY KEY NOT NULL,
                         vei_id int,
                         modelo_nome VARCHAR (45) NOT NULL
						);
