Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C8B413EB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 02:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhIVAs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 20:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhIVAs3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 20:48:29 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E361C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 17:47:00 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mv7-20020a17090b198700b0019c843e7233so959980pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 17:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NSZFLXTHDu7L+aEdpN5yscocB2SDOw9T616Lz4HYEtE=;
        b=Of+N35zZ3EpF6andw1PL4y5qo5kA6ZwtKZIM3npNZGMy/sfOzqA2DavSv5yhubvrrx
         dehEwtaNu4C+dENQIDIrfBAoOSX8DmjneOAUbn+EdzGXKK4w0qY5CoJH5AFJRHWbQg4L
         Xgmbw2xjlgkVRZ46VBozAxCQpvNsse0NGE2LuSJXoQXMOo3t6CCYTn9UcEamL3Ea04V3
         /HZiHQxwOXrfjaeYAXm5yW087p9to2RNH+hDh+KsELA+GpeCniR7plp6SGngOE7YrAMB
         FScIGubwQSoNd7uLr8iT5R+BWFUAgawwPLIYjYjCjB0zPeQcXabNdfX/1Wf4EAFIJR8o
         C4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NSZFLXTHDu7L+aEdpN5yscocB2SDOw9T616Lz4HYEtE=;
        b=eHcb/Cjtg/Ouewefv+O8O9SD6H4v+c1nPUeIIevREbQJy1dyE5ecz3QdJINq7lJ5xY
         P+B9RugJyCZo9xASxWr0Iu0YUAg4zkOY3Kjus6pHXijIvum0nZ9qHmNhMdtUV+Sbhz4l
         /++JKTdhlEuUdWLC1AK+OqRt1UDY2EUb1ZWjwpTB3FAvoiC3BTpHKHgXUxH7EXGxjIav
         4P+dJ/lS4PgBf+SPpZVMzprXisDYneS2x4ZPdaTUjDMHm3Orl5EokVZkQ7tZ987P79yR
         VdrPl96JhpwruNdby9fEUu8dUIs0xC3mhs3WLqUHojIuvWD6yjWeEp2byajjNlgonzZv
         G1kg==
X-Gm-Message-State: AOAM5324QReShuUNFc4vVgRB/CYtKEUQO9OO9DomQEco8fhK6rCC1B8M
        BDfzlfkdMDzvvwf5PGHGadz+N29kYzGSUWHT
X-Google-Smtp-Source: ABdhPJy9CvmVAERiM+KzKl4FK0HQLmZdMo8ymhTVdHTXZyH5UqYUyFasSmlLS9TjAkBedwIoKNzNNw==
X-Received: by 2002:a17:903:1207:b0:138:e2f9:6c98 with SMTP id l7-20020a170903120700b00138e2f96c98mr30664252plh.11.1632271619552;
        Tue, 21 Sep 2021 17:46:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b6sm102173pfo.98.2021.09.21.17.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 17:46:59 -0700 (PDT)
Message-ID: <614a7d03.1c69fb81.1fec8.0b93@mx.google.com>
Date:   Tue, 21 Sep 2021 17:46:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-20-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 296 runs,
 13 regressions (renesas-devel-2021-09-20-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 296 runs, 13 regressions (renesas-devel-2021-09-20=
-v5.15-rc2)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g           | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-20-v5.15-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-20-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4a7c76d8d5a91d210d64552d5e29fd02a115fce7 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614a464a921241794999a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a464a921241794999a=
2f8
        failing since 223 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a435561a17dec6899a318

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a435561a17dec6899a=
319
        failing since 56 days (last pass: renesas-devel-2021-07-19-v5.14-rc=
2, first fail: renesas-devel-2021-07-26-v5.14-rc3) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614a44a90913df012d99a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a44a90913df012d99a=
2e3
        new failure (last pass: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/614a45fdb1569a83dd99a2ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a45fdb1569a83dd99a=
2eb
        failing since 29 days (last pass: renesas-devel-2021-07-27-v5.14-rc=
3, first fail: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a4689e74956f5da99a2f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a4689e74956f5da99a=
2f1
        new failure (last pass: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a59186f15a6669899a318

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a59186f15a6669899a=
319
        failing since 70 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/614a49037e89cbb35899a30b

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/614=
a49037e89cbb35899a30e
        failing since 134 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-09-21T21:04:59.375816  /lava-4554074/1/../bin/lava-test-case
    2021-09-21T21:04:59.384102  <8>[   27.507230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/614a49037e89cbb35899a314
        failing since 134 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-09-21T21:04:57.252782  <8>[   25.374371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-driver-present RESULT=3Dpass>
    2021-09-21T21:04:58.264484  /lava-4554074/1/../bin/lava-test-case
    2021-09-21T21:04:58.272686  <8>[   26.395689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a4cdf0534e90f9799a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a4cdf0534e90f9799a=
2db
        failing since 307 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a440ad2b396c92d99a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a440ad2b396c92d99a=
2ea
        failing since 307 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a442b32cb9af53799a2fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a442b32cb9af53799a=
2fd
        failing since 307 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/614a4969e0453e6b8c99a2f0

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/614a4969e0453e6b8c99a2f6
        failing since 70 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c)

    2021-09-21T21:06:36.586884  /lava-4554080/1/../bin/lava-test-case
    2021-09-21T21:06:36.598437  <8>[   25.612481] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/614a4969e0453e6b8c99a2f7
        failing since 70 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c)

    2021-09-21T21:06:35.552010  /lava-4554080/1/../bin/lava-test-case
    2021-09-21T21:06:35.563661  <8>[   24.578329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
