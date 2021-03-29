Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB59434D797
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 20:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhC2SvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 14:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbhC2Suj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 14:50:39 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39960C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:50:39 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c17so10452935pfn.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0yVoQ2TSwbnlPC2HYwNcK9OTZpvnKybGKj4df0fXte4=;
        b=RrqOJnadMZPzGzmuCNeEJ0kvuIxGb1mfdd/B+lMVeanV6atgyMmS1fpS7gSXO2N3EM
         VJv/x5MV7HHsdgkGqpdq0R/F0G/eFb6+expYutSouXPvkE9fj7NDaATl/b1Vhs+ogTsG
         hl6Mi6IeALwgT2M95A7N9HCsmI8LscVJFX2Re/AUlcGOJINvaQuvebQwb3JmOKvAAT+X
         +Fo0BTudL1Ubym1Bwy0sdsCT4wpqsPg6iXNEz8zrRouNQ7Zf+4wYEeXmejTBc4UpZ8RX
         nqQOk+p/7eeP6PhOY1VVGufOsDWCn4KSQvNgXGyyexIpO6ocR2aZeyZqu6iZl3yTTHpQ
         c2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0yVoQ2TSwbnlPC2HYwNcK9OTZpvnKybGKj4df0fXte4=;
        b=XuWu6JLEyIrWOTGJyVk+HspyavxLk2S/Ovxh7MRSz33/UvZ4VKCIWEpTVr7igxevox
         ZeCTEUctPB2ISlDjAqGbnEYnjPRjhhej2DBkk4yP4w8CWRfu5kpqbu94e1Ix7RgDs/IS
         GRwkFAcQ1x/iDIFL4kj90vgO8IK6bPwrgPXh8shPt0Proxc/e7BC3bFh7UWgx0CHdjCv
         fehNNcUs21YJLNSRslQ/71StSegUWdvsAeQ1M0Cw5XuLc7D0uG/LQ1PhsPq9wwj2bwYk
         fVfObh1FGGGiGSUzO78m+qewTFZzEnhC4n2bULqvDMrQ9LciiKXfW4R1Yia6WBv7QZ1C
         PecQ==
X-Gm-Message-State: AOAM532uRIjxA0FAXq2bh44Sixdc/R9fwaGWRv/Hcs0M3V5yRPJb8/US
        fJ8yW5qAx7ROV2qcrujPG3k8D/lwEjYxPcCF
X-Google-Smtp-Source: ABdhPJwAuZ9Xbpj2tx9gd9NQE9lBNPuTtYOFLXHO8K0+bnAEPDe7hTP5gMbYBUH6qIL8iCeSE1S5cw==
X-Received: by 2002:a05:6a00:2cd:b029:1f4:c3db:4191 with SMTP id b13-20020a056a0002cdb02901f4c3db4191mr25829351pft.71.1617043838413;
        Mon, 29 Mar 2021 11:50:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q25sm17274174pff.104.2021.03.29.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 11:50:38 -0700 (PDT)
Message-ID: <6062217e.1c69fb81.3fb43.b487@mx.google.com>
Date:   Mon, 29 Mar 2021 11:50:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-03-29-v5.12-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 3 regressions (renesas-next-2021-03-29-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 3 regressions (renesas-next-2021-03-=
29-v5.12-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-29-v5.12-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-29-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d084e52e5b7b16d25a5e32c4625fb205a2b272d8

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


  Details:     https://kernelci.org/test/plan/id/606211394ccfcaed3baf02bd

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210315.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/606211394ccfcaed3baf0343
        failing since 27 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-29 17:40:37.375000+00:00  t requirement not met in function igt=
_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-29 17:40:37.382000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-29 17:40:37.386000+00:00  Pipe E does not exist or not enabled
    2021-03-29 17:40:37.394000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-29 17:40:37.404000+00:00  Test requirement: !(pipe >=3D display=
-><6>[  142.839466] Console: switching to colour dummy device 80x25
    2021-03-29 17:40:37.408000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-03-29 17:40:37.415000+00:00  Pipe F does not exist<14>[  142.85039=
8] [IGT] kms_vblank: executing
    2021-03-29 17:40:37.417000+00:00   or not enabled
    2021-03-29 17:40:37.431000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  142.863161] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-03-29 17:40:37.432000+00:00   =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/606211394ccfcaed3baf0346
        failing since 27 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-29 17:40:42.512000+00:00  <14>[  147.954159] [IGT] kms_vblank: =
executing
    2021-03-29 17:40:42.528000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  147.961230] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-29 17:40:42.529000+00:00  =

    2021-03-29 17:40:42.535000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-29 17:40:43.461000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-29 17:40:43.472000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-29 17:40:43.478000+00:00  (kms_vblank:778) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-29 17:40:43.479000+00:00  Stack trace:
    2021-03-29 17:40:43.484000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-29 17:40:43.487000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/606211394ccfcaed3baf0348
        failing since 27 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-29 17:40:47.411000+00:00  <6>[  152.850393] Console: switching =
to colour dummy device 80x25
    2021-03-29 17:40:47.416000+00:00  <14>[  152.857455] [IGT] kms_vblank: =
executing
    2021-03-29 17:40:47.431000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  152.863632] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-29 17:40:47.432000+00:00  =

    2021-03-29 17:40:47.436000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-29 17:40:48.347000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-29 17:40:48.358000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-29 17:40:48.365000+00:00  (kms_vblank:784) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-29 17:40:48.366000+00:00  Stack trace:
    2021-03-29 17:40:48.371000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (62 line(s) more)  =

 =20
