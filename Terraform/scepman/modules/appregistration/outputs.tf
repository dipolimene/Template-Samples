# Output AppID and Secret Value

output "scepmanAppID" {
  value = azuread_application.scepman.application_id
  description = "scepman AppID"
}

output "scepmanSecret" {
  value = azuread_application_password.scepman_secret.value
  description = "scepman Secret"
}