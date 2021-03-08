Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3343312BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 17:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhCHQA6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 11:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhCHQAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 11:00:38 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A868CC06175F
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 08:00:37 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id s7so5073386plg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=K9rTJm7gJ9ux+82b9JmFNqV/wHjhiBGQoiLteV2Hq9g=;
        b=HRDTzB70n3FfgfVqZ4aUTWoL55ojBj++p3rQdVVFrll6J15kmlr1/fZxCB4bTjhxqu
         TIlkOgSVXvhpYAeQybfQMwwJtmTOPCxTj6cXmPFwtZAbD2xaHbJLs1JJzO20rCsOda+c
         wrtI1tbDC2RE62ChaOEy3quAQ7lhTqCaB0MGfgyXeZI//g0iI0IsBlgO2AcvM9dDoOLI
         AaLcseVAOZ9w6MaAaY6Nuj509pjZmvKTMftiwuwZ9hxs20jpbhnSDeT+WjNRkcjEzT6G
         jlV9VCVwVnGouJMDAeQWR+ywfEshJwYFrhWH6+BJtAk79ewI97xfoERPsXYxFWDJUmJP
         V8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=K9rTJm7gJ9ux+82b9JmFNqV/wHjhiBGQoiLteV2Hq9g=;
        b=n0ppIY/YFuCTkJ7pZuR+2DKKDRKWE//2UpMzWei+tKMTJGeQKjfDLpJmlN+5ZHv4Td
         VPpgQi1J9Xyx6IBq+cLDKZSISzwkt2rJc2zQLcImrTftSKTxERk5SFJSqu5RjVrj9ivq
         EczjvXV/YCDTpp1QrLYdI55vN0gvzznBfR7WFas6koenrpgBCC0qCMku3oGldPOJcRAH
         HEqS0EiKso/JmDAU//yv2w8W8KMvQ7bYtlIKKT1qktFOfoGxqJhhUwQAjnBHQNxCPWoX
         6nMV4SkyBzZulGQSYW76pgVHW/S2Xw2S59zFF1wQoEONGfhofyMSJ9WrnoRIeXBPrAVI
         eTtg==
X-Gm-Message-State: AOAM530QmI+MVupkAtgzH0DAb9PR9Dww/N8aIJSyJySa1YmSYVKV+3qM
        99svoS7lrCJgLQWhFFg2ZQ/PVYbDyRiQW8dH
X-Google-Smtp-Source: ABdhPJxOL1OaFJSvTgL8xbwmd2WIQLusyrD4wDrUkOP9sFF9ER8GR9obB7VH3oXuQ7DDP9bsEaQzUQ==
X-Received: by 2002:a17:902:e546:b029:e5:ec5e:6bf4 with SMTP id n6-20020a170902e546b02900e5ec5e6bf4mr16209472plf.41.1615219236895;
        Mon, 08 Mar 2021 08:00:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a8sm4219633pfk.138.2021.03.08.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:00:36 -0800 (PST)
Message-ID: <60464a24.1c69fb81.aa415.9102@mx.google.com>
Date:   Mon, 08 Mar 2021 08:00:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-14-g6f56f6c26099
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 275 runs,
 6 regressions (v5.12-rc2-14-g6f56f6c26099)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 275 runs, 6 regressions (v5.12-rc2-14-g6f56f6c26099)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc2-14-g6f56f6c26099/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc2-14-g6f56f6c26099
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f56f6c260995c9bcecd0b8a520d80b0d6c11007 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6046176d674cb39c56addcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-=
imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-=
imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046176d674cb39c56add=
cbd
        failing since 38 days (last pass: renesas-next-2021-01-26-v5.11-rc1=
, first fail: renesas-next-2021-01-29-v5.11-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/604610b0dd6ba71af1addcd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604610b0dd6ba71af1add=
cd2
        failing since 105 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6046118d0c28c07937addcb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046118d0c28c07937add=
cb8
        failing since 105 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/604610925d3171704baddcc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604610925d3171704badd=
cc9
        failing since 105 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6046105e8909add0a0addcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046105e8909add0a0add=
cb9
        failing since 105 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/604615c7d0bb17a167addcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604615c7d0bb17a167add=
cbd
        new failure (last pass: v5.12-rc1-12-g3158164f1526) =

 =20
