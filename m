Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E095EAF0B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 20:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiIZSE7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 14:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiIZSEi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 14:04:38 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DE061D89
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 10:47:23 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id b23so7414841pfp.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=A+RC5ONZIIKqACMZDZeKWifTOWw1sjV8fP780W33fjs=;
        b=oGAPxzjzkOdDei0764CJ+uINE4PQ6VjgQXzBF81ZLL6+dLiNul0KzKVZh93QiZKYya
         LXYQu+ncmjw0e/PNRGnBK7W9HV/xABnkFpT/3tXTUzgXhWIE6gh3Z1MzkVK61soTW91b
         0H9zNl76ETioZykvlP2aZUjFDzeH1inELvhuL33oRmQv1aUPNh312efuHgDAuZf3GSzz
         4SOtpTlVNjI8eFS5CyIyuu50QhzZLmDZHwpw/adYb/Rz0cIWr3Io1vPXu9+8KWtjGQU9
         ToFxLVJcT/HuGGzE+lvDPl4aKkUkk341gOxO3K+FQyoX2z5UsPXXT6D6zR+KO+8Bbf8c
         MWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=A+RC5ONZIIKqACMZDZeKWifTOWw1sjV8fP780W33fjs=;
        b=zlnGLNJ5NK0K4W79qgCJQft9WshTs1MJ5HDMVPmzegMxl1Q9tctgRacsOdD1nwdwlu
         tNYSvt++Ak7Mn3E72A7+d8nCYCEc9Xh9QtLgrsiHg4VY+cygcLNImNuxgMT9VrDl1DTx
         +69PhhnajRntbcZwGI0JRz9xnQPEAAeaaKxaZezU3lY7L7cry4O4fL1pF/Jx6pxE5fL7
         5jMDPgJkIksCADXeSfV2y9cR0LSX4+6i8Yvny7HBeALwqLmRhlD5U3JdSTBDOM6kIaJA
         EUTkkv0SO0ZcmVzrErXOnnZGOVgXdKZXDGbtC4CbwP4GGQiNONHUSUaruMDqzNDf5wOm
         CLyg==
X-Gm-Message-State: ACrzQf09xUFylEk06pwdy4vujYR0gVAnFBU7lZ+ntya4+PxsSJS5tOqV
        /ixqZEu8zwSwahWLWtm+Di3OpJ3UpzLthbOy
X-Google-Smtp-Source: AMsMyM4VwPOvdnLM5BDQQpaB4W58Qb2e5d/rmb9RT1tnWPiXFR9pdffeEKxbvCFWlfj6NsznB4o+HA==
X-Received: by 2002:a65:6b92:0:b0:43c:f0f:457b with SMTP id d18-20020a656b92000000b0043c0f0f457bmr20465016pgw.326.1664214442197;
        Mon, 26 Sep 2022 10:47:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902a3c900b00177e590df96sm11457504plb.118.2022.09.26.10.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:47:21 -0700 (PDT)
Message-ID: <6331e5a9.170a0220.bde8f.5559@mx.google.com>
Date:   Mon, 26 Sep 2022 10:47:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-09-26-v6.0-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 172 runs,
 20 regressions (renesas-next-2022-09-26-v6.0-rc1)
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

renesas/next baseline-nfs: 172 runs, 20 regressions (renesas-next-2022-09-2=
6-v6.0-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =

sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-09-26-v6.0-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-09-26-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a7ec6f47e9d38bc0f9c1c09ef51538426f7c8a91 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8985880df22099d5358

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8985880df220=
99d5359
        failing since 42 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8a54f321ce5599d52e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8a54f321ce55=
99d52e1
        failing since 111 days (last pass: renesas-next-2022-05-05-v5.18-rc=
1, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8abec922c291c9d52b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8abec922c291=
c9d52ba
        failing since 111 days (last pass: renesas-next-2022-05-05-v5.18-rc=
1, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8b83201a36c449d52c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8b83201a36c4=
49d52ca
        failing since 111 days (last pass: renesas-next-2022-05-05-v5.18-rc=
1, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8b90bcbbb70059d5307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8b90bcbbb700=
59d5308
        failing since 111 days (last pass: renesas-next-2022-05-05-v5.18-rc=
1, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8805c4b2381c09d52fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8805c4b2381c=
09d52fd
        failing since 42 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c83ec544f0dce49d52b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c83ec544f0dce=
49d52b4
        failing since 42 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c881cf96f538629d52cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c881cf96f5386=
29d52cd
        failing since 27 days (last pass: renesas-next-2022-08-29-v6.0-rc1,=
 first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8850e1364f3cd9d52e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8850e1364f3c=
d9d52e4
        failing since 8 days (last pass: renesas-next-2022-08-30-v6.0-rc1, =
first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c88e019fd143f69d5358

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c88e019fd143f=
69d5359
        failing since 8 days (last pass: renesas-next-2022-08-30-v6.0-rc1, =
first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c84083aeeb2a6c9d52a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c84083aeeb2a6=
c9d52a1
        failing since 42 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
-14-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c86ec4297e7c459d52bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c86ec4297e7c4=
59d52bd
        failing since 42 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
-14-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c884cf96f538629d5336

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c884cf96f5386=
29d5337
        failing since 42 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
-14-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c88f323d0470c79d52c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxm-=
khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxm-=
khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c88f323d0470c=
79d52c5
        failing since 34 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
-14-g0940300f8e1d, first fail: renesas-next-2022-08-22-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8987cf5e186ab9d52a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8987cf5e186a=
b9d52a7
        failing since 42 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c89a6138aa391c9d52b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c89a6138aa391=
c9d52b9
        new failure (last pass: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c89268bc53888a9d536a

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6331c89368bc53888a9d538c
        failing since 173 days (last pass: renesas-next-2022-02-25-v5.17-rc=
1, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-09-26T14:12:44.648203  /lava-7409480/1/../bin/lava-test-case
    2022-09-26T14:12:44.677940  <8>[   38.580113] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c880cf96f538629d52ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-nfs-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-nfs-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c880cf96f5386=
29d52ae
        new failure (last pass: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8a8c9f578f3409d52e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-sun4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-sun4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8a8c9f578f34=
09d52e3
        new failure (last pass: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6331c8b37a754940799d53ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-sun=
4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-26-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-sun=
4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220920.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6331c8b37a7549407=
99d53cf
        failing since 26 days (last pass: renesas-next-2022-08-29-v6.0-rc1,=
 first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =20
