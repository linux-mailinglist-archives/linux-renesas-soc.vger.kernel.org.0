Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3B83C7B17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 03:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237286AbhGNBfU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 21:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237249AbhGNBfT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 21:35:19 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB90C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 18:32:27 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id o201so494320pfd.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 18:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uBoUD7dhH5oXqnSXxk/I5+lxYMiTdA5QB/kUyeVYYYU=;
        b=BlCYfBr1Yw+CLUWArNnnmlFVKJ56RvEFUGJe0DH6vzssoK5bAjUEwFBhFCldzDfzK4
         dIFsTWbugTp2avkxN/tXIAwuRsMfDtvpgUbBHX2QyihZGwXCnxhxJAcYSyEc38U8j99J
         0PCBmefqRkrK9J/5dsY95eM2YegJNJGeZOBZDNrimuPeLlXqhZloxuNx7WvvDh/gxw1M
         yXRPgJamfEDbCS+UWFy2SFnaXO1NxBVvOHz2B/qWNnHO9jAzU+SnPIoMzLFAGJn1cDU9
         nI1NYgQtYFuToBPnY+1hYFrL2MMm1n15S0l7H2dxJEzr1+l+7EN3+tuVMzimNcnFiam/
         /oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uBoUD7dhH5oXqnSXxk/I5+lxYMiTdA5QB/kUyeVYYYU=;
        b=F+gH98u2h75Y+A5UJd5BfUYQ0i4sLZMWegSxcHp1Ryeg9P24MoOzkuY2PJ7JHeDwEl
         c7fKl/xgP17VIaeY/u1MhcPu3EepvaRShq76lUo2xYEWLtZ/x0+hpLyAthZHDZb9znd2
         K6J5V7bz+Vm8pYGF8QBAt0HHajFpLAf9cMAYaDzeSxeiFrDmnmQ7Ge2ZcEjh/OXdds0y
         Si+omH4U4+r1k73y0iwHGIbTTVuKVvCa1MfJFS5PUKZnwnVJ0CefOmBta2NzJC86o6sj
         +oErkttbJCmFFD5WirlzUnwz3zgle83MUJtkiLJIK+IC7SkPzzOplcSWCDx4nnSIF3lJ
         07GA==
X-Gm-Message-State: AOAM533Hkbhyhfj6t0mEz86c2w8gDxS/KQDBNoHSIg2O/m82yb8OGvTl
        FmlZ8qK+yaHa/6KpSTiNwjoyPIB5yDC0elLP
X-Google-Smtp-Source: ABdhPJw28vQNiF4LNnAWanxjbjHcUN+srxXN31IdbIgmhqChKoMhX7/s975xNzJXUz/1NRpErgUspg==
X-Received: by 2002:a62:7c16:0:b029:329:8d4c:d12d with SMTP id x22-20020a627c160000b02903298d4cd12dmr7453956pfc.47.1626226346990;
        Tue, 13 Jul 2021 18:32:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v13sm3965218pja.44.2021.07.13.18.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 18:32:26 -0700 (PDT)
Message-ID: <60ee3eaa.1c69fb81.88cd1.e070@mx.google.com>
Date:   Tue, 13 Jul 2021 18:32:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-13-v5.14-rc1
Subject: renesas/master baseline: 329 runs,
 28 regressions (renesas-devel-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 329 runs, 28 regressions (renesas-devel-2021-07-13=
-v5.14-rc1)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 1          =

beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 1          =

beagle-xm             | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 1          =

beaglebone-black      | arm   | lab-cip       | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 1          =

beaglebone-black      | arm   | lab-cip       | gcc-8    | omap2plus_defcon=
fig          | 1          =

beaglebone-black      | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 1          =

hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 1          =

hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =

mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-13-v5.14-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81b7948a0be3dc48ef04d01b16c08dc3b460bce2 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee062d84c74314ab8a93a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee062d84c74314ab8a9=
3a1
        failing since 153 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee091db1551750ef8a93a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee091db1551750ef8a9=
3a9
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0a712c6e1721658a93d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0a712c6e1721658a9=
3d6
        failing since 1 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee03cc73e3d15b598a939e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee03cc73e3d15b598a9=
39f
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee06162e4ab78df68a93c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee06162e4ab78df68a9=
3c2
        failing since 0 day (last pass: renesas-devel-2020-12-07-v5.10-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee094b9f83f4915b8a93ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee094b9f83f4915b8a9=
3ad
        failing since 1 day (last pass: renesas-devel-2020-12-07-v5.10-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee07f6db4073ee7a8a93d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee07f6db4073ee7a8a9=
3d2
        failing since 0 day (last pass: renesas-devel-2020-12-07-v5.10-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beaglebone-black      | arm   | lab-cip       | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee061dc31b0427c98a93c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/bas=
eline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/bas=
eline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee061dc31b0427c98a9=
3c3
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beaglebone-black      | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee062e84c74314ab8a93a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee062e84c74314ab8a9=
3a4
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beaglebone-black      | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee09f026e625be3e8a93b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee09f026e625be3e8a9=
3b6
        failing since 0 day (last pass: renesas-devel-2021-06-14-v5.13-rc6,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beaglebone-black      | arm   | lab-cip       | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee06fa6f99dfb0138a93a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee06fa6f99dfb0138a9=
3aa
        failing since 0 day (last pass: renesas-devel-2021-06-22-v5.13-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beaglebone-black      | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee096a9acccdcb9b8a93b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee096a9acccdcb9b8a9=
3b1
        failing since 0 day (last pass: renesas-devel-2021-06-22-v5.13-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0af309f6ecba178a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0af309f6ecba178a9=
39c
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee12919fb516d5978a93f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee12919fb516d5978a9=
3f7
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee062a0bc58bdbad8a93f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee062a0bc58bdbad8a9=
3f4
        failing since 253 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0ac1083915926d8a93af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kon=
tron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kon=
tron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0ac1083915926d8a9=
3b0
        failing since 1 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee08e984d6b95ef78a93cb

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60e=
e08e984d6b95ef78a93d2
        failing since 64 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-13T21:42:58.494032  /lava-4192508/1/../bin/lava-test-case
    2021-07-13T21:42:58.502271  <8>[   56.923959] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60ee08e984d6b95ef78a93d8
        failing since 64 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-13T21:42:57.379773  /lava-4192508/1/../bin/lava-test-case
    2021-07-13T21:42:57.388434  <8>[   55.810768] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee094d9f83f4915b8a93b9

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60e=
e094d9f83f4915b8a93c0
        failing since 64 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-13T21:44:33.791553  /lava-4192519/1/../bin/lava-test-case   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60ee094d9f83f4915b8a93c6
        failing since 64 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-13T21:44:32.679920  /lava-4192519/1/../bin/lava-test-case
    2021-07-13T21:44:32.688180  <8>[   55.819179] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee04bbd76a5a469d8a93a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee04bbd76a5a469d8a9=
3a3
        failing since 237 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee084fc78538ca668a93ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee084fc78538ca668a9=
3ad
        failing since 237 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee04c92f5329ed758a93a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee04c92f5329ed758a9=
3a9
        failing since 237 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee04877066c629568a93aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee04877066c629568a9=
3ab
        failing since 237 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee0dddb748cff2218a93c5

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ee0dddb748cff2218a93cf
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T22:04:02.546218  /lava-4192483/1/../bin/lava-test-case
    2021-07-13T22:04:02.557735  <8>[   25.026839] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ee0dddb748cff2218a93d0
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T22:04:01.511624  /lava-4192483/1/../bin/lava-test-case
    2021-07-13T22:04:01.523634  <8>[   23.991930] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee109035f6299a628a939d

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ee109035f6299a628a93a7
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c)

    2021-07-13T22:15:32.045430  <8>[   23.989626] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-13T22:15:33.068969  /lava-4192515/1/../bin/lava-test-case
    2021-07-13T22:15:33.080802  <8>[   25.025037] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ee109035f6299a628a93a8
        failing since 0 day (last pass: renesas-devel-2021-06-28-v5.13, fir=
st fail: v5.14-rc1-477-g3c037963715c)

    2021-07-13T22:15:31.012971  <8>[   22.955849] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-13T22:15:32.033262  /lava-4192515/1/../bin/lava-test-case   =

 =20
