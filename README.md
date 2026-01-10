# cozy-pxe

Minimal PXE server stack for home/lab provisioning.

## Services

- **dnsmasq** - DHCP + TFTP (iPXE chainload)
- **http** - nginx + PHP for dynamic boot menus
- **foreman** - provisioning templates UI
- **db** - PostgreSQL

## Usage

```bash
docker compose up -d
```

Drop ISOs/images into `app/mnt/`. They'll appear in the iPXE menu automatically.

## Ports

| Service | Port |
|---------|------|
| DHCP    | 67   |
| TFTP    | 69   |
| HTTP    | 80   |
| Foreman | 3000 |

## License

MIT
