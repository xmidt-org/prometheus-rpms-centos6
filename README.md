# prometheus-rpms-centos6

[![Build Status](https://travis-ci.org/Comcast/prometheus-rpms-centos6.svg?branch=master)](https://travis-ci.org/Comcast/prometheus-rpms-centos6) 
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/prometheus-rpms-centos6/blob/master/LICENSE)

The packaging of Prometheus.io related packages for centos 6.

# How to Install

## Centos 6

1. Import the public GPG key (replace `0.0.1-65` with the release you want)

```
rpm --import https://github.com/Comcast/prometheus-rpms-centos6/releases/download/0.0.1-65/RPM-GPG-KEY-comcast-xmidt
```

2. Install the rpm with yum (so it installs any/all dependencies for you)

```
yum install https://github.com/Comcast/prometheus-rpms-centos6/releases/download/0.0.1-65/prometheus-rpms-centos6-0.0.1-65.el6.x86_64.rpm
```
