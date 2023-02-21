Test assesment - basic shifts assignements for employees.

## Assumptions  
  
- Very basic prototype, almost nothing extra except some constraints  
- No UI (API-mode with requests coming from frontend-app probably)  
- No authentication  
- No authorization  
- No users entity management  
- No repeating shifts functionality (we assume that shifts are being created only for listed date ranges)  
- We assume the same timezone among users (no diferrent timezones handling)  
- Not all error cases covered and limited specs as well

On shifts create action: list of dates for a user are expected - if even for a one date a shift cannot be created - no any shifts for the dates will be created (we assume basic usage is insert of new shifts for the next month).


## Setup

**Ruby**  
3.0.2 or >=2.7.0

**Install**  
`bundle install`

**DB setup**  
An example for default user:
```
psql -d postgres -c "create user shift_app_user with password '32a/CT4iS4V+' createdb superuser"
createdb --username=shift_app_user shift_app_development
rake db:seed RAILS_ENV
rake db:seed RAILS_ENV=test
```
