Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C76D3F5337
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 00:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbhHWWLD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 18:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbhHWWLC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 18:11:02 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC92CC061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 15:10:19 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so980299pjt.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 15:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZL/A2xKFknfLzYakUQsOHv4Gt8kF4ODTArDCrJEp+Vs=;
        b=Dt5RpVIgjXatxMb9A2weqxVRUY1KI5P6OyZO9tHI22TeM5qnnq3804vf+tYRXOT7r6
         BncGbrA+/8Yeq6vTr+ifDv4x5Lg/ucJqCFiHzSDxdwwh/74AKmjGyD/wnSE+5VtJoQ/E
         A3Fm9jfK5t4OSwLqBabj69TlzBE85tsQ/ReAYWUZDfXNKU9LFUAyU/x/u8Xf9/QPxguG
         eoVuG6uoauidDv3a+4KrWPIeV5QQOXjFAjOoJeHkGmaHCCYiLpexp+QTgH+mLTllsB++
         PCsXQMz/z1OBnfHebR7XJwtVuewU7uIOhg29HaSVj9v+FGa2IlOfoZsYCz7Beu0mJx/Y
         tK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZL/A2xKFknfLzYakUQsOHv4Gt8kF4ODTArDCrJEp+Vs=;
        b=tG+8x6fUVtbHOgdGULmSuNtZINwpXOBALXJfiWA9i5iJZ9/VCPtS0HNw3/cgTyITfC
         JREyJZdNxdK5azQT/+WZ97DUEKBjpKK5uwujfhCK6A/thc21dANgkU5bud3E0nMaxlP8
         WOVQ6gZmXZ2z0KQa0V0Y7vSkbsz6eZYTTMzo0FKvYOP7992bQ1FG5gQPDwPYaW+98rnN
         xHrNrNvO5PKSfp3tFN6y8hq0iZfqQ0/zx2ekkjJ6z4tvkGLf7yVidzZIWAU1o1kPQDT9
         U1+lHJP9y2kQP7cwQ8wl5GHbPROpt/lLxjMgLrVfjFNTVCZv9Z0fgRqLp5QLAlMiiZ1Z
         1/EQ==
X-Gm-Message-State: AOAM531TbyJCOIQwwSjiUP4t8Rfb+ePUhBxwcPgNWGX4qXhSta6onZgU
        bWMWA1VH3E+DoLtpv9cEcJcDyFBf9NFTy9G5
X-Google-Smtp-Source: ABdhPJzAzcG7ARYbWVsp/7skglrDXX2LnJdES64pqqgvXX/20R8u66t9muahz7IJFAsOTxz3KoHlmA==
X-Received: by 2002:a17:90a:9511:: with SMTP id t17mr767643pjo.194.1629756619031;
        Mon, 23 Aug 2021 15:10:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ge6sm204950pjb.52.2021.08.23.15.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 15:10:18 -0700 (PDT)
Message-ID: <61241cca.1c69fb81.84e82.123e@mx.google.com>
Date:   Mon, 23 Aug 2021 15:10:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-08-23-v5.14-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 80 runs,
 9 regressions (renesas-devel-2021-08-23-v5.14-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 80 runs, 9 regressions (renesas-devel-2021-08-=
23-v5.14-rc7)

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
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-23-v5.14-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-23-v5.14-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a8378ef28a200358f247cc997a8c3db868b1e917 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e4689e998fd80e8e2c89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6123e4689e998fd80=
e8e2c8a
        failing since 118 days (last pass: renesas-devel-2021-04-12-v5.12-r=
c7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/612412deffd511c5648e2c9c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/612412deffd511c56=
48e2c9d
        failing since 40 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612415a5954a179a078e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/612415a5954a179a0=
78e2c7a
        failing since 41 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e95d57059cbeb68e2caa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6123e95d57059cbeb=
68e2cab
        new failure (last pass: renesas-devel-2021-08-12-v5.14-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e9a7baa20236888e2cde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6123e9a7baa202368=
88e2cdf
        failing since 34 days (last pass: renesas-devel-2021-07-13-v5.14-rc=
1, first fail: renesas-devel-2021-07-19-v5.14-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6123e8b92696ea80b48e2c83

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6123e8b92696ea80b48e2c89
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-23T18:27:53.377837  [   41.312867] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-08-23T18:27:54.423496  /lava-4401290/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6123e8b92696ea80b48e2c8a
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-23T18:27:52.301761  [   40.236190] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-23T18:27:53.343099  /lava-4401290/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6123eb1d9ec76cdb358e2c87

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6123eb1d9ec76cdb358e2c8d
        failing since 41 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-08-23T18:38:16.054409  /lava-4401351/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6123eb1d9ec76cdb358e2c8e
        failing since 41 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-08-23T18:38:14.977511  /lava-4401351/1/../bin/lava-test-case
    2021-08-23T18:38:15.013709  [   41.956744] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
