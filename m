Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A13242E797
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 06:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbhJOERI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 00:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234211AbhJOERD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 00:17:03 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940F9C061570
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:14:57 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id e7so7470672pgk.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uttp4vOkM+/baqKSSnPBZvGpPMv4+onHC8rB64mwEHM=;
        b=z8warm3+cbTp5LkdWgUofy+vU1x0OndnB+8nNGHaFOqaZZwBNvkVkO7Z+9viWqFxdd
         rANK6vFKdevmgo8bRY4OmIDop8xHaadz+KvycosBQ4wJ3d4QCnQw+4lAI4nGiaJouJZr
         GFSmg4yMhnCBhbQX73bhjEcH5nXab3s3OYg+m4qtbVHG2ECV8OOdMVKrVz7SkGeZ4z8d
         KIuYf422dKFoHBAB38LvXifh7sYzVF1A+ZA+JW8EfhrbL+oeMnrgvNX9oOm1iMMMIC62
         UobVsSTzAbakiBvtBE90dTpOwOdkIeI4YXFHDoTWypsSWpsAWAFlLI7Vxx83Jz1MW/eN
         gjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uttp4vOkM+/baqKSSnPBZvGpPMv4+onHC8rB64mwEHM=;
        b=JQqMVg03t0wDBxpD+OcXKME7JLoAkR0rlW6U9hSghcWd0PMDzJ4AjkaTZGkzauTMBW
         Fc60l1FRtd3vJuEj1MxMyy6aD7P6KXxbzF5orkJDsbZV+sSzb28SgcUKcnsjkSqmqjTi
         yLenHAmfKS3O+ecHwb+uEB9+WlvWqavvfQ0syU3DRSjZ8Ms0S+cfSLj8/GcKb8/Geapz
         kn7QT1+7J2ePexqVDAfsfzQn3gIFHGt2kZFxa3qkASUpIs1mGqBqEjPKpJiAB9t0h+Nt
         LBPTNJ8IBB/OuKfbP5zW2EKjxJLNeQgZ6AY27gmUOlv8n6OG1qm1GvAJHNqOf7uoUWLa
         lZQg==
X-Gm-Message-State: AOAM530My46WNEQWCww1lxKuwLslcwD7oC1iJBPah3ryvA9pg4ukMhml
        xGR/qykY4z0gmX2m80NYYK0DBDkWZ59qbDwk
X-Google-Smtp-Source: ABdhPJxtYMNtl9/cF7y0rwhATCNWCrkuoiUc652hvJyUmJ5Yf/Om0q8f1X7M1kZ+x1hrWEL6mxWMuA==
X-Received: by 2002:a63:4766:: with SMTP id w38mr7437263pgk.104.1634271296955;
        Thu, 14 Oct 2021 21:14:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lb5sm3972651pjb.11.2021.10.14.21.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 21:14:56 -0700 (PDT)
Message-ID: <61690040.1c69fb81.2d884.cfc9@mx.google.com>
Date:   Thu, 14 Oct 2021 21:14:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-10-14-v5.15-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 191 runs,
 5 regressions (renesas-devel-2021-10-14-v5.15-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 191 runs, 5 regressions (renesas-devel-2021-10-14-=
v5.15-rc5)

Regressions Summary
-------------------

platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =

beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig =
          | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
          | 1          =

qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-14-v5.15-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-14-v5.15-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a4201b7c5b9316d0d22476708aea607cdfa47515 =



Test Regressions
---------------- =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c609a38291d411335900

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c609a38291d411335=
901
        failing since 23 days (last pass: v5.15-rc1-564-ge23d26d2dc9a, firs=
t fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c8b16622bd525e3358f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beag=
le-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c8b16622bd525e335=
8f2
        failing since 80 days (last pass: renesas-devel-2021-07-19-v5.14-rc=
2, first fail: renesas-devel-2021-07-26-v5.14-rc3) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c64d5aa6ff0cc63358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c64d5aa6ff0cc6335=
8dd
        failing since 330 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c65de23f1885be335905

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c65de23f1885be335=
906
        failing since 330 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6168c64299d39265d83358ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6168c64299d39265d8335=
900
        failing since 330 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
