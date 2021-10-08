Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925784273F6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Oct 2021 00:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243505AbhJHW5v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 18:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhJHW5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 18:57:50 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FD9C061570
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 15:55:55 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id o133so3092813pfg.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Oct 2021 15:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=89aGXJnIt44KGtQiiAPhd5a5Oyxk6ty2kr6BQxSA2nc=;
        b=knQRap26cPnFrWNNPq1v5zipzlbJQ4XuKn+8Mwnvgb66e39i7ZQGP8c7nAVTnt/AYp
         MHLIxCYa2vLWLEvUfPxGppMVqAGCfYllj4qW2SeN1QxONwelHFgRFDaSlf+U5ftYzQje
         yM6PcZS8+9u/oRz4hcAtSPrH5TO4cpYRKAWxfvSQjVD8daBl0DJpWJrSjIoeqU8DnG4o
         vahA1O8pnwP1vJpiY4XQs1C0b1ezWKrAUWVfPhi9BhSr8gF7s4U7px00VcfS82CLXl6r
         FEs62+LkScrBWkxhc3Xbz5oC0y/zx5mFV1XpVpUi8kdexy+V37Y0RB9eSXg10FI3QCXp
         dfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=89aGXJnIt44KGtQiiAPhd5a5Oyxk6ty2kr6BQxSA2nc=;
        b=C+evBPVpLbAUFQD/2czEyhQdME7ZZXlascv2wZKBoNNIAk+hDsQZlBZ1x86Xs0F9Y9
         AsIsvZ3IYzgLmcj1Yt1+rLHWlsa2GDRCg45jZiBFV1cPjFcMZ2flQ+xbrBa9UHkVyRfb
         JNKBdtjB8SHxrFrKTQswhhW0Uk6BwchaV51ifIXlQbW5YfOHmd/JZe8BFHJXOMfTZs6x
         cU52efvOVxiRH4zgJGI0UhRMDLPkh5dTcbqCqRGClD8lg/VLfUYPxsd0pQRI0/GcHl4e
         KgeT3pp0oRlk+0pYzmLLx+VHYuXLnuorUztD5gOuORofc9ndUz5r9wHoi2h/GwoSy/wI
         7zpQ==
X-Gm-Message-State: AOAM531mwsqEmcb2e98GYgY/zgchoymoQWgXLCTR7FAYEzDw9abGA86L
        8L2y7cBhBFrz6q1ze8/BkuBAuAt6uqOhsWfQ
X-Google-Smtp-Source: ABdhPJwsCdpYrSXElnEECDCZj9KtS+nmGauWtJD+g3lXKN13bBh5UsbKy7WTiXQOiJa4ZZkMpExQOw==
X-Received: by 2002:a63:105c:: with SMTP id 28mr6792402pgq.187.1633733754408;
        Fri, 08 Oct 2021 15:55:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b8sm313614pfi.103.2021.10.08.15.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 15:55:54 -0700 (PDT)
Message-ID: <6160cc7a.1c69fb81.8bc29.1944@mx.google.com>
Date:   Fri, 08 Oct 2021 15:55:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-08-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 32 runs,
 8 regressions (renesas-devel-2021-10-08-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 32 runs, 8 regressions (renesas-devel-2021-10-=
08-v5.15-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =

hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-08-v5.15-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-08-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c2a19dc748287f470b9f2117e1b50206988efa8f =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6160a7fc6bafdcecd599a2ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6160a7fc6bafdcecd=
599a300
        failing since 86 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6160a9619492b1337c99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6160a9619492b1337=
c99a2ee
        failing since 87 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/61609258b8d2049fab99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61609258b8d2049fa=
b99a2e0
        failing since 24 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/616095ff77f8fe7a8699a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616095ff77f8fe7a8=
699a2e8
        failing since 16 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/61609ba903c7a780ae99a2ff

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/61609ba903c7a780ae99a305
        failing since 86 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-10-08T19:27:12.816767  /lava-4676769/1/../bin/lava-test-case
    2021-10-08T19:27:12.847012  <8>[   98.483938] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/61609baa03c7a780ae99a352
        failing since 86 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-10-08T19:27:11.749777  /lava-4676769/1/../bin/lava-test-case
    2021-10-08T19:27:11.780423  <8>[   97.417454] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61609bbfacdea2872999a2fb

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/61609bbfacdea2872999a301
        failing since 87 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-10-08T19:27:38.721064  [   41.977357] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-10-08T19:27:39.764969  /lava-4677009/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/61609bbfacdea2872999a302
        failing since 87 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-10-08T19:27:38.681858  /lava-4677009/1/../bin/lava-test-case   =

 =20
