# Creates App Registration, Secrets, SP, API Permissions

resource "azuread_application" "scepman" {
    display_name               = "scepmanSP"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false

    required_resource_access {
        resource_app_id = "c161e42e-d4df-4a3d-9b42-e7a3c31f59d4"
        resource_access {
            id   = "39d724e8-6a34-4930-9a36-364082c35716"
            type = "Role"
        }
    }

    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000"
        resource_access {
            id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
            type = "Role"
        }
    }

}

resource "azuread_service_principal" "scepman_sp" {
  application_id               = azuread_application.scepman.application_id
  app_role_assignment_required = false
  tags                         = [ "scepman", "api"]
}

resource "azuread_application_password" "scepman_secret" {
  application_object_id = azuread_application.scepman.id
  description           = "scepmanSecret"
  value                 = "VT=uSgbTanZhyz@%nL9Hpd+Tfay_MRV#"
  end_date              = "2099-01-01T01:02:03Z"
}
