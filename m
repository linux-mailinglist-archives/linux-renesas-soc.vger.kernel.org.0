Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A91668851
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 01:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233122AbjAMAV3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 19:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240216AbjAMAVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 19:21:01 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC98389A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:18:23 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso22752119pjo.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NC5LG7UZS3Sv9jChKAeGG0UkwOf7aFgtuXU9OmqevmI=;
        b=UHCN6gRwRanTOvb69kzFgbEl9AaYet35XqC7PQp/HzFF+DJss5QTYVqjxbjB9RejHh
         VcF9N0X3Ioz+GqievWRLfWrNB+dpdITncSLG18KP4Fcd3Ry6opbtCH5X504gJRllVqOE
         jDfbE8lPlPLbtuEFFO2OsD0T3Kk3lj44pRGz+IdPLDaED1MieRiYwgCSLC0BF6Z3RHht
         Vm1z3qOu2uxkxukH9L2btHtFm858vLQQx9TnpiGafc9dHv/8o9deoyvjct73Ew1M+zSe
         AUhQ+rSho02UwwQmAfZ8/3NV1uj46DMnbaJLlTl4KbLHRvGJj8KsyjS8xqc1c3wUOvq5
         enzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC5LG7UZS3Sv9jChKAeGG0UkwOf7aFgtuXU9OmqevmI=;
        b=TlyBFPTJewGi5LdUpKzgn0z9AbwrtZj4coid7nVnsPAotsY7AqeJGDqVHIfC+tSU5s
         Kw3jvwiSSzvayGnG0nh3mCgEdGIanYQCiZ783/HJgmkw0Xph97Ev4C9BY7OZgbjc89Px
         hfdqlo6hxYvB80R3CHMkT/6Z4mopTbCb2/fzXhlmKM22IwINiJB37DviLwJv5XdU6mbF
         CaRnlNtoVzRyUGjc9oxAciCmyme287kLBee4szoAxgMgXhI20wDNgIqeBydkM/2aXQTJ
         AjI9eCeOU6mMQcld2hF4lf9JxnvUjKCyiCjRhhc9Si3m6yIN1vHW+KcQJbx3g/HJhKqk
         +GDA==
X-Gm-Message-State: AFqh2krpc5G6+Vx+aAACk6nu+P3y718i9VwJzpODd76UAORUPxpP634u
        1HahQAUdBVM0XYldgBlFaj9fEw7evcuCNm9uw7UVIA==
X-Google-Smtp-Source: AMrXdXt6rKDhdeIKKgcJiv6/1RND3ndqctUvTlMI2W8Z6BoucBEqD/fLaX4xxJ7AolloJVbprKjX8g==
X-Received: by 2002:a05:6a21:3d0a:b0:af:7939:5fed with SMTP id bi10-20020a056a213d0a00b000af79395fedmr102432942pzc.43.1673569102972;
        Thu, 12 Jan 2023 16:18:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f10-20020aa79d8a000000b005823b7da05asm8229428pfq.122.2023.01.12.16.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 16:18:22 -0800 (PST)
Message-ID: <63c0a34e.a70a0220.870a2.e442@mx.google.com>
Date:   Thu, 12 Jan 2023 16:18:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-01-12-v6.2-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 177 runs,
 9 regressions (renesas-next-2023-01-12-v6.2-rc1)
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

renesas/next baseline: 177 runs, 9 regressions (renesas-next-2023-01-12-v6.=
2-rc1)

Regressions Summary
-------------------

platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
bcm2835-rpi-b-rev2       | arm  | lab-broonie     | gcc-10   | bcm2835_defc=
onfig        | 1          =

imx6dl-riotboard         | arm  | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug | 1          =

imx6dl-udoo              | arm  | lab-broonie     | gcc-10   | imx_v6_v7_de=
fconfig      | 1          =

imx6q-udoo               | arm  | lab-broonie     | gcc-10   | imx_v6_v7_de=
fconfig      | 1          =

imx6qp-wandboard-revd1   | arm  | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug | 1          =

qemu_arm-virt-gicv2      | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =

qemu_arm-virt-gicv2-uefi | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =

qemu_arm-virt-gicv3      | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =

qemu_arm-virt-gicv3-uefi | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-12-v6.2-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-12-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1f57de01e0be7bd12dba400abd81d17840768a1b =



Test Regressions
---------------- =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
bcm2835-rpi-b-rev2       | arm  | lab-broonie     | gcc-10   | bcm2835_defc=
onfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63c069c34cb94dd59a1d39e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c069c34cb94dd59a1d39ec
        new failure (last pass: renesas-next-2022-09-26-v6.0-rc1)

    2023-01-12T20:12:30.491491  + set +x
    2023-01-12T20:12:30.496458  <8>[   16.976853] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 100543_1.5.2.4.1>
    2023-01-12T20:12:30.606800  / # #
    2023-01-12T20:12:30.708168  export SHELL=3D/bin/sh
    2023-01-12T20:12:30.708722  #
    2023-01-12T20:12:30.810396  / # export SHELL=3D/bin/sh. /lava-100543/en=
vironment
    2023-01-12T20:12:30.811036  =

    2023-01-12T20:12:30.912516  / # . /lava-100543/environment/lava-100543/=
bin/lava-test-runner /lava-100543/1
    2023-01-12T20:12:30.913162  =

    2023-01-12T20:12:30.919338  / # /lava-100543/bin/lava-test-runner /lava=
-100543/1 =

    ... (14 line(s) more)  =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
imx6dl-riotboard         | arm  | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06d174b88cc994a1d39f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06d174b88cc994a1d3=
9f6
        failing since 116 days (last pass: renesas-next-2022-08-30-v6.0-rc1=
, first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
imx6dl-udoo              | arm  | lab-broonie     | gcc-10   | imx_v6_v7_de=
fconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0680b930dfff5411d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0680b930dfff5411d3=
9d0
        new failure (last pass: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
imx6q-udoo               | arm  | lab-broonie     | gcc-10   | imx_v6_v7_de=
fconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06821930dfff5411d3a04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06821930dfff5411d3=
a05
        new failure (last pass: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
imx6qp-wandboard-revd1   | arm  | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06abf5b1ef2cc301d39d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06abf5b1ef2cc301d3=
9d7
        failing since 135 days (last pass: renesas-next-2022-08-29-v6.0-rc1=
, first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
qemu_arm-virt-gicv2      | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06ce51140c447b81d3a0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06ce51140c447b81d3=
a0f
        failing since 86 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
qemu_arm-virt-gicv2-uefi | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06ce41140c447b81d3a00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06ce41140c447b81d3=
a01
        failing since 86 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
qemu_arm-virt-gicv3      | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06ce71140c447b81d3a14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06ce71140c447b81d3=
a15
        failing since 86 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                 | arch | lab             | compiler | defconfig   =
             | regressions
-------------------------+------+-----------------+----------+-------------=
-------------+------------
qemu_arm-virt-gicv3-uefi | arm  | lab-broonie     | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06cf8e21b1ba8c11d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06cf8e21b1ba8c11d3=
9cb
        failing since 86 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =20
