Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2C83E5112
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 04:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbhHJCfy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 22:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhHJCfx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 22:35:53 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B421AC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 19:35:32 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id a5so3252613plh.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 19:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=h0kGDOOvmV+6oBoJZGIB9sm0CZyKtURwgQfRHTnSoHo=;
        b=gROT3TtNPAlHhQc/NEnzftjPaRbjpuYY/qjV89xCU2AYNvFW/3i5h9r8Zf9M1NcV7y
         VAXbr907XFugYKaH5wND1fVBki6ptL8YGChijvxQtLnlvfXW1x0DUMN0JxjIbVsBenB5
         XFZ+v10GmtNg+D0hQkfOEuaEU6zqUtODZc+epP1tQVv9GGZg0fMgU4nI9sfXqLACoN6x
         pSOE2wGsLDAW8Jetz1VGWamXrED/szzctztyhEsQQBjqe4lzocnUpq3y1Lyt7Q5Rcdgr
         q9BINPICWAzpCyr+TM90sF+BGYmBlXAqr9CiBYUKJaQQ3gAG8du+VD2I5lRjuic7HvuV
         FSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=h0kGDOOvmV+6oBoJZGIB9sm0CZyKtURwgQfRHTnSoHo=;
        b=FKgxbyIPcrktf7DeeTEVeLWO59CS3LeR4nC5hrIa76jOzE1OTP8f+96JDW3zR9CTPe
         ltlKk24779ytu5QjFNq6qT9Awan9ZWJmoxWFKy6Wd23YW5Abk9F5Rai2Tvt2ibMJ6DEM
         u0fdzTn2HmQWKMS0Zh0gP2B3PB7klq6vg4RofrSKOmLIMjnSJ+2r79fIYKQNvx50L1NH
         pMvm0fVX5nYYSiIF1pFsNoa61MFy8UNGP9rNymc3FtD8YD+/g/3+v9WGj/zf4TRaFmsS
         Yc+7VU3ZpGgtI6uEAQd4fpvcgCBv9tPbEpmpworvq50wgE8fuQJyXhV5hzQ0RtXpU1Eb
         YjXA==
X-Gm-Message-State: AOAM531ULIcQ+um64HViKMS930ZVYAvdpdOg5SSFf6YgmzDIoT/4GJMG
        FTxcEtqv+4xvAtJGzZsro7Ou8KSy1ZjpUNjO
X-Google-Smtp-Source: ABdhPJwAcBwTHEqG93pQv56d7MnKHvUpIokqVIH1uqBNwsUII+sizrPs7EUu9MqpNFRAb4pRWHMmdQ==
X-Received: by 2002:a17:90b:ec5:: with SMTP id gz5mr27986810pjb.77.1628562931930;
        Mon, 09 Aug 2021 19:35:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p21sm17487892pfo.8.2021.08.09.19.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 19:35:31 -0700 (PDT)
Message-ID: <6111e5f3.1c69fb81.4e87.4a84@mx.google.com>
Date:   Mon, 09 Aug 2021 19:35:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 85 runs,
 11 regressions (renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 85 runs, 11 regressions (renesas-next-2021-07-27=
-v5.14-rc1-14-g57ec7ff3f83a)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      57ec7ff3f83a19aa366c58bd0f6a47a8844ac3fe =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6111ad9231c541043db13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-pengutro=
nix/baseline-nfs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-pengutro=
nix/baseline-nfs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111ad9231c541043=
db13665
        failing since 104 days (last pass: renesas-next-2021-04-02-v5.12-rc=
2, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6111b077c255efdf72b136b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111b077c255efdf7=
2b136b2
        failing since 32 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6111b1f421b8f1703ab136b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111b1f421b8f1703=
ab136b2
        failing since 32 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6111b235fcede136c5b13677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+ima/gcc-8/lab-baylibre/ba=
seline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+ima/gcc-8/lab-baylibre/ba=
seline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111b235fcede136c=
5b13678
        new failure (last pass: renesas-next-2021-07-27-v5.14-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6111c9ca722cf72aa6b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-collabor=
a/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-collabor=
a/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111c9ca722cf72aa=
6b1367f
        failing since 13 days (last pass: renesas-next-2021-07-19-v5.14-rc1=
, first fail: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6111abf95b7d3f9a78b136c3

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6111abf95b7d3f9a78b136cd
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:27:52.486237  <8>[   43.256265] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-08-09T22:27:53.532395  /lava-4338552/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6111abf95b7d3f9a78b136ce
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:27:52.446621  /lava-4338552/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6111ae07ff895a792fb13681

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6111ae07ff895a792fb1368b
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:36:32.431786  /lava-4338588/1/../bin/lava-test-case
    2021-08-09T22:36:32.473490  <8>[   44.810189] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6111ae07ff895a792fb1368c
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:36:30.285641  <8>[   42.620695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-09T22:36:31.339364  /lava-4338588/1/../bin/lava-test-case
    2021-08-09T22:36:31.380802  <8>[   43.717946] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6111bc67b6f1ab9d37b1369b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-baylibre=
/baseline-nfs-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-baylibre=
/baseline-nfs-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111bc67b6f1ab9d3=
7b1369c
        failing since 140 days (last pass: v5.12-rc2-14-g6f56f6c26099, firs=
t fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6111ba4b178b025ae1b13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/sunxi_defconfig/gcc-8/lab-baylibre/ba=
seline-nfs-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/sunxi_defconfig/gcc-8/lab-baylibre/ba=
seline-nfs-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111ba4b178b025ae=
1b13669
        failing since 101 days (last pass: renesas-next-2021-04-02-v5.12-rc=
2, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
