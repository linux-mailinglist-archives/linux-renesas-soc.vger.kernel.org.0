Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913BF3D6D23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 06:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbhG0EJo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 00:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhG0EJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 00:09:38 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECB2C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 21:09:36 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so3154902pjd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 21:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3MBLQ3G4E7JyATlujk1S/cTXn9knOBdESgAzOpDSRbQ=;
        b=WF1u3B68mfYnFOnEF4XWqoEM99ijxABIDoFbiR1LW1aE2ccOaAd2rcc2p5rbWBHJMt
         FBHxy8qxENDt0m8hyvSM4kuWzG5bADHsTRpPGe1x+3iU+98Gx8m//6jQ/bedPYFTS6Yd
         E+eDKC6pLNa3I6FK9ICpf6mLpZZ2N4gFlcdMpgMo29RKDTv6IOBJ6MwQLnCCIlMmQKXG
         ZlreKOZznbP1Jeihg9GZr1nWjQnbuEiJszwdrGGxlR9fknUPU/DLZZxdk17euE5NBrpZ
         ft44RmzBTlq9z2lbztWi44kX01vEmcfzet72Dy9XT+OGLgpiabHUk0XpznnADOwq8Unv
         mzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3MBLQ3G4E7JyATlujk1S/cTXn9knOBdESgAzOpDSRbQ=;
        b=TsM+kVgKwF/rWisd+IP9OEN6flrzUi2FqYEXKbyyYeQPL7ykdh4voNgIcauIibLx05
         B4bOnO211EDJjxYmXkynCJPNkWlxFgJzP4V0skmIlyWyUJimbNFkSG+d3i4u8I5n5Uhr
         YjxsL3+V+xZNAx/DNbMXvVBhTCEGaCLDfysr1wMEQWCcwltYnYSqYGF/w6gFZGrbxxb4
         BaD4iKUmOTvl1tr5YJWS/mhrEKFnXrsMA06rtLQhGoyxHjxq8rrwDttqxIoMHNao0963
         Hm49vrISeYgS5/7B3I8mU0OcLOG7i9qidx0s54GRUI9MMMi9q/UgtqnN5ORFZaC3GGAq
         i7RA==
X-Gm-Message-State: AOAM533YvN9XQgBQVmXl6FEbfrfupglCapUruNMCjEFEwHV9TzpLOMG+
        uxV2ON3ZPnvyNArgx5GA6RgcGpWCjDqEeNMO
X-Google-Smtp-Source: ABdhPJzc54Ndvlu982GZZEk+tWaaL7m9gskbg/nilIx2dWgHikhj9isSuJ/mjxIhO+MzZhHS5zYq0w==
X-Received: by 2002:aa7:9a08:0:b029:331:ea96:691d with SMTP id w8-20020aa79a080000b0290331ea96691dmr21082149pfj.75.1627358976166;
        Mon, 26 Jul 2021 21:09:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e30sm1528021pga.63.2021.07.26.21.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 21:09:35 -0700 (PDT)
Message-ID: <60ff86ff.1c69fb81.dfe6f.6a7c@mx.google.com>
Date:   Mon, 26 Jul 2021 21:09:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-26-v5.14-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 392 runs,
 23 regressions (renesas-next-2021-07-26-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 392 runs, 23 regressions (renesas-next-2021-07-26-v5=
.14-rc1)

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

beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 1          =

beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 1          =

hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 1          =

hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig       =
             | 1          =

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-26-v5.14-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-26-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cecb7cc88302b2e508c6cc1ce7663bba08c96a65 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff501cd399b075f63a2f2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff501cd399b075f63a2=
f30
        failing since 146 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4e82002ab6ed633a2f53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff4e82002ab6ed633a2=
f54
        failing since 14 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff50b2d1eba72c5c3a2f35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff50b2d1eba72c5c3a2=
f36
        failing since 14 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4e9b527ba4c0703a2f49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff4e9b527ba4c0703a2=
f4a
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff50a39cf16b98ba3a2f2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff50a39cf16b98ba3a2=
f2f
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4eea683ce0941b3a2f32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff4eea683ce0941b3a2=
f33
        failing since 7 days (last pass: renesas-next-2021-07-13-v5.14-rc1,=
 first fail: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff5c75c5ad1fe08c3a2f9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff5c75c5ad1fe08c3a2=
f9f
        failing since 18 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff623a5d72e299743a2f3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff623a5d72e299743a2=
f3b
        failing since 18 days (last pass: renesas-next-2021-05-31-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4b06c239a28d7a3a2f28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff4b06c239a28d7a3a2=
f29
        failing since 202 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4f7ffc5f89ea3f3a2f3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff4f7ffc5f89ea3f3a2=
f3b
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff5109871d0830e83a2f23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff5109871d0830e83a2=
f24
        failing since 14 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/60ff4db89e3fbd511b3a2f8b

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60f=
f4db89e3fbd511b3a2f8e
        failing since 62 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-27T00:04:54.488820  <8>[   55.902626] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-07-27T00:04:55.499775  /lava-4251393/1/../bin/lava-test-case   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60ff4db89e3fbd511b3a2f94
        failing since 62 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-27T00:04:54.387925  /lava-4251393/1/../bin/lava-test-case
    2021-07-27T00:04:54.395544  <8>[   55.810820] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ff4ff238905b8f2c3a2f5b

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60f=
f4ff238905b8f2c3a2f5e
        failing since 62 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-27T00:14:30.199225  /lava-4251498/1/../bin/lava-test-case
    2021-07-27T00:14:30.206426  <8>[   57.272647] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60ff4ff238905b8f2c3a2f64
        failing since 62 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-27T00:14:29.086353  /lava-4251498/1/../bin/lava-test-case
    2021-07-27T00:14:29.095664  <8>[   56.161140] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff478c671c56d1773a2fba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff478c671c56d1773a2=
fbb
        failing since 245 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff5e89cd2bea31eb3a2f22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff5e89cd2bea31eb3a2=
f23
        failing since 245 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff475d671c56d1773a2f24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff475d671c56d1773a2=
f25
        failing since 245 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4710880c44e18e3a2f39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ff4710880c44e18e3a2=
f3a
        failing since 245 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/60ff4f2b8f625353323a2f2b

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ff4f2c8f625353323a2f31
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:11:00.597387  /lava-4251380/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ff4f2c8f625353323a2f32
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:10:58.542154  <8>[   50.316611] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-27T00:10:59.564522  /lava-4251380/1/../bin/lava-test-case
    2021-07-27T00:10:59.575300  <8>[   51.351890] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ff533c71fbbc9c673a2f23

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ff533c71fbbc9c673a2f29
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:28:34.278398  <8>[   51.346441] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-27T00:28:35.299633  /lava-4251507/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ff533c71fbbc9c673a2f2a
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:28:34.266831  /lava-4251507/1/../bin/lava-test-case   =

 =20
