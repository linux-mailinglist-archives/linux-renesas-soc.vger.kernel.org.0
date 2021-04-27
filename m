Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619D136BE46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 06:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhD0EXM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 00:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhD0EXM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 00:23:12 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E790DC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 21:22:28 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id b17so4461593pgh.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 21:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QdVWvVj1eJ8b4qw3GszqwupHdRMDX8jJU4PzR7SbV7I=;
        b=qpaLCjl99gdY7Ai8+Y2aapjTem6SIwXDhGvhmccUpP8cohAliu0Pw7ye07KGhdnuD2
         Opxl/68IzmrQqWfZdZ7gwHC3E0GHAu9504KBh4+iwGhXrPMgK+2LuVQswgJ6p2ZLJtQV
         HfZcs1OnV81nzjBr/0ZKQ7ZHEosmu9P/rsNghbzjOKuFCCX0mk2wfzYOCoaonTBbQzUX
         fJ+eKOUqNyYMSeSWfSaLHztnvl0pZcFt0PkK7naoAaPGY6ameNDJ06637f/KQ4Vlza7+
         gZn0bCh45H+19YYIinkzVWvk3QsnqVlo5jNf//8JeeY5JwLU/dwVaL62Lm7XiyVprwel
         U5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QdVWvVj1eJ8b4qw3GszqwupHdRMDX8jJU4PzR7SbV7I=;
        b=PMsFLQcRVswOkdQGte1tAqaVX7LC0M98xwf3CDRxQ/3LDx3I3kkY+3q7JQoCsFss0i
         4kdHChFYBT+PlV8eAEQ+eIsjAmSxY1dL01EyMglPz4kklu8kXUvnRdzS5YYoEcYkr/U1
         zVSXxYGVdnyvWm6BrLBc7NENo+bVYr6g/tfmqnX7uqQtQsXgkPD9+zkU6ghZVQGL5jC4
         MgQHWVUTUxwALsNfAn33/LyE5+DyPn7+hex6Kteex+ggVh4Tt+ZUod7dGJIsbLQVGvJA
         QleLDfthPZnud7pgcl478N8PFYr0viadnkHSD19logaSs+Vf58VEJA5Qfu5ebe16fv0Q
         kqtg==
X-Gm-Message-State: AOAM532aBBHhkCEDqJ8erXHI7Aq22w3jowrYwfTyzJspvQ/xYj1Uk3eY
        Xz2pSh8eqTR2INFzva7lOFLOI2is4NOAvaLF
X-Google-Smtp-Source: ABdhPJzWKavKqJCuc2RNet71ZonBGW+1NdibOOoLbQ3OCp2VqBjz9DvOSrAb0V7ZuIgQ0JKaufCHbA==
X-Received: by 2002:a65:584e:: with SMTP id s14mr19656742pgr.229.1619497348163;
        Mon, 26 Apr 2021 21:22:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v24sm1073089pfn.92.2021.04.26.21.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 21:22:27 -0700 (PDT)
Message-ID: <60879183.1c69fb81.51a68.4ab5@mx.google.com>
Date:   Mon, 26 Apr 2021 21:22:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 289 runs,
 13 regressions (renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 289 runs, 13 regressions (renesas-next-2021-04-02-v5=
.12-rc2-3-g0bacf4d3d276)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

tegra124-nyan-big        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0bacf4d3d27649e90a1223b1bc0a128316138030 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60876793a8d11189a59b7799

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60876793a8d11189a59b7=
79a
        failing since 55 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60875f34d80b09cc709b77a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-nxp/baseline-imx=
8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-nxp/baseline-imx=
8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875f34d80b09cc709b7=
7a2
        failing since 28 days (last pass: renesas-next-2021-03-24-v5.12-rc2=
, first fail: renesas-next-2021-03-29-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/608758eac7ca559c049b77b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-baylibre=
/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-baylibre=
/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608758eac7ca559c049b7=
7b6
        failing since 154 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/608758b8233e2a68539b77d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-broonie/=
baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-broonie/=
baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608758b8233e2a68539b7=
7d1
        failing since 154 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/608758e4900fe69a2e9b77b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-cip/base=
line-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-cip/base=
line-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608758e4900fe69a2e9b7=
7b9
        failing since 154 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60875920489993cd789b77a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-collabor=
a/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/versatile_defconfig/gcc-8/lab-collabor=
a/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875920489993cd789b7=
7a1
        failing since 154 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60875e4a16f5ab7f5d9b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-cip/baseline-r8a=
774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-cip/baseline-r8a=
774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875e4b16f5ab7f5d9b7=
796
        failing since 35 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60875f5a5ef652b1919b77bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875f5a5ef652b1919b7=
7be
        failing since 35 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60875e4add277d1ec99b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-cip/baseline-r8a=
774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-cip/baseline-r8a=
774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875e4bdd277d1ec99b7=
796
        failing since 35 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60875f6e5ef652b1919b77c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875f6e5ef652b1919b7=
7c2
        failing since 35 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60875e577ac436843f9b779d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-cip/baseline-r8a=
774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig/gcc-8/lab-cip/baseline-r8a=
774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875e577ac436843f9b7=
79e
        failing since 35 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60875f97d5f9bf28019b7796

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/=
gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60875f97d5f9bf28019b7=
797
        failing since 35 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
tegra124-nyan-big        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6087617fa786982e839b77af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-=
8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087617fa786982e839b7=
7b0
        new failure (last pass: renesas-next-2021-04-02-v5.12-rc2) =

 =20
