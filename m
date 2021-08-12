Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A863EAA27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 20:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhHLSVY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 14:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhHLSVX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 14:21:23 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1233C0613D9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:20:57 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id b7so8355924plh.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KpkeNY7GCxEtIuiL8KYCeYixlTIa7Yhz30tux6+d9Do=;
        b=Aeji5LinjHGwi6yLfdFkvCprsi55YyQ04jFktn6d8x7OSN62GgTOUiRT+PJMVPKrCx
         IXh/A84O4uYyEvHwUq2sEWKPezZnEmzrL8DJSY/Xs8Ly7VpmCoRKSseLx1Cvj6XQWv4h
         Km3GbplOq/07M28Zuy3mjws1PiBPKj9DtoVdZbSEJETT8wFY7p1jJa32loBJkRNJmlaj
         Gf/Oe1YfTGoxt7ZmRtUz0LlxNu7F8sd1Idauo/NFPwHhh/kspW88ZDF+5YWlvOOkB2w6
         LdSFcP54rKls4ecCWBLWnADJTPWk+LYsve/Hd4NC4f/mWWXOTZM3C72F75q9nPulyxKa
         tUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KpkeNY7GCxEtIuiL8KYCeYixlTIa7Yhz30tux6+d9Do=;
        b=W1Eyk7tDJcWDHUPAkRWpkY9MrGqMriWcgbkDDDMQW8H2+HapMPQ5vWzdO9Vn5OZTgk
         Qnzd7Ph/zuaXeyIKaOG58zUNFNkWVGhqfVXRIfH/S2Ya6QNh1vGhcOHK6A4q8KpAA9HQ
         AIOdqbEdJT9J5Gru5sDuopyj+S23aU0kfAY8IE2hqaN2UEtHPkEkkfBHUK40dpSyitv2
         cB9Y7Kmmy6Q3N1+lsXrlqtRlF7LUf3NdoNRbI0wquDm4UQFPkkPzCHEyWYj6XhMilvI3
         3Ke8p7bMrmf9PAQXbPg3ytCOiRe185Iuo4fxDJjWofcOXUOqtH4ikUhFnVnVdIHDVq2c
         VvzA==
X-Gm-Message-State: AOAM530gIUNi/RkcFG4USPyfVwuyLD+HfMzRD/MLa9NtbyErCht+b+g8
        gTyZqTZ3YIFW5rf2pa4wmg8mneXangJZttmm
X-Google-Smtp-Source: ABdhPJynh8nPZAQXs1XGS/NK5Yt7ODTm/y+2bjMreXZe7SnDQXKd0u1EP4M5I1cgRdjivPH+FI6izQ==
X-Received: by 2002:a17:90a:5895:: with SMTP id j21mr17675290pji.145.1628792456649;
        Thu, 12 Aug 2021 11:20:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b20sm387471pji.24.2021.08.12.11.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 11:20:56 -0700 (PDT)
Message-ID: <61156688.1c69fb81.60bc8.178d@mx.google.com>
Date:   Thu, 12 Aug 2021 11:20:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-08-12-v5.14-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 82 runs,
 8 regressions (renesas-next-2021-08-12-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 82 runs, 8 regressions (renesas-next-2021-08-12-=
v5.14-rc1)

Regressions Summary
-------------------

platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 1          =

odroid-xu3                | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 2          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-08-12-v5.14-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-08-12-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      59d7f78144a8a34a290ba84931721eaf11e66ca9 =



Test Regressions
---------------- =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152f369b43c9e45bb136cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61152f369b43c9e45=
bb136ce
        failing since 34 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/611537f84bc9db95a7b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/611537f84bc9db95a=
7b13662
        failing since 34 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
odroid-xu3                | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611532129354730cadb13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/611532129354730ca=
db1366a
        new failure (last pass: renesas-next-2021-08-10-v5.14-rc1) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61152afa7c36fcf85bb13668

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/61152afa7c36fcf85bb13672
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:06:45.914968  /lava-4353422/1/../bin/lava-test-case
    2021-08-12T14:06:45.955269  [   44.031678] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/61152afa7c36fcf85bb13673
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:06:43.775874  [   41.851410] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-12T14:06:44.824597  /lava-4353422/1/../bin/lava-test-case
    2021-08-12T14:06:44.865943  [   42.943229] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6115314cea8a099971b136c5

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6115314cea8a099971b136cf
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:33:35.910521  <8>[   86.096131] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-08-12T14:33:37.208286  /lava-4353634/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6115314cea8a099971b136d0
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:33:34.668538  <8>[   84.854083] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-12T14:33:35.717428  /lava-4353634/1/../bin/lava-test-case   =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 1          =


  Details:     https://kernelci.org/test/plan/id/61152b1be0854dbbd5b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61152b1be0854dbbd=
5b13662
        failing since 103 days (last pass: renesas-next-2021-04-02-v5.12-rc=
2, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
