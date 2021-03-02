Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F303632A63A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Mar 2021 17:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351392AbhCBOQy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Mar 2021 09:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575011AbhCBDwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 22:52:31 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F7BC061756
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 19:51:50 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id p21so12972529pgl.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Mar 2021 19:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iDrO61SWMkp+LYDXsNb8CrJhW/FljP3um0b4FM4oQ3E=;
        b=1zCNvYUSk+OZbAxaq7+b1GMy/KFeesxZBcBKaY+iPIflWpAGDJxSxJU8IiAzoNxdgT
         4qd65PBMvXwZsmuyDMdo3oL97DPq3DyZx76s6XjLc1eVVSKCEo2ybXCR38a3bpZ4IZnA
         00Jtv0Pm5pEoNu4C7wgGkLjzpyzzZbjTMfJhOeg24xQ8Md9eCGpSWf1P4SC7oxrB6/Tx
         9/lHkXNV3RdXYXd3/3kkwEpoiNGskE2KO7eDq3y/2CdM3lS/VGZc/fHo7tjeDwhoZm9p
         CDiwobk7MviL22H7aRLsc38bOZW12Q429rrvJm7t9DwK36laAIuilBbIK46V256zSQt3
         i4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iDrO61SWMkp+LYDXsNb8CrJhW/FljP3um0b4FM4oQ3E=;
        b=IzA/wQPUYo+2UumkwYT/c0MTNfR0nHuz/+fMAsp9kubu4Sb/SiSYDIIgslezIUsdOa
         X5nmSFonRKVVw5Kc/CUhCdXwEU923NGMkUZQElPYknNNgHjZ5QZRjsH2N7fB5Mo4osOD
         NChsz/rjAhEuRa+2duP8UXT5C4TVd+kAk6biW3AQlzZfI+p6diIKJwXntUYo/W7wQowp
         IMLiRtGVfjLAH+x2OBzNM3qhoJiVQWmWP8MnAj4pF3dRZ4LEn2dxVLVatLBzDfJVGINl
         vCfq9WVnSCQ4QB7k9Zqnke7I20sXT3gCkKkmtWK/cJUDdZmo416KXazSI8JT1UZwx4lw
         P66A==
X-Gm-Message-State: AOAM530JI1tuua5AwxNeSkxd1iV42P7RnF62vfuSe9CGMtRv7BM3Pnb3
        F2HIcg11UedaRLVfLrif4pp7yWuUe+1zdw==
X-Google-Smtp-Source: ABdhPJwYTo+ITdFmZdEDda7i6QjX/bpIGu0hmRDLVwgxnPjgwdRWSK5EQAf1bt0SqlIaCcVGPOsGlA==
X-Received: by 2002:a63:5a02:: with SMTP id o2mr16222924pgb.202.1614657109587;
        Mon, 01 Mar 2021 19:51:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w1sm933488pjq.38.2021.03.01.19.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 19:51:49 -0800 (PST)
Message-ID: <603db655.1c69fb81.af5a2.3267@mx.google.com>
Date:   Mon, 01 Mar 2021 19:51:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc1-379-gc28144dc9685d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 260 runs,
 8 regressions (v5.12-rc1-379-gc28144dc9685d)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 260 runs, 8 regressions (v5.12-rc1-379-gc28144dc96=
85d)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200        | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-rc1-379-gc28144dc9685d/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v5.12-rc1-379-gc28144dc9685d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c28144dc9685de3293c3672e85b2f8f89b7615f4 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603d84eed9b7430c5baddcb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d84eed9b7430c5badd=
cb8
        new failure (last pass: renesas-devel-2021-02-15-v5.11) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7fdfb8ed261db7addcea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7fdfb8ed261db7add=
ceb
        new failure (last pass: renesas-devel-2021-02-15-v5.11) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
meson-gxm-q200        | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/603d83e343c63dba1caddcf7

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/603d83e343c63db=
a1caddcfb
        new failure (last pass: renesas-devel-2021-02-15-v5.11)
        8 lines

    2021-03-02 00:16:02.265000+00:00  kern  :alert : Mem abort info:
    2021-03-02 00:16:02.265000+00:00  kern  <8>[   16.674490] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D8>
    2021-03-02 00:16:02.265000+00:00  :alert :   ESR =3D 0x86000006
    2021-03-02 00:16:02.265000+00:00  kern  :alert :   EC =3D 0x21: IABT (c=
urrent EL), IL =3D 32 bits
    2021-03-02 00:16:02.266000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-03-02 00:16:02.266000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-03-02 00:16:02.266000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000008452000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/603d83e343c63db=
a1caddcfc
        new failure (last pass: renesas-devel-2021-02-15-v5.11)
        2 lines

    2021-03-02 00:16:02.312000+00:00  c] pgd=3D0000000008453003<8>[   16.71=
4714] <LAVA_SIGNAL_ENDRUN 0_dmesg 774632_1.5.2.4.1>
    2021-03-02 00:16:02.312000+00:00  , p4d=3D0000000008453003, pud=3D00000=
00008454003, pmd=3D0000000000000000
    2021-03-02 00:16:02.312000+00:00  kern  :emerg : Internal error: Oops: =
86000006 [#1] PREEMPT SMP
    2021-03-02 00:16:02.312000+00:00  kern  :emerg : Code: bad PC value
    2021-03-02 00:16:02.313000+00:00  + set +x
    2021-03-02 00:16:02.417000+00:00  / # #   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7e2aeec139d9a6addd0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7e2aeec139d9a6add=
d0b
        failing since 103 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7f317d4d1e9f37addcd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7f317d4d1e9f37add=
cd5
        failing since 103 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7e8522a5293515addcc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7e8522a5293515add=
cc9
        failing since 103 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d7d37b605a9438faddcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d7d37b605a9438fadd=
cbc
        failing since 103 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
