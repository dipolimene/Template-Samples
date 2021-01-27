# Module for creating Resource Group, App Registration, Scepman Base and Log Collection to Log Analytics WorkSpace

module "rg" {
    source   = "./modules/resourcegroup"
    rgname     = "rg-scepmannhp"
    location = "uksouth"
}

module "appreg" {
    source = "./modules/appregistration"

}

module "scp" {
    source              = "./modules/scepmanbase"
    rgname              = module.rg.rgname
    OrgName             = "NHP"
    appRegistrationGuid = module.appreg.scepmanAppID
    appRegistrationKey  = module.appreg.scepmanSecret
    keyVaultName        = "kv-scepmannhp"
    appServicePlanName  = "plan-scepmannhp"
    appServiceName      = "app-scepmannhp"
    
}

module "law" {
    source              = "./modules/law" 
    lawName             = "laws-scepmannhp"
    rgname              = module.rg.rgname
    location            = module.rg.location
    depends_on          = [ module.rg, module.scp, module.appreg ]
}

module "logs" {
    source               = "./modules/logs" 
    diagLogName          = "scepmandiaglog"
    tarResID             = "/subscriptions/b99f9c12-69c9-4de1-a738-80c58769a372/resourceGroups/rg-scepmannhp/providers/Microsoft.Web/sites/app-scepmannhp"
    lawID                = module.law.logAnalyticsID
    depends_on           = [ module.rg, module.scp, module.appreg ]
}