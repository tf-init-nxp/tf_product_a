locals {
  product_name = "product3"
  client_name  = "fulano"
  rg_name      = format("%s-%s-%s", local.product_name, local.client_name, var.environment)

  tags = { "product" = local.product_name,
    "client" = local.client_name,
  }
  location = "westeurope"

}

module "product_a" {

  source      = "git::https://github.com/tf-init-nxp/tf_product_a_implementation.git?ref=main"
  rg_location = local.location
  rg_name     = local.rg_name
  tags        = local.tags
  key_vault_access_policies = [
    {
      azure_ad_group_names    = ["users-app1"]
      key_permissions         = ["Get", "List"]
      secret_permissions      = ["Get", "List"]
      certificate_permissions = ["Get", "Import", "List"]
      storage_permissions     = ["Backup", "Get", "List", "Recover"]
    },
  ]

  postgresql_administrator_login = "postgres"

  postgresql_databases = { "backend" = { charset = "UTF8", collation = "en_US.UTF8" },
    "hasura" = { charset = "UTF8", collation = "en_US.UTF8" }
  }
  postgresql_allowed_cidrs = { "User1" = "10.10.119.12/32", "User2" = "10.10.101.58/32" }

  aks_enable                        = false
  keyvault_enable                   = true
  postgresql_flexible_server_enable = true
  storage_account_enable            = false

  ###
  #kured_chart_version = "4.6.0"
  kured_chart_version = "4.5.1"


}
