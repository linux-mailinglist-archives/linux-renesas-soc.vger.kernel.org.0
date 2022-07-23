Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088F557EBA5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Jul 2022 05:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbiGWDLx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 23:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGWDLw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 23:11:52 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1394781B3A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 20:11:50 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id r186so5850276pgr.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 20:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mBHd41Fg+SnKk5nCAa6I57wHOJaPRfgS5Sq8Jv0Yj8A=;
        b=LGL/yRG+AdfgsD3XFTG3bXhCaNIAPm9Opi6UQ+KtZCWkd5Sgpgc0XhS2Haf4DpKGW7
         oKH1lfNdUw9VUWPvksUvxkafvwxBaOEO5fCDUUkZHUYl1h1K3NoPsLlgceIvuZLtdQBW
         O866Z+mXdWPddc70n2jZiD4t4PZNgSlyNXI52YI241hMwDwZx3wHS3QRGUypH7QVdlYy
         R87tuVPQNiHm8P+N2+Roj9WefGExPprGK5r8tSWORTKJCzCPDOYQMUYbD5jIPiyV9jz+
         wDB2EuaDw4rD7SkAoyZHjYNF37iquasxVS1LicxR7LWH7jGvAdBNqVxg4+GLsJTgp/ka
         glnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mBHd41Fg+SnKk5nCAa6I57wHOJaPRfgS5Sq8Jv0Yj8A=;
        b=XA5zaYkGnusE0bgUFnoKbiK+KdyybLFRD7qSsu8CUeW/UYGAMqAsyDt+u9TCQ2jDO0
         ZjXzRgpIMcKVzN7YWiPWF3pEWngt4S0oNG9OlxubZXvD9AMODAEmw3SzYns4Gr+IBNLq
         J6/bAeu47XUAXM4lOzZwQndY7O/pLKoOIcCokKfJJQftCSXlKmi5d3mD3bKtEt+Xp5dE
         EzXgqFLhHljtobluJFhVGg9t5ZWyz64wacQ41YRD/pKH5AfDgZf7f+9/+s260mSeia+U
         XH+eHTqTikl/ELVh+7UcJt2HquDC17y/ot1+DGVbP7J6NCh4JixeijEca/M5l9L69O78
         SOSw==
X-Gm-Message-State: AJIora9MjxpmcJYISm/z7bKvfieEHC0fKue+qKpORljH9K5MfbjoZ3MD
        LnpTDoyKN9JR1rec3pxt+y/5tjOUVzwkyE+g
X-Google-Smtp-Source: AGRyM1udSVRS7CgCoe581x+E2tL2hP9SYkEjf0ozVXbImONYFhHwJi+O5fJK+lL3I313IClImw781g==
X-Received: by 2002:a05:6a00:298d:b0:52b:cf1f:5738 with SMTP id cj13-20020a056a00298d00b0052bcf1f5738mr2856012pfb.0.1658545908865;
        Fri, 22 Jul 2022 20:11:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709026b0900b00161ccdc172dsm4406497plk.300.2022.07.22.20.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 20:11:48 -0700 (PDT)
Message-ID: <62db66f4.1c69fb81.92d73.7897@mx.google.com>
Date:   Fri, 22 Jul 2022 20:11:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-22-v5.19-rc7
Subject: renesas/master baseline-nfs: 160 runs,
 29 regressions (renesas-devel-2022-07-22-v5.19-rc7)
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

renesas/master baseline-nfs: 160 runs, 29 regressions (renesas-devel-2022-0=
7-22-v5.19-rc7)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 2          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 2          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 2          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+ima                | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-22-v5.19-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-22-v5.19-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3ddd67eca4592c2e96f8aa938195d645d1f8324b =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3b1d64065d6bc5daf064

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-nfs-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-nfs-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db3b1d64065d6bc=
5daf065
        new failure (last pass: renesas-devel-2022-07-19-v5.19-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3dee443e68f181daf099

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-cip/baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-cip/baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db3dee443e68f18=
1daf09a
        new failure (last pass: renesas-devel-2022-07-19-v5.19-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62db42397bb841a86cdaf059

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db42397bb841a86=
cdaf05a
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62db4636aaa9b4f48fdaf05d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db4636aaa9b4f48=
fdaf05e
        new failure (last pass: renesas-devel-2022-07-19-v5.19-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3cfd91530d115ddaf065

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db3cfd91530d115=
ddaf066
        new failure (last pass: renesas-devel-2022-07-19-v5.19-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62db33dfa606ca2f90daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db33dfa606ca2f9=
0daf058
        failing since 35 days (last pass: renesas-devel-2022-06-07-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3492aceaa33affdaf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-me=
son-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-me=
son-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db3492aceaa33af=
fdaf064
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3a4868a02e43a2daf07d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db3a4868a02e43a=
2daf07e
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3c512314d8e691daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db3c512314d8e69=
1daf057
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3cc82cabf5aa19daf0bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db3cc82cabf5aa1=
9daf0bc
        failing since 18 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62db34b2b34abe002adaf070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db34b2b34abe002=
adaf071
        new failure (last pass: renesas-devel-2022-07-19-v5.19-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2ccf1367560529daf06f

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db2ccf136=
7560529daf074
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        2 lines

    2022-07-22T23:03:18.304754  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T23:03:18.308332  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:03:18.375090  [  176.136799] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:03:18.375431  + set +x   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db2ccf136=
7560529daf075
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        12 lines

    2022-07-22T23:03:18.147205  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:03:18.147835  kern  :alert : Mem abort info:
    2022-07-22T23:03:18.148129  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T23:03:18.148431  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:03:18.148730  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:03:18.148943  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:03:18.149358  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T23:03:18.149847  kern  :alert : Data abort info:
    2022-07-22T23:03:18.150072  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T23:03:18.150306  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2ed6776863c69adaf082

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-rk=
3328-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-rk=
3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db2ed6776=
863c69adaf087
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        2 lines

    2022-07-22T23:12:06.908316  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T23:12:06.911850  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:12:06.965943  [  176.439060] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:12:06.966301  + set +x   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db2ed6776=
863c69adaf088
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        12 lines

    2022-07-22T23:12:06.771486  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:12:06.772094  kern  :alert : Mem abort info:
    2022-07-22T23:12:06.772384  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T23:12:06.772695  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:12:06.773004  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:12:06.773191  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:12:06.773395  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T23:12:06.773810  kern  :alert : Data abort info:
    2022-07-22T23:12:06.773986  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T23:12:06.774378  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62db31ce3c60c914cbdaf056

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db31ce3c6=
0c914cbdaf05b
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        2 lines

    2022-07-22T23:24:48.917097  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T23:24:48.920683  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:24:48.995573  [  176.117601] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:24:48.995911  + set +x   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db31ce3c6=
0c914cbdaf05c
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        12 lines

    2022-07-22T23:24:48.802158  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:24:48.802748  kern  :alert : Mem abort info:
    2022-07-22T23:24:48.803050  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T23:24:48.803378  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:24:48.803817  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:24:48.804073  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:24:48.804337  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T23:24:48.804781  kern  :alert : Data abort info:
    2022-07-22T23:24:48.805063  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T23:24:48.805336  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62db33c215835fb5fadaf067

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db33c2158=
35fb5fadaf06c
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        2 lines

    2022-07-22T23:33:04.484342  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T23:33:04.488035  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:33:04.548934  [  176.387415] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:33:04.549286  + set +x   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db33c2158=
35fb5fadaf06d
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        12 lines

    2022-07-22T23:33:04.327738  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:33:04.328378  kern  :alert : Mem abort info:
    2022-07-22T23:33:04.328674  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T23:33:04.328947  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:33:04.329230  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:33:04.329474  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:33:04.329706  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T23:33:04.330090  kern  :alert : Data abort info:
    2022-07-22T23:33:04.330237  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T23:33:04.330593  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db35f47527815169daf0d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db35f5752781516=
9daf0d6
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2b8b074bdc98eddaf0a7

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-co=
llabora/baseline-nfs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-co=
llabora/baseline-nfs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db2b8b074=
bdc98eddaf0ac
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        2 lines

    2022-07-22T22:58:01.720674  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T22:58:01.721168  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T22:58:01.771688  [  171.080862] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T22:58:01.772203  + set +x
    2022-07-22T22:58:01.772535  [  171.083513] <LAVA_SIGNAL_ENDRUN 0_dmesg =
6872889_1.6.2.4.1>   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db2b8b074=
bdc98eddaf0ad
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3)
        12 lines

    2022-07-22T22:58:01.589295  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T22:58:01.589793  kern  :alert : Mem abort info:
    2022-07-22T22:58:01.590101  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T22:58:01.590418  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T22:58:01.590709  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T22:58:01.591021  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T22:58:01.591309  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T22:58:01.591584  kern  :alert : Data abort info:
    2022-07-22T22:58:01.591853  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T22:58:01.592117  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62db2efbb895dfa3aedaf0b5

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-nfs-r=
k3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-nfs-r=
k3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db2efbb89=
5dfa3aedaf0ba
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        2 lines

    2022-07-22T23:12:37.013120  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T23:12:37.013653  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:12:37.063381  <8>[  170.854663] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:12:37.063921  + set +x
    2022-07-22T23:12:37.064271  <8>[  170.857719] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6873000_1.6.2.4.1>   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db2efbb89=
5dfa3aedaf0bb
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        12 lines

    2022-07-22T23:12:36.901480  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:12:36.902010  kern  :alert : Mem abort info:
    2022-07-22T23:12:36.902359  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T23:12:36.902684  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:12:36.903018  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:12:36.903334  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:12:36.903639  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T23:12:36.903939  kern  :alert : Data abort info:
    2022-07-22T23:12:36.904231  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T23:12:36.904520  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62db31e00825525fdedaf0da

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db31e0082=
5525fdedaf0df
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        2 lines

    2022-07-22T23:25:12.508942  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T23:25:12.509417  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:25:12.560176  [  171.208888] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:25:12.560678  + set +x
    2022-07-22T23:25:12.561005  [  171.212014] <LAVA_SIGNAL_ENDRUN 0_dmesg =
6873149_1.6.2.4.1>   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db31e0082=
5525fdedaf0e0
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5)
        12 lines

    2022-07-22T23:25:12.376477  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:25:12.376672  kern  :alert : Mem abort info:
    2022-07-22T23:25:12.376771  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T23:25:12.376858  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:25:12.376942  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:25:12.377030  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:25:12.377114  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T23:25:12.377193  kern  :alert : Data abort info:
    2022-07-22T23:25:12.377268  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T23:25:12.377342  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62db32a8caa9135fecdaf05b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-nf=
s-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-nf=
s-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/62db32a8caa=
9135fecdaf060
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        2 lines

    2022-07-22T23:28:27.964598  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-07-22T23:28:27.965077  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-22T23:28:28.017747  [  171.281750] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-22T23:28:28.018222  + set +x
    2022-07-22T23:28:28.018533  [  171.284975] <LAVA_SIGNAL_ENDRUN 0_dmesg =
6873165_1.6.2.4.1>   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/62db32a8caa=
9135fecdaf061
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5)
        12 lines

    2022-07-22T23:28:27.843366  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-22T23:28:27.843912  kern  :alert : Mem abort info:
    2022-07-22T23:28:27.844245  kern  :alert :   ESR =3D 0x0000000096000004
    2022-07-22T23:28:27.844591  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-22T23:28:27.844898  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-22T23:28:27.845186  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-22T23:28:27.845467  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-07-22T23:28:27.845744  kern  :alert : Data abort info:
    2022-07-22T23:28:27.846014  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-07-22T23:28:27.846284  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62db36e1c0024baf05daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-s=
un50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-s=
un50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62db36e1c0024baf0=
5daf057
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =20
