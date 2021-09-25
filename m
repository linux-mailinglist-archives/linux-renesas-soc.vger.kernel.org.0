Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4237E418246
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 15:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245152AbhIYN20 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 09:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245082AbhIYN20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 09:28:26 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEEDC061570
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 06:26:51 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id x8so5627156plv.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ClqtxxRkvjW29NnCvUEypQN48k64jkP0NbPSa/VTuRY=;
        b=cnNDmUE6LMjZv4exOCaBe4F7DOL4yZd7pmoL5C9bIA4LklYVS70NgGM9gfnOCwItT+
         jwQcNm919B/7IWAeJ7MZFKlkQ+VvNDNUaskeKIF07whEffW9B6W2cxHwnbUWKdrkB/yu
         R0UdR9g4JIarTaAT9QZ9qBVdGJZZtfRW3pZ3OWmGzpVgZWurKR4HS+xRbBwlu79Xs6/T
         5xiqjsIwly+/cetyY1vrJbDEl6yoooV01eB8K0SInjzn4MWZHt24GKfxOogE8HTpYJHz
         ZINfun5dA+dJhxFZ0O1e5X94tpdYsouXnPBCujakvnYlCfVondk40cq7xvKhlmYjR978
         QdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ClqtxxRkvjW29NnCvUEypQN48k64jkP0NbPSa/VTuRY=;
        b=ZqoSuGOrH5Mh8MhHqjIZGaOmD67nrDPDUFwLTt3ZKZ29AAC1iWoWkmAl+sY/y3myZv
         FTUsiIyKuPhN+tAdD4QqoZRDx9RDl79OBAENgEIH3feRUt9OjQPyNEIqB7ShIhdYcmlO
         ciLppUxH4Kd5hT6GFRY2npqve3EHHwyxlSK7rQRJKusZiBwRm00Z+hf/G7rLli2rXwU2
         ff7X+RIebH9gBUZ7BCCODEm0OH88bz9wFFs/pdLdT5eJyp0FqM8PsogubxU9TpdB0jcP
         4q7uo1Biv5+X5JH4+FdJ3QMbu5EnYOsobNsCObgOKWBiAALYzAvV29LGCYqhicQzAph6
         awxw==
X-Gm-Message-State: AOAM531jRpjDVuCs2D80p7DRN5jEMwZ/wDHyQxkn351JhiefmdBqDLIT
        LWM3m1OKiQKyqYQvTFZ2fdfKDBQRGV7fWqc1
X-Google-Smtp-Source: ABdhPJw/m+WdFLFZiEWudn4aSjpZEe1tU+QSOGQKXgWypXLmDMT6rOfuZzQX4bYabudbdWtWREVbUg==
X-Received: by 2002:a17:90b:4d07:: with SMTP id mw7mr8048312pjb.66.1632576411140;
        Sat, 25 Sep 2021 06:26:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w18sm12661005pff.39.2021.09.25.06.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 06:26:50 -0700 (PDT)
Message-ID: <614f239a.1c69fb81.9709e.5ea5@mx.google.com>
Date:   Sat, 25 Sep 2021 06:26:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-24-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 27 runs,
 8 regressions (renesas-devel-2021-09-24-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 27 runs, 8 regressions (renesas-devel-2021-09-=
24-v5.15-rc2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+cr=
ypto    | 1          =

odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig   =
        | 1          =

odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+im=
a       | 1          =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+cr=
ypto    | 1          =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig   =
        | 1          =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+im=
a       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-24-v5.15-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-24-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2c0b11dd6f8ce5c74e91b71a38505ae9088bf68c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+cr=
ypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/614ee2996887597f3099a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/basel=
ine-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/basel=
ine-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ee29a6887597f3=
099a2ee
        failing since 3 days (last pass: v5.15-rc1-564-ge23d26d2dc9a, first=
 fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig   =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/614ee75cce0c431f0a99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ee75cce0c431f0=
a99a2e9
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614ee81774aa203eb199a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ee81774aa203eb=
199a2db
        failing since 3 days (last pass: v5.15-rc1-564-ge23d26d2dc9a, first=
 fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+im=
a       | 1          =


  Details:     https://kernelci.org/test/plan/id/614eeb4b176cc924c099a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614eeb4b176cc924c=
099a2e6
        failing since 43 days (last pass: renesas-devel-2021-08-10-v5.14-rc=
5, first fail: renesas-devel-2021-08-12-v5.14-rc5) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+cr=
ypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/614ee2b0a45ce98d5999a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/basel=
ine-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/basel=
ine-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ee2b0a45ce98d5=
999a2dc
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig   =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/614ee84374aa203eb199a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ee84374aa203eb=
199a2ec
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614eeb70e5beb94e2899a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614eeb70e5beb94e2=
899a2e6
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+im=
a       | 1          =


  Details:     https://kernelci.org/test/plan/id/614ef05be87aea21ba99a2ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ef05be87aea21b=
a99a2eb
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =20
