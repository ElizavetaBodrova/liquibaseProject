CREATE SEQUENCE CLIENT_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE client
(
    id          NUMBER(10, 0) NOT NULL,
    first_name  VARCHAR2(255) NOT NULL,
    last_name   VARCHAR2(255) NOT NULL,
    middle_name VARCHAR2(255),
    birthday    DATE NOT NULL,
    address     VARCHAR2(255) NOT NULL,
        constraint CLIENT_PK PRIMARY KEY (id)
);

CREATE sequence REGULAR_PAYMENT_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE regular_payment
(
    id             NUMBER(10, 0) NOT NULL,
    request_id     NUMBER(10, 0) NOT NULL,
    write_off_date DATE NOT NULL,
    account_id     NUMBER(10, 0) NOT NULL,
    constraint REGULAR_PAYMENT_PK PRIMARY KEY (id)
);

CREATE sequence PAYMENT_REQUEST_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE payment_request
(
    id         NUMBER(10, 0) NOT NULL,
    client_id  NUMBER(10, 0) NOT NULL,
    account_id NUMBER(10, 0) NOT NULL,
    constraint PAYMENT_REQUEST_PK PRIMARY KEY (id)
);

CREATE sequence PAYMENT_AUDIT_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE PAYMENT_AUDIT
(
    id      NUMBER(10, 0) NOT NULL,
    status  VARCHAR2(255) NOT NULL,
    audit_comment VARCHAR2(255),
        constraint PAYMENT_AUDIT_PK PRIMARY KEY (id)
);

CREATE sequence PAYMENT_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE payment
(
    id                 NUMBER(10, 0) NOT NULL,
    amount             NUMBER(20, 0) NOT NULL,
    date_off               TIMESTAMP NOT NULL,
    status             NUMBER(10, 0) NOT NULL,
    from_account       NUMBER(10, 0) NOT NULL,
    to_account         NUMBER(10, 0) NOT NULL,
    transaction_id     NUMBER(10, 0) NOT NULL,
    regular_payment_id NUMBER(10, 0) NOT NULL,
    constraint PAYMENT_PK PRIMARY KEY (id)
);


CREATE sequence BALANCE_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE balance
(
    id         NUMBER(10, 0) NOT NULL,
    account_id NUMBER(10, 0) NOT NULL,
    amount     NUMBER(10, 0) NOT NULL,
    constraint BALANCE_PK PRIMARY KEY (id)
);



CREATE sequence TRANSACTION_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE transaction
(
    id         NUMBER(10, 0) NOT NULL,
    payment_id NUMBER(10, 0) NOT NULL,
    status     VARCHAR2(255) NOT NULL,
        constraint TRANSACTION_PK PRIMARY KEY (id)
);


CREATE sequence ACCOUNT_ID_SEQ
    MINVALUE 1 START WITH 1 INCREMENT BY 1;

CREATE TABLE account
(
    id           NUMBER(10, 0) NOT NULL,
    client_id    NUMBER(10, 0) NOT NULL,
    account_code NUMBER(20, 0) NOT NULL,
    constraint ACCOUNT_PK PRIMARY KEY (id)
);


ALTER TABLE regular_payment
    ADD CONSTRAINT regular_payment_fk0 FOREIGN KEY (request_id) REFERENCES payment_request (id);
ALTER TABLE regular_payment
    ADD CONSTRAINT regular_payment_fk1 FOREIGN KEY (account_id) REFERENCES account (id);

ALTER TABLE payment_request
    ADD CONSTRAINT payment_request_fk0 FOREIGN KEY (client_id) REFERENCES client (id);
ALTER TABLE payment_request
    ADD CONSTRAINT payment_request_fk1 FOREIGN KEY (account_id) REFERENCES account (id);


ALTER TABLE payment
    ADD CONSTRAINT payment_fk0 FOREIGN KEY (status) REFERENCES PAYMENT_AUDIT (id);
ALTER TABLE payment
    ADD CONSTRAINT payment_fk1 FOREIGN KEY (from_account) REFERENCES account (id);
ALTER TABLE payment
    ADD CONSTRAINT payment_fk2 FOREIGN KEY (to_account) REFERENCES account (id);
ALTER TABLE payment
    ADD CONSTRAINT payment_fk3 FOREIGN KEY (transaction_id) REFERENCES transaction (id);
ALTER TABLE payment
    ADD CONSTRAINT payment_fk4 FOREIGN KEY (regular_payment_id) REFERENCES regular_payment (id);

ALTER TABLE balance
    ADD CONSTRAINT balance_fk0 FOREIGN KEY (account_id) REFERENCES account (id);

ALTER TABLE transaction
    ADD CONSTRAINT transaction_fk0 FOREIGN KEY (payment_id) REFERENCES payment (id);

ALTER TABLE account
    ADD CONSTRAINT account_fk0 FOREIGN KEY (client_id) REFERENCES client (id);
