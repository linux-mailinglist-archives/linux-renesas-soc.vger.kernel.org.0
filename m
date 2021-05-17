Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA461383B3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 19:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbhEQR0s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 13:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbhEQR0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 13:26:48 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E31C061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:25:32 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t11so4086788pjm.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7vV0SbbFYQkA18+c62VxEsN4JLIlsDdcEyoLRm4AJ/0=;
        b=Jn//Op7gXrhC8sH8DcpxXK0xK5ES3uRV2gJVZIdKlwvQe3AtvFNPydv9uAXJhIQgYD
         keCEl+AHaaB9BAdua7+HjZdR+hptRDUdDp+tW3IUEqZHkrUEREbkOoPW8wot38cVpYtC
         B1T8PlNcBfrakaHyuwT1vpM9N0fmWbuJRe1PB8JKvrF2zSGwtdadfDbKfgJJ1aOmVPfq
         yeAlJFHx7qomI0eaQiWsGHDS0Di6kabnqPE9o0COext3XxEYLvEQusQmC68lZsYiaGgM
         jZ6GYKjzaGIkqW22G/qVnl0SJje48zsv9CeSBnJzFDtfHidu9Qa2y8FJtnzVBargO+aR
         Uvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7vV0SbbFYQkA18+c62VxEsN4JLIlsDdcEyoLRm4AJ/0=;
        b=INbVtSVJ//a5hB2ETBdt8k+B5bPy70l3t2iMLwel8yG5aN7FvrgtZZpHgYkpMwWVCp
         hsUffYYpgtzLGf2s5IuMI6yPI7Q2lWAcIEIeJzQJmJxpme3HlJy2NiX/FJDyWS2sJDM6
         v6AXJWcwgcEal6NeeXsbBDs4n7et3uGmR6QFtc7eluAcpecllX+TglDTFzubH8aoHulI
         buqTNkY9v0KiUiSRaUr1ilRcOMMCLd4nDgserjAeMO81W0R7hBQwvl/GBzGNaDHPYAJv
         rvOEJKU69CwcXuI3EySRfg/2d1VrifyKebrWRiK2ccDDMC09jA+JHLv31EC2RgIWq/8P
         RpKQ==
X-Gm-Message-State: AOAM532wz1U0Ghm/vN4rlEMuEbn+Y0NhIwqRWdNFU/XKEzs0hALYTCgj
        zKb/iO+Mu545XxMr+wbC/XuJSKvum+zu7uXZ
X-Google-Smtp-Source: ABdhPJwtEgJX1g9/E7AfHYDekZuQyLKISJOygm7MC+F3gTnKR6X+vQyLnJP/HByNnE869d2EsfKqwg==
X-Received: by 2002:a17:902:f68c:b029:f0:c1be:5651 with SMTP id l12-20020a170902f68cb02900f0c1be5651mr1144654plg.24.1621272331349;
        Mon, 17 May 2021 10:25:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y26sm10947790pge.94.2021.05.17.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 10:25:31 -0700 (PDT)
Message-ID: <60a2a70b.1c69fb81.eeca5.46e1@mx.google.com>
Date:   Mon, 17 May 2021 10:25:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-17-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 222 runs,
 10 regressions (renesas-next-2021-05-17-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 222 runs, 10 regressions (renesas-next-2021-05-17-v5=
.13-rc1)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-17-v5.13-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-17-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      943db114cf998d030df260dfab3248894cc38719 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60a273c9ccdb9d5277b3afa0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60a273c9ccdb9d5=
277b3afa6
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)
        11 lines

    2021-05-17 13:46:29.145000+00:00  kern  :alert : Mem abort in[   21.744=
476] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-05-17 13:46:29.146000+00:00  fo:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60a273c9ccdb9d5=
277b3afa7
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)
        2 lines

    2021-05-17 13:46:29.148000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-17 13:46:29.149000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-17 13:46:29.149000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-17 13:46:29.150000+00:00  kern  :alert : Data abort info:
    2021-05-17 13:46:29.150000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-17 13:46:29.197000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-17 13:46:29.198000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a95e000
    2021-05-17 13:46:29.199000+00:00  ker[   21.785147] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60a2745666f6c5c0f2b3afa0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60a2745666f6c5c=
0f2b3afa6
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)
        11 lines

    2021-05-17 13:48:48.065000+00:00  kern  :alert : Mem [   21.817703] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-17 13:48:48.066000+00:00  abort info:
    2021-05-17 13:48:48.067000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-05-17 13:48:48.067000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-17 13:48:48.068000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-17 13:48:48.069000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-17 13:48:48.070000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60a2745666f6c5c=
0f2b3afa7
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)
        2 lines

    2021-05-17 13:48:48.107000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-17 13:48:48.109000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.857216] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-17 13:48:48.109000+00:00  0000443d000   =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60a273dd87a3f8e82bb3afc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a273dd87a3f8e82bb3a=
fc6
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60a275da6465472ff8b3af99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a275da6465472ff8b3a=
f9a
        failing since 48 days (last pass: renesas-next-2021-03-24-v5.12-rc2=
, first fail: renesas-next-2021-03-29-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a26f6554c0512ce6b3afc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a26f6554c0512ce6b3a=
fc5
        failing since 175 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a26f2fff97353eefb3afa2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a26f2fff97353eefb3a=
fa3
        failing since 175 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a26f33ff97353eefb3afa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a26f33ff97353eefb3a=
faa
        failing since 175 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60a27490f7404da8b4b3afab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a27490f7404da8b4b3a=
fac
        failing since 56 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =20
