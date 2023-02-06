Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E598968C571
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Feb 2023 19:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjBFSK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Feb 2023 13:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjBFSKG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2023 13:10:06 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078332279E
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Feb 2023 10:10:02 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id iy2so2885863plb.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Feb 2023 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=URGqDtAB9EW9zy28Wkn7raDi7nJgxtgzl7KgU+WDqTo=;
        b=wqqPZClcZ7HcMmIRCj/RJTXN2Ioy/xBdq/v184L+UP05BKP0a7nx+H8J8eH6QOvnAl
         OXmpXAgNCRd7XyTFWfnG+g5TKC5XsOd7zDP8405BxLU2yiUMaRe4bofkoJnTz/KjbS66
         erZcYdIAm2Xofgp2uGldNnSDDUSgwdPfKBGeIc5IqGK0psVUau0+ngDAMhIXEFPecFqJ
         Oxc7iYJ1gQbQze3kM/OykFBbueG4H491KKIdH+1GDaQCKH8Aox6DTaAOiPzfBdMas0Ju
         1hnnX030FTMIuzKiTo9QgsAVDwRhWvtxI+CyFLCN21a9MOiltWHbXoj+OxrBAi6HApYR
         sxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URGqDtAB9EW9zy28Wkn7raDi7nJgxtgzl7KgU+WDqTo=;
        b=4KVJIVH72I623p8My3WJnYqtj1C/9B3U+N6gnYp0PGHp/UlckecM3+msePAYRTuTUO
         aDMMcXZBe8+MnRWdBByGu+Tg+GOVAyVla0Ornr42shEbeMzBrkIbl2xiq/87xkibed5E
         AvOoHYnfLv3yfC4IudiXgAZvkI93ZmGCiDdhq3vIWb60SHFivo8IOIgj/d7TUjNcxJM4
         3vYunss53vWfwAN/A8lawRAqHL81SEMjs8VbdUACbSE8tF3qii7UWAMSqHdYvKCPom+Y
         +BQqVaZOKiH8lzcHw9QM2pQXSfpcWMLTFe2n716LLxU3yBxDDgrwp17ypuwo6mYMhyJ1
         JuQw==
X-Gm-Message-State: AO0yUKXMrZokMu7Z4CNTsY0uEk6GJ4TEhYXR+iX53jktq+riFQOa3boB
        Ut+hzOJRjDo4fyfMxuiBsFjs8/6S0lwwNwOVVRE=
X-Google-Smtp-Source: AK7set86yixO+lSjso+jVr7wEyFJUhfwD8rzisHKeabR+mzSoBZjU9o4vwO2hfZS9HvtpXgIL8SgLA==
X-Received: by 2002:a05:6a21:78a4:b0:be:9fff:48d8 with SMTP id bf36-20020a056a2178a400b000be9fff48d8mr27023449pzc.49.1675707000658;
        Mon, 06 Feb 2023 10:10:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i137-20020a636d8f000000b004b4d4de54absm6431481pgc.59.2023.02.06.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:10:00 -0800 (PST)
Message-ID: <63e14278.630a0220.83285.a711@mx.google.com>
Date:   Mon, 06 Feb 2023 10:10:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-02-06-v6.2-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 535 runs,
 32 regressions (renesas-devel-2023-02-06-v6.2-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 535 runs, 32 regressions (renesas-devel-2023-02-06=
-v6.2-rc7)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-06-v6.2-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-06-v6.2-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3254c086a1ff58a54773d12eb58e0210601e352f =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10e10474608ac249161c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91=
-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91=
-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10e10474608ac24916=
1c4
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10f90a4097a62b5915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10f90a4097a62b5915=
ebe
        failing since 10 days (last pass: renesas-devel-2023-01-24-v6.2-rc5=
, first fail: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10c05ce36a545cd915f0f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10c05ce36a545cd915f14
        failing since 13 days (last pass: renesas-devel-2022-11-21-v6.1-rc6=
, first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-02-06T14:17:30.798547  <8>[   15.314425] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3296845_1.5.2.4.1>
    2023-02-06T14:17:30.907679  / # #
    2023-02-06T14:17:31.009125  export SHELL=3D/bin/sh
    2023-02-06T14:17:31.009485  #
    2023-02-06T14:17:31.110619  / # export SHELL=3D/bin/sh. /lava-3296845/e=
nvironment
    2023-02-06T14:17:31.110998  =

    2023-02-06T14:17:31.212069  / # . /lava-3296845/environment/lava-329684=
5/bin/lava-test-runner /lava-3296845/1
    2023-02-06T14:17:31.212791  =

    2023-02-06T14:17:31.213017  / # <3>[   15.688353] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-06T14:17:31.217661  /lava-3296845/bin/lava-test-runner /lava-32=
96845/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10d71afe00f7bef915f5c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10d71afe00f7bef915f61
        failing since 12 days (last pass: renesas-devel-2022-11-21-v6.1-rc6=
, first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-02-06T14:23:14.675041  <8>[   24.651797] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3296892_1.5.2.4.1>
    2023-02-06T14:23:14.784177  / # #
    2023-02-06T14:23:14.885661  export SHELL=3D/bin/sh
    2023-02-06T14:23:14.886583  #
    2023-02-06T14:23:14.991049  / # export SHELL=3D/bin/sh. /lava-3296892/e=
nvironment
    2023-02-06T14:23:14.992158  =

    2023-02-06T14:23:15.094881  / # . /lava-3296892/environment/lava-329689=
2/bin/lava-test-runner /lava-3296892/1
    2023-02-06T14:23:15.096527  =

    2023-02-06T14:23:15.100954  / # /lava-3296892/bin/lava-test-runner /lav=
a-3296892/1
    2023-02-06T14:23:15.200439  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10e0e474608ac2491616b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10e0e474608ac24916170
        failing since 12 days (last pass: renesas-devel-2022-11-21-v6.1-rc6=
, first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-02-06T14:26:00.328373  <8>[   14.526803] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3296905_1.5.2.4.1>
    2023-02-06T14:26:00.440989  / # #
    2023-02-06T14:26:00.543014  export SHELL=3D/bin/sh
    2023-02-06T14:26:00.543709  #
    2023-02-06T14:26:00.544009  / # export SHELL=3D/bin/sh<3>[   14.730373]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-02-06T14:26:00.646247  . /lava-3296905/environment
    2023-02-06T14:26:00.647154  =

    2023-02-06T14:26:00.749724  / # . /lava-3296905/environment/lava-329690=
5/bin/lava-test-runner /lava-3296905/1
    2023-02-06T14:26:00.750455  =

    2023-02-06T14:26:00.757832  / # /lava-3296905/bin/lava-test-runner /lav=
a-3296905/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10ea2f5d0c93352915ee3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubi=
etruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubi=
etruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10ea2f5d0c93352915ee8
        failing since 13 days (last pass: renesas-devel-2022-11-21-v6.1-rc6=
, first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-02-06T14:28:20.983255  <8>[   15.285396] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3296935_1.5.2.4.1>
    2023-02-06T14:28:21.092649  / # #
    2023-02-06T14:28:21.196015  export SHELL=3D/bin/sh
    2023-02-06T14:28:21.196994  #
    2023-02-06T14:28:21.299091  / # export SHELL=3D/bin/sh. /lava-3296935/e=
nvironment
    2023-02-06T14:28:21.300018  =

    2023-02-06T14:28:21.401781  / # . /lava-3296935/environment/lava-329693=
5/bin/lava-test-runner /lava-3296935/1
    2023-02-06T14:28:21.402326  <3>[   15.608660] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-02-06T14:28:21.402467  =

    2023-02-06T14:28:21.407166  / # /lava-3296935/bin/lava-test-runner /lav=
a-3296935/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e110d91a4517bb7e915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e110d91a4517bb7e915ec9
        failing since 13 days (last pass: renesas-devel-2022-11-21-v6.1-rc6=
, first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-02-06T14:37:55.295508  <8>[   16.666448] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3297137_1.5.2.4.1>
    2023-02-06T14:37:55.405820  / # #
    2023-02-06T14:37:55.508846  export SHELL=3D/bin/sh
    2023-02-06T14:37:55.509695  #
    2023-02-06T14:37:55.611628  / # export SHELL=3D/bin/sh. /lava-3297137/e=
nvironment
    2023-02-06T14:37:55.612536  =

    2023-02-06T14:37:55.714597  / # . /lava-3297137/environment/lava-329713=
7/bin/lava-test-runner /lava-3297137/1
    2023-02-06T14:37:55.716205  =

    2023-02-06T14:37:55.720336  / # /lava-3297137/bin/lava-test-runner /lav=
a-3297137/1
    2023-02-06T14:37:55.801869  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10a703ab9b69584915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10a703ab9b69584915ebe
        failing since 7 days (last pass: v6.1-rc8-929-g112502470f50, first =
fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-06T14:10:35.098398  + set +x
    2023-02-06T14:10:35.098581  [   12.950693] <LAVA_SIGNAL_ENDRUN 0_dmesg =
899299_1.5.2.3.1>
    2023-02-06T14:10:35.206019  / # #
    2023-02-06T14:10:35.307714  export SHELL=3D/bin/sh
    2023-02-06T14:10:35.308273  #
    2023-02-06T14:10:35.409610  / # export SHELL=3D/bin/sh. /lava-899299/en=
vironment
    2023-02-06T14:10:35.410086  =

    2023-02-06T14:10:35.511538  / # . /lava-899299/environment/lava-899299/=
bin/lava-test-runner /lava-899299/1
    2023-02-06T14:10:35.512437  =

    2023-02-06T14:10:35.515272  / # /lava-899299/bin/lava-test-runner /lava=
-899299/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10b10c3c2dcbad7915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10b10c3c2dcbad7915ed0
        failing since 7 days (last pass: v6.1-rc8-929-g112502470f50, first =
fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-06T14:13:18.514363  + set +x
    2023-02-06T14:13:18.514647  [   16.229005] <LAVA_SIGNAL_ENDRUN 0_dmesg =
899308_1.5.2.3.1>
    2023-02-06T14:13:18.622757  / # #
    2023-02-06T14:13:18.724510  export SHELL=3D/bin/sh
    2023-02-06T14:13:18.725423  #
    2023-02-06T14:13:18.827151  / # export SHELL=3D/bin/sh. /lava-899308/en=
vironment
    2023-02-06T14:13:18.827924  =

    2023-02-06T14:13:18.929507  / # . /lava-899308/environment/lava-899308/=
bin/lava-test-runner /lava-899308/1
    2023-02-06T14:13:18.930211  =

    2023-02-06T14:13:18.933676  / # /lava-899308/bin/lava-test-runner /lava=
-899308/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10b9c8f33c3c98d915f11

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10b9c8f33c3c98d915f16
        failing since 7 days (last pass: v6.1-rc8-929-g112502470f50, first =
fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-06T14:15:34.386621  + set +x
    2023-02-06T14:15:34.386929  [   12.555982] <LAVA_SIGNAL_ENDRUN 0_dmesg =
899317_1.5.2.3.1>
    2023-02-06T14:15:34.494506  / # #
    2023-02-06T14:15:34.596152  export SHELL=3D/bin/sh
    2023-02-06T14:15:34.596709  #
    2023-02-06T14:15:34.698014  / # export SHELL=3D/bin/sh. /lava-899317/en=
vironment
    2023-02-06T14:15:34.698447  =

    2023-02-06T14:15:34.799682  / # . /lava-899317/environment/lava-899317/=
bin/lava-test-runner /lava-899317/1
    2023-02-06T14:15:34.800245  =

    2023-02-06T14:15:34.803501  / # /lava-899317/bin/lava-test-runner /lava=
-899317/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10becd7b5ca44f4915eec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10becd7b5ca44f4915ef1
        failing since 7 days (last pass: v6.1-rc8-929-g112502470f50, first =
fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-06T14:16:55.172120  + set +x
    2023-02-06T14:16:55.172421  [   12.921951] <LAVA_SIGNAL_ENDRUN 0_dmesg =
899321_1.5.2.3.1>
    2023-02-06T14:16:55.279927  / # #
    2023-02-06T14:16:55.382057  export SHELL=3D/bin/sh
    2023-02-06T14:16:55.382861  #
    2023-02-06T14:16:55.483942  / # export SHELL=3D/bin/sh. /lava-899321/en=
vironment
    2023-02-06T14:16:55.484476  =

    2023-02-06T14:16:55.586067  / # . /lava-899321/environment/lava-899321/=
bin/lava-test-runner /lava-899321/1
    2023-02-06T14:16:55.586725  =

    2023-02-06T14:16:55.590267  / # /lava-899321/bin/lava-test-runner /lava=
-899321/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10e6ce530672f10915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10e6ce530672f10915ed0
        failing since 7 days (last pass: v6.1-rc8-929-g112502470f50, first =
fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-06T14:27:37.992942  + set +x
    2023-02-06T14:27:37.993129  [   11.953703] <LAVA_SIGNAL_ENDRUN 0_dmesg =
899345_1.5.2.3.1>
    2023-02-06T14:27:38.099609  / # #
    2023-02-06T14:27:38.201513  export SHELL=3D/bin/sh
    2023-02-06T14:27:38.202017  #
    2023-02-06T14:27:38.303278  / # export SHELL=3D/bin/sh. /lava-899345/en=
vironment
    2023-02-06T14:27:38.303811  =

    2023-02-06T14:27:38.405156  / # . /lava-899345/environment/lava-899345/=
bin/lava-test-runner /lava-899345/1
    2023-02-06T14:27:38.405805  =

    2023-02-06T14:27:38.408879  / # /lava-899345/bin/lava-test-runner /lava=
-899345/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10d65d6de9234dc915ee3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10d65d6de9234dc915=
ee4
        failing since 147 days (last pass: renesas-devel-2022-07-05-v5.19-r=
c5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10d15dab7c17663915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10d15dab7c17663915=
ec9
        failing since 147 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10ddb58a9775170915ef1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10ddb58a9775170915=
ef2
        failing since 282 days (last pass: renesas-devel-2022-04-13-v5.18-r=
c2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63e10dc917c57f4b0b915ec7

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e10dc917c57f4b0b915eca
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-06T14:24:53.447796  / # #
    2023-02-06T14:24:53.549704  export SHELL=3D/bin/sh
    2023-02-06T14:24:53.550243  #
    2023-02-06T14:24:53.651779  / # export SHELL=3D/bin/sh. /lava-266776/en=
vironment
    2023-02-06T14:24:53.652337  =

    2023-02-06T14:24:53.753701  / # . /lava-266776/environment/lava-266776/=
bin/lava-test-runner /lava-266776/1
    2023-02-06T14:24:53.754431  =

    2023-02-06T14:24:53.759985  / # /lava-266776/bin/lava-test-runner /lava=
-266776/1
    2023-02-06T14:24:53.824868  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-06T14:24:53.825225  + cd /l<8>[   15.598302] <LAVA_SIGNAL_START=
RUN 1_bootrr 266776_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63e=
10dc917c57f4b0b915eda
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-06T14:24:57.885353  /lava-266776/1/../bin/lava-test-case
    2023-02-06T14:24:57.885765  <8>[   19.823368] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-02-06T14:24:57.886009  /lava-266776/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10c5ae191c3beb3915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10c5ae191c3beb3915=
ebb
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10c85b9cb72adce915edb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10c85b9cb72adce915=
edc
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63e118e22f65c20470915edb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e118e22f65c20=
470915ee2
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5)
        2 lines

    2023-02-06T15:12:20.969211  :alert : Mem abort info:
    2023-02-06T15:12:20.970319  kern  :alert :   ESR =3D 0x0000000096000045
    2023-02-06T15:12:20.971400  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-02-06T15:12:20.972393  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-02-06T15:12:20.973466  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-02-06T15:12:20.974993  kern  :alert :<8>[   48.373313] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-02-06T15:12:20.976073     FSC =3D 0x05: <8>[   48.381625] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 3297245_1.5.2.4.1>
    2023-02-06T15:12:20.977134  level 1 translation fault
    2023-02-06T15:12:20.978191  kern  :alert : Data abort info:
    2023-02-06T15:12:20.979312  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
045   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63e118e22f65c20=
470915ee3
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5)
        12 lines =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10ef853839e638e915ec3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10ef853839e638e915=
ec4
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10e12474608ac249161c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10e12474608ac24916=
1c7
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10c5be191c3beb3915ebf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-m=
eson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10c5be191c3beb3915=
ec0
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10911e34577924a915ed4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10911e34577924a915=
ed5
        failing since 111 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e1111e4f35c3ec91915f8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e1111e4f35c3ec91915=
f8b
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e11049259e45916c915ec6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e11049259e45916c915=
ec7
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63e12e87996d6a6973915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e12e87996d6a6973915=
ee0
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10ed412bf0a5fb4915f39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10ed412bf0a5fb4915=
f3a
        failing since 35 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10ce1dab7c17663915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10ce1dab7c17663915=
ebe
        failing since 35 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e11044670ad71b5e915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e11044670ad71b5e915=
ebb
        failing since 100 days (last pass: renesas-devel-2022-10-03-v6.0, f=
irst fail: renesas-devel-2022-10-28-v6.1-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10f23a736f6073f915f23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e10f23a736f6073f915=
f24
        failing since 33 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
