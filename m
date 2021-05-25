Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11793390473
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 17:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhEYPCl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 11:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbhEYPCj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 11:02:39 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63D8C061756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 08:01:08 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d16so23801283pfn.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d7kd53pq06pByoQIqAIjshJLk3t9TMBclTBGk1zlTcg=;
        b=fYyaRiQLv74zNhWoNwnaYq4Wi60t8e+KdAw9+JXxNz+FfD2FjaDmvHez03HZk0YUTp
         kwh7qpAoDnzKUhN4GaP1JZhzgieVF2dCMdexaKot+cMDricKtqX5rjodeoZSn2hV3no7
         /wu0AYAO4vddxx2v/fT9WIjyNbw4e9PqDHUQVqz8vE5FdWZIaBdSHQZ6w1WZW6kPHtLJ
         syPXyR5xDlLFm28jADWRRjhI0S4W0bVDXCjl1Cb98pE9XytcqosLnuORi/63wM5zRxmm
         N2SyYh5UCbhy6KkhGDbuAYX6HYGbkC2ZyxGhU7O6MMA+RVaPsQRk0XKzSw93XmhOK0QP
         1ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d7kd53pq06pByoQIqAIjshJLk3t9TMBclTBGk1zlTcg=;
        b=sLtNRW6wKiGAqI884wHwQwk2Wxy7dzmG2uKlhE9r5vNFjD+tQoRjy/EXA7/qE6bw3W
         +TsxjFxlgO4F28zt8TSbNoEeKCOEXNx+xH5mmESqcEGv5y2wTKUbgtJ4SL4pMVfPRh9N
         CkiDhN7yOItsSYyiq/QlETgCylIyW9eg80ETT2xJ0EniLMNsMpb/dOx8sLJdnbcLih/b
         YZGRw92lVCI6dMuQ3yvyemviThzt6DOszqqQeP5XtQb/buGlYNQuknvrdofiNXd/4bsZ
         DYSjJ1J6bVUnUmXBTGPFJdIJVUubr2YGDnZTgHod+30dUTxYkUne+/FiN9R7VW7IpKMW
         bnCg==
X-Gm-Message-State: AOAM5303sbqHyanLlpw8DbOdKJtRXAFsVp77CVTw1RP+BlFphhcWWg+3
        eE+mSVPUNBO3thD2Gv8c6vYAVFRcHke/xvF6
X-Google-Smtp-Source: ABdhPJx4pjUmRQlQXCXSE4tnRRLsB1p2OLsy6NOwzPq//+qUBGUvSjGMc6XOlSlTysk+pHAoGj4GfA==
X-Received: by 2002:a63:7e13:: with SMTP id z19mr19315749pgc.184.1621954867864;
        Tue, 25 May 2021 08:01:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v3sm6267514pfb.203.2021.05.25.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:01:07 -0700 (PDT)
Message-ID: <60ad1133.1c69fb81.5d637.2fb7@mx.google.com>
Date:   Tue, 25 May 2021 08:01:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-25-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 211 runs,
 12 regressions (renesas-next-2021-05-25-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 211 runs, 12 regressions (renesas-next-2021-05-25-v5=
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

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

rk3288-veyron-jaq    | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-25-v5.13-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-25-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1931e709c701ea2913e8714f9658bea8cd5e361f =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60acfc51d410867de1b3afe0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acfc51d410867de1b3a=
fe1
        failing since 84 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60acdd250fbec0c4adb3b0a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acdd250fbec0c4adb3b=
0a6
        failing since 139 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60acde755e2f46cb3fb3afb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acde755e2f46cb3fb3a=
fb6
        new failure (last pass: renesas-next-2021-05-17-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60acdc0e29d228ef00b3afd9

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60acdc0e29d228ef00b3afed
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)

    2021-05-25 11:14:16.444000+00:00  <8>[   55.799121] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60a=
cdc0e29d228ef00b3aff3
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)

    2021-05-25 11:14:17.548000+00:00  /lava-3869365/1/../bin/lava-test-case
    2021-05-25 11:14:17.555000+00:00  <8>[   56.910731] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60acdce319fb33e57cb3b00a

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60acdce319fb33e57cb3b01e
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)

    2021-05-25 11:17:51.493000+00:00  <8>[   55.812114] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60a=
cdce319fb33e57cb3b024
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ace37bd1e32ce39cb3afd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ace37bd1e32ce39cb3a=
fd9
        failing since 182 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60acdb5f4f9fe48136b3af9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acdb5f4f9fe48136b3a=
f9c
        failing since 182 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ace8a7998483d748b3afb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ace8a7998483d748b3a=
fb8
        failing since 182 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60acdffbca9d305270b3afd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acdffbca9d305270b3a=
fda
        new failure (last pass: renesas-next-2021-05-17-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3288-veyron-jaq    | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ad0637fb34f33540b3afa9

  Results:     68 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
60ad0637fb34f33540b3afb2
        new failure (last pass: renesas-next-2021-05-11-v5.13-rc1)

    2021-05-25 14:14:08.982000+00:00  <4>[   11.956801] sbs-battery 20-000b=
: Unknown chemistry: POLY
    2021-05-25 14:14:09.452000+00:00  /lava-3869323/1/../bin/lava-test-case
    2021-05-25 14:14:09.462000+00:00  <8>[   12.435416] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =20
