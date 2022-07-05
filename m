Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F1C567076
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 16:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiGEOLG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 10:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbiGEOKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 10:10:49 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F86FC7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 07:02:46 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id a15so5544476pjs.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9i3M7IdT3H0216+dYNhwA6OOiLuQUXIyL7eWaZK4RKY=;
        b=Rnbmps9A4/WqUupvQV0HqlgDtqXelKdvYQspigt6TiHR7o07XeO0Ofw8iFoWRZ/GRe
         p38q1e90mfiWSzew28Jc/lfU3goBK6kd9zRH1skxKpClYKTzBDZY+1pa0KG8m5xmrlyq
         vTKaClxGTAI9gSGy9UCV+n+m6R9dCEkpXIJZEbHFRCTYPChoqve12ZuIkhvjeJljsOwk
         9vlNfUKM5/Pcx8eRxu9nVjvTvPDhuL9TYbtSv0L0wkEFtWOV8uzi6fJQFmkZnGqZ7MLF
         PmIUMpQAaub6aTdaR/LV4VAwSXLROkQXd3yPQm9tsa9z462xhykj6IwvomrGKLpRPAMq
         Epzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9i3M7IdT3H0216+dYNhwA6OOiLuQUXIyL7eWaZK4RKY=;
        b=XjMjiG3x11GNnSnzq4VS14ixNrxi0x/JRG4XqSWsvsVbqrcjOd7gymlII0K8U/fhpA
         3OdHFyptxYmD5UUAEadxRSVYKtP4nmUnJdRM/dZCztWvb/cwfoe6MDwJSv+Jhd8S+rGC
         n08UK9yKlhgy3zzxdOzi57wXGOK4s/DT35231DdxkRSIKgZ6N3jS6pYn99RbS+EKaRa1
         TMAcYcmGrfqeXIXGRug0nhx4RUXZEbPWOV9DyR51hGNrfUtP0T5/B3vahrEP20/XddvO
         C/ZXMHh1jGK2KeSli7o8RKaej9wX/6Z000sTMqXu3LNCdvlkT234dv3717uarY/bJn9q
         XRjA==
X-Gm-Message-State: AJIora8kX/b6Nx+/CLKTzBxreFKpLL4q0oYvP28ba3xbxLJS0+Teojaa
        Lgu/zSzZxZ65MQ+VBYz5LFlcYPanopbLU9RJ
X-Google-Smtp-Source: AGRyM1uGxIDW00EXgYiZe9t4lPVm3c7W/5xKzct3ggc64orwetVnmDX5S0tynHjREGD5NQhCifUdDg==
X-Received: by 2002:a17:90b:1807:b0:1ef:8aa5:1158 with SMTP id lw7-20020a17090b180700b001ef8aa51158mr11753004pjb.163.1657029764913;
        Tue, 05 Jul 2022 07:02:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u10-20020a170903124a00b0016a01637620sm6574367plh.76.2022.07.05.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 07:02:44 -0700 (PDT)
Message-ID: <62c44484.1c69fb81.4f936.89da@mx.google.com>
Date:   Tue, 05 Jul 2022 07:02:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-05-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 413 runs,
 34 regressions (renesas-devel-2022-07-05-v5.19-rc5)
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

renesas/master baseline: 413 runs, 34 regressions (renesas-devel-2022-07-05=
-v5.19-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_=
defconfig             | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 2          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 2          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+ima       | 2          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-05-v5.19-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-05-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b83d3c70c208b5154097ddfcf4be9a802b12966e =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40cec2039c31d48a39c0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40cec2039c31d48a39=
c0f
        failing since 56 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40d8c3921f78f98a39c2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40d8c3921f78f98a39=
c2c
        failing since 56 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c411602be12ecdd0a39bf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c411602be12ecdd0a39=
bf7
        failing since 56 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4140855d6868bc6a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4140855d6868bc6a39=
bcf
        failing since 28 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4177834e06a3a19a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4177834e06a3a19a39=
bd0
        failing since 15 days (last pass: renesas-devel-2022-06-17-v5.19-rc=
2, first fail: renesas-devel-2022-06-20-v5.19-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40ec1f99721d127a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40ec1f99721d127a39=
be5
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40fc7ec2cf7a762a39c00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40fc7ec2cf7a762a39=
c01
        failing since 66 days (last pass: renesas-devel-2022-04-13-v5.18-rc=
2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c414a0f4b053169aa39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c414a0f4b053169aa39=
be8
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c416bb2c8f860134a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c416bb2c8f860134a39=
be0
        failing since 28 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40bb80277b20f6aa39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40bb80277b20f6aa39=
bd9
        failing since 5 days (last pass: renesas-devel-2022-06-20-v5.19-rc3=
, first fail: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4112503f0cffbc2a39bcd

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
c4112503f0cffbc2a39bda
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)

    2022-07-05T10:22:54.749724  /lava-136610/1/../bin/lava-test-case
    2022-07-05T10:22:54.836669  <8>[   42.025354][  T314] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4152b27cb0f7aeea39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4152b27cb0f7aeea39=
bdc
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c419392329144987a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c419392329144987a39=
bdd
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40c2ba3d68f76dda39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odro=
id-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odro=
id-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40c2ba3d68f76dda39=
be1
        failing since 0 day (last pass: renesas-devel-2022-06-20-v5.19-rc3,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/62c40cfcf9ccc640f1a39bd8

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c40cfcf9ccc64=
0f1a39bdf
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        43 lines

    2022-07-05T10:05:23.438931  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T10:05:23.439430  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c42b1400 pointer offset 64 size 128
    2022-07-05T10:05:23.439870  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-05T10:05:23.460815  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c20ef000 pointer offset 0 size 1024
    2022-07-05T10:05:23.461390  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c20ef000 pointer offset 16 size 1024
    2022-07-05T10:05:23.461828  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-05T10:05:23.482853  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c20ef000 pointer offset 16 size 1024
    2022-07-05T10:05:23.483356  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c42b1480 pointer offset 64 size 128
    2022-07-05T10:05:23.483794  kern  :alert : Register r12 information: sl=
ab task_struct start c317f480 pointer offset 0
    2022-07-05T10:05:23.504877  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c40cfcf9ccc64=
0f1a39be0
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        16 lines

    2022-07-05T10:05:23.393788  kern  :alert : 8<--- cut here ---
    2022-07-05T10:05:23.394287  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T10:05:23.394731  kern  :alert : [00000000] *pgd=3Da8a3c835
    2022-07-05T10:05:23.395160  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-05T10:05:23.416812  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-05T10:05:23.417377  kern  :aler<8>[   53.354600] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-07-05T10:05:23.417817  t : Register r2 information: non-paged memo=
ry
    2022-07-05T10:05:23.418239  kern  :alert : Register r3 information: non=
-paged memory   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62c41153f1cb4966d5a39bd2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c41153f1cb496=
6d5a39bd9
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        43 lines

    2022-07-05T10:24:07.990595   *pgd=3Da8d0e835
    2022-07-05T10:24:07.990984  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-05T10:24:07.991436  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-05T10:24:07.991836  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T10:24:07.992191  kern  :alert : Register r3 information: non=
-paged memory
    2022-07-05T10:24:08.011983  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T10:24:08.012499  kern  :alert : Register r5 information:
    2022-07-05T10:24:08.012969  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-05T10:24:08.013455  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c3049800
    2022-07-05T10:24:08.033449  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c3049800 =

    ... (48 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c41153f1cb496=
6d5a39bda
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        16 lines

    2022-07-05T10:24:07.967558  kern  :alert : 8<--- cut here ---
    2022-07-05T10:24:07.968060  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T10:24:07.968478  kern  :alert : [00000000]<8>[   51.626400] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62c413a67b2c313e0ba39beb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c413a67b2c313=
e0ba39bf2
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        43 lines

    2022-07-05T10:33:54.352243  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T10:33:54.352475  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c35a2000 pointer offset 64 size 128
    2022-07-05T10:33:54.352699  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-05T10:33:54.375418  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c300a000 pointer offset 0 size 1024
    2022-07-05T10:33:54.375816  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c300a000 pointer offset 16 size 1024
    2022-07-05T10:33:54.376008  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-05T10:33:54.398178  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c300a000 pointer offset 16 size 1024
    2022-07-05T10:33:54.398457  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c35a2080 pointer offset 64 size 128
    2022-07-05T10:33:54.398657  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-05T10:33:54.398849  kern  :emerg : Internal error: Oops: 207 [#=
1] SMP ARM =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c413a67b2c313=
e0ba39bf3
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        16 lines

    2022-07-05T10:33:54.308768  kern  :alert : 8<--- cut here ---
    2022-07-05T10:33:54.309174  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T10:33:54.309377  kern  :alert : [00000000] *pgd=3D4246e003, =
*pmd=3Da8d6f003
    2022-07-05T10:33:54.309572  kern  :alert : Register r0 information:
    2022-07-05T10:33:54.330469  kern  :al<8>[   51.567107] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-07-05T10:33:54.330749  ert : Register r1 information: NULL pointer
    2022-07-05T10:33:54.330949  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T10:33:54.331424  kern  :alert : Register r3 information: non=
-paged memory   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62c417d63637d0e8bba39bde

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c417d63637d0e=
8bba39be5
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        43 lines

    2022-07-05T10:51:52.198830  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T10:51:52.199035  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c2118780 pointer offset 64 size 128
    2022-07-05T10:51:52.199211  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-05T10:51:52.221205  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c3049800 pointer offset 0 size 1024
    2022-07-05T10:51:52.221411  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-05T10:51:52.221593  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-05T10:51:52.243354  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-05T10:51:52.243574  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c2118800 pointer offset 64 size 128
    2022-07-05T10:51:52.243743  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-05T10:51:52.243906  kern  :emerg : Internal error: Oops: 17 [#1=
] SMP THUMB2 =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c417d63637d0e=
8bba39be6
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        16 lines

    2022-07-05T10:51:52.154505  kern  :alert : 8<--- cut here ---
    2022-07-05T10:51:52.154713  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T10:51:52.154896  kern  :alert : [00000000] *pgd=3Da8a62835
    2022-07-05T10:51:52.155107  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-05T10:51:52.176088  kern  :alert : Register r1 information: NUL=
L poi<8>[   51.702107] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D16>
    2022-07-05T10:51:52.176312  nter
    2022-07-05T10:51:52.176508  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T10:51:52.176678  kern  :alert : Register r3 information: non=
-paged memory   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+ima       | 2          =


  Details:     https://kernelci.org/test/plan/id/62c41b1671b11eaa1ea39c43

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baselin=
e-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baselin=
e-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c41b1671b11ea=
a1ea39c4a
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        43 lines

    2022-07-05T11:05:52.266454  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T11:05:52.266662  kern  :alert : Register r5 information: sla=
b kmalloc-128
    2022-07-05T11:05:52.266840  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-05T11:05:52.267013  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c3049800 pointer offset 0 size 1024
    2022-07-05T11:05:52.288537  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-05T11:05:52.288759  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-05T11:05:52.288943  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-05T11:05:52.310606  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c41dc280 pointer offset 64 size 128
    2022-07-05T11:05:52.310811  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-05T11:05:52.310989  kern  :emerg : Internal error: Oops: 17 [#1=
] SMP ARM =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c41b1671b11ea=
a1ea39c4b
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        16 lines

    2022-07-05T11:05:52.222488  kern  :alert : 8<--- cut here ---
    2022-07-05T11:05:52.222694  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T11:05:52.222874  kern  :alert : [00000000] *pgd=3Da8d30835
    2022-07-05T11:05:52.244489  kern  :al<8>[   51.563047] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-07-05T11:05:52.244693  ert : Register r0 information: NULL pointer
    2022-07-05T11:05:52.244871  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-05T11:05:52.245043  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T11:05:52.245236  kern  :alert : Register r3 information: non=
-paged memory   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c413126655ae349ea39c10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c413126655ae349ea39=
c11
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4125636c574c2b5a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4125636c574c2b5a39=
bd9
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4131498d56d2d60a39c92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4131498d56d2d60a39=
c93
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4126ab771f27798a39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4126ab771f27798a39=
c0b
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c41326db2d5f740da39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c41326db2d5f740da39=
c0b
        failing since 56 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4127e9603ef0d03a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4127e9603ef0d03a39=
bd0
        failing since 56 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40d661860986b9da39c04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40d661860986b9da39=
c05
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40f32b52ecc8be2a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40f32b52ecc8be2a39=
be9
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4163bb78ccc67dfa39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c4163bb78ccc67dfa39=
bd2
        failing since 42 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40af66c883ba424a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c40af66c883ba424a39=
bdd
        failing since 27 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-07-v5.19-rc1) =

 =20
