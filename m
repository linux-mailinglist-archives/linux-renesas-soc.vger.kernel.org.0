Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1869B3E5113
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 04:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbhHJCf4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 22:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhHJCf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 22:35:56 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F12FC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 19:35:35 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id f3so8310955plg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 19:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LjgnNPdO8NjCkCMuWsRZ7LPSP32avfg4Y1XBpTq6kbo=;
        b=Ig5MrLhel5B+Hoy+iuLsHa7qaxD8T2X4erkYvqUG/azpjYZLGnvrOMzHtqFzgbZcEl
         Iu7uS3W2RVXlOQRMHKEuFAqQ7ITZTEPWCbWv97ELBxPoGNEIRflLy1frFYv48nCf1Gib
         Y9y5cYh6m4GkigDP+l37uL7DunOwCxNPmb/456GQ3QHS4SboTV9lZ9B/HRIT/Qh+1MW3
         w/GozRk9zRYHkX65w9d0iam829G5E/YycpTsHPBNxrDBrZzbZl1sXbWVdgCF/bT+dhPT
         DbTnwj0p0W7tLPWucWN/S7Slhcq2b/c0ZEx+g4Z2PY3n/gsQJijlAvl2Qsz15s6WYACZ
         NPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LjgnNPdO8NjCkCMuWsRZ7LPSP32avfg4Y1XBpTq6kbo=;
        b=hdmqCyCof4/SqEJ5/djIQrFdCSZte/AOUijfOwb4/jg2wLeq+gtA75rFAEX/5p9ECg
         2sr4opvxtkUUovLTbc5A4TOgxUls3KImIVmuVDAxjds4Sv48uD9acDabPp0PuMMBJ+Xb
         uVVW7jJzUXVuJdnt4+e9xtgxJeUcRhuto6AMbEizinpOPbBL71nMWQab3fBUQ7eeOcmb
         +x1oTUDYdSTWkY1M+xAI1vrU1fN2jQwlZJzCS9OlwPvx//Dj3zYaoWiJLWFIiWYQCfol
         wJk6hwDo6qz/tJzPlmczCKP/WpziTQzq/KRnk5F3Njmidh68EbmSGTQyUJUCKT+O8VCg
         u4EA==
X-Gm-Message-State: AOAM530egy/UMlou8hgbKpe+cmPX72ORAMi2k17A48FAF51dvYgU5elD
        +zP7qASQbqq/DVS1ghJqtFQLg5Semucx+YJK
X-Google-Smtp-Source: ABdhPJwUv2v2ublOfrK2+l4Rb7sBygT+G4yK8ZF1qKeBkF+2PNMl76Oysn38NfyL2ApF4PebJe9gqw==
X-Received: by 2002:a17:90a:ad85:: with SMTP id s5mr28060421pjq.187.1628562934480;
        Mon, 09 Aug 2021 19:35:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u13sm21917500pfn.94.2021.08.09.19.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 19:35:34 -0700 (PDT)
Message-ID: <6111e5f6.1c69fb81.80cbc.141e@mx.google.com>
Date:   Mon, 09 Aug 2021 19:35:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 411 runs,
 16 regressions (renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 411 runs, 16 regressions (renesas-next-2021-07-27-v5=
.14-rc1-14-g57ec7ff3f83a)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =

bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig            =
        | 1          =

bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

fsl-ls1043a-rdb  | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =

hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

imx8mp-evk       | arm64 | lab-nxp       | gcc-8    | defconfig            =
        | 1          =

imx8mp-evk       | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      57ec7ff3f83a19aa366c58bd0f6a47a8844ac3fe =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6111b4b64910e6dd73b136bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc=
-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc=
-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111b4b64910e6dd73b13=
6c0
        failing since 160 days (last pass: renesas-next-2021-01-29-v5.11-rc=
1, first fail: v5.12-rc1-12-g3158164f1526) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6111aca3bae023790bb1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-baylibre/baseli=
ne-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-baylibre/baseli=
ne-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111aca3bae023790bb13=
66e
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6111ae0c1f3dd7fe07b136a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111ae0c1f3dd7fe07b13=
6a7
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
fsl-ls1043a-rdb  | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6111b2bb55196e6755b136de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111b2bb55196e6755b13=
6df
        new failure (last pass: renesas-next-2020-11-30-v5.10-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6111af0ff1e7a6f445b1369d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111af0ff1e7a6f445b13=
69e
        failing since 32 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6111b355ba3f04241eb136e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111b355ba3f04241eb13=
6e5
        failing since 32 days (last pass: renesas-next-2021-05-31-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx8mp-evk       | arm64 | lab-nxp       | gcc-8    | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6111ad2a99345c8328b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-nxp/baseline-im=
x8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-nxp/baseline-im=
x8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111ad2a99345c8328b13=
662
        failing since 13 days (last pass: renesas-next-2021-07-19-v5.14-rc1=
, first fail: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx8mp-evk       | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6111aee5cc1273bf31b1369d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6111aee5cc1273bf31b13=
69e
        new failure (last pass: renesas-next-2021-07-13-v5.14-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/6111abfd5b7d3f9a78b1371f

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/611=
1abfd5b7d3f9a78b13726
        failing since 76 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-09T22:28:08.451461  <8>[   55.904492] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-driver-present RESULT=3Dpass>
    2021-08-09T22:28:09.462913  /lava-4338566/1/../bin/lava-test-case
    2021-08-09T22:28:09.472110  <8>[   56.925490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6111abfd5b7d3f9a78b1372c
        failing since 76 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-09T22:28:08.351246  /lava-4338566/1/../bin/lava-test-case
    2021-08-09T22:28:08.359321  <8>[   55.813284] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6111acb28232c4b82fb136cc

  Results:     19 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/611=
1acb28232c4b82fb136d3
        failing since 76 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-09T22:31:05.039320  /lava-4338581/1/../bin/lava-test-case   =


  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6111acb28232c4b82fb136d9
        failing since 76 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-09T22:31:03.926668  /lava-4338581/1/../bin/lava-test-case
    2021-08-09T22:31:03.934489  <8>[   55.809160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/6111abe76c0165cc1eb13663

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6111abe76c0165cc1eb1366d
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:27:33.313389  <8>[   24.000019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-08-09T22:27:34.336378  /lava-4338553/1/../bin/lava-test-case
    2021-08-09T22:27:34.348020  <8>[   25.034975] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6111abe76c0165cc1eb1366e
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:27:33.301682  /lava-4338553/1/../bin/lava-test-case   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6111ad7b4a48a82af1b13674

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy=
/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6111ad7b4a48a82af1b1367e
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:34:29.705148  /lava-4338583/1/../bin/lava-test-case
    2021-08-09T22:34:29.716350  <8>[   24.564254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6111ad7b4a48a82af1b1367f
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:34:28.670704  /lava-4338583/1/../bin/lava-test-case
    2021-08-09T22:34:28.681727  <8>[   23.529671] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
