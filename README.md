# Infrastructure-setup-on-AWS
BUILDING ELASTIC KUBERNETES SERVICE (EKS) WITH TERRAFORM

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.23.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.23.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.25.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_admin_user"></a> [admin\_user](#module\_admin\_user) | terraform-aws-modules/iam/aws//modules/iam-user | 5.3.1 |
| <a name="module_allow_assume_eks_admins_iam_policy"></a> [allow\_assume\_eks\_admins\_iam\_policy](#module\_allow\_assume\_eks\_admins\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.3.1 |
| <a name="module_allow_assume_eks_developer_iam_policy"></a> [allow\_assume\_eks\_developer\_iam\_policy](#module\_allow\_assume\_eks\_developer\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.3.1 |
| <a name="module_developer_user"></a> [developer\_user](#module\_developer\_user) | terraform-aws-modules/iam/aws//modules/iam-user | 5.3.1 |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_eks_admin_iam_policy"></a> [eks\_admin\_iam\_policy](#module\_eks\_admin\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.3.1 |
| <a name="module_eks_admins_iam_group"></a> [eks\_admins\_iam\_group](#module\_eks\_admins\_iam\_group) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.3.1 |
| <a name="module_eks_admins_iam_role"></a> [eks\_admins\_iam\_role](#module\_eks\_admins\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.3.1 |
| <a name="module_eks_developer_iam_group"></a> [eks\_developer\_iam\_group](#module\_eks\_developer\_iam\_group) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.3.1 |
| <a name="module_eks_developer_iam_policy"></a> [eks\_developer\_iam\_policy](#module\_eks\_developer\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.3.1 |
| <a name="module_eks_developer_iam_role"></a> [eks\_developer\_iam\_role](#module\_eks\_developer\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.3.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.ecr_access_for_worker_node](https://registry.terraform.io/providers/hashicorp/aws/5.23.1/docs/resources/iam_policy) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_role.developers_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.developers](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.23.1/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Name of admin user | `string` | n/a | yes |
| <a name="input_azs"></a> [azs](#input\_azs) | n/a | `list(any)` | `[]` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | n/a | `string` | `""` | no |
| <a name="input_cluster_addons"></a> [cluster\_addons](#input\_cluster\_addons) | n/a | `map(any)` | n/a | yes |
| <a name="input_cluster_endpoint_private_access"></a> [cluster\_endpoint\_private\_access](#input\_cluster\_endpoint\_private\_access) | n/a | `bool` | n/a | yes |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | n/a | `bool` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `string` | n/a | yes |
| <a name="input_create_lifecycle_policy"></a> [create\_lifecycle\_policy](#input\_create\_lifecycle\_policy) | n/a | `bool` | n/a | yes |
| <a name="input_developer_username"></a> [developer\_username](#input\_developer\_username) | Names of developer for aws\_auth map and namespaces | `string` | n/a | yes |
| <a name="input_eks_managed_node_groups"></a> [eks\_managed\_node\_groups](#input\_eks\_managed\_node\_groups) | n/a | `map(any)` | n/a | yes |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | n/a | `bool` | n/a | yes |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | n/a | `bool` | n/a | yes |
| <a name="input_enable_irsa"></a> [enable\_irsa](#input\_enable\_irsa) | n/a | `bool` | n/a | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Enable NAT Gateways for Private Subnets Outbound Communication | `bool` | n/a | yes |
| <a name="input_manage_aws_auth_configmap"></a> [manage\_aws\_auth\_configmap](#input\_manage\_aws\_auth\_configmap) | n/a | `bool` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace to create | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | n/a | `list(any)` | `[]` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | n/a | `list(any)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | # VPC VARIABLES | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | # ECR VARIABLE | `string` | n/a | yes |
| <a name="input_repository_type"></a> [repository\_type](#input\_repository\_type) | n/a | `string` | n/a | yes |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | n/a | `bool` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_owner_id"></a> [vpc\_owner\_id](#output\_vpc\_owner\_id) | n/a |
