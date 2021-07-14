Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0375D3C7B84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 04:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237428AbhGNCO6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 22:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237401AbhGNCO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 22:14:58 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D60C0613E9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 19:12:07 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id a2so633511pgi.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 19:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aUx88qz2B5Nj0xyDhhwHii8KHiG3ow9oTr/pJun9moQ=;
        b=tIBBgops4OFhcM55UJOJyrHZ/NqVtAUZ8SLDG7xJkNEOHB12aKBEsIyPe32vWYAgo0
         tLd6JFDQIotz+Gx0C6ZStN90ltNLWk3/vi3BFBxrLFytA1jamM0w2456cnKQal3iuSdq
         zvbJcHOBHWwqJsrb5FWHiZaeudI6H+WYG/VMu9AqiU9k+RjR/Y7aE6jndab+0la9NUz5
         sNiE6sA3CdSX51IVmyyng71Tn9r8bo8Y94xNmyK81MPapEdJfY/DhV3Rqhe2cHlnPFN0
         FRX0fP1xtC4dldOC+Pes7Ze4FMm8SSxWcrUFZ30OQuH2nlHyk5Ipk8/8iVmeoiX81c/y
         GcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aUx88qz2B5Nj0xyDhhwHii8KHiG3ow9oTr/pJun9moQ=;
        b=mIV8Tlxas0XZTRJmlSEk7xDshbeirsb6UVdOllLhmvklbvaQ5/p+alwPSg0xLizMZs
         D0x1Gk/P9lsbnn1S79rPLBQmnjBGWq9qa/BFcfUTKn7dzS6EP0WS/KLttRH3//8dzcTV
         HdApThMu3jpL2YtEuEoEtGj/fSvy7lUPn/BBkbpjNpf/dsXBOQT+/L2y22qYHn6+MuJJ
         7Z3/ir39Q75TTbz91AB3c8/SHRiVE+T3yRGv0dzQMOG9Pe2f5UQwB1TVOQIkfyAvOcDh
         Nm4SD16zVOZdcFamSEDgFiJavCjGTjjuXgaKFF/xB3RPjoidsyclchErbfNFsYF8t/gX
         CDzA==
X-Gm-Message-State: AOAM531V0c6Ro4abfaS45L4AfI810p0/h9xL2aaMVHblqqzgngbBdMD4
        w1xhtMhL8DI+Mj5st+6qMvShY891pq0KKD3S
X-Google-Smtp-Source: ABdhPJycezCiDzTGZIJHeg/396ug0UWY5a9U88GbmA9VRycPANCU+1AonSBOS/qCjbTPJXek/N2gdQ==
X-Received: by 2002:a63:ed4b:: with SMTP id m11mr7209763pgk.14.1626228726854;
        Tue, 13 Jul 2021 19:12:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y1sm464194pfa.34.2021.07.13.19.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:12:06 -0700 (PDT)
Message-ID: <60ee47f6.1c69fb81.d0f36.2902@mx.google.com>
Date:   Tue, 13 Jul 2021 19:12:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-13-v5.14-rc1
Subject: renesas/next baseline: 263 runs,
 26 regressions (renesas-next-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 263 runs, 26 regressions (renesas-next-2021-07-13-v5=
.14-rc1)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-8    | omap2plus_defc=
onfig          | 1          =

beaglebone-black      | arm   | lab-collabora   | gcc-8    | omap2plus_defc=
onfig          | 1          =

hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 1          =

hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =

mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =

r8a77950-salvator-x   | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =

rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-13-v5.14-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      51832d6b6211d53dd4145b477a0b0d0fc87d84cb =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee152a75e546b6678a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee152a75e546b6678a9=
39c
        failing since 133 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0fd655ed2bed968a93c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0fd655ed2bed968a9=
3c2
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee17f8447f48b1fc8a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee17f8447f48b1fc8a9=
39c
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee1500c833596b0e8a939d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee1500c833596b0e8a9=
39e
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0e66d1a3874d608a93a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseli=
ne-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseli=
ne-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0e66d1a3874d608a9=
3a6
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee154d75e546b6678a93a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee154d75e546b6678a9=
3a1
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0e814c438227e98a93ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0e814c438227e98a9=
3bb
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-collabora   | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee176d61fdba8a368a93f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee176d61fdba8a368a9=
3f5
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee1d2ee7d28494b68a93a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee1d2ee7d28494b68a9=
3a8
        failing since 5 days (last pass: renesas-next-2021-06-07-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee24fad828959fcd8a93a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee24fad828959fcd8a9=
3a3
        failing since 5 days (last pass: renesas-next-2021-05-31-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0ff64cc7f1f1968a93a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0ff64cc7f1f1968a9=
3a8
        failing since 189 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee144e41ac018fe58a93b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee144e41ac018fe58a9=
3b9
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee18846b3c2d6aa28a93a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee18846b3c2d6aa28a9=
3a2
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee0f9a7c2f99ff0e8a9405

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60e=
e0f9a7c2f99ff0e8a940c
        failing since 49 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-13T22:11:23.103406  /lava-4192871/1/../bin/lava-test-case
    2021-07-13T22:11:23.111302  <8>[   56.912386] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60ee0f9a7c2f99ff0e8a9412
        failing since 49 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-13T22:11:20.978801  <8>[   54.778018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-driver-present RESULT=3Dpass>
    2021-07-13T22:11:21.990546  /lava-4192871/1/../bin/lava-test-case
    2021-07-13T22:11:21.998812  <8>[   55.799270] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee172b61fdba8a368a939b

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60e=
e172b61fdba8a368a93a2
        failing since 49 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-13T22:43:46.904923  /lava-4193012/1/../bin/lava-test-case
    2021-07-13T22:43:46.913751  <8>[   56.948448] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60ee172b61fdba8a368a93a7
        failing since 49 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-13T22:43:44.782480  <8>[   54.816138] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-driver-present RESULT=3Dpass>
    2021-07-13T22:43:45.793932  /lava-4193012/1/../bin/lava-test-case
    2021-07-13T22:43:45.802668  <8>[   55.837098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0ebf49b906c37e8a939e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0ebf49b906c37e8a9=
39f
        failing since 232 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee12a19fb516d5978a9418

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee12a19fb516d5978a9=
419
        failing since 232 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0ea936c48365a28a93d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0ea936c48365a28a9=
3d4
        failing since 232 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0f528f50b583a48a93a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee0f528f50b583a48a9=
3aa
        failing since 232 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
r8a77950-salvator-x   | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee1dff67154ff2558a93a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee1dff67154ff2558a9=
3a6
        new failure (last pass: v5.14-rc1-17-gcd117793e1ac) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee24c9c12806126c8a93ae

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ee24c9c12806126c8a93b8
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:41:50.313940  /lava-4192857/1/../bin/lava-test-case
    2021-07-13T23:41:50.325262  <8>[   25.118958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ee24c9c12806126c8a93b9
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:41:49.279217  /lava-4192857/1/../bin/lava-test-case
    2021-07-13T23:41:49.290553  <8>[   24.084597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee274c467f29bd328a939b

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ee274c467f29bd328a93a5
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:52:29.674147  /lava-4193010/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ee274c467f29bd328a93a6
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:52:27.615753  <8>[   22.890395] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-13T23:52:28.638673  /lava-4193010/1/../bin/lava-test-case
    2021-07-13T23:52:28.650250  <8>[   23.926750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
