Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044F7333CD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 13:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhCJMqO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 07:46:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232673AbhCJMqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 07:46:09 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A62CC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 04:46:09 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so7170753pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 04:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x5Xu+ybh/s/7f7GGDtKoiH3ZMF5H1dtpovl+BVZskjQ=;
        b=Jlt0WWL3pcCefWGvykk/f2GRkhPNcdqHN4RxdwzKEyAOHvCVxFBd9aPmAira1QkXTg
         i0p3MrCHLXj3Br+J0CjZP853T4STu2+yXfPOuRrBn52R26enZNzGNsflEaQbMTISoW56
         ILav7Ox1zMwfNdPqXRic+9lS/ik6nmU4iv9xu20HCCFq8eJRHZJNxZQ8qErhKtPY6/gd
         axwa84zqpRggETLJGekCjAeoLOXbt3P1OBF1noMweigvUEfZUqNyb50TmvZfjaEUMG1B
         T/IKN73hr2xfPEGQKxv/DjlVSh/vdWz7hiiLAvKjllnnbm7IHWWK6NuubUnqx7XuJidu
         +lqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x5Xu+ybh/s/7f7GGDtKoiH3ZMF5H1dtpovl+BVZskjQ=;
        b=Oyo1S2Athcpajy4z2r22q+J6m9SkT40kUU/PwVOON53v6RDmdFRey1r7tW4LwQk/NM
         iXTvQ3xpI3aoF5mX1jyMo9KnkVss3Y0Hfv+6vzMsk1mDaCa2AuP+zUDevwHeVWdOHSeY
         igpAoUfr7NJvDybI6qF/TS5LogTk7h8t7uxpwWrZp4rBL6qw/ZDE4tdNgwHbF3YOG5Oh
         liNDznfY9CKZrGE8HR+S+Y/otohN9IYXHqts0rYpzqgDt7Qv7ZUtVfVpUsG4o3bbgn7h
         yHzNR8jdT5MHDvOVzpICsLTcllcgGd75ZbC4kG9IK3An1r6kbqxG4ETdPeqyP3Lm5JU2
         PGJQ==
X-Gm-Message-State: AOAM531yIqfSvltgE4eSwqDRzBjsXn1+7i773upIOHGGzvrwbVMEek4X
        RAMz5kAVAwoac5CyXTykmJT87Pa/57/ofFyx
X-Google-Smtp-Source: ABdhPJxPA3HHJeCngoEhksqOcYX2EeBWYWZA9y3q8rICosdIEpj3jKpfbZiQKG5iDT6TKKg95uDc0Q==
X-Received: by 2002:a17:902:8c97:b029:e2:8c58:153f with SMTP id t23-20020a1709028c97b02900e28c58153fmr2861588plo.79.1615380368692;
        Wed, 10 Mar 2021 04:46:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x7sm7231138pfp.23.2021.03.10.04.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:46:08 -0800 (PST)
Message-ID: <6048bf90.1c69fb81.fa15b.0e5a@mx.google.com>
Date:   Wed, 10 Mar 2021 04:46:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-21-g604bd2d4786e9
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 3 regressions (v5.12-rc2-21-g604bd2d4786e9)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 3 regressions (v5.12-rc2-21-g604bd2d=
4786e9)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc2-21-g604bd2d4786e9/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc2-21-g604bd2d4786e9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      604bd2d4786e902a90a56db9427d5563bdf8c529

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


  Details:     https://kernelci.org/test/plan/id/6048b2ecf231b3c19daddcbb

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-=
kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-=
kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/6048b2ecf231b3c19daddcfb
        failing since 8 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-10 11:51:36.025000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:51:36.029000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:51:36.037000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:51:36.047000+00:00  Test requirement: !(pipe >=3D display=
-><6>[  143.776511] Console: switching to colour dummy device 80x25
    2021-03-10 11:51:36.051000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-03-10 11:51:36.058000+00:00  Pipe F does not exist<14>[  143.78685=
0] [IGT] kms_vblank: executing
    2021-03-10 11:51:36.059000+00:00   or not enabled
    2021-03-10 11:51:36.067000+00:00  <14>[  143.798565] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-idle
    2021-03-10 11:51:36.074000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)
    2021-03-10 11:51:36.078000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-idle =

    ... (67 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/6048b2ecf231b3c19daddcfe
        failing since 8 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-10 11:51:41.138000+00:00  =

    2021-03-10 11:51:41.144000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-10 11:51:42.054000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-10 11:51:42.064000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-10 11:51:42.070000+00:00  (kms_vblank:778) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-10 11:51:42.072000+00:00  Stack trace:
    2021-03-10 11:51:42.077000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-10 11:51:42.080000+00:00    #1 [igt_wait_for_vblank+0x4c]
    2021-03-10 11:51:42.082000+00:00    #2 [<unknown>+0xc9c422e0]
    2021-03-10 11:51:42.085000+00:00    #3 [<unknown>+0xc9c42ac8] =

    ... (60 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/6048b2ecf231b3c19daddd00
        failing since 8 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-10 11:51:46.002000+00:00  <6>[  153.735223] Console: switching =
to colour dummy device 80x25
    2021-03-10 11:51:46.008000+00:00  <14>[  153.742661] [IGT] kms_vblank: =
executing
    2021-03-10 11:51:46.023000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  153.748896] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-10 11:51:46.023000+00:00  =

    2021-03-10 11:51:46.028000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-10 11:51:46.957000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-10 11:51:46.967000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-10 11:51:46.974000+00:00  (kms_vblank:784) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-10 11:51:46.975000+00:00  Stack trace:
    2021-03-10 11:51:46.979000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (62 line(s) more)  =

 =20
