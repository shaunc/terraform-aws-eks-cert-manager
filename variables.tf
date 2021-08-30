variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled"
}

variable "cluster_issuer_enabled" {
  type        = bool
  default     = false
  description = "Variable indicating whether default ClusterIssuer CRD is enabled"
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster"
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account"
}

variable "helm_chart_name" {
  type        = string
  default     = "cert-manager"
  description = "Helm chart name to be installed"
}

variable "helm_chart_version" {
  type        = string
  default     = "1.5.3"
  description = "Version of the Helm chart"
}

variable "helm_release_name" {
  type        = string
  default     = "cert-manager"
  description = "Helm release name"
}

variable "helm_repo_url" {
  type        = string
  default     = "https://charts.jetstack.io"
  description = "Helm repository"
}

variable "helm_create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create k8s namespace with name defined by `k8s_namespace`"
}

variable "k8s_namespace" {
  type        = string
  default     = "kube-system"
  description = "The K8s namespace in which the external-dns will be installed"
}

variable "k8s_rbac_create" {
  type        = bool
  default     = true
  description = "Whether to create and use RBAC resources"
}

variable "k8s_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create Service Account"
}

variable "k8s_irsa_role_create" {
  type        = bool
  default     = true
  description = "Whether to create IRSA role and annotate service account"
}

variable "k8s_assume_role_arn" {
  default     = ""
  description = "Whether to create and use default role or assume existing role. Useful for hosted zones in another AWS account. Default (empty string) use default role."
}

variable "k8s_service_account_name" {
  type        = string
  default     = "cert-manager"
  description = "The k8s cert-manager service account name"
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://artifacthub.io/packages/helm/cert-manager/cert-manager"
}

variable "cluster_issuer_settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart cluster_issuer values, see https://github.com/lablabs/terraform-aws-eks-aws-cert-manager/blob/master/helm/defaultClusterIssuer/values.yaml"
}

variable "values" {
  type        = string
  default     = ""
  description = "Additional values for cert manager helm chart. Values will be merged, in order, as Helm does with multiple -f options"
}

variable "cluster_issuers_values" {
  type        = string
  default     = ""
  description = "Additional values for cert manager cluster issuers helm chart. Values will be merged, in order, as Helm does with multiple -f options"
}

variable "policy_allowed_zone_ids" {
  type        = list(string)
  default     = ["*"]
  description = "List of the Route53 zone ids for service account IAM role access"
}
