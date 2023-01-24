Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07567679FD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 18:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbjAXRMF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 12:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbjAXRME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 12:12:04 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0D683E6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:12:00 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id jm10so15319123plb.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L3RGt1DANkwn2A4fjxL94ismJvpLddtzEJp4Erb9O3Y=;
        b=1Shb4Ih7N0GoQN+Hb31bvIvSAp95HyRvAN556Smcr6tpbkUJDcQ0QNeY8P1DPIji6M
         dLCM756CxKqre+nN7KbXv+OMVb3ISp596k2gJnqXOTP1M7t6w7r0BjJqhT7DTtUjd9UM
         eBSw/RbfFOEBZ1wQ30RPcE0VEcA++SX6dMyVZFRmCLOzme7AJ653OFvVe6ji72awKtqo
         CpnGrXO+35LcYUJmLQ+7/ZT3+MuRkQwTmfGebFbJU1dOR3l2V6KU4K87+4dIhgOHO94w
         h/RwdhdCb0t2fCsV6sAJXWC6ZIf46Jt6tSJOrnL2OBYzbxdnALlSLTBp8KlXYW3pJYNL
         J6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3RGt1DANkwn2A4fjxL94ismJvpLddtzEJp4Erb9O3Y=;
        b=oZNmzZLppLQfHcJNf0W5JvczQGPSGx8iz8b7oCcxBdOQOxE7untI14HEP8Hf7VxHnP
         VaHAqAiftFrDT5AiCAqluuYlFkhrwizNUGfF24y9oDP0fCyUdznlMsB/EJTy5Hykj/id
         U/OOjE07V3YtR5C1Jg4omIBkTuyaRZQOWWvnMAs3jm0rNjyDs/QcRacBU/qIS+unkkpD
         p4CrcNUNZw/ao9Qwx0kdXndAmRndVVQT4JPPOEwZZJH5tOzOjRUJoUKKvY4giF+pFZ+8
         vzoynaPLXtGsrZm3+R7LxL61kykNLdTaBZLNbrR1hVayA7eAOek02CKu4Jd4qQctxWWI
         CYXw==
X-Gm-Message-State: AFqh2krr28qABpv0/SZHVSFO8XfwgJTpsuw5/I2vfCtbI+GachWfG8j+
        c92LxxQmFjN0fEoymGZbJh3guZMlurIkQ5w+VBk=
X-Google-Smtp-Source: AMrXdXuf6RIriG8jDymRG/OFOaNHh1XEaIkPyZt4pitYjmSz7fyGvsjxqNaqtniw8HlI5h+cm2Sf1w==
X-Received: by 2002:a17:902:db08:b0:194:93cb:9304 with SMTP id m8-20020a170902db0800b0019493cb9304mr39720702plx.29.1674580319448;
        Tue, 24 Jan 2023 09:11:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902854700b00195e6ea45a8sm1891350plo.305.2023.01.24.09.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 09:11:58 -0800 (PST)
Message-ID: <63d0115e.170a0220.14a18.3532@mx.google.com>
Date:   Tue, 24 Jan 2023 09:11:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2023-01-24-v6.2-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 455 runs,
 14 regressions (renesas-next-2023-01-24-v6.2-rc1)
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

renesas/next baseline: 455 runs, 14 regressions (renesas-next-2023-01-24-v6=
.2-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-24-v6.2-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-24-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      29fea68a8aaad7d0cab07f538d02aa03ad75fb48 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfd620a29b9a7227915edd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfd621a29b9a7227915ee2
        failing since 11 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-01-24T12:58:49.168672  + set +x
    2023-01-24T12:58:49.172537  <8>[   16.635448] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 165682_1.5.2.4.1>
    2023-01-24T12:58:49.283600  / # #
    2023-01-24T12:58:49.385238  export SHELL=3D/bin/sh
    2023-01-24T12:58:49.385740  #
    2023-01-24T12:58:49.487324  / # export SHELL=3D/bin/sh. /lava-165682/en=
vironment
    2023-01-24T12:58:49.487769  =

    2023-01-24T12:58:49.589540  / # . /lava-165682/environment/lava-165682/=
bin/lava-test-runner /lava-165682/1
    2023-01-24T12:58:49.590213  =

    2023-01-24T12:58:49.597070  / # /lava-165682/bin/lava-test-runner /lava=
-165682/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfda33e7aa844f4d915ec5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfda33e7aa844f4d915eca
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-24T13:16:15.215862  <8>[   24.178149] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3199355_1.5.2.4.1>
    2023-01-24T13:16:15.324534  / # #
    2023-01-24T13:16:15.426077  export SHELL=3D/bin/sh
    2023-01-24T13:16:15.426435  #
    2023-01-24T13:16:15.527717  / # export SHELL=3D/bin/sh. /lava-3199355/e=
nvironment
    2023-01-24T13:16:15.528117  =

    2023-01-24T13:16:15.629328  / # . /lava-3199355/environment/lava-319935=
5/bin/lava-test-runner /lava-3199355/1
    2023-01-24T13:16:15.629929  =

    2023-01-24T13:16:15.634018  / # /lava-3199355/bin/lava-test-runner /lav=
a-3199355/1
    2023-01-24T13:16:15.722133  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdbad2d8223748b915ecc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfdbad2d8223748b915ed1
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-24T13:22:33.142508  <8>[   16.499945] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3199625_1.5.2.4.1>
    2023-01-24T13:22:33.248799  / # #
    2023-01-24T13:22:33.350332  export SHELL=3D/bin/sh
    2023-01-24T13:22:33.350697  #
    2023-01-24T13:22:33.451864  / # export SHELL=3D/bin/sh. /lava-3199625/e=
nvironment
    2023-01-24T13:22:33.452352  =

    2023-01-24T13:22:33.553715  / # . /lava-3199625/environment/lava-319962=
5/bin/lava-test-runner /lava-3199625/1
    2023-01-24T13:22:33.554624  =

    2023-01-24T13:22:33.559308  / # /lava-3199625/bin/lava-test-runner /lav=
a-3199625/1
    2023-01-24T13:22:33.644892  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdc2ef24512f800915f06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfdc2ef24512f800915f0b
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-24T13:24:41.850712  + set +x
    2023-01-24T13:24:41.859866  <8>[   14.672126] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3199757_1.5.2.4.1>
    2023-01-24T13:24:41.969646  / # #
    2023-01-24T13:24:42.072727  export SHELL=3D/bin/sh
    2023-01-24T13:24:42.073639  #
    2023-01-24T13:24:42.175655  / # export SHELL=3D/bin/sh. /lava-3199757/e=
nvironment
    2023-01-24T13:24:42.176524  =

    2023-01-24T13:24:42.278532  / # . /lava-3199757/environment/lava-319975=
7/bin/lava-test-runner /lava-3199757/1
    2023-01-24T13:24:42.279975  =

    2023-01-24T13:24:42.284684  / # /lava-3199757/bin/lava-test-runner /lav=
a-3199757/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdcd1308a0785e5915f23

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfdcd1308a0785e5915f28
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-24T13:27:29.579944  <8>[   15.338929] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3199768_1.5.2.4.1>
    2023-01-24T13:27:29.686769  / # #
    2023-01-24T13:27:29.790494  export SHELL=3D/bin/sh
    2023-01-24T13:27:29.790865  #
    2023-01-24T13:27:29.791019  / # export SHELL=3D/bin/sh<3>[   15.517013]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-01-24T13:27:29.892057  . /lava-3199768/environment
    2023-01-24T13:27:29.892416  =

    2023-01-24T13:27:29.993557  / # . /lava-3199768/environment/lava-319976=
8/bin/lava-test-runner /lava-3199768/1
    2023-01-24T13:27:29.994093  =

    2023-01-24T13:27:29.998882  / # /lava-3199768/bin/lava-test-runner /lav=
a-3199768/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdee435a1fa29f4915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfdee435a1fa29f4915ec6
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-24T13:36:19.935399  + set +x<8>[   15.362150] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3199870_1.5.2.4.1>
    2023-01-24T13:36:19.935612  =

    2023-01-24T13:36:20.038657  / # #
    2023-01-24T13:36:20.140334  export SHELL=3D/bin/sh
    2023-01-24T13:36:20.140761  #
    2023-01-24T13:36:20.242069  / # export SHELL=3D/bin/sh. /lava-3199870/e=
nvironment
    2023-01-24T13:36:20.242447  =

    2023-01-24T13:36:20.343732  / # . /lava-3199870/environment/lava-319987=
0/bin/lava-test-runner /lava-3199870/1
    2023-01-24T13:36:20.344403  <3>[   15.677034] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-01-24T13:36:20.344669   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdc088cea60001e915ee3

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
3cfdc088cea60001e915ef2
        new failure (last pass: renesas-next-2023-01-12-v6.2-rc1)

    2023-01-24T13:23:59.123220  /usr/bin/tpm2_getcap
    2023-01-24T13:23:59.153132  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-01-24T13:23:59.158691  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-01-24T13:23:59.169151  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =

    2023-01-24T13:23:59.172949  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure
    2023-01-24T13:23:59.175416  ERROR: Unable to run tpm2_getcap
    2023-01-24T13:24:00.171114  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-01-24T13:24:00.180621  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-01-24T13:24:00.189797  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =

    2023-01-24T13:24:00.192280   =

    ... (47 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfd8a185a11f821c915eeb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfd8a185a11f821c915ef0
        new failure (last pass: renesas-next-2023-01-12-v6.2-rc1)

    2023-01-24T13:09:47.946899  + set[   27.193717] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 886165_1.5.2.3.1>
    2023-01-24T13:09:47.947075   +x
    2023-01-24T13:09:48.052916  / # #
    2023-01-24T13:09:48.154526  export SHELL=3D/bin/sh
    2023-01-24T13:09:48.155065  #
    2023-01-24T13:09:48.256431  / # export SHELL=3D/bin/sh. /lava-886165/en=
vironment
    2023-01-24T13:09:48.256905  =

    2023-01-24T13:09:48.260894  / # . /lava-886165/environment
    2023-01-24T13:09:48.362599  / # /lava-886165/bin/lava-test-runner /lava=
-886165/1
    2023-01-24T13:09:48.366933  /lava-886165/bin/lava-test-runner /lava-886=
165/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfde0432257236b0915f39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfde0432257236b0915=
f3a
        failing since 11 days (last pass: renesas-next-2022-09-18-v6.0-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdced0d4a544827915eec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfdced0d4a544827915=
eed
        failing since 11 days (last pass: renesas-next-2022-09-18-v6.0-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfde1a694ac51ac7915efb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfde1a694ac51ac7915=
efc
        failing since 231 days (last pass: renesas-next-2022-05-05-v5.18-rc=
1, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfda596e9f7a38e1915f4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb=
-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb=
-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfda596e9f7a38e1915=
f4d
        new failure (last pass: renesas-next-2022-10-24-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdd144d3d0c3e1d915edd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-brooni=
e/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-brooni=
e/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfdd144d3d0c3e1d915=
ede
        new failure (last pass: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfd6bfe54447930e915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfd6bfe54447930e915=
ec9
        failing since 98 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =20
