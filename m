Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F48352FD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 21:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhDBTfM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 15:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235392AbhDBTfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 15:35:09 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B93C061788
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Apr 2021 12:35:08 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so5020434pjc.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Apr 2021 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lMphTaHCurelUvlwNnNswcp1mT2qC0zz+a2rwbIhLq4=;
        b=tH8G7DR9hsptnmDRBftUa9pPXm054mWlI3in/V7k4yVWBqlNkicaaG/tn8ss5v08Gt
         10gBq+86jI8RMc3l474tXxkMukODu7KT0rFDIA5gcqW9JHj7JCqLpu9gc8rkgZElMBK1
         krzMLEjnK/+x9FZFkQq5bISLr25RfgRONwxU4lADbgCUHSxrI1rs0iundLztZb/kCYf0
         FTN071ymYxRR6BJW0IPhKwc53webwZEzcJnBbG+nFqaIILHYPUbPdhzItqoALEelowjm
         Vd4/S209kte7s0TCvQJ7fxR6NyyJTxg0B19omjGKL9eRChx2BtREoU+zJVo8+95Tj/QC
         BUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lMphTaHCurelUvlwNnNswcp1mT2qC0zz+a2rwbIhLq4=;
        b=rXC446f0R5ZBOUEfpThDC+cfNfkfMh4bw5AnrhXSIYDufqdB21R3k1Z65LSZqc87ul
         Q5yv1TRw7718Q/Yoc7tKeocDazrVkcFfb4hwvztjYLywJTH7Odm+lbVi+WC0yDRGt6qy
         +MzoNa/aV7sue5RCY+EzahTxOFfGUQDYui6oHoGGNxGswGelt5KqAu9prgrVbgcNugJa
         pCuNZym9W8SDk3crZVc0Jk4bT59I2K9mTBGzYxHZq1jAtBmGWxS8Mhg5LTZ99iLcyA+D
         DP/DZoGovZ6WOpqI/zbiEMyMD28olhwq7frYhKXJSnuDcL1fWAU4IikWlaIUep+QY4Np
         tJnw==
X-Gm-Message-State: AOAM531K1qMdL8lw95rKQrGAvp7flP0h/Bjev23YqWaHE4ixDVqgBLix
        D3Eb5klvuWiYpF3W31GVMs4/G4Yr08doVQyx
X-Google-Smtp-Source: ABdhPJyNPdspiayU8FX8JKLLCKt0JshICzmoGRY3PB5wbH+VQrqVeDR20zdRL8zs3ZV1S2tiRJtyUQ==
X-Received: by 2002:a17:90a:2a41:: with SMTP id d1mr15034232pjg.164.1617392107704;
        Fri, 02 Apr 2021 12:35:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y29sm9151204pfp.206.2021.04.02.12.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 12:35:07 -0700 (PDT)
Message-ID: <606771eb.1c69fb81.84d2e.740d@mx.google.com>
Date:   Fri, 02 Apr 2021 12:35:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-04-02-v5.12-rc2
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 212 runs,
 6 regressions (renesas-next-2021-04-02-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 212 runs, 6 regressions (renesas-next-2021-04-02-v5.=
12-rc2)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-04-02-v5.12-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-04-02-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e9903a1559e0802fcdc79f28c7e79db04a59678d =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/606738b5f47ac63ba0dac758

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606738b5f47ac63ba0dac=
759
        new failure (last pass: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6067386d51d1d5a731dac6b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6067386d51d1d5a731dac=
6b9
        failing since 3 days (last pass: renesas-next-2021-03-24-v5.12-rc2,=
 first fail: renesas-next-2021-03-29-v5.12-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60673caa1572319bb5dac6dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60673caa1572319bb5dac=
6de
        failing since 3 days (last pass: renesas-next-2021-03-24-v5.12-rc2,=
 first fail: renesas-next-2021-03-29-v5.12-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60673440831d709acadac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60673440831d709acadac=
6bb
        failing since 130 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6067344cccc303e1aedac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6067344cccc303e1aedac=
6b2
        failing since 130 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/606737fed49a7135b0dac6d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salva=
tor-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salva=
tor-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606737fed49a7135b0dac=
6d2
        new failure (last pass: renesas-next-2021-03-29-v5.12-rc2) =

 =20
