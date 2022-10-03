Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECBE5F33E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 18:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiJCQsH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 12:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiJCQsC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 12:48:02 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F9E2FFC2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 09:48:00 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 3so10150595pga.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=5T+pVK0svf7GFCusvsreezkMY/+tfPDe2jenYYwwnfI=;
        b=wPyiG3c6kM0UIabofY4PExnlOHfeqmiGHjkVXXtyPz+zS+OR7j2xO+m67749opNGxO
         Fud1MdnSISUGrbJvpe3e7kXs5lPzLXrkuFpV1IBSXBkAqSwSwrPnnlX73h1+05NPyj7G
         JbbfuMWYrxLzJzHtRyK5wpYdZ7cSfmCjZPRvYibJSztG9JvFKiQ/4iInoFeUEm4VoO5X
         WkETZOjE4Kvv3m+eHb1Cpb3KUuwikIOzvLyK/VLUCSWoOBol57xVaTMBr++I5re4q1qJ
         /AoYjPTHCEpkGVSNvdpa0PdWcgCbBImRzTXoTB0XUFNgxNgdk4IyjmZbHZ41GhVPjCdh
         a7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=5T+pVK0svf7GFCusvsreezkMY/+tfPDe2jenYYwwnfI=;
        b=gFxNzHEAzujhDVkyGDyWqnTKWG3+jGS1IOdJFnRT51XlfPRM0yp1iMWfGK1Isirc9Q
         9N4/9HCtaq/DsQ/epun+I+VAduTuLZSqq7U/0fEj3hbL68AHrYWpX9+KrFqRIMSDbwkl
         utA8ZclbYIS/eLUtzckLBR9JwsnP0R7qM4lfrVosS0xILYgi3nbhojWMQw0ZtA8CS6LW
         4CmEyQgHkxhs9mG37wXnx/RrsnX4/o+HaQUkc9RtAQq2f2ubFjNIENxsMdGZStzMlvsS
         /v4uAhnS6qxfy7FiQdsLJ0MaHxYYxJ5u++S/U5uej+ezGSFvAfMxPVaBU/HPHUAsGoEN
         fkIw==
X-Gm-Message-State: ACrzQf1sOp95xuTHQr0YCWVvINDu+l8x+cgcTnQsw27+OmUC8PgaP4Hj
        2hzZWVgWCmhzEc4MFbE+l4DX/SGEjXYJzkIe0Bg=
X-Google-Smtp-Source: AMsMyM4uOxl1j1Fbu9aXbL89KCBAWgE+le3jJbbnO0hVPIU1uuEL6Ryd+9WNvSi9SXSAR5CXX9flTA==
X-Received: by 2002:a05:6a00:2a4:b0:561:b88f:e723 with SMTP id q4-20020a056a0002a400b00561b88fe723mr675377pfs.48.1664815680007;
        Mon, 03 Oct 2022 09:48:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ce8400b00178b77b7e71sm7504944plg.188.2022.10.03.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:47:59 -0700 (PDT)
Message-ID: <633b123f.170a0220.3288b.c5ee@mx.google.com>
Date:   Mon, 03 Oct 2022 09:47:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-03-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 227 runs,
 17 regressions (renesas-devel-2022-10-03-v6.0)
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

renesas/master baseline: 227 runs, 17 regressions (renesas-devel-2022-10-03=
-v6.0)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig        | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig        | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto  | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec         | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+crypto  | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug            | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug            | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-03-v6.0/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-03-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f0dbcd134f5abcdd4e2ad16bc81a158b2a23e2d9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/633ade5e569f832b9fec4ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashe=
d-a00.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashe=
d-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ade5e569f832b9fec4=
ed0
        new failure (last pass: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae0efc868172c2bec4ee4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-u=
doo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ae0efc868172c2bec4=
ee5
        failing since 21 days (last pass: renesas-devel-2022-07-05-v5.19-rc=
5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae1cae490795294cab5ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ae1cae490795294cab=
5f0
        failing since 21 days (last pass: renesas-devel-2022-09-02-v6.0-rc3=
, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/633adfa7c9dbb3f93fec4eab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633adfa7c9dbb3f93fec4=
eac
        failing since 21 days (last pass: renesas-devel-2022-09-02-v6.0-rc3=
, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae10d542e9e66b6ec4eb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ae10d542e9e66b6ec4=
eb7
        failing since 34 days (last pass: renesas-devel-2022-07-22-v5.19-rc=
7, first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto  | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae2b667d1023bcfcab621

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ul=
p-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ul=
p-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ae2b667d1023bcfcab=
622
        failing since 6 days (last pass: renesas-devel-2022-09-19-v6.0-rc6,=
 first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec         | 1          =


  Details:     https://kernelci.org/test/plan/id/633adffb288e8029e1ec4ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633adffb288e8029e1ec4=
ed3
        new failure (last pass: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae101542e9e66b6ec4ea6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ae101542e9e66b6ec4=
ea7
        failing since 48 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+crypto  | 1          =


  Details:     https://kernelci.org/test/plan/id/633aeb5458a13ab4b0cab5f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-=
odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-=
odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633aeb5458a13ab4b0cab=
5f7
        new failure (last pass: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/633af7e45a37ab77accab606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633af7e45a37ab77accab=
607
        failing since 91 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae18c60b347478cec4ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ae18c60b347478cec4=
ec9
        failing since 91 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/633af7bcf35ea3d929cab5ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633af7bcf35ea3d929cab=
5ee
        failing since 53 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae191899419b5d8ec4ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ae191899419b5d8ec4=
ed1
        failing since 53 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/633ae52652af9b8dadcab600

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/633ae52652af9b8dadcab622
        failing since 209 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-10-03T13:35:14.336505  /lava-7484114/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/633ae52652af9b8dadcab645
        failing since 118 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-10-03T13:35:12.167395  /lava-7484114/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/633ae52652af9b8dadcab646
        failing since 118 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-10-03T13:35:11.124608  /lava-7484114/1/../bin/lava-test-case
    2022-10-03T13:35:11.136528  <8>[   33.589198] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/633ae52652af9b8dadcab647
        failing since 118 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-10-03T13:35:10.080146  /lava-7484114/1/../bin/lava-test-case
    2022-10-03T13:35:10.091686  <8>[   32.544281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
