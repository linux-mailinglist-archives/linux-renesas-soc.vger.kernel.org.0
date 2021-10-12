Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362CB42AD8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 22:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbhJLUF3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 16:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLUF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 16:05:28 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD09DC061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 13:03:26 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id oa4so488490pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 13:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KH3wvsgPT7bWLEoNf1r59SiaDy6v0yIGK4ms71VEaIk=;
        b=f5AHG3Pxnq8hRf89yaf5uXFa9p6Wc9mR+mWwBAXihswLwdwG3ci+3+D0tvL+NSDJ1W
         2Uw+3lH1wz+RvkbTFQCcK2/QCvz/qs14p4cXjNY5Lfijv28E3pd2t6W2LIkdzWrfV7TH
         rYZFxIH3SdZ6KqeILq0lC6rSYQPtGZ8HxwOQsEyhtlbZsuPbh7VefQSkgKaJf7HLdukA
         aG6P1XijUeeOrppT7c8I9ae9hRGp02pu4/rvYp3zbmvcJyP6bGm4C8UtQKKAapG87enS
         6XhlVUP0AfdICzjLzq61fTfqBNPrkvIsihfk2UFAEd03GFC0zTGPRMoSwUXJqf4ccibl
         cz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KH3wvsgPT7bWLEoNf1r59SiaDy6v0yIGK4ms71VEaIk=;
        b=J5fE22YhbC80Rs2VLbYlerWuRGfct0UumVzjywlpTIJFgTX2EYfk9g+yGjBE7btwel
         LmMospST/h2DoVCps3StO9pJiHiZvbqe7ADwqjDJ1/nz7l4il9OJesHPDDgc3xe51wjC
         zkxJDvp2JSKz1mL7sqHiKhGoyJvlZIfxZlHNz5Mx/240UIlgwjjIK5bfvxX8TdelMfpV
         e1C7eUUxpz+96YxvKvh02BLuA3NyMbl3MhhMFEyTTVF1aOie/jVXf9cMzIPT6bi4IwkG
         xr8BgPvO4iGRdJaXm7IElS0TbVLZhyo6sTcuVzmn47XXCTatWywUjNGudIuH1pnDJsGr
         UCgQ==
X-Gm-Message-State: AOAM531AETUcXMsxtELh4RSvqahxZVnfV4ifuZ6zG5LvVEeGJt3/whrb
        5LXCIXg3tktvTHus+ihgMZKfqiUGmG/QW99a
X-Google-Smtp-Source: ABdhPJzqX9EgYStzptTM0dtE38yO9YQRftCSyWeuPfb34U0LRqn62n0dEi6YRUnBgsO+0/DT7qKZVw==
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr8346501pjb.24.1634069006103;
        Tue, 12 Oct 2021 13:03:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z68sm8492944pgz.90.2021.10.12.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 13:03:25 -0700 (PDT)
Message-ID: <6165ea0d.1c69fb81.f1b37.7243@mx.google.com>
Date:   Tue, 12 Oct 2021 13:03:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-10-11-v5.15-rc5
Subject: renesas/master baseline: 292 runs,
 11 regressions (renesas-devel-2021-10-11-v5.15-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 292 runs, 11 regressions (renesas-devel-2021-10-11=
-v5.15-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =

beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig+im=
a       | 1          =

beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig   =
        | 1          =

beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =

beagle-xm        | arm   | lab-baylibre  | gcc-8    | omap2plus_defconfig  =
        | 1          =

hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

imx6q-sabresd    | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconfig  =
        | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-11-v5.15-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-11-v5.15-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e602e69ec04a3e0887e4fd9189250b4e7ee7e23 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b40f7d8219439f08fb0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165b40f7d8219439f08f=
b0c
        failing since 244 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig+im=
a       | 1          =


  Details:     https://kernelci.org/test/plan/id/6165aa99f5ef61429108fab7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165aa99f5ef61429108f=
ab8
        failing since 3 days (last pass: renesas-devel-2021-10-04-v5.15-rc4=
, first fail: renesas-devel-2021-10-08-v5.15-rc4) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig   =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6165aafdf085ea39ee08fb17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165aafdf085ea39ee08f=
b18
        failing since 77 days (last pass: renesas-devel-2021-07-19-v5.14-rc=
2, first fail: renesas-devel-2021-07-26-v5.14-rc3) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b3971772fca53808faa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165b3971772fca53808f=
aa7
        failing since 20 days (last pass: v5.15-rc1-564-ge23d26d2dc9a, firs=
t fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beagle-xm        | arm   | lab-baylibre  | gcc-8    | omap2plus_defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b4eb4675ec543c08fad3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165b4eb4675ec543c08f=
ad4
        failing since 7 days (last pass: renesas-devel-2021-09-24-v5.15-rc2=
, first fail: renesas-devel-2021-10-04-v5.15-rc4) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b6a4f7d5f6be5d08fb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165b6a4f7d5f6be5d08f=
b20
        failing since 91 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx6q-sabresd    | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b25d541d6dc86908fab1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165b25d541d6dc86908f=
ab2
        failing since 344 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6165b5c2c27021034d08fac0

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/616=
5b5c2c27021034d08fac7
        failing since 154 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-10-12T16:19:59.010569  /lava-4702702/1/../bin/lava-test-case
    2021-10-12T16:19:59.019124  <8>[   27.118276] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6165b5c2c27021034d08faca
        failing since 154 days (last pass: v5.12-451-gae657abc971d2, first =
fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-10-12T16:19:57.897917  /lava-4702702/1/../bin/lava-test-case
    2021-10-12T16:19:57.907156  <8>[   26.005315] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6165b67fd01df6767008fac4

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6165b67fd01df6767008face
        failing since 91 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c)

    2021-10-12T16:23:13.160141  <8>[   23.960875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-10-12T16:23:14.181314  /lava-4702718/1/../bin/lava-test-case
    2021-10-12T16:23:14.192885  <8>[   24.994490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6165b67fd01df6767008facf
        failing since 91 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c)

    2021-10-12T16:23:13.148369  /lava-4702718/1/../bin/lava-test-case   =

 =20
