Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3363C68E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 05:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbhGMDYo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 23:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhGMDYo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 23:24:44 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D21C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 20:21:54 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g24so11293079pji.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 20:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JY3dBFWBml7/h7YWfMQ34xSQWLicWlrAjMCMM5Io5PI=;
        b=vOJmw4sYW4fdbpQF+jM55ZAAbQBsr5nwo9a6gkp1fP/+nCvQkx7DYSM6mNxC5N6ng7
         XQB56AIyr9M4FajyC1cDeR5k1XG2mvKVf+Qa08Gi6CVCc+LO/NNjJrCeQYRzLkHXR1mO
         NgYkfe4tD6i+qCWl8lmv8yfjH2/eYSwW1xNjO5arXubMZirn107X4AWCF1PVQwg07Js6
         yFlb73YaMQOhQwiQzoMeq0HaOY/OLeskO225QmZbelV052wHdFxuzPJIumWHEPinKqB1
         bWApZBueY8/CRmJdsL6TJKlS9CRaGiKeHzpz3i06llfyKd50fYHuObJ/e0SkRNWge9Xs
         qV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JY3dBFWBml7/h7YWfMQ34xSQWLicWlrAjMCMM5Io5PI=;
        b=GnXA6cxTUmNJEwtVgcMhG+N9WQwFmPgGysY44Evycvh4bV96c5YpARaNiQ3HTbitF9
         EWirwevNIn8o+vORjsKwaCuuzx2XsmZDb5J3QopnqgnXILnGEnyNEeRmhxmvcq+I9HEI
         11txhEfMU+Eyc1h/X1mueH1DyXTGkp569GshkjEz5eLqPUb0gBCL9fKaXy1dlzjBacCz
         0Xp21X1MjwCas4z5EI5L+eA/gKM2jydFfUo9jT+IOSgP505Es9N3jaEe3GUlxqrceidM
         8Rj2oGEqdug/bxgErg/3LUOCaVthrM1M61omOHUyr8zjKYDySLvMdQLjWHHlnfhlnTPo
         zYtw==
X-Gm-Message-State: AOAM531wNF581L3NtZujVCLxbOYvJ40PlsSnmbDMeS6AmW9i/MLmmYMh
        hh9zBDTPosr9iXbZTFUsOS+rDIWZI4PoB5Gt
X-Google-Smtp-Source: ABdhPJwWZrr1pNs/osNi2gWt+Ptsdtt6WTPwAFkAK8YEFWe/LQePkqPPGSPwXwQlBwkHpJJ2RQomSg==
X-Received: by 2002:a17:90a:fb51:: with SMTP id iq17mr17422639pjb.36.1626146514068;
        Mon, 12 Jul 2021 20:21:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 30sm19790654pgq.31.2021.07.12.20.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 20:21:53 -0700 (PDT)
Message-ID: <60ed06d1.1c69fb81.2c120.c655@mx.google.com>
Date:   Mon, 12 Jul 2021 20:21:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-17-gcd117793e1ac
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 296 runs,
 31 regressions (v5.14-rc1-17-gcd117793e1ac)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 296 runs, 31 regressions (v5.14-rc1-17-gcd117793e1ac)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =

beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defco=
nfig           | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-8    | multi_v7_defco=
nfig           | 1          =

beaglebone-black      | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-8    | omap2plus_defc=
onfig          | 1          =

beaglebone-black      | arm   | lab-collabora   | gcc-8    | omap2plus_defc=
onfig          | 1          =

hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 1          =

imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig     =
               | 1          =

meson-gxm-q200        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =

qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =

rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.14-=
rc1-17-gcd117793e1ac/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: v5.14-rc1-17-gcd117793e1ac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cd117793e1ac66174038470d85471fa4d9e226b9 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd71a8c75cbe11711799e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd71a8c75cbe117117=
99f
        failing since 132 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd073deaa4c6097117996

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/base=
line-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/base=
line-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd073deaa4c6097117=
997
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd27c5887c293d21179e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd27c5887c293d2117=
9e8
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecc9cefa6b001bc611796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
-32.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecc9cefa6b001bc6117=
96b
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccc5821ceff69eb11798e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline=
-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline=
-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eccc5821ceff69eb117=
98f
        new failure (last pass: renesas-next-2020-11-27-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecce4dffffb2b99c117972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecce4dffffb2b99c117=
973
        new failure (last pass: renesas-next-2020-11-27-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccb67b86e90e3e3117981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eccb67b86e90e3e3117=
982
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccd5bbd99644618117983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eccd5bbd99644618117=
984
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd11f03187a279d117a06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd11f03187a279d117=
a07
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecceb75374342ecf11796e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecceb75374342ecf117=
96f
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-collabora   | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd74e6fc62e81ce11797a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd74e6fc62e81ce117=
97b
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecf5f76cb1c0d7c1117973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecf5f76cb1c0d7c1117=
974
        failing since 4 days (last pass: renesas-next-2021-05-31-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hip07-d05             | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecf762ae48f0674d117986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecf762ae48f0674d117=
987
        failing since 4 days (last pass: renesas-next-2021-06-07-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecceb95a5521bc8a11797d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecceb95a5521bc8a117=
97e
        failing since 188 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd0361a78dc708f11798d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd0361a78dc708f117=
98e
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd0e8e85ec0e95b1179c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-=
imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-=
imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd0e8e85ec0e95b117=
9c1
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd11a03187a279d1179e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/basel=
ine-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/basel=
ine-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd11a03187a279d117=
9e6
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd2faae78aa1697117983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecd2faae78aa1697117=
984
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxm-q200        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccf98a82b344899117992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eccf98a82b344899117=
993
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60eccfc3a93ce1bf2d1179a8

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60e=
ccfc3a93ce1bf2d1179af
        failing since 48 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-12T23:26:48.150395  /lava-4187507/1/../bin/lava-test-case
    2021-07-12T23:26:48.157946  <8>[   56.927387] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60eccfc3a93ce1bf2d1179b5
        failing since 48 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-12T23:26:47.035927  /lava-4187507/1/../bin/lava-test-case
    2021-07-12T23:26:47.045132  <8>[   55.813434] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
mt8173-elm-hana       | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60ecd1a02ceaceb2571179f7

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60e=
cd1a02ceaceb2571179fe
        failing since 48 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-12T23:34:43.869242  <8>[   56.242427] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-07-12T23:34:44.881228  /lava-4187592/1/../bin/lava-test-case
    2021-07-12T23:34:44.889503  <8>[   57.263993] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60ecd1a02ceaceb257117a03
        failing since 48 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-12T23:34:43.766763  /lava-4187592/1/../bin/lava-test-case
    2021-07-12T23:34:43.775416  <8>[   56.149446] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecc9f5fea49d9dd811799c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecc9f5fea49d9dd8117=
99d
        failing since 231 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecca4b88fdc05be1117991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecca4b88fdc05be1117=
992
        failing since 231 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecc9ebfea49d9dd8117982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecc9ebfea49d9dd8117=
983
        failing since 231 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecc9948ce0bf052a11797e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecc9948ce0bf052a117=
97f
        failing since 231 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ece003a30cc9f277117984

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ece003a30cc9f27711798b
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T00:36:01.203158  /lava-4187489/1/../bin/lava-test-case
    2021-07-13T00:36:01.214651  <8>[   23.459202] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ece003a30cc9f2771179b9
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T00:36:02.236405  /lava-4187489/1/../bin/lava-test-case
    2021-07-13T00:36:02.248148  <8>[   24.492353] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora   | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60ece0e25f33b6ba071179a2

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ece0e25f33b6ba071179ac
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T00:39:39.182870  /lava-4187590/1/../bin/lava-test-case
    2021-07-13T00:39:39.193630  <8>[   51.852670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ece0e25f33b6ba071179ad
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T00:39:37.126425  <8>[   49.782652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-13T00:39:38.146826  /lava-4187590/1/../bin/lava-test-case
    2021-07-13T00:39:38.158412  <8>[   50.817689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
