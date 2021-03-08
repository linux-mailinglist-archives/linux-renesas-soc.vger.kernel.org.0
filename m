Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FA7331556
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 18:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCHR4U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 12:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhCHR4Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 12:56:16 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6330C06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 09:56:15 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id m6so7733773pfk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 09:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yHX7YVdvJVK1Q15Ju30Rdha1eqFaMsx0ePHV73ivKTE=;
        b=d9dx5S3tvixYtA3xaT0aELdnnx8coT1Gh7jEi2jzlDat3Bp9p2Q186rzQauAD4nTG2
         UOWYd/a1RjRAzvmo9fGu43jeX2TGFM8oP06yWDxU0dkngCtlRFdl41xMbhSUbe0JJGLF
         nmXyzsV425ExnAkHar/bvxvmCbE2vQemtjKKMXn205ZKQtJFXHkflljIyuGgSpuIybw1
         rgc2Wyc5az4G3XDYd5R2tSRKiNyQKc3xfFE1av8IAg8G2fVgqhm83zxVHMadWXdFYX9l
         i1fhx2Hm5TFAEwNR67PtUj9N9nyM4wpqOwGIJRDtzlyp5/sqIIwZRcdgUS1xaw2N4qQF
         OkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yHX7YVdvJVK1Q15Ju30Rdha1eqFaMsx0ePHV73ivKTE=;
        b=OtJSoY4nrgDoDbdLx7AQLcpPlimcy1896jAWLqTkcAIBFYWXxpzNkb7b0chWWNVYh9
         ERDLRvj4ZeYeo+6KplbX1tPnCqJzZDD3t/fEHP9j3zc2aU92HfYSjc8/nvLgfi7/2/KR
         xtMrihbkSONkljreSescfqyjGtDiC9+fbXMqMc/Q7nyGQSkKcoq6Wp454WXotc2QDMxi
         I2v9orWmOkpDlNoBMj5B0xeTta8diM83r6KNx8cf6EEroSyu5R5CIdSqVpo0lWHpnk33
         4zTJfApg80GygcM2lWA2ruJSitAF0DnJVyes+EPdRSZQnyeZhXkLjLp7apylPawCidzE
         moVA==
X-Gm-Message-State: AOAM531Mjue8KnrmhpG1f8LwRtRF0l1RIMQcyz3Rf3bvT90fMZUoxNxC
        0FIQyw8Qz6nGkQ+RvH/QAhlmy6R/Dy49eJks
X-Google-Smtp-Source: ABdhPJxt/kaSisEkDaZcJSB1k8hnl+ODFjwNXiFC70+B/ojAd1x36VNPQa9hk0tLCLGod8wjjGcR9A==
X-Received: by 2002:a05:6a00:1393:b029:1b4:7938:ff1d with SMTP id t19-20020a056a001393b02901b47938ff1dmr22592233pfg.31.1615226175210;
        Mon, 08 Mar 2021 09:56:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c24sm7696537pfi.193.2021.03.08.09.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:56:14 -0800 (PST)
Message-ID: <6046653e.1c69fb81.78617.29fb@mx.google.com>
Date:   Mon, 08 Mar 2021 09:56:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-394-g4e589d84c742
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 167 runs,
 5 regressions (v5.12-rc2-394-g4e589d84c742)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 167 runs, 5 regressions (v5.12-rc2-394-g4e589d84c7=
42)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-rc2-394-g4e589d84c742/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v5.12-rc2-394-g4e589d84c742
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4e589d84c7429ff697e741961eda21ac05f0b7b8 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6046300cf01ba3a422addcbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseli=
ne-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseli=
ne-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046300cf01ba3a422add=
cbe
        failing since 6 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: v5.12-rc1-379-gc28144dc9685d) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/604631cbdf72a046deaddcf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604631cbdf72a046deadd=
cf3
        new failure (last pass: renesas-devel-2021-02-15-v5.11) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60462cc9157305c5f4addcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60462cc9157305c5f4add=
cc8
        failing since 110 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60462e26a09d6e8b26addce7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60462e26a09d6e8b26add=
ce8
        failing since 110 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60462c0a810eb0d88baddcc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60462c0a810eb0d88badd=
cc5
        failing since 110 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
