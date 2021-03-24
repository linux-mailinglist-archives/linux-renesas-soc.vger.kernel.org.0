Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7642347FFA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 19:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236787AbhCXSFQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 14:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbhCXSEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 14:04:44 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DEEC061763
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 11:04:43 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so1642472pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oT0stCP0Hc+y3P7ht8iKmLkDeKP+c43nF1I90M1lrME=;
        b=V6mzuhNvLPRcFUNf9ilSe+L2AQFg1BmWkZXgFwfHBAPHbW27OwEe99GT5cx/fOxDxW
         4UnVHrPx3bGYYJlkC0pEviXq79TmRo0NRd3T1EGSa3zA93N1goRzBJtU50L2ADEcCppW
         nk9HPw+Chyqw/2NtLovVjX01rTMRDlssnEa/T6OhqAR+0mh0pWVsvhFXS/x/nJx0Ctxb
         ZWQuruO3ETa0gy/C6iZzaDMandgUMVhShIkXGujDEXsuR9g89wntu7pMIzuckVn83BH2
         cG9//7nQMJBUiiCbmX0kwX1IE3IYXjMEM/q7IE7sQiXZ5J8K6N4oP5Hs+FspKQeTawAm
         D/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oT0stCP0Hc+y3P7ht8iKmLkDeKP+c43nF1I90M1lrME=;
        b=hYpe7BxQXAW169qJNCSpDTHXDBdi1rJhrLU7xgft45I4zHNnDAZuunBAw2ICS1zKo1
         /2txhqb68i3KhZIs7cxdh6in/Gk/QJH4N0yvwrH75Eu2fGKb8uGjFhS3uWQQXpSXK4bE
         //Eb1fa4qcgzXGLZh2eNDXr03JanyQLLz78NdAbpW+/kSF/5Tr3pHskUtQ0K48WfGvEv
         KK6gabzwpy3e3WqUCfETZ8whwzFYnCsUJTO6ss3DhnCFnXOi9Sz//pF2qINwdLGyaFyv
         vXb6YV2axjvIufQ8Ng7l2zNPwRUPx7IC1o2YYP32PadtPX6Nquu6gRaaV4D+o4iJPEdI
         wR/A==
X-Gm-Message-State: AOAM530vqfnGLQZdbFq30SFMpoZ53rj7aiMUt3dieDRjTHEOVM78MYX9
        QlXOZwjLF+kTbHTX6pJGRhf3AW2MmwBGCA==
X-Google-Smtp-Source: ABdhPJxiw2SN5lSYfnkkUNeNsDvEi5ooHvtdu2sYgnD2kMfwgtLdJMzYgMV5T+lHbB6n0BXjMe885g==
X-Received: by 2002:a17:902:7c88:b029:e6:f006:f8e5 with SMTP id y8-20020a1709027c88b02900e6f006f8e5mr4789731pll.1.1616609082076;
        Wed, 24 Mar 2021 11:04:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g3sm3119904pfi.31.2021.03.24.11.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:04:41 -0700 (PDT)
Message-ID: <605b7f39.1c69fb81.5ae8c.789c@mx.google.com>
Date:   Wed, 24 Mar 2021 11:04:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-03-24-v5.12-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 3 regressions (renesas-next-2021-03-24-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 3 regressions (renesas-next-2021-03-=
24-v5.12-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-24-v5.12-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-24-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      32b5d4bd9e510c3aa9cc6ff8484f563260ea7104

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


  Details:     https://kernelci.org/test/plan/id/605b6efa3916d8785faf02e2

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-24-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-24-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210315.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/605b6efb3916d8785faf0368
        failing since 22 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-24 16:54:44.401000+00:00  pe, file ../lib/igt_kms.c:1910:
    2021-03-24 16:54:44.408000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-24 16:54:44.412000+00:00  Pipe E does not exist or not enabled
    2021-03-24 16:54:44.420000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-24 16:54:44.428000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-24 16:54:44.435000+00:00  Pipe <6>[  143.258971] Console: switc=
hing to colour dummy device 80x25
    2021-03-24 16:54:44.438000+00:00  F does not exist or not enabled
    2021-03-24 16:54:44.443000+00:00  <14>[  143.270277] [IGT] kms_vblank: =
executing
    2021-03-24 16:54:44.457000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  143.278805] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-03-24 16:54:44.458000+00:00   =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/605b6efb3916d8785faf036b
        failing since 22 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-24 16:54:49.492000+00:00  <6>[  148.319278] Console: switching =
to colour dummy device 80x25
    2021-03-24 16:54:49.496000+00:00  <14>[  148.325991] [IGT] kms_vblank: =
executing
    2021-03-24 16:54:49.512000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  148.332926] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-24 16:54:49.513000+00:00  =

    2021-03-24 16:54:49.518000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-24 16:54:50.446000+00:00  (kms_vblank:776) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-24 16:54:50.456000+00:00  (kms_vblank:776) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-24 16:54:50.462000+00:00  (kms_vblank:776) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-24 16:54:50.464000+00:00  Stack trace:
    2021-03-24 16:54:50.468000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/605b6efb3916d8785faf036d
        failing since 22 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-24 16:54:54.389000+00:00  <14>[  153.218727] [IGT] kms_vblank: =
executing
    2021-03-24 16:54:54.403000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  153.224912] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-24 16:54:54.404000+00:00  =

    2021-03-24 16:54:54.409000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-24 16:54:55.333000+00:00  (kms_vblank:782) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-24 16:54:55.342000+00:00  (kms_vblank:782) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-24 16:54:55.349000+00:00  (kms_vblank:782) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-24 16:54:55.350000+00:00  Stack trace:
    2021-03-24 16:54:55.354000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-24 16:54:55.358000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =

 =20
