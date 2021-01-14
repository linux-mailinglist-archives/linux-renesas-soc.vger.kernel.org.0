Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99732F6527
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 16:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbhANPtX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 10:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbhANPtW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 10:49:22 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2D4C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 07:48:42 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id a188so3563942pfa.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DM2/DDMXIXVnBHwxHPDDgz05cmF4aLAisw2VfJh2HKs=;
        b=TrS8lQpPFoV1sLRt8lkBNQXgpyDVGJe8VoJk2CRzL1p7EpdQJL2VBu4mpOSLSA804f
         HfRV8f+hQsIi0qe1gdlLpPnpa7PHnZc97NpBjyj8v16IQWWbGSPdwdq8KgKCX03AUr76
         Eu2chZIM/pqnm1+uMO+zQjO55BUdmwpqIkF+EFWVlNasxinjbcOmxf8Wa9GGTcpq9zW1
         6uJxbsRq8T+b5YagkfzhBB11Ioz26LfZ6W90DfMiaqFaJHq0ApuHcTjFJ3pbDavm8gRy
         XHaVeIJizc4TUUzUEHDMDB/DBevwkjaUyPzz1g1feda6fMLxzUm73aFS2vDgytsFryq0
         QbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DM2/DDMXIXVnBHwxHPDDgz05cmF4aLAisw2VfJh2HKs=;
        b=K0HoNbpuG/ot61bW71Y+6z0tJDPPxxm3vFeVpRhkoWm3x9j9o7IEP40g1GjCsb6tNv
         /KTReLNHnbY5LQgFayj8ioSEf/YuYiEHnjSJ+ICROaUMExv8Oo2ZXwQLf+LuOxaoqDdm
         9L8c+H2WmrZSTpUonIu7ioS9A3BHs/8XsErbOrgZMujqmmoSSxEqGWkJmxesa71yfhjN
         jo2PirhO8mZo7lxs68YklNOJU5bnQfl1YBvqesJY7Gzlr+lj0070Adc/3KSOZK71lnaz
         41jmKFtus0+C3HkjjIanOB+ueetcseq4ou5yLD17EsD5jqhqt99YzCT5Edr7Br1XKB3o
         if+Q==
X-Gm-Message-State: AOAM530+VJll521Ngipe36k7waxPqWXnLptNJtbhhwtXQ9jA5+3GhWHM
        chunXRal5V6dwXxl82k8pw0ZJ5ohKZXXKQ==
X-Google-Smtp-Source: ABdhPJzgN8PD4szmG0e0OB+wdqL2JIE7iS80hZBuvilfAjeEOi/6G+3FlTlyWLXyYquxhY7/JZN2Tw==
X-Received: by 2002:a63:ec4f:: with SMTP id r15mr8099126pgj.344.1610639321381;
        Thu, 14 Jan 2021 07:48:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm5750405pfj.22.2021.01.14.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 07:48:40 -0800 (PST)
Message-ID: <600067d8.1c69fb81.83118.dc28@mx.google.com>
Date:   Thu, 14 Jan 2021 07:48:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-01-14-v5.11-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 25 runs,
 2 regressions (renesas-next-2021-01-14-v5.11-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 25 runs, 2 regressions (renesas-next-2021-01-14-=
v5.11-rc1)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
 | regressions
--------------------+-------+---------------+----------+-------------------=
-+------------
odroid-xu3          | arm   | lab-collabora | gcc-8    | multi_v7_defconfig=
 | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-8    | defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-14-v5.11-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-14-v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f1477673cb5a58fdf6a8e1d177b1f01e67e8cc91 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
 | regressions
--------------------+-------+---------------+----------+-------------------=
-+------------
odroid-xu3          | arm   | lab-collabora | gcc-8    | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6000546e3f951abc23c94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6000546e3f951abc2=
3c94cbe
        failing since 2 days (last pass: renesas-next-2020-12-28-v5.11-rc1,=
 first fail: renesas-next-2021-01-11-v5.11-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
 | regressions
--------------------+-------+---------------+----------+-------------------=
-+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-8    | defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/60003598282afb39e6c94cf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60003598282afb39e=
6c94cf5
        new failure (last pass: renesas-next-2020-12-28-v5.11-rc1) =

 =20
