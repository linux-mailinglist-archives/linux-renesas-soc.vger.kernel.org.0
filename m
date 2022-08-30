Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A03F5A647E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 15:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiH3NQN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 09:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiH3NQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 09:16:12 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC9FCCD7A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 06:16:09 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y127so11318601pfy.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 06:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=rM1l7O9lkiGQ5PLYDgWo5A09ZqZlj5d0/8agUnIj4tw=;
        b=RGMwAJoM+er/PhyKs5++cmM/lAawELAzfOx6UagnOEzP15KK5OHHZm8WRrNqaYPgR/
         WsoNu3MOK7jvo5E0w1uLyWB8/YvDJYNLCQApT4cJgW77Zfu87vd2kAQaaBsVoxGuN23P
         BwJ1KW6vDv7+fGw3q7/74oUhVtbQWT1vn1ugEz/qwGuiAMqm+E60HJLSE432dvTjXVZ3
         maYxi/jdGfoOgQi+TfvUigI9Hsc59vfCyb1labq65kjr0voZP17E/VlwFe/LoxOn583o
         vMhb+NSfTv6jTWgn4ZeYY8DNu/3VLbGX0f6jeuabbKBhYMYQslx9frXwGZyOmxidTL6f
         yqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=rM1l7O9lkiGQ5PLYDgWo5A09ZqZlj5d0/8agUnIj4tw=;
        b=8C0tWMTQ7MBDX3xOMSup3lGOtjQWswFg0g8HwMW4GgTjb61Clapa41H26BL02ndCps
         kv3IYWBkRjM1XH0x1o2Fx2IAZmx9AKBQOOMLXVpL57pIvbv6/SyYXX+6NT1Hm94gN9/N
         2GcZ4itK7/U51zDviqKR9dykgtZdO8u4HedXseEz1ZNRoxThowoNBYGC9x1xmxyqONLv
         ApxfKIIsg/X3ZYGS0pqSTKcyE/09FeCVTXqOpsrz32GRpCSIOiXAG+QQFPVmXU0e4tBb
         pVDBCzDdK+ZwkQdZ2R13/Y1FwrO62tsrCOq84W3naPn9x/r2xV1aABEPX1/9s8fY8KKy
         E3BA==
X-Gm-Message-State: ACgBeo2ECfCSUNu31kkgq9Z+U/mNB6KfGG+2WVnrvxf1L8KERHeBvieY
        gGZeKGuu49JzTiU4uvP4gGAGc832COK2SCcRJg8=
X-Google-Smtp-Source: AA6agR4G2I9nIJmkDX5sh5xN8pVhxC7QOWS9RLVR8esls2TTNINcqOEh4I7mmZi3j/6z2zYCRaUEJQ==
X-Received: by 2002:a05:6a00:4147:b0:52e:2d56:17c8 with SMTP id bv7-20020a056a00414700b0052e2d5617c8mr21419644pfb.51.1661865367774;
        Tue, 30 Aug 2022 06:16:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f7-20020a17090ace0700b001fbc6bb2011sm8479251pju.53.2022.08.30.06.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 06:16:07 -0700 (PDT)
Message-ID: <630e0d97.170a0220.54e6a.e68a@mx.google.com>
Date:   Tue, 30 Aug 2022 06:16:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-30-v6.0-rc3
Subject: renesas/master baseline: 525 runs,
 51 regressions (renesas-devel-2022-08-30-v6.0-rc3)
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

renesas/master baseline: 525 runs, 51 regressions (renesas-devel-2022-08-30=
-v6.0-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+ima                | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 3          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

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

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | renesas=
_defconfig            | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-30-v6.0-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-30-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      87c1cb103bc6896ad3e45e0cc1417b57696d733a =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd6db7c33cd7661355643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd6db7c33cd7661355=
644
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd84372146adec635564a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd84372146adec6355=
64b
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddb04ae2572428f35564e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630ddb04ae2572428f355=
64f
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630de6f849fd47a9ba355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630de6f849fd47a9ba355=
646
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd9b0d9225839243556d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd9b0d922583924355=
6d9
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd759101ce8d0ba3556c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-lx2160a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-lx2160a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd759101ce8d0ba355=
6c2
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddb44486b3a37ab355646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630ddb44486b3a37ab355=
647
        failing since 112 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddbd0f1fb1dd5d1355652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630ddbd0f1fb1dd5d1355=
653
        failing since 84 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/630dddd8c3f4c6c6a8355671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dddd8c3f4c6c6a8355=
672
        failing since 71 days (last pass: renesas-devel-2022-06-17-v5.19-rc=
2, first fail: renesas-devel-2022-06-20-v5.19-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/630de2ecbfb1073f3f35565b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630de2ecbfb1073f3f355=
65c
        failing since 112 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630de558caf1dacdab35564d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630de558caf1dacdab355=
64e
        failing since 112 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd74f101ce8d0ba3556a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sd=
b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd74f101ce8d0ba355=
6a9
        failing since 13 days (last pass: renesas-devel-2022-07-22-v5.19-rc=
7, first fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd7914168861b6b355678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd7914168861b6b355=
679
        new failure (last pass: renesas-devel-2022-07-22-v5.19-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630de4024cf8def18f35564d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630de4024cf8def18f355=
64e
        failing since 122 days (last pass: renesas-devel-2022-04-13-v5.18-r=
c2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddb559e342d42c135564f

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
0ddb569e342d42c1355658
        failing since 56 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5)

    2022-08-30T09:41:12.549016  /lava-160587/1/../bin/lava-test-case
    2022-08-30T09:41:12.637056  <8>[   42.699680][  T324] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/630ddf8e24656841ff355670

  Results:     49 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630ddf8e24656841ff35567e
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-08-30T09:59:17.174676  /lava-160544/1/../bin/lava-test-case
    2022-08-30T09:59:17.174976  <8>[   19.274865] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-30T09:59:17.175132  /lava-160544/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
ddf8e24656841ff355680
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-08-30T09:59:18.195340  /lava-160544/1/../bin/lava-test-case
    2022-08-30T09:59:18.195640  <8>[   20.319125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-30T09:59:18.195792  /lava-160544/1/../bin/lava-test-case
    2022-08-30T09:59:18.195934  <8>[   20.338958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-30T09:59:18.196075  /lava-160544/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/630=
ddf8e24656841ff355683
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2)

    2022-08-30T09:59:19.232771  /lava-160544/1/../bin/lava-test-case
    2022-08-30T09:59:19.233068  <8>[   21.382871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-08-30T09:59:19.233221  /lava-160544/1/../bin/lava-test-case
    2022-08-30T09:59:19.233363  <8>[   21.402832] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-08-30T09:59:19.233506  /lava-160544/1/../bin/lava-test-case
    2022-08-30T09:59:19.233653  <8>[   21.424058] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-08-30T09:59:19.233791  /lava-160544/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/630de1963c9540d5f6355663

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630de1963c9540d5f6355671
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19-rc8=
, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-08-30T10:08:06.664685  /lava-160559/1/../bin/lava-test-case
    2022-08-30T10:08:06.665091  <8>[   19.427381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-30T10:08:06.665343  /lava-160559/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
de1963c9540d5f6355673
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19-rc8=
, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-08-30T10:08:07.702476  /lava-160559/1/../bin/lava-test-case
    2022-08-30T10:08:07.702886  <8>[   20.471895] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-30T10:08:07.703151  /lava-160559/1/../bin/lava-test-case
    2022-08-30T10:08:07.703388  <8>[   20.491851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-30T10:08:07.703625  /lava-160559/1/../bin/lava-test-case
    2022-08-30T10:08:07.703851  <8>[   20.512416] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-30T10:08:07.704081  /lava-160559/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/630de2882610eda569355642

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630de2882610eda569355650
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19-rc8=
, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-08-30T10:12:12.767844  /lava-160563/1/../bin/lava-test-case
    2022-08-30T10:12:12.768252  <8>[   19.397681] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
de2882610eda569355652
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19-rc8=
, first fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-08-30T10:12:13.805359  /lava-160563/1/../bin/lava-test-case
    2022-08-30T10:12:13.805672  <8>[   20.442273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-30T10:12:13.805825  /lava-160563/1/../bin/lava-test-case
    2022-08-30T10:12:13.805964  <8>[   20.462287] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-30T10:12:13.806103  /lava-160563/1/../bin/lava-test-case
    2022-08-30T10:12:13.806238  <8>[   20.482670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-30T10:12:13.806374  /lava-160563/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/630de42ba50c899e5f355650

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630de42ba50c899e5f35565e
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-08-30T10:19:01.268313  /lava-160573/1/../bin/lava-test-case
    2022-08-30T10:19:01.268870  <8>[   19.258230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-30T10:19:01.269051  /lava-160573/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
de42ba50c899e5f355660
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-22-v6.0-rc2)

    2022-08-30T10:19:02.305655  /lava-160573/1/../bin/lava-test-case
    2022-08-30T10:19:02.306163  <8>[   20.302578] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-30T10:19:02.306375  /lava-160573/1/../bin/lava-test-case
    2022-08-30T10:19:02.306570  <8>[   20.322551] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-30T10:19:02.306758  /lava-160573/1/../bin/lava-test-case
    2022-08-30T10:19:02.306922  <8>[   20.343012] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-30T10:19:02.307097  /lava-160573/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/630de2807830ba99c135567c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/630de2807830ba9=
9c1355683
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2)
        2 lines

    2022-08-30T10:11:50.020650  kern  :emerg : Code: d2800028 d2e02809 f2e0=
0808 17ffffd1 (d4210000<8>[   20.492917] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-08-30T10:11:50.021646  ) =

    2022-08-30T10:11:50.022634  + set +x<8>[   20.502286] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 2422183_1.5.2.4.1>
    2022-08-30T10:11:50.023733     =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/630de2807830ba99=
c1355685
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2)
        1 lines

    2022-08-30T10:11:49.443533  / # =

    2022-08-30T10:11:49.559670  #
    2022-08-30T10:11:49.665414  export SHELL=3D/bin/sh
    2022-08-30T10:11:49.666907  =

    2022-08-30T10:11:49.668111  / # #
    2022-08-30T10:11:49.771381  / # export SHELL=3D/bin/sh. /lava-2422183/e=
nvironment
    2022-08-30T10:11:49.874950  /lava-2422183/bin/lava-test-runner /lava-24=
22183/0
    2022-08-30T10:11:49.879812  =

    2022-08-30T10:11:49.880782  / # . /lava-2422183/environment
    2022-08-30T10:11:49.882208  / # /lava-2422183/bin/lava-test-runner /lav=
a-2422183/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd9f5f1700b18c0355646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd9f5f1700b18c0355=
647
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd7f7809f5c82ce3556a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd7f7809f5c82ce355=
6a5
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddb1255c898bc42355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630ddb1255c898bc42355=
643
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddca2913a7f81ff355648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
panda.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630ddca2913a7f81ff355=
649
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/630de26b7830ba99c1355659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630de26b7830ba99c1355=
65a
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630de4134cf8def18f355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-pand=
a.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-pand=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630de4134cf8def18f355=
654
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630dde5a38902c65c6355666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-pan=
da.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dde5a38902c65c6355=
667
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd16f11751d9aae35564e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd16f11751d9aae355=
64f
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd229ef5d4790f0355671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd229ef5d4790f0355=
672
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd1708e391a5ab635564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd1708e391a5ab6355=
64d
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd1709ef8be186d355651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd1709ef8be186d355=
652
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd22aef5d4790f0355674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd22aef5d4790f0355=
675
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd17184e2974fc135565d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd17184e2974fc1355=
65e
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddec1b407afe4d735564f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630ddec1b407afe4d7355=
650
        failing since 56 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd9e4b1e6eeb731355657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd9e4b1e6eeb731355=
658
        failing since 56 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630dde845713fff27835565b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dde845713fff278355=
65c
        failing since 18 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd9e2c574c4f6f235573b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd9e2c574c4f6f2355=
73c
        failing since 18 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd597c05859f35035565e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630dd597c05859f350355=
65f
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd4e12954c69040355648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774b1=
-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774b1=
-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/630dd4e12954c69=
040355651
        new failure (last pass: renesas-devel-2022-08-16-v6.0-rc1)
        2 lines

    2022-08-30T09:13:49.672275  kern  :emerg : BUG: spinlock already unlock=
ed on CPU#1, kworker/u4:0/8
    2022-08-30T09:13:49.672411  kern  :emerg :  lock: sc<8>[   20.183842] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASU=
REMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddeed2d21fdc7e635567b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630ddeed2d21fdc7e6355=
67c
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddb54b6d44f61e935565d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/630ddb54b6d44f6=
1e9355664
        new failure (last pass: renesas-devel-2022-08-16-v6.0-rc1)
        2 lines

    2022-08-30T09:41:21.956440  kern  :emerg : BUG: spinlock already unlock=
ed on CPU#7, kworker/u16:5/182
    2022-08-30T09:41:21.956716  kern  :emerg :  lock: sci_ports+0x0/0x4f50,=
 .magic: dead4ead, .owner: <none>/<8>[   20.055864] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/630dd7d767e71076f43556bb

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/630dd7d767e71076f43556dd
        failing since 174 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-08-30T09:26:28.063758  /lava-7135213/1/../bin/lava-test-case
    2022-08-30T09:26:28.073860  <8>[   36.818723] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/630dd7d767e71076f4355700
        failing since 84 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-08-30T09:26:25.814174  /lava-7135213/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/630dd7d767e71076f4355701
        failing since 84 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-08-30T09:26:24.768029  /lava-7135213/1/../bin/lava-test-case
    2022-08-30T09:26:24.784451  <8>[   33.528027] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/630dd7d767e71076f4355702
        failing since 84 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-08-30T09:26:22.682678  <8>[   31.424979] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-08-30T09:26:23.723735  /lava-7135213/1/../bin/lava-test-case
    2022-08-30T09:26:23.735623  <8>[   32.478733] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
