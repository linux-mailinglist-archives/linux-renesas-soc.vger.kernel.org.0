Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BED42FC003
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 20:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbhASTaq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 14:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbhAST1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 14:27:13 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593BEC061575
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 11:26:33 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id x20so544141pjh.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 11:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2pnfV8oZx0tSx56juVyaAxNhLrnQVcmWxAe3Knm4t7I=;
        b=H58+oEBSbYhkhiArVGNtqDSMGo5em0jb70C651oHX/6QMXNpnajcbWITpvyHGB7Ouz
         YAMl+ApMWU39DPyS1fHHHzQIYOBsLVTf2LM4wvEYWhMskqxUKaZb7EuYbFndkVKcjd8S
         BiEVZklWoaD8wCICHKnqxMzLxIYg1TyIMmxgRixtpyyleoUPcqwPjY87VtM9Qr74SplI
         /sEhHBHIa/xFTNCLCCCDtV6W8GoVOREgtN7yqoSWlnRrx83etQM7KXZJAfMl7bbzZkv3
         hBHs+X+cpuYxkI9aAkYu3W6qwqQN7YzbdRTwGLh+Cio6RyheQxQ5EFnraa7BLHRw/SGN
         yZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2pnfV8oZx0tSx56juVyaAxNhLrnQVcmWxAe3Knm4t7I=;
        b=GPBI1RQxbBoCKQfhMfWHKlBqlsafqvTRws2G+Ohye3XZOjaPjZ6fKEzlal4YEKjrTI
         8TbtAdCXFg4KvQ171VUDzlUvEnkcPmedRG/kLQy7WINSmZqCqtvPHja+CTguqCs329sd
         xDrG/jYC//Ng3CFTBdNfMpitY9KPOMGD9C0T3ZlOzNhZRNFhdky329R5VtGvej6BFJPb
         Cvf4eziFbaayxTDRlSrZlaxvG3ED+wi8clfI2jKqGoAZlAgYPhiSHpzhifVHdSzJJv2d
         WeSz/ikht2qaVFrwvdDFopBHddHSvSZrG+xE/g4JD12p7UgpwMHCruUHN8V4+UL1IQDl
         sH6w==
X-Gm-Message-State: AOAM532/bWRl/dIwAPggRbEL8Peys4J+LWjEav6W82a1KvLk0cSM6Ebn
        OxAbHsZcw1RvzmWJfbuFj65PdzH09gKkpw==
X-Google-Smtp-Source: ABdhPJzBE984E4NRWmPAmLYI8zdqP9qVd8tWBorPnNPkDjS/L4+m1tARL69QcHNJ8k3RdSEI8etu6w==
X-Received: by 2002:a17:902:8492:b029:de:17d0:16cf with SMTP id c18-20020a1709028492b02900de17d016cfmr6202872plo.74.1611084392180;
        Tue, 19 Jan 2021 11:26:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a131sm20517239pfd.171.2021.01.19.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 11:26:31 -0800 (PST)
Message-ID: <60073267.1c69fb81.524c4.3854@mx.google.com>
Date:   Tue, 19 Jan 2021 11:26:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d
Subject: renesas/next baseline: 309 runs,
 22 regressions (renesas-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 309 runs, 22 regressions (renesas-next-2021-01-14-v5=
.11-rc1-2-gb72b30fb341d)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =

imx6q-sabresd              | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 2          =

imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defconfig           | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2       | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 2          =

meson-gxm-khadas-vim2      | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200             | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

meson-gxm-q200             | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b72b30fb341d0acba58431da7519d4643aa85b34 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fac9d2830e990cbb5d31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/bcm2835_defconfig/gcc-8/lab-baylibre/b=
aseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/bcm2835_defconfig/gcc-8/lab-baylibre/b=
aseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fac9d2830e990cbb5=
d32
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-sabresd              | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006ffef7bd4bd27d3bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/base=
line-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/base=
line-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006ffef7bd4bd27d3bb5=
d0c
        failing since 14 days (last pass: renesas-next-2020-11-30-v5.10-rc1=
, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fe2b7bf791cb3cbb5d21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fe2b7bf791cb3cbb5=
d22
        failing since 7 days (last pass: renesas-next-2020-12-28-v5.11-rc1,=
 first fail: renesas-next-2021-01-11-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6006ffb4c3c7152717bb5d1b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6006ffb4c3c7152=
717bb5d1f
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1)
        4 lines

    2021-01-19 15:50:05.148000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2021-01-19 15:50:05.148000+00:00  kern  :alert : pgd =3D (ptrval)
    2021-01-19 15:50:05.149000+00:00  kern  :alert : [<8>[   46.417258] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D4>
    2021-01-19 15:50:05.149000+00:00  cec60217] *pgd=3D1ec1141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6006ffb4c3c7152=
717bb5d20
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1)
        26 lines

    2021-01-19 15:50:05.201000+00:00  kern  :emerg : Process kworker/1:2 (p=
id: 80, stack limit =3D 0x(ptrval))
    2021-01-19 15:50:05.201000+00:00  kern  :emerg : Stack: (0xc33f7eb0 to<=
8>[   46.464263] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D26>
    2021-01-19 15:50:05.202000+00:00   0xc33f8000)
    2021-01-19 15:50:05.202000+00:00  kern  :emerg : 7ea0<8>[   46.475460] =
<LAVA_SIGNAL_ENDRUN 0_dmesg 605584_1.5.2.4.1>
    2021-01-19 15:50:05.202000+00:00  :                                    =
 1e9b10fe 440030d2 0000000d cec60217   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60070143075cea0978bb5d30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/base=
line-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/base=
line-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60070143075cea0978bb5=
d31
        failing since 14 days (last pass: renesas-next-2020-11-30-v5.10-rc1=
, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fdd504f7919688bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fdd504f7919688bb5=
d0c
        failing since 14 days (last pass: renesas-next-2020-11-30-v5.10-rc1=
, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6006ff3dbdfdf459ebbb5d3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig/gcc-8/lab-nxp/basel=
ine-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig/gcc-8/lab-nxp/basel=
ine-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006ff3dbdfdf459ebbb5=
d40
        failing since 14 days (last pass: renesas-next-2020-11-30-v5.10-rc1=
, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006ff15e47f9a6cfebb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006ff15e47f9a6cfebb5=
d0c
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600700cac91aa0cb76bb5d17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600700cac91aa0cb76bb5=
d18
        failing since 5 days (last pass: renesas-next-2021-01-11-v5.11-rc1,=
 first fail: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2       | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6006fd87f3391d6c8ebb5d0c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-baylibre/baselin=
e-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-baylibre/baselin=
e-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6006fd87f3391d6=
c8ebb5d10
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1)
        8 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6006fd87f3391d6=
c8ebb5d11
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1)
        2 lines

    2021-01-19 15:40:49.903000+00:00  kern  :alert :   EC =3D 0x21: IABT (c=
urrent EL), IL =3D 32 bits
    2021-01-19 15:40:49.903000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-19 15:40:49.903000+00:00  kern  :alert :   EA =3D <8>[   16.307=
446] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D2>
    2021-01-19 15:40:49.903000+00:00  0, S1PTW <8>[   16.314295] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 605619_1.5.2.4.1>
    2021-01-19 15:40:49.903000+00:00  =3D 0
    2021-01-19 15:40:49.904000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000000713f000   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2      | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600700f7428ba3ba5cbb5d56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/=
gcc-8/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/=
gcc-8/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600700f7428ba3ba5cbb5=
d57
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxm-q200             | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60070059ee2bee65a5bb5d14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-baylibre/baselin=
e-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-baylibre/baselin=
e-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60070059ee2bee65a5bb5=
d15
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxm-q200             | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600701a7993c06b683bb5d69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600701a7993c06b683bb5=
d6a
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fadbe0543fcfc1bb5d1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-baylibre=
/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-baylibre=
/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fadbe0543fcfc1bb5=
d1d
        failing since 57 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fadde0543fcfc1bb5d1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-broonie/=
baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-broonie/=
baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fadde0543fcfc1bb5=
d20
        failing since 57 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fad3e0543fcfc1bb5d16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-cip/base=
line-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-cip/base=
line-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fad3e0543fcfc1bb5=
d17
        failing since 57 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006faa9d2830e990cbb5d13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-collabor=
a/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/versatile_defconfig/gcc-8/lab-collabor=
a/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006faa9d2830e990cbb5=
d14
        failing since 57 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fe8d3ebceca60fbb5d0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-broonie/baseline=
-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-broonie/baseline=
-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fe8d3ebceca60fbb5=
d10
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fe8e7f2cb315f8bb5d24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-broonie/baseline=
-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-broonie/baseline=
-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fe8e7f2cb315f8bb5=
d25
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60070051a75339b58fbb5d18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60070051a75339b58fbb5=
d19
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =20
