Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593CF2F34A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 16:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406004AbhALPsh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 10:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404814AbhALPsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 10:48:37 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936D9C06179F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 07:47:56 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id v1so1822660pjr.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 07:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YcKzS/BSYRtY90A8+CvF294F7X32K5a6BgjGvqK3+z0=;
        b=qiRf9ep4JvgvNlkezfvxoI3Qhxbsu+zmgT2UYZQuKEimIkGaVLWePKaw1spKOU+7DC
         zVL0btCBbQGZASed46utRlU91NFX0GqZiiaJr42IlSDDvVnhXvp3SqqyYHC4ZNsPqG6n
         /m2eByx6NIJ0cUKzc2gKMpCYVxg4YIXc1Q0Re7fBnWYTsbL0e702zrwW+TcyNgqoYW40
         xFzCqdpEVo/WfBPhcWbmiKmL87sEEU5Czzgrx36iUV+lOf0P1wMSC7s++cd9GAXui9ve
         NssbxmajLpKlaJLc+UykB1KCE/c4tmdBoh+fBjnxbetvcyQVmwv3fEMwtdhbZLIWGEh7
         i6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YcKzS/BSYRtY90A8+CvF294F7X32K5a6BgjGvqK3+z0=;
        b=EhihtpDSq99ky89uv/J2P/AwoXL9jxaDrCGSFsiphd9UV6W+UiUY2ImQUjM1iWv5BL
         J+2RXgV2p5MwX+S1rudn6RtgNaMhpF8q0t3DSns4nv8qGQjp2yKHj+jBMe+I7kbRF5qp
         nAT0qc0gL84iPZjDnvEqLE2XBCwid0Dm/lUU6mIHjiSEKAhqE1kj7u2d4FisBGETR9WQ
         b87eMgZP729ZeV08785iUOkOdYjHFdFbTWVO7IPV6wZ+hZ/yGTTCM9c9doDGy3LD8iw6
         0lsCSShx2Vts9GDhiCRGDcVaagHikZx4gJNvqmm37UAor6ZkIK1dhk1t0vCRqSaDy/ay
         CD8Q==
X-Gm-Message-State: AOAM533Oxf0cto3+MsM9D7xWTkiXL8Lr0gEyyIkIXbSn97PfPB3mXvXr
        5p4XqkLtnNkGdeRbe2PU4385iIM1DDmKKg==
X-Google-Smtp-Source: ABdhPJzpm9Bp2sPhEWmkTqlbSfnjxYVh+uuAHEh3sYhYxGKrK/a4bYr7GetLR9F0oFOTTquaH9wOpg==
X-Received: by 2002:a17:902:7b93:b029:db:d2d5:fe0e with SMTP id w19-20020a1709027b93b02900dbd2d5fe0emr5344017pll.17.1610466475075;
        Tue, 12 Jan 2021 07:47:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f92sm4049023pjk.54.2021.01.12.07.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 07:47:54 -0800 (PST)
Message-ID: <5ffdc4aa.1c69fb81.549bb.7bec@mx.google.com>
Date:   Tue, 12 Jan 2021 07:47:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-01-11-v5.11-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 262 runs,
 9 regressions (renesas-next-2021-01-11-v5.11-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 262 runs, 9 regressions (renesas-next-2021-01-11-v5.=
11-rc1)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx6sx-sdb               | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6sx-sdb               | arm  | lab-nxp       | gcc-8    | multi_v7_defco=
nfig           | 1          =

imx6sx-sdb               | arm  | lab-nxp       | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-11-v5.11-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-11-v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ffb284986e56791dcd815b16c03adad3e2f36cbf =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd94e2ccc61a79b6c94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd94e2ccc61a79b6c94=
cc2
        failing since 7 days (last pass: renesas-next-2020-11-30-v5.10-rc1,=
 first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd9481ec027fbb73c94cd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd9481ec027fbb73c94=
cda
        new failure (last pass: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6sx-sdb               | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd9787b0cab875f0c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd9787b0cab875f0c94=
cc3
        failing since 7 days (last pass: renesas-next-2020-11-30-v5.10-rc1,=
 first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6sx-sdb               | arm  | lab-nxp       | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd961e1537db7ac1c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd961e1537db7ac1c94=
cc4
        failing since 7 days (last pass: renesas-next-2020-11-30-v5.10-rc1,=
 first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6sx-sdb               | arm  | lab-nxp       | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd992a0df9dbe66ac94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd992a0df9dbe66ac94=
cce
        failing since 7 days (last pass: renesas-next-2020-11-30-v5.10-rc1,=
 first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd8da6545a969ca2c94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd8da6545a969ca2c94=
cc9
        failing since 50 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd8daf633744aa8fc94cdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd8daf633744aa8fc94=
ce0
        failing since 50 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd8d69de58763cd6c94ce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd8d69de58763cd6c94=
ce6
        failing since 50 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd8f86373ea5da32c94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffd8f86373ea5da32c94=
cd2
        failing since 50 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
