e3-tsc  
======
ESS Site-specific EPICS module : tsc


## Initialize repository
```
e3-tsc (master)$ make init
```

## TscMon and SmemCalibration within Host Architecture. 

If one would like to recompile TscMon and SmemCalibration within the development environment. One can use it within the host architecture. If one would like to use the cross compiler, please look at the individual README in the driver path. 

```sh
e3-tsc (master)$ make tsc-build
e3-tsc (master)$ make tsc-install
e3-tsc (master)$ tree bin/
bin/
└── [jhlee    4.0K]  linux-x86_64
    ├── [jhlee    448K]  SmemCalibration
    └── [jhlee    448K]  TscMon

```

## Kernel module (tsc.ko and pon.ko) can be installed via DKMS


```sh
e3-tsc (master)$ make dkms_add
e3-tsc (master)$ make dkms_build
e3-tsc (master)$ make dkms_install
```

In order to remove them

```sh
e3-tsc (master)$ make dkms_uninstall
e3-tsc (master)$ make dkms_remove
```

## Kernel modules configuration

* Create and load the autoload configuration in /etc/modules-load.d/{tsc,pon}.conf
* Remove and load the kernel module with modprobe

```sh
e3-tsc (master)$ make setup
```

In order to clean the configuration,

```sh
e3-tsc (master)$ make setup_clean
```

## TscMon and SmemCalibration within the development mode
There is a potential risk that may mix all configuration files. However, if one would like to challenge this, one can do.

```
make devinit
echo "E3_MODULE_SRC_PATH:=tsc-dev" > configure/CONFIG_MODULE.local
make tsc-build
make tsc-install
rm configure/CONFIG_MODULE.local
```
The binary files are built from `tsc-dev` and located in the same place

```
tree bin/
bin/
└── [jhlee    4.0K]  linux-x86_64
    ├── [jhlee    463K]  SmemCalibration
    └── [jhlee    463K]  TscMon
```



## Notice
If one has already the running dkms.service in systemd, the next reboot with new kernl image will make the kernel module be ready. However, if one doesn't have one, please run bash dkms/dkms_setup.bash in order to enable dkms.service.

```
$ bash dkms/dkms_setup.bash
$ systemctl status dkms
● dkms.service - Builds and install new kernel modules through DKMS
   Loaded: loaded (/etc/systemd/system/dkms.service; enabled; vendor preset: ena
   Active: active (exited) since Sun 2018-07-29 01:13:59 CEST; 4s ago
     Docs: man:dkms(8)
  Process: 3271 ExecStart=/bin/sh -c dkms autoinstall --verbose --kernelver $(un
 Main PID: 3271 (code=exited, status=0/SUCCESS)

