Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC2F383B8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 19:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbhEQRp4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 13:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbhEQRp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 13:45:56 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26713C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:44:39 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso63345pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9TygD2MmJlkwHlSW19IYI9X+CHmHz+crpSG/njIjOJg=;
        b=UzqDMceLFJmKO3YbG8oBl7T+yzwd1s3TQCfLxqesLxVx0TKs0abV4/cudUQPfSDoZ5
         CP7Kp83TMkMmTdYUTncmlKIrAWZSvohDL94evReoM3BwivTuM008KMrEcy2MKmH9Z3pA
         vJHK4fYWB/aOO2TzhShYpbQKaotg/AQfoJywqnZakqFpqr1AQfAJU++Bk0kR/9dufN/1
         YA9TF9LGjdGWq7aupcOToGocj/z1vEEZMVo5USwFZ9+Y4J3Atc5Llkxo4keESw0VAtly
         nHWxLgTGyVokX3HXIECHXPH7Li7630EqbkLDrS3UdaD3JeoF7QWFWdq207qfXgJPiVJu
         P5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9TygD2MmJlkwHlSW19IYI9X+CHmHz+crpSG/njIjOJg=;
        b=FSagJRtdT0U1sFeib8Y6l36+5MAZ9r7hJg/DCnLt6TUSh4cop/idxc2Pu3hf5W/MrM
         EniywLkmGbDiS12YgS/t7aWj4ZqmBOSjt5TWpnsSiWhgM+0xdhUMeOcLcSxVRj+7/xCy
         Q6Oa7GSue7s9RJmmKMI1AuG9Vw0QIFqe9nGjt1DuK8Fvrl7aNK9MCuS9qLKfo+54PE/z
         LKFAS5hhOhlOw8VebRD75/VgbHBJtjZReaPDCKQiQo3RSro9rJtObezRSFfHKdNZ5ehH
         agXpL13tIWUBKISUwpcsHAoEQMg5SYzevu5G8GqFVtn/O2SXhytlMcjmc+qmxA3jsk9l
         vZ/A==
X-Gm-Message-State: AOAM531xZTLsbTFgWoJ0ZTIwJEvz8XTg+ECbxI/c5XnMxqAyAUVqWf4v
        tpIOvkW58J2wsTT0XMKrevodFNIsw4o7KUXT
X-Google-Smtp-Source: ABdhPJzY24rPEG7R2MFDonk2K8DbViwjWeOG6SKPc5TqS8J25m7ugHkCJRLhciurZULSgJ3uAcQLRQ==
X-Received: by 2002:a17:903:4106:b029:e9:244f:9aca with SMTP id r6-20020a1709034106b02900e9244f9acamr1042201pld.58.1621273478475;
        Mon, 17 May 2021 10:44:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v21sm10943250pgh.12.2021.05.17.10.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 10:44:38 -0700 (PDT)
Message-ID: <60a2ab86.1c69fb81.7b35d.4935@mx.google.com>
Date:   Mon, 17 May 2021 10:44:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-17-v5.13-rc2
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 238 runs,
 6 regressions (renesas-devel-2021-05-17-v5.13-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 238 runs, 6 regressions (renesas-devel-2021-05-17-=
v5.13-rc2)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-17-v5.13-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-17-v5.13-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9febaddc47f6accce3d4acf45821a8c948e47549 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60a27a10c371b7b16db3afc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp=
/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a27a10c371b7b16db3a=
fc5
        failing since 5 days (last pass: renesas-devel-2021-05-10-v5.13-rc1=
, first fail: renesas-devel-2021-05-11-v5.13-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a272eae739037d71b3af98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a272eae739037d71b3a=
f99
        failing since 180 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a272f8f795b44acbb3afa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a272f8f795b44acbb3a=
fa4
        failing since 180 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a272ea823a9492dfb3afc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a272ea823a9492dfb3a=
fc9
        failing since 180 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60a279180575511b64b3af9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip=
/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip=
/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a279180575511b64b3a=
f9e
        new failure (last pass: renesas-devel-2021-05-11-v5.13-rc1) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60a278b420ed285713b3afb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a278b420ed285713b3a=
fb6
        new failure (last pass: renesas-devel-2021-05-11-v5.13-rc1) =

 =20
