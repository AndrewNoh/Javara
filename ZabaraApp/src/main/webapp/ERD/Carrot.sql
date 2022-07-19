
/* Drop Tables */

DROP TABLE AUCTION_IMG CASCADE CONSTRAINTS;
DROP TABLE AUCTION_LIKE CASCADE CONSTRAINTS;
DROP TABLE AUCTION_PRICE CASCADE CONSTRAINTS;
DROP TABLE CHAT_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE CHATROOM CASCADE CONSTRAINTS;
DROP TABLE AUCTION_LIST CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_IMG CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_LIKE CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_LIST CASCADE CONSTRAINTS;
DROP TABLE TOWN_IMG CASCADE CONSTRAINTS;
DROP TABLE TOWN_LIKE CASCADE CONSTRAINTS;
DROP TABLE TOWN_LIST CASCADE CONSTRAINTS;
DROP TABLE ADDRESS_LIST CASCADE CONSTRAINTS;
DROP TABLE AUTHORITY_SECURITY CASCADE CONSTRAINTS;
DROP TABLE PAYLOG CASCADE CONSTRAINTS;
DROP TABLE ZABARAPAY CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_ADDRESS_LIST_ADDRNO;
DROP SEQUENCE SEQ_AUCTION_IMG_IMAGENO;
DROP SEQUENCE SEQ_AUCTION_LIST_ACTION_NO;
DROP SEQUENCE SEQ_AUCTION_LIST_AUCTION_NO;
DROP SEQUENCE SEQ_CHATROOM_ROOM_NO;
DROP SEQUENCE SEQ_MEMBERS_USERNO;
DROP SEQUENCE SEQ_PRODUCT_IMG_IMAGENO;
DROP SEQUENCE SEQ_PRODUCT_LIST_AUCTION_NO;
DROP SEQUENCE SEQ_PRODUCT_LIST_PRODUCT_NO;
DROP SEQUENCE SEQ_TOWN_IMG_IMAGENO;
DROP SEQUENCE SEQ_TOWN_LIST_TOWNLIST_NO;




/* Create Sequences */

CREATE SEQUENCE SEQ_ADDRESS_LIST_ADDRNO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_AUCTION_IMG_IMAGENO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_AUCTION_LIST_ACTION_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_AUCTION_LIST_AUCTION_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CHATROOM_ROOM_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEMBERS_USERNO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PRODUCT_IMG_IMAGENO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PRODUCT_LIST_AUCTION_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PRODUCT_LIST_PRODUCT_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TOWN_IMG_IMAGENO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TOWN_LIST_TOWNLIST_NO INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE ADDRESS_LIST
(
	ADDRNO number NOT NULL,
	USERNO number NOT NULL,
	SIMPLEADDRESS nvarchar2(20) NOT NULL,
	FULLADDRESS nvarchar2(50),
	PRIMARY KEY (ADDRNO)
);


CREATE TABLE AUCTION_IMG
(
	IMAGENO number NOT NULL,
	IMAGENAME nvarchar2(50) NOT NULL,
	AUCTION_NO number NOT NULL,
	PRIMARY KEY (IMAGENO)
);


CREATE TABLE AUCTION_LIKE
(
	USERNO number NOT NULL,
	AUCTION_NO number NOT NULL
);


CREATE TABLE AUCTION_LIST
(
	AUCTION_NO number NOT NULL,
	USERNO number NOT NULL,
	TITLE nvarchar2(50) NOT NULL,
	CONTENT nvarchar2(200) NOT NULL,
	CATEGORY nvarchar2(50) NOT NULL,
	LIKES number DEFAULT 0 NOT NULL,
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	ADDRNO number NOT NULL,
	SOLDOUT nvarchar2(10),
	ENDDATE timestamp NOT NULL,
	STATUS nvarchar2(50),
	PRIMARY KEY (AUCTION_NO)
);


CREATE TABLE AUCTION_PRICE
(
	UPPER_PRICE number NOT NULL,
	BASE_PRICE number NOT NULL,
	UPPER_USER_NO number,
	AUCTION_NO number NOT NULL
);


CREATE TABLE AUTHORITY_SECURITY
(
	USERNO number NOT NULL,
	AUTHORITY varchar2(20) DEFAULT 'ROLE_USER' NOT NULL,
	ENABLED number DEFAULT 1 NOT NULL
);


CREATE TABLE CHATROOM
(
	ROOM_NO number NOT NULL,
	AUCTION_NO number NOT NULL,
	PRODUCT_NO number NOT NULL,
	TOWNLIST_NO number NOT NULL,
	WRITEUSERNO number NOT NULL,
	USERNO number NOT NULL,
	CHATCONTENT nvarchar2(500) NOT NULL,
	SENDTIME date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (ROOM_NO)
);


CREATE TABLE CHAT_MESSAGE
(
	ROOM_NO number NOT NULL,
	SENDUSERNO number NOT NULL,
	UNREAD_COUNT number NOT NULL,
	CHATCONTENT nvarchar2(500) NOT NULL,
	SENDTIME date DEFAULT SYSDATE NOT NULL
);


CREATE TABLE MEMBERS
(
	USERNO number NOT NULL,
	EMAIL nvarchar2(50),
	PASSWORD nvarchar2(50),
	NICKNAME nvarchar2(20),
	PHONENUMBER nvarchar2(50) UNIQUE,
	PROFILE_IMG nvarchar2(50),
	PLATFORM nvarchar2(50) NOT NULL,
	PRIMARY KEY (USERNO)
);


CREATE TABLE PAYLOG
(
	LOGNO number NOT NULL,
	PAYNO number NOT NULL,
	DEPOSIT number,
	WITHDRAW number,
	BALANCE number NOT NULL,
	PRIMARY KEY (LOGNO)
);


CREATE TABLE PRODUCT_IMG
(
	IMAGENO number NOT NULL,
	IMAGENAME nvarchar2(50) NOT NULL,
	PRODUCT_NO number NOT NULL,
	PRIMARY KEY (IMAGENO)
);


CREATE TABLE PRODUCT_LIKE
(
	USERNO number NOT NULL,
	PRODUCT_NO number NOT NULL
);


CREATE TABLE PRODUCT_LIST
(
	PRODUCT_NO number NOT NULL,
	USERNO number NOT NULL,
	TITLE nvarchar2(50) NOT NULL,
	CONTENT nvarchar2(200) NOT NULL,
	CATEGORY nvarchar2(50) NOT NULL,
	PRICE number NOT NULL,
	LIKES number DEFAULT 0 NOT NULL,
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	ADDRNO number NOT NULL,
	SOLDOUT nvarchar2(10),
	STATUS nvarchar2(50),
	PRIMARY KEY (PRODUCT_NO)
);


CREATE TABLE TOWN_IMG
(
	IMAGENO number NOT NULL,
	IMAGENAME nvarchar2(50) NOT NULL,
	TOWNLIST_NO number NOT NULL,
	PRIMARY KEY (IMAGENO)
);


CREATE TABLE TOWN_LIKE
(
	USERNO number NOT NULL,
	TOWNLIST_NO number NOT NULL
);


CREATE TABLE TOWN_LIST
(
	TOWNLIST_NO number NOT NULL,
	USERNO number NOT NULL,
	TITLE nvarchar2(20) NOT NULL,
	CONTENT nvarchar2(2000) NOT NULL,
	VIEWCOUNT number NOT NULL,
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	CATEGORY nvarchar2(50),
	ADDRNO number NOT NULL,
	PRIMARY KEY (TOWNLIST_NO)
);


CREATE TABLE ZABARAPAY
(
	PAYNO number NOT NULL,
	USERNO number NOT NULL,
	PRIMARY KEY (PAYNO)
);



/* Create Foreign Keys */

ALTER TABLE AUCTION_LIST
	ADD FOREIGN KEY (ADDRNO)
	REFERENCES ADDRESS_LIST (ADDRNO)
;


ALTER TABLE PRODUCT_LIST
	ADD FOREIGN KEY (ADDRNO)
	REFERENCES ADDRESS_LIST (ADDRNO)
;


ALTER TABLE TOWN_LIST
	ADD FOREIGN KEY (ADDRNO)
	REFERENCES ADDRESS_LIST (ADDRNO)
;


ALTER TABLE AUCTION_IMG
	ADD FOREIGN KEY (AUCTION_NO)
	REFERENCES AUCTION_LIST (AUCTION_NO)
;


ALTER TABLE AUCTION_LIKE
	ADD FOREIGN KEY (AUCTION_NO)
	REFERENCES AUCTION_LIST (AUCTION_NO)
;


ALTER TABLE AUCTION_PRICE
	ADD FOREIGN KEY (AUCTION_NO)
	REFERENCES AUCTION_LIST (AUCTION_NO)
;


ALTER TABLE CHATROOM
	ADD FOREIGN KEY (AUCTION_NO)
	REFERENCES AUCTION_LIST (AUCTION_NO)
;


ALTER TABLE CHAT_MESSAGE
	ADD FOREIGN KEY (ROOM_NO)
	REFERENCES CHATROOM (ROOM_NO)
;


ALTER TABLE ADDRESS_LIST
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE AUCTION_LIKE
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE AUCTION_LIST
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE AUTHORITY_SECURITY
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE PRODUCT_LIKE
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE PRODUCT_LIST
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE TOWN_LIKE
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE TOWN_LIST
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE ZABARAPAY
	ADD FOREIGN KEY (USERNO)
	REFERENCES MEMBERS (USERNO)
;


ALTER TABLE CHATROOM
	ADD FOREIGN KEY (PRODUCT_NO)
	REFERENCES PRODUCT_LIST (PRODUCT_NO)
;


ALTER TABLE PRODUCT_IMG
	ADD FOREIGN KEY (PRODUCT_NO)
	REFERENCES PRODUCT_LIST (PRODUCT_NO)
;


ALTER TABLE PRODUCT_LIKE
	ADD FOREIGN KEY (PRODUCT_NO)
	REFERENCES PRODUCT_LIST (PRODUCT_NO)
;


ALTER TABLE CHATROOM
	ADD FOREIGN KEY (TOWNLIST_NO)
	REFERENCES TOWN_LIST (TOWNLIST_NO)
;


ALTER TABLE TOWN_IMG
	ADD FOREIGN KEY (TOWNLIST_NO)
	REFERENCES TOWN_LIST (TOWNLIST_NO)
;


ALTER TABLE TOWN_LIKE
	ADD FOREIGN KEY (TOWNLIST_NO)
	REFERENCES TOWN_LIST (TOWNLIST_NO)
;


ALTER TABLE PAYLOG
	ADD FOREIGN KEY (PAYNO)
	REFERENCES ZABARAPAY (PAYNO)
;



