Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49AD933414A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 16:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCJPQ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 10:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhCJPQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 10:16:09 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F40C061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 07:16:09 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id t37so799077pga.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 07:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=boDQZ1kMCoMS+G78aBurOAnJnHMi8oVamVf3NWqm/Os=;
        b=B14f4XNoZ3KyqeBCrqSt0r/K3IQ3oe3SSkcVXIthgdco4JPzYsI9zoKI+dANrNa+Op
         hWxsL4GQi3eIfkKbicjdklUhhcGwCJimsImzJlnIS6tGB6WRCddY2d3K+AHp8d+m1hUM
         Kt+6fUXukNe3wuXDCEa4ejlevP1SWMsylxZgMRx04YB/TBuzYhMgNDSXXpjzLHaQ8DAr
         iodWvx6vnMVLh5OfvAduKA7PPux9YPXXmJvziRB8fSrcnpdLNWugoaSsdbztm90RFhuu
         lNb9/OjGGHW4ncgU4K1BMGBiw14FOc5zRD6m1rdZCzLduCe7Rlgvo8bmOi1d3acAvMCS
         lmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=boDQZ1kMCoMS+G78aBurOAnJnHMi8oVamVf3NWqm/Os=;
        b=Nsqh3Z50gUzLiH9P4WTFu1ubTj52JrEcJGhBeZ5GcMdjl98rhH+5drD85pEGm06geC
         KHqKCHYm6NyqQw63zVaCNSWXk3s67LQKP4FoObb9i6tNoPkjmNLAw0z7I2IfArhBmQcG
         ppvSB6ppJlIu/ftnDKeRNgtNzbR0CDq6qz0xEho5E2yiWmi/kZSFeMuQGgcxvlVGf3RW
         GSEwWQGoZsQ+JcNnEhh9GXQo8hRGUNauGMb5jemJb8GPwyVYbqbfJlLD5K8dYtCe3+WZ
         8Hr7kiaS50WJM06si2hh8PrgkTRyZ9Ryd76E6HHvNjYmxJu4xGj6nNMpFqUZZ8KAnR3t
         PX/Q==
X-Gm-Message-State: AOAM532MABqJHK77tqVG3ZQsRwr3jA0NTaXSU5ivRZuB1gDoD1RY1omN
        GyX7c8s95g0c5ktUconTT7LUjfambbHCEOMK
X-Google-Smtp-Source: ABdhPJzAv0Gk7xK7UOlV+RJPZFuO3Q/kRy1ERs7UP1gxQr2Nec0NGUgVsr8ZySSmr+GlJAKIRhKO0A==
X-Received: by 2002:a62:8811:0:b029:1ef:2105:3594 with SMTP id l17-20020a6288110000b02901ef21053594mr3241507pfd.70.1615389368854;
        Wed, 10 Mar 2021 07:16:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y194sm6683267pfb.21.2021.03.10.07.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 07:16:08 -0800 (PST)
Message-ID: <6048e2b8.1c69fb81.d035a.fdbe@mx.google.com>
Date:   Wed, 10 Mar 2021 07:16:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-21-g604bd2d4786e9
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 156 runs,
 5 regressions (v5.12-rc2-21-g604bd2d4786e9)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 156 runs, 5 regressions (v5.12-rc2-21-g604bd2d4786e9)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc2-21-g604bd2d4786e9/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc2-21-g604bd2d4786e9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      604bd2d4786e902a90a56db9427d5563bdf8c529 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6048ace059cab44bb8addcd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048ace059cab44bb8add=
cd1
        new failure (last pass: v5.12-rc2-14-g6f56f6c26099) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/6048b0d9d72523da19addcbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048b0d9d72523da19add=
cc0
        new failure (last pass: v5.12-rc2-14-g6f56f6c26099) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6048b18994f7025ed0addce2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048b18994f7025ed0add=
ce3
        failing since 106 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6048aa5f5d206bb564addce4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatil=
epb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatil=
epb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048aa5f5d206bb564add=
ce5
        failing since 106 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6048a79b1249e41c16addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048a79b1249e41c16add=
cbc
        failing since 106 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
