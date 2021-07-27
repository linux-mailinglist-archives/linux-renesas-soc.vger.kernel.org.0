Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A0A3D6D22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 06:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233844AbhG0EJl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 00:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbhG0EJe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 00:09:34 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F923C061764
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 21:09:34 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso3098629pjo.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 21:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wDKuPL2Wux0qx53/KywkNyqHUX/tzALvnzWla0Pd1os=;
        b=zIYw7a0dtLthJaXyZIOZSl0J7qDrzjWJdM2TL1k98RXzwsgoC/n4AWw0Au6c9b/9JY
         SLsuXtZKOSUS7mWTGX/tNzwKTxWI+jrjFOrnp+9pUb771dGNshKxjtCWMSuqiaQByRdj
         GF7Mfcxpt0hkMFi8NQD/kJvODt5qc1FLnJj07wSupxE5hfmFJgDG7DHpXF4/fljluDxh
         A0WpZUpOOeXA3SWuInaZhipUaamLD77LglYIqwE9oDJm6TKFtoQU/VbBNECgxvEZNdWJ
         QzPX0LQ5QNMUhTvMJbY+NrU8o393gjb0+mIzYLbaV89hz8fBlrYoCqB0Xug/XxLjfWtp
         O3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wDKuPL2Wux0qx53/KywkNyqHUX/tzALvnzWla0Pd1os=;
        b=BVaaIF4gvfq6urkyAV85MdpotVtzxgCWvaeXo/MtaUg3/NnOIeeCYO9+Ss6mEj1HzK
         HMq6ZtnUUPEAb0vkXsmx5XccjshMw9Z4pkpRnX1v7DmEVFXuZM6koPeY/rgWhQsarUyl
         xmu8cOlM/7JZYpKzM9XjHjTVZLdRJa2tLom0H0hltAz6OKFIAtv+Sc4+u2a9YL3Yymjx
         9hNPScKxZXd31UXifXgeimxj+suiszJAjAazDvBS1ke1OmUi3LbLoyzYYIFf0qSn9WI1
         lSHaeAoVp5eguyarcoH9IocodRr4tEBLYqyWX/y+1iHPu4R9iGIZMRf6kYrY3eUdttWI
         gMXA==
X-Gm-Message-State: AOAM530OAq3SXGTOLTmvnjhH8X2bzVRhVX6GvGTFdmhSH/1MZHU940li
        VkqGnnTH45Qr86iILpOY8njFf5LyRGzlOaJe
X-Google-Smtp-Source: ABdhPJyy74py1w6RkWQQyktiCYHl5YWKKjdvWCVBoN5LWjisol29rr5S5fu/KyJQ/m4hjq+FJYWAxw==
X-Received: by 2002:a17:90a:7505:: with SMTP id q5mr604959pjk.64.1627358973538;
        Mon, 26 Jul 2021 21:09:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g2sm1650803pfv.91.2021.07.26.21.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 21:09:33 -0700 (PDT)
Message-ID: <60ff86fd.1c69fb81.a55e8.6e56@mx.google.com>
Date:   Mon, 26 Jul 2021 21:09:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-26-v5.14-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 74 runs,
 10 regressions (renesas-next-2021-07-26-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 74 runs, 10 regressions (renesas-next-2021-07-26=
-v5.14-rc1)

Regressions Summary
-------------------

platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
dove-cubox        | arm   | lab-pengutronix | gcc-8    | multi_v7_defconfig=
           | 1          =

hip07-d05         | arm64 | lab-collabora   | gcc-8    | defconfig         =
           | 1          =

hip07-d05         | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

odroid-xu3        | arm   | lab-collabora   | gcc-8    | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =

odroid-xu3        | arm   | lab-collabora   | gcc-8    | multi_v7_defconfig=
           | 1          =

rk3288-veyron-jaq | arm   | lab-collabora   | gcc-8    | multi_v7_defconfig=
           | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora   | gcc-8    | defconfig         =
           | 2          =

rk3399-gru-kevin  | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-26-v5.14-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-26-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cecb7cc88302b2e508c6cc1ce7663bba08c96a65 =



Test Regressions
---------------- =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
dove-cubox        | arm   | lab-pengutronix | gcc-8    | multi_v7_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4e30e976d8c5863a2f31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ff4e30e976d8c58=
63a2f32
        failing since 90 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
hip07-d05         | arm64 | lab-collabora   | gcc-8    | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff5de512339074653a2f57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ff5de5123390746=
53a2f58
        failing since 18 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
hip07-d05         | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff60e5f3c8eeafc43a2f34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ff60e5f3c8eeafc=
43a2f35
        failing since 18 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
odroid-xu3        | arm   | lab-collabora   | gcc-8    | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff6fff5514893a9b3a2f34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ff6fff5514893a9=
b3a2f35
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
odroid-xu3        | arm   | lab-collabora   | gcc-8    | multi_v7_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff7833968de6f7bd3a2f2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ff7833968de6f7b=
d3a2f2f
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
rk3288-veyron-jaq | arm   | lab-collabora   | gcc-8    | multi_v7_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff8061a648ec5b713a2fa2

  Results:     68 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-rk=
3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case=
/id/60ff8061a648ec5b713a2fde
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1)

    2021-07-27T03:41:03.057159  /lava-4251449/1/../bin/lava-test-case
    2021-07-27T03:41:03.097127  [   29.646978] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin  | arm64 | lab-collabora   | gcc-8    | defconfig         =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/60ff522bb0a705868f3a2f22

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ff522bb0a705868f3a2f28
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:24:07.319894  /lava-4251403/1/../bin/lava-test-case
    2021-07-27T00:24:07.354080  <8>[  108.641338] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ff522bb0a705868f3a2f29
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:24:06.239261  /lava-4251403/1/../bin/lava-test-case
    2021-07-27T00:24:06.278812  <8>[  107.565337] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin  | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ff534517d4754c963a2f40

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ff534517d4754c963a2f46
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:28:33.556888  /lava-4251510/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ff534517d4754c963a2f47
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:28:32.477651  /lava-4251510/1/../bin/lava-test-case
    2021-07-27T00:28:32.511271  <8>[   41.319351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
