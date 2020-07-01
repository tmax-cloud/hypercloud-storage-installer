# Hypercloud-Storage-Installer

`hcsctl` provides installation, removal and management of HyperCloud Storage resources.

## Prerequisite

- kubectl (>= 1.15)
- Kubernetes cluster

## Default installed version

- Rook-Ceph v1.3.6
- KubeVirt-CDI v1.18.0

## Getting Started

- Rook-Ceph and KubeVirt-CDI yaml files are required to install hypercloud-storage. You can easily create them by using `hcsctl`.

   ``` shell
   $ hcsctl create-inventory {$inventory_name}
   # Ex) hcsctl create-inventory myInventory
   ```

- Then, a directory is created on the current path with the given inventory name. Inside of the directory, two directories are created named as rook and cdi.
  - `./myInventory/rook/*.yaml` are yaml files for Rook-Ceph installation
  - `./myInventory/cdi/*.yaml` are yaml files for KubeVirt-CDI installation
- Please note that all the generated yamls are just sample. Go through each files and change values to suit your host environment.
  - <strong> Do not modify the name of folders and files. </strong>
  - Take a look at [rook documentation](https://rook.github.io/docs/rook/v1.3/ceph-cluster-crd.html) before modify each fields under `./myInventory/rook/` path
  - Change the version of `OPERATOR_VERSION` and container image in the `operator.yaml` file  under the path `./myInventory/cdi/` only if you need to change the KubeVirt-CDI version to install
- After modifying the inventory files to suit your host environment, install hypercloud-storage with hcsctl.
   ``` shell
   $ hcsctl install {$inventory_name}
   # Ex) hcsctl install myInventory
   ```
    - After installation is completed, you can use HyperCloud Block Storage and Shared Filesystem.
- Verify if hypercloud-storage is installed completely with `hcsctl.test` command.

    ``` shell
    $ hcsctl.test
    ```

    - This command will execute various test cases to verify that hypercloud-storage is installed properly.
    - It will take up to 15 minutes to complete the test
    - CDI test cases are not able to run in private network environment, without public internet access.

## Uninstall

- Remove hypercloud-storage with `hcsctl`. You need the same exact inventory name that you installed with `hcsctl`.

    ``` shell
    $ hcsctl uninstall {$inventory_name}
    # Ex) hcsctl uninstall myInventory
    ```

    - You may need additional work to do depends on the message that is displayed when the uninstallation is completed.

## Additional features

- In addition to installation and uninstallation, various additional functions are also provided with `hcsctl` for convenience.

You can execute following ceph commands with hcsctl.

``` shell
$ hcsctl ceph status
$ hcsctl ceph exec {$ceph_cmd}
# Useful commands to check ceph cluster status
$ hcsctl ceph status
$ hcsctl ceph exec ceph osd status
$ hcsctl ceph exec ceph df
```

## Compatibility

- This project has been verified with following versions.
  - Kubernetes
    - v1.17
    - v1.16
    - v1.15
  - OS
    - Ubuntu 18.04
    - CentOS 8.1, 7.7
    - ProLinux 7.5
