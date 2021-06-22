Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1CCB3B09F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 18:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhFVQKO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 12:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhFVQKN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 12:10:13 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0C4C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 09:07:57 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id p9so3130924pgb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CD+vF64V+p7DmbfHu0DdUYh07Gu5jwBa2aawKwCDRSQ=;
        b=sAhlxp9SizxWT6HGyZrC+PtF1rt7BBmwdM6bmGow+6AUFDqQl+QGuqrM7Fa/RN9KC+
         YsBywcVjRKKC23IXrSsjgcYHvNA3HVl3rYJyDgDAJyfW20EQeZTUsNJZ+iKt9VKIyYx5
         U2SldqsuSQieyZndw8Tkf2fqfDEaHAz6ze07OA+tiW3v96HmOhcIPWLvJC3nHPJgMiIa
         H3V0YFaUmvqfAd6+TyrB5AiNGW0T+XU/+f6YNbMwqa0KVTcN0mwiHp7/EPqfq9KsdX0c
         zeF4iimzu+Hi2+s4CRqbOPZU5oiskWuPRpYmHyst6hk/1+54pOT3KTNBefukDz+TwTuc
         iYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CD+vF64V+p7DmbfHu0DdUYh07Gu5jwBa2aawKwCDRSQ=;
        b=gy/wuG3wrNf3jBungS1TJeqkAbqeDxBYKvxuUXM6/AaeX6vgRqP+i1ePZ1BDvuSBqG
         a9eeOeM5fMJc9SR2m5BWgnbaE6JL/Dabr6xZc8hgPT1/NYZ/TB1If1yR4y2ne0ax/Poa
         YVPr/0D2Pg/JJCF2fkVG2pwfiGNKN96V/dpfZv2vCXiS/fL3pW+L8vz0DReTM3tGNpRf
         74wFHGFiBv26ac5TlaLn+o2TGoDdA1fRc2ir7+kKZ0v4vsC4ZTq8R+EjnUPjE5WSjzVu
         bjkWBm9US5VwcsRrCjU2y/3oT6Ax9VcJ+vMHANBBkRQhYOz71MVT2w2/KSWU/wUNPuhx
         x99Q==
X-Gm-Message-State: AOAM531SphP/Qs/LJSiXRF5x0JISLgGwjSXfAujjNPrKxV7ykpLbFGsp
        lChmPjTLdocbfFHBOnkLq9ECAvzqEapaMw==
X-Google-Smtp-Source: ABdhPJy10o66nBOvsUWeWtSf39QV+hE6dfPPIwFlZHmJjaybO5JWrIq3ehaHWXvNDYDNkVDEJtsD7w==
X-Received: by 2002:aa7:96bb:0:b029:2fa:f102:468c with SMTP id g27-20020aa796bb0000b02902faf102468cmr4254964pfk.25.1624378076372;
        Tue, 22 Jun 2021 09:07:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mj17sm2847290pjb.12.2021.06.22.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:07:56 -0700 (PDT)
Message-ID: <60d20adc.1c69fb81.90cb0.7841@mx.google.com>
Date:   Tue, 22 Jun 2021 09:07:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-06-22-v5.13-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 280 runs,
 14 regressions (renesas-devel-2021-06-22-v5.13-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 280 runs, 14 regressions (renesas-devel-2021-06-22=
-v5.13-rc7)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

meson-gxbb-nanopi-k2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 2          =

meson-gxbb-nanopi-k2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-22-v5.13-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-22-v5.13-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b9234c27991cbe7e6f97f22c3c7fef521fe34d3 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1d06ad769c311d94132e5

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/60d1d06bd769c311=
d94132e8
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6)
        2 lines

    2021-06-22T11:58:07.096650  / # =

    2021-06-22T11:58:07.107555  =

    2021-06-22T11:58:07.210879  / # #
    2021-06-22T11:58:07.219203  #
    2021-06-22T11:58:08.477268  / # export SHELL=3D/bin/sh
    2021-06-22T11:58:08.487760  export SHELL=3D/bin/sh
    2021-06-22T11:58:10.107344  / # . /lava-474280/environment
    2021-06-22T11:58:10.117841  [   26.696828] hwmon hwmon1: Undervoltage d=
etected!
    2021-06-22T11:58:10.118081  . /lava-474280/environment
    2021-06-22T11:58:13.067620  / # /lava-474280/bin/lava-test-runner /lava=
-474280/0 =

    ... (11 line(s) more)  =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1cff796b0960561413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1cff796b0960561413=
279
        failing since 232 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-nanopi-k2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d1ce614595a1e197413277

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/60d1ce614595a1e1=
9741327a
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)
        1 lines

    2021-06-22T11:49:37.844928  / # =

    2021-06-22T11:49:37.950380  #
    2021-06-22T11:49:38.052422  export SHELL=3D/bin/sh
    2021-06-22T11:49:38.052918  =

    2021-06-22T11:49:38.053192  / # #
    2021-06-22T11:49:38.154629  / # export SHELL=3D/bin/sh. /lava-474223/en=
vironment
    2021-06-22T11:49:38.256053  /lava-474223/bin/lava-test-runner /lava-474=
223/0
    2021-06-22T11:49:38.257661  =

    2021-06-22T11:49:38.257946  / # . /lava-474223/environment
    2021-06-22T11:49:38.268980  / # /lava-474223/bin/lava-test-runner /lava=
-474223/0 =

    ... (10 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d1ce614595a1e=
19741327c
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)
        2 lines

    2021-06-22T11:49:38.366509  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2021-06-22T11:49:38.398192  kern  :emerg : Code: 54fffd01 aa1b<8>[   16=
.754544] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dl=
ines MEASUREMENT=3D2>
    2021-06-22T11:49:38.398490  03e0 97f9<8>[   16.761719] <LAVA_SIGNAL_END=
RUN 0_dmesg 474223_1.5.2.4.1>
    2021-06-22T11:49:38.398755  7f80 17ffffe5 (d4210000) =

    2021-06-22T11:49:38.399007  + set +x   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-nanopi-k2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1d48eb363f7418b413289

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1d48eb363f7418b413=
28a
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1d693eb60b1f8c4413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1d693eb60b1f8c4413=
268
        failing since 11 days (last pass: renesas-devel-2021-05-27-v5.13-rc=
3, first fail: renesas-devel-2021-06-10-v5.13-rc5) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60d1d07ded9beb7cd44132d0

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60d1d07ded9beb7cd44132e8
        failing since 42 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-22T11:58:49.946816  /lava-4072951/1/../bin/lava-test-case
    2021-06-22T11:58:49.955098  <8>[   55.778094] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60d=
1d07ded9beb7cd44132ee
        failing since 42 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-22T11:58:50.048525  <8>[   55.870498] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-06-22T11:58:51.060450  /lava-4072951/1/../bin/lava-test-case
    2021-06-22T11:58:51.069313  <8>[   56.892192] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d1d21ae08d7bb381413266

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60d1d21ae08d7bb38141327e
        failing since 42 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-22T12:05:42.434304  /lava-4073041/1/../bin/lava-test-case
    2021-06-22T12:05:42.442508  <8>[   56.167196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60d=
1d21ae08d7bb381413284
        failing since 42 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-22T12:05:43.546891  /lava-4073041/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1ce7451039cb040413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1ce7451039cb040413=
267
        failing since 216 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1d87718d3ed25f64132af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1d87718d3ed25f6413=
2b0
        failing since 216 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1ce94288fff2609413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1ce94288fff2609413=
281
        failing since 216 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1d834ab962907c641327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1d834ab962907c6413=
27d
        failing since 216 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
