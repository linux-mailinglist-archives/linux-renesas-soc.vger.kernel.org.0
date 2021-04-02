Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03DB353012
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 21:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhDBT7X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 15:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBT7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 15:59:23 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE73C0613E6
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Apr 2021 12:59:21 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id l76so4147931pga.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Apr 2021 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CmCJn13UiBtMwWu8grLFj6Fi1vqVgC3HdjwFrJyAvfA=;
        b=jHVJDcoYD48xq+RGRzg9eHXo6HkAji2gMOSO8zI64WoU8ENzOXOfW0S51CaupVJpeV
         tgVmeiFRKP3PT7mGghplF42bW5S2Nik/JJx8hs22l04tDyf4iE+rPF/tMzLtqHS/ddCM
         iIDGqrrbW+LpMnNVQXmS4KxOF0ECwQPYNJKbXF/OADTheYm4lsiuvy7wRCIMAxzfuy+h
         xLRAN/Cvp8Nww1SC5dNkGavgi32vjOgHj674cMEbi8hvwOmN20nvIi09HOToYrhcvMYO
         KRpsUCVwzavfzz5kwBWsTpbMvODlwjgJNXQcOifHRAq8TCOGzELDUY8wuQhxvOO5f8/y
         L6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CmCJn13UiBtMwWu8grLFj6Fi1vqVgC3HdjwFrJyAvfA=;
        b=eiTZUDePciWlhTpB+tyHfTksOdyk+lOQk9dsywdsBG5DZaxBolAes6g7gE+I9lyuPm
         m2X1qwiyP5C/TQzt9deY2RWhnnMI+6Rq+TVfZW3cyeo6HCfv2Z2R4Jcpjs8smLqUfXJw
         djFyvnfHYKGR3wv7tBymTT2itTN6C0P6W02ytSHKVxXYbH8QsXcL9G9iOu2GnCMTuK0N
         0dUwBjDPH+hC2Op+mcfg+ktzAFz6709xsw2hlezKtxkDLdKj7lyBy6gN+rq5f1FewHbT
         FS4MFk7dKePJeP/O0EpOzyzcdTjiCU/26CV26TAtOwzJWSVYI6IS1GAVDe/iz639jakR
         /6ag==
X-Gm-Message-State: AOAM530FNxnzxhMVUutOBb2BnLAbnbXbBMXRbSSGiHmNZZXshfFjcn+J
        R4xds3z9Sy5O5WDiNJAKi9dfbfZlGBYotA==
X-Google-Smtp-Source: ABdhPJzHB6Hhwk7dlSpFP76GI4LWn7sMLCZYyxerTuynvG0Zw/QMCfA9QIPONaIOqCrf7kgUynQlRA==
X-Received: by 2002:a63:67c7:: with SMTP id b190mr12846656pgc.162.1617393561109;
        Fri, 02 Apr 2021 12:59:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p17sm8629009pfn.62.2021.04.02.12.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 12:59:20 -0700 (PDT)
Message-ID: <60677798.1c69fb81.86ea7.6886@mx.google.com>
Date:   Fri, 02 Apr 2021 12:59:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-02-v5.12-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 232 runs,
 8 regressions (renesas-devel-2021-04-02-v5.12-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 232 runs, 8 regressions (renesas-devel-2021-04-02-=
v5.12-rc5)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig =
           | 1          =

imx8mp-evk           | arm64 | lab-nxp      | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp      | gcc-8    | defconfig         =
           | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre | gcc-8    | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =

meson-gxm-q200       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

meson-gxm-q200       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie  | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-02-v5.12-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-02-v5.12-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      61f98817b996ae8435e7809a3e41d8113556f1d1 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60673d4c93a5999a5ddac6c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60673d4c93a5999a5ddac=
6c5
        new failure (last pass: renesas-devel-2021-03-29-v5.12-rc5) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
imx8mp-evk           | arm64 | lab-nxp      | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60673f12833ca60d6bdac6f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60673f12833ca60d6bdac=
6f1
        failing since 9 days (last pass: renesas-devel-2021-03-22-v5.12-rc4=
, first fail: renesas-devel-2021-03-24-v5.12-rc4) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
imx8mp-evk           | arm64 | lab-nxp      | gcc-8    | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/606742081e4f70ee87dac6cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606742081e4f70ee87dac=
6cc
        failing since 18 days (last pass: renesas-devel-2021-03-12-v5.12-rc=
2, first fail: renesas-devel-2021-03-15-v5.12-rc3) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
meson-gxbb-p200      | arm64 | lab-baylibre | gcc-8    | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606746d6e2b433d1e7dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606746d6e2b433d1e7dac=
6b2
        new failure (last pass: renesas-devel-2021-03-24-v5.12-rc4) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
meson-gxm-q200       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60673d824d0722d2d0dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60673d824d0722d2d0dac=
6c0
        failing since 9 days (last pass: renesas-devel-2021-03-22-v5.12-rc4=
, first fail: renesas-devel-2021-03-24-v5.12-rc4) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
meson-gxm-q200       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60674114f846a25011dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60674114f846a25011dac=
6bb
        new failure (last pass: renesas-devel-2021-03-29-v5.12-rc5) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm   | lab-baylibre | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60673955cc2887733edac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60673955cc2887733edac=
6c0
        failing since 135 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm   | lab-broonie  | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/606739743f2c9435e6dac6e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606739743f2c9435e6dac=
6e5
        failing since 135 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
