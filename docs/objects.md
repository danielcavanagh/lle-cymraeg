# Objects

Below is a full list of the data objects in the system

## Account

An account allows authenticated access to the system, providing further access than an anonymous based on the assigned role

### Properties

* account_id: string - Public ID of account. Either an email address or random hex ID
* password: string - Password
* role: AccountRole - Role for authorisation purposes
* person: Person? - Personal details of user, if relevant (ie. ID is email)
