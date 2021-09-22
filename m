Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDC6414095
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 06:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhIVEbN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 00:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhIVEbN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 00:31:13 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFC1C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 21:29:43 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c4so913812pls.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 21:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Fashvm5fQQCmh4W8MQmR9rteh7RHzSw4p8ZMZRI89Js=;
        b=If252ZS2d3uEusrGhG4FUi/a6OJAASO7eVIVFPe7+Z0PmFMdJvxFk1SXNSWtT+D/zq
         L3xyXSE/mDf/CcHDOneObB4mZg3cg9Bt7UemKa40qWS4TViY3FWh4A720nXL1XVFXFmm
         4xpTpgIJZxFif9UBv3hWYuKBN8EsMrZTDqtblssocCTNjcsqQtzb78/5+ry7mHEd7Nt4
         vEjv2biemMrKMQ58JLnohMqMbqOiHTpk75jO1Th2aBnIfiXO3H4ABdO//5jClEAbM3DM
         NtGfQAUtpMLt3TWIM7Ujt45ekShPrSG7Epbz83bK+AxdQjKaV8SFvTMylBoSE46zXXIU
         9DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Fashvm5fQQCmh4W8MQmR9rteh7RHzSw4p8ZMZRI89Js=;
        b=zKQ+PA7bhLHxUGJS7EogBPjGW6VkZvyiI5xGEXMGAOObtQK126JOMFlqdnGCJbgHDK
         5frCGITkP6DH/YEyv6EjCGyr4o6V4v1qRq9eWGECdXPlBjKDMVvGi87NCthEFBTGYXHv
         O1gzZeHi23fpT+v/z50luk8ScCTlzgiyRT25hy7m5c0kRyhfpsRitGLgBdiqdvTHKKiQ
         L4rg6vDjDTQ5RDIikQiiWJ6++YNhpD9WeStUTmiNyNxx861MR4qzPZ7tHL7EF0yhYaen
         RKFuGvzIQK/tY4YVjP8lQD4oFNhvX8LwyBy0DhLFsKNYQn+hF0l7sIV+gnjmYCP3Z4nw
         9nOg==
X-Gm-Message-State: AOAM533QhZeFpx08A7ReZuNAmmEsYZbDzYRLwV/v9gSZH28CY8LuomD+
        Ip59jf7zr66bZTHo9/ym/H5MF/Uga5A9DAf/
X-Google-Smtp-Source: ABdhPJw9zn1hKr5hwHOm10lrcXtB0YdTyeltXWHX+8HyELG8gQlG21u9C8GIQSjKQlbpZTy4iT1XOA==
X-Received: by 2002:a17:90a:191c:: with SMTP id 28mr8980913pjg.121.1632284982957;
        Tue, 21 Sep 2021 21:29:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v7sm590387pjk.37.2021.09.21.21.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 21:29:42 -0700 (PDT)
Message-ID: <614ab136.1c69fb81.23d61.2a2e@mx.google.com>
Date:   Tue, 21 Sep 2021 21:29:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-20-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 329 runs,
 20 regressions (renesas-next-2021-09-20-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 329 runs, 20 regressions (renesas-next-2021-09-20-v5=
.15-rc1)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g           | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+crypto =
            | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-20-v5.15-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-20-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      41c50f42a51cc8630c6a28e9b26f92d920e91780 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614a7baa1cb5fc4f1699a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a7baa1cb5fc4f1699a=
2e8
        failing since 203 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/614a7844086e6436bd99a2e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a7844086e6436bd99a=
2e2
        failing since 56 days (last pass: renesas-next-2021-07-26-v5.14-rc1=
, first fail: renesas-next-2021-07-27-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a78a853f1c9cf2199a313

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a78a853f1c9cf2199a=
314
        failing since 57 days (last pass: renesas-next-2021-07-19-v5.14-rc1=
, first fail: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614a7a740ea60cd0c199a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a7a740ea60cd0c199a=
2db
        failing since 57 days (last pass: renesas-next-2021-07-19-v5.14-rc1=
, first fail: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a75ff4ae3f7125999a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a75ff4ae3f7125999a=
2f7
        failing since 64 days (last pass: renesas-next-2021-07-13-v5.14-rc1=
, first fail: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/614a93c940265d8a7d99a355

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a93c940265d8a7d99a=
356
        failing since 75 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a96913db550361599a31f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a96913db550361599a=
320
        failing since 75 days (last pass: renesas-next-2021-05-31-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a7566de318f214999a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a7566de318f214999a=
2db
        failing since 259 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/614a84e3115e1532d099a318

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a84e3115e1532d099a=
319
        failing since 40 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/614a75d9524183a4b199a2dc

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/614=
a75d9524183a4b199a2df
        failing since 119 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-22T00:15:57.656450  /lava-4555959/1/../bin/lava-test-case
    2021-09-22T00:15:57.664877  <8>[   27.526433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/614a75d9524183a4b199a2e5
        failing since 119 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-22T00:15:56.544978  /lava-4555959/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/614a77451e136843e099a2f9

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/614=
a77451e136843e099a2fc
        failing since 119 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-22T00:22:23.089826  <8>[   26.489799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-09-22T00:22:24.100508  /lava-4556026/1/../bin/lava-test-case
    2021-09-22T00:22:24.109101  <8>[   27.510268] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/614a77451e136843e099a302
        failing since 119 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-22T00:22:21.978306  <8>[   25.378171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-driver-present RESULT=3Dpass>
    2021-09-22T00:22:22.989941  /lava-4556026/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a78e5b548024e1499a30b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a78e5b548024e1499a=
30c
        failing since 302 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a7377be58f85c8d99a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a7377be58f85c8d99a=
2e1
        failing since 302 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a7352f09efb692699a320

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a7352f09efb692699a=
321
        failing since 302 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/614a78e1cb49a1d93499a2fb

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/614a78e1cb49a1d93499a301
        failing since 70 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-22T00:29:13.187282  /lava-4555958/1/../bin/lava-test-case
    2021-09-22T00:29:13.197595  <8>[   25.310241] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/614a78e1cb49a1d93499a302
        failing since 70 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-22T00:29:12.150072  /lava-4555958/1/../bin/lava-test-case
    2021-09-22T00:29:12.161713  <8>[   24.274795] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/614a79624f54a7a83599a303

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/614a79624f54a7a83599a309
        failing since 70 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-22T00:31:16.418201  /lava-4556027/1/../bin/lava-test-case
    2021-09-22T00:31:16.429619  <8>[   25.260871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/614a79624f54a7a83599a30a
        failing since 70 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-22T00:31:15.384411  /lava-4556027/1/../bin/lava-test-case
    2021-09-22T00:31:15.395335  <8>[   24.226793] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
