DROP TABLE community CASCADE CONSTRAINTS ;

DROP TABLE community_user CASCADE CONSTRAINTS ;

DROP TABLE modules CASCADE CONSTRAINTS ;

DROP TABLE modules_community CASCADE CONSTRAINTS ;

DROP TABLE privacy CASCADE CONSTRAINTS ;

DROP TABLE tipo CASCADE CONSTRAINTS ;

DROP TABLE "user" CASCADE CONSTRAINTS ;

DROP TABLE user_roles CASCADE CONSTRAINTS ;

CREATE TABLE community
  (
    id          VARCHAR2 (10) NOT NULL ,
    name        VARCHAR2 (15) NOT NULL ,
    description VARCHAR2 (150) ,
    logo        VARCHAR2 (80) ,
    privacy_id  VARCHAR2 (10) NOT NULL ,
    tipo_id     VARCHAR2 (10) NOT NULL ,
    inv_token   VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE community ADD CONSTRAINT community_PK PRIMARY KEY ( id ) ;


CREATE TABLE community_user
  (
    community_id  VARCHAR2 (10) NOT NULL ,
    user_email    VARCHAR2 (50) NOT NULL ,
    user_roles_id VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE community_user ADD CONSTRAINT community_user_PK PRIMARY KEY ( community_id, user_email ) ;


CREATE TABLE modules
  (
    id          VARCHAR2 (10) NOT NULL ,
    title       VARCHAR2 (15) NOT NULL ,
    description VARCHAR2 (150) NOT NULL
  ) ;
ALTER TABLE modules ADD CONSTRAINT modules_PK PRIMARY KEY ( id ) ;


CREATE TABLE modules_community
  (
    community_id VARCHAR2 (10) NOT NULL ,
    modules_id   VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE modules_community ADD CONSTRAINT modules_community_PK PRIMARY KEY ( community_id, modules_id ) ;


CREATE TABLE privacy
  (
    id    VARCHAR2 (10) NOT NULL ,
    title VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE privacy ADD CONSTRAINT privacy_PK PRIMARY KEY ( id ) ;


CREATE TABLE tipo
  (
    id    VARCHAR2 (10) NOT NULL ,
    title VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE tipo ADD CONSTRAINT tipo_PK PRIMARY KEY ( id ) ;


CREATE TABLE "user"
  (
    email     VARCHAR2 (50) NOT NULL ,
    nick      VARCHAR2 (15) NOT NULL UNIQUE ,
    name      VARCHAR2 (15) NOT NULL ,
    last_name VARCHAR2 (15) ,
    password  VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE "user" ADD CONSTRAINT user_PK PRIMARY KEY ( email ) ;


CREATE TABLE user_roles
  (
    id    VARCHAR2 (10) NOT NULL ,
    title VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE user_roles ADD CONSTRAINT user_roles_PK PRIMARY KEY ( id ) ;


ALTER TABLE community ADD CONSTRAINT community_privacy_FK FOREIGN KEY ( privacy_id ) REFERENCES privacy ( id ) ;

ALTER TABLE community ADD CONSTRAINT community_tipo_FK FOREIGN KEY ( tipo_id ) REFERENCES tipo ( id ) ;

ALTER TABLE community_user ADD CONSTRAINT community_user_community_FK FOREIGN KEY ( community_id ) REFERENCES community ( id ) ;

ALTER TABLE community_user ADD CONSTRAINT community_user_user_FK FOREIGN KEY ( user_email ) REFERENCES "user" ( email ) ;

ALTER TABLE community_user ADD CONSTRAINT community_user_user_roles_FK FOREIGN KEY ( user_roles_id ) REFERENCES user_roles ( id ) ;

ALTER TABLE modules_community ADD CONSTRAINT modules_community_community_FK FOREIGN KEY ( community_id ) REFERENCES community ( id ) ;

ALTER TABLE modules_community ADD CONSTRAINT modules_community_modules_FK FOREIGN KEY ( modules_id ) REFERENCES modules ( id ) ;

