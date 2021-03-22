Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFE83443F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 13:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbhCVMzs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 08:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhCVMxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 08:53:18 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99854C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:53:17 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so8489771pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iswU/wJ/aIZVtiTJHHTu1DEdXh1lWdavJw1OF8z7RI0=;
        b=B6Cxg6lG6JZtrN0IDcRlAke8NDGucvAssdzcDfCOCrVyb+XFfaTu9ypbymB2D0bE+5
         srNn2pGO3TtzoZ/3bLRBsfdiDp0VzPg0A9FhvmresIfsmqdUEGc4QsA8NMCn8C9OIbWE
         F3XzW86l8usPfwrZndWZIWrhMYrlu2msmk6Wcmsec2VjTiHjKXjiY92vFVWFbc8G1yVN
         DuCusRlTcQeGjU1bWIp6sRlWAkovmirk4tfCb4Ha0F55xC/HFXDKet+2enEt3QnfN2mG
         dlef2wCmdTrRxrFtDl/Wp4b0hTvjJZ/I7vVAMvqOVY4SPrnjLMcXxnVXUsmcwJOO46cu
         27Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iswU/wJ/aIZVtiTJHHTu1DEdXh1lWdavJw1OF8z7RI0=;
        b=HlN/11EUD/dqVUyS3qHOAUc2Ef0iX1ruitPlly9jie61Q5uZgrLkRQLg8ReCT2HPVS
         f5t5l6IdgMl7XNM6UVgHDyusIMmdTIXZtR4rfxw9KEGRo+S5DSD1LvMXRKerazr3HvCo
         9fHIlrvGdZDcCtVAAq3AhHGK0M8rgC/a917+A5Hnhc8XqX2GoRayKlYAFvi//uXMVPlP
         4zjnwrbl7pejb2m/0aNBwcdiu5A4QDuwW/aP6bEQm+xToXE2H/64+AlaKI4C4TPNp8/r
         ofZydISKmi6nJEbGCIc/plXSN/0gYT20mjX0/EYEbwjVSvKhDBzdwaawRX/FgMUaXpyW
         +VLA==
X-Gm-Message-State: AOAM533DgQ+wPTGLW9wdi4boB/MaOekYh8YxSWUhbyYXhHDRjyrS+EmO
        YgyAlJ/OnAO6rYCpgMEUcuLPS44gWRe8mQ==
X-Google-Smtp-Source: ABdhPJzbpL7cXk2pG3ywRuYdanaTugj2pWii6Ev/72oE1FLoLFRe4QNFWxvv6wqE5ELgxwXs/hbFYQ==
X-Received: by 2002:a17:90a:e656:: with SMTP id ep22mr12613029pjb.60.1616417596849;
        Mon, 22 Mar 2021 05:53:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t19sm12666092pfg.38.2021.03.22.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 05:53:16 -0700 (PDT)
Message-ID: <6058933c.1c69fb81.b7b5a.d6fa@mx.google.com>
Date:   Mon, 22 Mar 2021 05:53:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-22-v5.12-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 3 regressions (renesas-devel-2021-03-22-v5.12-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 3 regressions (renesas-devel-2021-=
03-22-v5.12-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-22-v5.12-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-22-v5.12-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      98d704ec88d32a3ece2e35f14ee85c45fe9d5d9d

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  7d6a1759900ffde0a7aac2fa0cbd7c2bf4989476
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f3fd2cc23455929d0ef276e05e02416b86a6db91 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:     https://kernelci.org/test/plan/id/6058829142ccdfde3caddcb5

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210315.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/6058829142ccdfde3caddd3b
        failing since 13 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-22 11:41:35.061000+00:00  est requirement not met in function i=
gt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-22 11:41:35.069000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-22 11:41:35.073000+00:00  Pipe E does not exist or not enabled
    2021-03-22 11:41:35.080000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-22 11:41:35.090000+00:00  Test requirement: !(pipe >=3D display=
<6>[  146.390943] Console: switching to colour dummy device 80x25
    2021-03-22 11:41:35.095000+00:00  ->n_pipes || !display->pipes[pipe].en=
abled)
    2021-03-22 11:41:35.101000+00:00  Pipe F does not exi<14>[  146.401532]=
 [IGT] kms_vblank: executing
    2021-03-22 11:41:35.103000+00:00  st or not enabled
    2021-03-22 11:41:35.116000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: <14>[  146.413251] [IGT] kms_vblank: starting subtest pipe-B-ts-con=
tinuation-idle
    2021-03-22 11:41:35.118000+00:00  5.12.0-rc4 aarch64) =

    ... (68 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/6058829142ccdfde3caddd3e
        failing since 13 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-22 11:41:39.433000+00:00  <14>[  150.738869] [IGT] kms_vblank: =
executing
    2021-03-22 11:41:39.448000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc4 aarch64)<14>[  150.745668] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-22 11:41:39.449000+00:00  =

    2021-03-22 11:41:39.454000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-22 11:41:40.366000+00:00  (kms_vblank:780) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-22 11:41:40.375000+00:00  (kms_vblank:780) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-22 11:41:40.382000+00:00  (kms_vblank:780) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-22 11:41:40.383000+00:00  Stack trace:
    2021-03-22 11:41:40.388000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-22 11:41:40.391000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/6058829142ccdfde3caddd40
        failing since 13 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-22 11:41:43.619000+00:00  <14>[  154.925477] [IGT] kms_vblank: =
executing
    2021-03-22 11:41:43.635000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc4 aarch64)<14>[  154.932194] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-22 11:41:43.635000+00:00  =

    2021-03-22 11:41:43.640000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-22 11:41:44.568000+00:00  (kms_vblank:786) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-22 11:41:44.578000+00:00  (kms_vblank:786) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-22 11:41:44.585000+00:00  (kms_vblank:786) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-22 11:41:44.586000+00:00  Stack trace:
    2021-03-22 11:41:44.591000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-22 11:41:44.594000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =

 =20
