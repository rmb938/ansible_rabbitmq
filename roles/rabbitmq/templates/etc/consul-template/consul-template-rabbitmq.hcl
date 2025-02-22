# {{ ansible_managed }}

vault {
  address = "http://127.0.0.1:8100"
  renew_token = false
  retry {
    # Settings to 0 for unlimited retries.
    attempts = 0
  }
}

consul {
  address = "127.0.0.1:8500"
  retry {
    # Settings to 0 for unlimited retries.
    attempts = 0
  }
}

# Unsure if this is needed tbh
wait {
  min = "15s"
  max = "30s"
}

# RabbitMQ Config
template {
  source = "/etc/consul-template/templates/rabbitmq/rabbitmq.conf.ctmpl"
  destination = "/etc/rabbitmq/rabbitmq.conf"
  create_dest_dirs = false
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart rabbitmq-server || true"
  }
}

# RabbitMQ Erlang Cookie
template {
  source = "/etc/consul-template/templates/rabbitmq/rabbitmq-erlang.cookie.ctmpl"
  destination = "/var/lib/rabbitmq/.erlang.cookie"
  create_dest_dirs = false
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart rabbitmq-server || true"
  }
}

# RabbitMQ Cluster CA
template {
  source = "/etc/consul-template/templates/rabbitmq/rabbitmq-cluster-ca.crt.ctmpl"
  destination = "/etc/rabbitmq/rabbitmq-cluster-ca.crt"
  create_dest_dirs = false
  perms = "0644"
  exec {
    command = "sudo systemctl reload-or-restart rabbitmq-server || true"
  }
}

# RabbitMQ Cluster CLI
template {
  source = "/etc/consul-template/templates/rabbitmq/rabbitmq-cluster-cli.ctmpl"
  destination = "/etc/rabbitmq/rabbitmq-cluster-cli.rendered"
  create_dest_dirs = false
  perms = "0644"
  exec {
    command = "sudo systemctl reload-or-restart rabbitmq-server || true"
  }
}

# RabbitMQ AMPQ CA
template {
  source = "/etc/consul-template/templates/rabbitmq/rabbitmq-ca.crt.ctmpl"
  destination = "/etc/rabbitmq/rabbitmq-ca.crt"
  create_dest_dirs = false
  perms = "0644"
  exec {
    command = "sudo systemctl reload-or-restart rabbitmq-server || true"
  }
}

# RabbitMQ AMPQ Cert
template {
  source = "/etc/consul-template/templates/rabbitmq/rabbitmq-cert.ctmpl"
  destination = "/etc/rabbitmq/rabbitmq-cert.rendered"
  create_dest_dirs = false
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart rabbitmq-server || true"
  }
}