Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1AD03F5338
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 00:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhHWWLG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 18:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhHWWLF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 18:11:05 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7F5C061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 15:10:22 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id r9so525378pfh.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gR0NRbA0bBIsZFeuf8vHfklJAbWRgU9miUV5rdHvekU=;
        b=h9I4WUc10fpj8Uy6SG9W9zAUEI9ao2DMiEFxfFynHXQO/RaevIpkL3oNq0OR4KFhoJ
         ZK7+7aVocGP5cLveJbStHxTBlxHKYYHWe3r32OKG7BauipwjXNHj2liHRp2ZKrfuWYoo
         uz+W5SxWmHOiPKuPRsoHC7tG1XqvQYHu2skliHv51h4SYvrs9d4PliZwozB3wKllTUVL
         4yis9b9MryDHWJxMZqEPF4VTvQxFCFtjlYTiIGI+PYEIT8A8D4NMCC1SDPBnXrF39HxB
         h5qnDEOLwHQBj1J7CKS/R1uYfkq2wU4x1IbfPbU9tgtQ/jkAJ98NLpzaFTkf1+B78VEe
         Qrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gR0NRbA0bBIsZFeuf8vHfklJAbWRgU9miUV5rdHvekU=;
        b=FtAssshOSHlzary5n8nhOBNqgxogS7zI0Qd+dPqzcO3QqRHvouYvIrVDQT5w2uFB1M
         E0gB/Y35tfzw1lJebczaJtP9wSI8FW/92JUaHt7c+H9g9fGAyBw4UK163h9comHaPsrr
         bzHd5StgSTPtKfnrmY8fUvbEc5SCqwechAjSvDeB9LsKsc3o3vtn/ZYe+qS6xQBdXAgI
         zVQ4xJPePnAbTJsItTXBhVyrv+B+WugER6ErPWa0mbEwH8e9800WFIzJKdaY68GbftAM
         HmFOTMYvv0yZs0sHArs9lkRIl4uBGV/4BUIhi1gMKOL5SKlPvw7ZPtYSiGhCxc/Tocgs
         kurQ==
X-Gm-Message-State: AOAM530hobj8FzHSIArSx6mp+ysDGWSe6qkZ9a4LGhJyu8Iysnvt7Y4r
        xVKVtbiSBjMUq5UsOEsDn16bCrVI/skr0Lam
X-Google-Smtp-Source: ABdhPJymkYrydghuh4f5rGX7SAFGi543WIQ4muSU3m74gvqfZUCVRxWtnKCGZApgBw7LdNE9e0ntCA==
X-Received: by 2002:a65:4682:: with SMTP id h2mr34363281pgr.409.1629756621711;
        Mon, 23 Aug 2021 15:10:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w18sm8816769pfn.153.2021.08.23.15.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 15:10:21 -0700 (PDT)
Message-ID: <61241ccd.1c69fb81.52739.7036@mx.google.com>
Date:   Mon, 23 Aug 2021 15:10:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-08-23-v5.14-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 483 runs,
 23 regressions (renesas-devel-2021-08-23-v5.14-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 483 runs, 23 regressions (renesas-devel-2021-08-23=
-v5.14-rc7)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32         | arm   | lab-baylibre  | gcc-8    | bcm2835_def=
config            | 1          =

beagle-xm                  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 1          =

beagle-xm                  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig+ima       | 1          =

fsl-ls1043a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 1          =

hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+c=
rypto             | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 2          =

mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 2          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-23-v5.14-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-23-v5.14-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a8378ef28a200358f247cc997a8c3db868b1e917 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e6682208b0ac0f8e2c83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e6682208b0ac0f8e2=
c84
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e7bc105bebfcab8e2ca8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e7bc105bebfcab8e2=
ca9
        failing since 41 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre  | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e2f722585971da8e2d07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e2f722585971da8e2=
d08
        failing since 41 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
beagle-xm                  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e4180f318587f58e2c85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e4180f318587f58e2=
c86
        failing since 27 days (last pass: renesas-devel-2021-07-19-v5.14-rc=
2, first fail: renesas-devel-2021-07-26-v5.14-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
beagle-xm                  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e775c14fa941b48e2c9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e775c14fa941b48e2=
c9b
        new failure (last pass: renesas-devel-2021-07-27-v5.14-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1043a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e9812312520c278e2c8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e9812312520c278e2=
c8b
        new failure (last pass: renesas-devel-2021-08-10-v5.14-rc5) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6124115bc7b5f219938e2c7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124115bc7b5f219938e2=
c80
        failing since 40 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612414399b40b694da8e2ca3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612414399b40b694da8e2=
ca4
        failing since 41 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e8e947055f1c188e2ca8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e8e947055f1c188e2=
ca9
        failing since 294 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6123ead4001f90882a8e2c88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123ead4001f90882a8e2=
c89
        new failure (last pass: v5.14-rc5-549-g3b20129c119f) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e8070f95d139048e2c89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e8070f95d139048e2=
c8a
        new failure (last pass: renesas-devel-2021-06-28-v5.13) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/6123e5eded1c82bb978e2c84

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/612=
3e5eded1c82bb978e2c87
        failing since 104 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-23T18:15:48.004535  /lava-4401318/1/../bin/lava-test-case   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6123e5eded1c82bb978e2c8d
        failing since 104 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-23T18:15:47.012599  /lava-4401318/1/../bin/lava-test-case
    2021-08-23T18:15:47.012839  <8>[   56.178015] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>
    2021-08-23T18:15:47.012977  /lava-4401318/1/../bin/lava-test-case
    2021-08-23T18:15:47.013094  <8>[   56.195737] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mt8173-pinctrl-driver-present RESULT=3Dpass>
    2021-08-23T18:15:47.013213  /lava-4401318/1/../bin/lava-test-case
    2021-08-23T18:15:47.013429  <8>[   56.215150] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mt8173-pinctrl-probed RESULT=3Dpass>
    2021-08-23T18:15:47.013552  /lava-4401318/1/../bin/lava-test-case
    2021-08-23T18:15:47.013666  <8>[   56.233390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt6577-uart-driver-present RESULT=3Dpass>
    2021-08-23T18:15:47.013782  /lava-4401318/1/../bin/lava-test-case
    2021-08-23T18:15:47.013893  <8>[   56.252213] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt6577-uart-probed RESULT=3Dpass> =

    ... (2 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6123e71b478dc346bb8e2c97

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/612=
3e71b478dc346bb8e2c9a
        failing since 104 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-23T18:20:56.008917  /lava-4401349/1/../bin/lava-test-case
    2021-08-23T18:20:56.017198  <8>[   56.921598] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6123e71b478dc346bb8e2ca0
        failing since 104 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-23T18:20:54.897447  /lava-4401349/1/../bin/lava-test-case
    2021-08-23T18:20:54.905179  <8>[   55.809699] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e03947f7701fa18e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e03947f7701fa18e2=
c78
        failing since 278 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612400d24f6c883cf18e2cd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612400d24f6c883cf18e2=
cd5
        failing since 278 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e03543578c47df8e2c94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e03543578c47df8e2=
c95
        failing since 278 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e95d57059cbeb68e2cad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123e95d57059cbeb68e2=
cae
        failing since 278 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/6123e9cbce456d4f158e2d72

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru=
-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6123e9cbce456d4f158e2d78
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-23T18:32:31.670036  /lava-4401303/1/../bin/lava-test-case
    2021-08-23T18:32:31.681501  <8>[   52.342788] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6123e9cbce456d4f158e2d79
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-23T18:32:29.614386  <8>[   50.274258] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-23T18:32:30.637209  /lava-4401303/1/../bin/lava-test-case
    2021-08-23T18:32:30.648394  <8>[   51.309950] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6123eafc7cea6133d98e2c78

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6123eafc7cea6133d98e2c7e
        failing since 41 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c)

    2021-08-23T18:37:40.063862  /lava-4401348/1/../bin/lava-test-case
    2021-08-23T18:37:40.075516  <8>[   25.147242] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6123eafc7cea6133d98e2c7f
        failing since 41 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c)

    2021-08-23T18:37:39.029716  /lava-4401348/1/../bin/lava-test-case
    2021-08-23T18:37:39.040467  <8>[   24.112480] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
