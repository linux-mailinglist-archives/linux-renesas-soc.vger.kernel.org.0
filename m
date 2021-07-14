Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4533C7B16
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 03:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhGNBfR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 21:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237249AbhGNBfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 21:35:17 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C70C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 18:32:25 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id v14so513569plg.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 18:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JZEZoS/KZ/uGowY1fnWrIuy6RuP60WhOR4fFHRsom+A=;
        b=xrv63/TRKkc84ZZe/FFe/lkwWCh1Qf3PH+pFFtHy+EbPwOvqi0DsCdISJCFpZiYVQA
         KKz5FnJdpYW3yba43yOv/D0LVH0f1G3BxMBMZE8pTA/p08wyHxcTBsYs1ERRqIYhRWvl
         1HnUTcwho1NRsYe9f7JsCsMGfMjvdv25VsquzfL8PIhYO2qOAkmcNx+LPtU2eu7UuMR0
         6AfvnD7gtjJbn6VmmqlhC34nL7kwxcV/Rrq1CA8KKm3Lv9dg2PPj/izMPyWD/o/9DRID
         7EWX98z5uR+4AY/vk2psFyeXzWAYZdduRo149d6g+W59QMZ7h7+Enu4k+RY7Uix4oaIC
         9Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JZEZoS/KZ/uGowY1fnWrIuy6RuP60WhOR4fFHRsom+A=;
        b=ZQAxT85dwo2NXkBCgVUIurc5QAMZWtVYT0OHHeTQjziw87gdyaxpttqfOKbRE41w9H
         MtEWUNl1/yugDGwsjVCuUszhVlqKF5KUBH6N+dte/TaEPaoqpvqQQlQoZBOPv9vP9A3R
         tjA4gjmAmbuqXBZ+lvP22PhK21fTydzGp7RW1VDPfF+Un2PebqiNHuoDxpB8ecrQWNk8
         Yrv9Xz/66k+R908gB6UkoNPOkiSyARXel0BBDq0ZYYHD0YQIQvtNGaYSRhLq0m77yaO7
         UHNVMhHmdSGRFlvsuljzAT5XUfJgQbfg3raRgldO9auJH9oBPfDS/ItD7PQqBsPcamDY
         pztA==
X-Gm-Message-State: AOAM5337ZoW7bJ3998JOeZEESc6UsYgP+D9qOBiLnIo/7sK1+5UVmCVx
        dPqRy6FhublNMKwLTl6Bc5jz5Yci6wAv/rXn
X-Google-Smtp-Source: ABdhPJwRs8hN6l3aU/zAMm6BfHnMM/c6uqhsCGRfOp0X6mIYXzPOBbRunUver2ZaOGMAgZJ8dGfO/A==
X-Received: by 2002:a17:90a:650b:: with SMTP id i11mr7203500pjj.39.1626226345072;
        Tue, 13 Jul 2021 18:32:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c10sm398591pfo.129.2021.07.13.18.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 18:32:24 -0700 (PDT)
Message-ID: <60ee3ea8.1c69fb81.fb257.2434@mx.google.com>
Date:   Tue, 13 Jul 2021 18:32:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-13-v5.14-rc1
Subject: renesas/master baseline-nfs: 66 runs,
 19 regressions (renesas-devel-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 66 runs, 19 regressions (renesas-devel-2021-07=
-13-v5.14-rc1)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig           | 1          =

beaglebone-black          | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

beaglebone-black          | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =

beaglebone-black          | arm   | lab-cip         | gcc-8    | omap2plus_=
defconfig          | 1          =

beaglebone-black          | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 1          =

dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 1          =

hip07-d05                 | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 1          =

hip07-d05                 | arm64 | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =

r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 2          =

rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-13-v5.14-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81b7948a0be3dc48ef04d01b16c08dc3b460bce2 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee061e0cb33bfa958a93a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/bas=
eline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/bas=
eline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee061e0cb33bfa9=
58a93a8
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0805cf46a8e8688a93b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-nfs-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-nfs-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0805cf46a8e86=
88a93b5
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black          | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee074752c55da6d48a93b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee074752c55da6d=
48a93b1
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black          | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0af439a87a8c528a93c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0af439a87a8c5=
28a93c7
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black          | arm   | lab-cip         | gcc-8    | omap2plus_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee070d7afa7b15668a93e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee070d7afa7b156=
68a93e2
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black          | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee084b95aeaf4ad08a93bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nf=
s-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nf=
s-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee084b95aeaf4ad=
08a93be
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0844c78538ca668a939c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0844c78538ca6=
68a939d
        failing since 77 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
hip07-d05                 | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0e2c7ae13ad7fe8a93b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0e2c7ae13ad7f=
e8a93b1
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
hip07-d05                 | arm64 | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0f9e58390b05398a93b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0f9e58390b053=
98a93b1
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0a273de659b75d8a93a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0a273de659b75=
d8a93aa
        failing since 168 days (last pass: renesas-devel-2021-01-04-v5.11-r=
c2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0b6d32fa8b0eef8a93bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0b6d32fa8b0ee=
f8a93be
        new failure (last pass: v5.14-rc1-477-g3c037963715c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0c2e18849e11808a93f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0c2e18849e118=
08a93f3
        new failure (last pass: v5.14-rc1-477-g3c037963715c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee13991bf07716a88a93fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee13991bf07716a=
88a93fd
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee0ea121bd459eef8a93b7

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ee0ea121bd459eef8a93c1
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T22:07:23.181472  /lava-4192484/1/../bin/lava-test-case
    2021-07-13T22:07:23.213614  <8>[   52.274165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ee0ea121bd459eef8a93c2
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T22:07:22.106837  /lava-4192484/1/../bin/lava-test-case
    2021-07-13T22:07:22.140828  <8>[   51.200757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee10a15d0b0ee8378a93a7

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ee10a15d0b0ee8378a93b1
        failing since 0 day (last pass: renesas-devel-2021-06-22-v5.13-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c)

    2021-07-13T22:15:39.956270  /lava-4192514/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ee10a15d0b0ee8378a93b2
        failing since 0 day (last pass: renesas-devel-2021-06-22-v5.13-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c)

    2021-07-13T22:15:38.890946  /lava-4192514/1/../bin/lava-test-case
    2021-07-13T22:15:38.918537  <8>[   97.482455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee196c7e7d4e646c8a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee196c7e7d4e646=
c8a939c
        failing since 73 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee1443d21addf5168a93c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee1443d21addf51=
68a93c7
        failing since 98 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
