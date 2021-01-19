Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461142FC073
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 20:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbhAST5d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 14:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392243AbhAST5Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 14:57:24 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5908C061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 11:56:42 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m5so588280pjv.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 11:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3+k59izwVPoGNFx/9rJ1NFQcZL1qdqyWooU6YfuBddo=;
        b=ydyfochf2zBeRqFrne2pp7ReZQtnJ7+UUslBhiCrS7V7XWqcIpXMu0fIaUIKu9oUj7
         C1AGiiEUuN8BXoyZZMlcR5vVjFx9mbAKMTilmkJ6MmJtgEs2bf9kJVr/miZSY9af4TpH
         0yRSOzRrY4cvPbFQ2sis8CJba6BOON/kfnUxgtfF2rNULdh8sbqr6yTYHENj7ydV6fkU
         0VPrwryLgJ24IlYToPnkEktU5qDZN6XDLrmqGiIqj7yRpuybdzL2BTW+rqCOiZm7fMob
         VfxogJVSRuALpNYwbZH8ol1uawurq4dx9hjlsFuihJijxo8KwLLJ/eQSq0CXhdnZue7g
         qtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3+k59izwVPoGNFx/9rJ1NFQcZL1qdqyWooU6YfuBddo=;
        b=rroVgnwWBiUj6TfGY5HsEBoLTeUZFnvivILBfxdk4DPTn5qRi6bne7rHmXe+LGZtDD
         rLwHI3pBf4q+nNfyD0olfLdJo0OxVIn43SK5pmODFd7R9x6R+x6F9juWjrDu+x4oXX4o
         QG3PdnJJ9x0VIikKaFceKif/VRVBX27k/rdmQBj+7FTkkj8uc9MgA8tF0VAewJIh4M3h
         utMX/d06Ztd38+jUOR7HNET1xb7gHEQplUNlawSby6niJ8xTXN+MliTF4xH3DNR/fOas
         chfQ4tU7+7CjQVrIkhO6JPlrenLWKoFW0z7+Jfj4zZE16TSiGadvG0bGAek21Fi4fonU
         Gbig==
X-Gm-Message-State: AOAM533tF2aWK+uZdEkPK9iE65cVx6t6ZtFWAkxVJDQDzwxVRddSi/I5
        YEd0jnStlHssOLdMflzbJNVaemAccwwABA==
X-Google-Smtp-Source: ABdhPJyK0P2/47tPY3mq5WAxXb7hSUZzzfSeeyRvz6U6obozCjy8j39MANKnfoPkAkoU14RlyXR7og==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id o2-20020a1709026b02b02900dac6c0d650mr6535150plk.74.1611086201803;
        Tue, 19 Jan 2021 11:56:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b129sm20604130pgc.52.2021.01.19.11.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 11:56:41 -0800 (PST)
Message-ID: <60073979.1c69fb81.98037.1e37@mx.google.com>
Date:   Tue, 19 Jan 2021 11:56:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc4-383-g822f1d4bfbf2
Subject: renesas/master baseline: 291 runs,
 13 regressions (v5.11-rc4-383-g822f1d4bfbf2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 291 runs, 13 regressions (v5.11-rc4-383-g822f1d4bf=
bf2)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241       | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200             | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200             | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
1-rc4-383-g822f1d4bfbf2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v5.11-rc4-383-g822f1d4bfbf2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      822f1d4bfbf25ac7008eb9779c43ea99d5aa8f40 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fe87cdb6a3e654bb5d24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fe87cdb6a3e654bb5=
d25
        failing since 78 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60070386adf73bc5ddbb5dbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseli=
ne-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseli=
ne-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60070386adf73bc5ddbb5=
dbe
        new failure (last pass: renesas-devel-2021-01-14-v5.11-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60070502ff801b1806bb5d2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60070502ff801b1806bb5=
d2d
        new failure (last pass: renesas-devel-2021-01-11-v5.11-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600702a853c36257dabb5d16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600702a853c36257dabb5=
d17
        new failure (last pass: renesas-devel-2021-01-14-v5.11-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s805x-p241       | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600702c7e2d15b9203bb5d21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/b=
aseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/b=
aseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600702c7e2d15b9203bb5=
d22
        new failure (last pass: renesas-devel-2021-01-11-v5.11-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxm-q200             | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007020cfb312c3e5dbb5d2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/b=
aseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/b=
aseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007020cfb312c3e5dbb5=
d30
        new failure (last pass: renesas-devel-2021-01-14-v5.11-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxm-q200             | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/600703ab1e7fecaf6bbb5d2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600703ab1e7fecaf6bbb5=
d2d
        new failure (last pass: renesas-devel-2021-01-11-v5.11-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fe63ab8e6708bdbb5d27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fe63ab8e6708bdbb5=
d28
        failing since 62 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fe7aa69b7d6bfabb5d80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fe7aa69b7d6bfabb5=
d81
        failing since 62 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fe78cdb6a3e654bb5d1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fe78cdb6a3e654bb5=
d1d
        failing since 62 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6006fef38a0a360dc9bb5d1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6006fef38a0a360dc9bb5=
d1e
        failing since 62 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60070271d12c31c794bb5d3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/ba=
seline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/ba=
seline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60070271d12c31c794bb5=
d3c
        new failure (last pass: renesas-devel-2021-01-14-v5.11-rc3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007027da1b4422ab1bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/ba=
seline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/ba=
seline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007027da1b4422ab1bb5=
d0c
        new failure (last pass: renesas-devel-2021-01-14-v5.11-rc3) =

 =20
