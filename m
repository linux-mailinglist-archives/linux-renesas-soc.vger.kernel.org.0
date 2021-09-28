Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A54B41B756
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 21:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242429AbhI1TSG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 15:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242262AbhI1TSF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 15:18:05 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283FEC06161C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:26 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 133so150139pgb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CpfL7IeW45ZK0l/i2NVZZnqMK8LWYmuyqAyoVO5KK2Q=;
        b=4RJMr+HKFirnVR+rieYx97E8D0sqwVI74ZXncHdR+Iw3/OANrpP0m89yDywJ2pRUB4
         Xs0d308Qs9XYo2iuEDG4GOpC0iaVBua79kA8tOMPNtjcRr80cPqR2FhDvXocgdnO7CAQ
         3X/0ovDFxzOBjqdE4rq4EEx9bXg4VHypKYNNQm40RlIA4Ihq1SD9cHhew32LZVBF7G4w
         cnXD3Ye8ojhCcgbqMluo5IRdrZt6yYdasisW7A8/djDWGYS+dD5pwiNJkLXeFUebSbDT
         sQnDj0OIbhFBHw+nmHxm/2NgRQmgGzO6AeUGov4x+0E7Ap2Yj5fNqkjEP5NJhCmTjK6W
         XVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CpfL7IeW45ZK0l/i2NVZZnqMK8LWYmuyqAyoVO5KK2Q=;
        b=NQiZMpsrY6JDi/Z7wqkv6XIzZx060xc9EFPdIU5dxDFWZlNOthfYQTUX1Ot7jiLKqa
         hvh3QZmL2dZxpF4TfaAXEXEBUBAL2c+oZAR21SAppXPYDQvQ8BSozk4e8WmkwNGrB5du
         PPQIrG3sR/0aMQGr5JwUsRuOvdYUzvzrQsBJMzuaBBZVp2bNCyL65PH/2mRMyidNuIO+
         lFqKghr2gqbBpGcRXZH/e1qOI9UAoEA+pFiY5GebnpNjFS1CkftCBs8NdUwTLiHCfEsI
         nsmodJVw1l8+44w9S5v0izRQZVRXfoQYHvN1MJFFWlOaWf1/cGEqeiBiXtB0GgpmDVGF
         Cd2w==
X-Gm-Message-State: AOAM531LlGVjKLVtXwKPDJ1rxQ7U9Nxo2KUv7GAiH4bPwOwx/lBb1LVF
        j1GCfTklAC/1w2XIAf8WN0yxjEU3zovKgf6c
X-Google-Smtp-Source: ABdhPJxglpX0iuFgP9PZerVNWix7YN0mOw8mnXblcHMgbSZJHWaLFmKgKE9u8QVYSrDspBGnjdff2A==
X-Received: by 2002:a63:3e8b:: with SMTP id l133mr5973383pga.451.1632856585483;
        Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p16sm18558957pfq.95.2021.09.28.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
Message-ID: <61536a09.1c69fb81.a1a78.d19e@mx.google.com>
Date:   Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-28-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 2 regressions (renesas-next-2021-09-28-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 2 regressions (renesas-next-2021-09-=
28-v5.15-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-28-v5.15-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-28-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a462ac13da67252c742a2c044b302f37eae9d089

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1084c5eb74fd0daf8c9b8e83e85f5208c396579b =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/61535d1bff1e80d8aa99a331

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/61535d1bff1e80d8aa99a3b9
        failing since 77 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-28T18:19:27.358345  <6>[   81.179130] Console: switching to col=
our dummy device 80x25
    2021-09-28T18:19:27.362050  <14>[   81.185832] [IGT] kms_vblank: execut=
ing
    2021-09-28T18:19:27.378340  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   81.192056] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-09-28T18:19:27.380732  =

    2021-09-28T18:19:27.382662  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-09-28T18:19:27.467916  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-09-28T18:19:27.496366  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-09-28T18:19:27.508921  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Sep 28 18:17:45 2021
    2021-09-28T18:19:27.517300  <6>[   81.341664] PM: suspend entry (deep)
    2021-09-28T18:19:27.522799  <6>[   81.346617] Filesystems sync: 0.000 s=
econds =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
1535d1bff1e80d8aa99a3d7
        failing since 14 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c)

    2021-09-28T18:18:36.998917  <8>[   46.339254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2021-09-28T18:18:37.005712  <8>[   46.350657] <LAVA_SIGNAL_TESTSET STOP>
    2021-09-28T18:18:37.047544  <8>[   46.390961] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-09-28T18:18:37.083800  <6>[   46.426007] Console: switching to col=
our dummy device 80x25
    2021-09-28T18:18:37.089136  <14>[   46.433100] [IGT] kms_setmode: execu=
ting
    2021-09-28T18:18:37.100807  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   46.438426] [IGT] kms_setmode: starting subtest=
 basic
    2021-09-28T18:18:37.102037  =

    2021-09-28T18:18:37.103638  Starting subtest: basic
    2021-09-28T18:18:37.107866  Testing: basic 1 connector combinations
    2021-09-28T18:18:37.216480    Test id#1 CRTC count 1 =

    ... (73 line(s) more)  =

 =20
