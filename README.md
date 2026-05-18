# HouseHunt Backup (May 18, 2026)

## Files
- househunta_backup.sql - Database dump (househunta, 40 tables)
- househunt_full.zip - Full application code (Spring Boot / Java)

## Restore

Extract app:
```
unzip househunt_full.zip
```

Import database:
```
mysql -u root -p househunta < househunta_backup.sql
```

## Tech Stack
- Spring Boot (Java/Kotlin)
- MySQL (househunta database)
- DB credentials: user=househunt, pass=HouseHunt@2026!
