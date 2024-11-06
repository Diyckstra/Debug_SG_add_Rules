locals {

    sg_tcp_access = flatten(
        [
            for tcp in var.SecGroup.allow_tcp_ports:
            [
                for ip in var.SecGroup.allow_from_ips:
                {
                    from_port   = split("-", tcp)[0]
                    to_port     = element(split("-", tcp), length(split("-", tcp)) - 1)
                    protocol    = "tcp"
                    cidr_blocks = ip
                }
            ]
        ])

    sg_udp_access = flatten(
        [
            for udp in var.SecGroup.allow_udp_ports:
            [
                for ip in var.SecGroup.allow_from_ips:
                {
                    from_port   = split("-", udp)[0]
                    to_port     = element(split("-", udp), length(split("-", udp)) - 1)
                    protocol    = "udp"
                    cidr_blocks = ip
                }
            ]
        ])

    sg_access = concat(local.sg_tcp_access, local.sg_udp_access)
}
