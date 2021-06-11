Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D390C3A39CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 04:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhFKCdh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 22:33:37 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:43698 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhFKCdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 22:33:36 -0400
Received: by mail-pf1-f181.google.com with SMTP id m7so3202747pfa.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 19:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5+4mccgjYxkfF/MHu3bAD11Y0T9lP302dfwIRkZ01C4=;
        b=Iq5/Tnnj16e67PjtYaNrKeb38wwu8BkhgUbKTqleyKbrSHbYo8pOplaoKWeQ2MrpNN
         pqEk8XiInctvk+3EOX7L3eJWeD7fmjeThQ9D05Zo9dEuTHqsB6jm/mz8YHgebnsAH+hP
         MEnkPQ7qfWTZnsYZjaYJBrWxNG3IczpOrW0o5wX5JVJCXYgnl6ROJeynSHfDxfoOBNfZ
         cXRC8PWq7FEvdv3IJjpkoxi9/zk5U387rMp/IMED9/+V3GBhGdGDFt8e9gcSuu45zL6V
         9fyhYS6dznbvScLOnMz1FGW+U4/PKgkeWFaUpYGG9g7hA11Q33I3PV1hZ58/6D4CPh16
         5t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5+4mccgjYxkfF/MHu3bAD11Y0T9lP302dfwIRkZ01C4=;
        b=unIUzL+ZJRPUr5o5ir+EO+cGexncbVAV64k4FAWbwCHizbLIPsEo0+aUPIIafoVLJP
         MGrb3cicSPvAqeKvMR2xVW0nsvSPpJRR82JEGTjNVl/FTmjQW2lJF83g9pyw5pm1AT6J
         pdOLV4N26k/810m9ZbJskVsihFUvOGp1WAEz0NXiL5giO0t1xFQUXW7HeCRVpGivQ2FW
         wNL1igYJ1bwPy1dEac9dqJsp24yiDZEt2P08wbh9/6KIjmMM+uHQfNdylBEhdNA0RqZo
         P96RupmzM/uqWTyxBfhvIq5gJUbkDUEAJ4Z0XDcnMeTl5DdYEiM3oGcP/eiMCroCUQr0
         VPrw==
X-Gm-Message-State: AOAM533Xg/BtBPBrd+iqxOzJRK2Qa9Lil9tq0QKzZ0dlGcyufKqCr4oL
        bMiG0wiOUbt/iZusoIIEWkBfHsd+iXk16lRT
X-Google-Smtp-Source: ABdhPJyJ+A77mObMVRPGayoEYFH0mHsVDjsj7mhsMoVD8huI7G+QicIdD4FnsnKQRXjkQEcrVaF0wQ==
X-Received: by 2002:a65:484c:: with SMTP id i12mr1361307pgs.390.1623378626968;
        Thu, 10 Jun 2021 19:30:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p13sm3610354pfn.171.2021.06.10.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:30:26 -0700 (PDT)
Message-ID: <60c2cac2.1c69fb81.608ca.c9cc@mx.google.com>
Date:   Thu, 10 Jun 2021 19:30:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-10-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 53 runs,
 3 regressions (renesas-devel-2021-06-10-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 53 runs, 3 regressions (renesas-devel-2021-06-=
10-v5.13-rc5)

Regressions Summary
-------------------

platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =

meson-gxm-q200      | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-10-v5.13-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-10-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f432b447a92822b48f7e674cec725b179c1fbde =



Test Regressions
---------------- =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/60c290b9bdd6bb72290c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c290b9bdd6bb722=
90c0df6
        failing since 44 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
meson-gxm-q200      | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/60c29b810033cb57460c0e07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c29b810033cb574=
60c0e08
        failing since 135 days (last pass: renesas-devel-2021-01-04-v5.11-r=
c2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/60c297bc45585469e80c0e1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c297bc45585469e=
80c0e1c
        failing since 14 days (last pass: renesas-devel-2021-05-25-v5.13-rc=
3, first fail: renesas-devel-2021-05-27-v5.13-rc3) =

 =20
