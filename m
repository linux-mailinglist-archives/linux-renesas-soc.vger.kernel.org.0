Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257CB35E318
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Apr 2021 17:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhDMPpI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Apr 2021 11:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237575AbhDMPpE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 11:45:04 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF63C061756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Apr 2021 08:44:44 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id l76so12217806pga.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Apr 2021 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vd+OO50gMAl8jvnwTwFOAZ28Fcc+HT8FkvfunC+d6TU=;
        b=UjODPcabEj4GmHCMbSZvYDnrgobi/cc3gNCdMWs0UdaQ/lb9MQLMGZimyN0qHkTfQl
         aeVOdpyad++4M5Wpb9UNK6thcJa/3icG2sgJAMvkh6ZbHJKZaDeMlB+DVDkW/Kjwg1UV
         V8DibNx8GX4r4GogiOquSnO3C9vn3InoJDtztN/8VtCtY27EIC97TmsVjOMhHC7pQqWB
         LcV4eyeEtdHnEF4+I09woDCZzQ4HZSt/OtZH/IJymKlIGQYtlcjxN6etHyvo42X3pssN
         JoE462exD3q3765BVQzU9BFZ0WhJ9Wp1N2EhfdGrHdBkaQfr/dC5LeV5w5YHnvhf9GOP
         45ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vd+OO50gMAl8jvnwTwFOAZ28Fcc+HT8FkvfunC+d6TU=;
        b=g0OfLOcUvuXPNXZ90z2FFyu+6UntX987zeYuAzHjLdsYyZKQoZvwrUy+lLzhoABtM4
         hR5J816C2we8CIb+/lW9C0ERjYnmmmj0UNffPKEVMd/gWklAtT7OjUvaNzmoFIPk+dMg
         7sCbRfa9mEelEnDDN8QD3x/5dYd+mgdz37rM4NEVDEMbmjEx3joEG+34WwpdS702FLVs
         nZ8yGl1vAZRo3HPjOrcyPuzEbIju59J7kNt5LL4+/kSk0YCZhwR90/X359ISXN7HdKI6
         DtKbvP8TErUtYquwDr7z8LPYue28HI9aEgmGU8gRUJFf/C5NPHjjbyRNiLRq59BYh8Jy
         WKjw==
X-Gm-Message-State: AOAM531S2pUuBkrr+6b5YFe2fN1jR1NONSLBAOZyOoxM4oOBUa0+FbLb
        E3R5ght/Cgl3xNHCHlL4N45yZ4NWWFW5q+cP
X-Google-Smtp-Source: ABdhPJwRv5qhzPnKlQDboNr+qK2tGJ2XMUJfofWISPkrK2Q5XZWIbFEDS4ZkbH1kQ1F750drbvfsDQ==
X-Received: by 2002:a65:66c3:: with SMTP id c3mr32680161pgw.355.1618328684057;
        Tue, 13 Apr 2021 08:44:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t1sm2624014pjo.33.2021.04.13.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:44:43 -0700 (PDT)
Message-ID: <6075bc6b.1c69fb81.d4c24.7127@mx.google.com>
Date:   Tue, 13 Apr 2021 08:44:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-12-v5.12-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 255 runs,
 11 regressions (renesas-devel-2021-04-12-v5.12-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 255 runs, 11 regressions (renesas-devel-2021-04-12=
-v5.12-rc7)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-virt-gicv2        | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-12-v5.12-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-12-v5.12-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9e681b617b0ea7601b4b2764a26e6fbfe7dd13ed =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6075a0109b63b7e2e2dac6df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075a0109b63b7e2e2dac=
6e0
        failing since 62 days (last pass: renesas-devel-2021-02-01-v5.11-rc=
6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/607584d50691ec1ca4dac720

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607584d50691ec1ca4dac=
721
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607588443556642e2bdac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607588443556642e2bdac=
6c4
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60758221225114ef59dac6cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60758221225114ef59dac=
6d0
        failing since 146 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6075822ac254d685a3dac717

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075822ac254d685a3dac=
718
        failing since 146 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607581dfec5cb2f99adac70b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607581dfec5cb2f99adac=
70c
        failing since 146 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607585a6f62bb2fecedac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu=
_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu=
_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607585a6f62bb2fecedac=
6b3
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/607584ccd9d5f32882dac6cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-=
virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-=
virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607584ccd9d5f32882dac=
6cc
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/607584caa0ca9ec398dac6cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-=
virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-=
virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607584caa0ca9ec398dac=
6cd
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/607584cb3538b3a574dac6ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-=
virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-=
virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607584cb3538b3a574dac=
6eb
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6075875d7af58ffe98dac6cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075875d7af58ffe98dac=
6cd
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
