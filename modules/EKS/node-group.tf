###CRIAÇÃO DO NODEGROUP:

resource "aws_eks_node_group" "eks-ilia" {
  cluster_name    = aws_eks_cluster.eks-ilia.name
  node_group_name = "eks-ilia"
  node_role_arn   = aws_iam_role.role-node-ilia.arn
  subnet_ids      = [var.subnet1, var.subnet2]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}