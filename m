Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B180441B997
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 23:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241531AbhI1VsH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 17:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241482AbhI1VsH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 17:48:07 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C06AC06161C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 14:46:27 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id oa12-20020a17090b1bcc00b0019f2d30c08fso237974pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 14:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8xGYBEsesHN6MPXkFcwqCN5QpSdKRxOm1I3ab3DqonI=;
        b=ZArDk5yUld3rpL1BlK0YxIDtSn3u+/fmql9eQfWV3r+qvwpiH6AYffMGe3+KLV4vZj
         iAEmRFYMFxsVycapDEAZQqm7Rez+zZoo1M99jYBT8acTYElWBob4qKnmHgu2wt3Dbi8f
         xpggMo9C4sqocUSy8i5lN09jLA5a1K4BTlrebpzMZajRryPaTtEQnagP9+hesfFLig5F
         x6+EgIofBXvBgSN2ylY9lTEXWJaZ9vwJxIC9aGfD3ZuwUVaI54U9mczML9avakpjYzO2
         wqpKLCS9tY+UaZF2C9D1kxTUrjdD/i6E2JlsGBPIXmUOVRdSkyr/u7wtSxvs58VtHb4O
         hZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8xGYBEsesHN6MPXkFcwqCN5QpSdKRxOm1I3ab3DqonI=;
        b=zG3hxelBIl3G0P0v2dzJxJrAFzCljKjmhbOiHNqtTxwjhr6DyjGIZJmefYDLfU+uN3
         xDn1prWfH4aw6bHYysiKxneeKDrSkiLF1uiMXt6B+unC5Nvxc7lQYxv8V3DeesFe6zUQ
         hf+yVphWQWd0quzX07vZJOKRSXO7ouolUNXU5xXqNYZXNnL05g9Z+QXvALT0GT1R53+a
         M5+bW5AhLWoISI+l1Fu1giBRdOPVGFooAB+3m5WPWq54pTNDLZyZI68hP/+yZGrusXmU
         wKzGh1dR9TWyaDQa8SKEWGn6OLmN08y4VWKI3CyMIZAmi6qevwyIBIKRQi5em02hFRpK
         dw/Q==
X-Gm-Message-State: AOAM532kz92/wiHh1IaqaV+Wlj75E0F8N9INjjTXYuilFVWRBHQgWuGN
        7944nDNiYPvZz9ztyJO9WcVzGuOENd7qqkiD
X-Google-Smtp-Source: ABdhPJxhOQeHmep39O9aMvgc7X2lC50B/sbniEt9ORxDrBSftTdBo09Hk4v6vZhy0ad6MKO8sdPMiw==
X-Received: by 2002:a17:902:b20e:b029:12b:fd6f:44c3 with SMTP id t14-20020a170902b20eb029012bfd6f44c3mr7224891plr.36.1632865586681;
        Tue, 28 Sep 2021 14:46:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x9sm3437782pjp.50.2021.09.28.14.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 14:46:26 -0700 (PDT)
Message-ID: <61538d32.1c69fb81.7493b.c1a7@mx.google.com>
Date:   Tue, 28 Sep 2021 14:46:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-28-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 281 runs,
 16 regressions (renesas-next-2021-09-28-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 281 runs, 16 regressions (renesas-next-2021-09-28-v5=
.15-rc1)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-28-v5.15-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-28-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a462ac13da67252c742a2c044b302f37eae9d089 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61535d65245dbcaeea99a2fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61535d65245dbcaeea99a=
2fd
        failing since 210 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/615356805859a2ef2e99a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615356805859a2ef2e99a=
2f8
        failing since 62 days (last pass: renesas-next-2021-07-26-v5.14-rc1=
, first fail: renesas-next-2021-07-27-v5.14-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61535af1fd7258872b99a2ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61535af1fd7258872b99a=
2ef
        failing since 81 days (last pass: renesas-next-2021-05-31-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/61535dcd4279fed55399a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61535dcd4279fed55399a=
2e8
        failing since 81 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6153575dea9ca6f10099a2ff

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/615=
3575dea9ca6f10099a302
        failing since 126 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-28T17:56:18.339770  /lava-4596838/1/../bin/lava-test-case   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6153575dea9ca6f10099a308
        failing since 126 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-28T17:56:17.228689  /lava-4596838/1/../bin/lava-test-case
    2021-09-28T17:56:17.236796  <8>[   26.363939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/615357b226f08fab0099a2db

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/615=
357b226f08fab0099a2de
        failing since 126 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-28T17:57:50.063169  /lava-4596902/1/../bin/lava-test-case
    2021-09-28T17:57:50.071161  <8>[   27.553380] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/615357b226f08fab0099a2e4
        failing since 126 days (last pass: renesas-next-2021-05-11-v5.13-rc=
1, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-09-28T17:57:47.940642  <8>[   25.421128] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-driver-present RESULT=3Dpass>
    2021-09-28T17:57:48.951938  /lava-4596902/1/../bin/lava-test-case   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61535f442ce68323fc99a365

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61535f442ce68323fc99a=
366
        failing since 309 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61538c83a2dc2f93c099a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61538c83a2dc2f93c099a=
2e3
        failing since 309 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615353ebf7d61db22f99a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615353ebf7d61db22f99a=
2e1
        failing since 309 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615353cafae885a24899a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615353cafae885a24899a=
2e3
        failing since 309 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61535883649ad3a17e99a2f5

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61535883649ad3a17e99a2fb
        failing since 77 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-28T18:01:23.861846  /lava-4596845/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61535883649ad3a17e99a2fc
        failing since 77 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-28T18:01:21.805033  <8>[   23.240837] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-09-28T18:01:22.826645  /lava-4596845/1/../bin/lava-test-case
    2021-09-28T18:01:22.838450  <8>[   24.275458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61535bb31bcebc49c399a2ff

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61535bb31bcebc49c399a305
        failing since 77 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-28T18:15:02.399327  /lava-4596927/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61535bb31bcebc49c399a306
        failing since 77 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-28T18:15:01.364344  /lava-4596927/1/../bin/lava-test-case
    2021-09-28T18:15:01.376214  <8>[   51.145413] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
