Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42503EAA28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 20:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbhHLSV0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 14:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhHLSV0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 14:21:26 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC474C061756
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:20:59 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id a5so8353307plh.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SDXv/g3lVwDDCvqaXDkI+wtYMKBV6WwJvQ+3QthstJU=;
        b=fm+9UJSDnVwN3nNDHSUgtO8xnGXK0qyoTKbIGLaJKVmcRbQ5fvPKr4nHGHkOrx6rjV
         wcOmSBPFj6cB5qxPQodZ8taQl4xB0L2kGc8Ob3I2mRMYstwjJrd9ZY8qvQzHblxWR++L
         lqlr2b8Y0EcsC1I6ju1cx+LoBdyek8zC7iLmnMH3YpinQ1zDl59xHYeP0ZBl5kPH62D7
         EyyS6LsyEnKQdNBlau2Ly+kGmHlz4FE9kQUIdeHL3K8GyrZFLzuya0V8Z3NQUUvzwep0
         uLPjibRYoeRlAHWc8x2Gdk3PHAQmjtB3s7ixQIOpHZH3px0GdLZU830oWiSLTkm+BjUB
         ZH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SDXv/g3lVwDDCvqaXDkI+wtYMKBV6WwJvQ+3QthstJU=;
        b=j94ylypqEEkEZs8rwXnI7FrxIp83jozp1aXElcTOLtTHKYdjQlv+78EcfQYrkg+t36
         GTRlmoSAJcqhyerbi91TMmvpCfOW1yeG6bH3ZCTJkjLg1cDF5iNgUaFFINR6ovObp4Bs
         HRZsEN8TpXtzpYVnRyg8t3Hrbwg6PTpVSC5JL8rSKCEHo21/5NZhq5KzP0ZZFHKsl0Is
         HpbJbq0IYzAf7+Tr4QHumKbniuulF6wUR0NEgfbcRBFgJrDaaEbmS5EasDpocBPnSap4
         LqwlMEZ5jWJ53pV6tN09xvBS6KKfnrU3p8DJQMqbFqyhbRSZhY6Mk4+gK+Mh9YAA+SR5
         VxrA==
X-Gm-Message-State: AOAM531VwFhx4F5sk73RUZfWpOYOB6pLrS2sGi3HI464eyqqDfmgmhmo
        QKRlKWzdiynFEaGgZBa8YoUUH6w74PaQ1AxV
X-Google-Smtp-Source: ABdhPJyDDVwjJ8BRAMecA3bgmoko/0Vxg1VKUMsoFUT6ncRJX3BTbwYAyaqPx+VFpnZZdcWF817xMw==
X-Received: by 2002:a17:902:7584:b0:12d:8cb5:c7b8 with SMTP id j4-20020a170902758400b0012d8cb5c7b8mr536720pll.84.1628792458932;
        Thu, 12 Aug 2021 11:20:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j21sm895239pfn.75.2021.08.12.11.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 11:20:58 -0700 (PDT)
Message-ID: <6115668a.1c69fb81.ab097.2ef5@mx.google.com>
Date:   Thu, 12 Aug 2021 11:20:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-08-12-v5.14-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 366 runs,
 20 regressions (renesas-next-2021-08-12-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 366 runs, 20 regressions (renesas-next-2021-08-12-v5=
.14-rc1)

Regressions Summary
-------------------

platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm    | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b      | arm64  | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b      | arm64  | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =

hip07-d05            | arm64  | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

hip07-d05            | arm64  | lab-collabora | gcc-8    | defconfig       =
             | 1          =

imx8mp-evk           | arm64  | lab-nxp       | gcc-8    | defconfig+crypto=
             | 1          =

mt8173-elm-hana      | arm64  | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =

mt8173-elm-hana      | arm64  | lab-collabora | gcc-8    | defconfig       =
             | 2          =

qemu_arm-versatilepb | arm    | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm    | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm    | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_x86_64          | x86_64 | lab-broonie   | gcc-8    | x86_64_defcon...=
6-chromebook | 1          =

r8a774c0-ek874       | arm64  | lab-cip       | gcc-8    | defconfig       =
             | 1          =

r8a77950-salvator-x  | arm64  | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =

rk3399-gru-kevin     | arm64  | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin     | arm64  | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-08-12-v5.14-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-08-12-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      59d7f78144a8a34a290ba84931721eaf11e66ca9 =



Test Regressions
---------------- =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm    | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61152baf97d141b34ab13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152baf97d141b34ab13=
662
        failing since 163 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b      | arm64  | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152bc6bf7d7db584b136d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152bc6bf7d7db584b13=
6d8
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b      | arm64  | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/6115309ee70a56eb14b1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115309ee70a56eb14b13=
680
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hip07-d05            | arm64  | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152dbdd55a2caa2cb1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152dbdd55a2caa2cb13=
680
        failing since 34 days (last pass: renesas-next-2021-05-31-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hip07-d05            | arm64  | lab-collabora | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/6115367aad20cfd5b7b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115367aad20cfd5b7b13=
662
        failing since 34 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk           | arm64  | lab-nxp       | gcc-8    | defconfig+crypto=
             | 1          =


  Details:     https://kernelci.org/test/plan/id/61153096e70a56eb14b13672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153096e70a56eb14b13=
673
        new failure (last pass: renesas-next-2021-08-10-v5.14-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana      | arm64  | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61152b0f7c36fcf85bb136d8

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/611=
52b0f7c36fcf85bb136df
        failing since 79 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-12T14:06:55.189393  /lava-4353443/1/../bin/lava-test-case   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/61152b0f7c36fcf85bb136e5
        failing since 79 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-12T14:06:54.077284  /lava-4353443/1/../bin/lava-test-case
    2021-08-12T14:06:54.085317  <8>[   55.817640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
mt8173-elm-hana      | arm64  | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/61152fed91186623bbb136b3

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/611=
52fed91186623bbb136ba
        failing since 79 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-12T14:27:51.891182  <8>[   55.917276] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-08-12T14:27:52.902492  /lava-4353611/1/../bin/lava-test-case
    2021-08-12T14:27:52.910870  <8>[   56.937980] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/61152fed91186623bbb136c0
        failing since 79 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-12T14:27:51.790735  /lava-4353611/1/../bin/lava-test-case
    2021-08-12T14:27:51.798426  <8>[   55.826114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm    | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61152896ce965f5bb9b1368d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152896ce965f5bb9b13=
68e
        failing since 262 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm    | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6115289daffe4ba8beb13680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115289daffe4ba8beb13=
681
        failing since 262 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm    | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61152ce0b412e3fbb6b13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152ce0b412e3fbb6b13=
677
        failing since 262 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
qemu_x86_64          | x86_64 | lab-broonie   | gcc-8    | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/611528d8a099c214ffb1369f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/b=
aseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/b=
aseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611528d8a099c214ffb13=
6a0
        new failure (last pass: renesas-next-2021-08-10-v5.14-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
r8a774c0-ek874       | arm64  | lab-cip       | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/611530e12dde00b6cdb1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611530e12dde00b6cdb13=
67b
        new failure (last pass: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7=
ff3f83a) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
r8a77950-salvator-x  | arm64  | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/611530215f32e3598db1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salva=
tor-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salva=
tor-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611530215f32e3598db13=
66d
        new failure (last pass: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7=
ff3f83a) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin     | arm64  | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61152b0e615d5ccd3ab13672

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61152b0e615d5ccd3ab1367c
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:06:47.707025  /lava-4353421/1/../bin/lava-test-case
    2021-08-12T14:06:47.718703  <8>[   51.976082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61152b0e615d5ccd3ab1367d
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:06:45.653396  <8>[   49.909226] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-12T14:06:46.673712  /lava-4353421/1/../bin/lava-test-case
    2021-08-12T14:06:46.684829  <8>[   50.942701] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin     | arm64  | lab-collabora | gcc-8    | defconfig       =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/611530bfe70a56eb14b1369f

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/611530bfe70a56eb14b136a9
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:31:08.042585  <8>[   23.656196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-08-12T14:31:09.065004  /lava-4353622/1/../bin/lava-test-case
    2021-08-12T14:31:09.076219  <8>[   24.691177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/611530bfe70a56eb14b136aa
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:31:07.010468  <8>[   22.623783] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-12T14:31:08.030825  /lava-4353622/1/../bin/lava-test-case   =

 =20
