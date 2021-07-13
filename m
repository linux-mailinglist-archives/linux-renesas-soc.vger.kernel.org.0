Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3803C681E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 03:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhGMBhX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 21:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhGMBhX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 21:37:23 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CB9C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 18:34:33 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id b12so18061112pfv.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZrHfTxp2IMOiGD9fzfcqITmHEMvYHbN14RJo9toawJ4=;
        b=F3WsgQ9iP8AmTPUEIzIUuC8KxhpRJ7Y1ZrVbqDA5zpnYma6ZYdSy3Ag9G++w0tPQQ4
         3b2ThMx5VrO4I+IXgEEOuDbnv7gskh5QzWFVIY3ZR9B0NVgQPHEX/6XWX6zi32vhoEbI
         IMf/1qPK6r1qcFqVKSldnsbFNKhIXKMhawWe4K0U1FO6RnOZllfvf3LOhUztdTw/h1YD
         4HjOCXzF2wtUm9FlxfgXUuEr4n6SDHHynUTlFCybuPwvJDs0rHq3VeBMCq3UgTysrBiw
         x1VPjDrRXxByLCFCNDh/XwNE47hVFyvmNV/JWmnaeZTmoGg/kQJXVCnfzEi55kQecTnq
         Obqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZrHfTxp2IMOiGD9fzfcqITmHEMvYHbN14RJo9toawJ4=;
        b=jLSfTsFgJUYwVz2QEzZkPJhvJFZXEASvNLyWQ/EdJi4KUfSpNkBmd4laHvMQHsuBBp
         lYZficwECKpcbz/gM6b2hsF8zh7fOvJ3gZ2w83BLPfYdPOXgZc+fIo8Bn0NlUvg6FXcY
         QyC45YkwIYl9BGgTEbvHRD/r+j732OubTlj3VOHC5j11c9pf/LaAGiJ0mk+8Tml9g/dh
         Lhx6w5UTmpbA4gFz0QpHF3a2UV3kBglOrsVYDF7DiAedbnl9OjSNcTmnMnWG64h4n/cy
         d7rCg6n2hp5AdvkYYX+Ss4hazBJMOX68c/xOuytJwBturVikDppIfjtNn3T59Zmy/T7t
         UCsA==
X-Gm-Message-State: AOAM530L5isk3xsdGgcs+212CIS5cHPZ0AAZfS3+lcKDPX/HeENFmxYv
        aF4AJ6YwO3HIsUR9kdw0G6jYDsKg18H3tM5I
X-Google-Smtp-Source: ABdhPJwtwc91Uzqfb9849++0535UNsZgNda4KdMyjnLSB3Db5fKz/NcgUsyBbeFQwwSI0atLptZNrg==
X-Received: by 2002:a65:6091:: with SMTP id t17mr1914618pgu.388.1626140072588;
        Mon, 12 Jul 2021 18:34:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d25sm20281377pgn.42.2021.07.12.18.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 18:34:32 -0700 (PDT)
Message-ID: <60eceda8.1c69fb81.1152a.d2a7@mx.google.com>
Date:   Mon, 12 Jul 2021 18:34:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-477-g3c037963715c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 48 runs,
 11 regressions (v5.14-rc1-477-g3c037963715c)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 48 runs, 11 regressions (v5.14-rc1-477-g3c0379=
63715c)

Regressions Summary
-------------------

platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
beaglebone-black    | arm   | lab-cip         | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

beaglebone-black    | arm   | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

beaglebone-black    | arm   | lab-cip         | gcc-8    | omap2plus_defcon=
fig          | 1          =

beaglebone-black    | arm   | lab-collabora   | gcc-8    | omap2plus_defcon=
fig          | 1          =

dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig           | 1          =

hip07-d05           | arm64 | lab-collabora   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

odroid-xu3          | arm   | lab-collabora   | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

rk3288-veyron-jaq   | arm   | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
4-rc1-477-g3c037963715c/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: v5.14-rc1-477-g3c037963715c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3c037963715cb04671b4fed157cb11268b526adf =



Test Regressions
---------------- =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
beaglebone-black    | arm   | lab-cip         | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecb8cf5ce3345bf011796d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecb8cf5ce3345bf=
011796e
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
beaglebone-black    | arm   | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecbf146e37fb248a117976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecbf146e37fb248=
a117977
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
beaglebone-black    | arm   | lab-cip         | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecb893a7c3c4df4a117aa1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecb893a7c3c4df4=
a117aa2
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
beaglebone-black    | arm   | lab-collabora   | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecbe874176e32ce9117996

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nfs-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nfs-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecbe874176e32ce=
9117997
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecb651c0135b6bf211796e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove=
-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove=
-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecb651c0135b6bf=
211796f
        failing since 76 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
hip07-d05           | arm64 | lab-collabora   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ece70ee0125f77a61179a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ece70ee0125f77a=
61179a9
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
odroid-xu3          | arm   | lab-collabora   | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd07e7b51d4042911796c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecd07e7b51d4042=
911796d
        failing since 20 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-06-22-v5.13-rc7) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecca66b0b8d1e084117984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecca66b0b8d1e08=
4117985
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
rk3288-veyron-jaq   | arm   | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecdf16b900b5f06111796b

  Results:     68 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case=
/id/60ecdf16b900b5f0611179aa
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6)

    2021-07-13T00:31:57.991856  /lava-4186702/1/../bin/lava-test-case
    2021-07-13T00:31:58.020024  <8>[   24.192505] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin    | arm64 | lab-collabora   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ecd3fdca43a1a1bb1179bd

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ecd3fdca43a1a1bb1179c7
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-12T23:44:41.345043  <8>[   44.113983] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-12T23:44:42.392745  /lava-4186579/1/../bin/lava-test-case
    2021-07-12T23:44:42.434349  <8>[   45.205704] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ecd3fdca43a1a1bb1179c8
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-12T23:44:40.256556  <8>[   43.025595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-12T23:44:41.303124  /lava-4186579/1/../bin/lava-test-case   =

 =20
