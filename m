Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA803E8421
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 22:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhHJUJw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 16:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbhHJUJw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 16:09:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7ED3C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 13:09:29 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id a20so22905528plm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wjNYlwxxZcs61r53AiylSTRSWEga2XwNh27knhtmyFc=;
        b=bm3NXiWB75J/skTIGO7d6rnVN5AZqiaxuYzAEN6xWbanYOsigtmJtMIikBfrd/YamU
         Sq9TyVozwha2b3jPQ/c9YGPjyHfhWKevXKBGUqxaqDICxGTeFWUbTr8R26mCk4RQ/cdD
         LtIh+jIWxPMiR6vOv1ai7jgSe4xEeb4kRLho+Umo/CDeu7bsqAeLTVquLASLVowsyRnj
         S62DjbWDYXGFvw5Luk11Xa/oUrGZSxt5kXOrSy6WBGQxgAh4CY2eU8xNF4+3g5KseZ2j
         x6szwQ2KuaIMXY4X8dg+YR7L2meFupEDeC/LeYGeoIvRlMDd6uMMfahxGyT8y57ftV1P
         cU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wjNYlwxxZcs61r53AiylSTRSWEga2XwNh27knhtmyFc=;
        b=iBPrYIC/e88AEdxAxUKL6DlYBkKXOBaro968bvzguWs473iVwkj+hkGXll/Dn4Zq0N
         mHswNbXAeAjUs7DqdrmLYcd0LOHO4/MDImTEIrZPchCx2H/3my1ldAgMPcJDflN9J3eJ
         FlD3+G1UlN9J7jugQg0hGFItQ7dgr3bGz6fEhk2s8Ca73cOhMJDtwO0MP6rCjU/giTZW
         4oQuFsfFaSEbjgzRgZlr/IyTg81jWut+AFKzbzdqwSFMAFcDYLUQ1suYnSbb53xC/Dtr
         VddFo/fBJ2mSlAJqnUjehE+tIflct4/QFmH9KNshJyORxG09G4ujWHQ0dbxayInnk+uA
         KNLQ==
X-Gm-Message-State: AOAM531XwxXzN6Rm/4qhR5KnYoaFd0QcXJ7zJlsc4M9FsTDruOP5FRdk
        aopCQK4jpM7Y9gWsfNtv7Eqy9lrjx7rPGoZg
X-Google-Smtp-Source: ABdhPJzPsxLHHi4thZQPUOugZ7H+NueMddfz7l21UUOXg08u9u+6+S1bTdSN11h6zsXAfJ3ezOkQwg==
X-Received: by 2002:a17:902:6bc5:b029:12c:c275:ae10 with SMTP id m5-20020a1709026bc5b029012cc275ae10mr4510349plt.81.1628626169043;
        Tue, 10 Aug 2021 13:09:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9sm23315936pgq.58.2021.08.10.13.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 13:09:27 -0700 (PDT)
Message-ID: <6112dcf7.1c69fb81.950e8.3c82@mx.google.com>
Date:   Tue, 10 Aug 2021 13:09:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-08-10-v5.14-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 78 runs,
 9 regressions (renesas-devel-2021-08-10-v5.14-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 78 runs, 9 regressions (renesas-devel-2021-08-=
10-v5.14-rc5)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 1          =

hip07-d05                 | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 1          =

odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =

rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 2          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-10-v5.14-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-10-v5.14-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      998b2a51c195410ed92f4f3a5ad117c2b567819f =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6112a2242399069a2eb136e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112a2242399069a2=
eb136e9
        failing since 105 days (last pass: renesas-devel-2021-04-12-v5.12-r=
c7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
hip07-d05                 | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6112a40a4fa106a678b13765

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112a40a4fa106a67=
8b13766
        failing since 27 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6112aa8e343f0acd1eb1367b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112aa8e343f0acd1=
eb1367c
        new failure (last pass: v5.14-rc5-549-g3b20129c119f) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6112a4bb071e945e7bb13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112a4bb071e945e7=
bb13666
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6112a292f22fcda94ab13661

  Results:     68 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case=
/id/6112a292f22fcda94ab136a2
        new failure (last pass: v5.14-rc5-549-g3b20129c119f)

    2021-08-10T15:59:52.741629  /lava-4342625/1/../bin/lava-test-case
    2021-08-10T15:59:52.786691  [   30.260345] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/6112a261b7f16ea02eb1366e

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6112a261b7f16ea02eb13678
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-10T15:59:05.994191  /lava-4342696/1/../bin/lava-test-case
    2021-08-10T15:59:06.030890  <8>[   43.244499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6112a261b7f16ea02eb13679
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-10T15:59:04.914335  /lava-4342696/1/../bin/lava-test-case
    2021-08-10T15:59:04.950590  <8>[   42.164334] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6112b471841e4d262cb13672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112b471841e4d262=
cb13673
        failing since 101 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6112b22c9e0bf53f13b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112b22c9e0bf53f1=
3b13662
        failing since 126 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
