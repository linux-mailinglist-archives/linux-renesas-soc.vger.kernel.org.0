Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AF4396752
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 19:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhEaRqg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 13:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhEaRqV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 13:46:21 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F76C003674
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 10:11:01 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id y15so9396740pfn.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 10:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jtjrZYqPqZlzbcawGsp6n2020G7Zhhe/LDv17pXUagI=;
        b=ErZNSB4mTCMGvSQ+UbU6gYsMYu/nQi2afjWaOlzVd9HwATOypQLMXs/QD1XZhf6OgI
         Zg9vJWlWbpRVUusscmPXrWUMysC9WHdliQJ8j+g1gyAmGgPyplFs5+hWC2Z9H8jVy7Mf
         RQV0jxAMNAO3+yHzzuMK+VLpheNpp4gb6PM1Hk1fIOn13Fe6W9tW3B25q/LPkerGMubX
         qt46/EEX36FDnaYAdkAKlH3luDpQ6yWkFh3ih7QtTr8Szr5/PpHIJz89/2REzxnf8Ff7
         cf4vUBM/xrH5yYQBcRdnfkYovmesD1feMii8pGGCOuWl1lx4rUsb+DcWOamNJJJl66QY
         JYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jtjrZYqPqZlzbcawGsp6n2020G7Zhhe/LDv17pXUagI=;
        b=kantZOmjDoPQlc8E/3gaz3ETq1Ly6jAiX6lr8lkvPJz2uadDgUOgmZ7opCwjlCwWy0
         /vyZL6Mw6B3O5xceEVgZ13G1VEmIJMBsC2Xj1ucHFfsXjQJ7PS5b0te9h1OblR6nNnM6
         F1kG6nZ2cW9y0PBRoSxmyfzUiMrUTcqKwg47PJ4CEMIkhQm+rrWRt/Ju4+3GSHXXHhE3
         CLIXUIYhbEMxy2EUXJjbo1OBmYQsyJc6YlpV3k8htPFf5WsRPhIkEHDaYZWPxmRWESPi
         2MlCwnFQi7lWtCSt6Z1S5oElsSmbqk9lA3Ev1DgS22tGgVcP6KotphWBqBkZFPoKKSy6
         X/+A==
X-Gm-Message-State: AOAM5336rMLsgJyMFg4O510ej7D3WrYl4uvrYbgwAVPWoaoM9eooqLMC
        pKJ3B92/kRZIqX/35n3Oj9Lnvr0D6Ul/hO8l
X-Google-Smtp-Source: ABdhPJxei2ls9lQ6o5LD1+h3MCAiwfrehoK/FdlSS8BdHwC0JOWsilKNNOvi/YYFmcanbmMDUDy8qA==
X-Received: by 2002:a65:4286:: with SMTP id j6mr23325079pgp.11.1622481060632;
        Mon, 31 May 2021 10:11:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b20sm3145299pgm.30.2021.05.31.10.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:11:00 -0700 (PDT)
Message-ID: <60b518a4.1c69fb81.355e0.91a4@mx.google.com>
Date:   Mon, 31 May 2021 10:11:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-31-v5.13-rc4
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 42 runs,
 4 regressions (renesas-devel-2021-05-31-v5.13-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 42 runs, 4 regressions (renesas-devel-2021-05-=
31-v5.13-rc4)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-31-v5.13-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-31-v5.13-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a17b18482334959148cabda392caea262c68ba77 =



Test Regressions
---------------- =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
dove-cubox                | arm  | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4df82ed40e1193ab3afa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60b4df82ed40e1193=
ab3afaa
        failing since 34 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
odroid-xu3                | arm  | lab-collabora   | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4fdc0509539dfc9b3afb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60b4fdc0509539dfc=
9b3afb3
        failing since 5 days (last pass: renesas-devel-2021-05-11-v5.13-rc1=
, first fail: renesas-devel-2021-05-25-v5.13-rc3) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e95dddbf70bbc5b3afae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60b4e95dddbf70bbc=
5b3afaf
        failing since 30 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | sunxi_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e6b432b68fec85b3afb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60b4e6b432b68fec8=
5b3afb9
        failing since 55 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
