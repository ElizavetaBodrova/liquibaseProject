insert into client(id,
                   first_name,
                   last_name,
                   middle_name,
                   birthday,
                   address)
values (CLIENT_ID_SEQ.nextval, 'Ivan', 'Ivanov', 'Ivanich', TO_DATE('1968/05/03', 'yyyy/mm/dd'),
        'Pushkina street')