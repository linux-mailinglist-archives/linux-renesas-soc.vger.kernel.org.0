Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BA73D6B92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhG0A7H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234092AbhG0A7G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:59:06 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050E2C061760
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:39:35 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso1795651pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=W620QUO3CpOw9d7vRK88aGxL0TXhIKzv+mzDkPnTxm0=;
        b=cS4tdDph3CgIdTRu5gshPIp+gnuXxRwDkXLKkNiWUzjqkcFVPmx+2GJS/jwshp6r1V
         o2hlhN98NSDQlr9x1egE8SbgayPUBQyWABo27bPVcnLQyGxYD50IFxOSJ8OtnL99lvZL
         +Buqg9zGMXSXr/jS4WWQQ1p3w6FiVTyLea1hZ3V/bPu/FwqvNIXjTNfCUdZmfxKeRQ/1
         AjgyG+mJgE2G8xkkpdOCKdgOP2/VMqCBT1Cp8EK+WNOA+fqzOJIoAebxCiMNODfAgpBx
         bnz1zxr3Y1tvgt+vxsfiGy/j9EzJIXNuGa1A5J3yaZxiNeLbr41Y55zVZ6m4NfEwQqDv
         7TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=W620QUO3CpOw9d7vRK88aGxL0TXhIKzv+mzDkPnTxm0=;
        b=Y0+BUIg5Q4PWwcbCj+TOOy0twvNYfWXUQ2DefD6ZJxkrhKnUeLcM3kEKL6A0y+BgfT
         0HMQr0w8rQYVSco0h/3FPbQrI5ya0m2JK8ymgROyeMNqo71/EU/fxn5vX5yM1fYPtSfn
         gRrzCBdm+H7VGi8N0L52oHOHWPnZ0FNBXzEO0AsKttevGGy43Pc/StLtKxjlnSU34Tpi
         ss+oT1UDUgkoLxI0eFhuH3ZxaDIfOxARVyg95W+mIDW2/DUbkMHeln9nSnRNkmkVeyFI
         OT86PdKygfLGMt4gTmsGjBhtfdK8jHjZVodoUYo635L+Rc1VFSBGi101/Urkr5EM7qEz
         U+QA==
X-Gm-Message-State: AOAM533mjIQdSRsdhX/wiOn0KVfddBcozB8TdjOGatW7gKvGlDpNIl/1
        jLH6VDk9TXsUA3jw351ESNHuGJq9cRmvaHMB
X-Google-Smtp-Source: ABdhPJxz8BfkRDirJazG6sYdvCgF7uZTr3PgPXY/URlDc7GsRBhbvzg0GIxYYaHL6GPvB9yBw0R7cA==
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr1808204pjq.129.1627349974379;
        Mon, 26 Jul 2021 18:39:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s36sm1227913pgl.8.2021.07.26.18.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:39:34 -0700 (PDT)
Message-ID: <60ff63d6.1c69fb81.5bdeb.5b2f@mx.google.com>
Date:   Mon, 26 Jul 2021 18:39:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-26-v5.14-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2021-07-26-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2021-07-=
26-v5.14-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-26-v5.14-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-26-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cecb7cc88302b2e508c6cc1ce7663bba08c96a65

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  87a68fe9e49605d200ab2604e45b8a9d868d1922
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f3994c2cd99a1acfe991a8cc838a387dcb36598a =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/60ff51c8e3776e6b043a2f25

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210722.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60ff51c9e3776e6b043a2fad
        failing since 13 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T00:20:53.908273  <8>[   79.373768] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-ts-continuation-dpms-suspend RESULT=3Dpass>
    2021-07-27T00:20:53.940877  <6>[   79.410955] Console: switching to col=
our dummy device 80x25
    2021-07-27T00:20:53.946067  <14>[   79.418060] [IGT] kms_vblank: execut=
ing
    2021-07-27T00:20:53.960808  IGT-Version: 1.26-gf3994c2 (aarch64) (Linux=
: 5.14.0-rc2 aarch64)<14>[   79.424209] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-07-27T00:20:53.961417  =

    2021-07-27T00:20:53.966598  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-27T00:20:54.043114  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-27T00:20:54.072753  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-27T00:20:54.080162  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Jul 27 00:20:05 2021
    2021-07-27T00:20:54.093367  <6>[   79.564883] PM: suspend entry (deep) =

    ... (127 line(s) more)  =

 =20
