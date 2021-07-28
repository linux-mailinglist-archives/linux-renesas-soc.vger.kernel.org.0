Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5003D8554
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 03:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhG1B3p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 21:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbhG1B3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 21:29:45 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20D4C061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 18:29:43 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so7508953pja.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 18:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7g42ltF/C/MngchWaHt/RJOZAibax8G6Zw/M9w8q7zI=;
        b=W9reGKLVrM6XFNMfBJqjxCKqtKjTYbjq6b2wuqzO+nrZ3gBRYfzMhkYqG9w17+yZR7
         hUy8dZvWtxBnvcmmXT67achqnidXilVgzNQqz5ahRf1a35VHDBvRldeQdPGeoIQCFiXR
         xN+ke/U5w64v9/aInmQAmJDToZNrrCpSI1T5IMY8eS9RD0sizP35vzn0dvCwp3y0if7W
         XEtHrt/m2CpoBMWeTQSypgiiHI7Jwx/ZrNA7LWGb/D+2wjQxKsrFcT/ltQjFK+gQoUei
         ni7+X7s5v4P2ymslbQ86rQTOT5ri/0W/mnoAcDx4N7juFlyoiSWK6MznOnTWc/3gidJc
         SYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7g42ltF/C/MngchWaHt/RJOZAibax8G6Zw/M9w8q7zI=;
        b=tKqbjCaFtUHaMSkLTzxbdF/qFYlyJIyy3Q+1fzSTEOQUbfCXlxA+5lSqJ0V8FilOOX
         OU5JtKhm2Ml6KIaCUqSfxP4OaqTyVCq3i+9JPjSwBOMg69vGfHi+/PZD6dF5qsyWmtxr
         U5sdWVIgL9R9/b8DO1fX+OUB6bnzrj62ZY50cHWoMB8QSfMlBeuAbmjnvP5R1EbBi+x1
         KFD+uo8kxiatbRh0VXx+wfQzf2Z9tsTt7Ya9Wcdji6mOdeGEulpdDUkyUypGtV8X9EtO
         0052tL7vrKy1wQH+RevqEzruNHXv9ILuCCyCD9nhfAKjrFNdyW36ToV379nts2Pd/I3G
         h9fA==
X-Gm-Message-State: AOAM530oaVqBnnZhCH822vG32y6JtCPRJ6gQu680BmqwjAXXNErnzlc5
        8o8buVc4J4ezqo58qecUDvM7/m7w6owo/OWV
X-Google-Smtp-Source: ABdhPJySboxjHDUAnGc6WuKnx2nsncAW3Y94005qjBSjM1WGAg6BErMRCa5Is/sSkms+EtK/YagB2Q==
X-Received: by 2002:a63:4650:: with SMTP id v16mr26343722pgk.90.1627435782995;
        Tue, 27 Jul 2021 18:29:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t1sm5383541pgp.42.2021.07.27.18.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:29:42 -0700 (PDT)
Message-ID: <6100b306.1c69fb81.934f.3152@mx.google.com>
Date:   Tue, 27 Jul 2021 18:29:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1
Subject: renesas/next baseline-nfs: 59 runs,
 6 regressions (renesas-next-2021-07-27-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 59 runs, 6 regressions (renesas-next-2021-07-27-=
v5.14-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
        | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+crypto | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
        | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
        | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-27-v5.14-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b1f6bead1fb4976611429f459a1865daadedbb48 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/61009792cef4993dd75018cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61009792cef4993dd=
75018d0
        failing since 19 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/61007a20ea64f24a555018ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61007a20ea64f24a5=
55018eb
        new failure (last pass: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/6100770279b9e0c8cb5018f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6100770279b9e0c8c=
b5018fa
        new failure (last pass: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6100877b8dd67e36ad5018d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6100877b8dd67e36a=
d5018d1
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
        | 2          =


  Details:     https://kernelci.org/test/plan/id/6100853cf4ce6c16885018c3

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6100853cf4ce6c16885018c9
        failing since 14 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T22:14:12.241871  <8>[  111.891486] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-27T22:14:13.491426  /lava-4261961/1/../bin/lava-test-case
    2021-07-27T22:14:13.523617  <8>[  113.174958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6100853cf4ce6c16885018ca
        failing since 14 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T22:14:11.958695  /lava-4261961/1/../bin/lava-test-case   =

 =20
