# Attend [![Build Status](https://travis-ci.org/mckomo/attend.svg?branch=master)](https://travis-ci.org/mckomo/attend)

Register your attendance at Zoho using CLI.

## Installation

Install `attend` Ruby gem:

```bash
gem install attend
```

and that's it!

## Usage

First of all you need to set [Zoho Poeople auth token](https://www.zoho.com/people/help/api/auth-token.html) as env variable in your terminal. After that you will be ready to use `attend`. 

```bash
export ZOHO_PEOPLE_AUTH_TOKEN='YOUR_TOKEN'
```


To register attendance on current day:

```bash
attend --email "your.employee@email.com" --check_in "10:00" --check_out "18:00"
# Successfully registered attendance from 2017-07-04T10:00:00+10:00 to 2017-07-04T18:00:00+18:00
```

You can also register attendance for a few days:
 
```bash
 attend --email "your.employee@email.com" --check_in "10:00" --check_out "18:00" --from "04/07/2017" --to "07/07/2017"
 # Successfully registered attendance from 2017-07-04T10:00:00+10:00 to 2017-07-04T18:00:00+18:00
 # Successfully registered attendance from 2017-07-05T10:00:00+10:00 to 2017-07-05T18:00:00+18:00
 # ...
```
