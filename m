Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C49F6AFB81
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 01:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCHAtV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 19:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjCHAtP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 19:49:15 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566E0A8EBD
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 16:49:11 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id i10so16116415plr.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2023 16:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678236550;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l8+hOm8eGMwWxuy1vhm9GIcawZgu8MIotRsjhvTT7nE=;
        b=IeazvzPw16Z/9GqdFeyTJXqZTcV+4/dU9Q9WN4tOje4icvZrlvgFaoCDlw0MzXr0EA
         vc/GyMuBFaXHHrXLrJh4RodU9KB9Q58nuAE5NPYwP6As1fRGtizowJKkWWnqGCkymJX+
         9zqa9+92r0+l6VRjeCTy2d/Ne6928lY/8mHl9wcD2ktvXZE6X9LxxZg49ZFSaFW2D49n
         CyIDq1xJ2Tfy1/Yb4KTRl9pz58S0Kz8fcFdRRudT2AVgYERYBP0rgqHW3V0fyFwnAD9N
         YrWC0AnGxej8hqgWcKHAR7hI44W5PO6d9ONveZHp4AEM0NLUpNC9Af/QnKa/I4AOSD8I
         RMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678236550;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8+hOm8eGMwWxuy1vhm9GIcawZgu8MIotRsjhvTT7nE=;
        b=jirM/L0h1CsWQAN0RGkD4GFW1zhbzglZsJaK3ac7E+zcl0/TJN2dihZs+NmJWv5LGx
         uyd+i+O8HC2obdSK6+JiT+wYO3EcpWlUBu3fgTpPzxWYUzPO8QtM+HitzqNgwuKmLtmm
         1i+tzwt2xv0MQpQUDvOND1Q4Q9DbBfVYEhPTIfRR0LBL4d/PNUxnqRfZv2e8+XTdW7oH
         P7d9vZQms6+K3tT2MIx74trRCL1s0j4ahrP3SeZcFxdXLwkwHB/JpLswt5cvvdpXPXHU
         MzfD4ke24IXjH0bepF+f1uGCwIwkdWXn8weXC6YrpXQFd0UjZ6S1RGi4M2kV1/MQ47z5
         rIvw==
X-Gm-Message-State: AO0yUKVt5ypjisS2n9IZnK7YGzkFfG87wGz+Hx54NKXDDf4cZxnZqXbe
        0ALfecYNAZNYi9Gt6JGPvVabnwzQ1J0VTx49s2PAag==
X-Google-Smtp-Source: AK7set8rzVrCg6CiUAUh5AlCx29l1bNpwPVCtqh7WCJ35yjHQz8AXUtCcR3CiY+3UVBYiZzIp+RcPQ==
X-Received: by 2002:a17:902:b612:b0:19e:6b56:7d8c with SMTP id b18-20020a170902b61200b0019e6b567d8cmr13588571pls.9.1678236550210;
        Tue, 07 Mar 2023 16:49:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e20-20020a630f14000000b005004919b31dsm8213449pgl.72.2023.03.07.16.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 16:49:09 -0800 (PST)
Message-ID: <6407db85.630a0220.5a3a8.edc3@mx.google.com>
Date:   Tue, 07 Mar 2023 16:49:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-07-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 159 runs,
 27 regressions (renesas-devel-2023-03-07-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 159 runs, 27 regressions (renesas-devel-2023-0=
3-07-v6.3-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-07-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-07-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      525eb92e46b94fe4a641aa2f6cc0481874cff436 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a4c462968ec16a8c8678

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6407a4c462968ec16a8c8681
        failing since 1 day (last pass: renesas-devel-2023-02-21-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:55:08.923070  [   27.067457] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-03-07T20:55:08.944586  + set +x
    2023-03-07T20:55:08.944825  [   27.091464] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917922_1.6.2.3.1>
    2023-03-07T20:55:09.062355  #
    2023-03-07T20:55:09.164545  / # #export SHELL=3D/bin/sh
    2023-03-07T20:55:09.165086  =

    2023-03-07T20:55:09.266349  / # export SHELL=3D/bin/sh. /lava-917922/en=
vironment
    2023-03-07T20:55:09.266880  =

    2023-03-07T20:55:09.368153  / # . /lava-917922/environment/lava-917922/=
bin/lava-test-runner /lava-917922/1
    2023-03-07T20:55:09.369033   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a53c4a6bafad488c8639

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6407a53c4a6bafad488c8642
        failing since 1 day (last pass: renesas-devel-2023-02-21-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:57:09.146162  + set +x
    2023-03-07T20:57:09.146321  [   29.427196] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917925_1.6.2.3.1>
    2023-03-07T20:57:09.255686  #
    2023-03-07T20:57:09.357322  / # #export SHELL=3D/bin/sh
    2023-03-07T20:57:09.357675  =

    2023-03-07T20:57:09.459013  / # export SHELL=3D/bin/sh. /lava-917925/en=
vironment
    2023-03-07T20:57:09.459324  =

    2023-03-07T20:57:09.560504  / # . /lava-917925/environment/lava-917925/=
bin/lava-test-runner /lava-917925/1
    2023-03-07T20:57:09.560972  =

    2023-03-07T20:57:09.563947  / # /lava-917925/bin/lava-test-runner /lava=
-917925/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a6040d5ab510538c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6407a6040d5ab510538c864e
        failing since 1 day (last pass: renesas-devel-2023-02-21-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:00:29.780309  + set +x
    2023-03-07T21:00:29.780531  [   33.798378] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917931_1.6.2.3.1>
    2023-03-07T21:00:29.890002  #
    2023-03-07T21:00:29.991825  / # #export SHELL=3D/bin/sh
    2023-03-07T21:00:29.992240  =

    2023-03-07T21:00:30.093477  / # export SHELL=3D/bin/sh. /lava-917931/en=
vironment
    2023-03-07T21:00:30.094061  =

    2023-03-07T21:00:30.195618  / # . /lava-917931/environment/lava-917931/=
bin/lava-test-runner /lava-917931/1
    2023-03-07T21:00:30.196169  =

    2023-03-07T21:00:30.199364  / # /lava-917931/bin/lava-test-runner /lava=
-917931/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a6cc6deae9f63f8c8667

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6407a6cc6deae9f63f8c8670
        failing since 1 day (last pass: renesas-devel-2023-02-21-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:04:05.621240  + set +x
    2023-03-07T21:04:05.621437  [   29.375257] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917942_1.6.2.3.1>
    2023-03-07T21:04:05.735253  #
    2023-03-07T21:04:05.837703  / # #export SHELL=3D/bin/sh
    2023-03-07T21:04:05.838218  =

    2023-03-07T21:04:05.939437  / # export SHELL=3D/bin/sh. /lava-917942/en=
vironment
    2023-03-07T21:04:05.939889  =

    2023-03-07T21:04:06.041571  / # . /lava-917942/environment/lava-917942/=
bin/lava-test-runner /lava-917942/1
    2023-03-07T21:04:06.042165  =

    2023-03-07T21:04:06.045592  / # /lava-917942/bin/lava-test-runner /lava=
-917942/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a82007286833c68c872e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6407a82007286833c68c8737
        failing since 1 day (last pass: renesas-devel-2023-02-21-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:09:26.791595  + set +x
    2023-03-07T21:09:26.792002  [   28.299387] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917946_1.6.2.3.1>
    2023-03-07T21:09:26.901484  #
    2023-03-07T21:09:27.003347  / # #export SHELL=3D/bin/sh
    2023-03-07T21:09:27.003764  =

    2023-03-07T21:09:27.105177  / # export SHELL=3D/bin/sh. /lava-917946/en=
vironment
    2023-03-07T21:09:27.105711  =

    2023-03-07T21:09:27.207190  / # . /lava-917946/environment/lava-917946/=
bin/lava-test-runner /lava-917946/1
    2023-03-07T21:09:27.207930  =

    2023-03-07T21:09:27.210981  / # /lava-917946/bin/lava-test-runner /lava=
-917946/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a822c95f80a4f28c8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6407a822c95f80a4f28c8659
        new failure (last pass: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:09:28.854189  + set[   27.315703] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 917948_1.6.2.3.1>
    2023-03-07T21:09:28.854779   +x
    2023-03-07T21:09:28.967338  / # #
    2023-03-07T21:09:29.069180  export SHELL=3D/bin/sh
    2023-03-07T21:09:29.069528  #
    2023-03-07T21:09:29.170963  / # export SHELL=3D/bin/sh. /lava-917948/en=
vironment
    2023-03-07T21:09:29.171441  =

    2023-03-07T21:09:29.272876  / # . /lava-917948/environment/lava-917948/=
bin/lava-test-runner /lava-917948/1
    2023-03-07T21:09:29.273732  =

    2023-03-07T21:09:29.276415  / # /lava-917948/bin/lava-test-runner /lava=
-917948/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407be797295337f988c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nf=
s-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nf=
s-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6407be797295337f9=
88c8630
        new failure (last pass: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407bfb9d52b1659598c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6407bfb9d52b16595=
98c8641
        new failure (last pass: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6407c0a9938ea732188c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6407c0a9938ea7321=
88c8649
        new failure (last pass: renesas-devel-2023-02-21-v6.2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6407c3ca9e6710be0b8c874c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6407c3ca9e6710be0=
b8c874d
        new failure (last pass: renesas-devel-2023-02-21-v6.2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6407c56e9ebc4bdf2d8c866c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6407c56e9ebc4bdf2=
d8c866d
        new failure (last pass: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6407af08b5dd690ba18c862f

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-k=
ontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-k=
ontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6407af08b5dd690ba18c8636
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-07T21:38:53.408925  + set[  157.400804] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 288535_1.6.2.4.1>
    2023-03-07T21:38:53.409093   +x
    2023-03-07T21:38:53.513761  / # #
    2023-03-07T21:38:53.615403  export SHELL=3D/bin/sh
    2023-03-07T21:38:53.615906  #
    2023-03-07T21:38:53.717333  / # export SHELL=3D/bin/sh. /lava-288535/en=
vironment
    2023-03-07T21:38:53.717833  =

    2023-03-07T21:38:53.819200  / # . /lava-288535/environment/lava-288535/=
bin/lava-test-runner /lava-288535/1
    2023-03-07T21:38:53.819976  =

    2023-03-07T21:38:53.826769  / # /lava-288535/bin/lava-test-runner /lava=
-288535/1 =

    ... (12 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/6407af08b5dd690ba18c8646
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-07T21:38:58.189110  /lava-288535/1/../bin/lava-test-case
    2023-03-07T21:38:58.250187  [  162.447563] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a7cbed180e48ee8c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6407a7cbed180e48e=
e8c8638
        new failure (last pass: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6407aa6043790a7c4f8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6407aa6043790a7c4=
f8c8631
        new failure (last pass: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6407a50099f3bf92018c8640

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/6407a50099f3bf92018c8694
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:56:16.196814  /lava-9479904/1/../bin/lava-test-case

    2023-03-07T20:56:16.218846  <8>[   36.283789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/6407a50099f3bf92018c86e5
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:56:11.100035  /lava-9479904/1/../bin/lava-test-case

    2023-03-07T20:56:11.125952  <8>[   31.191019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/6407a50099f3bf92018c86e6
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:56:10.050608  /lava-9479904/1/../bin/lava-test-case

    2023-03-07T20:56:10.076460  <8>[   30.141157] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6407a85ed96e8257a38c863d

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/6407a85ed96e8257a38c8674
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:10:40.734611  /lava-9480193/1/../bin/lava-test-case

    2023-03-07T21:10:40.757758  [   37.307214] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/6407a85ed96e8257a38c86e3
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:10:35.539219  /lava-9480193/1/../bin/lava-test-case

    2023-03-07T21:10:35.570279  [   32.119167] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/6407a85ed96e8257a38c86e4
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:10:34.463070  /lava-9480193/1/../bin/lava-test-case

    2023-03-07T21:10:34.492942  [   31.042015] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6407a52d31f18033708c869d

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6407a52d31f18033708c8738
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:56:38.918101  /lava-9479898/1/../bin/lava-test-case

    2023-03-07T20:56:38.953071  <8>[   32.253120] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6407a52d31f18033708c8739
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:56:37.819866  /lava-9479898/1/../bin/lava-test-case

    2023-03-07T20:56:37.855495  <8>[   31.155842] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6407a52d31f18033708c873a
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T20:56:36.712637  /lava-9479898/1/../bin/lava-test-case

    2023-03-07T20:56:36.753843  <8>[   30.053544] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6407a84df31da0e9f28c866c

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6407a84df31da0e9f28c870c
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:09:57.313691  /lava-9480203/1/../bin/lava-test-case

    2023-03-07T21:09:57.341140  [   30.823854] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6407a84df31da0e9f28c870d
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:09:56.226694  /lava-9480203/1/../bin/lava-test-case

    2023-03-07T21:09:56.264455  [   29.746911] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6407a84df31da0e9f28c870e
        failing since 1 day (last pass: renesas-devel-2023-02-20-v6.2, firs=
t fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-07T21:09:55.145051  /lava-9480203/1/../bin/lava-test-case

    2023-03-07T21:09:55.173983  [   28.656823] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =20
