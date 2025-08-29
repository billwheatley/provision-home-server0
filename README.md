# provision-home-server0

Home Server Ansible Setup

**This Repo is Work In Progress**

## Bootstrap

As your main admin/sudo user (do not sudo the call, that is done in the script):

```console
cd ~
mkdir -p ~/dev/ansible-desktop
cd ~/dev/ansible-desktop
```

Short Version:

```console
curl -sL https://tinyurl.com/bw-s0-btst | bash -
```

Long Version:

```console
curl -s https://raw.githubusercontent.com/billwheatley/provision-home-server0/refs/heads/main/bootstrap/bootstrap.sh | bash -
```