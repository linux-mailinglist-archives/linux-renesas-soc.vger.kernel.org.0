Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3F96815A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 16:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbjA3Pz0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 10:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237649AbjA3PzW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 10:55:22 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2F710405
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:55:13 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id c124so8044746pfb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VpZ+V5LWbcHsYWzJ6JLeQoz4v85Ygt968HJ4W2dSd/M=;
        b=T/nW6nGsECJ82chQJhM2ZDLhUKKcbH/QaPesoGdnFmNugGZ7nmC9+yJeoQ8V6iRUqg
         3fOKqLSOD6tebWkX024dPMN+D8tfMZMioyCm6mncAVmTv4M1E/3klcmI96bGkRjlMw8x
         om9QmybI83K9zhz7gez2Ly46SltqFr6y0yBSCiytR7pNPAGrwPGpaJ4wKoty31W+Bp73
         Zn91cbVGP5GZBqE0DHLCw11ofr8ySwfXCvCSe0jhVYG7EmV/35qfO2vDCgT2P3CUVjCi
         QP0JmzI5vMIv2xuirHf88kwhnz7I9EnP/FgMmNWvf5pxKxLHvfcLqn/1MInUns8qUEQR
         GT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpZ+V5LWbcHsYWzJ6JLeQoz4v85Ygt968HJ4W2dSd/M=;
        b=W7EALaMpkEJA/Igz0DE/jZp2IRD87swjGayaoGa0tZSR4/McaF8bOGcHu6fcStYqFG
         ZLhJ6tZIiNd1XXy6sO4EYLC/TEYEAiyR85Gm//u2Vtc6Kwj6Wu/WEgRfw6yPlzMkrfEQ
         Hb+8EdwtKgxv+pY5WxyD26c9EVjE9apsxGevn9O2/Q3xXO5EIvxqnm6M0nU8YQfUr/Ew
         Sr//nXA4sSA6VrrUrD2tjFwDlXtmRG7P5N3F1AewUZ29pxeUgY+Ev48Znc0gvQZfSM1J
         9TXkqInvnkruxkHhw86VKMJ9bQZKjZd5/MPswvfsVU8YGt0InpKSKH3SSY391n8sKBIe
         soTQ==
X-Gm-Message-State: AO0yUKVm2cfThF+/q2UDCp52GAmrU0NONdna+I38MBSEqZEpNiJp2zEL
        kb7Bwg1+veg19aitNHe5xt0v+8m4Gqvq0DMafR8NvQ==
X-Google-Smtp-Source: AK7set9WxJaeuyfqmB+sUeXTojSRD4V1rddsY8ew4zxKM8vvqJqjbzfwMV9lwzrfzqMqBvn14hrPIA==
X-Received: by 2002:a05:6a00:3022:b0:592:b93b:afc0 with SMTP id ay34-20020a056a00302200b00592b93bafc0mr12744665pfb.20.1675094111662;
        Mon, 30 Jan 2023 07:55:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 136-20020a62178e000000b0058bc7453285sm7560436pfx.217.2023.01.30.07.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:55:11 -0800 (PST)
Message-ID: <63d7e85f.620a0220.99384.bcf5@mx.google.com>
Date:   Mon, 30 Jan 2023 07:55:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-30-v6.2-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 532 runs,
 29 regressions (renesas-devel-2023-01-30-v6.2-rc6)
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

renesas/master baseline: 532 runs, 29 regressions (renesas-devel-2023-01-30=
-v6.2-rc6)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-30-v6.2-rc6/plan/baseline/

  Test:     baseline
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


  Details:     https://kernelci.org/test/plan/id/63d7b2a8dbaf0c8e0b915f38

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubi=
etruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubi=
etruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b2a8dbaf0c8e0b915f3d
        failing since 5 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-30T12:05:49.112254  <8>[   14.455387] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3246185_1.5.2.4.1>
    2023-01-30T12:05:49.224434  / # #
    2023-01-30T12:05:49.329863  export SHELL=3D/bin/sh
    2023-01-30T12:05:49.330929  #
    2023-01-30T12:05:49.433320  / # export SHELL=3D/bin/sh. /lava-3246185/e=
nvironment
    2023-01-30T12:05:49.434574  =

    2023-01-30T12:05:49.537220  / # . /lava-3246185/environment/lava-324618=
5/bin/lava-test-runner /lava-3246185/1
    2023-01-30T12:05:49.539178  =

    2023-01-30T12:05:49.539701  / # <3>[   14.808264] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-30T12:05:49.545115  /lava-3246185/bin/lava-test-runner /lava-32=
46185/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b33925a507db92915ee6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b33925a507db92915eeb
        failing since 5 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-30T12:07:56.115807  + set +x<8>[   23.289344] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3246293_1.5.2.4.1>
    2023-01-30T12:07:56.116079  =

    2023-01-30T12:07:56.222679  / # #
    2023-01-30T12:07:56.324323  export SHELL=3D/bin/sh
    2023-01-30T12:07:56.324770  #
    2023-01-30T12:07:56.426017  / # export SHELL=3D/bin/sh. /lava-3246293/e=
nvironment
    2023-01-30T12:07:56.426474  =

    2023-01-30T12:07:56.527735  / # . /lava-3246293/environment/lava-324629=
3/bin/lava-test-runner /lava-3246293/1
    2023-01-30T12:07:56.528406  =

    2023-01-30T12:07:56.533507  / # /lava-3246293/bin/lava-test-runner /lav=
a-3246293/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b737a666d0ec2c915ec3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b737a666d0ec2c915ec8
        failing since 5 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-30T12:25:19.831035  <8>[   16.596936] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3246554_1.5.2.4.1>
    2023-01-30T12:25:19.940341  / # #
    2023-01-30T12:25:20.043929  export SHELL=3D/bin/sh
    2023-01-30T12:25:20.045006  #
    2023-01-30T12:25:20.147383  / # export SHELL=3D/bin/sh. /lava-3246554/e=
nvironment
    2023-01-30T12:25:20.148460  =

    2023-01-30T12:25:20.250992  / # . /lava-3246554/environment/lava-324655=
4/bin/lava-test-runner /lava-3246554/1
    2023-01-30T12:25:20.252628  =

    2023-01-30T12:25:20.257868  / # /lava-3246554/bin/lava-test-runner /lav=
a-3246554/1
    2023-01-30T12:25:20.353817  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b92c868c16ba84915f3a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b92c868c16ba84915f3f
        failing since 5 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-30T12:33:25.196658  <8>[   14.919170] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3246663_1.5.2.4.1>
    2023-01-30T12:33:25.308955  / # #
    2023-01-30T12:33:25.413126  export SHELL=3D/bin/sh
    2023-01-30T12:33:25.414419  #
    2023-01-30T12:33:25.415148  / # export SHELL=3D/bin/sh<3>[   15.130150]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-01-30T12:33:25.517478  . /lava-3246663/environment
    2023-01-30T12:33:25.518742  =

    2023-01-30T12:33:25.620934  / # . /lava-3246663/environment/lava-324666=
3/bin/lava-test-runner /lava-3246663/1
    2023-01-30T12:33:25.622696  =

    2023-01-30T12:33:25.627595  / # /lava-3246663/bin/lava-test-runner /lav=
a-3246663/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b187df204ac4a9915eeb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b187df204ac4a9915ef0
        new failure (last pass: v6.1-rc8-929-g112502470f50)

    2023-01-30T12:00:53.482917  + set +x
    2023-01-30T12:00:53.483102  [   12.928894] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891899_1.5.2.3.1>
    2023-01-30T12:00:53.590836  / # #
    2023-01-30T12:00:53.692348  export SHELL=3D/bin/sh
    2023-01-30T12:00:53.692862  #
    2023-01-30T12:00:53.794209  / # export SHELL=3D/bin/sh. /lava-891899/en=
vironment
    2023-01-30T12:00:53.794680  =

    2023-01-30T12:00:53.896038  / # . /lava-891899/environment/lava-891899/=
bin/lava-test-runner /lava-891899/1
    2023-01-30T12:00:53.896773  =

    2023-01-30T12:00:53.899743  / # /lava-891899/bin/lava-test-runner /lava=
-891899/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b1d811d9ddfbfe915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b1d811d9ddfbfe915ec6
        new failure (last pass: v6.1-rc8-929-g112502470f50)

    2023-01-30T12:02:15.179368  + set +x
    2023-01-30T12:02:15.179580  [   16.144939] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891905_1.5.2.3.1>
    2023-01-30T12:02:15.287504  / # #
    2023-01-30T12:02:15.388999  export SHELL=3D/bin/sh
    2023-01-30T12:02:15.389525  #
    2023-01-30T12:02:15.490944  / # export SHELL=3D/bin/sh. /lava-891905/en=
vironment
    2023-01-30T12:02:15.491363  =

    2023-01-30T12:02:15.592850  / # . /lava-891905/environment/lava-891905/=
bin/lava-test-runner /lava-891905/1
    2023-01-30T12:02:15.593433  =

    2023-01-30T12:02:15.597009  / # /lava-891905/bin/lava-test-runner /lava=
-891905/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b228dd8bbaa8e1915ef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b228dd8bbaa8e1915efc
        new failure (last pass: v6.1-rc8-929-g112502470f50)

    2023-01-30T12:03:31.190109  + set +x
    2023-01-30T12:03:31.190311  [   12.917637] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891913_1.5.2.3.1>
    2023-01-30T12:03:31.298574  / # #
    2023-01-30T12:03:31.400382  export SHELL=3D/bin/sh
    2023-01-30T12:03:31.400857  #
    2023-01-30T12:03:31.502118  / # export SHELL=3D/bin/sh. /lava-891913/en=
vironment
    2023-01-30T12:03:31.502625  =

    2023-01-30T12:03:31.603909  / # . /lava-891913/environment/lava-891913/=
bin/lava-test-runner /lava-891913/1
    2023-01-30T12:03:31.604535  =

    2023-01-30T12:03:31.607659  / # /lava-891913/bin/lava-test-runner /lava=
-891913/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b494ed72a31c00915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b494ed72a31c00915ebe
        new failure (last pass: v6.1-rc8-929-g112502470f50)

    2023-01-30T12:13:50.075018  + set +x
    2023-01-30T12:13:50.075190  [   11.972067] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891928_1.5.2.3.1>
    2023-01-30T12:13:50.181932  / # #
    2023-01-30T12:13:50.283407  export SHELL=3D/bin/sh
    2023-01-30T12:13:50.283825  #
    2023-01-30T12:13:50.384996  / # export SHELL=3D/bin/sh. /lava-891928/en=
vironment
    2023-01-30T12:13:50.385438  =

    2023-01-30T12:13:50.486704  / # . /lava-891928/environment/lava-891928/=
bin/lava-test-runner /lava-891928/1
    2023-01-30T12:13:50.487261  =

    2023-01-30T12:13:50.490689  / # /lava-891928/bin/lava-test-runner /lava=
-891928/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b69cc6ee0ad83f915eef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b69cc6ee0ad83f915ef4
        new failure (last pass: v6.1-rc8-929-g112502470f50)

    2023-01-30T12:22:31.319006  + set +x
    2023-01-30T12:22:31.319234  [   12.606370] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891954_1.5.2.3.1>
    2023-01-30T12:22:31.426314  / # #
    2023-01-30T12:22:31.528102  export SHELL=3D/bin/sh
    2023-01-30T12:22:31.528597  #
    2023-01-30T12:22:31.629762  / # export SHELL=3D/bin/sh. /lava-891954/en=
vironment
    2023-01-30T12:22:31.630218  =

    2023-01-30T12:22:31.731467  / # . /lava-891954/environment/lava-891954/=
bin/lava-test-runner /lava-891954/1
    2023-01-30T12:22:31.732093  =

    2023-01-30T12:22:31.735273  / # /lava-891954/bin/lava-test-runner /lava=
-891954/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b47e93afae6cb2915ed7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7b47e93afae6cb2915edc
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5)

    2023-01-30T12:13:29.012705  + set[   14.517842] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 891929_1.5.2.3.1>
    2023-01-30T12:13:29.012891   +x
    2023-01-30T12:13:29.118471  / # #
    2023-01-30T12:13:29.219974  export SHELL=3D/bin/sh
    2023-01-30T12:13:29.220474  #
    2023-01-30T12:13:29.321790  / # export SHELL=3D/bin/sh. /lava-891929/en=
vironment
    2023-01-30T12:13:29.322191  =

    2023-01-30T12:13:29.423447  / # . /lava-891929/environment/lava-891929/=
bin/lava-test-runner /lava-891929/1
    2023-01-30T12:13:29.424105  =

    2023-01-30T12:13:29.426856  / # /lava-891929/bin/lava-test-runner /lava=
-891929/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b5e6c9572eed2c915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b5e6c9572eed2c915=
ed3
        failing since 80 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7af92f457aa65fa915f08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7af92f457aa65fa915=
f09
        failing since 139 days (last pass: renesas-devel-2022-07-05-v5.19-r=
c5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b06ea1d8506824915ec1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b06ea1d8506824915=
ec2
        failing since 140 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b5fb5de00e8c0c915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b5fb5de00e8c0c915=
ebb
        failing since 80 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b1fb678e617f46915ef1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b1fb678e617f46915=
ef2
        failing since 275 days (last pass: renesas-devel-2022-04-13-v5.18-r=
c2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b06e2efee3207b915f28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b06e2efee3207b915=
f29
        new failure (last pass: renesas-devel-2023-01-26-v6.2-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ae79a3919415f8915eef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7ae79a3919415f8915=
ef0
        failing since 104 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b57580ef38ad45915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b57580ef38ad45915=
ee0
        failing since 104 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b76160d17f6ed4915f28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b76160d17f6ed4915=
f29
        failing since 104 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b4b2a0bad2c32a915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b4b3a0bad2c32a915=
ec6
        failing since 104 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b57980ef38ad45915efb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b57980ef38ad45915=
efc
        failing since 104 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b78808eae26a37915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b78808eae26a37915=
ebb
        failing since 104 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b57480ef38ad45915ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b57480ef38ad45915=
ed1
        failing since 104 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b76060d17f6ed4915f25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b76060d17f6ed4915=
f26
        failing since 104 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b4ac53a85a12b3915ebf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b4ac53a85a12b3915=
ec0
        failing since 104 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b57780ef38ad45915eed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b57780ef38ad45915=
eee
        failing since 104 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b7747f70cbec83915f32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b7747f70cbec83915=
f33
        failing since 104 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7e6695f33e37860915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7e6695f33e37860915=
ecd
        failing since 28 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7d5ff7e129cacc7915ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-30-v6.2-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7d5ff7e129cacc7915=
ee9
        failing since 26 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
