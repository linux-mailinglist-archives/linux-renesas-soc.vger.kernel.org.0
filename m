Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61ECD3900D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 14:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbhEYMZE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 08:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbhEYMZE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 08:25:04 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA7AC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 05:23:32 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 22so23078554pfv.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+kCs5exBVf15EyFPRNxtW6htUqbihnKSWAGioBZA7SE=;
        b=umDdU3XNg8qNAHD2ZSjCpUTNoWODN2gVYCPAeDyNqTvipT/q7D0xZVz48qNNQsJ5lj
         O6zmCpCWZgfGOdbW5l6a1IVqyZfkwc16HRCX4546FZ2qjgMFd9Qlazy8+cYsKgXtwNDA
         DTk3kvFQtCKJvmZMwHRlpj/zKoTruCg11y1jMm5P9SJUC0z4jflWS4htRz39sOXFgS4z
         g7ijf1PPh86TwpTujgUd/RKa3Rjqlu2cA6gCYKr4EarcWeCCjuptwSEj0FrCNxne0I1J
         XzhlHIZlqRStyU0hQID7HB1be5hvJssyZTUhOv6rZhgByhmg79sw1Z0IVu/gdcG557z4
         VLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+kCs5exBVf15EyFPRNxtW6htUqbihnKSWAGioBZA7SE=;
        b=RHAgDzori9HUxC6lCyMR6ehv7cf5ADxcB2DIQKQhr0Dnq+2EcMct0ksa8r3m61C1tE
         0Is9fHfOa74wxiA0EjkSbNeWZWHS13RcJ3tj9GFbt6W23mj/1IyNmsEQU8JnebM9Xlrx
         yqg0o+ES/JaCoRn/gWWcg5u+aeMSYWuFf3UMMRxod9t9bRjSc/xyCkl36AyLYNy1pYJ3
         z2vt2qinOCyKgRerrjSec9BTekBEZ7Ta9JqDnGqbG2Dxnf/4nQBfGz+gWvdQRnaVDJiS
         cgSvbcaHjdso7NGOGcoZKEEsgWyEfrSzFpOXN9jjofXfAXpXD8ShcqMrU88OaxD8E8sH
         xrlg==
X-Gm-Message-State: AOAM530qT92X7+JnJ92+SZmwm1rPU9VdeM6LSM/65XSTwTkoiLrMEzw+
        82/jiUdUCNLSbR/nSvwHcfKj77oczvkxFJTe
X-Google-Smtp-Source: ABdhPJxG1lIRNghs6Sh8zKcuPx7qO1ln6OW92kJVS2vy1fYbcKZ8VNPPbC9n66rUqaQaPAhyQnSAww==
X-Received: by 2002:a62:1c0c:0:b029:2b7:6dd2:adb3 with SMTP id c12-20020a621c0c0000b02902b76dd2adb3mr29663118pfc.44.1621945411953;
        Tue, 25 May 2021 05:23:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v27sm4542095pfi.169.2021.05.25.05.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:23:31 -0700 (PDT)
Message-ID: <60acec43.1c69fb81.2f63f.ea4d@mx.google.com>
Date:   Tue, 25 May 2021 05:23:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-25-v5.13-rc3
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 3 regressions (renesas-devel-2021-05-25-v5.13-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 3 regressions (renesas-devel-2021-=
05-25-v5.13-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-25-v5.13-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-25-v5.13-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d6e14d563167f1d9eb028bfec40b214368fc5c82

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


  Details:     https://kernelci.org/test/plan/id/60acdafa348ed118f7b3afa4

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-25-v5.13-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-25-v5.13-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210503.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/60acdafa348ed118f7b3afdd
        failing since 77 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-25 11:09:12.160000+00:00  Pipe D does not exist or not enabled
    2021-05-25 11:09:12.168000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-25 11:09:12.176000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-25 11:09:12.180000+00:00  Pipe E does not exist or not enabled
    2021-05-25 11:09:12.191000+00:00  Test requirement not met in function =
igt_require_pipe, fi<6>[  145.171215] Console: switching to colour dummy de=
vice 80x25
    2021-05-25 11:09:12.194000+00:00  le ../lib/igt_kms.c:2094:
    2021-05-25 11:09:12.203000+00:00  Test requirement: !(pipe >=3D display=
-><14>[  145.181907] [IGT] kms_vblank: executing
    2021-05-25 11:09:12.206000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-05-25 11:09:12.216000+00:00  Pipe F does not exist<14>[  145.19371=
2] [IGT] kms_vblank: starting subtest pipe-B-ts-continuation-idle
    2021-05-25 11:09:12.219000+00:00   or not enabled =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/60acdafa348ed118f7b3afe0
        failing since 77 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-25 11:09:16.575000+00:00  <14>[  149.559642] [IGT] kms_vblank: =
executing
    2021-05-25 11:09:16.591000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)<14>[  149.566397] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-05-25 11:09:16.592000+00:00  =

    2021-05-25 11:09:16.597000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-05-25 11:09:17.535000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-25 11:09:17.544000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-25 11:09:17.551000+00:00  (kms_vblank:779) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-25 11:09:17.552000+00:00  Stack trace:
    2021-05-25 11:09:17.557000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert()
    2021-05-25 11:09:17.560000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/60acdafa348ed118f7b3afe2
        failing since 77 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-25 11:09:20.780000+00:00  <14>[  153.764989] [IGT] kms_vblank: =
executing
    2021-05-25 11:09:20.795000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)<14>[  153.771223] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-05-25 11:09:20.796000+00:00  =

    2021-05-25 11:09:20.800000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-05-25 11:09:21.722000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-25 11:09:21.731000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-25 11:09:21.738000+00:00  (kms_vblank:785) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-25 11:09:21.739000+00:00  Stack trace:
    2021-05-25 11:09:21.743000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert()
    2021-05-25 11:09:21.747000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =

 =20
