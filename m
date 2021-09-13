Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F293C40A130
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 01:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348711AbhIMXCc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 19:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349900AbhIMXCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 19:02:23 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C9AC0617A9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 15:47:12 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id c4so5307837pls.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 15:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kqyRmH9gXW4iDyVMmgmR6BppRXiw8pT0BZ5lC3Z6Jzo=;
        b=tyVRkYisdoyJu6q1km2goH/Ji1NczVAHEj+CoyBX81OYQ2wGNrhPHrsDSzQcCJsKEf
         MaA4gKObAXEyrXmAuU5mGHkBBrMNetIj1NBtlRw1Ta51qGD+fZLTKq4nDE39jisC8JJY
         fq+vQyoXmRag2wfsNuXXhIWtFS3EN224ILUFCXT9aGBYDWzg9meoiL1YWw8fRC/CWJXH
         gTilN2eY5x06jx/ImXmKlE1dAoIpqTmJHR7lNvJ6FZbU31pXD5hdihzlgMXDRmpqFSDK
         YQqoKIG395XCbgVV5xxz/IHw75EgO2cbFdZd221NnJgtvRlc+pfLSaZSa8+flk7j/xI+
         lS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kqyRmH9gXW4iDyVMmgmR6BppRXiw8pT0BZ5lC3Z6Jzo=;
        b=DBeKngo9tpjjgI8zXoMdZui+Ge1CgnMRhDuCCKIeRmV1fAr1ECp3dLU17vfjBMPlya
         kdbg9Q2bEk0BdU8RJBql+z9+63k1tf6mO8mKrZDnbVczmv3WjqQdat9UuPdcchjd+Ep+
         y2IIk5Ams0qR9H9tAw+SRGLtJYIZ8nar1tp8GvvYi74qYHwRcxZvqcbCItf/WNtL89zk
         lAzNa4kUtfD87Uld7X0l5GcTSequHXvxmq5iyy/s2ceLrQ7DwEsoj5hdgo3/Hosd5kEA
         GWAOz8hU8hu5Hi1+RPbURcusRIwh2UP6qdmI3x2dh2vdFEgYxuRQb+VVfAUytolNiWB2
         2j5g==
X-Gm-Message-State: AOAM532F1pBLBZyXQYfDb7bIoOp/noxBoDltAvnNOgwVn5PNB+z6PKm2
        lMNnfhZGiyopff2MFz54qMjXstV1wuYrCx8p
X-Google-Smtp-Source: ABdhPJwA0JaYkj4BpJCadH6bCGbzaP5M69T1lHAOM/NRIAZ0hwINswj+ITDvURTY0osnaP6SGifQJg==
X-Received: by 2002:a17:90a:680c:: with SMTP id p12mr1919070pjj.33.1631573231383;
        Mon, 13 Sep 2021 15:47:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z124sm9028443pgz.94.2021.09.13.15.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 15:47:11 -0700 (PDT)
Message-ID: <613fd4ef.1c69fb81.16979.9e82@mx.google.com>
Date:   Mon, 13 Sep 2021 15:47:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-564-ge23d26d2dc9a
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 419 runs,
 14 regressions (v5.15-rc1-564-ge23d26d2dc9a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 419 runs, 14 regressions (v5.15-rc1-564-ge23d26d2d=
c9a)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g           | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+crypto =
            | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
5-rc1-564-ge23d26d2dc9a/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v5.15-rc1-564-ge23d26d2dc9a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e23d26d2dc9ad4831b447fc9ef348b1621fac32d =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa19d5ef84469c599a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fa19d5ef84469c599a=
2e7
        failing since 215 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa0c149e583e55f99a31b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fa0c149e583e55f99a=
31c
        failing since 61 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9d5e61fc1e576699a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613f9d5e61fc1e576699a=
2db
        failing since 21 days (last pass: renesas-devel-2021-07-27-v5.14-rc=
3, first fail: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa004576d77f3a799a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fa004576d77f3a799a=
2db
        failing since 48 days (last pass: renesas-devel-2021-07-19-v5.14-rc=
2, first fail: renesas-devel-2021-07-26-v5.14-rc3) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/613fbe8fba6b8df47699a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fbe8fba6b8df47699a=
2e4
        failing since 61 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9b77185f94546799a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613f9b77185f94546799a=
2dc
        failing since 315 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa1ac094a55733799a31e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-meson-gxbb-=
p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-meson-gxbb-=
p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fa1ac094a55733799a=
31f
        new failure (last pass: renesas-devel-2021-08-30-v5.14) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/613f9f9f0f0632cbdc99a306

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/613=
f9f9f0f0632cbdc99a309
        failing since 125 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-09-13T18:59:22.893939  <8>[   26.531698] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-09-13T18:59:23.904976  /lava-4512990/1/../bin/lava-test-case
    2021-09-13T18:59:23.913763  <8>[   27.553061] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/613f9f9f0f0632cbdc99a30f
        failing since 125 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-09-13T18:59:21.780966  <8>[   25.417894] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-driver-present RESULT=3Dpass>
    2021-09-13T18:59:22.791575  /lava-4512990/1/../bin/lava-test-case
    2021-09-13T18:59:22.800764  <8>[   26.439533] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9c5313e606224d99a2fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613f9c5313e606224d99a=
2fd
        failing since 299 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9b7d18a61062ac99a2f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613f9b7d18a61062ac99a=
2f2
        failing since 299 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa3ab25aaeef06399a2ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fa3ab25aaeef06399a=
2eb
        failing since 299 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/613fa580ee7a7aaed299a300

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/613fa580ee7a7aaed299a306
        failing since 61 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-09-13T19:24:41.210169  /lava-4512986/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/613fa580ee7a7aaed299a307
        failing since 61 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-09-13T19:24:40.172952  /lava-4512986/1/../bin/lava-test-case
    2021-09-13T19:24:40.184179  <8>[   24.456697] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
