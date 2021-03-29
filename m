Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1460834D95A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 23:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhC2U71 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 16:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhC2U7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 16:59:20 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1B8C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 13:59:20 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x126so10628320pfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 13:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=25Yrq24h4D9OtfcoRh5rFD0bVCMZhVXjYX3ZV9N3gi4=;
        b=wipbax1ykyQWeOc6tENtK+kF1X1/WMkRzHcEl+eyX/1GfIlSSFF//UbvgSxCpJ6h6Y
         /Iv2oEgqEA1DGL/V+KzOmGyPYlFHRDtMZ1jGNtcZjnndJZWI0G/bHHNyfM9GJaZESlKZ
         0xtlFgZbHOqLHBSlOsIjO6D/efNRfNryYrHxiV88jSB8HyPpU1z6fLIoIo8uOhseZLpD
         rwyEUSDjO4/McsqiqAHBXNwEvCgkt3e9JW3a5Iz+Q7JvADZ6gpbgj8+QeiH/0t0nuDYw
         oFqBMCkY86Fue1y+eyJeJCAM7aKo1sye5Ci0I6n+CUWyUDDoPNkZAcY3121BLQO998k3
         hnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=25Yrq24h4D9OtfcoRh5rFD0bVCMZhVXjYX3ZV9N3gi4=;
        b=sAS7F0nrDDSXrijWmiaKfwBZHkZ3Mcz+qiVQtA7FSH69pSt2sOaRzckNAn8qevvonF
         fkGQJDmdJl/8Tpf2invvlDVkjLAkhqeoeiEfQDbFdp6qk35jPJ+RP+AhZgT0i9+s0mD2
         P3FMPX2J1G8yW3LdZsiFX4UMdqxwZscdbfVIiymyoTk5RkvfW8GuCyCp3Gk23MWKeltC
         RbbIfMnlPIEIeUmYvf1rBv9QHn29Mz52883FELcA0VrjLkAKosL+67qYCQg+uk4+KF0G
         gREA2F1EZPnUfRBcuShplrEUWHHpypFWQ6qUBjCUbIAa5QTWt8PjL807FMlUSuIsH6OO
         ybSg==
X-Gm-Message-State: AOAM531c/lr+Bh3DQpsZoQRtJh0adrxgDsnqgwkTd2yNz2orIifl0QM1
        8t0b2wJjv2a5AGZHZgi/b6L/O2mQh05cwKiN
X-Google-Smtp-Source: ABdhPJyU6xGINziKsSZA12MCZwZgFobYgjjd6zwq3mcfBif2LVSTK7TmBhLR59fWQTx+uVa9TOxONA==
X-Received: by 2002:a65:6483:: with SMTP id e3mr15426546pgv.208.1617051560171;
        Mon, 29 Mar 2021 13:59:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e190sm18659413pfh.115.2021.03.29.13.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 13:59:19 -0700 (PDT)
Message-ID: <60623fa7.1c69fb81.13977.dafe@mx.google.com>
Date:   Mon, 29 Mar 2021 13:59:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-03-29-v5.12-rc5
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 213 runs,
 3 regressions (renesas-devel-2021-03-29-v5.12-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 213 runs, 3 regressions (renesas-devel-2021-03-29-=
v5.12-rc5)

Regressions Summary
-------------------

platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
 | 1          =

qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
 | 1          =

qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-29-v5.12-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-29-v5.12-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bb48e88392ae845729086cf17d765fd2a3a60f2a =



Test Regressions
---------------- =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/606204ce04b982abecaf02c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606204ce04b982abecaf0=
2ca
        failing since 131 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/606204b3250fd235e1af02e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606204b3250fd235e1af0=
2e7
        failing since 131 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/606204a9250fd235e1af02e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606204a9250fd235e1af0=
2e2
        failing since 131 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
