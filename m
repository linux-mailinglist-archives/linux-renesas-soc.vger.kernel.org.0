Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20726815A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 16:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237660AbjA3PzS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 10:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjA3PzP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 10:55:15 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A76126DF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:55:11 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id a184so8052473pfa.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/YH6CMW5rSV1/jrv7n0xby7QeuLbhZO8K6/k4GIJvMI=;
        b=3PQJfQ3PuqBtI59+eI9s2znMt2dovGiRAmtLiw3EebTXW3qPf7DdNnQAok3OCJG3CV
         PJdn5qVdHupMK1HNkGZocUOxIU4p199axEyqaK+nWAg6SKyITIeeSpsiAwi5MYS7Nt1m
         IjCXCDQ9RuBTVnFYqrC+ssqoXc0MMSEKL8ndTl9zBeEYa4hkTGCtY8j2Gmnaq4elYpLL
         jnCrPJ4wnQ9wl3OOCLYFXl4OCHfCv6mi443NQStHrqRjjb/+TrI2R1xNOkmDrXHWhvYz
         Cl6U3bT5qg+52i2M38KiDVFGT6aplwYo3JkGetSVPo1lpB8z4p1O0+OkTcFBnqrDhHJ/
         LRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YH6CMW5rSV1/jrv7n0xby7QeuLbhZO8K6/k4GIJvMI=;
        b=4ZIucjOMLDCnpFjF+oyTFu42cRdMVH2m5qU/qwh3q1lllNF+2mLsQ05JrpjcoWHPCH
         C1KTVa1T2xswvIA18nouJRsj+JMZr/re0j5V6hPtmEcCK0UlQE6SdtwxJEtPeM1OwEgt
         TbPELYvIjr+zJ/pQptcxVi30i40/O7m4i7oyBnGB5lPQ9T1bQRJZ3Vyov3DPa4M3+rx7
         jWGp2rNXpiYyidZA9525Y6MnbJSctRrFYW9Irp33cgDRVCVzoVmxt3A1BSnGE/m+SyHv
         GHq7OFdqP+JQn+vrMpeLYbniCKT8ItjQErYnogGLNFV/E/17pgv/2chwSzveXEYBrkpT
         uKIw==
X-Gm-Message-State: AO0yUKXSMoazOWPloUsn0Rr8DT3DPUfQW97IRBSPsz3x0DFZ3GIKXm4f
        Z9eyx1sorTC7595UOr1b6Gs7FPkuKJw9422oTN3s3Q==
X-Google-Smtp-Source: AK7set/sHQSDfxrSQzgbOp36VmDyzYcbvs9mo/itErjETFdcLngxjYSiTrbIju8jR2t4xtruA2Kfjg==
X-Received: by 2002:aa7:9984:0:b0:593:92b3:b757 with SMTP id k4-20020aa79984000000b0059392b3b757mr8959580pfh.3.1675094110410;
        Mon, 30 Jan 2023 07:55:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u144-20020a627996000000b0055f209690c0sm7623667pfc.50.2023.01.30.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:55:10 -0800 (PST)
Message-ID: <63d7e85e.620a0220.abde4.c0ec@mx.google.com>
Date:   Mon, 30 Jan 2023 07:55:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-30-v6.2-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 177 runs,
 18 regressions (renesas-devel-2023-01-30-v6.2-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 177 runs, 18 regressions (renesas-devel-2023-0=
1-30-v6.2-rc6)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-30-v6.2-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-30-v6.2-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2aad9aa4eb647b900299e3d38d2e9b40b6f83235 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7def0db7083afd0915ed9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7def0db7083afd=
0915eda
        failing since 3 days (last pass: renesas-devel-2023-01-24-v6.2-rc5,=
 first fail: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7e2393b5a2186d5915f35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7e2393b5a2186d5915f3a
        failing since 5 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-30T15:28:47.091037  + set +x
    2023-01-30T15:28:47.094565  [   39.379088] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3246339_1.6.2.4.1>
    2023-01-30T15:28:47.229250  / # #
    2023-01-30T15:28:47.332481  export SHELL=3D/bin/sh
    2023-01-30T15:28:47.333525  #
    2023-01-30T15:28:47.435877  / # export SHELL=3D/bin/sh. /lava-3246339/e=
nvironment
    2023-01-30T15:28:47.436813  =

    2023-01-30T15:28:47.539034  / # . /lava-3246339/environment/lava-324633=
9/bin/lava-test-runner /lava-3246339/1
    2023-01-30T15:28:47.540863  =

    2023-01-30T15:28:47.545870  / # /lava-3246339/bin/lava-test-runner /lav=
a-3246339/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7e548ca8f75f95e915ed0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7e548ca8f75f95e915ed5
        failing since 5 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-30T15:41:31.416586  + set +x[   62.328609] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3246550_1.6.2.4.1>
    2023-01-30T15:41:31.416769  =

    2023-01-30T15:41:31.539797  / # #
    2023-01-30T15:41:31.641248  export SHELL=3D/bin/sh
    2023-01-30T15:41:31.641651  #
    2023-01-30T15:41:31.742832  / # export SHELL=3D/bin/sh. /lava-3246550/e=
nvironment
    2023-01-30T15:41:31.743169  =

    2023-01-30T15:41:31.844378  / # . /lava-3246550/environment/lava-324655=
0/bin/lava-test-runner /lava-3246550/1
    2023-01-30T15:41:31.844944  =

    2023-01-30T15:41:31.849594  / # /lava-3246550/bin/lava-test-runner /lav=
a-3246550/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7bd53160cb3f98a915edb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7bd53160cb3f98a915ee0
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5)

    2023-01-30T12:51:05.362410  + set[   29.320168] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 891902_1.6.2.3.1>
    2023-01-30T12:51:05.362820   +x
    2023-01-30T12:51:05.476302  / # #
    2023-01-30T12:51:05.577817  export SHELL=3D/bin/sh
    2023-01-30T12:51:05.578320  #
    2023-01-30T12:51:05.679614  / # export SHELL=3D/bin/sh. /lava-891902/en=
vironment
    2023-01-30T12:51:05.680077  =

    2023-01-30T12:51:05.781421  / # . /lava-891902/environment/lava-891902/=
bin/lava-test-runner /lava-891902/1
    2023-01-30T12:51:05.781971  =

    2023-01-30T12:51:05.785098  / # /lava-891902/bin/lava-test-runner /lava=
-891902/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c1c8f928f469f0915edf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7c1c8f928f469f0915ee4
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5)

    2023-01-30T13:10:19.287311  + set[   27.781867] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 891918_1.6.2.3.1>
    2023-01-30T13:10:19.287561   +x
    2023-01-30T13:10:19.399369  / # #
    2023-01-30T13:10:19.501228  export SHELL=3D/bin/sh
    2023-01-30T13:10:19.501752  #
    2023-01-30T13:10:19.603056  / # export SHELL=3D/bin/sh. /lava-891918/en=
vironment
    2023-01-30T13:10:19.603571  =

    2023-01-30T13:10:19.704839  / # . /lava-891918/environment/lava-891918/=
bin/lava-test-runner /lava-891918/1
    2023-01-30T13:10:19.705460  =

    2023-01-30T13:10:19.708511  / # /lava-891918/bin/lava-test-runner /lava=
-891918/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7caff58b0c97361915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7caff58b0c97361915ebe
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5)

    2023-01-30T13:49:42.475051  + set[   25.982644] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 891931_1.6.2.3.1>
    2023-01-30T13:49:42.475214   +x
    2023-01-30T13:49:42.587485  #
    2023-01-30T13:49:42.689314  / # #export SHELL=3D/bin/sh
    2023-01-30T13:49:42.689770  =

    2023-01-30T13:49:42.791181  / # export SHELL=3D/bin/sh. /lava-891931/en=
vironment
    2023-01-30T13:49:42.791606  =

    2023-01-30T13:49:42.892930  / # . /lava-891931/environment/lava-891931/=
bin/lava-test-runner /lava-891931/1
    2023-01-30T13:49:42.893769  =

    2023-01-30T13:49:42.896653  / # /lava-891931/bin/lava-test-runner /lava=
-891931/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7cd93a0750bd896915f0c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7cd93a0750bd896915f11
        failing since 14 days (last pass: renesas-devel-2023-01-12-v6.2-rc3=
, first fail: renesas-devel-2023-01-16-v6.2-rc4)

    2023-01-30T14:00:29.010097  + set[   32.160102] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 891952_1.6.2.3.1>
    2023-01-30T14:00:29.010481   +x
    2023-01-30T14:00:29.122959  / # #
    2023-01-30T14:00:29.224646  export SHELL=3D/bin/sh
    2023-01-30T14:00:29.225170  #
    2023-01-30T14:00:29.326466  / # export SHELL=3D/bin/sh. /lava-891952/en=
vironment
    2023-01-30T14:00:29.327000  =

    2023-01-30T14:00:29.428504  / # . /lava-891952/environment/lava-891952/=
bin/lava-test-runner /lava-891952/1
    2023-01-30T14:00:29.429274  =

    2023-01-30T14:00:29.432168  / # /lava-891952/bin/lava-test-runner /lava=
-891952/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c28c1a352f2977915f20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7c28c1a352f297=
7915f21
        failing since 5 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c6c40c8a9d6f2a915f12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7c6c40c8a9d6f2=
a915f13
        failing since 5 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ca845b35b5e548915efb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7ca845b35b5e54=
8915efc
        failing since 48 days (last pass: renesas-devel-2022-11-17-v6.1-rc5=
-5-gf68db0d22967, first fail: renesas-devel-2022-12-12-v6.1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7cc017f8b7b4973915ee4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7cc017f8b7b497=
3915ee5
        failing since 5 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ce0946c0a4cf85915ee0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7ce0946c0a4cf8=
5915ee1
        failing since 5 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c8b848f545d849915ed6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7c8b848f545d84=
9915ed7
        failing since 5 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c42b2cd62ba68a915f2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7c42b2cd62ba68=
a915f2d
        failing since 56 days (last pass: renesas-devel-2022-11-10-v6.1-rc4=
, first fail: v6.1-rc8-929-g112502470f50) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c605fbb1a4d10d915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7c605fbb1a4d10=
d915ed3
        failing since 35 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c9e75024ef4adc915ef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7c9e75024ef4ad=
c915ef5
        failing since 133 days (last pass: renesas-devel-2022-09-05-v6.0-rc=
4, first fail: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ba3684014d8f5f915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7ba3684014d8f5=
f915ecc
        failing since 3 days (last pass: renesas-devel-2023-01-24-v6.2-rc5,=
 first fail: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7e7e6e55fbe6c92915f3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7e7e6e55fbe6c9=
2915f3b
        failing since 28 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
