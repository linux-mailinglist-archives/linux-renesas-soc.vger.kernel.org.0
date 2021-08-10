Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9073E8468
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 22:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhHJUfE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 16:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhHJUfE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 16:35:04 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12019C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 13:34:42 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fa24-20020a17090af0d8b0290178bfa69d97so1019334pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1qyNiMSZ2zGMo9OhpVqE3184W6HbMh8fjXGVeORf2H0=;
        b=g0ETkoFxgb5awR/wdsyvV4s6LKlDkG2H1nnIX+x84EunXx27Q1kBBkyay2kCGMKTIN
         F859P8SYfc4nQ6Tj+S4B8V+HNNPXLrLQeiUuLwjnAGLfaggGCv5WXSg9QYGxvGMXIKes
         pO1aEH4TgmlNxK3A9/BigTmkt8yEILgCj6zCPjq7xT4qtc+bpFjQOwcvd2FjGOrIPJ58
         GwXDqG1UavObRMaPGHXERp7fOQPAMSfGh6XDJcqV5hOtOVr7PDn7XwBqc/FBJ6fnmGrP
         vVPC3N989SQNxdlQb9VZRWISC2kNAE1uWFpbtUrYFiDTs34p1W4LBLL/yL58RZO2XMh2
         5+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1qyNiMSZ2zGMo9OhpVqE3184W6HbMh8fjXGVeORf2H0=;
        b=Fr6CE7k9h6S1xGXtDxE35vwqRTAlsVybsXfEqnUGPRHNfH4QUbzPPWkU6X1nrf6sAr
         CABQG8vdFzJ2XAGKXHdrEuKIKPHEL8eZCjv0IwMPvpxcdEh2/cEb+hJRZM3s+7uhjmhY
         yIA90RLBnAMDme4IxuyBn2PjXlsTORhuh6n0PaRjjQrpKQlYPrilZXPvs9OwSM7g7ewn
         LU7x1URibsDI5MysBlNoBQt9Upzu+kxaXqbC2Cs5nRZm8EK70BV+FQp26pp2KZciVTsJ
         RukJYka0DHf7buhnBTNz1+DPe0Lh7qDd2dqNDc3PvlkTHxxBEHgjzYmt5hoRior/Ucht
         WVLg==
X-Gm-Message-State: AOAM531XKgndcEgZDEwPtJZG8r6ZCnRdVVOTTrqZnUlJzzIB07fmIZfI
        lwYE9Z4IfTxBEoYuX/jgFXfahXXFRHqJ5R2W
X-Google-Smtp-Source: ABdhPJxpRky2nGZKaAeqmwjalSrliZxltjpKyHRINzvz4uMoV3sFXJrv8/qglYZkrOTUQbiHieRzEw==
X-Received: by 2002:a17:90b:1292:: with SMTP id fw18mr13204737pjb.171.1628627681448;
        Tue, 10 Aug 2021 13:34:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b6sm27279865pgs.94.2021.08.10.13.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 13:34:40 -0700 (PDT)
Message-ID: <6112e2e0.1c69fb81.cc2cc.1e7d@mx.google.com>
Date:   Tue, 10 Aug 2021 13:34:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-08-10-v5.14-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 70 runs,
 4 regressions (renesas-next-2021-08-10-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 70 runs, 4 regressions (renesas-next-2021-08-10-=
v5.14-rc1)

Regressions Summary
-------------------

platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
dove-cubox                | arm  | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig | 1          =

odroid-xu3                | arm  | lab-collabora   | gcc-8    | multi_v7_de=
fconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | sunxi_defco=
nfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-08-10-v5.14-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-08-10-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3d3aec53bf89e3aebe1b92e693fe78efd5f49978 =



Test Regressions
---------------- =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
dove-cubox                | arm  | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6112ae96bdd33d9df8b13685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112ae96bdd33d9df=
8b13686
        failing since 105 days (last pass: renesas-next-2021-04-02-v5.12-rc=
2, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
odroid-xu3                | arm  | lab-collabora   | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6112be1ec65c05cde1b1369f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112be1ec65c05cde=
1b136a0
        failing since 14 days (last pass: renesas-next-2021-07-19-v5.14-rc1=
, first fail: renesas-next-2021-07-26-v5.14-rc1) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6112c93ea543b9a772b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112c93ea543b9a77=
2b13662
        failing since 141 days (last pass: v5.12-rc2-14-g6f56f6c26099, firs=
t fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | sunxi_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/6112b93605be7ea28db1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6112b93605be7ea28=
db1366f
        failing since 101 days (last pass: renesas-next-2021-04-02-v5.12-rc=
2, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
