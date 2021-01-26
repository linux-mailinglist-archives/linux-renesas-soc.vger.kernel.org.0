Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E20E304D29
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 00:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731649AbhAZXDv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 18:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392617AbhAZSIV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 13:08:21 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3822FC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 10:07:39 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id m6so10912671pfk.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jXJGaCdqjsXUX/vckMEORYJWDoh/HJxdq5RoXrb8Xyw=;
        b=QYW5Giw6FLi1FFZsn/vN0KggFybD8AKF35s/2dkwva4iBufex0y91LgAutQuUY9mtB
         vIOKrmcDSv3p6qM6okt8q6PcbC3qY9RMXA9kvhFZ/gl4sgLewsls2e8alePBuW/T6Lkn
         nRpAFrqi35YsLKT3xj00lhHaLh+bSJClOn3Pbm2Rohn9P0nWx3QMPav6lDr9PJlix0fp
         LnEzY6gc57UfGdV4Yo0HOsW0en/CL3IN7jbzo5nnxcvhL+U3PMUaYmbmL8SxpuWMXmFS
         aZYHDeTxEEpIqomoRCHr6uZSHN9XyisPJiqmMfOgGf5VrUCPHT1/gvCPvnNX1vZDDDrS
         zl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jXJGaCdqjsXUX/vckMEORYJWDoh/HJxdq5RoXrb8Xyw=;
        b=IaIkEvvHhBIHAt+vGfVvuiL4xGnVXUXW8BC4xq/a4jtKUKSdi2KIdrjjjjhls0c7JD
         0joh9mIIicKJi6m7inRi3iP2b7OpLSwi5QrGAnV4xNxXkFNiegvmJ+0kNt0LsPUGl3JF
         MjWgiBgHT2IT6c4JY2xxnpRp+y7T30Fw5fdS8dg/KXErNeJuxVYfZiG1ySsr9/lCTD8V
         JQpmJBeUKE7Q2lTmPPpkkbjw6MYOFirJ60qzrKYdW6tVRPSY8gkbOiZaJYlrMRF7vVVP
         b0AhVYt8l1XJ8i5GSeAEwgvQGvc2TahjPs3/CAhvHDiZeAT9ltup7Et7n78eZz22Etnq
         3V2g==
X-Gm-Message-State: AOAM531ZVLvcPzkctu2sbmX/fchI7s91IxBJo3XE4xr9xh/XZwT8WoB/
        KbxEHJIuhiA61TLwFusogWP/y/L7kxWBDNND
X-Google-Smtp-Source: ABdhPJx3an6PiDdWy/Ya+mivpvKHuMqF3ZQVMEgFjo+83Qi9SUyKiJjkVh/b9DU7r0ku7UmMFiaYUw==
X-Received: by 2002:a05:6a00:8d4:b029:1b7:7ad9:4864 with SMTP id s20-20020a056a0008d4b02901b77ad94864mr6155426pfu.34.1611684458382;
        Tue, 26 Jan 2021 10:07:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 17sm19746607pgy.53.2021.01.26.10.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 10:07:37 -0800 (PST)
Message-ID: <60105a69.1c69fb81.3efcc.fa0e@mx.google.com>
Date:   Tue, 26 Jan 2021 10:07:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-01-26-v5.11-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 318 runs,
 7 regressions (renesas-devel-2021-01-26-v5.11-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 318 runs, 7 regressions (renesas-devel-2021-01-26-=
v5.11-rc5)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-26-v5.11-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-26-v5.11-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      27061b9ede03072796190d99f00a7fad4f57f184 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60102b401cc58f04efd3dff8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60102b401cc58f04efd3d=
ff9
        failing since 0 day (last pass: v5.11-rc4-383-g822f1d4bfbf2, first =
fail: renesas-devel-2021-01-25-v5.11-rc5) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/601023b3c8f71c4e10d3e014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601023b3c8f71c4e10d3e=
015
        failing since 6 days (last pass: renesas-devel-2021-01-11-v5.11-rc3=
, first fail: v5.11-rc4-383-g822f1d4bfbf2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/601028001ed988a8aed3dfde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601028001ed988a8aed3d=
fdf
        failing since 6 days (last pass: renesas-devel-2021-01-14-v5.11-rc3=
, first fail: v5.11-rc4-383-g822f1d4bfbf2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6010206598bfc43fb2d3dfd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010206598bfc43fb2d3d=
fd8
        failing since 69 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6010318f918052976cd3dfe7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010318f918052976cd3d=
fe8
        failing since 69 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6010206644e61c8b43d3dfde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010206644e61c8b43d3d=
fdf
        failing since 69 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/601020156f22e1dfabd3dfd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601020156f22e1dfabd3d=
fd1
        failing since 69 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
