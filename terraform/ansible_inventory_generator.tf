# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/ansible_hosts.tpl",
    {
      central_public = aws_instance.centralRouter.public_ip
      siteA_public = aws_instance.edgeRouterA.public_ip
      siteB_public = aws_instance.edgeRouterB.public_ip
    }
  )
  filename = "../ansible_configs/hosts.cfg"
}