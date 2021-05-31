Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CAF39672C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 19:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbhEaRgf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 13:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbhEaRgO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 13:36:14 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE37C01CB3E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 09:40:04 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id z26so5375299pfj.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bX4BTplg/JFjZ2zxOhZ8PRf5OZpONUlldYxX4KsDNe4=;
        b=0Ua8mCUKLFXuw5DcAnS42LVEEoxjMdFE8mSA+vh0qZmyJhlnk56FgCJ0XvpxC0k98Q
         cWP1BYqszy1wNqVnhac647qW6yICbHgSpTDXgnS8YLPykbIus7COa6z1pZBCpLEqT5Fw
         4XXiCt4NQowP4L/XYOJW47aJMzH8VimSCXkGtzdhDLvEVZriDMCoYTmh+YzphwjkCrj6
         CR3eesm6Ypz4z79HwpUq+KsN4QRDsPt1NVkuYNRqV3sgHDkaLRtn9fpHs0D6I2+/xEEP
         eyYX853b/u/QgRJAZA8GL5L9QLIu4AaO4jlSRLSoFEGOG5ZtCNd16ilwqbm0VYr9k7bn
         dSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bX4BTplg/JFjZ2zxOhZ8PRf5OZpONUlldYxX4KsDNe4=;
        b=QRAFwbwmANrqrFHUHBkblzgngLbTL8LrgwCdKcAkYxtMhuSLZOZ/sfyKO1kScOcl4L
         lRKBsa/jXcmzVH6KXnhBzYmJr3Fp2Mio27A9hnfC0IwTXWgNFmnBldyy/yFdPFMd/vEB
         RfPDeYfvd6RDR4XZHx4K8Fu0xAFp6iBL2sjtzfooLoid9xLuTnEiO+mm5wjVYvDko4Ch
         8yDbUGuHWtaCOkxmxVJuow3eqc/jGIpwAxHxIM6CBF+id7mJJTOid2SVXYYVXaB/Rw0y
         UGRida9bxHdRwLtKh+PfO87CCbBjXZCO+/EvLNHvMXsEh4ZWO5XeoKA/Vm6eajwUT8lY
         zpLQ==
X-Gm-Message-State: AOAM531rLwXsMPDoUhX1GD0Ykuyd+TB31rwLkY///4iavnS7LCsC7BOB
        4rqCC52C08rI9cQ7u0Is1BQoKVqlORozZ7BE
X-Google-Smtp-Source: ABdhPJxlw7jlDtl24qNv79/m6S5q2yH1aZp5YJuxFNIHb4PqOiW3YSeB4iBAFzKsreGQZJlvbqEDNQ==
X-Received: by 2002:a63:5c5e:: with SMTP id n30mr23316570pgm.87.1622479203744;
        Mon, 31 May 2021 09:40:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q24sm12016833pgk.32.2021.05.31.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 09:40:03 -0700 (PDT)
Message-ID: <60b51163.1c69fb81.86f70.5cd6@mx.google.com>
Date:   Mon, 31 May 2021 09:40:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-31-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 248 runs,
 11 regressions (renesas-next-2021-05-31-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 248 runs, 11 regressions (renesas-next-2021-05-31-v5=
.13-rc1)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-31-v5.13-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-31-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      acad452912fc6a5cd2171fbe6af0ecbb3aad265c =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4dbeb31fdfb43f5b3afc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4dbeb31fdfb43f5b3a=
fc7
        failing since 90 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4d75c4094a8234bb3afc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4d75c4094a8234bb3a=
fca
        failing since 146 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4d52f484d57c8c4b3afaf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4d52f484d57c8c4b3a=
fb0
        failing since 3 days (last pass: renesas-next-2021-05-25-v5.13-rc1,=
 first fail: renesas-next-2021-05-27-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60b4d406aa6b161c8eb3af99

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60b4d407aa6b161c8eb3afad
        failing since 6 days (last pass: renesas-next-2021-05-11-v5.13-rc1,=
 first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-05-31 12:18:11.111000+00:00  <8>[   55.789284] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60b=
4d407aa6b161c8eb3afb3
        failing since 6 days (last pass: renesas-next-2021-05-11-v5.13-rc1,=
 first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-05-31 12:18:12.217000+00:00  /lava-3919972/1/../bin/lava-test-case
    2021-05-31 12:18:12.226000+00:00  <8>[   56.904009] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60b4d4f21f8d4ab852b3afec

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60b4d4f21f8d4ab852b3b000
        failing since 6 days (last pass: renesas-next-2021-05-11-v5.13-rc1,=
 first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-05-31 12:22:06.320000+00:00  <8>[   55.782266] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60b=
4d4f21f8d4ab852b3b006
        failing since 6 days (last pass: renesas-next-2021-05-11-v5.13-rc1,=
 first fail: renesas-next-2021-05-25-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4d3af0562268b43b3afbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4d3af0562268b43b3a=
fbc
        failing since 189 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4d3a5d58475ab56b3af9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4d3a5d58475ab56b3a=
f9c
        failing since 189 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4d3b00f8fa96f2db3afbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4d3b00f8fa96f2db3a=
fbc
        failing since 189 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4d39ba85f86e2f8b3afb3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4d39ba85f86e2f8b3a=
fb4
        failing since 189 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
