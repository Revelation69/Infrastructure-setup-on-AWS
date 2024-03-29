locals {
  repository_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowECRAccess",
        Effect = "Allow",
        Principal = {
          "AWS" : module.eks_admins_iam_role.iam_role_arn
        },
        Action = [
          "ecr:ReplicateImage",
          "ecr:DescribeImageScanFindings",
          "ecr:StartImageScan",
          "ecr:GetDownloadUrlForLayer",
          "ecr:UploadLayerPart",
          "ecr:BatchDeleteImage",
          "ecr:ListImages",
          "ecr:PutImage",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:DescribeImages",
          "ecr:InitiateLayerUpload",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetRepositoryPolicy",
          "ecr:GetLifecyclePolicy",
          "ecr:DescribeRegistry",
          "ecr:DescribePullThroughCacheRules",
          "ecr:GetAuthorizationToken"
        ],
        Resource = "*"
      }
    ]
  })

  aws_auth_developers = [
    {
      userarn  = module.developer_user.iam_user_arn
      username = module.developer_user.iam_user_name
      groups   = ["developers"]
    }
  ]

  aws_auth_admins = [
    {
      userarn  = module.admin_user.iam_user_arn
      username = module.admin_user.iam_user_name
      groups   = ["system:masters"]
    }
  ]

  aws_auth_roles = [
    {
      rolearn  = module.eks_admins_iam_role.iam_role_arn
      username = module.eks_admins_iam_role.iam_role_name
      groups   = ["system:masters"]
    },
    {
      rolearn  = module.eks_developer_iam_role.iam_role_arn
      username = module.eks_developer_iam_role.iam_role_name
      groups   = ["${kubernetes_role_binding.developers.subject[0].name}"]
      # groups   = ["developers"]
    }
  ]

  iam_role_additional_policies = {
    FullECRAccessPolicy = aws_iam_policy.ecr_access_for_worker_node.arn
  }
#   iam_role_additional_policies = ["aws_iam_policy.ecr_access_for_worker_node.arn"]
#  # iam_role_additional_policies = {
#   #   FullECRAccessPolicy = aws_iam_policy.ecr_access_for_worker_node.arn
#   # }
 

  eks_managed_node_group_defaults = {
    disk_size      = 50
    iam_role_additional_policies = {
      FullECRAccessPolicy = aws_iam_policy.ecr_access_for_worker_node.arn
    }
  }


}

    