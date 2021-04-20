Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9775B365188
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Apr 2021 06:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhDTEcA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Apr 2021 00:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhDTEcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 00:32:00 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C29AC06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 21:31:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id nm3-20020a17090b19c3b029014e1bbf6c60so15553129pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 21:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QEEfXdk4xeV9jSOnY7Z0vUt2b/fR1FGnXSr6RrOxhL8=;
        b=INoFJfePuBN/xJLXBzI2SSXbm/dbZECJBA0ude05fkdPFJSNbkwZy3cpOwNEj/pko0
         Z5UMcLDhB73F5cLxZ193VRnqfu1qYKZJBHkzpQwjtGiKDUAohNpjC3qXpYVGpa05f5+u
         tjw8ZFEi+nKb0o7kItKJeAn61vJ9DoOz8zwxRKhnqOxhf7KzIBfqlw+nLMTEMJW7vbEn
         Xmb6FcONAD9vZqUsUJ0JgNBKqKRNPyolY0k7fOfcS9+XkpH9O8yM50O09RUQ2z3Jt/FV
         Y3Y1YhkV6LR0yp1VKCuGhmAj7tHdhFGtXsJ9MswuXI3d+y4TTDB5DePs/F87GrKfRO8v
         W2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QEEfXdk4xeV9jSOnY7Z0vUt2b/fR1FGnXSr6RrOxhL8=;
        b=kSPhxSTRKQDya0hKMhWfVcpqxqjrkNZDQc88prp8wzcj3wGqWaeUl7+89J6TnUG6rw
         2WYr4X1S5b4yhZk8ztUXrKieYD3K4kNQtPZCcMUG+uv6MtW8fPoCTh69YoNhLP4h5Pby
         +dJexR9crXIFR81v1/l/aNhxOYuAPFYyu7y5285zHQap9Ze4K3PPLUxcXnkVS63VQv0w
         OTMHg6QrafUsmS2zKXFylaEG0kk/4Ybsnz0mAGwcrs85LasXChAoEtafqP+job05Hf9B
         wPv4unduX++UrFqPg5lsgzuW11Drfo2C2T5pwDeryQdwQx4fpit4CBClwSYdV36kQ6cB
         SkuQ==
X-Gm-Message-State: AOAM533CSlL8SQzOFILJtUwk4w8lI0tQL9KrsS2IOSiiIdSLMpUBRTI/
        fVH6ji9X1aSnQ2Q0fWiLxyasELxqfg16GA==
X-Google-Smtp-Source: ABdhPJz60t8a6bmYyPGnE7YzrSyw2HqeJddIfJt51C4pDz7zmLL7z6PUd6EARB2vDqnDQSvGehYY3w==
X-Received: by 2002:a17:90b:3646:: with SMTP id nh6mr2774952pjb.119.1618893087406;
        Mon, 19 Apr 2021 21:31:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d3sm920030pjw.35.2021.04.19.21.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 21:31:27 -0700 (PDT)
Message-ID: <607e591f.1c69fb81.2273b.417d@mx.google.com>
Date:   Mon, 19 Apr 2021 21:31:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-04-19-v5.12-rc8
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 258 runs,
 6 regressions (renesas-devel-2021-04-19-v5.12-rc8)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 258 runs, 6 regressions (renesas-devel-2021-04-19-=
v5.12-rc8)

Regressions Summary
-------------------

platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre  | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-collabora | gcc-8    | versatile_defconfi=
g          | 1          =

tegra124-nyan-big    | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-19-v5.12-rc8/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-19-v5.12-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a07b5a56e02f9a237f18f2335bd7f029b63739e3 =



Test Regressions
---------------- =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607e3315450b5713c59b77ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e3315450b5713c59b7=
7ae
        failing since 68 days (last pass: renesas-devel-2021-02-01-v5.11-rc=
6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-baylibre  | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e229a73b12651f19b77aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e229a73b12651f19b7=
7ab
        failing since 152 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e21d0437a98a7129b77db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e21d0437a98a7129b7=
7dc
        failing since 152 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e223badbcb888449b7799

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e223badbcb888449b7=
79a
        failing since 152 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-collabora | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e218b9d3f392adb9b77b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e218b9d3f392adb9b7=
7b5
        failing since 152 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
tegra124-nyan-big    | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607e2bc728caf142559b77aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e2bc728caf142559b7=
7ab
        new failure (last pass: renesas-devel-2021-04-12-v5.12-rc7) =

 =20
