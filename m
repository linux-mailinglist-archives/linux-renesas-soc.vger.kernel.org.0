Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C24AB567078
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 16:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbiGEOLH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 10:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiGEOKs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 10:10:48 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8BA33B
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 07:02:43 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso2382375pjj.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VDb5n4TDH6ry9zfb+TZuru9gPLfrJnnA8Dm7lJNAI8w=;
        b=5pjkPcJftXCdGMHW8TmsVjXhCQZQIavFqUtW2+VvyAY/y6fd7Wci9eLJgp/Za3gqwF
         E5WHZ8qdvjypq9Wre1xFcCABsnMGTykHJdCtSrQpE4O4HxbJuyqO1BEULvpnLeudVJSI
         V5Pi1xzPMnau6Mig1BWF7wilzNzAf0Ml1VsM6Hlo66nQfRFRU6mYxSXGqw6gTe3f1DfP
         M0wHcdQPHyX42OSP51l0FhHjhHOdIwXIc975zZibxr1keGX5RC0R/N3YIBA43Rc+b7Gk
         FsneHm7kqiWPkN2Bnr10+/C8xIzFd1h39Pu3xRMDtwqjiUIBKxdaFqno/MFucNhzTZ/m
         bGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VDb5n4TDH6ry9zfb+TZuru9gPLfrJnnA8Dm7lJNAI8w=;
        b=2l6ca2vuXG8GWk3XZG5wOfuoFlqp0z75e7w6GpKjC7hZ8ArgWrIMO+zturPAQz06l7
         4FSLnaDKXx5E2XxnTcmkbHQf3Q5A2tzjjFtk4dGLAXSojdCqWAinEMtv+sA/nAjmCdIh
         ZUZh64QCbKhaYkjvJnCIkpqcsRNJCrjKdlE2tB/qq6wINFFe64YXgn/9tUOwqCQcE2sX
         GkM59mOYKJQX2jEHyJbBnbgqVFElenCfwkp/wQbv1lmz5L3eR4g6dVeZiYGu8QP8+dlR
         YR8GS8s+6Sji2OHublUWHrC4UzGkA1bso5MhDkqxdMVqrVEJqse1O9blbu9wR1Sx5K9P
         oLZg==
X-Gm-Message-State: AJIora/sDmnNX2hCNTe8YNwl2xFIc847eBmEQ8NSuyXSNRYsSrjnZQdW
        lqM6RC6MV9aPkyBwYuHIxB9AKVoIORjbsIFT
X-Google-Smtp-Source: AGRyM1uoiKwYBTDBGMkQA6sLoHG6LdTZ7JHuS41ohb56YUdEL2LUYtOp034a+QuQWTCXEGaaV9qJBw==
X-Received: by 2002:a17:90a:f692:b0:1ef:9ad9:7e94 with SMTP id cl18-20020a17090af69200b001ef9ad97e94mr4064388pjb.148.1657029762822;
        Tue, 05 Jul 2022 07:02:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b0015e8d4eb1b6sm23629125plp.0.2022.07.05.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 07:02:42 -0700 (PDT)
Message-ID: <62c44482.1c69fb81.7fe37.1e78@mx.google.com>
Date:   Tue, 05 Jul 2022 07:02:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-05-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 129 runs,
 18 regressions (renesas-devel-2022-07-05-v5.19-rc5)
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

renesas/master baseline-nfs: 129 runs, 18 regressions (renesas-devel-2022-0=
7-05-v5.19-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | exynos_de=
fconfig             | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig           | 2          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+ima       | 2          =

sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-05-v5.19-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-05-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b83d3c70c208b5154097ddfcf4be9a802b12966e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40e2a908b7f5606a39bf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c40e2a908b7f560=
6a39bf1
        failing since 42 days (last pass: renesas-devel-2022-05-09-v5.18-rc=
6, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40f67e2adf11c37a39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c40f67e2adf11c3=
7a39bf0
        failing since 42 days (last pass: renesas-devel-2022-05-16-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4156908846f0c2ea39beb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c4156908846f0c2=
ea39bec
        failing since 42 days (last pass: renesas-devel-2022-05-16-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c41631b78ccc67dfa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c41631b78ccc67d=
fa39bce
        failing since 28 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40b1632ba98ce59a39c09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c40b1632ba98ce5=
9a39c0a
        failing since 15 days (last pass: renesas-devel-2022-06-17-v5.19-rc=
2, first fail: renesas-devel-2022-06-20-v5.19-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c410be610f65416ea39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c410be610f65416=
ea39bd0
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | exynos_de=
fconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40ac6bf3dd4cf0ca39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-nfs-=
odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-nfs-=
odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c40ac6bf3dd4cf0=
ca39be2
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/62c40e555a839ae822a39c09

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62c40e555a8=
39ae822a39c0e
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        43 lines

    2022-07-05T10:11:07.081834  kern  :emerg : Internal error: Oops: 5 [#1]=
 ARM
    2022-07-05T10:11:07.082143  kern  :emerg : Process systemd-udevd (pid: =
78, stack limit =3D 0x(ptrval))
    2022-07-05T10:11:07.082310  kern  :emerg : Stack: (0xf0cfdd20 to 0xf0cf=
e000)
    2022-07-05T10:11:07.102620  kern  :emerg : dd20: 00000000 f0cfdd74 0000=
0000 c309de00 ef1e4128 c20ef000 1fb5ad00 ef1e4128
    2022-07-05T10:11:07.102894  kern  :emerg : dd40: bf148014 c20ef010 0000=
003a c0826230 c1b8aba0 c04f4828 00000a20 00000000
    2022-07-05T10:11:07.103066  kern  :emerg : dd60: c14794b4 c0dd3c28 c147=
94b4 c20ef010 c20ef010 c1493954 c309de00 0000003a
    2022-07-05T10:11:07.124641  kern  :emerg : dd80: c309de00 0000017b 004e=
7360 c0dd4460 ffffffff c04f57d0 00000000 00000000
    2022-07-05T10:11:07.124845  kern  :emerg : dda0: 00000000 00000000 0000=
0000 00000000 00000000 00000000 00000000 1c3d6dc4
    2022-07-05T10:11:07.125023  kern  :emerg : ddc0: c20ef010 00000000 c20e=
f010 bf148014 c20ef010 0000003a c309de00 0000017b
    2022-07-05T10:11:07.147542  kern  :emerg : dde0: 004e7360 c09f51a4 0000=
0000 c20ef010 bf148014 c09f2bdc c20ef010 00000000 =

    ... (4 line(s) more)  =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62c40e555a8=
39ae822a39c0f
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        16 lines

    2022-07-05T10:11:06.822887  kern  :alert : 8<--- cut here ---
    2022-07-05T10:11:06.823226  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T10:11:06.823430  kern  :alert : [00000000] *pgd=3D00000000
    2022-07-05T10:11:06.823596  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-05T10:11:06.844322  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-05T10:11:06.844536  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T10:11:06.844709  kern  :alert : Register r3 information: non=
-paged memory
    2022-07-05T10:11:06.844888  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T10:11:06.865792  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c4048700 pointer offset 64 size 128
    2022-07-05T10:11:06.866006  kern  :alert : Register r6 information: non=
-paged memory =

    ... (7 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62c40fb11a27e121b0a39c15

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nf=
s-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nf=
s-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62c40fb11a2=
7e121b0a39c1a
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        43 lines

    2022-07-05T10:17:03.798487  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c27ef800 pointer offset 0 size 1024
    2022-07-05T10:17:03.798722  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c27ef800 pointer offset 16 size 1024
    2022-07-05T10:17:03.798940  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-05T10:17:03.813474  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c27ef800 pointer offset 16 size 1024
    2022-07-05T10:17:03.813698  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c45d1c80 pointer offset 64 size 128
    2022-07-05T10:17:03.813917  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-05T10:17:03.878941  kern  :emerg : Internal error: Oops: 5 [#1]=
 SMP ARM
    2022-07-05T10:17:03.879197  kern  :emerg : Process systemd-udevd (pid: =
136, stack limit =3D 0x(ptrval))
    2022-07-05T10:17:03.879433  kern  :emerg : Stack: (0xf0e89d20 to 0xf0e8=
a000)
    2022-07-05T10:17:03.901213  kern  :emerg : 9d20: 00000000 f0e89d74 0000=
0000 c3645780 ef1e4128 c27ef800 1fb5ad00 ef1e4128 =

    ... (5 line(s) more)  =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62c40fb11a2=
7e121b0a39c1b
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5)
        16 lines

    2022-07-05T10:17:03.731074  kern  :alert : 8<--- cut here ---
    2022-07-05T10:17:03.731320  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T10:17:03.731551  kern  :alert : [00000000] *pgd=3D00000000
    2022-07-05T10:17:03.731776  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-05T10:17:03.753538  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-05T10:17:03.753764  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T10:17:03.753983  kern  :alert : Register r3 information: non=
-paged memory
    2022-07-05T10:17:03.754214  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T10:17:03.774880  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c45d1c00 pointer offset 64 size 128
    2022-07-05T10:17:03.775123  kern  :alert : Register r6[  180.214040] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16> =

    ... (1 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4150a2812f1fd8ca39c64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c4150a2812f1fd8=
ca39c65
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62c419260ecf46fd21a39bfc

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62c419260ec=
f46fd21a39c01
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        43 lines

    2022-07-05T10:57:17.761919  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c27ef800 pointer offset 0 size 1024
    2022-07-05T10:57:17.762131  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c27ef800 pointer offset 16 size 1024
    2022-07-05T10:57:17.762315  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-05T10:57:17.778742  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c27ef800 pointer offset 16 size 1024
    2022-07-05T10:57:17.779006  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start cfe0af80 pointer offset 64 size 128
    2022-07-05T10:57:17.779190  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-05T10:57:17.828746  kern  :emerg : Internal error: Oops: 5 [#1]=
 SMP THUMB2
    2022-07-05T10:57:17.828958  kern  :emerg : Process systemd-udevd (pid: =
129, stack limit =3D 0x(ptrval))
    2022-07-05T10:57:17.829159  kern  :emerg : Stack: (0xf0e65d20 to 0xf0e6=
6000)
    2022-07-05T10:57:17.850887  kern  :emerg : 5d20: 00000000 f0e65d74 0000=
0000 c3361a40 ef1e4128 c27ef800 1fb5ad00 c27ef810 =

    ... (5 line(s) more)  =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62c419260ec=
f46fd21a39c02
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        16 lines

    2022-07-05T10:57:17.695918  kern  :alert : 8<--- cut here ---
    2022-07-05T10:57:17.696129  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T10:57:17.696348  kern  :alert : [00000000] *pgd=3D00000000
    2022-07-05T10:57:17.696539  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-05T10:57:17.718025  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-05T10:57:17.718236  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T10:57:17.718418  kern  :alert : Register r3 information: non=
-paged memory
    2022-07-05T10:57:17.718616  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T10:57:17.739824  kern  :alert : Register r5 information: sla=
b kmalloc-128 start cfe0af00 pointer offset 64 size 128
    2022-07-05T10:57:17.740036  kern  :alert[  182.626394] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16> =

    ... (1 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+ima       | 2          =


  Details:     https://kernelci.org/test/plan/id/62c41a6de40935e0fea39c5a

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baselin=
e-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baselin=
e-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62c41a6de40=
935e0fea39c5f
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        43 lines

    2022-07-05T11:02:50.491135  start c27ef800 pointer offset 0 size 1024
    2022-07-05T11:02:50.491365  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c27ef800 pointer offset 16 size 1024
    2022-07-05T11:02:50.491556  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-05T11:02:50.506111  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c27ef800 pointer offset 16 size 1024
    2022-07-05T11:02:50.506339  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c2218480 pointer offset 64 size 128
    2022-07-05T11:02:50.506530  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-05T11:02:50.565431  kern  :emerg : Internal error: Oops: 5 [#1]=
 SMP ARM
    2022-07-05T11:02:50.565664  kern  :emerg : Process systemd-udevd (pid: =
130, stack limit =3D 0x(ptrval))
    2022-07-05T11:02:50.565853  kern  :emerg : Stack: (0xf0e35d20 to 0xf0e3=
6000)
    2022-07-05T11:02:50.587216  kern  :emerg : 5d20: 00000000 f0e35d74 0000=
0000 c43108c0 ef1e4128 c27ef800 1fb5ad00 ef1e4128 =

    ... (5 line(s) more)  =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62c41a6de40=
935e0fea39c60
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        16 lines

    2022-07-05T11:02:50.423375  kern  :alert : 8<--- cut here ---
    2022-07-05T11:02:50.423603  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-05T11:02:50.423793  kern  :alert : [00000000] *pgd=3D00000000
    2022-07-05T11:02:50.423974  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-05T11:02:50.445483  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-05T11:02:50.445711  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-05T11:02:50.445901  kern  :alert : Register r3 information: non=
-paged memory
    2022-07-05T11:02:50.446083  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-05T11:02:50.467353  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c2218400 pointer offset 64 size 128
    2022-07-05T11:02:50.467581  kern  :alert : Register r6 information: non=
-paged memory =

    ... (1 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62c40daf16c599fa6ca39c56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylib=
re/baseline-nfs-sun4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylib=
re/baseline-nfs-sun4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c40daf16c599fa6=
ca39c57
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun4i-a10-olinuxino-lime     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c41184ae28646ee6a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-sun4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-sun4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c41184ae28646ee=
6a39be2
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =20
