Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4BED304D2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 00:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731662AbhAZXD6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 18:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392752AbhAZSXC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 13:23:02 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AF4C061756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 10:22:19 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id j21so5619153pls.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rsjDqV7pHo/sQDaixSMU6BHJYCLrS/0700QQSLts3RI=;
        b=10VYfG26ipup2i43k4mx+7NZG7aa5xNjwxggHQR39HMjCO+Dva8HxT6vYdkCuY1m6p
         FmkVy9NGMuZ42hSSmqc6rnOFx8BKwnMJ+D1YCAgWHzcOGmAz96gbJ6z7sY5vhoHm0QBU
         kFgKJd8kXLnV+LoWgx0juqPol9rhUGU1er34HPuBL2oAL05Jhpx4O1umA5NfcVkQ12AP
         JCQ7SWHoNhSElCjI1aSpjO7cabtnLr6HIANNmA4bhDe1jGM74wbyqTrpepdWMDg5C26R
         hcq6yLE4mu0kCGnYBfVrMJ27GmJn5HKQOy2uyVoZFFhegkdRdNaSUNOHWLJJuPTGaYW0
         JiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rsjDqV7pHo/sQDaixSMU6BHJYCLrS/0700QQSLts3RI=;
        b=W7+RwDg9we0Eg3wnVubJEZFW/INci5mhz0ChIbCe2JZyjehFHjSus4ADA1ST3GmjY9
         dhaXqIvqTzHd3bnZDRVgQvZDNI4qifPAjO5HmspTffSu/HkDq5i4xFrNoUKt5t5KSxMK
         WWS3sGAcjxcW4auYa1bOJ5sUnVYevDFniz8FgC5tlRQ5chAqQ7DR+nbQx3zNP283h0sC
         gqy/IFQVJ3CbGNSfyLdTHJ0IPgX4p1H4wZSZzmCJM0dk9E/1TM8ZsGVDeHS7kAPl4gYS
         FYHopAKhXwy3mvMrKjooiZH1VSBrxKbVPBuBEbFlZ0D+CJjNFGrbJQT4DyrlUb4Pd5fw
         cAHg==
X-Gm-Message-State: AOAM5302uTprVppd9ZXiST9u+ql3yxb95IJWRwXRPaUK/sVJ037waC3b
        sjYduzPIIUCIRupOanvHJzX+wWJ6l3zHznfy
X-Google-Smtp-Source: ABdhPJw7/sU/S/LY74DEJZ6sjcSEX/ao9N2IquSA9Q33jKLA3iFRB+o3WgYqQSwAp8vHA/DzGYbclg==
X-Received: by 2002:a17:903:31d1:b029:de:8361:739b with SMTP id v17-20020a17090331d1b02900de8361739bmr7195819ple.85.1611685338273;
        Tue, 26 Jan 2021 10:22:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w25sm19886469pfg.103.2021.01.26.10.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 10:22:17 -0800 (PST)
Message-ID: <60105dd9.1c69fb81.d2ce4.febd@mx.google.com>
Date:   Tue, 26 Jan 2021 10:22:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-01-26-v5.11-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 248 runs,
 11 regressions (renesas-next-2021-01-26-v5.11-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 248 runs, 11 regressions (renesas-next-2021-01-26-v5=
.11-rc1)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 2          =

meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-26-v5.11-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-26-v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      14fd8c48abd95598a4d17840a34b73736a410df1 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60102cf1a6f5a5e92ed3dff9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60102cf1a6f5a5e92ed3d=
ffa
        failing since 21 days (last pass: renesas-next-2020-11-30-v5.10-rc1=
, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60102b5d9e18394226d3dfe7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60102b5d9e18394226d3d=
fe8
        failing since 21 days (last pass: renesas-next-2020-11-30-v5.10-rc1=
, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60102ea5d68e24cecfd3dfe6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60102ea5d68e24cecfd3d=
fe7
        failing since 21 days (last pass: renesas-next-2020-11-30-v5.10-rc1=
, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60102ae405b2d83ee0d3dfcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60102ae405b2d83ee0d3d=
fce
        new failure (last pass: renesas-next-2021-01-25-v5.11-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60102ad17924678dccd3dffe

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60102ad17924678=
dccd3e002
        new failure (last pass: renesas-next-2021-01-25-v5.11-rc1)
        10 lines

    2021-01-26 14:44:28.200000+00:00  kern  :alert : Mem abort info:
    2021-01-26 14:44:28.200000+00:00  kern  <8>[   45.732178] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D10>
    2021-01-26 14:44:28.201000+00:00  :alert :   ESR =3D 0x96000004
    2021-01-26 14:44:28.201000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-26 14:44:28.201000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-26 14:44:28.201000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-26 14:44:28.201000+00:00  kern  :alert : Data abort info:
    2021-01-26 14:44:28.201000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60102ad17924678=
dccd3e003
        new failure (last pass: renesas-next-2021-01-25-v5.11-rc1)
        2 lines

    2021-01-26 14:44:28.249000+00:00  ker<8>[   45.762719] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-26 14:44:28.249000+00:00  n  :alert : [00010<8>[   45.772981] <=
LAVA_SIGNAL_ENDRUN 0_dmesg 633087_1.5.2.4.1>
    2021-01-26 14:44:28.249000+00:00  101010101f9] address between user and=
 kernel address ranges
    2021-01-26 14:44:28.249000+00:00  kern  :emerg : Internal error: Oops: =
96000004 [#1] PREEMPT SMP
    2021-01-26 14:44:28.249000+00:00  kern  :emerg : Code: 91034378 d280003=
c 91062000 f90033e0 (f9401701) =

    2021-01-26 14:44:28.249000+00:00  + set +x
    2021-01-26 14:44:28.354000+00:00  / # #   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60102dde311577b173d3dfd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60102dde311577b173d3d=
fd6
        failing since 6 days (last pass: renesas-next-2021-01-14-v5.11-rc1,=
 first fail: renesas-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6010249c551b637f1dd3dfe8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010249c551b637f1dd3d=
fe9
        failing since 64 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6010368d88d665929ed3e006

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010368d88d665929ed3e=
007
        failing since 64 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/601024994eccfe7d2bd3dfdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601024994eccfe7d2bd3d=
fde
        failing since 64 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/601024501f25d6786ad3e0df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-26-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601024501f25d6786ad3e=
0e0
        failing since 64 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
