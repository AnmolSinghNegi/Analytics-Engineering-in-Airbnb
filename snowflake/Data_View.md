 * https://dbt-datasets.s3.amazonaws.com/hosts.csv
 * https://dbt-datasets.s3.amazonaws.com/reviews.csv
 * https://dbt-datasets.s3.amazonaws.com/listings.csv


 * Command to create PK in windows
 * * private-key = & "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" genrsa 2048 | & "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" pkcs8 -topk8 -v2 des3 -inform PEM -out rsa_key.p8
 * *  public-key = & "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" rsa -in rsa_key.p8 -pubout -out rsa_key.pub