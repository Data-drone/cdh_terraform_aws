resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  db-id = aws_instance.db.id,
  db-ip = aws_instance.db.public_ip,
  db-dns = aws_instance.db.private_dns,
  manager-id = aws_instance.manager.id,
  manager-ip = aws_instance.manager.public_ip,
  manager-dns = aws_instance.manager.private_dns,
  krb5-id = aws_instance.krb5.id,
  krb5-ip = aws_instance.krb5.public_ip,
  krb5-dns = aws_instance.krb5.private_dns,
  master-id = aws_instance.master.*.id,
  master-ip = aws_instance.master.*.public_ip,
  master-dns = aws_instance.master.*.private_dns,
  data-id = aws_instance.data.*.id,
  data-ip = aws_instance.data.*.public_ip,
  data-dns = aws_instance.data.*.private_dns,
  edge-id = aws_instance.edge.id,
  edge-ip = aws_instance.edge.public_ip,
  edge-dns = aws_instance.edge.private_dns,
  cdf_admin-id = aws_instance.cdf_admin.id,
  cdf_admin-ip = aws_instance.cdf_admin.public_ip,
  cdf_admin-dns = aws_instance.cdf_admin.private_dns,
  cdf-id = aws_instance.cdf.*.id,
  cdf-ip = aws_instance.cdf.*.public_ip,
  cdf-dns = aws_instance.cdf.*.private_dns,
  
 }
 )
 filename = "inventory"
}