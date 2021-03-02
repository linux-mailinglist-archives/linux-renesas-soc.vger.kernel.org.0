Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1813832A639
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Mar 2021 17:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351366AbhCBOQL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Mar 2021 09:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242437AbhCBDP4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 22:15:56 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DED3C06178B
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 19:15:16 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 192so5906062pfv.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Mar 2021 19:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r8ICu/5K52NFiypJy9Q0lKXgYaF72FLhs47WdPH7od4=;
        b=1JnO5hLZkdWH5jxP919tHOGHmg+dlPNY6smXq7dQqkZo06IMGEmrw4FNBQsdgQL5x7
         IeDAtwZO+KX6s3/VWB5xbe3yI/6Zu24IglhLcl0PmwkL4dvb6T4oimNR+WCwVL+8zBb7
         unY89ji4y6SjD4hShv9cFL+8nmPyU4dtlhcfSQEs8PRAmE5oxp96mYwNPDKwiwSyaUAO
         H1gR9g3Zop5fzJY0TkI+AYZ1lySuaoQmmYLQhYl41Z2p5xKScGXC+4CTdSGiVLCZxn9E
         YI12LSP8BWanAa9gKjCCqIzH9MwAjr1xtEomqY9LJv4QqvelYVO5FHand0FxQw/CTN4X
         yviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r8ICu/5K52NFiypJy9Q0lKXgYaF72FLhs47WdPH7od4=;
        b=oaxVOY7lRdrToEq46tnnRQyUnpdWB5WgPmmmPn2PE12VbsVYZIWUvBU0UAVJkyA0i9
         sdL352Ff6iaJRmUd1SRlH2zK9UpWEbHYiXO3P34dttUp1bY5CNR6joy8nd7ZIM0I19Lc
         13EMv22VR1PS+NsMv91ReuwVtGhMp2Ni8xUOfHGMJkrru8nysnFAMiJjl2RMwulaCjXi
         CuVU8EV3i88HffP7gPvJ9EHqgzxRAyj8SrQEpA1sjz1tORQnhPPeXTvuyJhPA/VYwEdA
         PTfM26/pGR3ooVJ2qxQ+suAXQoPr7LXS7YCS9CzwN4xjCumJQZ/JMWWOIhaK8m1asICz
         RoZw==
X-Gm-Message-State: AOAM532zXSxPYGm/wXmFU2jum7hfjQc2O9NUM28IiiRXAH7I4ueb5hot
        teblyk0MjsXTvldyhAla6hOCI7Tqd9VMyQ==
X-Google-Smtp-Source: ABdhPJw9bTDX2mXlin64BhM7MCVjiSr5G+yKeDMceKsMjOLn0yT1QKKKjq8P2VNRtfoICsBk1Ur/kQ==
X-Received: by 2002:aa7:91d2:0:b029:1ed:b10b:5a7 with SMTP id z18-20020aa791d20000b02901edb10b05a7mr1549913pfa.2.1614654915714;
        Mon, 01 Mar 2021 19:15:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ca1sm875574pjb.55.2021.03.01.19.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 19:15:15 -0800 (PST)
Message-ID: <603dadc3.1c69fb81.bf0ab.326b@mx.google.com>
Date:   Mon, 01 Mar 2021 19:15:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc1-12-g3158164f1526
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 289 runs,
 11 regressions (v5.12-rc1-12-g3158164f1526)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 289 runs, 11 regressions (v5.12-rc1-12-g3158164f1526)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc1-12-g3158164f1526/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc1-12-g3158164f1526
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3158164f15266c9acdb4d53ec2df89b4723dcde7 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d78a0e4d22d6650addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d78a0e4d22d6650add=
cb6
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7da847d9c1a1d0addcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-=
imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-=
imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7da847d9c1a1d0add=
cc2
        failing since 31 days (last pass: renesas-next-2021-01-26-v5.11-rc1=
, first fail: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/603d78c7baf9b524abaddcb8

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/603d78c7baf9b52=
4abaddcbc
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1)
        11 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/603d78c7baf9b52=
4abaddcbd
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1)
        2 lines

    2021-03-01 23:28:48.590000+00:00  kern  :alert : <8>[   16.682505] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D2>
    2021-03-01 23:28:48.591000+00:00    CM =3D 0, WnR =3D <8>[   16.691496]=
 <LAVA_SIGNAL_ENDRUN 0_dmesg 774117_1.5.2.4.1>
    2021-03-01 23:28:48.591000+00:00  1
    2021-03-01 23:28:48.591000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000081b7000
    2021-03-01 23:28:48.591000+00:00  kern  :alert : [0000000000000000] pgd=
=3D00000000081da003, p4d=3D00000000081da003, pud=3D00000000081db003, pmd=3D=
0000000000000000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7c2fc492546c77addd36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7c2fc492546c77add=
d37
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/603d7cbb777b6ada55addcbd

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/603d7cbb777b6ad=
a55addcc1
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1)
        8 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/603d7cbb777b6ad=
a55addcc2
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1)
        2 lines

    2021-03-01 23:45:43.232000+00:00  kern  :al<8>[   46.044960] <LAVA_SIGN=
AL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D=
2>
    2021-03-01 23:45:43.232000+00:00  ert : [ffff000<8>[   46.053586] <LAVA=
_SIGNAL_ENDRUN 0_dmesg 774240_1.5.2.4.1>
    2021-03-01 23:45:43.232000+00:00  00345ece0] pgd=3D000000007fff8003
    2021-03-01 23:45:43.232000+00:00  kern  :emerg : Internal error: Oops: =
8600000f [#1] PREEMPT SMP
    2021-03-01 23:45:43.233000+00:00  kern  :emerg : Code: 0885fd80 ffff000=
0 00000000 00000000 (00000000) =

    2021-03-01 23:45:43.233000+00:00  + set +x
    2021-03-01 23:45:43.337000+00:00  / # #   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d778b9c2d83fd91addcd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d778b9c2d83fd91add=
cd1
        failing since 98 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d77739c2d83fd91addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d77739c2d83fd91add=
cb2
        failing since 98 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d77769c2d83fd91addcb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d77769c2d83fd91add=
cb7
        failing since 98 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7715be9bf55ae2addcd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7715be9bf55ae2add=
cd5
        failing since 98 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
