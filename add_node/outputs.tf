resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  node-id = aws_instance.node.*.id,
  node-ip = aws_instance.node.*.public_ip,
  node-dns = aws_instance.node.*.private_dns,  
 }
 )
 filename = "inventory"
}