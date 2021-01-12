Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FD32F349F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 16:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406042AbhALPsh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 10:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406004AbhALPse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 10:48:34 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72B0C061795
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 07:47:53 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 11so1618589pfu.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 07:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TxDSEZ3iNkZ7VYUji+vwLncqNwLNwtyXoySV/vdzQSE=;
        b=WngXKxXEDu2S/t3l2+Mpr/COXwG8in46bc9lZJzV2DOxnmLX89ELwFuRCQ2LwCepf7
         JbZg/E3qYWwsEOCo69RvqR5v1t7DFSkne8YUGuVI+yEo/ucIuZb71syftzjytpXZrM2I
         aurCNM6CxAO1VfxI620rY5uKFNNAa1DDC4I0kQiTabTChqb/b57JcjdxVSI8L09weuOx
         CjN1xm188wsngtpA9PyV/jIA2pHMZm/uaoWpp1qN0Lh1wPqhTqae0X21LlahSm99262a
         J+jbR0Nr7Tw+o09l004lxI54Y6uOBCb1/bRkykGrwFpzxJUqI4mrhcD6GWMHV2jA0Vbl
         pqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TxDSEZ3iNkZ7VYUji+vwLncqNwLNwtyXoySV/vdzQSE=;
        b=YfKhB1mblfrB3LhuJVQSUvy+X+RKAyRnisOhl/x46SGtlvRh4fkBG3Hg0T9wYmNfXI
         XV5F4X1C8kKeE54s5hFBDyGfNHqonuQP1ZKWJfKc2HIupyn1J1gqWpT2CvTiOTS0sKuH
         xPIteTwpgtPNZYNKfS65WaPtFKhywWMb0388P/db6saca3QZqmhuKUQRIe5nfBXOdJiu
         c6oBofiZNl9qPRarfWDNVe1M6dura0oEIn18m9Y5tYuddPASmjemsB/xsubmEGmHhdqs
         EV14KB7mPoCTaPHfsWgwJOtW+Pt92bPTwwjQlIc0C3QFX/odNmF/2U8d+0Lhsy5ZqDuU
         rT2w==
X-Gm-Message-State: AOAM532nsrFeS+pCfpPupmx93eG7hJ0KBiPagcYrTLPS/Z0nubZy8XCg
        WGOlxCoiaq1pRjY2xq9/meIz91q6hvHYzA==
X-Google-Smtp-Source: ABdhPJyubFX1JVVk4quXkkG8QwF47jHoLeZTo39xUHbFBFqg0SerWnb5TztyBlPkEg/Qd9gLWz6s/w==
X-Received: by 2002:a63:1524:: with SMTP id v36mr5383896pgl.383.1610466473103;
        Tue, 12 Jan 2021 07:47:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d4sm3832814pjz.28.2021.01.12.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 07:47:52 -0800 (PST)
Message-ID: <5ffdc4a8.1c69fb81.872d3.779a@mx.google.com>
Date:   Tue, 12 Jan 2021 07:47:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-01-11-v5.11-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 21 runs,
 3 regressions (renesas-next-2021-01-11-v5.11-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 21 runs, 3 regressions (renesas-next-2021-01-11-=
v5.11-rc1)

Regressions Summary
-------------------

platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
odroid-xu3                | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-11-v5.11-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-11-v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ffb284986e56791dcd815b16c03adad3e2f36cbf =



Test Regressions
---------------- =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
odroid-xu3                | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd97b1ddc523f2d8c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5ffd97b1ddc523f2d=
8c94cba
        new failure (last pass: renesas-next-2020-12-28-v5.11-rc1) =

 =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffda913e9be1ba5fec94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5ffda913e9be1ba5f=
ec94cc4
        new failure (last pass: renesas-next-2020-10-30-v5.10-rc1) =

 =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffd8fb85d2e037314c94cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5ffd8fb95d2e03731=
4c94cbd
        failing since 70 days (last pass: renesas-next-2020-10-26-v5.10-rc1=
, first fail: renesas-next-2020-11-02-v5.10-rc1) =

 =20
