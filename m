Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347723EABC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 22:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhHLUbb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 16:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhHLUba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 16:31:30 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49757C061756
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:31:05 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id w14so11757495pjh.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9WMPpvm6p60Wm/8d7dmHyHELrpj0AYIOrsFoayWjP6g=;
        b=AHF5kUpuSjagyKKGI1RaqYPzn5ee641KFFwk9IRYWN4+X4M6UYzDmcgI5CIszOM582
         0A9vYba5DmvbGDehBz5y1Wn0MSMyCcaK/E8OFkR64ocGj7ScZmzZbHhut/He7qzbdO23
         r24J2RG/OWjSsk+zyqSI2rP5/tHJixv391zxPL70k8vmD3+TpXADAFTenBPWh9TnpAdX
         +PbqllhG+4GP2xBxQ/RVRA1psExUiuo4mM+rEFXZv9Lb1qplIxOwrWFQPkbwrQf1e/y+
         0CZjhVEkMIbWNvvKUo1IxBa0htABd5XR4uWN2Jm4673wfSMuORbDWVSJ9JqXfo3VV0aG
         ERCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9WMPpvm6p60Wm/8d7dmHyHELrpj0AYIOrsFoayWjP6g=;
        b=PI59hNCe2wyTCnKaHqtPuqPU8ReuoGqlM5WniloEbaMS5uv3l/ZoQO6RmchgfLKiTD
         9pC2BP0j4yEPV/fKgNICfaSJPVmBFxAnO7dOABYEDebPaGU/Bgkdvu55kWKlCAhknoRc
         cx/EA+clbSzezSGHM32RdZR3TxsSAbqT2+JWOGc7/wfHIvSQNip1sOK95wfrk/jLLBz+
         GPpcfQQ15uwD4rvDOKEl52oFpad4Wm9K5BmM5dceGl2+9vCbAf1YR2aq2NAT8q9CL4R7
         Gk/m1KVo9T6Mbk3cSbq0i88JRJPfCa4M/nwtweRJDpVF9a4atqcBibysMr1+FM3G1UHV
         GE0g==
X-Gm-Message-State: AOAM533WXm2gGkdpp8dpjGjCUf8XY2bgwdIUCTQHeLxgKcC3q6rWf6ta
        9lfq9idSVwIAYeqs2dmRoMPTFS4f2u5qi1f8
X-Google-Smtp-Source: ABdhPJx6EgKgrDxYOUtCCBzjKAcFF7eGDfa2hcTFHkuCF1bJwJ/ib8pG0pmXH+fNm888BQva5hHoLw==
X-Received: by 2002:a62:1892:0:b029:349:1b8f:af2b with SMTP id 140-20020a6218920000b02903491b8faf2bmr5938887pfy.20.1628800264622;
        Thu, 12 Aug 2021 13:31:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 2sm4473388pfe.37.2021.08.12.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 13:31:04 -0700 (PDT)
Message-ID: <61158508.1c69fb81.9889b.ce10@mx.google.com>
Date:   Thu, 12 Aug 2021 13:31:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-08-12-v5.14-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 325 runs,
 14 regressions (renesas-devel-2021-08-12-v5.14-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 325 runs, 14 regressions (renesas-devel-2021-08-12=
-v5.14-rc5)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 2          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-12-v5.14-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-12-v5.14-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33d79a656f9e005b45af2cdaffe67f9463fc5231 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/61154c60808591218fb136c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61154c60808591218fb13=
6c5
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/61154c60808591218fb136c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61154c60808591218fb13=
6ca
        failing since 29 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6115563fa011e683bcb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115563fa011e683bcb13=
662
        failing since 283 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/61154d83148e59f76eb1379f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61154d83148e59f76eb13=
7a0
        new failure (last pass: renesas-devel-2021-08-10-v5.14-rc5) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61154bcc6918cbc432b13698

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/61154bcc6918cbc4=
32b1369b
        new failure (last pass: renesas-devel-2021-08-10-v5.14-rc5)
        1 lines

    2021-08-12T16:26:36.026741  / # =

    2021-08-12T16:26:36.147166  #
    2021-08-12T16:26:36.253761  export SHELL=3D/bin/sh
    2021-08-12T16:26:36.255772  =

    2021-08-12T16:26:36.257004  / # #
    2021-08-12T16:26:36.360801  / # export SHELL=3D/bin/sh. /lava-684107/en=
vironment
    2021-08-12T16:26:36.464829  /lava-684107/bin/lava-test-runner /lava-684=
107/0
    2021-08-12T16:26:36.470838  =

    2021-08-12T16:26:36.472061  / # . /lava-684107/environment
    2021-08-12T16:26:36.474472  / # /lava-684107/bin/lava-test-runner /lava=
-684107/0 =

    ... (8 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61154bcc6918cbc=
432b1369d
        new failure (last pass: renesas-devel-2021-08-10-v5.14-rc5)
        2 lines

    2021-08-12T16:26:36.604314  <8>[   15.843540] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-08-12T16:26:36.605552  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2021-08-12T16:26:36.606834  kern  :emerg : Code: 54fffd01 aa1b<8>[   15=
.862436] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dl=
ines MEASUREMENT=3D2>
    2021-08-12T16:26:36.608060  03e0 97f97<8>[   15.869843] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 684107_1.5.2.4.1>
    2021-08-12T16:26:36.609296  ccc 17ffffe5 (d4210000) =

    2021-08-12T16:26:36.610504  + set +x   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/61154d0c12b36d8cc4b13746

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-=
p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-=
p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61154d0c12b36d8cc4b13=
747
        new failure (last pass: renesas-devel-2021-08-10-v5.14-rc5) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61154bb4acb1c48886b136b7

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/611=
54bb4acb1c48886b136be
        failing since 93 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-12T16:26:14.090429  /lava-4354117/1/../bin/lava-test-case
    2021-08-12T16:26:14.098771  <8>[   56.926523] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/61154bb4acb1c48886b136c4
        failing since 93 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-12T16:26:12.982310  /lava-4354117/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6115482f9e13bcaddfb1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115482f9e13bcaddfb13=
66f
        failing since 267 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6115483348efa67ad3b13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115483348efa67ad3b13=
669
        failing since 267 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/611547db6850e684f9b13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611547db6850e684f9b13=
666
        failing since 267 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61154c9bd263dc83a0b13661

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61154c9bd263dc83a0b1366b
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-12T16:30:00.729520  /lava-4354124/1/../bin/lava-test-case
    2021-08-12T16:30:00.741352  <8>[   24.910021] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61154c9bd263dc83a0b1366c
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-12T16:29:59.695913  /lava-4354124/1/../bin/lava-test-case
    2021-08-12T16:29:59.707423  <8>[   23.876855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
