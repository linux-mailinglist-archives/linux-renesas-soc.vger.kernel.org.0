Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 233FF57EBA6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Jul 2022 05:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiGWDL6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 23:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGWDL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 23:11:56 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B4281B3A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 20:11:53 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w7so5970212ply.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 20:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AcQQgAV4nobJu7c+fZapSgem+uZDCQV7ePM7rnPZWYk=;
        b=4OpGWjs9cpHnYBQkPUoLwSG4HUSIOWzmZi+d96uU7G6UQduMJ7/pCoxwQNVBWHyUr9
         ImtCwJxg+OO2zHoj3sStHHGQjIRTEOG0QbdacLRsuHcym1XANueg9hvvrsA1MqryK/Lj
         KS+ByZAvh0Th7KTTmRUCh2UOW2ZYEuqgT3M2vJSYOGyZi/wnSWZ3ojJ+oA6Dp5Sj36KY
         iYOiKN0hFpU18AF2iPCEldK2ffhgYcE75YaYms8izDJWHgE5ckDxNaMnBwoyQkYgkDU/
         YTAjS7sbsvU3tZ3xaMGIR69DxG24pPjzS5yhEc23StfAhAxZ2Y8VV9ySrK4UITvS1/uR
         Lz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AcQQgAV4nobJu7c+fZapSgem+uZDCQV7ePM7rnPZWYk=;
        b=JqHfN0XDJDOCtHauZrJNIK2G6dNOGUOEAxhbCnsBdhwWQvnsJj24wJyD6VSq16O0/N
         lSuxr4mPn9NuqpFIV8uZTPGQrnZ7Ct7u10VmhY42zZtGIXYWk3+dUTi6troWzKQuokYN
         AHdIEmBrEECHGYPGhPuNSNku8DOXBbFZY3pC/C3fofbsLL7FgWFuNVcd6971inctD2k/
         8eWpu3WTlroz05HUxfEL7Oe5YtSgbwOXVIBrHgXSizRZ8qRNQiXkNlu7Kmoe3TfLddAU
         kZindphtvKYWtHqE6+iPCZXLLKbR7yyhYVy2DqmVutImHsURprxIua6fhab23h6Jq3Kk
         SmnA==
X-Gm-Message-State: AJIora/bFPK0mC3pO0HLlJLnhA9lvHE/6vOgq95g7SpG8En537mgqjpx
        SZkrh0MvZn/wV9ZtWEZOqzVJKRUQLThoMsMe
X-Google-Smtp-Source: AGRyM1sIPCVQrH2z9lAUpvTY6rHjOFd3mlcjV7Hka00NLwK2xZ/Pug3vWLc2lDUCh1tnKio6FMVq8A==
X-Received: by 2002:a17:90a:4b05:b0:1f2:1c2a:6fea with SMTP id g5-20020a17090a4b0500b001f21c2a6feamr19414432pjh.115.1658545912629;
        Fri, 22 Jul 2022 20:11:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h5-20020a654045000000b00413d592af6asm4164534pgp.50.2022.07.22.20.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 20:11:52 -0700 (PDT)
Message-ID: <62db66f8.1c69fb81.7e393.6d79@mx.google.com>
Date:   Fri, 22 Jul 2022 20:11:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-22-v5.19-rc7
Subject: renesas/master baseline: 512 runs,
 35 regressions (renesas-devel-2022-07-22-v5.19-rc7)
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

renesas/master baseline: 512 runs, 35 regressions (renesas-devel-2022-07-22=
-v5.19-rc7)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

imx8mn-ddr4-evk            | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 2          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 2          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 2          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+ima                | 2          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
                    | 2          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+crypto             | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-22-v5.19-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-22-v5.19-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3ddd67eca4592c2e96f8aa938195d645d1f8324b =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62db4ededf2b4af4eadaf08c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db4ededf2b4af4eadaf=
08d
        failing since 74 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62db451a1aa8aaa6b0daf075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db451a1aa8aaa6b0daf=
076
        failing since 74 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62db4876635f54b646daf062

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db4876635f54b646daf=
063
        failing since 32 days (last pass: renesas-devel-2022-06-17-v5.19-rc=
2, first fail: renesas-devel-2022-06-20-v5.19-rc3) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62db4a6a0482ce3e57daf064

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db4a6a0482ce3e57daf=
065
        failing since 46 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62db4af71d74d27b97daf07c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db4af71d74d27b97daf=
07d
        failing since 74 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62db4ceb5f0498b203daf08a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/ba=
seline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/ba=
seline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db4ceb5f0498b203daf=
08b
        failing since 46 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk            | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3452f4b6284ea7daf090

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db3452f4b6284ea7daf=
091
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62db315ebf0f234584daf0d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db315ebf0f234584daf=
0da
        failing since 84 days (last pass: renesas-devel-2022-04-13-v5.18-rc=
2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db35f7129c65af8cdaf0d0

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
db35f7129c65af8cdaf0d9
        failing since 18 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5)

    2022-07-22T23:42:11.361631  /lava-144498/1/../bin/lava-test-case
    2022-07-22T23:42:11.462571  <8>[   41.492510][  T320] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db36c5b3bfb3bc06daf07b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db36c5b3bfb3bc06daf=
07c
        failing since 18 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3ee9b2e7aa0080daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db3ee9b2e7aa0080daf=
057
        failing since 18 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db36c7b3bfb3bc06daf081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db36c7b3bfb3bc06daf=
082
        failing since 74 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3f1163d9b022a5daf070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db3f1163d9b022a5daf=
071
        failing since 74 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62db36e2b5055ca153daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db36e2b5055ca153daf=
058
        failing since 17 days (last pass: renesas-devel-2022-06-29-v5.19-rc=
4, first fail: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2d4663587a2577daf09a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db2d4663587a2=
577daf0a1
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        2 lines

    2022-07-22T23:05:30.141316  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-22T23:05:30.144873  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:05:30.149609  [   60.577861] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:05:30.149831  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db2d4663587a2=
577daf0a2
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        12 lines

    2022-07-22T23:05:30.120345  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:05:30.120823  kern  :alert : Mem abort info:
    2022-07-22T23:05:30.120991  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-22T23:05:30.121362  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:05:30.121783  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:05:30.121958  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:05:30.122349  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-22T23:05:30.122751  kern  :alert : Data abort info:
    2022-07-22T23:05:30.122980  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T23:05:30.123212  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2f4d9be3bb0947daf080

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db2f4d9be3bb0=
947daf087
        failing since 3 days (last pass: renesas-devel-2022-07-05-v5.19-rc5=
, first fail: renesas-devel-2022-07-19-v5.19-rc7)
        2 lines

    2022-07-22T23:14:11.030554  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-22T23:14:11.034177  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:14:11.038826  [   60.451411] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:14:11.039131  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db2f4d9be3bb0=
947daf088
        failing since 3 days (last pass: renesas-devel-2022-07-05-v5.19-rc5=
, first fail: renesas-devel-2022-07-19-v5.19-rc7)
        12 lines

    2022-07-22T23:14:11.009551  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:14:11.010101  kern  :alert : Mem abort info:
    2022-07-22T23:14:11.010336  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-22T23:14:11.010637  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:14:11.010962  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:14:11.011199  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:14:11.011524  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-22T23:14:11.011867  kern  :alert : Data abort info:
    2022-07-22T23:14:11.012011  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T23:14:11.012366  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62db32328f25e26f9adaf0a1

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db32328f25e26=
f9adaf0a8
        failing since 3 days (last pass: renesas-devel-2022-07-05-v5.19-rc5=
, first fail: renesas-devel-2022-07-19-v5.19-rc7)
        2 lines

    2022-07-22T23:26:35.857296  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-22T23:26:35.860908  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:26:35.865406  [   45.605243] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:26:35.865718  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db32328f25e26=
f9adaf0a9
        failing since 3 days (last pass: renesas-devel-2022-07-05-v5.19-rc5=
, first fail: renesas-devel-2022-07-19-v5.19-rc7)
        12 lines

    2022-07-22T23:26:35.835808  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:26:35.836352  kern  :alert : Mem abort info:
    2022-07-22T23:26:35.836620  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-22T23:26:35.836971  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:26:35.837391  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:26:35.837605  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:26:35.837869  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-22T23:26:35.838274  kern  :alert : Data abort info:
    2022-07-22T23:26:35.838499  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T23:26:35.838896  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62db343ae810db848cdaf07b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3=
328-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3=
328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db343ae810db8=
48cdaf082
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        2 lines

    2022-07-22T23:35:09.510485  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-22T23:35:09.514158  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:35:09.518658  [   60.402253] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:35:09.518965  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db343ae810db8=
48cdaf083
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        12 lines

    2022-07-22T23:35:09.488296  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:35:09.488790  kern  :alert : Mem abort info:
    2022-07-22T23:35:09.489094  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-22T23:35:09.489354  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:35:09.489738  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:35:09.489899  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:35:09.490257  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-22T23:35:09.490725  kern  :alert : Data abort info:
    2022-07-22T23:35:09.490863  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T23:35:09.491216  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db367e9a7bb010c8daf0ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-rk33=
28-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-rk33=
28-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db367e9a7bb010c8daf=
0ac
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62db3010a4f727a842daf08b

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62db3010a4f727a842daf0ad
        failing since 136 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-07-22T23:17:15.257246  /lava-6873037/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62db3010a4f727a842daf0d0
        failing since 46 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-07-22T23:17:13.035319  /lava-6873037/1/../bin/lava-test-case
    2022-07-22T23:17:13.046682  <8>[   34.412450] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62db3010a4f727a842daf0d1
        failing since 46 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-07-22T23:17:10.960438  <8>[   32.325749] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-07-22T23:17:11.990334  /lava-6873037/1/../bin/lava-test-case
    2022-07-22T23:17:12.002144  <8>[   33.367747] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62db3010a4f727a842daf0d2
        failing since 46 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-07-22T23:17:10.948026  /lava-6873037/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2afee37b80889adaf056

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-co=
llabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-co=
llabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db2afee37b808=
89adaf05d
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        2 lines

    2022-07-22T22:55:42.065101  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T22:55:42.065639  <8>[   43.875377] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T22:55:42.065995  + set +x
    2022-07-22T22:55:42.066320  <8>[   43.877202] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6872890_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db2afee37b808=
89adaf05e
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        12 lines

    2022-07-22T22:55:42.021913  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T22:55:42.022448  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-22T22:55:42.022791  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079945000
    2022-07-22T22:55:42.023110  kern  :alert : [0000000000000005] pgd=3D080=
0000079946003, p4d=3D0800000079946003, pud=3D0800000079947003, pmd=3D000000=
0000000000
    2022-07-22T22:55:42.023418  <8>[   43.855558] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-22T22:55:42.023718  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2e6f33f828e6bddaf0ac

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db2e6f33f828e=
6bddaf0b3
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        2 lines

    2022-07-22T23:10:23.291772  <8>[   43.872399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:10:23.292316  + set +x
    2022-07-22T23:10:23.292670  <8>[   43.874838] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6872996_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db2e6f33f828e=
6bddaf0b4
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        12 lines

    2022-07-22T23:10:23.227540  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:10:23.228081  kern  :alert : Mem abort info:
    2022-07-22T23:10:23.228428  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-22T23:10:23.228752  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:10:23.229064  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:10:23.229370  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:10:23.229663  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-22T23:10:23.229957  kern  :alert : Data abort info:
    2022-07-22T23:10:23.230247  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T23:10:23.230532  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (5 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62db3168c0b9a4b413daf085

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db3168c0b9a4b=
413daf08c
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        2 lines

    2022-07-22T23:23:03.487503  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:23:03.488048  <8>[   44.602692] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:23:03.488402  + set +x
    2022-07-22T23:23:03.488728  <8>[   44.604830] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6873155_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db3168c0b9a4b=
413daf08d
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        12 lines

    2022-07-22T23:23:03.443448  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T23:23:03.443991  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-22T23:23:03.444341  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079b01000
    2022-07-22T23:23:03.444666  kern  :alert : [0000000000000005] pgd=3D080=
0000079b03003, p4d=3D0800000079b03003, pud=3D0800000079b04003, pmd=3D000000=
0000000000
    2022-07-22T23:23:03.444981  <8>[   44.581438] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-22T23:23:03.445285  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62db321b8f25e26f9adaf061

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62db321b8f25e26=
f9adaf068
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        2 lines

    2022-07-22T23:26:09.569119  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:26:09.569670  <8>[   44.843765] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:26:09.570028  + set +x
    2022-07-22T23:26:09.570359  <8>[   44.845789] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6873164_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62db321b8f25e26=
f9adaf069
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        12 lines

    2022-07-22T23:26:09.526140  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-22T23:26:09.526687  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-22T23:26:09.527043  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000799b5000
    2022-07-22T23:26:09.527368  kern  :alert : [0000000000000005] pgd=3D080=
00000799b6003, p4d=3D08000000799b6003, pud=3D08000000799b7003, pmd=3D000000=
0000000000
    2022-07-22T23:26:09.527684  <8>[   44.823447] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-22T23:26:09.527993  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =20
