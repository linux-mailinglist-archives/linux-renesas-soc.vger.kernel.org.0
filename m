Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFCE3C68DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 05:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbhGMDYn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 23:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhGMDYn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 23:24:43 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E13C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 20:21:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id d9-20020a17090ae289b0290172f971883bso555824pjz.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 20:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ftu760fT+oDYYABMgj3gujL49L8RoivNzzzVv+GUXfo=;
        b=VLyjqUZ3rThBwYxHRvQ9f5aHZX1w7BdKcvA8WLV7ImHoLxW6S1VL4xuNmV5D/TtznY
         SNReV6x4gRJEdXXnupCU1WqpHPz9o5YGp75n6gDgi9ZglZQGeIFRC0EGr24/TTFLleS7
         9khrkfZjEipmJVWypuLJ+hRopv388f/3Y/o7uP+ZPHet2sF22b4nkwWizBOx9ALSp4eY
         Kj8ehEJYjGOvyg7dT1Gj1c4KA2qSYYcRpVH5P3z3uXixYK3yRwIcKqoBFwSSlFPitcNe
         gWGnIEfvpEZg98zTCLD0kYBLtnvla+C3LKYwgFs8M1g7JhbBGKllXx6hYwosQs/D1GiH
         CymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ftu760fT+oDYYABMgj3gujL49L8RoivNzzzVv+GUXfo=;
        b=WI56XpWwP6/Kp1iUeUOuMZQrnUz6HO+xOuas9bnklKZCN+o3GFkiMZpA2CR3jJb3nj
         BcRR9Fp1CHi/SyGcyUXj5smTYFBpxXtFcx6KrxVF4K/bqkryxdspDo6Dd1bkBrvgzbfV
         bpbztfTyQzPD5V43rgkEovWbYQsp9lN68bn+aKFP07s7V6hYAjLeNdrSPqPPDrJNCDqA
         sJffigYUtN+SmJhblu+KnFmRGZ/3z64QZR8JAyXMBkBuRj84V97GkHAhqiw48Eyek7fA
         fYFohDMlgnDv0q1EcgsokboXdk+RGO8HgMnG6kWPcYKOjGJwy1FrN8I1h4XTsFuKnAjI
         tn8w==
X-Gm-Message-State: AOAM532h1sb7Imvj9jju7od06YyVL1gIf9H3U57sWiXJTT9JCcwy4LSZ
        ALxFAUhFegWS/dydCVOzl39bi56CxogMk03E
X-Google-Smtp-Source: ABdhPJw3Wt7X+27hgXOP44IlfZ3F4YdU6vkr+/1iMRuZvwyqlgamDoHsRZ5gTofheI1DxZA6IXlKmA==
X-Received: by 2002:a17:90b:806:: with SMTP id bk6mr2185222pjb.13.1626146512491;
        Mon, 12 Jul 2021 20:21:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r10sm19360087pga.48.2021.07.12.20.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 20:21:52 -0700 (PDT)
Message-ID: <60ed06d0.1c69fb81.b9af4.b1df@mx.google.com>
Date:   Mon, 12 Jul 2021 20:21:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-17-gcd117793e1ac
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 59 runs,
 14 regressions (v5.14-rc1-17-gcd117793e1ac)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 59 runs, 14 regressions (v5.14-rc1-17-gcd117793e=
1ac)

Regressions Summary
-------------------

platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
beaglebone-black | arm   | lab-cip         | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =

beaglebone-black | arm   | lab-cip         | gcc-8    | multi_v7_defconfig =
          | 1          =

beaglebone-black | arm   | lab-collabora   | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =

beaglebone-black | arm   | lab-collabora   | gcc-8    | multi_v7_defconfig =
          | 1          =

beaglebone-black | arm   | lab-cip         | gcc-8    | omap2plus_defconfig=
          | 1          =

beaglebone-black | arm   | lab-collabora   | gcc-8    | omap2plus_defconfig=
          | 1          =

dove-cubox       | arm   | lab-pengutronix | gcc-8    | multi_v7_defconfig =
          | 1          =

hip07-d05        | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

hip07-d05        | arm64 | lab-collabora   | gcc-8    | defconfig          =
          | 1          =

meson-gxm-q200   | arm64 | lab-baylibre    | gcc-8    | defconfig          =
          | 1          =

rk3399-gru-kevin | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 2          =

rk3399-gru-kevin | arm64 | lab-collabora   | gcc-8    | defconfig          =
          | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.14-=
rc1-17-gcd117793e1ac/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: v5.14-rc1-17-gcd117793e1ac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cd117793e1ac66174038470d85471fa4d9e226b9 =



Test Regressions
---------------- =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
beaglebone-black | arm   | lab-cip         | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccb8f932eee492a117976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-nfs-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-nfs-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60eccb8f932eee492=
a117977
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
beaglebone-black | arm   | lab-cip         | gcc-8    | multi_v7_defconfig =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccd83797d09026a117991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebone-blac=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebone-blac=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60eccd83797d09026=
a117992
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
beaglebone-black | arm   | lab-collabora   | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd0bbf8fe0222b6117980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baselin=
e-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecd0bbf8fe0222b=
6117981
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
beaglebone-black | arm   | lab-collabora   | gcc-8    | multi_v7_defconfig =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd3b3efffdc965e11797b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecd3b3efffdc965=
e11797c
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
beaglebone-black | arm   | lab-cip         | gcc-8    | omap2plus_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecceebf57ef53b0811796c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebone-bla=
ck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beaglebone-bla=
ck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecceebf57ef53b0=
811796d
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
beaglebone-black | arm   | lab-collabora   | gcc-8    | omap2plus_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd6c34b941a091c117980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nfs-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nfs-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecd6c34b941a091=
c117981
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
dove-cubox       | arm   | lab-pengutronix | gcc-8    | multi_v7_defconfig =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd0381a78dc708f1179a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove-cu=
box.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove-cu=
box.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecd0381a78dc708=
f1179a5
        failing since 76 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
hip07-d05        | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecf47feb37e9b4e7117982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecf47feb37e9b4e=
7117983
        failing since 4 days (last pass: renesas-next-2021-06-07-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
hip07-d05        | arm64 | lab-collabora   | gcc-8    | defconfig          =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecf902aef3f8092f1179af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecf902aef3f8092=
f1179b0
        failing since 4 days (last pass: renesas-next-2021-06-07-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
meson-gxm-q200   | arm64 | lab-baylibre    | gcc-8    | defconfig          =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd71a82534d0f9a11799d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-q200.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ecd71a82534d0f9=
a11799e
        failing since 101 days (last pass: renesas-next-2020-10-26-v5.10-rc=
1, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
rk3399-gru-kevin | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ece04364cfedaa3911796c

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/bas=
eline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ece04364cfedaa39117976
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T00:37:16.235652  /lava-4187491/1/../bin/lava-test-case
    2021-07-13T00:37:16.265083  <8>[   98.017753] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ece04364cfedaa39117977
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T00:37:15.171630  /lava-4187491/1/../bin/lava-test-case
    2021-07-13T00:37:15.202143  <8>[   96.954833] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
rk3399-gru-kevin | arm64 | lab-collabora   | gcc-8    | defconfig          =
          | 2          =


  Details:     https://kernelci.org/test/plan/id/60ece605b034be19c311796a

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ece605b034be19c3117974
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T01:01:43.904549  <8>[   56.182752] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-13T01:01:44.944501  /lava-4187611/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ece605b034be19c3117975
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T01:01:43.873150  /lava-4187611/1/../bin/lava-test-case   =

 =20
