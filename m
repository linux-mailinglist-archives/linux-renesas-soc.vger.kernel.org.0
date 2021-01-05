Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F173E2EAB37
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 13:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbhAEMvi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 07:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbhAEMvi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 07:51:38 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC500C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jan 2021 04:50:57 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id lb18so1615347pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jan 2021 04:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NWaqTURHuVKqqY/N2pwmclkcNs2QehRRMnYszisQEnQ=;
        b=zYmL2X70N+kI773fSy1ZodWzsBXy6T/ySYXheun0/Ri9AtK21J/cuzDigTx3hEyWsh
         DKM1JdhgQWwt0Q+xfJPMZNHFN4S291yYiFlWQCnUyGv35t5oGOula/pl+cpPgQa6p+Pg
         xBwOdjz0Z75DO7agAEdyC16Sb71so9zAD4nWu5u2EEvtL9QA8xL9hO5fj8sPYwc+kEqV
         11nch0LqdRn2oIlL1gn/Z/if1InON+Xq6LAGJ4IpKE3wOMxtf8F4YrtujhfXruwIjmIs
         KowODSm/n7Wf4JVyzshHW9kk1Ii2qccx89RI17+lIr/qpbSNIKNp96aDut/7yoSb3GBp
         OW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NWaqTURHuVKqqY/N2pwmclkcNs2QehRRMnYszisQEnQ=;
        b=iqhNoqsaaSzdGPu3/0TvN8TyahwAR3QP3bQ6Ko8MNn9iPc/xmA+hUPLlkOTmRaH6Tu
         GDkWT+xC7IqE5NFvNK6nfFaV4EjUjDhRap30RYoOBeMpibnMJas+7ZwP2QAlhCshEKWm
         dJQ784SWTlOlcoGngFhUZwr/dRtz7OaWXRjEHjA3nZmj4G4p6yKss1VLrAemVcQGUffC
         yVrKfSnLYjNDFzYA/5TCr+XsjVbJeJVaZ8YIk4G2IN/75oo1KpS33/aP/JNBcuPySiq6
         Ff/cJ37MGdWGYwGt93bAjnT/ewaHvToCPv4CAx7DZAfGQU80pYYFj1zBlEMImzRd3Gkj
         Y8Uw==
X-Gm-Message-State: AOAM533aNOv2/IxaI8+BHyoxGXKHAs8oqUapsYuIdRzqj7+s+5tJ1nK9
        tdKbtFNvEvm+7N3YhFAQUWM+E4RupcLPVQ==
X-Google-Smtp-Source: ABdhPJydp83sLUfEU36QWwXE+GX7HpJbEeZYWn/QcZ3owwXc/k4UvCqil+kPk+ESP2tdQLZiJoGR3g==
X-Received: by 2002:a17:90a:72c8:: with SMTP id l8mr3949572pjk.232.1609851056954;
        Tue, 05 Jan 2021 04:50:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x1sm57231058pfc.112.2021.01.05.04.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:50:56 -0800 (PST)
Message-ID: <5ff460b0.1c69fb81.6891e.12fa@mx.google.com>
Date:   Tue, 05 Jan 2021 04:50:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2020-12-28-v5.11-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 240 runs,
 10 regressions (renesas-next-2020-12-28-v5.11-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 240 runs, 10 regressions (renesas-next-2020-12-28-v5=
.11-rc1)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6sx-sdb                 | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6sx-sdb                 | arm   | lab-nxp       | gcc-8    | multi_v7_de=
fconfig           | 1          =

imx6sx-sdb                 | arm   | lab-nxp       | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2020-12-28-v5.11-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2020-12-28-v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b8e76cdb157494770d8feee237222a511468c788 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff458550cc303e08bc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff458550cc303e08bc94=
cc9
        new failure (last pass: renesas-next-2020-11-30-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6sx-sdb                 | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff45858e99642cfdec94cbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff45858e99642cfdec94=
cbc
        new failure (last pass: renesas-next-2020-11-30-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6sx-sdb                 | arm   | lab-nxp       | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff450d8cdcef5cb11c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff450d8cdcef5cb11c94=
ccd
        new failure (last pass: renesas-next-2020-11-30-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6sx-sdb                 | arm   | lab-nxp       | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff45279bafac3b495c94cf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff45279bafac3b495c94=
cfa
        new failure (last pass: renesas-next-2020-11-30-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff450d6a067fba944c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff450d6a067fba944c94=
cc7
        new failure (last pass: renesas-next-2020-11-30-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff451b4abf31024fac94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff451b4abf31024fac94=
cc8
        new failure (last pass: renesas-next-2020-11-30-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff44edae0bf435325c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff44edae0bf435325c94=
cce
        failing since 42 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff44ed7e0bf435325c94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff44ed7e0bf435325c94=
cc8
        failing since 42 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff44edee0bf435325c94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff44edee0bf435325c94=
cdc
        failing since 42 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff4556bf1f125e452c94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-12-28-v5.11-rc1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff4556bf1f125e452c94=
cd0
        failing since 42 days (last pass: renesas-next-2020-11-10-v5.10-rc1=
, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
