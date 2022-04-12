Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862C04FCCD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 05:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239010AbiDLDEU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 23:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiDLDET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 23:04:19 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8751B65D6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 20:02:03 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n18so15553105plg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tFemTeS1zQeZ4TPYiZg3athFZfjgx7WZoaiARH5V70U=;
        b=lmYHbQIudBMfcSUSBrgqrZSfO1karwAGEHrvs04LvhkxSI2w1hLd4YFKUcMTfSGo9m
         /CysUOmIZ8bG9UHfayIWbIYRgrPC1Ir0kZvghMtH1bMv2rZVFpap8y2N07mitGqk26r0
         Cr/zhIpydkT67fIy6FE2vyTTfJAiLi/dUsH8pfQclxz12popQepjZqUP1yUP+BahoY3I
         0pUnugvxaUpKFAgJmVce/KYbUbRPGxr/Qj409002vDtsui/Q3Lay1a2KYKorGkI7ZHTr
         8BWBSVr7vz/to8TEm3XK9fMeFIe+k7t+1xgiyRA0Cj+OoE60b/ljUx0fs07npfr6bwis
         eoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tFemTeS1zQeZ4TPYiZg3athFZfjgx7WZoaiARH5V70U=;
        b=YtPrM0BiyfrNnaGtjuC/v1kE4qQaOVzhH+TDLVF+gfZeHt8XX8kED0Rbt6gtVE3v4P
         gHkGfnY42iqESkNLG1dNkXhatJPrSZn0AsSRo2g+eR7UoIJqBdlS8PMV8u/ZDx//Ri3H
         Bpq2V+/0u0/Zil0WvbLLo0prMGKQy5j2IGHtCxRYZx4KWCDlLhx4CR3ac6Rrh/s8KLFb
         L/jjeBQCBMavWqgng/87LLW3WB8uWvfFfKne4rgdWv3M1z6kFe9okRQgd6IUvDnu26H5
         v6ydseKH9BNj1swTsRJSBt3D3vEyNJQBhO7MPGlAk7EcG4fXoOX0NoHRCES4AquBwuPV
         ht+A==
X-Gm-Message-State: AOAM532ofCbes8I638wOFoS2iBqZNK1U3QZ6JV9IUMlRoixf3jYvXhbo
        nqWfoU6O2+fes0Dy9aOQ+RYd/3bapYUjdXH3
X-Google-Smtp-Source: ABdhPJzZRH3FAb+tSn7aANnvSycw91ve3jJXqQLVIKpBaTTqc13+h9uGJyyDddN7c5A1rGqgvJzfrg==
X-Received: by 2002:a17:902:ccc6:b0:156:a94a:9db4 with SMTP id z6-20020a170902ccc600b00156a94a9db4mr34662556ple.45.1649732522824;
        Mon, 11 Apr 2022 20:02:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x36-20020a634a24000000b0039cc6fff510sm1006492pga.58.2022.04.11.20.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 20:02:02 -0700 (PDT)
Message-ID: <6254ebaa.1c69fb81.777a1.412a@mx.google.com>
Date:   Mon, 11 Apr 2022 20:02:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-11-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 382 runs,
 3 regressions (renesas-next-2022-04-11-v5.18-rc1)
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

renesas/next baseline: 382 runs, 3 regressions (renesas-next-2022-04-11-v5.=
18-rc1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

panda              | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig=
          | 1          =

rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-11-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-11-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      18b3b4968658b20ca316d07f1223223ab92cb072 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6254ac2fc437ae37b7ae06a6

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/625=
4ac2fc437ae37b7ae06b9
        new failure (last pass: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-11T22:30:54.577586  /lava-107845/1/../bin/lava-test-case
    2022-04-11T22:30:54.577906  <8>[   14.652277] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-04-11T22:30:54.578098  /lava-107845/1/../bin/lava-test-case
    2022-04-11T22:30:54.578278  <8>[   14.671855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-04-11T22:30:54.578456  /lava-107845/1/../bin/lava-test-case
    2022-04-11T22:30:54.578629  <8>[   14.692840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-04-11T22:30:54.578802  /lava-107845/1/../bin/lava-test-case   =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
panda              | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6254a9d8834bddf4deae06b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254a9d8834bddf4deae0=
6b3
        new failure (last pass: renesas-next-2022-02-24-v5.17-rc1) =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6254a705e84e4e521fae0699

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6254a705e84e4e521fae06bb
        failing since 6 days (last pass: renesas-next-2022-02-25-v5.17-rc1,=
 first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-11T22:09:00.636197  <8>[   32.777982] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-11T22:09:01.663897  /lava-6066706/1/../bin/lava-test-case
    2022-04-11T22:09:01.680034  <8>[   33.823235] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
