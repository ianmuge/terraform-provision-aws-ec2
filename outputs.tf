output "ami" {
  value = aws_instance.rhel.*.ami
}
output "id" {
  value = aws_instance.rhel.*.id
}
output "public_dns" {
  value = aws_instance.rhel.*.public_dns
}
output "public_ip" {
  value = aws_instance.rhel.*.public_ip
}
output "private_dns" {
  value = aws_instance.rhel.*.private_dns
}
output "private_ip" {
  value = aws_instance.rhel.*.private_ip
}
output "instance_state" {
  value = aws_instance.rhel.*.instance_state
}