Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832B3344984
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 16:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhCVPnp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 11:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhCVPn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 11:43:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D89C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:43:29 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so8752255pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NFBLm0K6Z0C52aWZUv3DFAGjxm3nuR+voyaMcHNKkKE=;
        b=HjQMQtARbDRHJmc39xdLqMfH6McxRAeny71epgiTdVOvsE/zqFKSO+mhPUi8/d8E9Z
         FDBMaUA2kixvcV+SYvQr/LTFoFOePld9aaUmLUv28C1Ibwg2CsFy0fvNQ5eXc4Rw3U6/
         RAq91fn+cJHG5DeAL8xpP+XYMCUioKgFxh4CFvjAi1E+rTtNwbXek+KiNnPZ+a/00kC0
         qHJcWS8JR6iKrQKee4Q4ItZ4DYcgG1v0Uld+K0kd6BwYe67x8mUee7NgQFcDfTNFW61T
         ZrTYVaAU7/uVczo1udw3KJeXcSIl3zr47Dmibo5o7LRNk57lfXswZGvUwgm/5vgoF5iu
         kfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NFBLm0K6Z0C52aWZUv3DFAGjxm3nuR+voyaMcHNKkKE=;
        b=dg+A5ZGDnGtcJcE4ShOAAnqCbQQtRX+spTnFTxR3Vfsb3LxLpQ7201NeVfQ/KgVsQp
         +3lO4SqwQDuJogfNSmPXnEw4mEeh4Uep0FPMKdQkRK73ZceZ5y2KDdG9B0h5FETi9rzc
         hJiQ5CnCJb3sWMKj8xneDtFecSnlDUn0hlAywx3V/C044zxwcCMWtDaYnYGLmcmSA2uF
         aSBycEV1Dx4hPdIp1oKfmUKl5QlXhrN1k10k9l0zYTHB8+NpgX1S3NfLDHFKIS4RfFn+
         7ECryj/X+Q/a04CX8unB7MvrzhTf3zR8Frxc3SOFpEW1boAeUISg7a6yYEQy/odjAzPB
         kbXw==
X-Gm-Message-State: AOAM532c8a9751eV3Tv3rRBEEuQ9duhywYJVy8aQSAjjcvBNLMP54rk/
        D8VxBrtrrTo6Q/H8Z3raw/4duRO87yMDMA==
X-Google-Smtp-Source: ABdhPJycJfZwQkP787DIAUHHD0lie6R7A/LxJzS7n+tdtiFMtlJ5DCJP/M1JeDS/4moG4VGiFPqX5Q==
X-Received: by 2002:a17:902:8c92:b029:e6:60ad:6924 with SMTP id t18-20020a1709028c92b02900e660ad6924mr315904plo.16.1616427809010;
        Mon, 22 Mar 2021 08:43:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z192sm3248057pgz.94.2021.03.22.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:43:28 -0700 (PDT)
Message-ID: <6058bb20.1c69fb81.38fd2.7cd3@mx.google.com>
Date:   Mon, 22 Mar 2021 08:43:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-22-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 287 runs,
 13 regressions (renesas-next-2021-03-22-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 287 runs, 13 regressions (renesas-next-2021-03-22-v5=
.12-rc2)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-22-v5.12-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-22-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7ad9aafe713bdca552efdf6309a196e4f3eec177 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6058882ca157fa8175addcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6058882ca157fa8175add=
cc7
        failing since 10 days (last pass: v5.12-rc2-21-g604bd2d4786e9, firs=
t fail: renesas-next-2021-03-12-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/605889e2a7ee4b5535addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605889e2a7ee4b5535add=
cb2
        new failure (last pass: renesas-next-2021-03-16-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60589127b4733f7d77addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905=
d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905=
d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60589127b4733f7d77add=
cbc
        new failure (last pass: v5.12-rc1-12-g3158164f1526) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6058819634699f4ab3addccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6058819634699f4ab3add=
ccc
        failing since 118 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/605881bcb2b4e72099addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605881bcb2b4e72099add=
cb6
        failing since 118 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/605882107cca2235c0addcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605882107cca2235c0add=
cc4
        failing since 118 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6058b1c3ebabb34d59addcb3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6058b1c3ebabb34d59add=
cb4
        failing since 118 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/605887b3d60ffaa421addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605887b3d60ffaa421add=
cbc
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60588941d4ea9fbb07addcd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60588941d4ea9fbb07add=
cd9
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/605887b12d1a3af18daddcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605887b12d1a3af18dadd=
cc4
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60588941e13f9a7ac5addcd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60588941e13f9a7ac5add=
cd7
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/605887b22d1a3af18daddcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605887b22d1a3af18dadd=
cc7
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/6058897d86e18fabd7addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6058897d86e18fabd7add=
cb2
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1) =

 =20
