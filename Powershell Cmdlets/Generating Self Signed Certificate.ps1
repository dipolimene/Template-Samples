$cert = New-SelfSignedCertificate -DnsName cloud1203pm.cloudapp.net -CertStoreLocation "Cert:\LocalMachine\My" -KeyLength 2048 -KeySpec KeyExchange
$password = ConvertTo-SecureString -String "xxxxxxxxx" -Force -AsPlainText
Export-PfxCertificate -Cert $cert -FilePath "C:\Users\cloud1203pm.pfx" -Password $password