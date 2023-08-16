variable "environment" {
  type        = string
  description = "Environment where the will be deploy"
  default     = "dev"
}


variable "postgresql_configurations" {
  description = "PostgreSQL configurations to enable."
  type        = map(string)
  default     = { azure.extensions = "plpgsql,pg_stat_statements,pg_buffercache,pgcrypto,citext" }
}
