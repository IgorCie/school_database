CREATE TABLE "uczniowie" (
	"id_uczen" INT NOT NULL,
	"klasa" VARCHAR2(255) NOT NULL,
	"imie" VARCHAR2(255) NOT NULL,
	"nazwisko" VARCHAR2(255) NOT NULL,
	"plec" VARCHAR2(255) NOT NULL,
	"data_urodzin" DATE NOT NULL,
	constraint UCZNIOWIE_PK PRIMARY KEY ("id_uczen"));


/
CREATE TABLE "oceny" (
	"id_oceny" INT NOT NULL,
	"id_uczen" INT NOT NULL,
	"przedmiot" VARCHAR2(255) NOT NULL,
	"ocena_semestr1" FLOAT NOT NULL,
	"ocena_semestr2" FLOAT NOT NULL,
	constraint OCENY_PK PRIMARY KEY ("id_oceny"));

CREATE sequence "OCENY_ID_OCENY_SEQ";

CREATE trigger "BI_OCENY_ID_OCENY"
  before insert on "oceny"
  for each row
begin
  select "OCENY_ID_OCENY_SEQ".nextval into :NEW."id_oceny" from dual;
end;

/
CREATE TABLE "oceny_sem1" (
	"id_oceny_sem1" INT NOT NULL,
	"ocena" FLOAT NOT NULL,
	"data" DATE NOT NULL);

CREATE sequence "OCENY_SEM1_ID_OCENY_SEM1_SEQ";

CREATE trigger "BI_OCENY_SEM1_ID_OCENY_SEM1"
  before insert on "oceny_sem1"
  for each row
begin
  select "OCENY_SEM1_ID_OCENY_SEM1_SEQ".nextval into :NEW."id_oceny_sem1" from dual;
end;

/
CREATE TABLE "oceny_sem2" (
	"id_oceny_sem2" INT NOT NULL,
	"ocena" FLOAT NOT NULL,
	"data" DATE NOT NULL);

CREATE sequence "OCENY_SEM2_ID_OCENY_SEM2_SEQ";

CREATE trigger "BI_OCENY_SEM2_ID_OCENY_SEM2"
  before insert on "oceny_sem2"
  for each row
begin
  select "OCENY_SEM2_ID_OCENY_SEM2_SEQ".nextval into :NEW."id_oceny_sem2" from dual;
end;

/
CREATE TABLE "kursy" (
	"id_kurs" INT NOT NULL,
	"przedmiot" VARCHAR2(255) NOT NULL,
	"id_nauczyciel" INT NOT NULL,
	"dzien_tygodnia_poczatek" TIMESTAMP NOT NULL,
	"dzien_tygodnia_koniec" TIMESTAMP NOT NULL,
	"sala" VARCHAR2(255) NOT NULL,
	constraint KURSY_PK PRIMARY KEY ("id_kurs"));

CREATE sequence "KURSY_ID_KURS_SEQ";

CREATE trigger "BI_KURSY_ID_KURS"
  before insert on "kursy"
  for each row
begin
  select "KURSY_ID_KURS_SEQ".nextval into :NEW."id_kurs" from dual;
end;
CREATE sequence "KURSY_ID_NAUCZYCIEL_SEQ";

CREATE trigger "BI_KURSY_ID_NAUCZYCIEL"
  before insert on "kursy"
  for each row
begin
  select "KURSY_ID_NAUCZYCIEL_SEQ".nextval into :NEW."id_nauczyciel" from dual;
end;

/
CREATE TABLE "uczniowie_kursy" (
	"id_uczen" INT NOT NULL,
	"id_kurs" INT NOT NULL,
	constraint UCZNIOWIE_KURSY_PK PRIMARY KEY ("id_uczen","id_kurs"));


/
CREATE TABLE "nauczyciele" (
	"id_nauczyciel" INT NOT NULL,
	"imie" VARCHAR2(255) NOT NULL,
	"nazwisko" VARCHAR2(255) NOT NULL,
	"plec" VARCHAR2(255) NOT NULL,
	"data_urodzin" DATE NOT NULL,
	constraint NAUCZYCIELE_PK PRIMARY KEY ("id_nauczyciel"));

CREATE sequence "NAUCZYCIELE_ID_NAUCZYCIEL_SEQ";

CREATE trigger "BI_NAUCZYCIELE_ID_NAUCZYCIEL"
  before insert on "nauczyciele"
  for each row
begin
  select "NAUCZYCIELE_ID_NAUCZYCIEL_SEQ".nextval into :NEW."id_nauczyciel" from dual;
end;

/

ALTER TABLE "oceny" ADD CONSTRAINT "oceny_fk0" FOREIGN KEY ("id_uczen") REFERENCES "uczniowie"("id_uczen");

ALTER TABLE "oceny_sem1" ADD CONSTRAINT "oceny_sem1_fk0" FOREIGN KEY ("id_oceny_sem1") REFERENCES "oceny"("id_oceny");

ALTER TABLE "oceny_sem2" ADD CONSTRAINT "oceny_sem2_fk0" FOREIGN KEY ("id_oceny_sem2") REFERENCES "oceny"("id_oceny");

ALTER TABLE "kursy" ADD CONSTRAINT "kursy_fk0" FOREIGN KEY ("id_nauczyciel") REFERENCES "nauczyciele"("id_nauczyciel");

ALTER TABLE "uczniowie_kursy" ADD CONSTRAINT "uczniowie_kursy_fk0" FOREIGN KEY ("id_uczen") REFERENCES "uczniowie"("id_uczen");
ALTER TABLE "uczniowie_kursy" ADD CONSTRAINT "uczniowie_kursy_fk1" FOREIGN KEY ("id_kurs") REFERENCES "kursy"("id_kurs");


