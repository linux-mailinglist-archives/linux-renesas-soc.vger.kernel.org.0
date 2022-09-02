Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B4C5AB933
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 22:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiIBULc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 16:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiIBULa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 16:11:30 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DCDD91C3
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 13:11:27 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id j9-20020a17090a3e0900b001fd9568b117so3151054pjc.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2022 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=/hKGWN5rGqY9+SMmz/JcVwUPl/gZz0ELvCwGOH57y2A=;
        b=UgTUDC6QSuFmIcqoKyDt/7hj+Ne5FapFeUnZ1DU5BWozdOoh/H3P9ioQbqppnK5W8x
         ZjDHSsQ4iAf1SVCud/lmYBTmkNZyhwrz+dovk+a2oNefdeKB+VUbSooLhZy4WFXg3+ZQ
         nFFRj+piLuWVlGzgMAv63R9o/flxwvoD40tsPV25tclYK5A/ZoBu64kGkzHsLETJqb9Q
         HU9z5/wIxtHIR6Jh6BTPHpSNEIABWTGizJErysyx9miuAt5RUG7aFQUixMRDKdBC0C95
         YcyYbzDWFYt9aLYbazJSIIEZJGds96u0eIuNLEemmWNkHj8uzjbUYG8SyX1dw93iJp1B
         pu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=/hKGWN5rGqY9+SMmz/JcVwUPl/gZz0ELvCwGOH57y2A=;
        b=ZNQb13/573Gu2dBU405AeBYUMHDKyWYil0zxlLDZP193rLSc6yJ7ufjD5cycGXZoMK
         Jo7GukvLleNpGrxpI3BTSHV+qV7basgEVSdcJfkxKMv5E/W+/Ev6Fyt3g54VwKF4WPns
         526aIOPUWUe/breJc3YC5+5RzQM+bHkq39resj/nk7yR4E8apK4cnYh/iHreOZhe+Cuk
         wxlhMGkVbZ+0HqLWekRk3PVhRkbkk0fB2juAiOm8C5H8QUce7LMV6EY2Z4SKpU2KbeBj
         fkcv4hrN5F7SnzAu7wuMLsvmYKk2nM2SrtujpTM7nY82nY2z3La3PY7ar8yGd406B67t
         1B4w==
X-Gm-Message-State: ACgBeo1Sb5g/Z9tZ2nKvem63ZwSgebm9njVoVwCl1d/I+1kN/hnfWONA
        4VjjUMLaOf1IqBcFxp+JJkcXz8a9lZ7n6gaglY0=
X-Google-Smtp-Source: AA6agR43pPlmXbSbNjkMfCCL46mHQGD+MBoC7ioNehA4oZIrNxpAhAaspvorXxPK0f8bZuRttwWnWg==
X-Received: by 2002:a17:902:aa8c:b0:173:4137:55c4 with SMTP id d12-20020a170902aa8c00b00173413755c4mr37792978plr.108.1662149485555;
        Fri, 02 Sep 2022 13:11:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i21-20020a170902e49500b00173031308fdsm2013898ple.158.2022.09.02.13.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:11:25 -0700 (PDT)
Message-ID: <6312636d.170a0220.71727.34d5@mx.google.com>
Date:   Fri, 02 Sep 2022 13:11:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-02-v6.0-rc3
Subject: renesas/master baseline: 617 runs,
 47 regressions (renesas-devel-2022-09-02-v6.0-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 617 runs, 47 regressions (renesas-devel-2022-09-02=
-v6.0-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-bl-imx8mm            | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

r8a77960-ulcb                | arm64 | lab-collabora   | gcc-10   | renesas=
_defconfig            | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-02-v6.0-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-02-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cac9a30c2d54cde55723b592346005941a139ded =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63123f668cf4f148f7355648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63123f668cf4f148f7355=
649
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/631245a1fc3809ab1d355647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631245a1fc3809ab1d355=
648
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/631248c70fd0fdc4be355702

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631248c70fd0fdc4be355=
703
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63124a78b2a61b65da355675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63124a78b2a61b65da355=
676
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63124be150c7a3b34f355643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63124be150c7a3b34f355=
644
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63123bc8fe24246d5e355690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63123bc8fe24246d5e355=
691
        failing since 3 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/631232d934568d73e7355653

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/631232d934568d7=
3e735565b
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-22-v6.0-rc2)
        49 lines

    2022-09-02T16:43:52.905874  [  141.428582][  T232] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-09-02T16:43:53.287481  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:3  pfn:397c4
    2022-09-02T16:43:53.300093  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ba
    2022-09-02T16:43:53.305672  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397b9
    2022-09-02T16:43:53.308245  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397b0
    2022-09-02T16:43:53.315648  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397af
    2022-09-02T16:43:53.324095  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ae
    2022-09-02T16:43:53.324301  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:39767
    2022-09-02T16:43:53.332401  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:39766
    2022-09-02T16:43:53.341456  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:39765 =

    ... (23 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63123260097f2cd3fa355681

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63123260097f2cd=
3fa355689
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-22-v6.0-rc2)
        28 lines

    2022-09-02T16:41:45.719124  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fab
    2022-09-02T16:41:45.727820  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38faa
    2022-09-02T16:41:45.736868  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fa9
    2022-09-02T16:41:45.737144  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fb9
    2022-09-02T16:41:45.745866  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fb8
    2022-09-02T16:41:45.755000  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fb7
    2022-09-02T16:41:45.755171  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fb6
    2022-09-02T16:41:45.763937  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fb5
    2022-09-02T16:41:45.772954  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fb4
    2022-09-02T16:41:45.773126  kern  :alert : BUG: Bad page state in proce=
ss kworker/1:1  pfn:38fb3 =

    ... (17 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6312315b47baa4ea8535565e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6312315b47baa4ea85355=
65f
        failing since 115 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/631230cf7ac5ea7ced355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631230cf7ac5ea7ced355=
645
        failing since 74 days (last pass: renesas-devel-2022-06-17-v5.19-rc=
2, first fail: renesas-devel-2022-06-20-v5.19-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/631233630ba110cf0335565e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631233630ba110cf03355=
65f
        failing since 115 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63123453960e0bc7c9355666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63123453960e0bc7c9355=
667
        failing since 87 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/631237afd5dc4a779e355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631237afd5dc4a779e355=
654
        failing since 115 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6312383b4cd6b6ef88355656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6312383b4cd6b6ef88355=
657
        failing since 87 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63122f0838b149b536355691

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sd=
b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122f0838b149b536355=
692
        failing since 17 days (last pass: renesas-devel-2022-07-22-v5.19-rc=
7, first fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63122fec729afc45fa35564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122fec729afc45fa355=
64d
        failing since 3 days (last pass: renesas-devel-2022-07-22-v5.19-rc7=
, first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63123223f824063b6f35565a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63123223f824063b6f355=
65b
        failing since 125 days (last pass: renesas-devel-2022-04-13-v5.18-r=
c2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-bl-imx8mm            | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/631233abb1369f10813556bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
bl-imx8mm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
bl-imx8mm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631233abb1369f1081355=
6bd
        new failure (last pass: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63122d07366ce3455b355650

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
122d07366ce3455b355659
        failing since 60 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5)

    2022-09-02T16:18:46.134060  /lava-162860/1/../bin/lava-test-case
    2022-09-02T16:18:46.219972  <8>[   43.069726][  T316] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63122f61fd07b4d87e3556ca

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/63122f61fd07b4d87e3556d8
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-09-02T16:29:01.704630  /lava-162865/1/../bin/lava-test-case
    2022-09-02T16:29:01.705238  <8>[   19.319223] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-09-02T16:29:01.705550  /lava-162865/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/631=
22f61fd07b4d87e3556da
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-09-02T16:29:02.742697  /lava-162865/1/../bin/lava-test-case
    2022-09-02T16:29:02.743066  <8>[   20.363680] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6312307747eaf154fe355642

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/6312307747eaf154fe355650
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-02T16:33:50.971350  /lava-162873/1/../bin/lava-test-case
    2022-09-02T16:33:50.971741  <8>[   19.371798] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-09-02T16:33:50.971988  /lava-162873/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/631=
2307747eaf154fe355652
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-02T16:33:52.008787  /lava-162873/1/../bin/lava-test-case
    2022-09-02T16:33:52.009182  <8>[   20.415850] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-09-02T16:33:52.009437  /lava-162873/1/../bin/lava-test-case
    2022-09-02T16:33:52.009686  <8>[   20.435789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/63123397a349b9b7fe355672

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/63123397a349b9b7fe355680
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-09-02T16:47:10.536585  /lava-162888/1/../bin/lava-test-case
    2022-09-02T16:47:10.537017  <8>[   19.288716] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-09-02T16:47:10.537271  /lava-162888/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/631=
23397a349b9b7fe355682
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-09-02T16:47:11.574131  /lava-162888/1/../bin/lava-test-case
    2022-09-02T16:47:11.574519  <8>[   20.333423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-09-02T16:47:11.574762  /lava-162888/1/../bin/lava-test-case
    2022-09-02T16:47:11.574988  <8>[   20.353402] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/631235f2f042ee2cb63556b8

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/631235f2f042ee2cb63556c6
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-09-02T16:57:03.840890  /lava-162909/1/../bin/lava-test-case
    2022-09-02T16:57:03.841183  <8>[   19.349147] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-09-02T16:57:03.841341  /lava-162909/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/631=
235f2f042ee2cb63556c8
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-09-02T16:57:04.878979  /lava-162909/1/../bin/lava-test-case
    2022-09-02T16:57:04.879356  <8>[   20.393425] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-09-02T16:57:04.879607  /lava-162909/1/../bin/lava-test-case
    2022-09-02T16:57:04.879839  <8>[   20.413377] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-09-02T16:57:04.880065  /lava-162909/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/631231cac87def2597355677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631231cac87def2597355=
678
        new failure (last pass: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63122cc4445c17309235565e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-k=
hadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-k=
hadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122cc4445c173092355=
65f
        new failure (last pass: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63122d1edc6f516b5f355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122d1edc6f516b5f355=
645
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63122da3a1fe0e4b3a35567a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122da3a1fe0e4b3a355=
67b
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63122fe17052ad8f5d35564f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122fe17052ad8f5d355=
650
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/631232a8b4585b891b35566e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631232a8b4585b891b355=
66f
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63122dc80f7c49b89335564e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122dc80f7c49b893355=
64f
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63122fe3729afc45fa355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122fe3729afc45fa355=
645
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/631232acb4585b891b3556f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631232acb4585b891b355=
6f8
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63122d4ce1e4c20add3556f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122d4ce1e4c20add355=
6f1
        failing since 60 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6312301ad6fabd8f9235564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6312301ad6fabd8f92355=
64d
        failing since 60 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63122d4ec0c2d16087355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122d4ec0c2d16087355=
663
        failing since 22 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6312301baa6e6e3e6c355693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6312301baa6e6e3e6c355=
694
        failing since 22 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6312325d2274bcb826355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6312325d2274bcb826355=
645
        failing since 3 days (last pass: renesas-devel-2022-08-22-v6.0-rc2,=
 first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63122f5e437be22a143556f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-sa=
lvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-sa=
lvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63122f5e437be22a14355=
6f2
        new failure (last pass: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77960-ulcb                | arm64 | lab-collabora   | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63122cd5fd1284a6af355644

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-collabora/baseline-r8=
a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-collabora/baseline-r8=
a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63122cd5fd1284a=
6af35564b
        new failure (last pass: renesas-devel-2022-08-30-v6.0-rc3)
        2 lines

    2022-09-02T16:18:02.751969  kern  :emerg : BUG: spinlock already unlock=
ed on CPU#0, kworker/u12:1/46
    2022-09-02T16:18:02.752213  kern  :emerg :  lock: <8>[   26.974330] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D2>
    2022-09-02T16:18:02.752435  sci_ports+0x0/0x4f50, .magic: dead4ead, .ow=
ner: <8>[   26.987023] <LAVA_SIGNAL_ENDRUN 0_dmesg 7168762_1.4.2.4.1>
    2022-09-02T16:18:02.752673  <none>/-1, .owner_cpu: -1
    2022-09-02T16:18:02.752907  + set +x   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/63122bf1c40005e075355646

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63122bf1c40005e075355668
        failing since 178 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-09-02T16:14:16.804226  /lava-7168685/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63122bf1c40005e07535568b
        failing since 87 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-09-02T16:14:13.577892  <8>[   38.022775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-09-02T16:14:14.606594  /lava-7168685/1/../bin/lava-test-case
    2022-09-02T16:14:14.617131  <8>[   39.062361] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63122bf1c40005e07535568c
        failing since 87 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-09-02T16:14:13.565396  /lava-7168685/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63122bf1c40005e07535568d
        failing since 87 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-09-02T16:14:11.491258  <8>[   35.936526] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-09-02T16:14:12.531477  /lava-7168685/1/../bin/lava-test-case
    2022-09-02T16:14:12.541199  <8>[   36.987009] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
