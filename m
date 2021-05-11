Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F4037ADC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 20:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhEKSHC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 14:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhEKSHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 14:07:02 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A7FC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 11:05:55 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id i14so16331701pgk.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cbkSWHoCBhubrP3XI0OqPhJ97dBJJuopwxhFwHl7j4g=;
        b=Z2U17HJG8x4yCVF3intHs99huDEfDpZLu7YIdef6o3w01ChpuLRGySY2MFLn3j9Ho5
         CBdU1EbhdGibOpG6mcy/8mQ+rVt1VxP5UubzJtEiPcthHK/26Yi70VUJc45eKsq+ZkSQ
         pzIWFCtVutYNJYN6LrNMe/RpiKbEVVpcA9gJn/ndC4WbOqFE6SK+CA7sdEV2OTHYDT0S
         2aYCgEeHO3Q4jY0/KUzEg+2YNbMh1SFkGfHEXF+6W/zdwN/pt2pB5kwk2njbuEKv+/PO
         hSooX+qz+DbejW37rRkSJU3YArRWnSXiU0wHu36V6g2AbPv68yS/TEI6toVuw4/1ggAk
         Y7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cbkSWHoCBhubrP3XI0OqPhJ97dBJJuopwxhFwHl7j4g=;
        b=dhYKubqXEhJKWepgK7J4MAfuQarUU6OSwXTGIJHYhyP5FEPV5ClzGutZRBYYMI93Nv
         +LgGZstfRKJ41wU6RBQQusBozsWeSvUdDAwLbRppOyt0a9u1/fedg3Xb4lOe+l6cgM4B
         is4fM3vvzUek1q8iys8o4S8QNMqwdue9od3B2oLcCjCbca6+0Nv19z+zgfSLkL5f5ehE
         Uf+UlQMN6XUaJ6qFIJ0vHTGE9Xd0l3uwPWY1JF6Ur8657mlZlkbI/qulummJGAeoOb2H
         kG0dskM1n0dq+Kj28FWQArHl53TFG4HbCkQrdqMxI9s1YErAYflc1/w74obvd0qFHQM4
         swgg==
X-Gm-Message-State: AOAM532gAUHDKL6F8c2uR5s37HsPFYPqNmadSTUkKS0oxh4Le1mf9BT/
        fnsqn1WabiAeLjCr9udi6ptHc1ZUHhrJZN4I
X-Google-Smtp-Source: ABdhPJzpYKDRum7hsRelUWD5Onl5qzLbLYvwUYLzqFVNkOK7QjnnLoQFEfLxqoQ7O5XM3S/a82AfAA==
X-Received: by 2002:a65:4845:: with SMTP id i5mr31355151pgs.353.1620756354738;
        Tue, 11 May 2021 11:05:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q128sm14160468pfb.67.2021.05.11.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:05:54 -0700 (PDT)
Message-ID: <609ac782.1c69fb81.51aba.b70d@mx.google.com>
Date:   Tue, 11 May 2021 11:05:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-05-11-v5.13-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 297 runs,
 20 regressions (renesas-devel-2021-05-11-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 297 runs, 20 regressions (renesas-devel-2021-05-11=
-v5.13-rc1)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 2          =

bcm2837-rpi-3-b-32         | arm   | lab-baylibre  | gcc-8    | bcm2835_def=
config            | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

meson-gxl-s805x-p241       | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 2          =

qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-11-v5.13-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-11-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bff1b0e749d4df5f61ce46122ab7f5c522684b50 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/609a9ffae212a71c34d08f22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2=
836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2=
836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a9ffae212a71c34d08=
f23
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/609aa95716bd493bc7d08f2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609aa95716bd493bc7d08=
f2f
        failing since 90 days (last pass: renesas-devel-2021-02-01-v5.11-rc=
6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/609a95095ae781e0066f5470

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/609a95095ae781e=
0066f5474
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)
        11 lines

    2021-05-11 14:30:15.749000+00:00  kern  :alert : Mem abort in[   21.811=
474] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-05-11 14:30:15.750000+00:00  fo:
    2021-05-11 14:30:15.751000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/609a95095ae781e=
0066f5475
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)
        2 lines

    2021-05-11 14:30:15.755000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-11 14:30:15.756000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-11 14:30:15.757000+00:00  kern  :alert : Data abort info:
    2021-05-11 14:30:15.757000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-11 14:30:15.791000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-11 14:30:15.793000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a83a000
    2021-05-11 14:30:15.794000+00:00  kern  :aler[   21.852703] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/609a9595e59d778d6b6f547f

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/609a9595e59d778=
d6b6f5483
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)
        11 lines

    2021-05-11 14:32:32.111000+00:00  kern  :alert : Mem abort in[   21.665=
379] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-05-11 14:32:32.111000+00:00  fo:
    2021-05-11 14:32:32.112000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/609a9595e59d778=
d6b6f5484
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)
        2 lines

    2021-05-11 14:32:32.116000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-11 14:32:32.117000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-11 14:32:32.117000+00:00  kern  :alert : Data abort info:
    2021-05-11 14:32:32.118000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-11 14:32:32.153000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-11 14:32:32.154000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a611000
    2021-05-11 14:32:32.155000+00:00  ker[   21.705717] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre  | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/609a92880001965fa16f54bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a92880001965fa16f5=
4bc
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a96a25fcfc26e1a6f5468

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a96a25fcfc26e1a6f5=
469
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/609a98700c6d7245cc6f54a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a98700c6d7245cc6f5=
4a7
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s805x-p241       | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a99e9bf01c5681e6f54ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a99e9bf01c5681e6f5=
4ad
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a958b7c60ff125e6f54ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a958b7c60ff125e6f5=
4af
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/609a94e56f9bd1a4a96f555d

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/609a94e56f9bd1a4a96f5575
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:29:53.753000+00:00  <8>[   26.448037] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/609=
a94e56f9bd1a4a96f557b
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:29:54.864000+00:00  <8>[   27.560007] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/609a953d24a0b044a16f54db

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/609a953d24a0b044a16f54f3
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/609=
a953d24a0b044a16f54f9
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:31:16.902000+00:00  <8>[   56.891597] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a94623bb59382696f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a94623bb59382696f5=
468
        failing since 174 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a939edd8b4db44b6f5479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a939edd8b4db44b6f5=
47a
        failing since 174 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a947afb5f8bf5d36f546c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a947afb5f8bf5d36f5=
46d
        failing since 174 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a93e2bcc7093fcd6f5471

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a93e2bcc7093fcd6f5=
472
        failing since 174 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a956668b7c48df06f5494

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a956668b7c48df06f5=
495
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1) =

 =20
