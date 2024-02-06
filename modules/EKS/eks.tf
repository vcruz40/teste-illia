resource "aws_eks_cluster" "eks-ilia" {
  name     = "eks-ilia"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = [var.subnet1, var.subnet2]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKSServicePolicy,
  ]
}