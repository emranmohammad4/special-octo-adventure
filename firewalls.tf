#NACL
resource "aws_network_acl" "sml-nacl" {
  vpc_id = aws_vpc.sml.id

  tags = {
    Name = "sml.nacl"
  }
}
#NACL RULES -inbound
resource "aws_network_acl_rule" "sml-ingress" {
  network_acl_id = aws_network_acl.sml-nacl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}
#NACL RULES -outbound
resource "aws_network_acl_rule" "sml-egress" {
  network_acl_id = aws_network_acl.sml-nacl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}
# NACL subnet association
resource "aws_network_acl_association" "sml-nacl-subnet" {
  network_acl_id = aws_network_acl.sml-nacl.id
  subnet_id      = aws_subnet.sml-subnet.id
}