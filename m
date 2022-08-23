Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DD059DF53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 14:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239617AbiHWLRu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 07:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357772AbiHWLQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 07:16:38 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E1CBD1D2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 02:20:14 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id f17so6753971pfk.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=lVQymf3QWa8YkLTJNuI7eZOvstkEQ60mPpX3K+2FTh0=;
        b=qC3oCHw/OJviOk825/u52/DMI1zKR2y0ex9z2OJ87TdOfAphdtLfxYIala0Z9bkuVJ
         tHarW0r6tfayPHj6N8/vtLuMUGU6OtlsjLUTw8BLftL5Hmd7ednVbnAiWPSjmAOkQg66
         z0bJoY3EeNMIomW6FuI/DOK0PHE75piooVxmKpt9e1qNnX8ZX52EI1oW+Yheh6zaM6dg
         jLTqqSo5Ri1sznWg9GGx4h6sCmo4ntgA8PGfEaKu5PoY7J7t87Ksf3dPuJFQrpTho9eu
         C7AOcDPSIsm5EhOgnBg9Ux3yxTv+VMkufz7E25Bs0xYt3FODh9HwNjPER2Iu13kTeTZq
         aI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=lVQymf3QWa8YkLTJNuI7eZOvstkEQ60mPpX3K+2FTh0=;
        b=7ABbucCYSK8NkYMih2lfSALWl02D7vAL7Q+v7kT9LmkYeErj6ktsX/QweLL9uZx7lq
         duCPSOf+v8YGgxMy9zDp0ZFiQhJSO3Ub84k9CYQ3jnmB29zh6W4Um1iLMnZVGlEfTxQ9
         Kqaze7zpQTw4V8uLBw56FnPHOb+SZuRo00SKIZvj8CPSlNXsFSTEXV80wkjLheOLkG/I
         8iywv0Q6VxX8uRqyGMMKCyTWLha+537/u/oV4C+hCW58y9djYYYqWIMCUrfQTD84/miX
         giJIquEmGoyXYFeKfqlcdc0z2F6Q2nZHj4XMsZYPvjo78qpTc+4Wl0rOKZA3jkJJcZYJ
         D3NA==
X-Gm-Message-State: ACgBeo1mUw302gx37Yy8EU/ZVrDSQaLr3rqD6s8ZQ1yewy6a9vlBMYq5
        6W55mRE6kbWHR5Ww+wHHbK/2et501I2pn2IQ
X-Google-Smtp-Source: AA6agR4xDJwjnlGxmKb0mnkBhAEakSW/kbwJeAIUFyXKy0PQLOo+2IhUgrP/eGiIMGrVPLAi8HX0Hw==
X-Received: by 2002:a63:d1f:0:b0:422:7774:1969 with SMTP id c31-20020a630d1f000000b0042277741969mr19709304pgl.88.1661246413354;
        Tue, 23 Aug 2022 02:20:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j2-20020a63fc02000000b0041a615381d5sm8740356pgi.4.2022.08.23.02.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 02:20:11 -0700 (PDT)
Message-ID: <63049bcb.630a0220.895a.f19d@mx.google.com>
Date:   Tue, 23 Aug 2022 02:20:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-22-v6.0-rc1
Subject: renesas/next baseline: 404 runs,
 18 regressions (renesas-next-2022-08-22-v6.0-rc1)
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

renesas/next baseline: 404 runs, 18 regressions (renesas-next-2022-08-22-v6=
.0-rc1)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx7d-sdb             | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx7ulp-evk           | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+ima   =
             | 1          =

kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig+crypto=
             | 2          =

kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig       =
             | 2          =

kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig+ima   =
             | 2          =

qemu_arm-vexpress-a15 | arm   | lab-baylibre  | gcc-10   | vexpress_defconf=
ig           | 1          =

qemu_arm-vexpress-a15 | arm   | lab-broonie   | gcc-10   | vexpress_defconf=
ig           | 1          =

qemu_arm-vexpress-a15 | arm   | lab-collabora | gcc-10   | vexpress_defconf=
ig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-baylibre  | gcc-10   | vexpress_defconf=
ig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-broonie   | gcc-10   | vexpress_defconf=
ig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-collabora | gcc-10   | vexpress_defconf=
ig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-22-v6.0-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-22-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64f8982ca06974904942c8adfa51efd785044107 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx7d-sdb             | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630464767c1d4b2be8355672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630464767c1d4b2be8355=
673
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx7ulp-evk           | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630464e7f7029fefe535564e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630464e7f7029fefe5355=
64f
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6304650363acc5b35a35568f

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
04650363acc5b35a35569c
        failing since 76 days (last pass: renesas-next-2022-04-25-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1)

    2022-08-23T05:26:04.552023  /lava-158086/1/../bin/lava-test-case
    2022-08-23T05:26:04.552431  <8>[   19.024491] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+ima   =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/630467be791b1c8c55355652

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
0467be791b1c8c5535565f
        failing since 48 days (last pass: renesas-next-2022-04-25-v5.18-rc1=
, first fail: renesas-next-2022-07-05-v5.19-rc1)

    2022-08-23T05:37:52.762314  /lava-158103/1/../bin/lava-test-case
    2022-08-23T05:37:52.762615  <8>[   18.747729] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig+crypto=
             | 2          =


  Details:     https://kernelci.org/test/plan/id/6304611a47982e94c2355642

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/6304611a47982e94c2355654
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:09:26.092017  /lava-158067/1/../bin/lava-test-case
    2022-08-23T05:09:26.092320  <8>[   19.263555] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-23T05:09:26.092473  /lava-158067/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
4611a47982e94c2355656
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:09:27.130213  /lava-158067/1/../bin/lava-test-case
    2022-08-23T05:09:27.130509  <8>[   20.308081] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T05:09:27.130661  /lava-158067/1/../bin/lava-test-case
    2022-08-23T05:09:27.130802  <8>[   20.328160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-23T05:09:27.130943  /lava-158067/1/../bin/lava-test-case
    2022-08-23T05:09:27.131079  <8>[   20.348625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-23T05:09:27.131215  /lava-158067/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63046517e8c001f9f6355653

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/63046517e8c001f9f6355665
        failing since 7 days (last pass: renesas-next-2022-07-05-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:26:38.820293  /lava-158085/1/../bin/lava-test-case
    2022-08-23T05:26:38.820703  <8>[   20.108480] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-23T05:26:38.820971  /lava-158085/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
46517e8c001f9f6355667
        failing since 7 days (last pass: renesas-next-2022-07-05-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:26:39.857298  /lava-158085/1/../bin/lava-test-case
    2022-08-23T05:26:39.857959  <8>[   21.152566] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T05:26:39.858200  /lava-158085/1/../bin/lava-test-case
    2022-08-23T05:26:39.858408  <8>[   21.172434] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-23T05:26:39.858597  /lava-158085/1/../bin/lava-test-case
    2022-08-23T05:26:39.858780  <8>[   21.192685] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-23T05:26:39.858963  /lava-158085/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/6304658e81376bb6cb355679

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/6304658e81376bb6cb35568b
        new failure (last pass: renesas-next-2022-07-05-v5.19-rc1)

    2022-08-23T05:28:20.431954  /lava-158091/1/../bin/lava-test-case
    2022-08-23T05:28:20.432265  <8>[   19.337469] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-23T05:28:20.432467  /lava-158091/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
4658e81376bb6cb35568d
        new failure (last pass: renesas-next-2022-07-05-v5.19-rc1)

    2022-08-23T05:28:21.468394  /lava-158091/1/../bin/lava-test-case
    2022-08-23T05:28:21.468696  <8>[   20.381625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T05:28:21.468849  /lava-158091/1/../bin/lava-test-case
    2022-08-23T05:28:21.468992  <8>[   20.401522] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-23T05:28:21.469133  /lava-158091/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig+ima   =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/630467323910311b483556f3

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630467323910311b48355705
        failing since 7 days (last pass: renesas-next-2022-07-05-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:35:28.986303  /lava-158105/1/../bin/lava-test-case
    2022-08-23T05:35:28.986667  <8>[   19.324964] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
467323910311b48355707
        failing since 7 days (last pass: renesas-next-2022-07-05-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:35:30.024186  /lava-158105/1/../bin/lava-test-case
    2022-08-23T05:35:30.024814  <8>[   20.369322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T05:35:30.025072  /lava-158105/1/../bin/lava-test-case
    2022-08-23T05:35:30.025308  <8>[   20.389322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-23T05:35:30.025543  /lava-158105/1/../bin/lava-test-case
    2022-08-23T05:35:30.025791  <8>[   20.409826] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-23T05:35:30.026019  /lava-158105/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-vexpress-a15 | arm   | lab-baylibre  | gcc-10   | vexpress_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63046203422da59e26355665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63046203422da59e26355=
666
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-vexpress-a15 | arm   | lab-broonie   | gcc-10   | vexpress_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630462ff5100d7b5c7355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630462ff5100d7b5c7355=
643
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-vexpress-a15 | arm   | lab-collabora | gcc-10   | vexpress_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6304645a9b83c83f3a355654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_a=
rm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_a=
rm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6304645a9b83c83f3a355=
655
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-vexpress-a9  | arm   | lab-baylibre  | gcc-10   | vexpress_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63046202422da59e26355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63046202422da59e26355=
663
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-vexpress-a9  | arm   | lab-broonie   | gcc-10   | vexpress_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630462eba4a19cac8c355657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630462eba4a19cac8c355=
658
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-vexpress-a9  | arm   | lab-collabora | gcc-10   | vexpress_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6304643979ceae723135566a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_a=
rm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_a=
rm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6304643979ceae7231355=
66b
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =20
