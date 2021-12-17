Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C088C4792FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 18:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbhLQRl1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 12:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236210AbhLQRl1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 12:41:27 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121B1C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 09:41:27 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so3904184pjj.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 09:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X767JRjj9+qVtrzN8/WiDaS7naLKJxDW8RaeYaCOYos=;
        b=p/2SPcF/ops+UkPjD1JqFEVD7uAfrdlneEI2FRl8GYwaFa0y3n2XOkPwQx4lPZOpGP
         SIWByVgXbPESlPtzLs7OjUC50I4CoE/Cv1M7yW9B+O0hLPCtxX/P6Cq7KbER6csBzNyW
         8MNy6TAARSfl9s1uxfWcQCp9ZIzbV3NUMtus8Bs3TS+DlhBl/tCUrxHZDb530Q4jaSOM
         6XghgH7iyaSZa9dB2T4znhN+lPMLwGfVdBZ5LINJmvl2qR3zWpH4zWC2zI2wOEIDu4uL
         /gCTGIrYiBbhJ+Og0Q8JP72lp8uy5bb+ApxAcQWzqfL9vDAZMAc00M5udeqq3ODTAkT3
         QsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X767JRjj9+qVtrzN8/WiDaS7naLKJxDW8RaeYaCOYos=;
        b=RlKNhs4O076eiqzIGK4ZGvZoZTd2lgBkTC8bpB6lgGZTPgtl/jm7puLuFsqKBYVS1Y
         Xxc7gsQl2fbaS7VoqecqKbn76V5/DEuD8kzLOqITpE7r5mV+49Rg/Q24HyS6GuONssAi
         TI2PAn75ZvAVMKmIWwSg3cdoAR+yIei8zuTXp/SktO+0N4l13A4eB8gKKMrokon1nB0g
         21IPhTbNSFva5/jFibUPyOZDcZAZ9Wriltlq7qtLowg0uQLSnYISYpnKz4QHdPGr6/QU
         +ShaZaiqrTeg53zMSe3LSSomliE0+VpHaymSuxIDSgKy7Uex7QjJKjJ78fJ+Bi7JVbJZ
         q3Cw==
X-Gm-Message-State: AOAM5300ja4i9amSGOfmeDHQhhkzcMbsHNTCmrwta3iYdx0nGHMBCaTk
        MS+vbQFmKya3P9sy1mNq2G9XPE+ELzj8tWkY
X-Google-Smtp-Source: ABdhPJyKHQe8yrsRyHdeWxUccsR8lrjqN25UIYgnBqnFe6jRjqq/A0IzANX67bk9s0O/R1uQ9FFQcA==
X-Received: by 2002:a17:903:234a:b0:148:a94a:7e3c with SMTP id c10-20020a170903234a00b00148a94a7e3cmr4088541plh.121.1639762886354;
        Fri, 17 Dec 2021 09:41:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f185sm10116625pfg.39.2021.12.17.09.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 09:41:26 -0800 (PST)
Message-ID: <61bccbc6.1c69fb81.d1ba9.c122@mx.google.com>
Date:   Fri, 17 Dec 2021 09:41:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-17-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 381 runs,
 6 regressions (renesas-devel-2021-12-17-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 381 runs, 6 regressions (renesas-devel-2021-12-17-=
v5.16-rc5)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15        | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
config+crypto    | 1          =

bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-17-v5.16-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-17-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9aa3a08281f795eec94a1d7ee8c48ed7dec31a7c =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15        | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc92fc94151c9f59397173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc92fc94151c9f59397=
174
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc96dc345ec8934239718c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc96dc345ec89342397=
18d
        failing since 31 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc9084621d80d2433971a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/la=
b-collabora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/la=
b-collabora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc9084621d80d243397=
1a2
        failing since 0 day (last pass: renesas-devel-2021-12-14-v5.16-rc5,=
 first fail: renesas-devel-2021-12-16-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc923c9536a97d9139716d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc923c9536a97d91397=
16e
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc93e1439918112f39717f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/bas=
eline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/bas=
eline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc93e1439918112f397=
180
        failing since 2 days (last pass: renesas-devel-2021-12-06-v5.16-rc4=
-15-g9f95ae4ce1f1, first fail: renesas-devel-2021-12-14-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc950b4e4ee69375397135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-ba=
ylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-ba=
ylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc950b4e4ee69375397=
136
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5) =

 =20
