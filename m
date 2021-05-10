Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F773798C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 23:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhEJVKR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 17:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhEJVKR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 17:10:17 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7810C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 14:09:11 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id t193so1682627pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PhshLWbNDucbQyHrLiCNDv3QU3z93DQaVZgY14aQawA=;
        b=jSBWT8dP9t12MoBzpmXvG31fS784NyZ7Er2eR9fL0rJRBVBiVyVFznnpNBxiX4Bm4c
         KAuGEhnza22XtDYfGp37/NT7KbPkfenZh4YQECJYurUEJ2kwZQ+l3kSpLGeipxmY07VS
         j0hR4xvmkRodnzn5H6hES+7HjZllpIfeyngttEFZrurh5+mxb3BOJQoRuiSsBxYag6Iu
         dT1UFX2H4r93GsdZL+jpC9M7kF3AAdoluk8o0QcEMLDpFioj3NpAknt7oM85mz8mowCp
         hHbA4YJcK+BGS2UtIzZuBFjSljhJ9x7tspRRx+BkNuS7hpO5buWOU/IVjrUk4xJlgv5i
         521Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PhshLWbNDucbQyHrLiCNDv3QU3z93DQaVZgY14aQawA=;
        b=q3m8jQ14hLacqKwEL8TtNeOOeQ9IAr8dipAwDL9fix6i0JraCbmzXDytD35wm4usqz
         /wSebLu6xXd/PSEHymgf2wrxrnNcXLbCdFQWeq5qFnYDHZDZRWo6k8Up1BryhjbwvYsi
         TJtnJr6KpS+l8wjI73KXCXFqir0YO7ZvOusxnobqU41ZhtT8wkj8NoAGOKPU5WaDtIpR
         VyvND1mt2TywEPYvp9EgQrEN2zXKkMbOWJy9Y1SoIxXo6QHjKnevwxdCsMJn4NhpX1L5
         nfKahcGna1i7JZOxOA2uscC3M2Ah8zrBTINOtjwkEYptPJQWg5zk36oscLH9YKKjmTK3
         pOAw==
X-Gm-Message-State: AOAM5300ysQb49W1UyCLNafdObtuM8Wvhvgo5xNX1lSHcf6+qUyYWuSe
        T3miGulvMllx0UWyYXlgOEPmyoaKpWrBO+wu
X-Google-Smtp-Source: ABdhPJwuAouaJOil3rG6/bIgcvLCSsUlp8nr5XDulyxpFrGPZQJHmRZn1a3GjL0RL1XgOXQN0RfI5A==
X-Received: by 2002:a65:48cb:: with SMTP id o11mr11951237pgs.43.1620680951071;
        Mon, 10 May 2021 14:09:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d16sm12174602pgk.34.2021.05.10.14.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 14:09:10 -0700 (PDT)
Message-ID: <6099a0f6.1c69fb81.c5fe3.55f5@mx.google.com>
Date:   Mon, 10 May 2021 14:09:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-10-v5.13-rc1
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 3 regressions (renesas-devel-2021-05-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 3 regressions (renesas-devel-2021-=
05-10-v5.13-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-10-v5.13-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dcf2613335bced4d60b8b8e10134d2f9153d298c

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  bf08984682a2bc7c4a1e01dd2af8d4c1d75cea46
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  126a3f6fc0e97786e2819085efc84e741093aed5 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:     https://kernelci.org/test/plan/id/609994e8cc1cdf28c96f547f

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210503.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/609994e8cc1cdf28c96f5505
        failing since 63 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-10 20:17:08.793000+00:00  Pipe D does not exist or not enabled
    2021-05-10 20:17:08.801000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-10 20:17:08.809000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-10 20:17:08.813000+00:00  Pipe E does not exist or not enabled
    2021-05-10 20:17:08.825000+00:00  Test requirement not met in function =
igt_require_pipe, fi<6>[  146.867365] Console: switching to colour dummy de=
vice 80x25
    2021-05-10 20:17:08.827000+00:00  le ../lib/igt_kms.c:2094:
    2021-05-10 20:17:08.835000+00:00  Test requirement: !(pipe >=3D display=
-><14>[  146.878259] [IGT] kms_vblank: executing
    2021-05-10 20:17:08.840000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-05-10 20:17:08.850000+00:00  Pipe F does not exist<14>[  146.89014=
4] [IGT] kms_vblank: starting subtest pipe-B-ts-continuation-idle
    2021-05-10 20:17:08.852000+00:00   or not enabled =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/609994e8cc1cdf28c96f5508
        failing since 63 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-10 20:17:13.905000+00:00  <14>[  151.954009] [IGT] kms_vblank: =
executing
    2021-05-10 20:17:13.922000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[  151.960589] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-05-10 20:17:13.922000+00:00  =

    2021-05-10 20:17:13.927000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-05-10 20:17:14.867000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-10 20:17:14.877000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-10 20:17:14.884000+00:00  (kms_vblank:779) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-10 20:17:14.884000+00:00  Stack trace:
    2021-05-10 20:17:14.891000+00:00    #0 ../lib/igt_cor<14>[  152.934859]=
 [IGT] kms_vblank: exiting, ret=3D98
    2021-05-10 20:17:14.894000+00:00  e.c:1745 __igt_fail_assert() =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/609994e8cc1cdf28c96f550a
        failing since 63 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-10 20:17:18.058000+00:00  <14>[  156.106812] [IGT] kms_vblank: =
executing
    2021-05-10 20:17:18.073000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[  156.113505] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-05-10 20:17:18.074000+00:00  =

    2021-05-10 20:17:18.079000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-05-10 20:17:19.036000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-10 20:17:19.046000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-10 20:17:19.053000+00:00  (kms_vblank:785) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-10 20:17:19.054000+00:00  Stack trace:
    2021-05-10 20:17:19.059000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert()
    2021-05-10 20:17:19.063000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =

 =20
