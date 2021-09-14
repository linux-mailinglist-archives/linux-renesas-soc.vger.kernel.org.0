Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4F440A1C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 02:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhINAHD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 20:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhINAHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 20:07:02 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81429C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 17:05:46 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so67387pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PEEPWp7FcqJgk6ZSHekty94d1fMTmBHzh4PfF6maxQw=;
        b=lnBlw9FpTo1X0Huc7T9+pg7xkIq6gHmgLSZC1UbvHlbg1k/D0Gjggx1aw/pDJFt0fQ
         OfQkrbqPIjJ2EjguzjJRf4o0+xUjJcRsobeSELbXZLb9mQGoczzsAeJbuEQMrxhhhOLm
         XjIaxhWoRHtEd36clbtZSbwsAUEDC44R39XJu0GDKoSHMLkmG9LuN4iVLv98AAa3PHS9
         KKocvmBndGFVgiWwcxcRoPI44Nba5bnlCv0Mk5EvPCilI9z5UtFudsl4zsHAF+n7DW33
         E5STx2JqFr0BRVqSbTmTfCU2/c1RMWIexRHchd5+BmdBjsLv1ncGDM4ytp0qxehy/+WA
         GUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PEEPWp7FcqJgk6ZSHekty94d1fMTmBHzh4PfF6maxQw=;
        b=TzPAB5RXBoDjxtm69JzEJwlBjBefAA5CORa6siuXdoB2NqCNc1zHWloNYs7yab8n9V
         I+svvfj1vlr/qOY+SInLSLZiYZf0jlh3YKQvlnz0f5e2AHgFHr4CAfCGOJv9O0qFDNt7
         VsY6uyvhAG6hgHTl4NM+fKEMVP4WnOVQe6Fc0QxheEQS6ykcjf3cZB2P8W6dkKf0Wepd
         SxQ5DsbT3hjdpxaTvXuvGtl1htMQuSkhWMx2vHPBZvWoexut0ANWeaMLUbSzJhRac9qb
         B0wtbq5PfOFCVIuL695n7Yk44TFMojq0oZJ2I9s1nDQv281RPYDyq2gG9Gy+KzUoExqe
         BFpA==
X-Gm-Message-State: AOAM5307hpz7+YbKHQeX4PTyQbXgVGwUJZtQi/TIFilS3GjMh977B3DA
        xLO3ybKXNiyzyUbAn9P5j05bURq5uHAffxBG
X-Google-Smtp-Source: ABdhPJzCklLo5D2jokPiWnzWpvEYv66cKVSvf/7aD8vpkxBky9aK1trkxqn17x3uk6B1bR6H6Sa+Fg==
X-Received: by 2002:a17:90a:be13:: with SMTP id a19mr2285769pjs.25.1631577945567;
        Mon, 13 Sep 2021 17:05:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13sm6109430pfw.73.2021.09.13.17.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 17:05:45 -0700 (PDT)
Message-ID: <613fe759.1c69fb81.5891f.2950@mx.google.com>
Date:   Mon, 13 Sep 2021 17:05:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-39-gcbbd8f16ae1c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 399 runs,
 25 regressions (v5.15-rc1-39-gcbbd8f16ae1c)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 399 runs, 25 regressions (v5.15-rc1-39-gcbbd8f16ae1c)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

imx8mn-ddr4-evk      | arm64 | lab-nxp       | gcc-8    | defconfig+ima    =
            | 2          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+ima    =
            | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+crypto =
            | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.15-=
rc1-39-gcbbd8f16ae1c/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: v5.15-rc1-39-gcbbd8f16ae1c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cbbd8f16ae1c24d6f82712bf5ef798a8a62b0233 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/613fb08bbc02f6e01699a356

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fb08bbc02f6e01699a=
357
        failing since 195 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/613fafb0410d22263a99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fafb0410d22263a99a=
2db
        failing since 62 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613fb11962108df1de99a302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/base=
line-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/base=
line-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fb11962108df1de99a=
303
        failing since 62 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/613fabe84e29fad9bf99a2fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle-xm.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle-xm.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fabe84e29fad9bf99a=
2ff
        failing since 47 days (last pass: renesas-next-2021-07-26-v5.14-rc1=
, first fail: renesas-next-2021-07-27-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/613fb06fd59b999cc699a314

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline=
-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline=
-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fb06fd59b999cc699a=
315
        failing since 48 days (last pass: renesas-next-2021-07-19-v5.14-rc1=
, first fail: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613faf45fd182cb7cc99a31c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613faf45fd182cb7cc99a=
31d
        failing since 56 days (last pass: renesas-next-2021-07-13-v5.14-rc1=
, first fail: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/613fddc61355549cce99a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fddc61355549cce99a=
2ea
        failing since 67 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613fe0ab14d4fc494699a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fe0ab14d4fc494699a=
2e7
        failing since 67 days (last pass: renesas-next-2021-05-31-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613fad417eb8ec4a1299a373

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fad417eb8ec4a1299a=
374
        failing since 251 days (last pass: renesas-next-2020-11-30-v5.10-rc=
1, first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mn-ddr4-evk      | arm64 | lab-nxp       | gcc-8    | defconfig+ima    =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/613fad4defd67d7eb599a2e6

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/613fad4defd67d7=
eb599a2ed
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1)
        12 lines

    2021-09-13T19:57:41.920258  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.330519] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-13T19:57:41.920441  0098
    2021-09-13T19:57:41.920565  kern  :alert : Mem abort info:
    2021-09-13T19:57:41.920675  kern  :alert :   ESR =3D 0x96000046
    2021-09-13T19:57:41.920782  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-13T19:57:41.920885  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-13T19:57:41.920985  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/613fad4eefd67d7=
eb599a2ee
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1)
        2 lines

    2021-09-13T19:57:41.921687  kern  :alert :<8>[   14.360393] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+ima    =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/613fb25238c6a1980a99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fb25238c6a1980a99a=
2e0
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/613fb823f3aa2f863b99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fb823f3aa2f863b99a=
2e0
        failing since 32 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613fb268526214d9d699a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/base=
line-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fb268526214d9d699a=
2f9
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/613fadecb15c3374b599a2fd

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/613=
fadecb15c3374b599a300
        failing since 111 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-13T20:00:34.768535  /lava-4513798/1/../bin/lava-test-case   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/613fadecb15c3374b599a306
        failing since 111 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-13T20:00:33.658021  /lava-4513798/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/613faef5b8c94ed35c99a2e5

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/613=
faef5b8c94ed35c99a2e8
        failing since 111 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-13T20:04:54.096364  <8>[   26.491779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-09-13T20:04:55.108017  /lava-4513862/1/../bin/lava-test-case
    2021-09-13T20:04:55.116753  <8>[   27.512735] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/613faef5b8c94ed35c99a2ee
        failing since 111 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-13T20:04:53.996255  /lava-4513862/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613fadebb69ae9ac8899a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fadebb69ae9ac8899a=
2e7
        failing since 294 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613fae01caacbd959b99a323

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fae01caacbd959b99a=
324
        failing since 294 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613fb519b7cebe174299a395

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613fb519b7cebe174299a=
396
        failing since 294 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/613fba62fb16b6f04c99a2e1

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/613fba62fb16b6f04c99a2e7
        failing since 62 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-13T20:53:44.296262  <8>[   51.510941] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-09-13T20:53:45.319798  /lava-4513790/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/613fba62fb16b6f04c99a2e8
        failing since 62 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-13T20:53:43.260758  <8>[   50.474600] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-09-13T20:53:44.284475  /lava-4513790/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/613fbd982a40bb294b99a2dd

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/613fbd982a40bb294b99a2e3
        failing since 62 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-13T21:07:14.233076  /lava-4513867/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/613fbd982a40bb294b99a2e4
        failing since 62 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-13T21:07:13.197354  /lava-4513867/1/../bin/lava-test-case
    2021-09-13T21:07:13.216424  <8>[   24.099367] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
