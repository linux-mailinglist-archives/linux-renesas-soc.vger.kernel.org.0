Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471E74C5465
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Feb 2022 08:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiBZH3D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Feb 2022 02:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiBZH3C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Feb 2022 02:29:02 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A7D140C9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 23:28:27 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 195so6702520pgc.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 23:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nJSNW3m8Y7/KuphnV5L1QBFfdL1+hZTxsVcdd79XSpQ=;
        b=4tmmsAm0slhGM4JxuZ6oypWDbxifdij3stgIVkxIcZrdj18lIT4683B5x7WuDaL2S3
         +tPFP36mBV1nsLNBmUsnQwdjWONykGZf0ONX2rkpEswMUW4FHUYCVZUvdCEvPUYY9s0f
         qs8wJ7wGXT07faXBHZPa+CqYtIrKWFkXePeZDWs57NQh51GeoRF/zE53bBuzm4MQy/QT
         tkQiuBOx3AOO3mMfpPMDQnQOITvrHzbbnv4fAflYfd3NoAKPCBUjutFsStWqEkazeXcb
         0DGrefodOcbb/F7h6bHSbV8sH41h7T9rmS1o/DypXVyS5Oz6bjvX5LAVpFuW+GUyq237
         YrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nJSNW3m8Y7/KuphnV5L1QBFfdL1+hZTxsVcdd79XSpQ=;
        b=yqgZOmG8PrHXRMhjtFLHTH6MjiT1cLEJDnbq1aQGeuJb8IK+wVmF9JUrBlJFJLSw+c
         w0JvnwY9aDouGqMTWd1+38IF4tz/LTJWwkkbOhtFm0482bQAcTVvMmrY1nWRvR4T3vIw
         f0Gv4+iliNRsKEQP+be/5S/+my0Pu8KIOU3RDzM9nQ+D9PAgFArrn+NTCMLg6007tjVo
         rCTpV11i0b0nDqNRWUZgSo65aPxxgpUzrRLYIvJfoUS69QX1cSiq9+20rRsNms+e/N2y
         yKI0Ie/WSsbX45f/z8eymOy5yT6u4fW6IyFZ3yS5hcSTtmGG7rQEhLg9SILUa6UyleEI
         O0sA==
X-Gm-Message-State: AOAM530jQLaPoMsxEcraBA5m1eM1eiYy2I4w+u+6kFoiIHWPRQ+ZFFK1
        D7SMqs4qRkItT7O3EoDSFER3V30QBJZZEwnxRyw=
X-Google-Smtp-Source: ABdhPJwy2c5YrACZtvmAJBLqq3ZWmeESdMDXdgqOFemoEd0FzIBe3yH5NPZ3d+CMf2Sd6l9hitSIug==
X-Received: by 2002:a63:7a16:0:b0:374:90d4:b31 with SMTP id v22-20020a637a16000000b0037490d40b31mr9355457pgc.273.1645860506215;
        Fri, 25 Feb 2022 23:28:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lk9-20020a17090b33c900b001bc7c2dfcdbsm4508024pjb.37.2022.02.25.23.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 23:28:25 -0800 (PST)
Message-ID: <6219d699.1c69fb81.14b3.be9d@mx.google.com>
Date:   Fri, 25 Feb 2022 23:28:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-25-v5.17-rc1
Subject: renesas/next baseline: 253 runs,
 29 regressions (renesas-next-2022-02-25-v5.17-rc1)
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

renesas/next baseline: 253 runs, 29 regressions (renesas-next-2022-02-25-v5=
.17-rc1)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx8mn-ddr4-evk        | arm64 | lab-baylibre  | gcc-10   | defconfig      =
              | 2          =

imx8mn-ddr4-evk        | arm64 | lab-baylibre  | gcc-10   | defconfig+crypt=
o             | 2          =

imx8mn-ddr4-evk        | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
              | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+crypt=
o             | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-25-v5.17-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-25-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dff7b84b4d2a5df4fb98714257adbb539807d7b9 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6219a03ac5fae008bdc6299a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6219a03ac5fae008bdc62=
99b
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-baylibre  | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/62199ea5597e0d2692c629d0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62199ea5597e0d2=
692c629d4
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-26T03:29:27.784795  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   10.867778] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-02-26T03:29:27.786151  at virtual address 0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62199ea5597e0d2=
692c629d5
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-26T03:29:27.791326  kern  :alert : Mem abort info:
    2022-02-26T03:29:27.792421  kern  :alert :   ESR =3D 0x96000006
    2022-02-26T03:29:27.793520  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-26T03:29:27.794684  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-26T03:29:27.795767  kern  :alert :   EA<8>[   10.893308] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-26T03:29:27.796854   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-baylibre  | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/62199f59dbe56685b8c629c7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62199f59dbe5668=
5b8c629cb
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        12 lines

    2022-02-26T03:32:21.943600  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   10.903356] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-26T03:32:21.944993  0000
    2022-02-26T03:32:21.946317  kern  :alert : Mem abort info:
    2022-02-26T03:32:21.947471  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62199f59dbe5668=
5b8c629cc
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        2 lines

    2022-02-26T03:32:21.953586  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-26T03:32:21.954806  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-26T03:32:21.955900  kern  :alert :   EA<8>[   10.930736] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-26T03:32:21.956999   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6219a0718f0763b92fc62990

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6219a0718f0763b=
92fc62994
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-26T03:36:54.978049  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   10.939899] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-26T03:36:54.979541  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6219a0718f0763b=
92fc62995
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-26T03:36:54.987800  kern  :alert : Mem abort info:
    2022-02-26T03:36:54.989023  kern  :alert :   ESR =3D 0x96000006
    2022-02-26T03:36:54.990287  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-26T03:36:54.991552  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-26T03:36:54.994468  kern  :alert :   EA<8>[   10.967356] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-26T03:36:54.995675   =3D 0, S1PTW =3D 0
    2022-02-26T03:36:54.996791  kern  :alert :  <8>[   10.977298] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 1623257_1.5.2.4.1>
    2022-02-26T03:36:54.997966   FSC =3D 0x06: level 2 translation fault
    2022-02-26T03:36:54.999144  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/62199e3f2b2d4e5cf3c6296d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62199e3f2b2d4e5=
cf3c62970
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-26T03:27:40.827123  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-26T03:27:40.827362  kern  :alert :   SET =3D <8>[   15.016244] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-02-26T03:27:40.827597  0, FnV =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62199e3f2b2d4e5=
cf3c62971
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-26T03:27:40.825042  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.990746] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-02-26T03:27:40.825341  at virtual address 0000000000000000
    2022-02-26T03:27:40.825589  kern  :alert : Mem abort info:
    2022-02-26T03:27:40.825827  kern  :alert :   ESR =3D 0x96000006   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/62199ef22fb6822d2fc629f2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62199ef22fb6822=
d2fc629f5
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        2 lines

    2022-02-26T03:30:32.152588  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-26T03:30:32.152849  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-26T03:30:32.153148  kern  :alert :   EA<8>[   15.378631] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-26T03:30:32.153446   =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62199ef22fb6822=
d2fc629f6
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        12 lines

    2022-02-26T03:30:32.150052  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.352802] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-02-26T03:30:32.150501  at virtual address 0000000000000000
    2022-02-26T03:30:32.150815  kern  :alert : Mem abort info:
    2022-02-26T03:30:32.151117  kern  :alert :   ESR =3D 0x96000006   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6219a03f06242ace79c629cc

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6219a03f06242ac=
e79c629cf
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-26T03:36:03.713907  at virtual address 0000000000000000
    2022-02-26T03:36:03.714354  kern  :alert : Mem abort info:
    2022-02-26T03:36:03.714619  kern  :alert :   ESR =3D 0x96000006
    2022-02-26T03:36:03.715125  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-26T03:36:03.715377  kern  :alert :   SET =3D <8>[   15.483901] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-02-26T03:36:03.715676  0, FnV =3D 0
    2022-02-26T03:36:03.715930  kern  :alert :   EA =3D<8>[   15.494362] <L=
AVA_SIGNAL_ENDRUN 0_dmesg 850000_1.5.2.4.1>
    2022-02-26T03:36:03.716166   0, S1PTW =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6219a03f06242ac=
e79c629d0
        failing since 31 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/62199d88861e76f5e9c6297a

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62199d88861e76f5e9c629c0
        failing since 31 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-26T03:24:51.289320  /lava-93411/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
99d88861e76f5e9c629c1
        failing since 31 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-26T03:24:51.292426  <8>[   18.523981] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-26T03:24:52.340853  /lava-93411/1/../bin/lava-test-case
    2022-02-26T03:24:52.341261  <8>[   19.542738] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-26T03:24:52.341500  /lava-93411/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/62199ea09ccca2ae4fc62985

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62199ea09ccca2ae4fc629cb
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:29:31.184962  /lava-93417/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
99ea09ccca2ae4fc629cc
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:29:31.188110  <8>[   18.514547] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-26T03:29:32.238128  /lava-93417/1/../bin/lava-test-case
    2022-02-26T03:29:32.238509  <8>[   19.534075] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-26T03:29:32.238750  /lava-93417/1/../bin/lava-test-case
    2022-02-26T03:29:32.238977  <8>[   19.549986] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-26T03:29:32.239205  /lava-93417/1/../bin/lava-test-case
    2022-02-26T03:29:32.239423  <8>[   19.567439] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-26T03:29:32.239643  /lava-93417/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62199ff6354bf66d41c6297d

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62199ff7354bf66d41c629c3
        failing since 32 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:35:07.764332  <8>[   17.764465] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-02-26T03:35:08.777470  /lava-93428/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
99ff7354bf66d41c629c4
        failing since 32 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:35:08.780298  <8>[   18.780953] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-26T03:35:09.828158  /lava-93428/1/../bin/lava-test-case
    2022-02-26T03:35:09.828887  <8>[   19.800108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-26T03:35:09.829135  /lava-93428/1/../bin/lava-test-case
    2022-02-26T03:35:09.829365  <8>[   19.815995] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-26T03:35:09.829596  /lava-93428/1/../bin/lava-test-case
    2022-02-26T03:35:09.829820  <8>[   19.832078] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-26T03:35:09.830042  /lava-93428/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/62199e02a6a29749cfc62995

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62199e02a6a29749cfc629e2
        failing since 17 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)

    2022-02-26T03:26:45.916570  /lava-93416/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
99e02a6a29749cfc629e3
        failing since 17 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)

    2022-02-26T03:26:45.919737  <8>[   13.526504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-26T03:26:46.966024  /lava-93416/1/../bin/lava-test-case
    2022-02-26T03:26:46.966431  <8>[   14.545279] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-26T03:26:46.966674  /lava-93416/1/../bin/lava-test-case
    2022-02-26T03:26:46.966898  <8>[   14.560694] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/62199ea2597e0d2692c62968

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62199ea2597e0d2692c629b5
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:29:29.281423  /lava-93418/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
99ea2597e0d2692c629b6
        failing since 32 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:29:29.284599  <8>[   13.552862] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-26T03:29:30.332944  /lava-93418/1/../bin/lava-test-case
    2022-02-26T03:29:30.333224  <8>[   14.572800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-26T03:29:30.333427  /lava-93418/1/../bin/lava-test-case
    2022-02-26T03:29:30.333655  <8>[   14.588986] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-26T03:29:30.333882  /lava-93418/1/../bin/lava-test-case
    2022-02-26T03:29:30.334100  <8>[   14.605010] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-26T03:29:30.334321  /lava-93418/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62199ff5262f951e17c6298a

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62199ff5262f951e17c629d7
        failing since 32 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:35:05.295771  /lava-93424/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
99ff5262f951e17c629d8
        failing since 32 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-26T03:35:05.302879  <8>[   13.490138] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-26T03:35:06.344922  /lava-93424/1/../bin/lava-test-case
    2022-02-26T03:35:06.345545  <8>[   14.508887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-26T03:35:06.345800  /lava-93424/1/../bin/lava-test-case
    2022-02-26T03:35:06.346025  <8>[   14.524466] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-26T03:35:06.346250  /lava-93424/1/../bin/lava-test-case
    2022-02-26T03:35:06.346465  <8>[   14.540457] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-26T03:35:06.346682  /lava-93424/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6219ac12ae27dad6b6c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6219ac12ae27dad6b6c62=
97e
        failing since 28 days (last pass: renesas-next-2021-11-26-v5.16-rc1=
, first fail: renesas-next-2022-01-28-v5.17-rc1) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6219ad46c75082a20ec62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6219ad46c75082a20ec62=
999
        failing since 31 days (last pass: renesas-next-2021-11-26-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6219adf68e0fba7d96c62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6219adf68e0fba7d96c62=
986
        failing since 31 days (last pass: renesas-next-2021-11-26-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6219acb1bf1cada4e3c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6219acb1bf1cada4e3c62=
96a
        failing since 31 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834) =

 =20
