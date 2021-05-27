Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3742E3935F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 21:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhE0TLF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 15:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhE0TLF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 15:11:05 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08A9C061760
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 12:09:30 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id j12so653810pgh.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 12:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bp5Wtklg6u6jmxICQECPVQ6pcNyeoo6YbPRGNQmfrzY=;
        b=UnFYc2NSV7vHnX7WTE3VwdsBqQUludP/83pDrp7bPXZ/hm7utt7bg6Lj/zHFDX5/EA
         /amaYGx0HwN8K/v50gVuLvM3F4LQ/SpMpKjUjRSvkiz9pATH4dg1fJfYcscbXkCNYufj
         6iBTXLyZq1xQXYg2Vw2hzlPB7xWZpnoAuQqpUeLs2S+UstP/ZUmGw3VrY1kn4eRigo2U
         FiVzHfrvSu1xyfszohKWR+AeKqRAdMl97359Cw3B0bML6BvUoQkHeYWrNyX1pPNEzErS
         id0kAAJUBMPXxmJbv61ftI/Y0HeWhTWhKTYJz8sApypKHbwphKvlYmkWACTea2DG1KGf
         DKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bp5Wtklg6u6jmxICQECPVQ6pcNyeoo6YbPRGNQmfrzY=;
        b=S64HK2W+rfaMt5ZhlHkRYjWluxPxT/xpheqBxP6RSHoGffiFNarxqTvIvo6ft7My8q
         7958TLoUdpYazwxMhTH7cO+zwlxLsn22oJ5/qSEqR5QjPGxwh4RRvdEHgQdE/4zZeSbU
         LSbDylhZKyfBzMnR5Qd5xTaU0JbB/QUI9NRPywppIrPqrearqHNAW+K9fj9Itx1H/vFY
         j5kcrdT1xHn/v+IJysy+Xs4G7C36r1LA0pMKBvKtUiQFljkS6HoaP0yZj23qBklNwxyp
         KZf9wXbrv9pDzDO+reLRXeiY1VpB0s5ZSmchq83DK7rfsuUGkHZ+g3rh1E3ojk6DivAA
         jPSw==
X-Gm-Message-State: AOAM530ErFz7bZFsOJNvc37xdUPnf5QhgV1Cg4l2oHIFEbzk4WA7uEte
        Euq0RQSJyS4qU+qt2XCA8A6bEN/vykIdAA==
X-Google-Smtp-Source: ABdhPJwv4sAngQVTKDqnB2bOfDzqaKkeGOsFjU2YXlGFkqMecrX3836ReQ++PckndH8HhLrAA770kA==
X-Received: by 2002:a63:801:: with SMTP id 1mr5024601pgi.146.1622142569655;
        Thu, 27 May 2021 12:09:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e6sm1853068pfd.37.2021.05.27.12.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 12:09:28 -0700 (PDT)
Message-ID: <60afee68.1c69fb81.4812.5372@mx.google.com>
Date:   Thu, 27 May 2021 12:09:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-27-v5.13-rc3
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 216 runs,
 9 regressions (renesas-devel-2021-05-27-v5.13-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 216 runs, 9 regressions (renesas-devel-2021-05-27-=
v5.13-rc3)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 2          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-27-v5.13-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-27-v5.13-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      526d21d2400220747c84b171477371984e3d1671 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60afb4bf575bc25a65b3af97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60afb4bf575bc25a65b3a=
f98
        failing since 106 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60afb24b8c0f7a2169b3af9b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60afb24b8c0f7a2=
169b3afa1
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)
        17 lines

    2021-05-27 14:52:45.069000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00<8>[   42.590259] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D17>
    2021-05-27 14:52:45.069000+00:00  000098   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60afb24b8c0f7a2=
169b3afa2
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)
        31 lines

    2021-05-27 14:52:45.074000+00:00  kern  :alert : [00000098] *pgd=3D0000=
0000
    2021-05-27 14:52:45.075000+00:00  kern  :alert : Register r0 informatio=
n: NULL pointer
    2021-05-27 14:52:45.075000+00:00  kern  :alert : Register r1 informatio=
n: NULL pointer
    2021-05-27 14:52:45.076000+00:00  kern  :alert : Register r2 informatio=
n: slab kmalloc-2k start c2411800 pointer offset 0 size 2048
    2021-05-27 14:52:45.112000+00:00  kern  :alert : Register r3 informatio=
n: slab kmalloc-2k start c2a9b800 pointer offset 0 size 2048
    2021-05-27 14:52:45.114000+00:00  kern  <8>[   42.633260] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D31>
    2021-05-27 14:52:45.115000+00:00  :alert : Registe<8>[   42.644086] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 385722_1.5.2.4.1>
    2021-05-27 14:52:45.116000+00:00  r r4 information: slab kmalloc-512 st=
art c318b200 pointer offset 8 size 512   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60afb52778592a0165b3af9c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60afb52778592a0165b3a=
f9d
        failing since 206 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60afb60b73aca6b15fb3b03e

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60afb60b73aca6b15fb3b052
        failing since 16 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-27 15:08:54.876000+00:00  <8>[   55.781848] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60a=
fb60b73aca6b15fb3b058
        failing since 16 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-27 15:08:55.988000+00:00  <8>[   56.893811] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60afb533a65a1bf46cb3afbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60afb533a65a1bf46cb3a=
fbd
        failing since 190 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60afb4b895c0f5de27b3afab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60afb4b895c0f5de27b3a=
fac
        failing since 190 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60afb566f66bff2121b3afa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60afb566f66bff2121b3a=
faa
        failing since 190 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
