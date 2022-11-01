Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32B2614E00
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 16:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiKAPN6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 11:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbiKAPNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 11:13:38 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6F71EAE2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 08:09:13 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id p21so9957638plr.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy4A/HntTKfdLHaacqLJOtRK3fB9nObn0NwalpF1SW8=;
        b=2vu6GesdTsHDPS65WJpShpdxxZf1iv9ptT9gJifWiFEqzo8kMCqOHed+5IyBrWpgK8
         XuJqv6Im0O8HMUrFFT/VIcpd5e7eNfI57WTq5sv74ahZMJfHGgepxVYdemUSZTL2/p1g
         CqxazD1B47n/LPUSTiDE5tFXyFRiIclu69YMtUAycwB7X2KeSTDWqiW3NpDFebtZio7d
         6aEBoZGKIdZ0zegmeuUn7fV/M15Wz2O/ihAnJZSyqMQ118iXB8Za2gIBkMzP5MMNvivA
         P8kn0v4pQdsRXeIFJyo1opHj1rdX/NSRKG6nfp6hj8TXAFoX192SZzp1XwNDFGZAs7RD
         xjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy4A/HntTKfdLHaacqLJOtRK3fB9nObn0NwalpF1SW8=;
        b=NIDHdAtGDCd2N1GgW5fTkcyeqX1ztfWGK+j3Yn6DxjmGOW1nG+h7Ot9KXsNx4Wtknm
         9QPys5uzOo9D43Y+ZUGLL9qwKTIRMds0RxbYV6MRRwDqZWjcmS5GkBppn/O8EDGMTwkw
         do7Id15Eh3FIB5c+XO5+13DowqvZqlhLeT/2VpLhJtr6xRESe/8+zip2lH6MZ+as5JNZ
         LAE07a21o1cp6R5IFDD1573IffKVlh9fPGmgdcs8xqNavqVdUdF2RSkwwwbOXR7UiWs8
         bh3jbQHBmJ57MtlIQs6RnTa72r/A8imTu9L436XTxUo6yXXKQzWES6jGHvNL8PxCGTuT
         gKIw==
X-Gm-Message-State: ACrzQf0b003sXiI+uPQQSgOjDk+TnfjHoQ4PfX0ZlV8UFH5c5YOxUkpJ
        3SPQmFZlYS1ZD2gFcMfNp5OpYw+HY4ZjnlJ2
X-Google-Smtp-Source: AMsMyM47t95h+rl1yeC1MEQNXkxqUwbe/TkgxQJ4q0ci2PruxSj3mKz4AQCqPt90Pq5apXjaY6gL+w==
X-Received: by 2002:a17:90a:b8f:b0:213:c985:b5e5 with SMTP id 15-20020a17090a0b8f00b00213c985b5e5mr15494322pjr.57.1667315352658;
        Tue, 01 Nov 2022 08:09:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z24-20020a63e558000000b004351358f056sm6045730pgj.85.2022.11.01.08.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 08:09:12 -0700 (PDT)
Message-ID: <63613698.630a0220.622cf.a93c@mx.google.com>
Date:   Tue, 01 Nov 2022 08:09:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-01-v6.1-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 468 runs,
 21 regressions (renesas-devel-2022-11-01-v6.1-rc3)
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

renesas/master baseline: 468 runs, 21 regressions (renesas-devel-2022-11-01=
-v6.1-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-01-v6.1-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-01-v6.1-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      484e5fc34235bd38f3d58742e7af8455e2699205 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6361007336de31b9a9e7dbaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6361007336de31b9a9e7d=
bab
        failing since 185 days (last pass: renesas-devel-2022-04-13-v5.18-r=
c2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/636102ef039040a195e7dbad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636102ef039040a195e7d=
bae
        new failure (last pass: renesas-devel-2022-10-28-v6.1-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6361046bc99a3f1cc8e7dc09

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kon=
tron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kon=
tron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/636=
1046bc99a3f1cc8e7dc1c
        new failure (last pass: renesas-devel-2022-10-24-v6.1-rc2)

    2022-11-01T11:34:54.927815  /lava-195661/1/../bin/lava-test-case
    2022-11-01T11:34:54.928194  <8>[   16.918531] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-11-01T11:34:54.928450  /lava-195661/1/../bin/lava-test-case
    2022-11-01T11:34:54.928676  <8>[   16.939249] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6360ff217d882784f1e7dbd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6360ff217d882784f1e7d=
bd3
        failing since 77 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6360fc8464b90fb0aae7dbe8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6360fc8464b90fb0aae7d=
be9
        failing since 14 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636101f6560f08618fe7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636101f6560f08618fe7d=
b4f
        failing since 14 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6361056b20ba7bd801e7db6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6361056b20ba7bd801e7d=
b6c
        failing since 14 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636101c0ce1655f98de7db58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636101c0ce1655f98de7d=
b59
        failing since 14 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636101de297ddc4992e7db73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636101de297ddc4992e7d=
b74
        failing since 14 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6361055620ba7bd801e7db57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6361055620ba7bd801e7d=
b58
        failing since 14 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636101f7f542b99626e7db8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636101f7f542b99626e7d=
b90
        failing since 14 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63610592fba23c7257e7db4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63610592fba23c7257e7d=
b50
        failing since 14 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636101f4f542b99626e7db8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636101f4f542b99626e7d=
b8d
        failing since 14 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6361055893786f026ce7db67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6361055893786f026ce7d=
b68
        failing since 14 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/636110bfa016ff5454e7db5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636110bfa016ff5454e7d=
b5b
        failing since 3 days (last pass: renesas-devel-2022-10-24-v6.1-rc2,=
 first fail: renesas-devel-2022-10-28-v6.1-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/6360ff8e9b2c1780c8e7db50

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6360ff8e9b2c1780c8e7db72
        failing since 237 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-11-01T11:13:57.233103  <8>[   48.233747] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-11-01T11:13:58.281844  /lava-7802051/1/../bin/lava-test-case
    2022-11-01T11:13:58.300228  <8>[   49.300557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6360ff8e9b2c1780c8e7db95
        failing since 147 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-01T11:13:55.245657  /lava-7802051/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6360ff8e9b2c1780c8e7db96
        failing since 147 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-01T11:13:54.186616  /lava-7802051/1/../bin/lava-test-case
    2022-11-01T11:13:54.202953  <8>[   45.202734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6360ff8e9b2c1780c8e7db97
        failing since 147 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-01T11:13:53.108648  /lava-7802051/1/../bin/lava-test-case
    2022-11-01T11:13:53.128425  <8>[   44.128021] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6360fe28aa0dfd67d8e7db89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6360fe28aa0dfd67d8e7d=
b8a
        failing since 3 days (last pass: renesas-devel-2022-10-24-v6.1-rc2,=
 first fail: renesas-devel-2022-10-28-v6.1-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6360fef0f3315d91a9e7db87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6360fef0f3315d91a9e7d=
b88
        failing since 8 days (last pass: renesas-devel-2022-10-17-v6.1-rc1,=
 first fail: renesas-devel-2022-10-24-v6.1-rc2) =

 =20
