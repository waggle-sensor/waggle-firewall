# Waggle Firewall Service

Service to add or remove firewall rules.

## Usage

To add the firewall rules (as specified by the "rules file"):

```
./waggle-firewall -r <path to rules file>
```

To remove the firewall rules (as specified by the "rules file"):

```
./waggle-firewall -r <path to rules file> -d
```

### Example 'rules' file

The rules file shall contain 1 [`iptables`](https://linux.die.net/man/8/iptables) rule per line.  For example:

```
INPUT -i wan0 -m conntrack ! --ctstate RELATED,ESTABLISHED -j DROP
FORWARD -i wan0 -m conntrack ! --ctstate RELATED,ESTABLISHED -j DROP
INPUT -i wifi0 -m conntrack ! --ctstate RELATED,ESTABLISHED -j DROP
FORWARD -i wifi0 -m conntrack ! --ctstate RELATED,ESTABLISHED -j DROP
INPUT -i modem0 -m conntrack ! --ctstate RELATED,ESTABLISHED -j DROP
FORWARD -i modem0 -m conntrack ! --ctstate RELATED,ESTABLISHED -j DROP
```

## Binding to this Service

If another service wants to only run _after_ the firewall service has run
and to be sure the firewall service has started successfully.  The following
[`BindsTo`](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#BindsTo=)
rule should be added to the service.

```
[Unit]
# ensure service doesn't run unless the firewall is up
After=waggle-firewall.service
BindsTo=waggle-firewall.service
```
