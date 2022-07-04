Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29AD35659FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 17:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbiGDPgn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 11:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbiGDPgm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 11:36:42 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09265FB7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 08:36:40 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d17so9242323pfq.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2OJbV2xf+rKwJb1elxp1Tm6WIma609IOOtjrREGffhc=;
        b=X1onzh8RE1lEW2rUFdfbhaM/YEQtPBZSCA7Eej6ZMsLTqL+k/4QsBbzqXjaEiMEGlU
         j14TGWok9HbaGGCOPNtswBgceEwFEwd4e5szCoq4EUFMfy0LJkmk6BTqvBz7Dq4WXTJz
         hjUwDnfqaN2Dy265WDAuSBr7zePXBVJGJsiEuAK2FFNE3+7pLXMqN3jUDoBwWe4XQXHi
         1OHZmL5TsHAEvsRkvVSLgtPBwOQIt7SHqmJv00SRvKZmwmx71AJLwCsXC02eLOCZYwXn
         A5FeeEJMdZy1r+jWr6R6zcKUoG6iMfqWRZ0n5otBcE7R4+qP9qxoY8wcUhOs4wK0vqek
         v7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2OJbV2xf+rKwJb1elxp1Tm6WIma609IOOtjrREGffhc=;
        b=mkUgBIet/obbt06vz9GYfTzAp1YHnzbuCv8UybyZer8MbY9+vAPt2/ky8ElATvcWrS
         M2K1Hj189djVqxwX/ZGGeFKw32NOyRU3UcoH75ZYUDCe5fiLpFOvynjHz6T3VjTVhI9f
         lFmiJeFKygR4shX0K8MSQRuqldCph/Cm9ovYh2Jta5lFxZIwlZQBTJdVCi0Y/Xu0T+d2
         2jo/zuVg9pZMVIxDGWAFvbZDenKyyBRaUgtNM7fb4o8tefTDR0h9c9ssdasWA056Eqc7
         TXC93dNx5rWEsTUnPtreoCBOtqGnLWrRCKAasqMTBRcyAN/v67lP3/nNzxD78j5GE8RF
         Kzqg==
X-Gm-Message-State: AJIora9a3WwAFaeDZqAMGsh4kFeLp1+macT17szLwhlb+qFDmpOcC31Z
        0nF4UjhghB8YZDMwKpmA5ZWrNbAS6lj9l/ZC
X-Google-Smtp-Source: AGRyM1tUXSCpKI7GwopqhngUQH5Rqu0cQbKgwlqcpETKKM7ktTOZh3LvK1Xi1f7BDv6zJ42HSjr0tQ==
X-Received: by 2002:a05:6a00:2390:b0:51c:21e1:782 with SMTP id f16-20020a056a00239000b0051c21e10782mr35844557pfc.21.1656949000124;
        Mon, 04 Jul 2022 08:36:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k63-20020a632442000000b003fd3a3db089sm20168961pgk.11.2022.07.04.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:36:39 -0700 (PDT)
Message-ID: <62c30907.1c69fb81.f6832.be52@mx.google.com>
Date:   Mon, 04 Jul 2022 08:36:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-04-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 65 runs,
 9 regressions (renesas-devel-2022-07-04-v5.19-rc5)
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

renesas/master baseline-nfs: 65 runs, 9 regressions (renesas-devel-2022-07-=
04-v5.19-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | exynos_de=
fconfig             | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-04-v5.19-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-04-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53f4b75e60cf6c4bedcc6638ff37f56eab20dc19 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d66ba8578882d2a39bf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c2d66ba8578882d=
2a39bf6
        failing since 41 days (last pass: renesas-devel-2022-05-16-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d7d7551e951bc0a39bf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c2d7d7551e951bc=
0a39bf1
        failing since 41 days (last pass: renesas-devel-2022-05-09-v5.18-rc=
6, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d944ad00c30749a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c2d944ad00c3074=
9a39bd0
        new failure (last pass: renesas-devel-2022-05-17-v5.18-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | exynos_de=
fconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d755750e27486ca39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-nfs-=
odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-nfs-=
odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c2d755750e27486=
ca39be1
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2da146a2fc2d6b2a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c2da146a2fc2d6b=
2a39bd1
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/62c2dcd667815a0bfca39bd5

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62c2dcd6678=
15a0bfca39bda
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        43 lines

    2022-07-04T12:27:46.037414  kern  :emerg : Internal error: Oops: 5 [#1]=
 ARM
    2022-07-04T12:27:46.038033  kern  :emerg : Process systemd-udevd (pid: =
74, stack limit =3D 0x(ptrval))
    2022-07-04T12:27:46.038467  kern  :emerg : Stack: (0xf0cedd20 to 0xf0ce=
e000)
    2022-07-04T12:27:46.059458  kern  :emerg : dd20: 00000000 f0cedd74 0000=
0000 c35ec000 ef1e4128 c20ef000 1fb5ad00 ef1e4128
    2022-07-04T12:27:46.059956  kern  :emerg : dd40: bf132014 c20ef010 0000=
0038 c0826230 c1b8aba0 c04f4828 00000a20 00000000
    2022-07-04T12:27:46.060526  kern  :emerg : dd60: c14794b4 c0dd3c28 c147=
94b4 c20ef010 c20ef010 c1493954 c35ec000 00000038
    2022-07-04T12:27:46.081433  kern  :emerg : dd80: c35ec000 0000017b 004e=
5cb0 c0dd4460 ffffffff c04f57d0 00000000 00000000
    2022-07-04T12:27:46.082043  kern  :emerg : dda0: 00000000 00000000 0000=
0000 00000000 00000000 00000000 00000000 a0fd000a
    2022-07-04T12:27:46.082477  kern  :emerg : ddc0: c20ef010 00000000 c20e=
f010 bf132014 c20ef010 00000038 c35ec000 0000017b
    2022-07-04T12:27:46.103488  kern  :emerg : dde0: 004e5cb0 c09f51a4 0000=
0000 c20ef010 bf132014 c09f2bdc c20ef010 00000000 =

    ... (4 line(s) more)  =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62c2dcd6678=
15a0bfca39bdb
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        16 lines

    2022-07-04T12:27:45.757456  kern  :alert : 8<--- cut here ---
    2022-07-04T12:27:45.757952  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-04T12:27:45.758468  kern  :alert : [00000000] *pgd=3D00000000
    2022-07-04T12:27:45.758886  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-04T12:27:45.779525  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-04T12:27:45.780020  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-04T12:27:45.780446  kern  :alert : Register r3 information: non=
-paged memory
    2022-07-04T12:27:45.780893  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-04T12:27:45.801957  kern  :alert : Register r5 information: sla=
b kmalloc-128 start cf9bf280 pointer offset 64 size 128
    2022-07-04T12:27:45.802455  kern  :alert : Register r6 information: non=
-paged memory =

    ... (7 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62c2e0528b3c81344da39bde

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nf=
s-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nf=
s-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62c2e0528b3=
c81344da39be3
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        43 lines

    2022-07-04T12:42:47.153501  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c3049800 pointer offset 0 size 1024
    2022-07-04T12:42:47.153732  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-04T12:42:47.153923  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-04T12:42:47.169177  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-04T12:42:47.169415  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start cfb89880 pointer offset 64 size 128
    2022-07-04T12:42:47.169614  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-04T12:42:47.213504  kern  :emerg : Internal error: Oops: 5 [#1]=
 SMP ARM
    2022-07-04T12:42:47.213751  kern  :emerg : Process systemd-udevd (pid: =
131, stack limit =3D 0x(ptrval))
    2022-07-04T12:42:47.214023  kern  :emerg : Stack: (0xf0e69d20 to 0xf0e6=
a000)
    2022-07-04T12:42:47.235462  kern  :emerg : 9d20: 00000000 f0e69d74 0000=
0000 c2521a40 ef1e4128 c3049800 1fb5ad00 ef1e4128 =

    ... (5 line(s) more)  =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62c2e0528b3=
c81344da39be4
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        16 lines

    2022-07-04T12:42:47.086747  kern  :alert : 8<--- cut here ---
    2022-07-04T12:42:47.086961  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-04T12:42:47.087228  kern  :alert : [00000000] *pgd=3D00000000
    2022-07-04T12:42:47.087425  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-04T12:42:47.108436  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-04T12:42:47.108663  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-04T12:42:47.108862  kern  :alert : Register r3 information: non=
-paged memory
    2022-07-04T12:42:47.109077  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-04T12:42:47.130529  kern  :alert : Register r5 information: sla=
b kmalloc-128 start cfb89800 poin<8>[  183.007987] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-07-04T12:42:47.130844  ter offset 64 size 128 =

    ... (1 line(s) more)  =

 =20
