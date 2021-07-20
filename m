Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F133CF119
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 03:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236665AbhGTA0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 20:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242715AbhGTAWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 20:22:12 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9532AC061768
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 18:02:50 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id p36so18185904pfw.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 18:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4hWhQEDtE6kbq3dFp/qbbeqE2AvJxdIInKP2hx+IZIM=;
        b=lurf1KIdSp7yPWNu5mGL+v/hGIK+2ZwxDuQ52X0dKxVJGFD5Hm+dXR8KtEu4oQncGU
         T7Mq7Hiryc750MIfQR4/g0w0R929MYJG+n/qutlppTp3XJCtbm67R4yZ9P7dmJyvaflv
         h72D5kR/HOKbFaqmqzRy84XobR+sgoT91n/Dhg5rqrFlBOYlHO/2WMuHcQ2EgFFgs6YD
         FFkXL4Tlcfu5jvMme8Awr3PMv0SmZrBZT2LNVyyhRhObM+Gm7IUUtww6SC2/qGDQ5W7g
         B13Hue186o8Lec40ZcMTIXSAI4KRCBbxHPVvbsYyaVHcUhZNeo6GvjDISvUZXhJy2pfV
         F9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4hWhQEDtE6kbq3dFp/qbbeqE2AvJxdIInKP2hx+IZIM=;
        b=Uw1eCPUBROK537XXjrFUKV2A01y9fofvfDpekKtJXDgFpei0EISyaSFsNgh4Io5wk1
         mFVu6D1PDZdUP1zH4uM/2pHyhN5iYwaHPLxbc9YUE7B6gER8P3o1nEeKbvm9KjGRvHio
         BPlbwaDGhZ/Sc5ArPYc6Jgat2n1uGF1/bSiClIyD6jkjB+Gj54rZwQfaWmLjaQ1jxdme
         1UoOso++cvKfncdlbrLRL/AxEw/MYv7GC+PpaQ5TlOkSI2n1xHzpjSrRLNN0L8jUKaQa
         8MhHgoiiQsPLBgP0lYbypnKg13I65v1nO9aFh9T4227s7a7RNsP1V0osaLV/zddLkUex
         0sRA==
X-Gm-Message-State: AOAM532DYzLPGeJ5hLsWWmbr8k2Wpsd5I0JyTEpKGs0G5q62Iy1fa2MQ
        U5zvV7FoNm+IsTAL4d0jsinD2VJLdTrRyPgz
X-Google-Smtp-Source: ABdhPJxEJnBGvbA0rxKmysgpzt5D4SnnJMjV4wViYr9wb1BHkaR0bHpyiYIMl/tj7bEg3EeL4d3ekw==
X-Received: by 2002:a63:7152:: with SMTP id b18mr27920066pgn.224.1626742969907;
        Mon, 19 Jul 2021 18:02:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w16sm23813265pgi.41.2021.07.19.18.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 18:02:49 -0700 (PDT)
Message-ID: <60f620b9.1c69fb81.4f840.8705@mx.google.com>
Date:   Mon, 19 Jul 2021 18:02:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-07-19-v5.14-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 317 runs,
 23 regressions (renesas-devel-2021-07-19-v5.14-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 317 runs, 23 regressions (renesas-devel-2021-07-19=
-v5.14-rc2)

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

beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx6ull-14x14-evk     | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig       =
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig       =
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-8    | defconfig       =
             | 1          =

meson-gxbb-p200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =

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
sas-devel-2021-07-19-v5.14-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-19-v5.14-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2f3bebb9dc31fbb1e815f63cf3f61763f7d1d8f9 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5ff93f2941404aa11609e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5ff93f2941404aa116=
09f
        failing since 159 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e4a139aa7fc58f11609a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e4a139aa7fc58f116=
09b
        failing since 5 days (last pass: renesas-devel-2021-06-22-v5.13-rc7=
, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e9665f2b75adab1160b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e9665f2b75adab116=
0b6
        failing since 6 days (last pass: renesas-devel-2021-06-28-v5.13, fi=
rst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e6e5fcff7820951160c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e6e5fcff782095116=
0c8
        failing since 6 days (last pass: renesas-devel-2020-12-07-v5.10-rc7=
, first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e682e53b397fcd1160b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e682e53b397fcd116=
0b7
        failing since 259 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6ull-14x14-evk     | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5eb6579656a3caa1160c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5eb6579656a3caa116=
0c4
        new failure (last pass: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e58b95ea61799b1160e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e58b95ea61799b116=
0e2
        new failure (last pass: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e531a32e40609c1161b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e531a32e40609c116=
1b5
        new failure (last pass: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e9695f2b75adab1160b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kon=
tron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kon=
tron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e9695f2b75adab116=
0b9
        failing since 6 days (last pass: renesas-devel-2021-06-28-v5.13, fi=
rst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e4b939aa7fc58f1160b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e4b939aa7fc58f116=
0b5
        new failure (last pass: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
meson-gxbb-p200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5eadfdda4e483d5116101

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5eadfdda4e483d5116=
102
        new failure (last pass: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/60f5e4619d081832b41160a7

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60f=
5e4629d081832b41160b4
        failing since 70 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-19T20:45:10.607558  <8>[   55.897568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-07-19T20:45:11.619463  /lava-4213581/1/../bin/lava-test-case
    2021-07-19T20:45:11.627263  <8>[   56.919062] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60f5e4629d081832b41160be
        failing since 70 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-19T20:45:10.507201  /lava-4213581/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60f5e886d60bc646a0116103

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60f=
5e886d60bc646a011610a
        failing since 70 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-19T21:02:54.138059  /lava-4213850/1/../bin/lava-test-case
    2021-07-19T21:02:54.146602  <8>[   56.928572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60f5e886d60bc646a0116110
        failing since 70 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-19T21:02:53.026829  /lava-4213850/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e0d6ba2bc9a4bd1160f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e0d6ba2bc9a4bd116=
0f3
        failing since 243 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e1333125d325781160d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e1333125d32578116=
0d1
        failing since 243 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5e0d59f0b0562ed1160bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5e0d59f0b0562ed116=
0bd
        failing since 243 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5f8bc179017caab1160b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f5f8bc179017caab116=
0b5
        failing since 243 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/60f5ec440b34d7e51811609b

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60f5ec440b34d7e5181160a5
        failing since 5 days (last pass: renesas-devel-2021-06-22-v5.13-rc7=
, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-19T21:18:38.025012  /lava-4213566/1/../bin/lava-test-case
    2021-07-19T21:18:38.036248  <8>[   52.372350] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60f5ec440b34d7e5181160a6
        failing since 5 days (last pass: renesas-devel-2021-06-22-v5.13-rc7=
, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-19T21:18:35.969629  <8>[   50.304073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-19T21:18:36.993559  /lava-4213566/1/../bin/lava-test-case
    2021-07-19T21:18:37.001474  <8>[   51.337433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60f5f3b367bb651e9711609d

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60f5f3b367bb651e971160a7
        failing since 6 days (last pass: renesas-devel-2021-06-28-v5.13, fi=
rst fail: v5.14-rc1-477-g3c037963715c)

    2021-07-19T21:50:30.230150  /lava-4213844/1/../bin/lava-test-case
    2021-07-19T21:50:30.241931  <8>[   24.623758] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60f5f3b367bb651e971160a8
        failing since 6 days (last pass: renesas-devel-2021-06-28-v5.13, fi=
rst fail: v5.14-rc1-477-g3c037963715c)

    2021-07-19T21:50:28.174156  <8>[   22.554890] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-19T21:50:29.195236  /lava-4213844/1/../bin/lava-test-case
    2021-07-19T21:50:29.206387  <8>[   23.589073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
