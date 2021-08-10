Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7023E5195
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 05:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbhHJDnk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 23:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbhHJDnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 23:43:40 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3F5C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 20:43:17 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so3313141pjl.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 20:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HUNbU+SczXfc8p27V7ikAJh0zwR44VZN751YpBGBrog=;
        b=UUhUDTpQm1H8JZmzNl5CBDlKs9YYB6TGzbzRJhL57Ldj6GHK/zqVzlhiA05Ru6ze0O
         MrfSI2Un2ZGFtpqxZTI3ehiCprGuFXo1yWlw+zq+5bw/v2ysCm3/tMziziW3MKToHipJ
         KVaiY7ep1d9v2fyRBhUl8uuzxxVcupN+JOaJcvJXWfbZmfDBHIocCvZBFNlNNbcsJwO8
         qSvLlKuYOl/aIB7crri4EF7xGlCB8h6K+S4jBSGb5pbermPCCI3GSR3QUASa8MTIoGLW
         J6nGka2yP+mFr1Uw2ZTj7nNe7rb+R1w1I0TU2stscwBwZsLnoyjG7AfBR8T4BSWAX/p8
         URAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HUNbU+SczXfc8p27V7ikAJh0zwR44VZN751YpBGBrog=;
        b=SWAR/47P3swVAhNwVIC2Z+OQtY5K5IyZMD7UryJV3znQHhkCG7ZdohO/kyHScWT6Q6
         xqmg18Nt6PkQrF0GBnewJPsLznF8PyWWG0TdqUHdMxbDVu5Rrr549wEqtZEla5i04Uto
         e9L1zGRVblFdFSGdNTQNEwUukhqLQPkQQ48NXStfeY/+Xjl9D/pg0lCQY1MDR2JhZzZ3
         xf3ZQpnUCOwgAVOu3Gu5ocgIJhqIYEbI02R4V+HPu+kXtvjk2EQINAxIfUQwobtet1Eg
         5FPjzVXI/tuoV86FckHYM9qtwMNnlmDYRrb5d47nqEFXS8K7PZbkKPjaXkcIDTHboFc/
         QdUw==
X-Gm-Message-State: AOAM532mbDGV/KwK75Rb/JzAlmxbq8yS9o2hsu2oBVa8Tve9brVUipuw
        yGtamiTbVaUuVeG1LVZteNR6P1HhjKEg5mon
X-Google-Smtp-Source: ABdhPJwKFhb2Uoz2tqqBnH2SGbhD2S+pnHsU3/toidJGAbmMrJKBxLMeBlSUHh9RGvP6CQ3VGaTEeg==
X-Received: by 2002:a17:902:e843:b029:12c:d520:453e with SMTP id t3-20020a170902e843b029012cd520453emr23574482plg.50.1628566996217;
        Mon, 09 Aug 2021 20:43:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f197sm22253835pfa.92.2021.08.09.20.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 20:43:15 -0700 (PDT)
Message-ID: <6111f5d3.1c69fb81.e8c32.22ad@mx.google.com>
Date:   Mon, 09 Aug 2021 20:43:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: v5.14-rc5-549-g3b20129c119f
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 76 runs,
 12 regressions (v5.14-rc5-549-g3b20129c119f)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 76 runs, 12 regressions (v5.14-rc5-549-g3b2012=
9c119f)

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
ig+crypto             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
4-rc5-549-g3b20129c119f/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: v5.14-rc5-549-g3b20129c119f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b20129c119f50f3534a0e1a5c353bb502ffe2c6 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6111bf6657226fa5ffb13709

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove=
-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove=
-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111bf6657226fa5f=
fb1370a
        failing since 104 days (last pass: renesas-devel-2021-04-12-v5.12-r=
c7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6111c7f61d10839a1bb13696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111c7f61d10839a1=
bb13697
        failing since 27 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6111cdbd47827c0976b13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111cdbd47827c097=
6b1367a
        failing since 27 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6111c5d5b67d295febb136be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111c5d5b67d295fe=
bb136bf
        new failure (last pass: renesas-devel-2021-07-27-v5.14-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6111c40b8902fe7787b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-salva=
tor-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-salva=
tor-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111c40b8902fe778=
7b13665
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6111cf77e2cf94fb45b13697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111cf77e2cf94fb4=
5b13698
        failing since 21 days (last pass: renesas-devel-2021-07-13-v5.14-rc=
1, first fail: renesas-devel-2021-07-19-v5.14-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6111c0d2bb93cbee6cb136a4

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6111c0d2bb93cbee6cb136ae
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-09T23:56:45.688689  /lava-4339312/1/../bin/lava-test-case
    2021-08-09T23:56:45.726006  <8>[   43.908026] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6111c0d2bb93cbee6cb136af
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-09T23:56:43.541172  <8>[   41.721268] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-09T23:56:44.597141  /lava-4339312/1/../bin/lava-test-case
    2021-08-09T23:56:44.639975  <8>[   42.821851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6111c48959f5ef2af7b13667

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/=
baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6111c48959f5ef2af7b13671
        failing since 28 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-08-10T00:12:50.561650  /lava-4339368/1/../bin/lava-test-case
    2021-08-10T00:12:50.597834  <8>[   42.672339] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6111c48959f5ef2af7b13672
        failing since 28 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-08-10T00:12:48.412984  <8>[   40.486970] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-10T00:12:49.481030  /lava-4339368/1/../bin/lava-test-case
    2021-08-10T00:12:49.516747  <8>[   41.591956] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6111d8f23da3129b84b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-a=
20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-a=
20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111d8f23da3129b8=
4b13675
        failing since 101 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6111d29df886d6e448b13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-a20-=
olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-a20-=
olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6111d29df886d6e44=
8b13679
        failing since 125 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
