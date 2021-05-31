create index I_client_fio on client (first_name,last_name,middle_name);
create index I_client_id on client(id);
create index I_balance_id on balance(id);
create index I_account_id on account(id);
create index I_payment_id on payment(id);
create index I_payment_fromto on PAYMENT(FROM_ACCOUNT,TO_ACCOUNT);
create index I_audit_id on PAYMENT_AUDIT(id);
create index I_request_id on PAYMENT_REQUEST(id);
create index I_regular_id on REGULAR_PAYMENT(id);
create index I_transaction_id on TRANSACTION(id);

