Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2435B42E82E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 06:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhJOFBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 01:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhJOFBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 01:01:10 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5034CC061570
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:59:04 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c29so7402962pfp.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=B2Z5LQQ5hoayXnW7xZp+5rvES2HTOqrtQRljKKRI/KE=;
        b=pw0xxNVfpcddAFEIyajp2XNTzp83pV/Kl13yXHBVSCmeIAxuTJv2ZQi0BllTmWsiQ4
         xCZYSu0VRuo+XRdO0JlsE1umWTKpAs3PiMEQIAYZH1S4vivFhH4jVkyv0iDi9DHBxD3i
         k5HyXCzdzpHLJQCXen+2kAI7pxEq/AKOf0FsFuMJ+PZeQ1P4fwFsh5buOEH15Tio0zcs
         zhc/+UFbsyBeSPSflU51lisqqrr6ZL+rprogv58zxvrFK7IkTQtX0aMN80uT7hHCiuaU
         H6eGM6MdmImpXYti4V+PVroxeVN3CpDdas/aHt3jRkzWFIQG38animdOiRc+11iAAuUM
         w8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=B2Z5LQQ5hoayXnW7xZp+5rvES2HTOqrtQRljKKRI/KE=;
        b=LVAftC1jD2wzkxcz9A132DcxSP5bAH6W16kZ+nTso7boBmsmDXLRpcjVrBUQw+CVgC
         gurZGJK5CyMDsUD8V5Z5DhoHJiiLAGySHhxnTdzsikbHhBcFn2V3ASfJFDcCKSImqtx8
         shnH+dfd6RJbM1ZQFDBEowQKjytytI4iDU9ioS9X7/tsvzPg+F/dK2yjQS8+Pyn7g9RS
         5ylwJf5dk8SriDXpPsufGAp5/kILqc3zlOAdkLLe3MJbDDkTE18t1biHG2sO8z6qaLv5
         bVS2YBzu26/t+sqzoDBt82F7BiNpXdMftiCME7HDwM33ASZ9g3xvnDpDfZNURdRdQ4A8
         a+6w==
X-Gm-Message-State: AOAM530SarNafyUvFbF840IsBH+fSOApJrZ0sKqnduMnND0t8NdF8Gir
        ifjdQ3VvKqDFvTaeICkHy0JGGzPXowDBY0M+
X-Google-Smtp-Source: ABdhPJxt9ADXAI54U+34CtR1R//vZlADr2QLGfhGx8TltmzckIHMAD342rhnvGoMd6MG28D6nzkPuw==
X-Received: by 2002:a63:b34e:: with SMTP id x14mr7312519pgt.423.1634273942975;
        Thu, 14 Oct 2021 21:59:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b134sm3698509pga.3.2021.10.14.21.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 21:59:02 -0700 (PDT)
Message-ID: <61690a96.1c69fb81.1be51.c4b4@mx.google.com>
Date:   Thu, 14 Oct 2021 21:59:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-10-14-v5.15-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 134 runs,
 8 regressions (renesas-next-2021-10-14-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 134 runs, 8 regressions (renesas-next-2021-10-14-v5.=
15-rc1)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
beagle-xm             | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =

beagle-xm             | arm   | lab-baylibre | gcc-8    | omap2plus_defconf=
ig          | 2          =

imx6q-sabresd         | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb  | arm   | lab-baylibre | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip      | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-14-v5.15-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-14-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f9d9ae67a71d1c68b9961af72940aae2685f838b =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
beagle-xm             | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6168ce2b5398d40158335900

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168ce2b5398d40158335=
901
        failing since 79 days (last pass: renesas-next-2021-07-26-v5.14-rc1=
, first fail: renesas-next-2021-07-27-v5.14-rc1) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
beagle-xm             | arm   | lab-baylibre | gcc-8    | omap2plus_defconf=
ig          | 2          =


  Details:     https://kernelci.org/test/plan/id/6168cdb34f0a3e5c293358e1

  Results:     3 PASS, 2 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6168cdb34f0a3e5=
c293358e5
        new failure (last pass: renesas-next-2021-10-11-v5.15-rc1)
        13 lines

    2021-10-15T00:39:03.927827  <8>[   48.826354] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-10-15T00:39:03.966701  kern  :alert : Register r0 information: NUL=
L pointer
    2021-10-15T00:39:03.971634  kern  :alert : Register r1 information: non=
-paged memory
    2021-10-15T00:39:03.976977  kern  :alert : Register r2 information: non=
-paged memory
    2021-10-15T00:39:03.981884  kern  :alert : Register r3 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6168cdb34f0a3e5=
c293358e6
        new failure (last pass: renesas-next-2021-10-11-v5.15-rc1)
        15 lines

    2021-10-15T00:39:03.992845  kern  :alert : R<8>[   48.885589] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D13>
    2021-10-15T00:39:03.996526  egister r4 information: non-slab/vmalloc me=
mory
    2021-10-15T00:39:04.004106  kern  :alert : Register r5 information: sla=
b task_struct start c40290c0 pointer offset 0
    2021-10-15T00:39:04.008982  kern  :alert : Register r6 information: NUL=
L pointer
    2021-10-15T00:39:04.014721  kern  :alert : Register r7 information: non=
-slab/vmalloc memory
    2021-10-15T00:39:04.020422  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2021-10-15T00:39:04.025038  kern  :alert : Register r9 information: NUL=
L pointer
    2021-10-15T00:39:04.030947  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2021-10-15T00:39:04.036722  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2021-10-15T00:39:04.042468  kern  :alert : Register r12 information: no=
n-slab/vmalloc memory =

    ... (1 line(s) more)  =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx6q-sabresd         | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168cbe53c77aaa4573358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168cbe53c77aaa457335=
8dd
        failing since 282 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6168cde5f6fe4a4a55335902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168cde5f6fe4a4a55335=
903
        new failure (last pass: renesas-next-2021-10-11-v5.15-rc1) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c9246aff8e22043358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c9246aff8e2204335=
8dd
        failing since 325 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c9e1328d15c0473358f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c9e1328d15c047335=
8f8
        failing since 325 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
qemu_arm-versatilepb  | arm   | lab-cip      | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c98913fa6f99973358de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c98913fa6f9997335=
8df
        failing since 325 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
