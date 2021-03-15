Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51C533B8A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 15:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233973AbhCOOEI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 10:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbhCOODg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 10:03:36 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554BAC06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 07:03:36 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ha17so8095666pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uvrkAGKZQGvWC5JChhq836K5tnydNOjvK/9cRbPFWlo=;
        b=xUEGxRAf+sWBdC9/7ZOPK9GNJ6Hsvaaroa12jDQ7BvC1nt3MKtJHbrKwa5cfwgW2JJ
         Qpzv2CrxM4OWA1xMl5v6x9ZAT8JHpywZh956kQ0drwN6QZwWrVypk4WJl7VdNPz4Fsbz
         36PzFII9g9OO8wBMlsFZs8ZEWs0jamV6PdSSgH+V+7Win2i8GmZOME0dQnPJ7Lx+znPu
         W2xA1LM6QwrbXpxjVh3uT8U9Gnq0cp7wrG7x24XLEjek2o1le/Sx9POtb7HldUJEj3qX
         qlTXrNLhhEHBH2vnSAl1XRKFXcZ/YV5Rkoqn4zmFA1kLv2KGNrsTrTml0Y3+s9Bjhn8g
         9/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uvrkAGKZQGvWC5JChhq836K5tnydNOjvK/9cRbPFWlo=;
        b=TeDuMLPnZfxT051S4V2YJJieyhc0aDUfx8QlPrikS2EdHiA8i4L7IrRgyW5aH2VUBU
         vcuJ0BJZd4YErjgTPCZZ0z6yko+wjqorcoypEackBXcP4vJWBk0vhMwJQa054iov1c9R
         tLeqCrMQ2jqdTS7FzwcsDBl/el0QK/GYMTWvvPqKPw8RBsAKYNgtbStUKPnbEtDL0NbS
         3k7b4VohLur/ZQPJHjd8Z7/zyu9PPXc2ZiFuhlHks2Q6ToyH/HLVDGqoUJW3hP0V67Bn
         MRNmDxBgcKPyGtqsswjNXoL6qx3PO0w4b2QbPqv6dc7Dm5qGpsZJyayWNpNhhmau2WKN
         RIsA==
X-Gm-Message-State: AOAM5303XbHZzf0wUHLjr3+6jcCrPHM17p+fNnoS8UiD/rndO9u+d6MC
        1r2mhDaHfoM4iKAcGAhvn8N4wSVFqJjClw==
X-Google-Smtp-Source: ABdhPJw8xtFGykx/DIqHJQEvAOlxKflYncItH8OaPW2I/+TfHsi9Gk///CDz2M2QBDU2Y5maAv6qyw==
X-Received: by 2002:a17:902:7d8d:b029:e6:4061:b767 with SMTP id a13-20020a1709027d8db02900e64061b767mr11644511plm.32.1615817015731;
        Mon, 15 Mar 2021 07:03:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o62sm12889575pga.43.2021.03.15.07.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 07:03:35 -0700 (PDT)
Message-ID: <604f6937.1c69fb81.8f214.f905@mx.google.com>
Date:   Mon, 15 Mar 2021 07:03:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-15-v5.12-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 170 runs,
 4 regressions (renesas-devel-2021-03-15-v5.12-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 170 runs, 4 regressions (renesas-devel-2021-03-15-=
v5.12-rc3)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
   | regressions
---------------------+-------+---------------+----------+------------------=
---+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
   | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-15-v5.12-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-15-v5.12-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7bd4543a30a76f48903e745f7b9decce1f019ece =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
   | regressions
---------------------+-------+---------------+----------+------------------=
---+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/604f34ede70044694caddce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604f34ede70044694cadd=
cea
        new failure (last pass: renesas-devel-2021-03-12-v5.12-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
   | regressions
---------------------+-------+---------------+----------+------------------=
---+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/604f324a64f1e6c7daaddcc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604f324a64f1e6c7daadd=
cc6
        failing since 117 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
   | regressions
---------------------+-------+---------------+----------+------------------=
---+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/604f36df11ba0eae23addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604f36df11ba0eae23add=
cb2
        failing since 117 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
   | regressions
---------------------+-------+---------------+----------+------------------=
---+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/604f31fe91f0ef8f22addcbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604f31fe91f0ef8f22add=
cbf
        failing since 117 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
