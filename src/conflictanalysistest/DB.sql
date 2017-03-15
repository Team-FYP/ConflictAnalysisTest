DROP DATABASE IF EXISTS conflict_analysis_test_db;
CREATE DATABASE conflict_analysis_test_db;
USE conflict_analysis_test_db;

CREATE TABLE category(category_id INT(4) PRIMARY KEY, 
category_name VARCHAR(50));


CREATE TABLE drug(drug_id INT(4) PRIMARY KEY, 
drug_name VARCHAR(50),
category_id INT(4),
CONSTRAINT FOREIGN KEY drug(category_id) REFERENCES category(category_id) ON UPDATE CASCADE ON DELETE CASCADE);


CREATE TABLE disease(disease_id INT(4) PRIMARY KEY, 
disease_name VARCHAR(50));

CREATE TABLE patient(patient_id INT(4) PRIMARY KEY, 
patient_name VARCHAR(50));

CREATE TABLE path(path_id INT(4) PRIMARY KEY);

CREATE TABLE path_category(path_id INT(4), 
category_id INT(4),
CONSTRAINT PRIMARY KEY (path_id, category_id),
CONSTRAINT FOREIGN KEY path_category(path_id) REFERENCES path(path_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY path_category(category_id) REFERENCES category(category_id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE d_d_interaction(drug1_id INT(4), 
drug2_id INT(4),
severity INT(4),
CONSTRAINT PRIMARY KEY (drug1_id, drug2_id),
CONSTRAINT FOREIGN KEY d_d_interaction(drug1_id) REFERENCES drug(drug_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY d_d_interaction2(drug2_id) REFERENCES drug(drug_id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE d_di_interaction(drug_id INT(4), 
disease_id INT(4),
severity INT(4),
CONSTRAINT PRIMARY KEY (drug_id, disease_id),
CONSTRAINT FOREIGN KEY d_di_interaction(drug_id) REFERENCES drug(drug_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY d_di_interaction2(disease_id) REFERENCES disease(disease_id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE d_p_interaction(drug_id INT(4), 
patient_id INT(4),
severity INT(4),
CONSTRAINT PRIMARY KEY (drug_id, patient_id),
CONSTRAINT FOREIGN KEY d_p_interaction(drug_id) REFERENCES drug(drug_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY d_p_interaction2(patient_id) REFERENCES patient(patient_id) ON UPDATE CASCADE ON DELETE CASCADE);