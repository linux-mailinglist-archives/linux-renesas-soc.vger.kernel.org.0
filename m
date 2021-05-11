Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C8F37AD0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 19:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhEKRZu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 13:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhEKRZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 13:25:50 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A74C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 10:24:43 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id m124so16206926pgm.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 10:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Q4a8+QZwPqA0aIsu4Kv9Bj83R6wRMr7kycv1dz7Vz9U=;
        b=cr+iiYRnCi47Lr/UH6FimBgWs15aKO2b0JB/JKxCO8yHssjITTM006aFyB6gbIJF3S
         AFX9CQkDXgAqvVRL6vVEa8ndu8MarlHd/EGd+XMkb50cYUhrCxDWD8lnpxzNrf0AGwbx
         zEJnPf4WMl34WjRKjN5sOrzYuOVhkPifVD8rushQqyv9i0WgFCYj2Bsll4dTZ6mFw6kf
         VgGYl5fIiNL51jHTvdDC8qmbJXZ1fe+9xvKzajWhPQOksl1bwXUByXBVavOGwJp0r9E0
         5iUgMqUmNZtekZ8fet49ZVOfUfyHDcWsCzoitKJWOA8m8FOS/4dY91+dLf5aoUYR6GMV
         4GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Q4a8+QZwPqA0aIsu4Kv9Bj83R6wRMr7kycv1dz7Vz9U=;
        b=HNkY49uRVLjOTEDm7AfJzdnJIGPGCPMgp9XTM5zOt7Y+q1lMW06smwYs2sNTlcLh0G
         vcj6Mcb29PzNviG3LV/OlO4e/KUnMNEsCNNPPyr5/VKlT7vaA2p7HfzSsmcZp5iHJ/XI
         gVeM1sYruNt5UECVgIYmjxBB7BeMwN3GlQFHNGVpn2mJu3NpdMAvnkwtnWPL5HkC73Wl
         TMI1jcnil9xlfpLusv26MB+ckNWO5a345Klrzbe4UP+KidoQ2wgfsN8b7tSSylailH17
         cryg8uRt8htUMKUQA+PS0MpA5PRnlP9H4II5sGoWg+djtJ2c8hMusNsi/52JAkfKct6Q
         TkNQ==
X-Gm-Message-State: AOAM533MXD/axX6UVRDPs3G3O3M131SpXEwLHfVeCVBE2lqlYaM+/TZd
        +2fupN5D/Ro/9dODwXyuei4OOZ5K+Nt2b8Wo
X-Google-Smtp-Source: ABdhPJypOQJSmzzFokwpTF4/pTdfgUSE36QE7NjYwdSLmeP2Z2/QKI37lkAkR9YolwpnyxR0Zo181A==
X-Received: by 2002:a63:d64f:: with SMTP id d15mr31527569pgj.137.1620753882692;
        Tue, 11 May 2021 10:24:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ge4sm2592799pjb.49.2021.05.11.10.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 10:24:42 -0700 (PDT)
Message-ID: <609abdda.1c69fb81.d90e0.8310@mx.google.com>
Date:   Tue, 11 May 2021 10:24:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-05-11-v5.13-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 269 runs,
 14 regressions (renesas-next-2021-05-11-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 269 runs, 14 regressions (renesas-next-2021-05-11-v5=
.13-rc1)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beaglebone-black         | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-11-v5.13-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-11-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81ca6c161d39b686d380f0bd5b34e6782451703f =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8d59622cecbcba6f5488

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a8d59622cecbcba6f5=
489
        failing since 70 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beaglebone-black         | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/609a94a44370badcb16f5484

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a94a44370badcb16f5=
485
        new failure (last pass: renesas-next-2021-05-10-v5.13-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/609a89c310267b94b46f547e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a89c310267b94b46f5=
47f
        failing since 42 days (last pass: renesas-next-2021-03-24-v5.12-rc2=
, first fail: renesas-next-2021-03-29-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8da30d01b334c16f5468

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a8da30d01b334c16f5=
469
        failing since 0 day (last pass: renesas-next-2021-04-02-v5.12-rc2-3=
-g0bacf4d3d276, first fail: renesas-next-2021-05-10-v5.13-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a85d5388c8b436a6f5479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a85d5388c8b436a6f5=
47a
        failing since 169 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a85d05879c552c96f547a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a85d05879c552c96f5=
47b
        failing since 169 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a85d9ceea0d08436f5473

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a85d9ceea0d08436f5=
474
        failing since 169 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a856f5708f4cc726f547d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a856f5708f4cc726f5=
47e
        failing since 169 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/609a87faca906cb2966f546c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a87faca906cb2966f5=
46d
        failing since 50 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8b56d694f869d76f54a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a8b56d694f869d76f5=
4aa
        failing since 50 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/609a88aee8e64387c16f5477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a88aee8e64387c16f5=
478
        failing since 50 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8c8226374a53826f547e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a8c8226374a53826f5=
47f
        failing since 50 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/609a88ad724c9e61e56f5471

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a88ad724c9e61e56f5=
472
        failing since 50 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8c819191d25a5a6f548c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a8c819191d25a5a6f5=
48d
        failing since 50 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =20
