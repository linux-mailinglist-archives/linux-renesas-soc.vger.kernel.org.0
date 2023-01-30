Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3F4681480
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 16:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjA3PPB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 10:15:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238150AbjA3POx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 10:14:53 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7DA2C67A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:14:31 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id j5so11351188pjn.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pxqzL2jsxhMAfpq+ykZAm1mc6vHyZHn7e4HI/CSDZgU=;
        b=6OFz1kT6hsEBdcC+eOPAk8ko1cqA8VsXaL8TQtNbSpng0J4qjGRyiInYuWsqVh1nAV
         Q9sANE6cAfD4jTGZRk1pxOXwB+xRp5k0q8szrFeUcutnv+3vqB5gi0Icl57kMacmrCM+
         +OEkVjUea+Eg9CT6hmWqMQ0Ny60mBg+ry9Y+uFe4etcejIuA4JAAagd/abxBQP/sgrrT
         PM6eaf5SCYS4/oFFxQ84xqTxuwofrBW4ia4XdJ+H2sJIX6UpXg29rwCNYWmkEL3Ycj47
         +Br4WI60QZ7WltFWmxW83+0ei+NeKF2c5nQ2hBjUzilZUjDfr1xz3ARPRAlA/9wXhjDE
         dMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxqzL2jsxhMAfpq+ykZAm1mc6vHyZHn7e4HI/CSDZgU=;
        b=g13hxh6axBfchJnBLw/KZ/vnwhyc4UIa/h7vmWIwqBIadekm4ELE5uCcVya+uMPdCE
         dJb0CYmeV4j3hg4WZvX5JlB/P2HZ369AFa4ByMxcuCFAq7dQatEz13SzNTdmSRdVUsUW
         fy8MIO2tAMM/l+G7Wxv6tVgErBClAnDD/gVMJ2AErpXgba5ZqQIX3Xm1db2Mp3BivC+U
         ZQs3i3A26bmYKjDHQ2R6yIGFp8PKFMHC5GOAyNQf5GYM6lbfm7IkP0HsDigMpvR7ie61
         akEFdTOgqi0BhsLwsiRG9JOHNDkFlIDeFSmslzJUOtp0xANbgy3mGyNSIh1cAP4ibUr4
         oqBQ==
X-Gm-Message-State: AFqh2kqMbc2uNsdIxjjy63fLpczc8usUDs49sEbLvZy5YuWVpwvGVllW
        UkyrRGdcu8tOKpxVB/wcW5SEB/Jnjb/m+UPIKVE=
X-Google-Smtp-Source: AMrXdXsziqEqvvOJ2EXO/C0kCFtMLdNlEX0RjJ5ieRXhx+twG3Jt3+nQ2apwL4VwdtX6XPyu9fqeKQ==
X-Received: by 2002:a05:6a20:c90e:b0:b9:817e:2ff2 with SMTP id gx14-20020a056a20c90e00b000b9817e2ff2mr38212807pzb.57.1675091668856;
        Mon, 30 Jan 2023 07:14:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id br13-20020a056a00440d00b00581ad007a9fsm7508983pfb.153.2023.01.30.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:14:28 -0800 (PST)
Message-ID: <63d7ded4.050a0220.60371.beb9@mx.google.com>
Date:   Mon, 30 Jan 2023 07:14:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2023-01-30-v6.2-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 517 runs,
 20 regressions (renesas-next-2023-01-30-v6.2-rc1)
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

renesas/next baseline: 517 runs, 20 regressions (renesas-next-2023-01-30-v6=
.2-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-30-v6.2-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-30-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8dd3dae1705b14948974debe04021549519dfb0b =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a742a8a5c1d655915ed5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a742a8a5c1d655915eda
        failing since 5 days (last pass: renesas-next-2022-11-21-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T11:17:09.907698  <8>[   15.173341] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3245535_1.5.2.4.1>
    2023-01-30T11:17:10.014367  / # #
    2023-01-30T11:17:10.115977  export SHELL=3D/bin/sh
    2023-01-30T11:17:10.116399  #
    2023-01-30T11:17:10.116622  / # export SHELL=3D/bin/sh<3>[   15.357045]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-01-30T11:17:10.217832  . /lava-3245535/environment
    2023-01-30T11:17:10.218263  =

    2023-01-30T11:17:10.319496  / # . /lava-3245535/environment/lava-324553=
5/bin/lava-test-runner /lava-3245535/1
    2023-01-30T11:17:10.320131  =

    2023-01-30T11:17:10.324944  / # /lava-3245535/bin/lava-test-runner /lav=
a-3245535/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a7ca0bc759274a915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a7ca0bc759274a915ec4
        failing since 5 days (last pass: renesas-next-2022-11-21-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T11:19:13.624772  <8>[   15.138207] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3245565_1.5.2.4.1>
    2023-01-30T11:19:13.734991  / # #
    2023-01-30T11:19:13.838691  export SHELL=3D/bin/sh
    2023-01-30T11:19:13.839801  #
    2023-01-30T11:19:13.941885  / # export SHELL=3D/bin/sh. /lava-3245565/e=
nvironment
    2023-01-30T11:19:13.942855  <3>[   15.357183] Bluetooth: hci0: command =
0xfc18 tx timeout
    2023-01-30T11:19:13.943361  =

    2023-01-30T11:19:14.045678  / # . /lava-3245565/environment/lava-324556=
5/bin/lava-test-runner /lava-3245565/1
    2023-01-30T11:19:14.047645  =

    2023-01-30T11:19:14.052329  / # /lava-3245565/bin/lava-test-runner /lav=
a-3245565/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a85fb834d789b8915ebc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a85fb834d789b8915ec1
        failing since 5 days (last pass: renesas-next-2022-11-21-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T11:21:39.533817  <8>[   24.778911] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3245615_1.5.2.4.1>
    2023-01-30T11:21:39.645946  / # #
    2023-01-30T11:21:39.749455  export SHELL=3D/bin/sh
    2023-01-30T11:21:39.750605  #
    2023-01-30T11:21:39.852808  / # export SHELL=3D/bin/sh. /lava-3245615/e=
nvironment
    2023-01-30T11:21:39.854032  =

    2023-01-30T11:21:39.956212  / # . /lava-3245615/environment/lava-324561=
5/bin/lava-test-runner /lava-3245615/1
    2023-01-30T11:21:39.957876  =

    2023-01-30T11:21:39.962514  / # /lava-3245615/bin/lava-test-runner /lav=
a-3245615/1
    2023-01-30T11:21:40.045281  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a8e39ef83ad4d1915eba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a8e39ef83ad4d1915ebf
        failing since 5 days (last pass: renesas-next-2022-11-21-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T11:24:10.189822  <8>[   16.590439] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3245630_1.5.2.4.1>
    2023-01-30T11:24:10.302510  / # #
    2023-01-30T11:24:10.405877  export SHELL=3D/bin/sh
    2023-01-30T11:24:10.406825  #
    2023-01-30T11:24:10.509056  / # export SHELL=3D/bin/sh. /lava-3245630/e=
nvironment
    2023-01-30T11:24:10.509954  =

    2023-01-30T11:24:10.611933  / # . /lava-3245630/environment/lava-324563=
0/bin/lava-test-runner /lava-3245630/1
    2023-01-30T11:24:10.613516  =

    2023-01-30T11:24:10.617966  / # /lava-3245630/bin/lava-test-runner /lav=
a-3245630/1
    2023-01-30T11:24:10.710551  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a95e29fa627084915ec9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a95e29fa627084915ece
        failing since 5 days (last pass: renesas-next-2022-11-21-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T11:26:09.568520  <8>[   14.946725] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3245649_1.5.2.4.1>
    2023-01-30T11:26:09.680615  / # #
    2023-01-30T11:26:09.782021  export SHELL=3D/bin/sh
    2023-01-30T11:26:09.782393  #
    2023-01-30T11:26:09.883587  / # export SHELL=3D/bin/sh. /lava-3245649/e=
nvironment
    2023-01-30T11:26:09.884010  =

    2023-01-30T11:26:09.985236  / # . /lava-3245649/environment/lava-324564=
9/bin/lava-test-runner /lava-3245649/1
    2023-01-30T11:26:09.985842  =

    2023-01-30T11:26:09.990747  / # /lava-3245649/bin/lava-test-runner /lav=
a-3245649/1
    2023-01-30T11:26:10.079849  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ab0f082f7aebc2915edd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7ab0f082f7aebc2915=
ede
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a6faee0d7fc1fd915ef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a6faee0d7fc1fd915efc
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-30T11:15:57.271241  + set +x
    2023-01-30T11:15:57.271547  [   12.929657] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891793_1.5.2.3.1>
    2023-01-30T11:15:57.380700  / # #
    2023-01-30T11:15:57.482300  export SHELL=3D/bin/sh
    2023-01-30T11:15:57.482783  #
    2023-01-30T11:15:57.583907  / # export SHELL=3D/bin/sh. /lava-891793/en=
vironment
    2023-01-30T11:15:57.584262  =

    2023-01-30T11:15:57.685460  / # . /lava-891793/environment/lava-891793/=
bin/lava-test-runner /lava-891793/1
    2023-01-30T11:15:57.686105  =

    2023-01-30T11:15:57.689447  / # /lava-891793/bin/lava-test-runner /lava=
-891793/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a74aef679260dc915ec5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a74aef679260dc915eca
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-30T11:17:13.049397  + set +x
    2023-01-30T11:17:13.049639  [   12.852027] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891798_1.5.2.3.1>
    2023-01-30T11:17:13.157389  / # #
    2023-01-30T11:17:13.258887  export SHELL=3D/bin/sh
    2023-01-30T11:17:13.259292  #
    2023-01-30T11:17:13.360505  / # export SHELL=3D/bin/sh. /lava-891798/en=
vironment
    2023-01-30T11:17:13.361063  =

    2023-01-30T11:17:13.462401  / # . /lava-891798/environment/lava-891798/=
bin/lava-test-runner /lava-891798/1
    2023-01-30T11:17:13.463000  =

    2023-01-30T11:17:13.466222  / # /lava-891798/bin/lava-test-runner /lava=
-891798/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a7ea734d8b428b915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a7ea734d8b428b915ec4
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-30T11:19:52.346521  + set +x
    2023-01-30T11:19:52.346872  [   16.033140] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891812_1.5.2.3.1>
    2023-01-30T11:19:52.454774  / # #
    2023-01-30T11:19:52.556598  export SHELL=3D/bin/sh
    2023-01-30T11:19:52.557130  #
    2023-01-30T11:19:52.658463  / # export SHELL=3D/bin/sh. /lava-891812/en=
vironment
    2023-01-30T11:19:52.658887  =

    2023-01-30T11:19:52.760222  / # . /lava-891812/environment/lava-891812/=
bin/lava-test-runner /lava-891812/1
    2023-01-30T11:19:52.760950  =

    2023-01-30T11:19:52.764009  / # /lava-891812/bin/lava-test-runner /lava=
-891812/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a83a0f29c42cb6915ece

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a83a0f29c42cb6915ed3
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-30T11:21:09.697467  + set +x
    2023-01-30T11:21:09.697629  [   12.329183] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891820_1.5.2.3.1>
    2023-01-30T11:21:09.804694  / # #
    2023-01-30T11:21:09.906204  export SHELL=3D/bin/sh
    2023-01-30T11:21:09.906643  #
    2023-01-30T11:21:10.007898  / # export SHELL=3D/bin/sh. /lava-891820/en=
vironment
    2023-01-30T11:21:10.008508  =

    2023-01-30T11:21:10.109926  / # . /lava-891820/environment/lava-891820/=
bin/lava-test-runner /lava-891820/1
    2023-01-30T11:21:10.110461  =

    2023-01-30T11:21:10.113740  / # /lava-891820/bin/lava-test-runner /lava=
-891820/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a88ab209476733915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7a88ab209476733915ebe
        new failure (last pass: renesas-next-2022-11-17-v6.1-rc1)

    2023-01-30T11:22:43.790901  + set +x
    2023-01-30T11:22:43.791237  [   12.597407] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891825_1.5.2.3.1>
    2023-01-30T11:22:43.899309  / # #
    2023-01-30T11:22:44.001218  export SHELL=3D/bin/sh
    2023-01-30T11:22:44.001717  #
    2023-01-30T11:22:44.103070  / # export SHELL=3D/bin/sh. /lava-891825/en=
vironment
    2023-01-30T11:22:44.103476  =

    2023-01-30T11:22:44.208240  / # . /lava-891825/environment/lava-891825/=
bin/lava-test-runner /lava-891825/1
    2023-01-30T11:22:44.208757  =

    2023-01-30T11:22:44.212138  / # /lava-891825/bin/lava-test-runner /lava=
-891825/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a967ab752a061e915edc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7a967ab752a061e915=
edd
        failing since 17 days (last pass: renesas-next-2022-09-18-v6.0-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a89d1bac3cd6fd915edd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7a89d1bac3cd6fd915=
ede
        failing since 17 days (last pass: renesas-next-2022-09-18-v6.0-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a94615b0be5038915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7a94615b0be5038915=
ec5
        failing since 236 days (last pass: renesas-next-2022-05-05-v5.18-rc=
1, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b9d3166f512d43915ec9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7b9d3166f512d43915=
eca
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a53eb4d4290760915ece

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7a53eb4d4290760915=
ecf
        failing since 104 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7cb5d624c787e51915ed7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7cb5d624c787e51915=
ed8
        failing since 34 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7d63b344ac57911915f20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7d63b344ac57911915=
f21
        failing since 34 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7aab24f897358df915ed1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7aab24f897358df915=
ed2
        failing since 79 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7c37bfee2c7fda6915ebe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7c37bfee2c7fda6915=
ebf
        failing since 33 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =20
