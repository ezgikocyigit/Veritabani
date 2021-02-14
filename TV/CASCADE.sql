CREATE TABLE productor1 (
productor_no integer PRIMARY KEY,
name text,
company_country numeric);
CREATE TABLE reyting1 (
reyting_id integer PRIMARY KEY,
occur text
);
CREATE TABLE reyting1_report (
productor_no integer REFERENCES productor1(productor_no) ON DELETE RESTRICT,
reyting_id integer REFERENCES reyting1(reyting_id) ON DELETE CASCADE,
vote integer,
PRIMARY KEY (productor_no,reyting_id)
);

ALTER TABLE tb_show
ADD CONSTRAINT cs FOREIGN KEY (channel_id) REFERENCES tb_channel(id)
ON UPDATE CASCADE
ON DELETE SET NULL

--ALTER TABLE tb_reyting
ADD CONSTRAINT cs FOREIGN KEY (show_id) REFERENCES tb_show(id)
ON UPDATE CASCADE 
ON DELETE SET NULL

CREATE TABLE program (
program_no integer PRIMARY KEY,
name text,
sunum numeric );

CREATE TABLE katilimci
katilimci_id integer PRIMARY KEY,
katilimci_addres text );

CREATE TABLE katilimci_bilgileri
program_no integer REFERENCES program(program_no) ON DELETE RESTRICT,
katilimci_id integer REFERENCES katilimci(katilimci_id) ON DELETE CASCADE;
yaş integer,
PRIMARY KEY (program_no,katilimci_id)
);