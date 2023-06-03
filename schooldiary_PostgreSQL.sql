CREATE TABLE "public.uczniowie" (
	"id_uczen" integer NOT NULL,
	"klasa" varchar NOT NULL,
	"imie" varchar NOT NULL,
	"nazwisko" varchar NOT NULL,
	"plec" varchar NOT NULL,
	"data_urodzin" DATE NOT NULL,
	CONSTRAINT "uczniowie_pk" PRIMARY KEY ("id_uczen")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.oceny" (
	"id_oceny" serial NOT NULL,
	"id_uczen" integer NOT NULL,
	"przedmiot" serial NOT NULL,
	"ocena_semestr1" serial NOT NULL,
	"ocena_semestr2" serial NOT NULL,
	CONSTRAINT "oceny_pk" PRIMARY KEY ("id_oceny")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.oceny_sem1" (
	"id_oceny_sem1" serial NOT NULL,
	"ocena" FLOAT NOT NULL,
	"data" DATE NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.oceny_sem2" (
	"id_oceny_sem2" serial NOT NULL,
	"ocena" FLOAT NOT NULL,
	"data" DATE NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.kursy" (
	"id_kurs" serial NOT NULL,
	"przedmiot" serial NOT NULL,
	"id_nauczyciel" serial NOT NULL,
	"dzien_tygodnia_poczatek" serial NOT NULL,
	"dzien_tygodnia_koniec" serial NOT NULL,
	"sala" serial NOT NULL,
	CONSTRAINT "kursy_pk" PRIMARY KEY ("id_kurs")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.uczniowie_kursy" (
	"id_uczen" integer NOT NULL,
	"id_kurs" integer NOT NULL,
	CONSTRAINT "uczniowie_kursy_pk" PRIMARY KEY ("id_uczen","id_kurs")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.nauczyciele" (
	"id_nauczyciel" serial NOT NULL,
	"imie" serial NOT NULL,
	"nazwisko" serial NOT NULL,
	"plec" serial NOT NULL,
	"data_urodzin" serial NOT NULL,
	CONSTRAINT "nauczyciele_pk" PRIMARY KEY ("id_nauczyciel")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "oceny" ADD CONSTRAINT "oceny_fk0" FOREIGN KEY ("id_uczen") REFERENCES "uczniowie"("id_uczen");

ALTER TABLE "oceny_sem1" ADD CONSTRAINT "oceny_sem1_fk0" FOREIGN KEY ("id_oceny_sem1") REFERENCES "oceny"("id_oceny");

ALTER TABLE "oceny_sem2" ADD CONSTRAINT "oceny_sem2_fk0" FOREIGN KEY ("id_oceny_sem2") REFERENCES "oceny"("id_oceny");

ALTER TABLE "kursy" ADD CONSTRAINT "kursy_fk0" FOREIGN KEY ("id_nauczyciel") REFERENCES "nauczyciele"("id_nauczyciel");

ALTER TABLE "uczniowie_kursy" ADD CONSTRAINT "uczniowie_kursy_fk0" FOREIGN KEY ("id_uczen") REFERENCES "uczniowie"("id_uczen");
ALTER TABLE "uczniowie_kursy" ADD CONSTRAINT "uczniowie_kursy_fk1" FOREIGN KEY ("id_kurs") REFERENCES "kursy"("id_kurs");









