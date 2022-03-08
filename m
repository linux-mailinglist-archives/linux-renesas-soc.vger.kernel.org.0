Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0905B4D1D07
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 17:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbiCHQTu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Mar 2022 11:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234718AbiCHQTt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 11:19:49 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D935007A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 08:18:53 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id z11so17505405pla.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Mar 2022 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NbqSidF1O+W0Mwm5bF0YM3AdADcsCvyZAI5wRkMGcwU=;
        b=56dtXwPiOmKE/FSuJCNG/5WdPv/KSIlj2yO+TPEA8MMsirvO0kdvdlov6FUFVMu6Q0
         O7tGu+9DECVdrZRXDdr2nLiQ15OrFWlnVqkcybfhLrKI48uUFOJOjQE57kubZDYa1q0L
         5zHpxz5gLIjuzMYAo8bZzwvfiEb6IRdj02Id+TkkPJ8TwTvGQJZkypXpk7WfGKNV5UUU
         S1wqhWLWEh1ao++RuLgYsKgwZNqEoBvTmwHVJSDbjeNoezZxzyoCaCvYVxmcmKF7E+3J
         Mt8TJLyVK9kh5VJETa2baofiSQV5XVPeOLs4j7OGAUuBvvqQyu8zTqny1rmgmSHMLNvR
         0bAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NbqSidF1O+W0Mwm5bF0YM3AdADcsCvyZAI5wRkMGcwU=;
        b=UBwdTl5FjF28hU7lS9Xj/OUWWOPvo901FY5HPUn1goNpvFIIkSybMT90Inltm8QFGm
         pGkxbQjGJjSsmKApuHZKf7KwzpLsNySrx7rfdklemRJNCW5xcUMUp52V08PfHiTo5J1h
         0BqcIaK91S6C4SisEOx07Xxc55caICQo8uLdfJJc+XdglDnzw9sYO8jIOHWtDyn7bxxi
         T+Ozn0fWsGpGqal5d8RneBEIbDVfmhzRWfdM6rCrxX3PBE9eyR/GUdAXaYbYg/cU3dh9
         Yt3QGHJ8CYkO5jBd1SaHJmOQotWgRV+aRmeGp0CKcl2cv6w1IBIMf8AmBCMRGUz4k/7k
         T/KQ==
X-Gm-Message-State: AOAM530e5vdcPTUpQNzXWFOkd9Y783eLKdcUGB4xsfiEy+yqK51NpNVE
        w5SDR3Pq5k4L5oI+IPrG93s8bsBCD90pfxlEcUY=
X-Google-Smtp-Source: ABdhPJxt1Vt3H1BT1zq4FKiM7weDhWZVgY8zI8Oxs0gMszcKvDJDmRkFJKQdQrTjnH5oTCzdR07hzQ==
X-Received: by 2002:a17:902:7285:b0:14d:7f5b:94d0 with SMTP id d5-20020a170902728500b0014d7f5b94d0mr17805694pll.25.1646756332467;
        Tue, 08 Mar 2022 08:18:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z13-20020a63e10d000000b003733d6c90e4sm15110577pgh.82.2022.03.08.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:18:52 -0800 (PST)
Message-ID: <622781ec.1c69fb81.329b8.5e8b@mx.google.com>
Date:   Tue, 08 Mar 2022 08:18:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-03-08-v5.17-rc7
Subject: renesas/master baseline: 321 runs,
 5 regressions (renesas-devel-2022-03-08-v5.17-rc7)
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

renesas/master baseline: 321 runs, 5 regressions (renesas-devel-2022-03-08-=
v5.17-rc7)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230     | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug       | 1          =

rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-08-v5.17-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-08-v5.17-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ac86fa2bcb4ab9ea979876e0abedf4a00bc6544f =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622755780218179d44c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622755780218179d44c62=
969
        failing since 112 days (last pass: renesas-devel-2021-11-02-v5.15, =
first fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62276aa5fef9255050c629b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62276aa5fef9255050c62=
9ba
        new failure (last pass: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxl-s905d-p230     | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62275d0b4dbf586fc2c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62275d0b4dbf586fc2c62=
96d
        new failure (last pass: renesas-devel-2022-03-07-v5.17-rc7) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62274ab93eef660318c6299f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/base=
line-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/base=
line-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62274ab93eef660318c62=
9a0
        new failure (last pass: renesas-devel-2022-03-07-v5.17-rc7) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62274b1db5b41e0159c629e5

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62274b1db5b41e0159c62a0a
        new failure (last pass: renesas-devel-2022-02-28-v5.17-rc6)

    2022-03-08T12:24:37.509393  /lava-5837673/1/../bin/lava-test-case   =

 =20
