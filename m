Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AFC396753
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 19:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbhEaRqh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 13:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233184AbhEaRqX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 13:46:23 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DC6C003675
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 10:11:02 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id i5so8804146pgm.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=04h9mrbl88NWVYpKymI1at0eze4CjHt7odv9jpvyNwE=;
        b=van9sv7ytE8TfVA3mvS7ZVStXe+Uboydoa08zdwwRrSeQBlWjW9AYyeUIb8MCcCpb+
         Khr2vHjIhCTsROGh3PbX2jt6SIdNikiDHEehR8cD79xhUa1NQbvaiGJ7m788T9rgoYvv
         85Cdh1MksGzTJ5YdWGBwkYdKa1x8cS3y5V17SgwrBMRE5zz+qCGz7xK5If2X6q+emVWn
         5cv9dJlnpnZL3oTESGySiFXEpa8LW6BDut6hwzbDB4hrI1RkxA7s9mXd85kB2tdTIHto
         dh0x0xdM1vF7ZzsdDgL6wsfkv6N2eXy6lMXS4ZRZYm44MPeboUj+A4AaP5J071gAODxm
         WyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=04h9mrbl88NWVYpKymI1at0eze4CjHt7odv9jpvyNwE=;
        b=O7uaDPLwi5Nsz3ebI2J1LPFI8U05J1AyJDi5dBk6I9PPkCcwXOCOdBfeOaDu/zRZyP
         GRnhsZzaYZ3TBwhoc92I7LSpVAvMp42nVrYc4A3hDA4mxBJz1RPae6zCvrq6G/LA0cDO
         vMcu3tC71paojpCQmL8n3buIxDEWQHbf5hmRGo4y2ZgXjSTQqXVxAgStINbTFmPVzqlB
         bOGXFCOzGHc6mkwqFyjUIiO64/SNV3g17x+0DWyU3N9Rmrm/e4le+hlcYuuYtWFn92OP
         K0n6346PK/1jlWziMr04iOXgoOsKNuzVJrx4HBtU4sm7SGgdgMAkw8Q69fl/WWyiMG9l
         mwgg==
X-Gm-Message-State: AOAM5322TlgBXKCl5OKVTQZB6ojujjzcvpn4APuI6Bg1GOyx6ViYU4xt
        z6cSJhgjyiVIFD9jafMDvbKIUFDQwrulR/mj
X-Google-Smtp-Source: ABdhPJwLwtPlu5gCKO3AkUZW5cEZJxOhx87Gi8/ObD/jnDMNUFtiEJndoo0rw0CQ48I6vsUonG1xnQ==
X-Received: by 2002:a05:6a00:b46:b029:2d3:3504:88d9 with SMTP id p6-20020a056a000b46b02902d3350488d9mr17719509pfo.39.1622481062102;
        Mon, 31 May 2021 10:11:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e9sm10653297pfv.87.2021.05.31.10.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:11:01 -0700 (PDT)
Message-ID: <60b518a5.1c69fb81.f4e87.14b4@mx.google.com>
Date:   Mon, 31 May 2021 10:11:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-31-v5.13-rc4
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 238 runs,
 7 regressions (renesas-devel-2021-05-31-v5.13-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 238 runs, 7 regressions (renesas-devel-2021-05-31-=
v5.13-rc4)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b-32  | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig =
           | 1          =

imx6q-sabresd       | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =

imx8mp-evk          | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

mt8173-elm-hana     | arm64 | lab-collabora | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-31-v5.13-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-31-v5.13-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a17b18482334959148cabda392caea262c68ba77 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e7e9a38dbe2e18b3afdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4e7e9a38dbe2e18b3a=
fde
        failing since 110 days (last pass: renesas-devel-2021-02-01-v5.11-r=
c6, first fail: renesas-devel-2021-02-08-v5.11-rc7) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2837-rpi-3-b-32  | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e0133b57711e88b3afac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4e0133b57711e88b3a=
fad
        new failure (last pass: renesas-devel-2021-05-27-v5.13-rc3) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx6q-sabresd       | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e1ae6275022c62b3afb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4e1ae6275022c62b3a=
fb9
        failing since 210 days (last pass: renesas-devel-2020-10-30-v5.10-r=
c1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx8mp-evk          | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e585778f4c0b6ab3afc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4e585778f4c0b6ab3a=
fc4
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
mt8173-elm-hana     | arm64 | lab-collabora | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60b4e39db6b4c879f7b3afad

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60b4e39db6b4c879f7b3afc1
        failing since 20 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60b=
4e39db6b4c879f7b3afc7
        failing since 20 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-31 13:24:43.007000+00:00  <8>[   56.913187] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e472e4aa18a407b3afa2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60b4e472e4aa18a407b3a=
fa3
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3) =

 =20
