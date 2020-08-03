resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  cdf-id = aws_instance.cdf.*.id,
  cdf-ip = aws_instance.cdf.*.public_ip,
  cdf-dns = aws_instance.cdf.*.private_dns,  
 }
 )
 filename = "inventory"
}