Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0CBB595DBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbiHPNuw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 09:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235699AbiHPNuo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 09:50:44 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06AACA2223
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:50:31 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id p125so9396773pfp.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=Mx+95pRb1OqHRtAkxo9RlMFEHCOLYWVw/JLvxMW3nsg=;
        b=vEpapA02viZAmmGn86DmCVa7Wp8mcg8prKBJCoKpzo19+ENTd3YPXpbJT1nqM9ptRr
         5luQiG0pe0xxq7dqhAR/o/VtdsgKHgBS3iMpkZ0ILFKCCayHWpK+IycNJsGhmNAsrJYM
         GiRZYSVKZ4AXaUNha8HJ1uiGfjcjW5fdkE7wNDc9PbH5cefpDtQmxf547nDMKilY/cwI
         TBmaXMbjvAwwyHAavhtLnzT3nybgasddEdT57XQdAJ6N7H+p1qolnFGOxw/z/HTfdKby
         vbHblBBlSGGjVvE5R4tYQiztH7wf8gCWw21iPszzsFCT+oVCU/2KE1d5CZo4194D5cMv
         IJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=Mx+95pRb1OqHRtAkxo9RlMFEHCOLYWVw/JLvxMW3nsg=;
        b=mV61l2GiQWgz4ceVzXXJ+2IvrXZEUMsyNTsjJuNXDab5jKXiU1wEKiBnYgBfFBY55o
         BoL7ogtqbP7xzH8Jw4DMDdM/v1HWkz4Rg8Z/MRYv3/zSisbfVOnW98sCwVmNsHm65/gr
         zs3lduNtcXwGZ0J7tBvVZAFIHdf4VOBqXM7Lyh0ZN8o6/s6fuD54Zt0WumcWsmn//K5r
         wtu/cFoAcztMUrqhBY0Axc3EaKQaGFSCi/ayF2nUN55H20y5hsQjoi5ZMeSzfNkrK87Z
         RQabcWBGOwaxE6aOwAaK9ij4T+D6k7ogFhWFLCZW7BwOgzBUsVMfVA3miGYgBphJfQsC
         a3FQ==
X-Gm-Message-State: ACgBeo0J9FBY5gAjv67bsm7hsZC2EWXCkTKjH1NW9ssBRmZ1TWRwTQ3j
        K9c6JJGFh+Hw3vkt9Ba7EK6YX/ICmK8SS4cX
X-Google-Smtp-Source: AA6agR55HqeyQuDou0IoX/0vqr67JooZo6M8TGJTwb4glqJurx6pX0H+ennbJebHz/CJ1ms1Xmsu3Q==
X-Received: by 2002:a63:82c6:0:b0:41c:d253:a446 with SMTP id w189-20020a6382c6000000b0041cd253a446mr17379032pgd.125.1660657830451;
        Tue, 16 Aug 2022 06:50:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s15-20020a63ff4f000000b0040cb1f55391sm7654646pgk.2.2022.08.16.06.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 06:50:30 -0700 (PDT)
Message-ID: <62fba0a6.630a0220.fa1d0.c26a@mx.google.com>
Date:   Tue, 16 Aug 2022 06:50:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-16-v6.0-rc1
Subject: renesas/next baseline: 208 runs,
 14 regressions (renesas-next-2022-08-16-v6.0-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 208 runs, 14 regressions (renesas-next-2022-08-16-v6=
.0-rc1)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

jetson-tk1            | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 1          =

kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 2          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

qemu_arm-vexpress-a15 | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a15 | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-16-v6.0-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-16-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      328413c2bd85d7011cd71072902a43c448b71f59 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6d2bbb733c7d953556bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb6d2bbb733c7d95355=
6bc
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb77bc86617ac794355684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb77bc86617ac794355=
685
        failing since 69 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
-14-g0940300f8e1d, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
jetson-tk1            | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb8553d08a9ba910355664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb8553d08a9ba910355=
665
        failing since 69 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6a9c684ad7ad1c35564c

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
fb6a9c684ad7ad1c355655
        failing since 69 days (last pass: renesas-next-2022-04-25-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1)

    2022-08-16T09:59:38.652805  /lava-155280/1/../bin/lava-test-case
    2022-08-16T09:59:38.653184  <8>[   19.920816] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6cf4a7ea01ac383556d7

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
fb6cf4a7ea01ac383556e0
        failing since 41 days (last pass: renesas-next-2022-04-25-v5.18-rc1=
, first fail: renesas-next-2022-07-05-v5.19-rc1)

    2022-08-16T10:09:35.926921  /lava-155288/1/../bin/lava-test-case
    2022-08-16T10:09:35.927284  <8>[   19.601726] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-08-16T10:09:35.927518  /lava-155288/1/../bin/lava-test-case
    2022-08-16T10:09:35.927731  <8>[   19.617894] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-08-16T10:09:35.927932  /lava-155288/1/../bin/lava-test-case
    2022-08-16T10:09:35.928126  <8>[   19.633584] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-08-16T10:09:35.928334  /lava-155288/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62fb6c7cd251a382e8355644

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fb6c7cd251a382e8355652
        failing since 0 day (last pass: renesas-next-2022-07-05-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-16T10:07:48.354528  /lava-155278/1/../bin/lava-test-case
    2022-08-16T10:07:48.354901  <8>[   19.342287] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-16T10:07:48.355151  /lava-155278/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
b6c7cd251a382e8355654
        failing since 0 day (last pass: renesas-next-2022-07-05-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-16T10:07:49.393709  /lava-155278/1/../bin/lava-test-case
    2022-08-16T10:07:49.394372  <8>[   20.386386] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-16T10:07:49.394687  /lava-155278/1/../bin/lava-test-case
    2022-08-16T10:07:49.394946  <8>[   20.406411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-16T10:07:49.395180  /lava-155278/1/../bin/lava-test-case
    2022-08-16T10:07:49.395406  <8>[   20.426775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-16T10:07:49.395631  /lava-155278/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/62fb6d0a7f74db3107355645

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fb6d0a7f74db3107355653
        failing since 0 day (last pass: renesas-next-2022-07-05-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-16T10:09:53.320174  /lava-155290/1/../bin/lava-test-case
    2022-08-16T10:09:53.320547  <8>[   19.405970] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-16T10:09:53.320789  /lava-155290/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
b6d0a7f74db3107355655
        failing since 0 day (last pass: renesas-next-2022-07-05-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-16T10:09:54.358083  /lava-155290/1/../bin/lava-test-case
    2022-08-16T10:09:54.358477  <8>[   20.450348] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-16T10:09:54.358734  /lava-155290/1/../bin/lava-test-case
    2022-08-16T10:09:54.358962  <8>[   20.470256] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb749428541a2141355663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pan=
da.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb749428541a2141355=
664
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb68560c7ee0783a35564f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb68560c7ee0783a355=
650
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6baad255c28d6b355647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb6baad255c28d6b355=
648
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6855d0218e618c355676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb6855d0218e618c355=
677
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6b96b16701049f35564d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb6b96b16701049f355=
64e
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =20
