Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DBC3CEF0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 00:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359788AbhGSVYq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 17:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387998AbhGSUlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 16:41:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F7CC061768
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 14:15:39 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 37so20558292pgq.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 14:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qF/ap1VQs0kOM3SilnUAiTZvE1zVIAbao1zoGjFefws=;
        b=HAn7CQUYEiR+D4qVGQqqqeJP/x3ooFSXqXW89Jbp8Qy09plSxyn7x//TbbV0MHR8hk
         ccXM65CPkJnU0hw+ie317XFqEmwQXNWxFcyuyoz+Y12U+gE/3HFuGSQNlQSCX3xO6E0X
         PYOL6jkvOnQgaO6CMasuC20s0BsNBVkFUbGJqz+MUcunaOxrGuCRa+vxmnDMKwyzq3PF
         bb6vrN45v/B+8BL7JW4LJAsMFmnqYILbxAbBb1Iwz2UmyaU8qj5djEVeEAUCZ6ncYiw1
         JVZD/d2TWvvQhOuT4rmgQEhUdIWH6N1lKLUN/PA1xG2ynuNPvTVu4tHBwbMRafwydNm/
         RnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qF/ap1VQs0kOM3SilnUAiTZvE1zVIAbao1zoGjFefws=;
        b=MkzpkkEQ50go52weBloHmt3eZIb8/b6godl6dKv6WoX0iA+5syiT6QvUeVx4Rp0CpG
         kJ5DAGAf34ZQQhGXWqlSuNzm5CUkb7dMV2jBAQ/f7UM8ei6xReKvfDIr0G0hdtzVpwGs
         9zh4HIf1f2hFAWaLX+73gn82kMB/6/rcRBWO8VUcKr/AyRmbG255jOvch6vGfO0vjUF+
         zPGVus3GkcoU/SEm0gftk5nW2kWgDYeuNz8nZImm3WinyNaNo5IS1MqhpPOTsTzaW2LR
         TnJ0oQrx47Jv6zAp0ZJKRlv1z+Og97yNn2VdFVrV3r94YWlQMQoHbuwZmn2GszXKiaWp
         Uz+g==
X-Gm-Message-State: AOAM532uVoWVv7vklw6aM5bOKneA2ONoZaDYtcKWvYOqVGRa9HU6t2+N
        qP7Z9BEHa5f1ttH2MTgGJtfeFiN//N1qx++1
X-Google-Smtp-Source: ABdhPJxCXB9m1FUeLkUFi8C/RiO9DrzQjP7ocW97n/6oqihUnShcrgbuOlZxLOB1h2UYuSzFbbZD9w==
X-Received: by 2002:a63:67c3:: with SMTP id b186mr5944900pgc.384.1626729338748;
        Mon, 19 Jul 2021 14:15:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e2sm24019413pgh.5.2021.07.19.14.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 14:15:38 -0700 (PDT)
Message-ID: <60f5eb7a.1c69fb81.70d4d.7eac@mx.google.com>
Date:   Mon, 19 Jul 2021 14:15:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-19-v5.14-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 54 runs,
 7 regressions (renesas-next-2021-07-19-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 54 runs, 7 regressions (renesas-next-2021-07-19-=
v5.14-rc1)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig | 1          =

dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =

rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig =
         | 2          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-19-v5.14-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-19-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a022240886d918d1f09a50b86a4065256caac42 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5b621d2522a445111609e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60f5b621d2522a445=
111609f
        failing since 6 days (last pass: renesas-next-2021-07-08-v5.13-rc1,=
 first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5b558b689aa7e5f1160c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60f5b558b689aa7e5=
f1160c6
        failing since 83 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5cd8f3c82dd2f451160bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60f5cd8f3c82dd2f4=
51160be
        failing since 108 days (last pass: renesas-next-2020-10-26-v5.10-rc=
1, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
rk3399-gru-kevin          | arm64 | lab-collabora   | gcc-8    | defconfig =
         | 2          =


  Details:     https://kernelci.org/test/plan/id/60f5b6b6a07382acac11609b

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60f5b6b6a07382acac1160a5
        failing since 6 days (last pass: renesas-next-2021-07-08-v5.13-rc1,=
 first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-19T17:30:21.304702  /lava-4211464/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60f5b6b6a07382acac1160a6
        failing since 6 days (last pass: renesas-next-2021-07-08-v5.13-rc1,=
 first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-19T17:30:19.171585  <8>[   40.702688] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-19T17:30:20.219553  /lava-4211464/1/../bin/lava-test-case
    2021-07-19T17:30:20.257227  <8>[   41.789215] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5cbc309391fb9591160a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60f5cbc309391fb95=
91160a4
        failing since 119 days (last pass: v5.12-rc2-14-g6f56f6c26099, firs=
t fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5c92eeb36ccd18b1160a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60f5c92eeb36ccd18=
b1160a5
        failing since 79 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
