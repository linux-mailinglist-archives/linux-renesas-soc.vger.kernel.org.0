Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A1D3A39C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 04:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhFKCcl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 22:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhFKCcl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 22:32:41 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669F0C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 19:30:30 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so4930735pjp.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 19:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8ayeWsBoCmuJ7WyE/zHXCyVXpx8eO83GlLFWZAlDSLk=;
        b=Ltg0aTYH4sdh0RVDrjatW16/9hP/Ld1ppDOq2F6udjNASF5JPtD1BChzxm6syY5vNv
         2GYG9VND2erx5nubErpwAkglrT2RQ41w0e/TOFNnrtk9PJ4Rm3AEH00wSL2CyCKMwZVq
         HOhUq2RbwxfR3uEkpTt/yoeRNA7i8rnkP3aWk4fPFlOOqpT5C9DYPLAgBkj2tGY63NPm
         T9GeFp6mzuW2Kb0Op/sPY7knX/vj/8+cT4M1Q98euNyoNXzer9exfvEjAJEYD1kB8rxY
         tDN3MB9mOOwcehFh3zW4uDMeCXmjdj99sAl4Sb0g/BZYg8xrB4TSlDT3cP69f99pCqDz
         x/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8ayeWsBoCmuJ7WyE/zHXCyVXpx8eO83GlLFWZAlDSLk=;
        b=s/HmMi6yOPLzHxP7Kj3XQpw4iu0DD0yGTKEbwDc4kTQ6+7ymYFwV/aGYTYpVjIEYtc
         fv8N06VFTxNMtrwccbQZXrcLYv3Cgtb6ZvQ2S4C1xn0PrN9pNYiiPnDh9H/sdc7z4Sf6
         cwexcuIqWxWeo7WG2I3OisJbQWJExDgUJWA2Lbert3teUBPqe94VD9/+N4HELQ2q7vXW
         KSG69EYK9Lf6YNSJgiNR2t7n8T1Td3GHApvcabNpULnbSeuFpYrtSbYqHVYAYrRTdApW
         IE29TpwVxyfPvp1NHsQCQmo+vYy4+INY0nY9Yz6rxGxYBkZ5qohF/Fqc6b5lXP3TySNS
         yrDA==
X-Gm-Message-State: AOAM532EW93kULjcrSi1cTzMjrGqaPeJN8h7xHHlDwGpqYoQhY568lUM
        BlG2sYQ/zTLnrnBlOnzX5eAtObgbI4R1uB7f
X-Google-Smtp-Source: ABdhPJxkRm6DYTKrR7C4QYxMVYbvr5JnOQXCH27xv4inW1R4DRLR1nPRotBeAHI0VJt3CCJuhVyyVA==
X-Received: by 2002:a17:902:e751:b029:106:65ba:5c80 with SMTP id p17-20020a170902e751b029010665ba5c80mr1742120plf.36.1623378628702;
        Thu, 10 Jun 2021 19:30:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f15sm3802906pgg.23.2021.06.10.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:30:28 -0700 (PDT)
Message-ID: <60c2cac4.1c69fb81.209f9.d33f@mx.google.com>
Date:   Thu, 10 Jun 2021 19:30:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-10-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 304 runs,
 16 regressions (renesas-devel-2021-06-10-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 304 runs, 16 regressions (renesas-devel-2021-06-10=
-v5.13-rc5)

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

meson-g12b-odroid-n2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

meson-gxm-q200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-10-v5.13-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-10-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f432b447a92822b48f7e674cec725b179c1fbde =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60c29ea7ffb8bde6de0c0e29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c29ea7ffb8bde6de0c0=
e2a
        failing since 120 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c29139799d9b13d40c0e12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2913a799d9b13d40c0=
e13
        failing since 220 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60c29573040e9c3dd80c0e0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c29573040e9c3dd80c0=
e0c
        new failure (last pass: renesas-devel-2021-06-07-v5.13-rc5) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2945f8c0c34d4580c0e1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2945f8c0c34d4580c0=
e1c
        new failure (last pass: renesas-devel-2021-06-07-v5.13-rc5) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60c296d9f7ab1f81bd0c0e1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c296d9f7ab1f81bd0c0=
e20
        new failure (last pass: renesas-devel-2021-05-27-v5.13-rc3) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60c297016dda962ca40c0e06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c297016dda962ca40c0=
e07
        new failure (last pass: renesas-devel-2021-05-27-v5.13-rc3) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxm-q200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2995163b51775c30c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2995163b51775c30c0=
df6
        new failure (last pass: renesas-devel-2021-05-27-v5.13-rc3) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60c2938f1b16559cb00c0dfd

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60c2938f1b16559cb00c0e15
        failing since 31 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-10 22:34:51.032000+00:00  <8>[   55.795391] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60c=
2938f1b16559cb00c0e1b
        failing since 31 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-10 22:34:52.145000+00:00  <8>[   56.907981] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60c2956777b5aaae6b0c0df6

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60c2956777b5aaae6b0c0e0e
        failing since 31 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-10 22:42:43.121000+00:00  <8>[   55.790371] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60c=
2956777b5aaae6b0c0e14
        failing since 31 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-10 22:42:44.232000+00:00  <8>[   56.902118] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c28ea605a2c0da140c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c28ea605a2c0da140c0=
df6
        failing since 204 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c296c86dda962ca40c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c296c86dda962ca40c0=
df6
        failing since 204 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c28ea33dba680f230c0e12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c28ea33dba680f230c0=
e13
        failing since 204 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c28ea335972bfab00c0e1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c28ea335972bfab00c0=
e1b
        failing since 204 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2965306a1a0b95f0c103c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2965306a1a0b95f0c1=
03d
        new failure (last pass: renesas-devel-2021-05-27-v5.13-rc3) =

 =20
