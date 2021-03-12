Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA92338C10
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 12:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbhCLLzv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 06:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbhCLLz3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 06:55:29 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14533C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 03:55:29 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id t26so15711645pgv.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 03:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mwqSacbRAET9wJkmK4qwmyhytIUYr/D3W0zg8CMu5Pg=;
        b=gOCA8PyE5w1IR9QEn9X3XJukH1ixfhg0HgMw/1ie4Wdv4nnRtppgZ04rZhoXfpgCNT
         iOXSc/HVjwJSOzVea3xNvPFGvwyaxVdmB2KjSNHha3JThrJbz27I187LD1mju2O9ue9K
         FCTjiygmCMNQQdCEKszCBnvUi7GC9fB6PMV0XPJjMZnl1kuOEaO4tjA1UcTSV9jhfC4y
         /EmjFYM+0tOua5Gcb3CRY57kMckbu3r1kWRymeIhc0pHa2LODyJUqa1Yq+hrnyeOyzMK
         m+khjkExbP7dOOD5s4+swUxmzEJZ8bdULAf+bbuktmE0KgKQJ/iOqUtG4KFu7b88uDjx
         VNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mwqSacbRAET9wJkmK4qwmyhytIUYr/D3W0zg8CMu5Pg=;
        b=b8l47lPOmSzs2RDZmqDCnhAZoOSgEIueLoSUPR7gPKpDGU7XG8gmM9FpfWLTNq4Ywc
         BFdzOrCJt0arIj+PqQ+fkxSnMTsTjG89oofXcdK3cmWc1ysHIgfc7cZ5nom5sUvpHBN/
         cXpyMRz8n7CoolcbXCZz6QucfGQgWV/sRPjGk7zq6SZ5v2TAwPpD8QjwwKFhxQrQ9PWN
         GG8I8UjQpaQKijLFJ5zsVpljmzfah6n1SRf/+3v9IdePKul1K/FoH/yUfgzS6CKWVERD
         gXREgCYuATezzGT0D+M56G7xNmjNm8LZ4DUIMSttzObiHTLcSyGd0Fu/luny24RphqHh
         RTWg==
X-Gm-Message-State: AOAM533eR2YiI8P/ixssTvAxpwrabaF0uzP6jDaRZoZgHk4uR6CxKpwu
        V/oDS38zHwV8mVGwhPbF6Yb/13eu3u4zXg==
X-Google-Smtp-Source: ABdhPJxRxPraC4kQxo/hTomBiMIB3g0i8zM7smpIdcjv8PwVNf7fNz065sHGgueXEgsZPKy3WFF5zg==
X-Received: by 2002:a63:ea01:: with SMTP id c1mr3351816pgi.236.1615550128322;
        Fri, 12 Mar 2021 03:55:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y22sm5311580pfn.32.2021.03.12.03.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 03:55:28 -0800 (PST)
Message-ID: <604b56b0.1c69fb81.2c7c0.e1a0@mx.google.com>
Date:   Fri, 12 Mar 2021 03:55:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-12-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 3 regressions (renesas-devel-2021-03-12-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 3 regressions (renesas-devel-2021-=
03-12-v5.12-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-12-v5.12-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-12-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6ca7a993828c498b3c9b53e42709da961712a99d

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


  Details:     https://kernelci.org/test/plan/id/604b44bbc8403099b8addcc8

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/604b44bbc8403099b8addd4e
        failing since 3 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-12 10:38:15.036000+00:00  y->pipes[pipe].enabled)
    2021-03-12 10:38:15.040000+00:00  Pipe D does not exist or not enabled
    2021-03-12 10:38:15.048000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-12 10:38:15.056000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-12 10:38:15.059000+00:00  Pipe E does not exist or not enabled
    2021-03-12 10:38:15.071000+00:00  Test requirement not met in function =
igt_require_pipe, <6>[  143.047126] Console: switching to colour dummy devi=
ce 80x25
    2021-03-12 10:38:15.074000+00:00  file ../lib/igt_kms.c:1910:
    2021-03-12 10:38:15.082000+00:00  Test requirement: !(pipe >=3D display=
<14>[  143.058246] [IGT] kms_vblank: executing
    2021-03-12 10:38:15.087000+00:00  ->n_pipes || !display->pipes[pipe].en=
abled)
    2021-03-12 10:38:15.097000+00:00  Pipe F does not exi<14>[  143.070811]=
 [IGT] kms_vblank: starting subtest pipe-B-ts-continuation-idle =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/604b44bbc8403099b8addd51
        failing since 3 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-12 10:38:20.158000+00:00  <6>[  148.137996] Console: switching =
to colour dummy device 80x25
    2021-03-12 10:38:20.162000+00:00  <14>[  148.144697] [IGT] kms_vblank: =
executing
    2021-03-12 10:38:20.178000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  148.150946] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-12 10:38:20.178000+00:00  =

    2021-03-12 10:38:20.183000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-12 10:38:21.111000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-12 10:38:21.121000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-12 10:38:21.128000+00:00  (kms_vblank:778) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-12 10:38:21.129000+00:00  Stack trace:
    2021-03-12 10:38:21.134000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/604b44bbc8403099b8addd53
        failing since 3 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-12 10:38:25.067000+00:00  <14>[  153.049114] [IGT] kms_vblank: =
executing
    2021-03-12 10:38:25.082000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  153.055342] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-12 10:38:25.083000+00:00  =

    2021-03-12 10:38:25.087000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-12 10:38:25.997000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-12 10:38:26.007000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-12 10:38:26.014000+00:00  (kms_vblank:784) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-12 10:38:26.015000+00:00  Stack trace:
    2021-03-12 10:38:26.020000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-12 10:38:26.023000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =

 =20
