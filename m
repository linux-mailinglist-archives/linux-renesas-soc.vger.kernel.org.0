Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62AE06563B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 16:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbiLZPIJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 10:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiLZPIB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 10:08:01 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E9EE65
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:07:58 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 7so7318347pga.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vyCDfFPavCcwjnlkvSM5PGa4kncU7xiydw34PlZFGtI=;
        b=0ACxQVJfbTWviEgKmTyqeh5VsP3h2GH7GWYssVPueYUZX/A5vs8ffOPEBu2+31BykF
         fDYKqY02nLNbxPeO1qn5wub7vKGFwJhndsBScUBEfiUCGX7pbWDG1ZaEc6EyalpXsXBJ
         3HBts9crY+hCb+7zkJTQKa38lCCRwTWyFyiVJt1mbW96UapKycUHJbFtnGV+CD5scffv
         4aUiR25GOo36oU4/MgJZMQ27HgmS1TG9RH2R/8ESxiJZNy0MYwUh1qBDtmnISqvBhaj2
         GdUuiIkfXDLs/PVCAquDXCO3CbxStLvDZagqbqoHYOHiV1dIL26AVLU/GJP6HdNmxkHS
         GP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyCDfFPavCcwjnlkvSM5PGa4kncU7xiydw34PlZFGtI=;
        b=TAauoUq7qHvBirDQ3qxwfPHFV1TByDjXFFCrshTuXovlHhhmLau6JK3G36Y0fAmimt
         Vv4/tfe/h5UCDVA1O7PQprp+jXJW7cqf0J+dO9Pxgi4opHTADnywXmI9qujJsSXal/OU
         Qn4FjAB6Z6Jl287K94OuJhoOWBzYj0GXHnYxMiGy4LnFneVuxrlsJptPq6B2MM2RBksU
         KMovC4iaLirzTXcLqSfGJztA7VC536/Y+9+9ocZkb697BCYwR7xQHdKff4AMtsLjTBh9
         ntqG9Sz9K1mLoqKKtng34roVZBpwKplgowE+vcGggHj8hkc6Jw0IE7thcY0h6enC1tmY
         /U6A==
X-Gm-Message-State: AFqh2ko+i8KNnGnHMDks7M/Z/pPxrXwdp9YxsImhaMBn3SWg9piU1H4C
        OfK7ZDu6I3qUwGvVDliWVe1CI4vi2oT5qCjdwo4=
X-Google-Smtp-Source: AMrXdXs30vKSu3az0DSZtx16uJlfNOaNF0uqTUJtAnKWJWCm3XaQCqaU2LJVFmXqNq3tawAtlRfHOg==
X-Received: by 2002:a62:36c6:0:b0:576:5a71:454a with SMTP id d189-20020a6236c6000000b005765a71454amr21100229pfa.2.1672067277827;
        Mon, 26 Dec 2022 07:07:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v62-20020a626141000000b00576d4c45a22sm7201922pfb.147.2022.12.26.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 07:07:56 -0800 (PST)
Message-ID: <63a9b8cc.620a0220.7b0be.d8b4@mx.google.com>
Date:   Mon, 26 Dec 2022 07:07:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-12-26-v6.2-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 517 runs,
 16 regressions (renesas-next-2022-12-26-v6.2-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 517 runs, 16 regressions (renesas-next-2022-12-26-v6=
.2-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug | 1          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig      | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig      | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig       | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug   | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-12-26-v6.2-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-12-26-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7cf590dd42358e54ad3fa80910b9589add2b74a2 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a98a7064b424ae984eee42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a98a7064b424ae984ee=
e43
        failing since 98 days (last pass: renesas-next-2022-08-30-v6.0-rc1,=
 first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a986d8df81a00b6a4eee23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a986d8df81a00b6a4ee=
e24
        failing since 118 days (last pass: renesas-next-2022-08-29-v6.0-rc1=
, first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/63a9858356817b65d64eee1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a9858356817b65d64ee=
e20
        failing since 45 days (last pass: renesas-next-2022-09-18-v6.0-rc1,=
 first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/63a985bfa594ea48914eee41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a985bfa594ea48914ee=
e42
        failing since 133 days (last pass: renesas-next-2022-07-07-v5.19-rc=
1, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig       | 1          =


  Details:     https://kernelci.org/test/plan/id/63a97f0319a71681c54eee1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a97f0319a71681c54ee=
e1c
        failing since 69 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a988d9843536df064eee72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a988d9843536df064ee=
e73
        failing since 69 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a98ee7335389b0224eee26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a98ee7335389b0224ee=
e27
        failing since 69 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a988c6f07e8f780f4eee33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a988c6f07e8f780f4ee=
e34
        failing since 45 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a98ed238356f0e484eee22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a98ed238356f0e484ee=
e23
        failing since 45 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a986dadf81a00b6a4eee29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a986dadf81a00b6a4ee=
e2a
        failing since 45 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a988d7843536df064eee6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a988d7843536df064ee=
e70
        failing since 69 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a98ee638356f0e484eee29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a98ee638356f0e484ee=
e2a
        failing since 69 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a988c7843536df064eee21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a988c7843536df064ee=
e22
        failing since 69 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63a98efa60f41ef1b64eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a98efa60f41ef1b64ee=
e1a
        failing since 69 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/63a98264395d4025b94eee3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a98264395d4025b94ee=
e3b
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/63a9827877be6efdfc4eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a9827877be6efdfc4ee=
e1a
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1) =

 =20
