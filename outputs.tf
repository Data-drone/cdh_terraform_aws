resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  db-id = aws_instance.db.id,
  db-ip = aws_instance.db.public_ip,
  db-dns = aws_instance.db.private_dns,
  manager-id = aws_instance.manager.id,
  manager-ip = aws_instance.manager.public_ip,
  manager-dns = aws_instance.manager.private_dns,
  data-id = aws_instance.data.*.id,
  data-ip = aws_instance.data.*.public_ip,
  data-dns = aws_instance.data.*.private_dns
 }
 )
 filename = "inventory"
}