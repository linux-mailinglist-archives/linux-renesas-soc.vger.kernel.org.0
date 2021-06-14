Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A213A6999
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 17:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhFNPIV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 11:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhFNPIV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 11:08:21 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ADAC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 08:06:04 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id t17so8877630pga.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+t9aBdbZvRXhuXnJzTKjQEIJYvOt4sCv5CeqfPgebdw=;
        b=nORk234Tx+p/YQ+tNiHDFDeg3sZrrxB3GXmjFLHwOERE371zliuPlKMNfs4cIjrpue
         sFCzCjpaw+fe4Sy3dpZvR0UgJhbW2d0JX34D2tp19LZHhaJEMLaaB9nwkHHSGgIYl12A
         pOjhH44myEoge9+pBW5sr5t6zYdcDOIKxlQsFiQLVrT51qkjDedkELYZj1BF5i6AE9Ky
         +v0P268Uvg3hJL0qDUCAZtFKzVrJsUYw7JnHLMr0uEkP7/X/Y80/px8bhraP960nK0Gl
         NDm2r1oAxKUpXuUKYTlmIwCOESCFHNXb07Az3I+ZAKOHwUdbiN7wAICxbI1LpA+wreaJ
         Rmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+t9aBdbZvRXhuXnJzTKjQEIJYvOt4sCv5CeqfPgebdw=;
        b=i4tBcFPyFSYJjSRpe9zriH3e3SPdJ5VE+JI1sVGBDnk9KOxnnk/LNE6rowopb9KFQx
         hVcMFJpJOYj0pqLR6VXIXi0z2KNZAfIpXeFSk0B34n0ZSZB0XnyVSx6GliYhHScfNg8O
         DVRTUpPXD/r0yolAW4+en7m0vhM8LdNvuRCWp3gKvSG7L92rzj2CT03MBPAI/dGuNQ6z
         LNjrnMgogucVX3FgQ/khjmae7vsAMiu9nVSwCW8JyX9iWOHnSkI3JovDAKXIJ8GJVHiO
         OXe5snP9k3+r9VTXr8DzQHjRjJXdRU+NGZtNIg6MPvR/TdCtn2NZHO0Qwg9C5qFyEGw3
         5jVA==
X-Gm-Message-State: AOAM533OwhO3yBlpHxr0NFJ1r0zwGZS0i5EVQbTT87s2OQJDS68NaaAb
        ihFsebA1a35QDv7E5mobFBwMS7WPOEZNQ8h+
X-Google-Smtp-Source: ABdhPJyaHqjwx9wl/huFAITpc6uEYPp8og6eQrMlwJEluCaJ6iUOP88W0CZQhDKjGY+ohno/868t8Q==
X-Received: by 2002:a05:6a00:d44:b029:2ee:12e1:5781 with SMTP id n4-20020a056a000d44b02902ee12e15781mr22083756pfv.75.1623683163523;
        Mon, 14 Jun 2021 08:06:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n6sm5007926pgt.7.2021.06.14.08.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 08:06:03 -0700 (PDT)
Message-ID: <60c7705b.1c69fb81.4d2be.d54a@mx.google.com>
Date:   Mon, 14 Jun 2021 08:06:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-06-14-v5.13-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 2 runs,
 4 regressions (renesas-devel-2021-06-14-v5.13-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 4 regressions (renesas-devel-2021-=
06-14-v5.13-rc6)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-14-v5.13-rc6/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-14-v5.13-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      62ebef21d49093d77b84633283806c94630e3694

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4c8365183ec52e9309ecae45c725aa315562854d
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  8eeb9c130e75d4063d0dc2ed69c8acde66b6b5d0 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/60c76c13052d146e1841f557

  Results:     90 PASS, 3 FAIL, 37 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60c76c14052d146e1841f5c8
        failing since 34 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-14 14:41:31.968000+00:00  <14>[  168.647572] [IGT] kms_vblank: =
executing
    2021-06-14 14:41:31.986000+00:00  IGT-Version: 1.26-g8eeb9c1 (arm) (Lin=
ux: 5.13.0-rc6 armv7l)<14>[  168.653412] [IGT] kms_vblank: starting subtest=
 pipe-A-ts-continuation-suspend
    2021-06-14 14:41:31.987000+00:00  =

    2021-06-14 14:41:31.987000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-06-14 14:41:32.044000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-06-14 14:41:32.078000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-06-14 14:41:32.078000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Mon Jun 14 14:41:48 2021
    2021-06-14 14:41:32.097000+00:00  <6>[  168.772244] PM: suspend entry (=
deep)
    2021-06-14 14:41:32.097000+00:00  <6>[  168.776622] Filesystems sync: 0=
.000 seconds
    2021-06-14 14:41:32.111000+00:00  <6>[  168.782366] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (106 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 3          =


  Details:     https://kernelci.org/test/plan/id/60c75cbc2bcfa82ca1940f50

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/60c75cbd2bcfa82ca1940fd6
        failing since 7 days (last pass: renesas-devel-2021-05-27-v5.13-rc3=
, first fail: renesas-devel-2021-06-07-v5.13-rc5)

    2021-06-14T13:41:48.559928  >pipes[pipe].enabled)
    2021-06-14T13:41:48.563129  Pipe D does not exist or not enabled
    2021-06-14T13:41:48.570605  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2094:
    2021-06-14T13:41:48.578825  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2021-06-14T13:41:48.582824  Pipe E does not exist or not enabled
    2021-06-14T13:41:48.594562  Test requirement not met in function igt_re=
quire_pipe, fi<6>[  155.384568] Console: switching to colour dummy device 8=
0x25
    2021-06-14T13:41:48.596859  le ../lib/igt_kms.c:2094:
    2021-06-14T13:41:48.605740  Test requirement: !(pipe >=3D display-><14>=
[  155.395611] [IGT] kms_vblank: executing
    2021-06-14T13:41:48.609788  n_pipes || !display->pipes[pipe].enabled)
    2021-06-14T13:41:48.620091  Pipe F does not exist<14>[  155.407290] [IG=
T] kms_vblank: starting subtest pipe-B-ts-continuation-idle =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/60c75cbd2bcfa82ca1940fd9
        failing since 97 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-06-14T13:41:52.904968  <6>[  159.698580] Console: switching to col=
our dummy device 80x25
    2021-06-14T13:41:52.909783  <14>[  159.705276] [IGT] kms_vblank: execut=
ing
    2021-06-14T13:41:52.925317  IGT-Version: 1.26-g8eeb9c1 (aarch64) (Linux=
: 5.13.0-rc6 aarch64)<14>[  159.712594] [IGT] kms_vblank: starting subtest =
pipe-B-ts-continuation-dpms-suspend
    2021-06-14T13:41:52.926326  =

    2021-06-14T13:41:52.930769  Starting subtest: pipe-B-ts-continuation-dp=
ms-suspend
    2021-06-14T13:41:53.870917  (kms_vblank:784) igt_kms-CRITICAL: Test ass=
ertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:4526:
    2021-06-14T13:41:53.880592  (kms_vblank:784) igt_kms-CRITICAL: Failed a=
ssertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-06-14T13:41:53.887318  (kms_vblank:784) igt_kms-CRITICAL: Last err=
no: 22, Invalid argument
    2021-06-14T13:41:53.889198  Stack trace:
    2021-06-14T13:41:53.894064    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/60c75cbd2bcfa82ca1940fdb
        failing since 97 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-06-14T13:41:57.091298  <8>[  163.880314] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-B-ts-continuation-suspend RESULT=3Dfail>
    2021-06-14T13:41:57.125070  <6>[  163.919120] Console: switching to col=
our dummy device 80x25
    2021-06-14T13:41:57.130580  <14>[  163.925847] [IGT] kms_vblank: execut=
ing
    2021-06-14T13:41:57.146163  IGT-Version: 1.26-g8eeb9c1 (aarch64) (Linux=
: 5.13.0-rc6 aarch64)<14>[  163.932827] [IGT] kms_vblank: starting subtest =
pipe-B-ts-continuation-modeset
    2021-06-14T13:41:57.147442  =

    2021-06-14T13:41:57.151382  Starting subtest: pipe-B-ts-continuation-mo=
deset
    2021-06-14T13:41:58.091041  (kms_vblank:790) igt_kms-CRITICAL: Test ass=
ertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:4526:
    2021-06-14T13:41:58.100181  (kms_vblank:790) igt_kms-CRITICAL: Failed a=
ssertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-06-14T13:41:58.107482  (kms_vblank:790) igt_kms-CRITICAL: Last err=
no: 22, Invalid argument
    2021-06-14T13:41:58.108770  Stack trace: =

    ... (64 line(s) more)  =

 =20
