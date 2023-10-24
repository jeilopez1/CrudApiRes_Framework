BEGIN TRANSACTION;
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_academicperiod";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_academicperiod" (
	"id"	integer NOT NULL,
	"datetimeStartPeriod"	datetime NOT NULL,
	"datetimeFinalPeriod"	datetime NOT NULL,
	"datetimeFinalApplication"	datetime NOT NULL,
	"year"	integer NOT NULL,
	"semester"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_crudpermission";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_crudpermission" (
	"id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_educationlevel";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_educationlevel" (
	"id"	integer NOT NULL,
	"educationLevel"	varchar(100) NOT NULL,
	"descriptionEducationLevel"	varchar(500) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_guestgroup";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_guestgroup" (
	"id"	integer NOT NULL,
	"nameGroup"	varchar(700) NOT NULL,
	"groupDescription"	varchar(700) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_roleacademic";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_roleacademic" (
	"id"	integer NOT NULL,
	"typeRoleAcademic"	varchar(150) NOT NULL,
	"descriptionRoleAcademic"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_statusapplicartion";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_statusapplicartion" (
	"id"	integer NOT NULL,
	"typeStatusApplicartion"	varchar(60) NOT NULL,
	"descriptionStatusApplicartion"	varchar(500) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_statussubject";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_statussubject" (
	"id"	integer NOT NULL,
	"typeStatusSubject"	varchar(100) NOT NULL,
	"descriptionStatusSubject"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_statusunit";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_statusunit" (
	"id"	integer NOT NULL,
	"typeStatusunit"	varchar(100) NOT NULL,
	"descriptionStatusunit"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_statususer";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_statususer" (
	"id"	integer NOT NULL,
	"typeStatusUser"	varchar(100) NOT NULL,
	"descriptionStatusUser"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_studymodality";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_studymodality" (
	"id"	integer NOT NULL,
	"studyModality"	varchar(100) NOT NULL,
	"descriptionModality"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_typeidentification";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_typeidentification" (
	"id"	integer NOT NULL,
	"typeIdentification"	varchar(100) NOT NULL,
	"descriptionTypeIdentification"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_user";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_user" (
	"id"	integer NOT NULL,
	"nameUser"	varchar(100) NOT NULL,
	"lastNameUser"	varchar(100) NOT NULL,
	"PEGE_ID"	integer NOT NULL,
	"identificationNumber"	integer NOT NULL,
	"statusUser_id"	bigint NOT NULL,
	"typeIdentification_id"	bigint NOT NULL,
	FOREIGN KEY("statusUser_id") REFERENCES "practicasAcademicas_statususer"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("typeIdentification_id") REFERENCES "practicasAcademicas_typeidentification"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_userfunction";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_userfunction" (
	"id"	integer NOT NULL,
	"userFunction"	varchar(50) NOT NULL,
	"descriptionUser"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_usersubject";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_usersubject" (
	"id"	integer NOT NULL,
	"updateDate"	datetime NOT NULL,
	"subject_id"	bigint NOT NULL,
	"user_id"	bigint NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "practicasAcademicas_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("subject_id") REFERENCES "practicasAcademicas_subject"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_subject";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_subject" (
	"id"	integer NOT NULL,
	"nameSubject"	varchar(100) NOT NULL,
	"statusSubject_id"	bigint NOT NULL,
	"unit_id"	bigint NOT NULL,
	FOREIGN KEY("unit_id") REFERENCES "practicasAcademicas_unit"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("statusSubject_id") REFERENCES "practicasAcademicas_statussubject"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_requestinvitaction";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_requestinvitaction" (
	"id"	integer NOT NULL,
	"datetimeRequestInvitaction"	datetime NOT NULL,
	"guestGroup_id"	bigint NOT NULL,
	"user_id"	bigint NOT NULL,
	"userFunction_id"	bigint NOT NULL,
	FOREIGN KEY("userFunction_id") REFERENCES "practicasAcademicas_userfunction"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("guestGroup_id") REFERENCES "practicasAcademicas_guestgroup"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "practicasAcademicas_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_processstagehistory";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_processstagehistory" (
	"id"	integer NOT NULL,
	"datetimeUpdateProcess"	datetime NOT NULL,
	"justification"	varchar(500) NOT NULL,
	"processStage_id"	bigint NOT NULL,
	"user_id"	bigint NOT NULL,
	FOREIGN KEY("processStage_id") REFERENCES "practicasAcademicas_processstage"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "practicasAcademicas_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "practicasAcademicas_practiceassistants";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_practiceassistants" (
	"id"	integer NOT NULL,
	"datetimeConfirmation"	datetime NOT NULL,
	"nameEPS"	varchar(50) NOT NULL,
	"certificateEPS"	varchar(100) NOT NULL,
	"applicartion_id"	bigint NOT NULL,
	"requestInvitaction_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("requestInvitaction_id") REFERENCES "practicasAcademicas_requestinvitaction"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("applicartion_id") REFERENCES "practicasAcademicas_applicartion"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "practicasAcademicas_notificationrequestinvitaction";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_notificationrequestinvitaction" (
	"id"	integer NOT NULL,
	"notificationDetail"	varchar(700) NOT NULL,
	"meansNotification"	varchar(60) NOT NULL,
	"datetimeNotification"	datetime NOT NULL,
	"requestInvitaction_id"	bigint NOT NULL,
	"user_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "practicasAcademicas_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("requestInvitaction_id") REFERENCES "practicasAcademicas_requestinvitaction"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "projects_project";
CREATE TABLE IF NOT EXISTS "projects_project" (
	"id"	integer NOT NULL,
	"title"	varchar(200) NOT NULL,
	"description"	text NOT NULL,
	"technology"	varchar(200) NOT NULL,
	"created_at"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "django_session";
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
DROP TABLE IF EXISTS "practicasAcademicas_typeunit";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_typeunit" (
	"id"	integer NOT NULL,
	"nameType"	varchar(70) NOT NULL,
	"descriptionTypeUnit"	varchar(500) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_unit";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_unit" (
	"id"	integer NOT NULL,
	"nameunit"	varchar(100) NOT NULL,
	"descriptionUnit"	varchar(500) NOT NULL,
	"educationLevel_id"	bigint NOT NULL,
	"statusUnit_id"	bigint NOT NULL,
	"studyModality_id"	bigint NOT NULL,
	"typeUnit_id"	bigint NOT NULL,
	"ancestor_id"	bigint,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("ancestor_id") REFERENCES "practicasAcademicas_unit"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("studyModality_id") REFERENCES "practicasAcademicas_studymodality"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("typeUnit_id") REFERENCES "practicasAcademicas_typeunit"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("educationLevel_id") REFERENCES "practicasAcademicas_educationlevel"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("statusUnit_id") REFERENCES "practicasAcademicas_statusunit"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "practicasAcademicas_processstage";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_processstage" (
	"id"	integer NOT NULL,
	"nameProcessStage"	varchar(60) NOT NULL,
	"backProcessStage"	varchar(60) NOT NULL,
	"nextProcessStage"	varchar(60) NOT NULL,
	"descriptionProcessStage"	varchar(500) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_workerrole";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_workerrole" (
	"id"	integer NOT NULL,
	"nameWorkerRole"	varchar(50) NOT NULL,
	"DescriptionWorkerRole"	varchar(500) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_workerunit";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_workerunit" (
	"id"	integer NOT NULL,
	"datetimeCreate"	datetime NOT NULL,
	"unit_id"	bigint NOT NULL,
	"user_id"	bigint NOT NULL,
	"workerRole_id"	bigint NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "practicasAcademicas_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("unit_id") REFERENCES "practicasAcademicas_unit"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("workerRole_id") REFERENCES "practicasAcademicas_workerrole"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_userroleacademic";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_userroleacademic" (
	"id"	integer NOT NULL,
	"startDate"	datetime NOT NULL,
	"finaleDate"	datetime NOT NULL,
	"user_id"	bigint NOT NULL,
	"roleAcademic_id"	bigint NOT NULL,
	FOREIGN KEY("roleAcademic_id") REFERENCES "practicasAcademicas_roleacademic"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "practicasAcademicas_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "practicasAcademicas_applicartion";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_applicartion" (
	"id"	integer NOT NULL,
	"datetimeStartapplicartion"	datetime NOT NULL,
	"datetimeFinalapplicartion"	datetime NOT NULL,
	"routePracticeProject"	varchar(100) NOT NULL,
	"routeWorkGuide"	varchar(100) NOT NULL,
	"routeContigencyPlan"	varchar(100) NOT NULL,
	"academicPeriod_id"	bigint NOT NULL,
	"processStageHistory_id"	bigint NOT NULL,
	"statusApplicartion_id"	bigint NOT NULL,
	"user_id"	bigint NOT NULL,
	"typeAcademicPractice_id"	bigint,
	"routeAcceptancedocument"	varchar(100),
	FOREIGN KEY("academicPeriod_id") REFERENCES "practicasAcademicas_academicperiod"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "practicasAcademicas_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("processStageHistory_id") REFERENCES "practicasAcademicas_processstagehistory"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("statusApplicartion_id") REFERENCES "practicasAcademicas_statusapplicartion"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("typeAcademicPractice_id") REFERENCES "practicasAcademicas_typeacademicpractice"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "practicasAcademicas_typeacademicpractice";
CREATE TABLE IF NOT EXISTS "practicasAcademicas_typeacademicpractice" (
	"id"	integer NOT NULL,
	"typeAcademicPractice"	varchar(50) NOT NULL,
	"DescriptionAcademicPractice"	varchar(500) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2023-10-16 05:42:48.429907');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (2,'auth','0001_initial','2023-10-16 05:42:48.463466');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (3,'admin','0001_initial','2023-10-16 05:42:48.487742');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (4,'admin','0002_logentry_remove_auto_add','2023-10-16 05:42:48.510119');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (5,'admin','0003_logentry_add_action_flag_choices','2023-10-16 05:42:48.523242');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (6,'contenttypes','0002_remove_content_type_name','2023-10-16 05:42:48.558583');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (7,'auth','0002_alter_permission_name_max_length','2023-10-16 05:42:48.579669');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (8,'auth','0003_alter_user_email_max_length','2023-10-16 05:42:48.598527');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (9,'auth','0004_alter_user_username_opts','2023-10-16 05:42:48.612838');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (10,'auth','0005_alter_user_last_login_null','2023-10-16 05:42:48.631396');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (11,'auth','0006_require_contenttypes_0002','2023-10-16 05:42:48.640931');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (12,'auth','0007_alter_validators_add_error_messages','2023-10-16 05:42:48.655953');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (13,'auth','0008_alter_user_username_max_length','2023-10-16 05:42:48.678380');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (14,'auth','0009_alter_user_last_name_max_length','2023-10-16 05:42:48.698615');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (15,'auth','0010_alter_group_name_max_length','2023-10-16 05:42:48.719810');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (16,'auth','0011_update_proxy_permissions','2023-10-16 05:42:48.734178');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (17,'auth','0012_alter_user_first_name_max_length','2023-10-16 05:42:48.756558');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (18,'practicasAcademicas','0001_initial','2023-10-16 05:42:48.980604');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (19,'projects','0001_initial','2023-10-16 05:42:48.992691');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (20,'sessions','0001_initial','2023-10-16 05:42:49.011190');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (21,'practicasAcademicas','0002_unit_ancestor_unit_predecessor_and_more','2023-10-19 03:36:46.925148');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (22,'practicasAcademicas','0003_remove_unit_predecessor','2023-10-19 03:40:00.621347');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (23,'practicasAcademicas','0004_alter_unit_descriptionunit','2023-10-19 03:44:44.788441');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (24,'practicasAcademicas','0005_alter_unit_ancestor','2023-10-19 03:54:08.849711');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (25,'practicasAcademicas','0006_alter_processstage_descriptionprocessstage','2023-10-19 05:14:59.095546');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (26,'practicasAcademicas','0007_workerrole_workerunit_rename_role_roleacademic_and_more','2023-10-20 00:58:26.925952');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (27,'practicasAcademicas','0008_typeacademicpractice_and_more','2023-10-20 03:59:16.104660');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (28,'practicasAcademicas','0009_remove_applicartion_typepractice_and_more','2023-10-22 17:20:25.655276');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (1,'1','Activo',1,'[{"added": {}}]',16,1,'2023-10-19 01:37:15.004178');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (2,'2','Inactivo',1,'[{"added": {}}]',16,1,'2023-10-19 01:37:34.865390');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (3,'1','Activo',1,'[{"added": {}}]',17,1,'2023-10-19 01:38:22.898349');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (4,'2','Inactivo',1,'[{"added": {}}]',17,1,'2023-10-19 01:38:38.843122');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (5,'1','typeUnit object (1)',1,'[{"added": {}}]',22,1,'2023-10-19 01:42:49.710460');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (6,'2','typeUnit object (2)',1,'[{"added": {}}]',22,1,'2023-10-19 01:44:02.618057');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (7,'2','Facultad',2,'[{"changed": {"fields": ["DescriptionTypeUnit"]}}]',22,1,'2023-10-19 02:45:30.924774');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (8,'3','Vicerrectoria',1,'[{"added": {}}]',22,1,'2023-10-19 02:46:53.508941');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (9,'2','Facultad',2,'[{"changed": {"fields": ["DescriptionTypeUnit"]}}]',22,1,'2023-10-19 02:47:38.023598');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (10,'1','Programa Académico',2,'[{"changed": {"fields": ["DescriptionTypeUnit"]}}]',22,1,'2023-10-19 02:47:57.540976');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (11,'1','Pregrado',1,'[{"added": {}}]',11,1,'2023-10-19 02:54:13.343293');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (12,'2','Posgrado',1,'[{"added": {}}]',11,1,'2023-10-19 02:56:43.815808');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (13,'1','Distancia',1,'[{"added": {}}]',19,1,'2023-10-19 02:58:53.596806');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (14,'2','Presencial',1,'[{"added": {}}]',19,1,'2023-10-19 03:05:14.499363');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (15,'1','Distancia',2,'[{"changed": {"fields": ["DescriptionModality"]}}]',19,1,'2023-10-19 03:05:29.990016');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (16,'1','Ingeniería de Sistemas',1,'[{"added": {}}]',27,1,'2023-10-19 03:38:17.274875');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (17,'1','Ingeniería de Sistemas',3,'',27,1,'2023-10-19 03:39:36.378429');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (18,'3','Ninguna',1,'[{"added": {}}]',19,1,'2023-10-19 03:46:11.616019');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (19,'3','Ninguna',1,'[{"added": {}}]',11,1,'2023-10-19 03:46:37.302808');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (20,'3','N/A',2,'[{"changed": {"fields": ["EducationLevel"]}}]',11,1,'2023-10-19 03:46:51.628716');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (21,'3','N/A',2,'[{"changed": {"fields": ["StudyModality", "DescriptionModality"]}}]',19,1,'2023-10-19 03:46:59.559829');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (22,'4','Concejo superior',1,'[{"added": {}}]',22,1,'2023-10-19 03:47:22.410639');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (23,'1','Concejo Superior',1,'[{"added": {}}]',27,1,'2023-10-19 03:47:30.101624');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (24,'1','Concejo Superior',1,'[{"added": {}}]',27,1,'2023-10-19 03:57:48.696869');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (25,'1','Concejo Superior',2,'[]',27,1,'2023-10-19 03:57:56.297713');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (26,'5','Rectoría',1,'[{"added": {}}]',22,1,'2023-10-19 04:00:55.973946');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (27,'2','Rectoría',1,'[{"added": {}}]',27,1,'2023-10-19 04:01:02.023588');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (28,'3','Vicerrectoría Académica',1,'[{"added": {}}]',27,1,'2023-10-19 04:03:19.553986');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (29,'4','Vicerrectoría Administrativa y Financiera',1,'[{"added": {}}]',27,1,'2023-10-19 04:04:14.260476');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (30,'5','Vicerrectoría de Investigaciones, Extensión y Proyección Social',1,'[{"added": {}}]',27,1,'2023-10-19 04:05:08.552405');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (31,'6','Facultad de Ingenieria',1,'[{"added": {}}]',27,1,'2023-10-19 04:13:28.859999');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (32,'7','Ingeniería de Sistemas',1,'[{"added": {}}]',27,1,'2023-10-19 04:14:41.682853');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (33,'8','Ingeniería Agroecológica',1,'[{"added": {}}]',27,1,'2023-10-19 04:16:39.149607');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (34,'1','Redes Informáticas I',1,'[{"added": {}}]',20,1,'2023-10-19 04:18:21.117687');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (35,'1','Redes Informáticas I',2,'[]',20,1,'2023-10-19 04:18:25.867480');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (36,'2','Administración de base de datos',1,'[{"added": {}}]',20,1,'2023-10-19 04:20:34.749464');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (37,'6','Oficina',1,'[{"added": {}}]',22,1,'2023-10-19 04:27:03.248075');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (38,'9','Oficina Tecnologías de la Información',1,'[{"added": {}}]',27,1,'2023-10-19 04:28:30.210229');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (39,'1','Administrativo',1,'[{"added": {}}]',14,1,'2023-10-19 04:31:26.357740');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (40,'2','Docente',1,'[{"added": {}}]',14,1,'2023-10-19 04:32:50.997340');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (41,'3','Estudiante',1,'[{"added": {}}]',14,1,'2023-10-19 04:33:59.862576');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (42,'1','Activo',1,'[{"added": {}}]',18,1,'2023-10-19 04:34:51.777212');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (43,'2','Inactivo',1,'[{"added": {}}]',18,1,'2023-10-19 04:35:17.736144');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (44,'1','Cedula de Ciudadania',1,'[{"added": {}}]',21,1,'2023-10-19 04:36:55.142823');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (45,'2','Tarjeta de Identidad',1,'[{"added": {}}]',21,1,'2023-10-19 04:37:38.421870');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (46,'3','Cedula de Extranjería',1,'[{"added": {}}]',21,1,'2023-10-19 04:39:46.364718');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (47,'1','Yeisson Leonardo',1,'[{"added": {}}]',23,1,'2023-10-19 04:41:25.771626');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (48,'2','Leidy Johana',1,'[{"added": {}}]',23,1,'2023-10-19 04:42:03.733334');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (49,'3','Alfonso',1,'[{"added": {}}]',23,1,'2023-10-19 04:42:37.688247');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (50,'4','LUBEIMAR EDUARDO',1,'[{"added": {}}]',23,1,'2023-10-19 04:45:51.575378');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (51,'5','Fidelio',1,'[{"added": {}}]',23,1,'2023-10-19 04:49:39.281821');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (52,'6','Kelly Johanna',1,'[{"added": {}}]',23,1,'2023-10-19 04:50:01.209324');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (53,'1','userRole object (1)',1,'[{"added": {}}]',26,1,'2023-10-19 04:52:45.546023');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (54,'2','Leidy Johana',1,'[{"added": {}}]',26,1,'2023-10-19 04:55:46.343578');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (55,'3','LUBEIMAR EDUARDO',1,'[{"added": {}}]',26,1,'2023-10-19 04:56:25.720887');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (56,'4','Fidelio',1,'[{"added": {}}]',26,1,'2023-10-19 04:56:45.920745');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (57,'5','Kelly Johanna',1,'[{"added": {}}]',26,1,'2023-10-19 04:57:07.596132');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (58,'1','userSubject object (1)',1,'[{"added": {}}]',25,1,'2023-10-19 05:01:37.882042');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (59,'2','userSubject object (2)',1,'[{"added": {}}]',25,1,'2023-10-19 05:01:55.457180');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (60,'7','Brayan Albeiro',1,'[{"added": {}}]',23,1,'2023-10-19 05:02:49.887390');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (61,'3','userSubject object (3)',1,'[{"added": {}}]',25,1,'2023-10-19 05:03:01.184351');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (62,'1','Redes Informáticas I - 2023-II - Grupo 1',2,'[{"changed": {"fields": ["NameSubject"]}}]',20,1,'2023-10-19 05:08:24.623349');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (63,'1','2023-08-08 00:00:00-05:00 - 2023-12-15 00:00:00-05:00',1,'[{"added": {}}]',8,1,'2023-10-19 05:12:14.885976');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (64,'1','Activo',1,'[{"added": {}}]',15,1,'2023-10-19 05:12:43.866776');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (65,'2','Inactiva',1,'[{"added": {}}]',15,1,'2023-10-19 05:13:00.467906');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (66,'3','Inactiva',1,'[{"added": {}}]',15,1,'2023-10-19 05:13:00.552720');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (67,'1','processStage object (1)',1,'[{"added": {}}]',13,1,'2023-10-19 05:16:24.325298');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (68,'2','Enviado a revisión del Presidente Comité de Currículo',1,'[{"added": {}}]',13,1,'2023-10-19 05:19:48.545052');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (69,'3','Inactiva',3,'',15,1,'2023-10-19 05:20:30.095306');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (70,'1','processStageHistory object (1)',1,'[{"added": {}}]',29,1,'2023-10-19 05:23:57.584953');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (71,'1','applicartion object (1)',1,'[{"added": {}}]',9,1,'2023-10-20 00:16:17.219241');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (72,'1','Coordinador',1,'[{"added": {}}]',33,1,'2023-10-20 01:01:41.097173');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (73,'2','Técnico Administrativo',1,'[{"added": {}}]',33,1,'2023-10-20 01:02:31.610165');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (74,'3','Decano',1,'[{"added": {}}]',33,1,'2023-10-20 01:06:00.309062');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (75,'1','Yeisson Leonardo - Técnico Administrativo',1,'[{"added": {}}]',34,1,'2023-10-20 01:06:37.081145');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (76,'2','Kelly Johanna - Decano',1,'[{"added": {}}]',34,1,'2023-10-20 01:06:56.953860');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (77,'4','Docente Catedratico',1,'[{"added": {}}]',33,1,'2023-10-20 01:07:36.590664');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (78,'3','LUBEIMAR EDUARDO - Docente Catedratico',1,'[{"added": {}}]',34,1,'2023-10-20 01:07:43.234372');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (79,'8','Miguel Leonardo',1,'[{"added": {}}]',23,1,'2023-10-20 01:08:29.758630');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (80,'4','Miguel Leonardo - Coordinador',1,'[{"added": {}}]',34,1,'2023-10-20 01:08:36.146452');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (81,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:22:24.377934');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (82,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:25:13.075820');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (83,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:29:24.699849');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (84,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:30:59.215200');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (85,'1','applicartion object (1)',2,'[]',9,1,'2023-10-20 01:32:21.289228');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (86,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:32:49.527833');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (87,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:33:51.737257');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (88,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:36:23.022534');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (89,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:37:40.090478');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (90,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:39:25.591545');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (91,'1','applicartion object (1)',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide", "RouteAcceptancedocument", "RouteContigencyPlan"]}}]',9,1,'2023-10-20 01:40:53.779316');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (92,'1','LUBEIMAR EDUARDO - Notificación a Invitados',2,'[{"changed": {"fields": ["RoutePracticeProject", "RouteWorkGuide"]}}]',9,1,'2023-10-20 02:52:31.543925');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (93,'1','Interna',1,'[{"added": {}}]',35,1,'2023-10-20 04:01:30.952458');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (94,'2','Externa',1,'[{"added": {}}]',35,1,'2023-10-20 04:02:13.352669');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (95,'1','LUBEIMAR EDUARDO - Notificación a Invitados',2,'[{"changed": {"fields": ["TypeAcademicPractice"]}}]',9,1,'2023-10-20 04:02:20.958313');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (96,'3','LUBEIMAR EDUARDO - Notificación a Invitados',3,'',9,1,'2023-10-24 01:12:18.809350');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (97,'2','LUBEIMAR EDUARDO - Notificación a Invitados',3,'',9,1,'2023-10-24 01:12:18.819303');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (2,'auth','permission');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (3,'auth','group');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (4,'auth','user');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (6,'sessions','session');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (7,'projects','project');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (8,'practicasAcademicas','academicperiod');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (9,'practicasAcademicas','applicartion');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (10,'practicasAcademicas','crudpermission');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (11,'practicasAcademicas','educationlevel');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (12,'practicasAcademicas','guestgroup');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (13,'practicasAcademicas','processstage');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (14,'practicasAcademicas','roleacademic');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (15,'practicasAcademicas','statusapplicartion');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (16,'practicasAcademicas','statussubject');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (17,'practicasAcademicas','statusunit');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (18,'practicasAcademicas','statususer');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (19,'practicasAcademicas','studymodality');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (20,'practicasAcademicas','subject');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (21,'practicasAcademicas','typeidentification');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (22,'practicasAcademicas','typeunit');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (23,'practicasAcademicas','user');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (24,'practicasAcademicas','userfunction');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (25,'practicasAcademicas','usersubject');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (26,'practicasAcademicas','userroleacademic');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (27,'practicasAcademicas','unit');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (28,'practicasAcademicas','requestinvitaction');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (29,'practicasAcademicas','processstagehistory');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (30,'practicasAcademicas','practiceassistants');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (31,'practicasAcademicas','notificationrequestinvitaction');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (32,'practicasAcademicas','headunit');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (33,'practicasAcademicas','workerrole');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (34,'practicasAcademicas','workerunit');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (35,'practicasAcademicas','typeacademicpractice');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (25,7,'add_project','Can add project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (26,7,'change_project','Can change project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (27,7,'delete_project','Can delete project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (28,7,'view_project','Can view project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (29,8,'add_academicperiod','Can add academic period');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (30,8,'change_academicperiod','Can change academic period');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (31,8,'delete_academicperiod','Can delete academic period');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (32,8,'view_academicperiod','Can view academic period');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (33,9,'add_applicartion','Can add applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (34,9,'change_applicartion','Can change applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (35,9,'delete_applicartion','Can delete applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (36,9,'view_applicartion','Can view applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (37,10,'add_crudpermission','Can add crud permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (38,10,'change_crudpermission','Can change crud permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (39,10,'delete_crudpermission','Can delete crud permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (40,10,'view_crudpermission','Can view crud permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (41,10,'can_CRUD','Can perform CRUD operations');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (42,11,'add_educationlevel','Can add education level');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (43,11,'change_educationlevel','Can change education level');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (44,11,'delete_educationlevel','Can delete education level');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (45,11,'view_educationlevel','Can view education level');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (46,12,'add_guestgroup','Can add guest group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (47,12,'change_guestgroup','Can change guest group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (48,12,'delete_guestgroup','Can delete guest group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (49,12,'view_guestgroup','Can view guest group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (50,13,'add_processstage','Can add process stage');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (51,13,'change_processstage','Can change process stage');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (52,13,'delete_processstage','Can delete process stage');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (53,13,'view_processstage','Can view process stage');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (54,14,'add_role','Can add role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (55,14,'change_role','Can change role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (56,14,'delete_role','Can delete role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (57,14,'view_role','Can view role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (58,15,'add_statusapplicartion','Can add status applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (59,15,'change_statusapplicartion','Can change status applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (60,15,'delete_statusapplicartion','Can delete status applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (61,15,'view_statusapplicartion','Can view status applicartion');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (62,16,'add_statussubject','Can add status subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (63,16,'change_statussubject','Can change status subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (64,16,'delete_statussubject','Can delete status subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (65,16,'view_statussubject','Can view status subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (66,17,'add_statusunit','Can add status unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (67,17,'change_statusunit','Can change status unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (68,17,'delete_statusunit','Can delete status unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (69,17,'view_statusunit','Can view status unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (70,18,'add_statususer','Can add status user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (71,18,'change_statususer','Can change status user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (72,18,'delete_statususer','Can delete status user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (73,18,'view_statususer','Can view status user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (74,19,'add_studymodality','Can add study modality');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (75,19,'change_studymodality','Can change study modality');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (76,19,'delete_studymodality','Can delete study modality');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (77,19,'view_studymodality','Can view study modality');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (78,20,'add_subject','Can add subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (79,20,'change_subject','Can change subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (80,20,'delete_subject','Can delete subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (81,20,'view_subject','Can view subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (82,21,'add_typeidentification','Can add type identification');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (83,21,'change_typeidentification','Can change type identification');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (84,21,'delete_typeidentification','Can delete type identification');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (85,21,'view_typeidentification','Can view type identification');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (86,22,'add_typeunit','Can add type unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (87,22,'change_typeunit','Can change type unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (88,22,'delete_typeunit','Can delete type unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (89,22,'view_typeunit','Can view type unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (90,23,'add_user','Can add user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (91,23,'change_user','Can change user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (92,23,'delete_user','Can delete user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (93,23,'view_user','Can view user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (94,24,'add_userfunction','Can add user function');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (95,24,'change_userfunction','Can change user function');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (96,24,'delete_userfunction','Can delete user function');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (97,24,'view_userfunction','Can view user function');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (98,25,'add_usersubject','Can add user subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (99,25,'change_usersubject','Can change user subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (100,25,'delete_usersubject','Can delete user subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (101,25,'view_usersubject','Can view user subject');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (102,26,'add_userrole','Can add user role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (103,26,'change_userrole','Can change user role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (104,26,'delete_userrole','Can delete user role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (105,26,'view_userrole','Can view user role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (106,27,'add_unit','Can add unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (107,27,'change_unit','Can change unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (108,27,'delete_unit','Can delete unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (109,27,'view_unit','Can view unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (110,28,'add_requestinvitaction','Can add request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (111,28,'change_requestinvitaction','Can change request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (112,28,'delete_requestinvitaction','Can delete request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (113,28,'view_requestinvitaction','Can view request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (114,29,'add_processstagehistory','Can add process stage history');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (115,29,'change_processstagehistory','Can change process stage history');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (116,29,'delete_processstagehistory','Can delete process stage history');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (117,29,'view_processstagehistory','Can view process stage history');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (118,30,'add_practiceassistants','Can add practice assistants');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (119,30,'change_practiceassistants','Can change practice assistants');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (120,30,'delete_practiceassistants','Can delete practice assistants');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (121,30,'view_practiceassistants','Can view practice assistants');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (122,31,'add_notificationrequestinvitaction','Can add notification request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (123,31,'change_notificationrequestinvitaction','Can change notification request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (124,31,'delete_notificationrequestinvitaction','Can delete notification request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (125,31,'view_notificationrequestinvitaction','Can view notification request invitaction');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (126,32,'add_headunit','Can add head unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (127,32,'change_headunit','Can change head unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (128,32,'delete_headunit','Can delete head unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (129,32,'view_headunit','Can view head unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (130,33,'add_workerrole','Can add worker role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (131,33,'change_workerrole','Can change worker role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (132,33,'delete_workerrole','Can delete worker role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (133,33,'view_workerrole','Can view worker role');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (134,34,'add_workerunit','Can add worker unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (135,34,'change_workerunit','Can change worker unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (136,34,'delete_workerunit','Can delete worker unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (137,34,'view_workerunit','Can view worker unit');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (138,14,'add_roleacademic','Can add role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (139,14,'change_roleacademic','Can change role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (140,14,'delete_roleacademic','Can delete role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (141,14,'view_roleacademic','Can view role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (142,26,'add_userroleacademic','Can add user role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (143,26,'change_userroleacademic','Can change user role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (144,26,'delete_userroleacademic','Can delete user role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (145,26,'view_userroleacademic','Can view user role academic');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (146,35,'add_typeacademicpractice','Can add type academic practice');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (147,35,'change_typeacademicpractice','Can change type academic practice');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (148,35,'delete_typeacademicpractice','Can delete type academic practice');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (149,35,'view_typeacademicpractice','Can view type academic practice');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$600000$w7SjVeehNZEHPqrGBfk318$7c6txAsG3SYwvlV2PkBUlZ6CxKMJUYaLmFBaZCyPrr4=','2023-10-21 01:02:44.352778',1,'Admin','','admin@admin.com',1,1,'2023-10-16 05:43:50.437804','');
INSERT INTO "practicasAcademicas_academicperiod" ("id","datetimeStartPeriod","datetimeFinalPeriod","datetimeFinalApplication","year","semester") VALUES (1,'2023-08-08 05:00:00','2023-12-15 05:00:00','2023-12-01 05:00:00',2023,2);
INSERT INTO "practicasAcademicas_educationlevel" ("id","educationLevel","descriptionEducationLevel") VALUES (1,'Pregrado','La formación de pregrado es la primera etapa de la educación universitaria. Se inicia una vez los estudiantes finalizan su educación media (grados 10 y 11) y obtienen el título de bachiller académico o técnico');
INSERT INTO "practicasAcademicas_educationlevel" ("id","educationLevel","descriptionEducationLevel") VALUES (2,'Posgrado','La formación de posgrado es la segunda etapa de la educación universitaria. Se inicia una vez los estudiantes finalizan su educación de pregrado');
INSERT INTO "practicasAcademicas_educationlevel" ("id","educationLevel","descriptionEducationLevel") VALUES (3,'N/A','N/A');
INSERT INTO "practicasAcademicas_roleacademic" ("id","typeRoleAcademic","descriptionRoleAcademic") VALUES (1,'Administrativo','Es una persona que trabaja en alguna de las dependencias administrativas de la institución, realizando funciones de apoyo, gestión, coordinación o dirección, según el cargo que desempeñe.');
INSERT INTO "practicasAcademicas_roleacademic" ("id","typeRoleAcademic","descriptionRoleAcademic") VALUES (2,'Docente','Un docente en la Universidad de la Amazonia es un profesional que se dedica a la enseñanza, la investigación y la extensión en alguna de las áreas del conocimiento que ofrece la institución.');
INSERT INTO "practicasAcademicas_roleacademic" ("id","typeRoleAcademic","descriptionRoleAcademic") VALUES (3,'Estudiante','Un estudiante en la Universidad de la Amazonia es una persona que se matricula en alguno de los programas de pregrado o posgrado que ofrece la institución.');
INSERT INTO "practicasAcademicas_statusapplicartion" ("id","typeStatusApplicartion","descriptionStatusApplicartion") VALUES (1,'Activo','Solicitud activa');
INSERT INTO "practicasAcademicas_statusapplicartion" ("id","typeStatusApplicartion","descriptionStatusApplicartion") VALUES (2,'Inactiva','Solicitud inactiva');
INSERT INTO "practicasAcademicas_statussubject" ("id","typeStatusSubject","descriptionStatusSubject") VALUES (1,'Activo','Estado de la asignatura se encuentra en Activo');
INSERT INTO "practicasAcademicas_statussubject" ("id","typeStatusSubject","descriptionStatusSubject") VALUES (2,'Inactivo','Estado de la asignatura se encuentra en Inactivo');
INSERT INTO "practicasAcademicas_statusunit" ("id","typeStatusunit","descriptionStatusunit") VALUES (1,'Activo','Estado de la asignatura se encuentra en Activo');
INSERT INTO "practicasAcademicas_statusunit" ("id","typeStatusunit","descriptionStatusunit") VALUES (2,'Inactivo','Estado de la asignatura se encuentra en Inactivo');
INSERT INTO "practicasAcademicas_statususer" ("id","typeStatusUser","descriptionStatusUser") VALUES (1,'Activo','Usuario con algún vinculo con la universidad');
INSERT INTO "practicasAcademicas_statususer" ("id","typeStatusUser","descriptionStatusUser") VALUES (2,'Inactivo','Usuario sin vinculo alguno con la universidad');
INSERT INTO "practicasAcademicas_studymodality" ("id","studyModality","descriptionModality") VALUES (1,'Distancia','La modalidad a distancia de la Universidad de la Amazonia es una opción que usa las TIC para facilitar el acceso a la educación superior a las personas que no pueden asistir a clases presenciales.');
INSERT INTO "practicasAcademicas_studymodality" ("id","studyModality","descriptionModality") VALUES (2,'Presencial','La modalidad presencial de la Universidad de la Amazonia es aquella que implica la asistencia física y regular de los estudiantes.');
INSERT INTO "practicasAcademicas_studymodality" ("id","studyModality","descriptionModality") VALUES (3,'N/A','N/A');
INSERT INTO "practicasAcademicas_typeidentification" ("id","typeIdentification","descriptionTypeIdentification") VALUES (1,'Cedula de Ciudadania','Es el documento de identificación oficial y obligatorio para los ciudadanos colombianos mayores de 18 años');
INSERT INTO "practicasAcademicas_typeidentification" ("id","typeIdentification","descriptionTypeIdentification") VALUES (2,'Tarjeta de Identidad','Es el documento de identificación oficial y obligatorio para los niños, niñas y adolescentes colombianos, desde los 7 años y hasta que adquieren la mayoría de edad.');
INSERT INTO "practicasAcademicas_typeidentification" ("id","typeIdentification","descriptionTypeIdentification") VALUES (3,'Cedula de Extranjería','Es un documento de identificación oficial y obligatorio para los extranjeros que residen en el país con una visa de más de tres meses de duración');
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (1,'Yeisson Leonardo','Lopez Espinosa',111,111,1,1);
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (2,'Leidy Johana','Leiva Alvarez',222,222,1,1);
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (3,'Alfonso','Pérez Guzman',333,333,1,1);
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (4,'LUBEIMAR EDUARDO','GALLEGO RUIZ',444,444,1,1);
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (5,'Fidelio','López Segura',555,555,1,1);
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (6,'Kelly Johanna','Toledo Artunduaga',666,666,1,1);
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (7,'Brayan Albeiro','Pinzón Garzon',777,777,1,1);
INSERT INTO "practicasAcademicas_user" ("id","nameUser","lastNameUser","PEGE_ID","identificationNumber","statusUser_id","typeIdentification_id") VALUES (8,'Miguel Leonardo','Sanchez Fajardo',999,999,1,1);
INSERT INTO "practicasAcademicas_usersubject" ("id","updateDate","subject_id","user_id") VALUES (1,'2023-08-08 05:00:00',1,2);
INSERT INTO "practicasAcademicas_usersubject" ("id","updateDate","subject_id","user_id") VALUES (2,'2023-08-08 05:00:00',1,4);
INSERT INTO "practicasAcademicas_usersubject" ("id","updateDate","subject_id","user_id") VALUES (3,'2023-08-08 05:00:00',1,7);
INSERT INTO "practicasAcademicas_subject" ("id","nameSubject","statusSubject_id","unit_id") VALUES (1,'Redes Informáticas I - 2023-II - Grupo 1',1,7);
INSERT INTO "practicasAcademicas_subject" ("id","nameSubject","statusSubject_id","unit_id") VALUES (2,'Administración de base de datos',1,7);
INSERT INTO "practicasAcademicas_processstagehistory" ("id","datetimeUpdateProcess","justification","processStage_id","user_id") VALUES (1,'2023-10-19 05:23:08','Se envió la solicitud a los estudiantes',1,4);
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('p0592zr3huc68smsq7j68nvzx2aj8e9p','.eJxVjEEOwiAURO_C2hBoCxSX7nsG8vkfpGogKe3KeHch6UJXk8ybN2_m4NiTO2rY3ErsyiS7_HYe8BlyB_SAfC8cS9631fM-4SetfCkUXrdz-3eQoKZmD8pbjR5IQ4waQE5C6IBSK4nWKILJjqOioVVmJhNnIy0K26MJpNjnC_I9OBI:1qtHvy:QGq6bpGkJwulE5_0Rijo1yNSQ-irx-kMobpCSXPkKwk','2023-11-02 01:34:46.651862');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('r9ixu79r5704303t04gwhk4pfgci0bap','.eJxVjEEOwiAURO_C2hBoCxSX7nsG8vkfpGogKe3KeHch6UJXk8ybN2_m4NiTO2rY3ErsyiS7_HYe8BlyB_SAfC8cS9631fM-4SetfCkUXrdz-3eQoKZmD8pbjR5IQ4waQE5C6IBSK4nWKILJjqOioVVmJhNnIy0K26MJpNjnC_I9OBI:1qu0O4:BfW4pB-SRNaPQXbPQNcL86sfnMcGvZTAVZrAYQ68a8g','2023-11-04 01:02:44.360288');
INSERT INTO "practicasAcademicas_typeunit" ("id","nameType","descriptionTypeUnit") VALUES (1,'Programa Académico','o el  conjunto de experiencias de aprendizaje formalmente estructuradas que el estudiante  realiza, conducentes a la obtención de un título que lo forma integralmente para el  ejercicio de una profesión o disciplina, otorgado por la Universidad de la Amazonía, a  través de una de sus Facultades');
INSERT INTO "practicasAcademicas_typeunit" ("id","nameType","descriptionTypeUnit") VALUES (2,'Facultad','Son las unidades académicas cuya finalidad es administrar  programas académicos de Educación Superior Formal, en los distintos niveles y  modalidades, Departamentos o Programas, donde se reúne el personal docente para  impulsar la investigación y realizar actividades de docencia y extensión, en áreas afines o  complementarias del conocimiento, la técnica o la cultura. Estará dirigida por un Decano');
INSERT INTO "practicasAcademicas_typeunit" ("id","nameType","descriptionTypeUnit") VALUES (3,'Vicerrectoria','son órganos de subdirección con poder  decisorio, y consultivos en los asuntos que por su naturaleza les determinen la ley y  normas vigentes. Ejercerán las funciones que les deleguen el Rector y las señaladas en  este estatuto, como colaboradores inmediatos de la política de dirección de la Universidad  de la Amazonía.');
INSERT INTO "practicasAcademicas_typeunit" ("id","nameType","descriptionTypeUnit") VALUES (4,'Concejo superior','El concejo superior de la universidad de la amazonia es el máximo órgano de dirección de esta institución de educación superior');
INSERT INTO "practicasAcademicas_typeunit" ("id","nameType","descriptionTypeUnit") VALUES (5,'Rectoría','La rectoría es el órgano de dirección y representación legal de la Universidad de la Amazonia');
INSERT INTO "practicasAcademicas_typeunit" ("id","nameType","descriptionTypeUnit") VALUES (6,'Oficina','Una oficina es una dependencia administrativa que realiza una función importante o funciones estrechamente relacionadas con el funcionamiento de la institución.');
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (1,'Concejo Superior','El concejo superior de la universidad de la amazonia es el máximo órgano de dirección de esta institución de educación superior',3,1,3,4,NULL);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (2,'Rectoría','La rectoría es el órgano de dirección y representación legal de la Universidad de la Amazonia',3,1,3,5,1);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (3,'Vicerrectoría Académica','Es el organismo de subdirección con poder decisorio y  consultivo responsable de la gestión académica en la búsqueda de la formación integral  del personal universitario. Depende directamente de la Rectoría',3,1,3,3,2);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (4,'Vicerrectoría Administrativa y Financiera','Es el organismo de subdirección responsable de la gestión  Administrativa y Financiera de la Universidad de la Amazonía. Depende directamente de  la Rectoría.',3,1,3,3,2);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (5,'Vicerrectoría de Investigaciones, Extensión y Proyección Social','Es el organismo de subdirección encargado de las  funciones inherentes a la investigación, la extensión y la proyección social, como eje de la  actividad universitaria, articulando con la comunidad académica los elementos necesarios  para la consecución de sus fines. Depende directamente de la Rectoría.',3,1,3,3,2);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (6,'Facultad de Ingenieria','La facultad de ingeniería de la Universidad de la Amazonia es una dependencia académica que ofrece programas de pregrado y posgrado en diferentes áreas de la ingeniería, con un enfoque ambiental y social',3,1,3,2,3);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (7,'Ingeniería de Sistemas','El programa de ingeniería de sistemas de la Universidad de la Amazonia es un programa de pregrado que forma profesionales en el diseño, desarrollo, implementación y gestión de sistemas de información y software, con un enfoque ambiental y social.',1,1,2,1,6);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (8,'Ingeniería Agroecológica','El programa de ingeniería agroecológica de la Universidad de la Amazonia es un programa de pregrado que forma profesionales en el uso, manejo y conservación de los recursos naturales, con una visión holística e integral, y con competencias en investigación científica y proyección social.',1,1,2,1,6);
INSERT INTO "practicasAcademicas_unit" ("id","nameunit","descriptionUnit","educationLevel_id","statusUnit_id","studyModality_id","typeUnit_id","ancestor_id") VALUES (9,'Oficina Tecnologías de la Información','que se encarga de la planificación y gestión de la infraestructura tecnológica de la institución, para apoyar los procesos académicos, administrativos y de investigación',3,1,3,6,2);
INSERT INTO "practicasAcademicas_processstage" ("id","nameProcessStage","backProcessStage","nextProcessStage","descriptionProcessStage") VALUES (1,'Notificación a Invitados','0','2','Esta etapa es cuando la solicitud esta a la espera de que los invitados acepten la solicitud de practica académica');
INSERT INTO "practicasAcademicas_processstage" ("id","nameProcessStage","backProcessStage","nextProcessStage","descriptionProcessStage") VALUES (2,'Enviado a revisión del Presidente Comité de Currículo','1','3','Esta etapa es cuando la solicitud fue aprobada por un mínimo de 15 estudiantes y fue enviado a revisión del Presidente Comité de Currículo');
INSERT INTO "practicasAcademicas_workerrole" ("id","nameWorkerRole","DescriptionWorkerRole") VALUES (1,'Coordinador','Es el funcionario encargado de dirigir una Unidad');
INSERT INTO "practicasAcademicas_workerrole" ("id","nameWorkerRole","DescriptionWorkerRole") VALUES (2,'Técnico Administrativo','Es el funcionario encargado de tareas administrativas repetitiva');
INSERT INTO "practicasAcademicas_workerrole" ("id","nameWorkerRole","DescriptionWorkerRole") VALUES (3,'Decano','Es el funcionario encargado de dirigir una varias unidades de tipo académicas');
INSERT INTO "practicasAcademicas_workerrole" ("id","nameWorkerRole","DescriptionWorkerRole") VALUES (4,'Docente Catedratico','Es un docente que tiene un contrato por un tiempo limitado');
INSERT INTO "practicasAcademicas_workerunit" ("id","datetimeCreate","unit_id","user_id","workerRole_id") VALUES (1,'2023-10-20 01:06:15',9,1,2);
INSERT INTO "practicasAcademicas_workerunit" ("id","datetimeCreate","unit_id","user_id","workerRole_id") VALUES (2,'2023-10-20 01:06:38',6,6,3);
INSERT INTO "practicasAcademicas_workerunit" ("id","datetimeCreate","unit_id","user_id","workerRole_id") VALUES (3,'2023-10-20 01:07:40',7,4,4);
INSERT INTO "practicasAcademicas_workerunit" ("id","datetimeCreate","unit_id","user_id","workerRole_id") VALUES (4,'2023-10-20 01:07:59',9,8,1);
INSERT INTO "practicasAcademicas_userroleacademic" ("id","startDate","finaleDate","user_id","roleAcademic_id") VALUES (1,'2023-01-04 05:00:00','2023-12-31 04:59:59',1,1);
INSERT INTO "practicasAcademicas_userroleacademic" ("id","startDate","finaleDate","user_id","roleAcademic_id") VALUES (2,'2023-08-08 05:00:00','2023-11-04 04:59:59',2,3);
INSERT INTO "practicasAcademicas_userroleacademic" ("id","startDate","finaleDate","user_id","roleAcademic_id") VALUES (3,'2023-01-04 05:00:00','2023-12-31 04:59:59',4,2);
INSERT INTO "practicasAcademicas_userroleacademic" ("id","startDate","finaleDate","user_id","roleAcademic_id") VALUES (4,'2023-01-04 05:00:00','2023-12-31 04:59:59',5,1);
INSERT INTO "practicasAcademicas_userroleacademic" ("id","startDate","finaleDate","user_id","roleAcademic_id") VALUES (5,'2023-01-04 05:00:00','2023-12-31 04:59:59',6,1);
INSERT INTO "practicasAcademicas_applicartion" ("id","datetimeStartapplicartion","datetimeFinalapplicartion","routePracticeProject","routeWorkGuide","routeContigencyPlan","academicPeriod_id","processStageHistory_id","statusApplicartion_id","user_id","typeAcademicPractice_id","routeAcceptancedocument") VALUES (1,'2023-10-23 11:00:00','2023-10-27 23:00:00','projects/CV-Yeisson_Lopez_Espinosa.pdf','workGuide/CV-YeissonLopezEspinosa_1.pdf','contingencyPlan/descargar.htm',1,1,1,4,1,'acceptanceDocument/Jurado_de_votacion.pdf');
INSERT INTO "practicasAcademicas_typeacademicpractice" ("id","typeAcademicPractice","DescriptionAcademicPractice") VALUES (1,'Interna','Las prácticas académicas complementarias pueden ser internas cuando se realizan en la Universidad haciendo uso de los recursos propios de la institución');
INSERT INTO "practicasAcademicas_typeacademicpractice" ("id","typeAcademicPractice","DescriptionAcademicPractice") VALUES (2,'Externa','Se define cuando se requiere utilizar equipos, materiales, infraestructura o conocer y estudiar experiencias significativas con las que no cuenta la Institución.');
DROP INDEX IF EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_group_id_b120cbf9";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_permission_id_84c5c92e";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_6a12ed8b";
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_groups_group_id_97559544";
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_a95ead1b";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "django_admin_log_content_type_id_c4bce8eb";
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
DROP INDEX IF EXISTS "django_admin_log_user_id_c564eba6";
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
DROP INDEX IF EXISTS "django_content_type_app_label_model_76bd3d3b_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_2f476e4b";
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_user_statusUser_id_49e5e442";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_user_statusUser_id_49e5e442" ON "practicasAcademicas_user" (
	"statusUser_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_user_typeIdentification_id_887c95e3";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_user_typeIdentification_id_887c95e3" ON "practicasAcademicas_user" (
	"typeIdentification_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_usersubject_subject_id_7a3020b7";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_usersubject_subject_id_7a3020b7" ON "practicasAcademicas_usersubject" (
	"subject_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_usersubject_user_id_f36c3a95";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_usersubject_user_id_f36c3a95" ON "practicasAcademicas_usersubject" (
	"user_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_subject_statusSubject_id_12ab6611";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_subject_statusSubject_id_12ab6611" ON "practicasAcademicas_subject" (
	"statusSubject_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_subject_unit_id_e8b8bbb8";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_subject_unit_id_e8b8bbb8" ON "practicasAcademicas_subject" (
	"unit_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_requestinvitaction_guestGroup_id_4185e3c9";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_requestinvitaction_guestGroup_id_4185e3c9" ON "practicasAcademicas_requestinvitaction" (
	"guestGroup_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_requestinvitaction_user_id_30539b83";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_requestinvitaction_user_id_30539b83" ON "practicasAcademicas_requestinvitaction" (
	"user_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_requestinvitaction_userFunction_id_90fd9835";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_requestinvitaction_userFunction_id_90fd9835" ON "practicasAcademicas_requestinvitaction" (
	"userFunction_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_processstagehistory_processStage_id_f6542058";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_processstagehistory_processStage_id_f6542058" ON "practicasAcademicas_processstagehistory" (
	"processStage_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_processstagehistory_user_id_5655e9a7";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_processstagehistory_user_id_5655e9a7" ON "practicasAcademicas_processstagehistory" (
	"user_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_practiceassistants_applicartion_id_7ce74e50";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_practiceassistants_applicartion_id_7ce74e50" ON "practicasAcademicas_practiceassistants" (
	"applicartion_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_practiceassistants_requestInvitaction_id_3e964ef6";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_practiceassistants_requestInvitaction_id_3e964ef6" ON "practicasAcademicas_practiceassistants" (
	"requestInvitaction_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_notificationrequestinvitaction_requestInvitaction_id_daad363f";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_notificationrequestinvitaction_requestInvitaction_id_daad363f" ON "practicasAcademicas_notificationrequestinvitaction" (
	"requestInvitaction_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_notificationrequestinvitaction_user_id_ffb6e5e0";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_notificationrequestinvitaction_user_id_ffb6e5e0" ON "practicasAcademicas_notificationrequestinvitaction" (
	"user_id"
);
DROP INDEX IF EXISTS "django_session_expire_date_a5c62663";
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
DROP INDEX IF EXISTS "practicasAcademicas_unit_educationLevel_id_9d85b0f0";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_unit_educationLevel_id_9d85b0f0" ON "practicasAcademicas_unit" (
	"educationLevel_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_unit_statusUnit_id_46940386";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_unit_statusUnit_id_46940386" ON "practicasAcademicas_unit" (
	"statusUnit_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_unit_studyModality_id_488b4eca";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_unit_studyModality_id_488b4eca" ON "practicasAcademicas_unit" (
	"studyModality_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_unit_typeUnit_id_d05edafc";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_unit_typeUnit_id_d05edafc" ON "practicasAcademicas_unit" (
	"typeUnit_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_unit_ancestor_id_e2cdb8e8";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_unit_ancestor_id_e2cdb8e8" ON "practicasAcademicas_unit" (
	"ancestor_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_workerunit_unit_id_e394d173";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_workerunit_unit_id_e394d173" ON "practicasAcademicas_workerunit" (
	"unit_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_workerunit_user_id_7d348bdb";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_workerunit_user_id_7d348bdb" ON "practicasAcademicas_workerunit" (
	"user_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_workerunit_workerRole_id_f2f2970a";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_workerunit_workerRole_id_f2f2970a" ON "practicasAcademicas_workerunit" (
	"workerRole_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_userroleacademic_user_id_109408a1";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_userroleacademic_user_id_109408a1" ON "practicasAcademicas_userroleacademic" (
	"user_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_userroleacademic_roleAcademic_id_5bdd4aac";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_userroleacademic_roleAcademic_id_5bdd4aac" ON "practicasAcademicas_userroleacademic" (
	"roleAcademic_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_applicartion_routePracticeProject_1dddd8bd";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_applicartion_routePracticeProject_1dddd8bd" ON "practicasAcademicas_applicartion" (
	"routePracticeProject"
);
DROP INDEX IF EXISTS "practicasAcademicas_applicartion_routeWorkGuide_6cc3b073";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_applicartion_routeWorkGuide_6cc3b073" ON "practicasAcademicas_applicartion" (
	"routeWorkGuide"
);
DROP INDEX IF EXISTS "practicasAcademicas_applicartion_academicPeriod_id_10f5fa9d";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_applicartion_academicPeriod_id_10f5fa9d" ON "practicasAcademicas_applicartion" (
	"academicPeriod_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_applicartion_processStageHistory_id_7324b62d";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_applicartion_processStageHistory_id_7324b62d" ON "practicasAcademicas_applicartion" (
	"processStageHistory_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_applicartion_statusApplicartion_id_a2a05315";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_applicartion_statusApplicartion_id_a2a05315" ON "practicasAcademicas_applicartion" (
	"statusApplicartion_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_applicartion_user_id_0155d787";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_applicartion_user_id_0155d787" ON "practicasAcademicas_applicartion" (
	"user_id"
);
DROP INDEX IF EXISTS "practicasAcademicas_applicartion_typeAcademicPractice_id_48944d66";
CREATE INDEX IF NOT EXISTS "practicasAcademicas_applicartion_typeAcademicPractice_id_48944d66" ON "practicasAcademicas_applicartion" (
	"typeAcademicPractice_id"
);
COMMIT;
