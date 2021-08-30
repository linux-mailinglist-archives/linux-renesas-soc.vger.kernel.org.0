Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB9A3FBCA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Aug 2021 20:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhH3Sq4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Aug 2021 14:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhH3Sqy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Aug 2021 14:46:54 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487F9C061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Aug 2021 11:46:00 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x19so5928576pfu.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Aug 2021 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=o12cB6zXpi7t4Er1YvU5JpiTRU+hwT+dY1epuD6SNrk=;
        b=P+mhxmIANmL9fEAIAE9cUHbxYq3l2bbBBpN3Sz6DBLPXkAzzTfjgEgWi+eIphnupxM
         vsdP7q3h/YRtcf/jYc1xFH400XLn9AL6KXwPIm+ZL1I1YNBOTBv6AVYcR/jiGov8zH/w
         3hErm1kl2Su+PSWmljynMRHc05BtyFOyKRt4U2aCkSlL3OMblDkqMQcoWTldB1s17Op4
         Y2XWkBnMvx+lkqez/GrLLw81I8V5FNHgt1Yl82izmAaMO5mwqXf+4ZDhmL1Kup8/PxPs
         sI5iw3ZQTqTie1O9c+z8p7wCDSEDXZ7gsBUFwuFBN+0iSdTqEyiy46uTv3hbqO+VJJlD
         ye9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=o12cB6zXpi7t4Er1YvU5JpiTRU+hwT+dY1epuD6SNrk=;
        b=uBTPDLuhMc8ZTAyzUA+aMZB5h17Y/64JyZyVdbfcptWhFUL0UrnxNFN5PmhQRvE3dm
         3oRJGw7nTd5dFF6u+Py+8czahwWCEEfSltPHWgwCrXWcxEw09JOcTMfVfn6qY3b6hYfy
         Z7MfyB6NmTLRGrlC9wc5RaUHENJF2uBImjUDHWXTwaUyUanqriZ9VtYUfZt8QNNJH7lo
         d9eolSWdaUlB/Ef9B2EI8jW0DNOAHCM2ry7eU366cJTeOXHk5YJhA1ayNI9Jdfekz/3+
         8lz+sz62a3H3TJXQNeIT0aAfvU1GEn6dL97+LO8tVe0wBdgvtLs6xqhuMHvo1FiD0Wc/
         wTqQ==
X-Gm-Message-State: AOAM531EasFrlVFZJobU6r/nNzJBQAa4jj2MBWoO1VIACai962n9vd1M
        5ejjmrg5lpNPIuI8gIudiFw86UUL3uKoljQp
X-Google-Smtp-Source: ABdhPJzpl8lxE6XMBGL5wg9hkb/J7mbKCOS4jbffIpq0CiD/tBR8Rqi63uuGeu6a9Azxm4cm8aglGg==
X-Received: by 2002:aa7:8b07:0:b029:3c7:c29f:9822 with SMTP id f7-20020aa78b070000b02903c7c29f9822mr24040964pfd.33.1630349159082;
        Mon, 30 Aug 2021 11:45:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u20sm17370114pgm.4.2021.08.30.11.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:45:58 -0700 (PDT)
Message-ID: <612d2766.1c69fb81.e41f2.d05a@mx.google.com>
Date:   Mon, 30 Aug 2021 11:45:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-08-30-v5.14
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 377 runs,
 12 regressions (renesas-devel-2021-08-30-v5.14)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 377 runs, 12 regressions (renesas-devel-2021-08-30=
-v5.14)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig   =
                 | 1          =

beagle-xm                  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 1          =

beagle-xm                  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm                  | arm   | lab-baylibre | gcc-8    | omap2plus_de=
fconfig          | 1          =

fsl-ls1043a-rdb            | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd              | arm   | lab-nxp      | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

meson-g12a-sei510          | arm64 | lab-baylibre | gcc-8    | defconfig+im=
a                | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie  | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip      | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-30-v5.14/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-30-v5.14
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d137660340411cbf97721b1578583f20a31fd6b2 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf09cd10876aa998e2c84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf09cd10876aa998e2=
c85
        failing since 48 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf1f0df9797c02e8e2c83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf1f0df9797c02e8e2=
c84
        failing since 47 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
beagle-xm                  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/612cef42a4b42696388e2c82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-x=
m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-x=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cef42a4b42696388e2=
c83
        failing since 34 days (last pass: renesas-devel-2021-07-19-v5.14-rc=
2, first fail: renesas-devel-2021-07-26-v5.14-rc3) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
beagle-xm                  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf2fdf62df07d7d8e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf2fdf62df07d7d8e2=
c78
        failing since 48 days (last pass: renesas-devel-2020-12-07-v5.10-rc=
7, first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
beagle-xm                  | arm   | lab-baylibre | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf0a5e3b659f09d8e2ca4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf0a5e3b659f09d8e2=
ca5
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
fsl-ls1043a-rdb            | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf63e45d750311e8e2c83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf63e45d750311e8e2=
c84
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx6q-sabresd              | arm   | lab-nxp      | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf16179d52455b08e2c78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf16179d52455b08e2=
c79
        failing since 301 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-g12a-sei510          | arm64 | lab-baylibre | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf1956f9edc98948e2c83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-meson-g12a-=
sei510.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-meson-g12a-=
sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf1956f9edc98948e2=
c84
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cf625c8e3fac9248e2c82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cf625c8e3fac9248e2=
c83
        failing since 6 days (last pass: renesas-devel-2021-06-28-v5.13, fi=
rst fail: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612ced382b72b1e9c58e2ca8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ced382b72b1e9c58e2=
ca9
        failing since 285 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie  | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612ceeb57356e7b0958e2c88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ceeb57356e7b0958e2=
c89
        failing since 285 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb       | arm   | lab-cip      | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612cec81d49741ffaa8e2c84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cec81d49741ffaa8e2=
c85
        failing since 285 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
