Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44413D85B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 03:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbhG1BzH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 21:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbhG1BzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 21:55:07 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945EAC061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 18:55:06 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id i1so782396plr.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 18:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=in2ylCeXMy2UppjsAR7igh9cQ4Ihs++V4KNFk+0lCgs=;
        b=uDkePB8OKAjC+NP6v/TGXAtEMYgscMkJsuqvQBQIwAolGarR3w4Ce7hbtH4N8mC/Z0
         XljXlqLMDCdFmlHSqfSMghS8ldY420jbMYZGxpUFa195KcwxIP9qSKn/whkXVWUBxxGW
         +0r6JJItIkK6fRPr8Ro7QT+35xK239Ttl9WM+PqYovu4VEfXbjI2tUU3r6q0K5v07Lma
         DOlYbiYsvvK4C3P0v+DDCYxn3RpJnOcKWz/3eT9XYXNj5+DFQ3gCJOSRmdTpUjdtvMOS
         49EyXG2bYSwy1iRliqa5O+gpay/j6A1Xb4FdK4eYszC+1Xx9C/p6yaJYAov43fFc4BqE
         Te3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=in2ylCeXMy2UppjsAR7igh9cQ4Ihs++V4KNFk+0lCgs=;
        b=Ifw56j+hvYjvnFTvF4EyjH6mlBWdE4fAlD7uY9IeGoeUVwwLKmk4ilz3CpgX2s40jA
         1Y2ThHgNnFKwpkph8Uidqb6HFvO3rUAEW8p4SnX7pw8CwxgjzBQM6B9o0W0PQpcPetdC
         kLphjN7P7mFc590CCzat1cn0UiB5RDi2g/qkAIhVlhgAdTSyEKVul0vMMravGtPLN6uT
         f7AoIQJdxjWGgmQ5rHvK/PGUsEd8wcBtuOkY3zvVsuYwgsV3pFMi47vqPwmJh29szC2Z
         2ScB/E0YaFM2G9e+GU12XZfrjcMBFELmztcUk+VEMgJEKiIen/A2r4OTUUTpG/JpgpNx
         jk5A==
X-Gm-Message-State: AOAM533jSjJUAyueJdgYf7Slt7mV1UzD6KmNPims8GulQ2VmOR8/w+4M
        5XIoGmWya+oMqhQJ2iO4JaY+J/aOKtVlcJAR
X-Google-Smtp-Source: ABdhPJxrRrV8zTrcH1Zj8nY/fz6LsXr8qnNwEmA2JOjlMVc3yIYTAjBUM/+AIQyVXfqEDmfus/fg3Q==
X-Received: by 2002:a63:4a43:: with SMTP id j3mr26481777pgl.302.1627437305883;
        Tue, 27 Jul 2021 18:55:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y7sm4197474pjb.52.2021.07.27.18.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:55:05 -0700 (PDT)
Message-ID: <6100b8f9.1c69fb81.607bb.e3f4@mx.google.com>
Date:   Tue, 27 Jul 2021 18:55:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-07-27-v5.14-rc3
Subject: renesas/master baseline-nfs: 59 runs,
 4 regressions (renesas-devel-2021-07-27-v5.14-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 59 runs, 4 regressions (renesas-devel-2021-07-=
27-v5.14-rc3)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
hip07-d05           | arm64 | lab-collabora | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-27-v5.14-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-27-v5.14-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f9fff2ace3df79f0bd941471e986f0890eb3a5de =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
hip07-d05           | arm64 | lab-collabora | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61009ee2547bc73e255018e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61009ee2547bc73e2=
55018e9
        failing since 14 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61008da9f59398a8765018f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61008da9f59398a87=
65018f6
        failing since 8 days (last pass: renesas-devel-2021-07-13-v5.14-rc1=
, first fail: renesas-devel-2021-07-19-v5.14-rc2) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6100887c37e2c4398b5018e5

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6100887c37e2c4398b5018eb
        failing since 14 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-07-27T22:27:53.755884  /lava-4262307/1/../bin/lava-test-case
    2021-07-27T22:27:53.793175  [   45.520278] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6100887c37e2c4398b5018ec
        failing since 14 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-07-27T22:27:52.675082  /lava-4262307/1/../bin/lava-test-case
    2021-07-27T22:27:52.709341  [   44.436430] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
