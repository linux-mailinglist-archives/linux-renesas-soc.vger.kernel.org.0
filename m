Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEA23C79E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 01:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhGMXFS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 19:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235536AbhGMXFS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 19:05:18 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4D1C0613E9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id j3so200440plx.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zqzs18Nc2umKrr6WE5SIkj7t++i9626lG+6Bt8nFGYY=;
        b=DdgHhXmWeBqWjFSYz0FeCLHplrj2+4cVFB4Cw+Ik+GjJTogLOQVmVULGoEQaRCKRqs
         x8MuTAqHMtlSBA11oVpDl6WE/CKCpzoB/6EEGIYQPDirieuhnEYDBM378vA6ZYMdAQ/t
         EdkoZjFOIzY+AZAT+m9xysIGj46Na/pKdss53iL9xmd5GSL2ElvpMR6XreKC8J6av5gk
         pMG5laJWlRKRYneGufqnLTRdADKVMb/N3Fand34of1GYVDLfUBNczQ6wypNeSgAMOrh+
         ty3/uHwQ5+N0xlkYNx452JdDDlZD1sfUq7wUlodaYtsoQngARwlZ9DyfyNhXnrNsQPvn
         w2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zqzs18Nc2umKrr6WE5SIkj7t++i9626lG+6Bt8nFGYY=;
        b=AvSgk0Lo+zLaHRoK4It1tLrnuN/qI+iyTBUoLXVSpYwy3V2p17zi9EJCJOEY6o+/SH
         Efrns49fkCRPeIGbFytliA+E6+Njr4dakwFTnWbjHqJvr2JIaEngj7TrNZfuKNRVKitJ
         bPoZ//Slvy25xxlSeISyQ0vdf+weXTsO3Cw+6TpR4lu8dfbzJhaZP2EjHm4252qVY2vD
         KLZLJTS2sQAUdy+XcRVMKEqsvP50zmB4jD4B2V47k0SAaAssC3b6kEhtOX2n6fLAdSP7
         rf02Bfcfoc1okutYYO0jL5dRwZ4w4QK8MYVvWs7yMIefEYud8Gbl2GjOc+zNhThv0iox
         pXRg==
X-Gm-Message-State: AOAM533p6u6637URJeG6chYv4/n4h1jWsGpC9YEn+KRnmeyTrwukYaOD
        W93q+hB1nnq9l/9f/1ckALoAbrFQjOIFXY0k
X-Google-Smtp-Source: ABdhPJyvktd2ST+VU0fFFcH5TMA0+k/uSa9dlBR7nTPplk8sCYaDJ5wS8NtDTfyDyJ5lvas5v+HNug==
X-Received: by 2002:a17:90a:6f63:: with SMTP id d90mr612817pjk.120.1626217345866;
        Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t10sm164954pgv.52.2021.07.13.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
Message-ID: <60ee1b81.1c69fb81.3cf5f.0f3a@mx.google.com>
Date:   Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-13-v5.14-rc1
Subject: renesas/master igt-kms-rockchip: 2 runs,
 3 regressions (renesas-devel-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 3 regressions (renesas-devel-2021-=
07-13-v5.14-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 2          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-13-v5.14-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81b7948a0be3dc48ef04d01b16c08dc3b460bce2

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  9cef5dee3cd817728c83aeb3c2010c1954e4c402
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  cd63c83e23789eb194d38b8d272247a88122f2f6 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 2          =


  Details:     https://kernelci.org/test/plan/id/60ee0f997d80a7f4378a93a4

  Results:     91 PASS, 4 FAIL, 140 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210709.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60ee0f9a7d80a7f4378a942a
        failing since 64 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-13T22:09:41.938750  Pipe F does not exist or not enabled
    2021-07-13T22:09:41.956572  <14>[  156.627511] [IGT] kms_vblank: execut=
ing
    2021-07-13T22:09:41.970348  IGT-Version: 1.26-gcd63c83 (arm) (Linux: 5.=
14.0-rc1 armv7l)<14>[  156.633749] [IGT] kms_vblank: starting subtest pipe-=
A-ts-continuation-suspend
    2021-07-13T22:09:41.970700  =

    2021-07-13T22:09:41.970990  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-13T22:09:42.063539  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-13T22:09:42.103917  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-13T22:09:42.104413  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Jul 13 22:09:58 2021
    2021-07-13T22:09:42.122820  <6>[  156.795386] PM: suspend entry (deep)
    2021-07-13T22:09:42.123295  <6>[  156.799924] Filesystems sync: 0.000 s=
econds =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.invalid: https://kernelci.org/test/case/id/=
60ee0f9a7d80a7f4378a9443
        failing since 0 day (last pass: renesas-devel-2021-06-22-v5.13-rc7,=
 first fail: v5.14-rc1-477-g3c037963715c)

    2021-07-13T22:07:53.315380  [1mSubtest invalid-clone-single-crtc-steali=
ng: SUCCESS (0<8>[   63.146914] <LAVA_SIGNAL_TESTSET STOP>
    2021-07-13T22:07:53.315626  .000s)[0m
    2021-07-13T22:07:53.351707  <8>[   63.188421] <LAVA_SIGNAL_TESTSET STAR=
T kms_vblank>
    2021-07-13T22:07:53.383220  <14>[   63.213392] [IGT] kms_vblank: execut=
ing
    2021-07-13T22:07:53.383469  IGT-Version: 1.26-gcd63c83 (arm) (Linux: 5.=
14.0-rc1 armv7l)
    2021-07-13T22:07:53.388641  <14>[   63.220107] [IGT] kms_vblank: starti=
ng subtest invalid
    2021-07-13T22:07:53.394001  Starting subtest: invalid
    2021-07-13T22:07:53.407402  (kms_vblank:505) CRITICAL: Test assertion f=
ailure function inval<14>[   63.235036] [IGT] kms_vblank: exiting, ret=3D98
    2021-07-13T22:07:53.407625  id_subtest, file ../tests/kms_vblank.c:484:
    2021-07-13T22:07:53.419738  (kms_vblank:505) CR<8>[   63.248532] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dinvalid RESULT=3Dfail>   =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0965a6a87f474a8a93a8

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210709.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60ee0966a6a87f474a8a942f
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T21:43:18.231195  <6>[   79.474872] Console: switching to col=
our dummy device 80x25
    2021-07-13T21:43:18.235715  <14>[   79.481561] [IGT] kms_vblank: execut=
ing
    2021-07-13T21:43:18.251243  IGT-Version: 1.26-gcd63c83 (aarch64) (Linux=
: 5.14.0-rc1 aarch64)<14>[   79.488531] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-07-13T21:43:18.251571  =

    2021-07-13T21:43:18.257147  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-13T21:43:18.329231  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-13T21:43:18.359442  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-13T21:43:18.367112  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Jul 13 21:28:40 2021
    2021-07-13T21:43:18.379022  <6>[   79.624783] PM: suspend entry (deep)
    2021-07-13T21:43:18.383681  <6>[   79.629177] Filesystems sync: 0.000 s=
econds =

    ... (126 line(s) more)  =

 =20
