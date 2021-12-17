Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BF0479428
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 19:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhLQSj0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 13:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhLQSj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 13:39:26 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218A3C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 10:39:26 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso6571980pji.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 10:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UNXYO2p+XGJLIEheRRhNH99+EReBwVRH7I/ljmEcfy8=;
        b=qYoUdHpYIveh5vVF8nLudj+YA7pV7MbOnXrpH97Ibz8Fv2d9WpHPVJtDXrRzuki5fS
         Y5svwy6vTBgfdHdjasA2h1yCD6yV50i95oEs2VloVpXpGiZqDcAU1AGfMlRhQBf1p41q
         frz25Irra/pLx1DNlJPPagACzwwsW4xO3SQifT8yHATOXfl+s75KMm6X9poRFR88WbX+
         cOeyp2MnnzmhEGJXPaGVnzQAFO+5cEr3/nQ5YzLzs1bf3zWBZpZydU6eAZx+lcVpI2XP
         Tz7us5jgskuJOcCX9zIlKGNSKCJkQlwDloY3RaufzI1PiQBo42UnIpdpf+rlZK7127UC
         6EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UNXYO2p+XGJLIEheRRhNH99+EReBwVRH7I/ljmEcfy8=;
        b=U5TzPaEKJ615p1snxr930pkIDnS41eg12ryFj2KyUrbcz9m9XIGGhCE+WA54gOEI75
         m2/7WYvf6FguJmtOYIV8pxinWQMzSPZtqQpS0JPelQjGSVZWoGuQMpYUrtj0LJN3YL9S
         lex3ZCFnsGNj6r//jtNhGgGQ+olGCdNniams3Te/J65J4k29eHuF/uNVsNZc6CR935w/
         1E1MoKQCzQ3Ru4mHSkSelZ8HOmvFwRH0QlmqL7+1sMVudAM0FLcPVqReCe6YgCtF5q29
         h1GujmpKQ9HDhAhV3ikjpHv+sMzFzFDWhhk9GrABaHFXDoxEHIXQTrj2V3N5RXrZ/SR3
         4Flw==
X-Gm-Message-State: AOAM531YgbAjBGtVks8Z7u7P0m9m9eCZC0+wsC6ctWgG6pQH50tvn89I
        uGqgYTEBT6wyym6RiBEE9LrZh/TMk5IdiH5t
X-Google-Smtp-Source: ABdhPJxsYV/+7BtmlqWgcZ+tXQVmohMDD5WR7Fl84MgOtwyf3Li9Lubk/ycyAPBhC9JwrLsvJRtsTA==
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr1049606pjd.41.1639766365298;
        Fri, 17 Dec 2021 10:39:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n42sm6832964pfv.150.2021.12.17.10.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 10:39:25 -0800 (PST)
Message-ID: <61bcd95d.1c69fb81.19f4e.3dab@mx.google.com>
Date:   Fri, 17 Dec 2021 10:39:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-12-17-v5.16-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 46 runs,
 2 regressions (renesas-next-2021-12-17-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 46 runs, 2 regressions (renesas-next-2021-12-17-=
v5.16-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
am57xx-beagle-x15   | arm  | lab-baylibre  | gcc-10   | omap2plus_defconfig=
          | 1          =

rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-12-17-v5.16-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-12-17-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7430027307374f7d8cdec708f61b1bc22d95b913 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
am57xx-beagle-x15   | arm  | lab-baylibre  | gcc-10   | omap2plus_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc9f7fa0b23ff908397149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-nfs-a=
m57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-nfs-a=
m57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61bc9f7fa0b23ff90=
839714a
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1) =

 =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bcac600ba9352bdd39712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61bcac600ba9352bd=
d39712c
        failing since 31 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
