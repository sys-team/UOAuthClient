create or replace procedure uac.tokenRole (
    @roleCode STRING,
    @UACToken STRING default uac.HTTPVariableOrHeader ()
)
begin

    select tr.code, tr.data
    from uac.tokenRole tr
    where token in (
        select id from uac.token
        where token = @UACToken
    ) and tr.code = @roleCode
    
end;