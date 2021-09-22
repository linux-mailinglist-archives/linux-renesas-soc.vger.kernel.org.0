Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C81413EB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 02:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhIVAs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 20:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhIVAs1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 20:48:27 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7B0C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 17:46:58 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id bb10so640281plb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 17:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IX0/gBTHRWFU/YAlsKNCCV5ad63YV+x4I8oBWSOonQA=;
        b=tQMKijMPet3QSC4fBcKIcCPWSfwjf6r5B8MajoCSC8iOVftRTRDPUjIDFda1ibuTvs
         dZJEdq4uVwI63VOUzaGw8desjIO8uZVnrjnW+bF4YlcqY6rgOmX1DlSYZtXAj6h8ZmYC
         d6J4pARW0NaBDLE/HhpqtcH0Qddn+dQlqMrxliUeYEbzD1RR7bF6oES/D1oMlpSjo78u
         m9BbFj/9shLkBO7qlvViSu+Diecqa7zCvgnwYE1X3lvn/5QxBbVBv6iPW7wkum8ehv9I
         FTMH/TfVAWbMhlbA25cGmbAVhYeMGTOOtirMH+Y0R+nWN3fYa2xidMIHtLTp1r5eoAM/
         tYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IX0/gBTHRWFU/YAlsKNCCV5ad63YV+x4I8oBWSOonQA=;
        b=RVsYXZWU1/vJnXlK5iueSwzCHUFLMBI1Q8pC6m/LS22NWwYTrdoM/K17FTdbou+jQU
         JzhXQrMi/tW8pBLBAZ3TDy/Hm3e2zOLDziVN7oz6CmIvr63nsKZmkwtz+wjkvGcHSdMz
         qFMr3xEuufLDdYPUtaTBJJCzWGLJIwikeSxHjODy3jeYL5aSFmWnAKLNnvYE4CWAoHYT
         hsq5hjzd8G6Snos4KjOfKF6lzbJzD2uDx2e35IDpvEc5IA+Urbtb0K1/tl/qnNTyCy3W
         otxYJJTIrLO0JwP9nN0kY+NGCZPgOnYSo+bNNmjFbyXGN1fPr1xSsquMt0SPxlwKJbCX
         o1fA==
X-Gm-Message-State: AOAM530Oflq84dVlva2mNXw+4WmvHWXqqpvwFip2hQXk3ITbP0myMNlG
        RwrcWxTCbULTGJeaYYyVuWGDQHiQZgPtZ9Ek
X-Google-Smtp-Source: ABdhPJxJWC2Hk7x+5eZtVSl/y0D7kqJ0KuuKDWVqYFffhTVVmXVGeNyrj6ebT95QEvu0OGIp7pmQLw==
X-Received: by 2002:a17:902:a40c:b029:12c:17cf:ab6f with SMTP id p12-20020a170902a40cb029012c17cfab6fmr30212231plq.71.1632271617839;
        Tue, 21 Sep 2021 17:46:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y26sm286857pfe.69.2021.09.21.17.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 17:46:57 -0700 (PDT)
Message-ID: <614a7d01.1c69fb81.8aa9.1c12@mx.google.com>
Date:   Tue, 21 Sep 2021 17:46:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-20-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 44 runs,
 8 regressions (renesas-devel-2021-09-20-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 44 runs, 8 regressions (renesas-devel-2021-09-=
20-v5.15-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+ima        =
        | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

odroid-xu3       | arm   | lab-collabora | gcc-8    | multi_v7_defconfig+im=
a       | 1          =

odroid-xu3       | arm   | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

odroid-xu3       | arm   | lab-collabora | gcc-8    | multi_v7_defconfig+cr=
ypto    | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-20-v5.15-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-20-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4a7c76d8d5a91d210d64552d5e29fd02a115fce7 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a5a860cabdb301099a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614a5a860cabdb301=
099a2f4
        failing since 70 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+ima        =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/614a46a912f70f762699a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt=
8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt=
8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614a46a912f70f762=
699a2db
        failing since 8 days (last pass: renesas-devel-2021-08-23-v5.14-rc7=
, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a49017e89cbb35899a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614a49017e89cbb35=
899a2f8
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
odroid-xu3       | arm   | lab-collabora | gcc-8    | multi_v7_defconfig+im=
a       | 1          =


  Details:     https://kernelci.org/test/plan/id/614a6f577ed9effbef99a317

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614a6f577ed9effbe=
f99a318
        failing since 40 days (last pass: renesas-devel-2021-08-10-v5.14-rc=
5, first fail: renesas-devel-2021-08-12-v5.14-rc5) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
odroid-xu3       | arm   | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a70bc8f74e79fda99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614a70bc8f74e79fd=
a99a2e9
        new failure (last pass: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
odroid-xu3       | arm   | lab-collabora | gcc-8    | multi_v7_defconfig+cr=
ypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/614a72d0272daded2f99a303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/basel=
ine-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/basel=
ine-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614a72d0272daded2=
f99a304
        new failure (last pass: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/614a49540e92eb345699a2f4

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/614a49540e92eb345699a2fa
        failing since 70 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-09-21T21:06:10.341532  /lava-4554078/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/614a49540e92eb345699a2fb
        failing since 70 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-09-21T21:06:07.438618  <8>[   92.095249] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-09-21T21:06:08.499971  <3>[   93.155029] cdn-dp fec00000.dp: [drm:=
cdn_dp_pd_event_work [rockchipdrm]] *ERROR* Timed out trying to load firmwa=
re
    2021-09-21T21:06:08.741968  /lava-4554078/1/../bin/lava-test-case
    2021-09-21T21:06:09.093064  <8>[   93.751615] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
