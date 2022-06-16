# upi_dalam_data

## Kelompok 8

- Bimantoro Aulia Rizky		(1900303)
- Diffa Al Farrisztqi			(1900618)
- Fadhlirahman Kusumanagara	(1903907)
- Muhammad Dennis Nur’Iman	(1900141)
- Muhammad Rayhan Fadillah	(1907998)


## API Spec
Base URL : `165.22.109.98:9999`

Repo : https://github.com/Fadil3/api-promvis

Endpoint :

* Get all Fakultas

  status: **Done**
  
  file: **fakultas.dart**
```
 {
    method: 'GET',
    path: '/fakultas',
  },
```
* Get detail fakultas

  status: **Done**
  
  file: **detail_fakultas.dart**
  
```
  {
    method: 'GET',
    path: '/fakultas/{slug}',
  },
 ```
 
 * Get detail prodi
 
   status: **Done**
   
   file: **detail_prodi.dart**
  
```
  {
    method: 'GET',
    path: '/prodi/{slug}',
  },
 ```
 
 * Get all dosen
 
   status: **Done**
   
   file: **dosen.dart**
  
```
  {
    method: 'GET',
    path: '/dosen',
  },
 ```
 
* Serve static file image
```
  {
    method: 'GET',
    path: '/img/{image*}',
  },
  ```
