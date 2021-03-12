Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D9D338B6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 12:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhCLLZ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 06:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbhCLLZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 06:25:06 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AC2C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 03:25:06 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id ha17so4256000pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 03:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GkXucU8wZAf0Cz3WT5Tsg6WkeWksGJC+tYdRJRGelQQ=;
        b=v4IDDAmP25S01Xwf02RwPS4Mq/8uAS0M5ZhPITRmM+70ewhsOmIETBB16X/rbSrOZA
         4xS7jvByo2acZmTBnaXsZVLxWIczlfiKEC26IHgWmidcJuf0frOprAp//tN2i5W6DOHS
         OaGrFBYN6sOUD6W7M4CdT7hWMf+RqH9nOSrKQlIMBlCiICnw34olM/Urry+iqA3duBoA
         uVZvR6UrLB3gv/amSg/SGUEUF3SbiUSg0nq8fqqSqyOCD/knYsyDAfey5bG0VLfF8khw
         J98+TJH6BeIIaMWesi8hYLbjlOXsR83BaPfuaXjdJc6fM6DjNfyPzotCplPn+koTcu48
         Rygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GkXucU8wZAf0Cz3WT5Tsg6WkeWksGJC+tYdRJRGelQQ=;
        b=JI5BzOB/6esD5Er0ATB+aCJ4BlytjNYJgR9nxO1Sa8RSNHODJSgMbAlnugepG8MhUo
         vi/RNXwJoiWq3yTu8lv4eF9LnaCQLyl/G3ZfCHCuCKqSgXVAg316CS8hznDWdYR+ElA+
         NsGETu6v4ZFjxLukI67ZTVt695iR/DUe19fMQYcPiw9wgvi0wE6fxLpDq3Ktxc01YUWz
         oyJuWblquBXKZIkldxwPFVMEEpv7AaZ1CNk9A2k41eeXUdhN8UR1dqEBJzvEgHDa0zuZ
         Su27SQC17Ga/rwswUw+NJQmkp84i0pG0kOKDTZdq5OMiKtiDhBH8RoC0t8UEUvmYyVkx
         mTQQ==
X-Gm-Message-State: AOAM532WPYPID195g1Jgru5GxQUffEpMxzl8bvJIH5LmjvIqJdrbikwM
        Ak3rpw2FXu+ZrA2/sIh+VLe4wySwXqNGMQ==
X-Google-Smtp-Source: ABdhPJxFk+GFL0eEcB7vyYYz5ubgZar4HoTj2QXGDdNeYws8Wq+aexVZ6z3uKaSPyv4xWCEtr3A3TA==
X-Received: by 2002:a17:902:aa87:b029:e5:e1fc:be6 with SMTP id d7-20020a170902aa87b02900e5e1fc0be6mr13326780plr.4.1615548305557;
        Fri, 12 Mar 2021 03:25:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j20sm794074pji.3.2021.03.12.03.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 03:25:05 -0800 (PST)
Message-ID: <604b4f91.1c69fb81.66f6f.14ea@mx.google.com>
Date:   Fri, 12 Mar 2021 03:25:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-12-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 3 regressions (renesas-next-2021-03-12-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 3 regressions (renesas-next-2021-03-=
12-v5.12-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-12-v5.12-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-12-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      af038eda54d9a61e09711d7d4d3232356b510331

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  a9bb32cfe1ee87ff831707dfdcbcae56f2b2a036
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2107b0a53692fb329175bc16169c3699712187aa =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:     https://kernelci.org/test/plan/id/604b3dd3aa7619f393addcd4

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/604b3dd3aa7619f393addd5a
        failing since 10 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-12 10:08:46.812000+00:00  t requirement not met in function igt=
_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-12 10:08:46.819000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-12 10:08:46.824000+00:00  Pipe E does not exist or not enabled
    2021-03-12 10:08:46.832000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-12 10:08:46.842000+00:00  Test requirement: !(pipe >=3D display=
-><6>[  147.608527] Console: switching to colour dummy device 80x25
    2021-03-12 10:08:46.846000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-03-12 10:08:46.853000+00:00  Pipe F does not exist<14>[  147.61857=
7] [IGT] kms_vblank: executing
    2021-03-12 10:08:46.855000+00:00   or not enabled
    2021-03-12 10:08:46.869000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  147.631523] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-03-12 10:08:46.869000+00:00   =

    ... (68 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/604b3dd3aa7619f393addd5d
        failing since 10 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-12 10:08:51.946000+00:00  <6>[  152.715223] Console: switching =
to colour dummy device 80x25
    2021-03-12 10:08:51.950000+00:00  <14>[  152.721949] [IGT] kms_vblank: =
executing
    2021-03-12 10:08:51.966000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  152.728952] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-12 10:08:51.967000+00:00  =

    2021-03-12 10:08:51.972000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-12 10:08:52.900000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-12 10:08:52.910000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-12 10:08:52.917000+00:00  (kms_vblank:778) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-12 10:08:52.918000+00:00  Stack trace:
    2021-03-12 10:08:52.923000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/604b3dd3aa7619f393addd5f
        failing since 10 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-12 10:08:56.886000+00:00  <14>[  157.658764] [IGT] kms_vblank: =
executing
    2021-03-12 10:08:56.901000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  157.665133] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-12 10:08:56.901000+00:00  =

    2021-03-12 10:08:56.907000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-12 10:08:57.819000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-12 10:08:57.829000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-12 10:08:57.836000+00:00  (kms_vblank:784) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-12 10:08:57.837000+00:00  Stack trace:
    2021-03-12 10:08:57.842000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-12 10:08:57.845000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =

 =20
