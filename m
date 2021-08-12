Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E973EABC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 22:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhHLUba (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 16:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhHLUb3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 16:31:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4F0C061756
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:31:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d1so8892043pll.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Z7vtdXHVdoGRf+1KBEllOTgSfb8xAo2gIRnwDgyI4aU=;
        b=UDNnGpm+ZEZCQ/FiWhh7M5xQeamqswXjnvHOBbt3VB1JHwzuDEesxKyZ3NxBET2Xu+
         gMz6zc3BlLR8SNqowsjlpHA4eiv/Ja8EgMX/d/fUnCE/F/S++tlmeZ4XS9W88Iu62JVN
         Wg8We6MiktZsdAEo6YZHqomauRdNUzqJSrDtxfSvRLw9PaUE71wOv0diq02vNS1c1OQ8
         1z1XGjrAbhDQ7GLwzhzvYx1btUBA2tNXMlwro8+iADyvBEuAz7Abh8c8Pn0FQxZ7KeMu
         ygkUYmQDKAW706FGb4Miz/1ikrKZ/inHJ5gen1beFq74R7Cl/cLm8ZdZdrGv6qCdWt8Y
         cxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Z7vtdXHVdoGRf+1KBEllOTgSfb8xAo2gIRnwDgyI4aU=;
        b=RO+4LhOAUYSLs0KS93l29VPDmED5CNKPdfoDmTf1WKNNFQuRMGjf7I6PPzG8YgjzAn
         8RQ3tUKKrZr9y/ZmesmFYKL3Gciukr6h7bGGR4uxmDkzbDsEJhe2bu+eZgQ4E1/xKCNp
         6NDue4JgrTFxxdK1uULhA9+nmNKthJz/KbgMtt6idl1CxxDdcb8ogQVRFWi8nib4k17g
         j8P67tGrwNQu8/h/1o0fdvJIgOEcDJz24fQzQ/iFWpjBNgE3Q2zye+vf6xIe9VioogBO
         aLn2NSKHNyTAilgm3XR6MQBeJAWWDek25z8KmlPNm5hU5ela3ecE0qeAp425BBzoKJDh
         K3Hw==
X-Gm-Message-State: AOAM533hNrBVFc9yITMxlFn7bmwu8mthc/bzIN6Qc/3lUu6jvec65kYk
        e2wHRgk/EN/jP1ljVlIns6QTY49u+u4NcOwL
X-Google-Smtp-Source: ABdhPJwuKZipY+qk44d5BWTT61gAhnDBR2S74z4ooSiJDI4kWQ3jJFqGwpfxvapi4qjPwGeD0JOa+A==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr5446825pga.230.1628800262889;
        Thu, 12 Aug 2021 13:31:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 11sm4262771pfl.41.2021.08.12.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 13:31:02 -0700 (PDT)
Message-ID: <61158506.1c69fb81.cac35.c84a@mx.google.com>
Date:   Thu, 12 Aug 2021 13:31:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-08-12-v5.14-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 67 runs,
 7 regressions (renesas-devel-2021-08-12-v5.14-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 67 runs, 7 regressions (renesas-devel-2021-08-=
12-v5.14-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
              | regressions
-----------------------------+-------+---------------+----------+----------=
--------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima          | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
              | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config        | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-12-v5.14-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-12-v5.14-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33d79a656f9e005b45af2cdaffe67f9463fc5231 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
              | regressions
-----------------------------+-------+---------------+----------+----------=
--------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61154dcd7a310859c2b13718

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61154dcd7a310859c=
2b13719
        failing since 29 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
              | regressions
-----------------------------+-------+---------------+----------+----------=
--------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima          | 1          =


  Details:     https://kernelci.org/test/plan/id/61154e63f510d8bef9b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61154e63f510d8bef=
9b13662
        new failure (last pass: renesas-devel-2021-07-27-v5.14-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
              | regressions
-----------------------------+-------+---------------+----------+----------=
--------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima | 1          =


  Details:     https://kernelci.org/test/plan/id/61155092c547537cdbb1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61155092c547537cd=
bb1366f
        new failure (last pass: renesas-devel-2021-08-10-v5.14-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
              | regressions
-----------------------------+-------+---------------+----------+----------=
--------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61154dea1ccba919e2b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61154dea1ccba919e=
2b13663
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
              | regressions
-----------------------------+-------+---------------+----------+----------=
--------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61154d7f148e59f76eb13735

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/61154d7f148e59f76eb1373f
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-12T16:33:43.965875  <8>[   41.814944] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-08-12T16:33:45.010172  /lava-4354135/1/../bin/lava-test-case
    2021-08-12T16:33:45.044788  <8>[   42.894059] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/61154d7f148e59f76eb13740
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-12T16:33:43.928930  /lava-4354135/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
              | regressions
-----------------------------+-------+---------------+----------+----------=
--------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61154adb9c6915a2e7b13690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61154adb9c6915a2e=
7b13691
        failing since 128 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
