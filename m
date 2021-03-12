Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C0F338F35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 14:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhCLNzH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 08:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhCLNzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 08:55:07 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EF2C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 05:55:06 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id o10so15926080pgg.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 05:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dArT8m3+JzyvgetNXBXsC8F+qzGXp9iu4y4YmluxiJo=;
        b=1CcUW2fLgNqN2ZOWt5CkdnjOMAKyQ6o4/nOImL6t/VR/xs1L70YN/1gdo+xLXSB/TY
         tlARaTE3jEKcEQ4vIosDsaaSywBcXNIvOATs2Pl/b7qp0lhzMpJ9rlP7FT1LaisYuGZk
         cPg9rQ1Xese3QFzoZfF+1tTKIsQtsqGxVOpjTgcnN9B4VopMEsWCUI+RbaPjHwYz0d5j
         uicPFXW4uVu1YSs4y/vsscLtK8HRjt9AhmAo/QPxjzfd9WxRaEpmLmwjKcN6r7u4Gg4o
         hliRLnQL/OsbHLQoGBT6elQ1zrusVozwmosRwb7eq82mxiHG+wIAksm0YT2X9NYXTYzK
         5ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dArT8m3+JzyvgetNXBXsC8F+qzGXp9iu4y4YmluxiJo=;
        b=slbiw9lU8FY8zNKGISwZDMj0UgUlrjo7OBGnsa/pbCDKwj2H0KnrA+lbLPlOhHw7ZN
         wseI5Y1BQa6/3aZNJX5/J37br5hZcnDuUZewSb6V3gWnTDA5QtD87KS4UdUakzmTYWYL
         d5cAgfEuYS+ChDQw+i+4VroXhJevcPfdq6Zg4udpYCZlJm5sHYQyLdA/5DNRC//Hiyt5
         ylZiNt0y8inxaIBMPcoghiCnyjscHoHx0WMPJ2VnjHGJ/+XtCILBXVHjyvUbnrSxEg5O
         Ua4Y0l5A/we9nkXm1amsFpZVrYeu/i6HcATbw3vD53dwkBXDWIDgsN8bNJ+2s1CSTkSB
         cXQQ==
X-Gm-Message-State: AOAM5337ADz2IjL46u7gjVU+4vH/N4sjCk9Dlj0XCstBH4UPtOORAGMI
        rAXXeVPqmgT+VKGuDEuiKJmTT8u0Nmyfjw==
X-Google-Smtp-Source: ABdhPJxeoVx2ghFnTm3aRjO8xD76NkM2OdKCkfJBp87Kudf+cH0oTAUXfgEPNZB58eX4o32nXYpvWw==
X-Received: by 2002:a62:aa16:0:b029:1fb:51cd:c8e3 with SMTP id e22-20020a62aa160000b02901fb51cdc8e3mr12633746pff.60.1615557306054;
        Fri, 12 Mar 2021 05:55:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e10sm5304206pgd.63.2021.03.12.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 05:55:05 -0800 (PST)
Message-ID: <604b72b9.1c69fb81.6d6d2.d9f2@mx.google.com>
Date:   Fri, 12 Mar 2021 05:55:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-12-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 161 runs,
 5 regressions (renesas-next-2021-03-12-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 161 runs, 5 regressions (renesas-next-2021-03-12-v5.=
12-rc2)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-12-v5.12-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-12-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      af038eda54d9a61e09711d7d4d3232356b510331 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/604b43dbb8ffa5fcbbaddcb1

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604b43dbb8ffa5fcbbadd=
cb2
        new failure (last pass: v5.12-rc2-21-g604bd2d4786e9) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/604b3eed10cdbf2166addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604b3eed10cdbf2166add=
cb6
        new failure (last pass: v5.12-rc2-21-g604bd2d4786e9) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/604b3981a6cab6d196addcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604b3981a6cab6d196add=
cbd
        failing since 108 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/604b398b1c8e8504d8addcd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604b398b1c8e8504d8add=
cd9
        failing since 108 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/604b39262d431890daaddcb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604b39262d431890daadd=
cb8
        failing since 108 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
