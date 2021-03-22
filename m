Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640B1344546
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 14:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhCVNPr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 09:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbhCVNN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 09:13:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D50C0613D8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 06:13:28 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id g1so6546376plg.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iYWWhJXL6yAY0f5yb4MqVlzzkY6CF1KrJYCsNB2H2X8=;
        b=LLSubpgReFdJ59nJ+nLygf2wGCvQzuOugOmmex0WR55kn1qpxCw32X3HFDqZBUjGSo
         XYVxgI1XR0RVor7u1QiUiZvmXSZxoOXOmdV7hoKW5ku4VijgBu/LwtgSCE6h394bu/tV
         X3vEe3HJ4gxITi0AiJVRSMR8qDtyFTl4+MkeQLQQwdRhyDnFym28uJcT0z2b6PuN4PLO
         YlUwj1lKzM+K5YWv5hKyOoaQOMhrE9y+Ckf3n4sxobCnOmmGqds1pOimSRM1LBCK7Xw/
         hpcIaVot03d05OB/26Cnw8iNjJqSzAXlew1ghd9POFSFDEhI1zvlTpvVdG+f+QnSYPUA
         7AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iYWWhJXL6yAY0f5yb4MqVlzzkY6CF1KrJYCsNB2H2X8=;
        b=YoPbaziXeU/TWHTXK/ziyHgW69+ZwnwLV926Ms3gp1XOEE4zRh68jSAFiKii4nqrV6
         0u4jzDcBjlNRHvyOX6MImvX5ieSbR5q2Y4oBmm9xUEA8ESHu2SKiQocW0IMFVVpKs0MJ
         tgIcmoerC4Ar5X2C2uvWAibh4+TdqANvR0fpRMWUeIpwCF8oEh8GY9mgwMjfcDUWtwFe
         xUSNis6ijdeLPnoq67L3A0C6GEABFVAd739r+NfTi+NIOoOIcGktD+rJAQioXjezBWVm
         Buy2kEWw/ALkEgNDCTvjpk5rd3Me0K/uM9N/6CfoThRGd7k5fNL0XSzxbLvM6p8dawMf
         bN/Q==
X-Gm-Message-State: AOAM533/PPv+0OTIpOUEhs+Pg0Jbkz+6jKej0gXZ4OsktEGCc0MjjBz8
        Ep0EavdyuXMlewm8AMaVwtRajlp8TAN9uA==
X-Google-Smtp-Source: ABdhPJzgKWgZVIJWVkF5rICTuytIsETmsiN5iPOBtjeV+s1Po628uKLsnjiKyvzL2D4JV285p3SZjQ==
X-Received: by 2002:a17:902:b210:b029:e6:33b4:cd9e with SMTP id t16-20020a170902b210b02900e633b4cd9emr26541530plr.67.1616418807672;
        Mon, 22 Mar 2021 06:13:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q22sm12958768pfk.2.2021.03.22.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:13:27 -0700 (PDT)
Message-ID: <605897f7.1c69fb81.6371d.eec3@mx.google.com>
Date:   Mon, 22 Mar 2021 06:13:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-22-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 3 regressions (renesas-next-2021-03-22-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 3 regressions (renesas-next-2021-03-=
22-v5.12-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-22-v5.12-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-22-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7ad9aafe713bdca552efdf6309a196e4f3eec177

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


  Details:     https://kernelci.org/test/plan/id/6058910c955409d0f6addcc2

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210315.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/6058910d955409d0f6addd3c
        failing since 20 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-22 12:43:22.805000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-22 12:43:22.809000+00:00  Pipe D does not exist or not enabled
    2021-03-22 12:43:22.817000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-22 12:43:22.824000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-22 12:43:22.834000+00:00  Pipe E does not exist or not <6>[  14=
1.949143] Console: switching to colour dummy device 80x25
    2021-03-22 12:43:22.835000+00:00  enabled
    2021-03-22 12:43:22.845000+00:00  Test requirement not met in function =
igt_require_pipe, <14>[  141.960057] [IGT] kms_vblank: executing
    2021-03-22 12:43:22.848000+00:00  file ../lib/igt_kms.c:1910:
    2021-03-22 12:43:22.860000+00:00  Test requirement: !(pipe >=3D display=
<14>[  141.972324] [IGT] kms_vblank: starting subtest pipe-B-ts-continuatio=
n-idle
    2021-03-22 12:43:22.864000+00:00  ->n_pipes || !display->pipes[pipe].en=
abled) =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/6058910d955409d0f6addd3f
        failing since 20 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-22 12:43:27.104000+00:00  <6>[  146.223946] Console: switching =
to colour dummy device 80x25
    2021-03-22 12:43:27.110000+00:00  <14>[  146.230654] [IGT] kms_vblank: =
executing
    2021-03-22 12:43:27.125000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  146.237572] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-22 12:43:27.126000+00:00  =

    2021-03-22 12:43:27.130000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-22 12:43:28.046000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-22 12:43:28.056000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-22 12:43:28.062000+00:00  (kms_vblank:779) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-22 12:43:28.063000+00:00  Stack trace:
    2021-03-22 12:43:28.069000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/6058910d955409d0f6addd41
        failing since 20 days (last pass: renesas-next-2021-01-29-v5.11-rc1=
, first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-22 12:43:31.300000+00:00  <14>[  150.420937] [IGT] kms_vblank: =
executing
    2021-03-22 12:43:31.314000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  150.427452] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-22 12:43:31.315000+00:00  =

    2021-03-22 12:43:31.320000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-22 12:43:32.231000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-22 12:43:32.241000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-22 12:43:32.248000+00:00  (kms_vblank:785) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-22 12:43:32.249000+00:00  Stack trace:
    2021-03-22 12:43:32.254000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-22 12:43:32.258000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =

 =20
