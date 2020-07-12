resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  private-dns = aws_instance.i-private.*.private_dns,
  private-ip = aws_instance.i-private.*.public_ip,
  private-id = aws_instance.i-private.*.id
 }
 )
 filename = "inventory"
}