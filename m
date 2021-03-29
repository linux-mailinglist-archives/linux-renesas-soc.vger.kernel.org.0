Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA57934D985
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 23:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhC2VVA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 17:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbhC2VUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 17:20:39 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2968C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 14:20:39 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id l76so10237162pga.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=V7qF90pF75KA5ieCeF08WzZXjE6LPsHM/qkhiDMBhgA=;
        b=BNTaQc9a+ZMAtk4jA6EUK8NFW00AMRhMeHR0lZESr+MjtIbv8nXWf/q+0sBnbD/K3H
         xdqioWiSXeckLC60KMpxtYN/BZ6wZfN4ubzANR8FG+lETQzf34hFZeOj9+bAzsVSBkFU
         h2STtgXjMI2YCbl5cMZVZHUXYqRhIzrMIOd7hosIbzjMjdF/4XzQ6DMLOl4f90yPC1Iw
         xNFjZheHKRy+RnkqG8WjX1xZ8HFk22ZxuPX1ynJsklEHJyidd/CcF/f+EQ5JYhr5sX4Q
         a9nkyvd6KKYW5H67qJ/t8RK9apf20fFYxzZmQdl1BoH6/Y73KoF1JK5nRpMQ5YkACHIK
         a3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=V7qF90pF75KA5ieCeF08WzZXjE6LPsHM/qkhiDMBhgA=;
        b=DfGBEmZnlY9rP1fDnfKmmSGezoSiVokZCehMFO8VD4q2sZZPeH8NpnFFykOYby5hqe
         PQPmjj3FXG1EEF6TRIJgJTAXTexMQvstnMqUB63i9BTLYNfRNFRN5TTNYlZQkVsT040X
         v8700GMPRsCs3XFRcILmoZZyKCH/odjJ5gay0M5nn5sMr28A9NdOllx1iA1nkEF7h214
         +JoJdcD3qzxXMRlwEbtvQT0e6Qu8lzU5A07uZCQmK3Pget+civ3PnQlbjE/Ic1fH1sAO
         IpjtQCUC4ASERHsn3qyv8h5k3pKpnFrH3txlzZAGH3ASQE8dRYHORTQfO3oPEIyQKkLR
         AP5Q==
X-Gm-Message-State: AOAM5328fryy9a+BDE+ZxhLnQ0EJoLJpUTMzyEwZG+PxHdyQzyBINE0o
        ZULwqmrnqmGxTGU5GCoY/Vk9iLsFRjeksA==
X-Google-Smtp-Source: ABdhPJzKlg8GgMcUoIfZYXgJDxV8KhlN1xZmwD3+e2785OBauRL48EUXWiyV/HgyTnFYD9PsMKsBfg==
X-Received: by 2002:a05:6a00:8d2:b029:224:f17:afc2 with SMTP id s18-20020a056a0008d2b02902240f17afc2mr16773809pfu.50.1617052838961;
        Mon, 29 Mar 2021 14:20:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n24sm17054767pgl.27.2021.03.29.14.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 14:20:38 -0700 (PDT)
Message-ID: <606244a6.1c69fb81.802fc.a53b@mx.google.com>
Date:   Mon, 29 Mar 2021 14:20:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-03-29-v5.12-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 242 runs,
 12 regressions (renesas-next-2021-03-29-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 242 runs, 12 regressions (renesas-next-2021-03-29-v5=
.12-rc2)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =

r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-29-v5.12-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-29-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d084e52e5b7b16d25a5e32c4625fb205a2b272d8 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/606209dea4a4f1ffe2af02be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606209dea4a4f1ffe2af0=
2bf
        new failure (last pass: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60620e8a606d6a455aaf02d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60620e8a606d6a455aaf0=
2d4
        new failure (last pass: renesas-next-2021-03-24-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6062104881dec8d2e4af02d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062104881dec8d2e4af0=
2d4
        new failure (last pass: renesas-next-2021-03-24-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606208cb815d5bb83faf02b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606208cb815d5bb83faf0=
2b3
        failing since 126 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606208c440b122bb0caf02d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606208c540b122bb0caf0=
2d1
        failing since 126 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606209d02329a89be6af02bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606209d02329a89be6af0=
2be
        failing since 126 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60620d91679a70b399af02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60620d91679a70b399af0=
2af
        failing since 7 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60620e6c4d6ab015b8af02b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60620e6c4d6ab015b8af0=
2b5
        failing since 7 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60620d9273ad4cec2baf02c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60620d9273ad4cec2baf0=
2c6
        failing since 7 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60620ea88d391753a9af02af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60620ea88d391753a9af0=
2b0
        failing since 7 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60620da473ad4cec2baf02ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60620da473ad4cec2baf0=
2eb
        failing since 7 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60620ebc138b6aef03af02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60620ebc138b6aef03af0=
2af
        failing since 7 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: renesas-next-2021-03-22-v5.12-rc2) =

 =20
