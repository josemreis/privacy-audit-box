# privacy-audit-box

A vagrant virtualbox base box with conda, expressvpn, and openwpm installed.

## Building the box

```bash
packer build -force -on-error=cleanup -varfile="variables.json" build.json
```

## Expressvpn activation code

To build this box you will need a working expressvpn activation code. Define it in `variables.json` file.

```bash
{
  "activation_code": "secrets"
}
```
