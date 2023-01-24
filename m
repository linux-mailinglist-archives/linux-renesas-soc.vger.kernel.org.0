Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F63367A0A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 18:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbjAXR5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 12:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233778AbjAXR5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 12:57:05 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EBC4B187
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:56:58 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id o13so15824492pjg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kgX0t3KT0zKaiAhbVjP4uKO3rExgYyngUlBafMYG2ak=;
        b=qrqJCuaUUdnhyWuWHD4VTtFPR9e9uqB5qebDyzOXA9Lr29QdKXSJxjFzE0+iL6BRSM
         YkoZBqkCx7o9FbnRpELQAgG2n3ULLNT2xpl5ehlkFlHoHkJUNU1q51o+d+NPbwq5AxTO
         OiwdLDvgmHEOWKkDtSlolcAqQHT0dRXnN4SGCyNTHkiS58oB5P9hRmAlhmUpdVdTNiGx
         PtCeb9rHlsrnjvJlr3ovObNg1+eTpj+A6jpXV4rIwmmgZJD5SHfuUPWELL+LdTZFUie4
         Ljmi8UALCaP9Fc2i/zQnw+0WVLQUKE4n0qp9Pu9x1hfBMu7F6PeQ64DMiy3PEtZpNOSm
         7MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgX0t3KT0zKaiAhbVjP4uKO3rExgYyngUlBafMYG2ak=;
        b=MvFJlRCSGurBccjN2owIFXLyK41vMuBHo6ieB5z4qdf4IrpbCC9Ns9IQuDF1+r0Ahr
         s5u9rGwa/7IxB+ie6yGdwmMh47pLJx5AWtr+btJ3sZ8bW4aVSXf3uGJq+kpAhslHQaNN
         uxBm8urExavwodbpvTDma0y4/72VO+6HS1TzmM4YiI7ZgWh++iFluIIK+40Ji+HjxjE5
         nwFQsVOuhUHOmoSYBEijj6sXmRBQyjAmzMD58sauwueC8agZh72WOobhLh9wn4zGNwyV
         VYtEL++XkowYpOJQ58qkmM0S6YZla63IdIG4Kns9reUfknzx6Kuhc3rcmqQW5pFPn2va
         SiQg==
X-Gm-Message-State: AFqh2kr61oAhU6d1qo0phR7jR4KmDeinhvsfdOL/ZGTliBLk0nEn+lqI
        MBT6giwhLY/w6q/e3E6KwKWZ4xNCQIo67zhGYnw=
X-Google-Smtp-Source: AMrXdXs3MB1Fxek/jwfNRkvWCiD8XZ9/sfeuRKE3mwCNIGr8Prh7v/qP0tu8MaOQGYffZT0kiojh0w==
X-Received: by 2002:a17:902:a70f:b0:192:751d:b2e4 with SMTP id w15-20020a170902a70f00b00192751db2e4mr27521253plq.48.1674583018015;
        Tue, 24 Jan 2023 09:56:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b0019311ec702asm1974257plb.36.2023.01.24.09.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 09:56:57 -0800 (PST)
Message-ID: <63d01be9.170a0220.c2138.454b@mx.google.com>
Date:   Tue, 24 Jan 2023 09:56:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-24-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 511 runs,
 14 regressions (renesas-devel-2023-01-24-v6.2-rc5)
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

renesas/master baseline: 511 runs, 14 regressions (renesas-devel-2023-01-24=
-v6.2-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-24-v6.2-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-24-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f23ed7e4efa3e68c99d217f9dc00fc689c7e661d =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe05e73a346106c915ed7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm283=
5-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm283=
5-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfe05e73a346106c915edc
        new failure (last pass: renesas-devel-2023-01-16-v6.2-rc4)

    2023-01-24T13:42:30.366161  + set +x
    2023-01-24T13:42:30.369872  <8>[   17.221989] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 166580_1.5.2.4.1>
    2023-01-24T13:42:30.482422  / # #
    2023-01-24T13:42:30.584662  export SHELL=3D/bin/sh
    2023-01-24T13:42:30.585241  #
    2023-01-24T13:42:30.687121  / # export SHELL=3D/bin/sh. /lava-166580/en=
vironment
    2023-01-24T13:42:30.687693  =

    2023-01-24T13:42:30.789786  / # . /lava-166580/environment/lava-166580/=
bin/lava-test-runner /lava-166580/1
    2023-01-24T13:42:30.790775  =

    2023-01-24T13:42:30.797170  / # /lava-166580/bin/lava-test-runner /lava=
-166580/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe63f60fdd46540915f26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfe63f60fdd46540915f2b
        new failure (last pass: renesas-devel-2022-11-21-v6.1-rc6)

    2023-01-24T14:07:40.730023  <8>[   15.087937] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3200601_1.5.2.4.1>
    2023-01-24T14:07:40.836685  / # #
    2023-01-24T14:07:40.938140  export SHELL=3D/bin/sh
    2023-01-24T14:07:40.938494  #
    2023-01-24T14:07:41.039628  / # export SHELL=3D/bin/sh. /lava-3200601/e=
nvironment
    2023-01-24T14:07:41.039992  =

    2023-01-24T14:07:41.140957  / # . /lava-3200601/environment/lava-320060=
1/bin/lava-test-runner /lava-3200601/1
    2023-01-24T14:07:41.141543  =

    2023-01-24T14:07:41.141691  / # <3>[   15.448228] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-24T14:07:41.145326  /lava-3200601/bin/lava-test-runner /lava-32=
00601/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe6d00a8e28c7a9915f51

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfe6d00a8e28c7a9915f56
        new failure (last pass: renesas-devel-2022-11-21-v6.1-rc6)

    2023-01-24T14:10:04.286369  <8>[   16.590943] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3200604_1.5.2.4.1>
    2023-01-24T14:10:04.395550  / # #
    2023-01-24T14:10:04.497833  export SHELL=3D/bin/sh
    2023-01-24T14:10:04.498519  #
    2023-01-24T14:10:04.600294  / # export SHELL=3D/bin/sh. /lava-3200604/e=
nvironment
    2023-01-24T14:10:04.600992  =

    2023-01-24T14:10:04.702953  / # . /lava-3200604/environment/lava-320060=
4/bin/lava-test-runner /lava-3200604/1
    2023-01-24T14:10:04.704060  =

    2023-01-24T14:10:04.708584  / # /lava-3200604/bin/lava-test-runner /lav=
a-3200604/1
    2023-01-24T14:10:04.805200  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe931b95259ab5f915ef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubi=
etruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubi=
etruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfe931b95259ab5f915ef8
        new failure (last pass: renesas-devel-2022-11-21-v6.1-rc6)

    2023-01-24T14:20:05.494091  <8>[   14.951154] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3200690_1.5.2.4.1>
    2023-01-24T14:20:05.602516  / # #
    2023-01-24T14:20:05.704229  export SHELL=3D/bin/sh
    2023-01-24T14:20:05.704654  #
    2023-01-24T14:20:05.805894  / # export SHELL=3D/bin/sh. /lava-3200690/e=
nvironment
    2023-01-24T14:20:05.806316  =

    2023-01-24T14:20:05.907572  / # . /lava-3200690/environment/lava-320069=
0/bin/lava-test-runner /lava-3200690/1
    2023-01-24T14:20:05.908471  =

    2023-01-24T14:20:05.912949  / # /lava-3200690/bin/lava-test-runner /lav=
a-3200690/1
    2023-01-24T14:20:06.005582  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfea5ccf60b7642e915ed5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfea5ccf60b7642e915eda
        new failure (last pass: renesas-devel-2022-11-21-v6.1-rc6)

    2023-01-24T14:25:16.740975  <8>[   24.658584] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3200740_1.5.2.4.1>
    2023-01-24T14:25:16.848441  / # #
    2023-01-24T14:25:16.950167  export SHELL=3D/bin/sh
    2023-01-24T14:25:16.950688  #
    2023-01-24T14:25:17.052324  / # export SHELL=3D/bin/sh. /lava-3200740/e=
nvironment
    2023-01-24T14:25:17.052774  =

    2023-01-24T14:25:17.153954  / # . /lava-3200740/environment/lava-320074=
0/bin/lava-test-runner /lava-3200740/1
    2023-01-24T14:25:17.154575  =

    2023-01-24T14:25:17.159238  / # /lava-3200740/bin/lava-test-runner /lav=
a-3200740/1
    2023-01-24T14:25:17.248153  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfebd569dc83aaa1915ec0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfebd569dc83aaa1915ec5
        new failure (last pass: renesas-devel-2022-11-21-v6.1-rc6)

    2023-01-24T14:31:25.482229  <8>[   14.463762] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3200777_1.5.2.4.1>
    2023-01-24T14:31:25.588789  / # #
    2023-01-24T14:31:25.690281  export SHELL=3D/bin/sh
    2023-01-24T14:31:25.690663  #
    2023-01-24T14:31:25.791866  / # export SHELL=3D/bin/sh. /lava-3200777/e=
nvironment
    2023-01-24T14:31:25.792225  =

    2023-01-24T14:31:25.893396  / # . /lava-3200777/environment/lava-320077=
7/bin/lava-test-runner /lava-3200777/1
    2023-01-24T14:31:25.895265  =

    2023-01-24T14:31:25.899459  / # /lava-3200777/bin/lava-test-runner /lav=
a-3200777/1
    2023-01-24T14:31:25.991108  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe7cbbd9f0053b5915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfe7cbbd9f0053b5915ebe
        new failure (last pass: renesas-devel-2023-01-16-v6.2-rc4)

    2023-01-24T14:14:08.872707  + set[   27.249697] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 886273_1.5.2.3.1>
    2023-01-24T14:14:08.872916   +x
    2023-01-24T14:14:08.978680  / # #
    2023-01-24T14:14:09.080220  export SHELL=3D/bin/sh
    2023-01-24T14:14:09.080666  #
    2023-01-24T14:14:09.181934  / # export SHELL=3D/bin/sh. /lava-886273/en=
vironment
    2023-01-24T14:14:09.182382  =

    2023-01-24T14:14:09.283638  / # . /lava-886273/environment/lava-886273/=
bin/lava-test-runner /lava-886273/1
    2023-01-24T14:14:09.284395  =

    2023-01-24T14:14:09.287559  / # /lava-886273/bin/lava-test-runner /lava=
-886273/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe5feda62a6b1cd915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfe5feda62a6b1cd915=
ecd
        failing since 134 days (last pass: renesas-devel-2022-07-05-v5.19-r=
c5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe6eff14b4393d5915ede

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfe6eff14b4393d5915=
edf
        failing since 134 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe6d21a7915999891601b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfe6d21a79159998916=
01c
        failing since 269 days (last pass: renesas-devel-2022-04-13-v5.18-r=
c2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfec80c0ce933792915ed6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-=
uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-=
uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfec80c0ce933792915edb
        failing since 15 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-09-v6.2-rc3)

    2023-01-24T14:34:31.942974  <8>[  105.465231] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 166726_1.5.2.4.1>
    2023-01-24T14:34:32.050879  / # #
    2023-01-24T14:34:32.153753  export SHELL=3D/bin/sh
    2023-01-24T14:34:32.154528  #
    2023-01-24T14:34:32.256436  / # export SHELL=3D/bin/sh. /lava-166726/en=
vironment
    2023-01-24T14:34:32.257230  =

    2023-01-24T14:34:32.359180  / # . /lava-166726/environment/lava-166726/=
bin/lava-test-runner /lava-166726/1
    2023-01-24T14:34:32.360458  =

    2023-01-24T14:34:32.374648  / # /lava-166726/bin/lava-test-runner /lava=
-166726/1
    2023-01-24T14:34:32.440626  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (41 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe40293f0106677915ef1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfe40293f0106677915=
ef2
        new failure (last pass: renesas-devel-2022-10-24-v6.1-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe0fd0397873f5f915eeb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfe0fd0397873f5f915=
eec
        failing since 98 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe38e29a595590a915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfe38e29a595590a915=
ecd
        failing since 11 days (last pass: renesas-devel-2023-01-09-v6.2-rc3=
, first fail: renesas-devel-2023-01-12-v6.2-rc3) =

 =20
