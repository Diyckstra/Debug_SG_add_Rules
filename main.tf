
######################### Security Group
resource "aws_security_group" "Creating_SG" {
  vpc_id      = var.VPC_ID

  name        = "Testing-SG-Add-Rule"
  description = "Testing-SG-Add-Rule"

  tags = {
    Name      = "Testing-SG-Add-Rule"
  }
}

# Create Rules in Security Groups
resource "aws_security_group_rule" "Creating_SG_rules_input" {
  depends_on  = [ aws_security_group.Creating_SG ]
  count             = length(local.sg_access)
  description       = count.index
  type              = "ingress"
  from_port         = local.sg_access[count.index]["from_port"]
  to_port           = local.sg_access[count.index]["to_port"]
  protocol          = local.sg_access[count.index]["protocol"]
  cidr_blocks       = [local.sg_access[count.index]["cidr_blocks"]]
  security_group_id = aws_security_group.Creating_SG.id
}
