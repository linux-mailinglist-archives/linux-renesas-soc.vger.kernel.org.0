Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4384B354D49
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 09:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbhDFHGz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 03:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbhDFHGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:06:54 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75956C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Apr 2021 00:06:47 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id d10so4840391pgf.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Apr 2021 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=adkJ6DjWiRuo+VZGsAcXwXZhpVoDG7rs5RNyn3Cq7bQ=;
        b=0pXdavK1wulB5Bu7kk8Zw8Vn457Ncw37cbrWNrszpAdAVLKOcKZcfdRXlI86vibNW2
         BTBwf7ZMDul75DvocDt6dcSSGYMHaIoo/xiTLntzjb2E9lpO+ANwMwnELun2ABJgxU+m
         6plvn5VJoGgZz816EQ5rg6ykitlxAj3ytpplCu9yYSX60igRsf35Ye2GjWpCiXwsIu/e
         77bfiLcvkqzB0S0gwEB9G2iqW67vr+PdT+kEUUl5oRwLfLhe989xwnenEqdksyNxlwh3
         YBBQWBQ2N6DLL6id+2s7iI8cDPIef1V7UZWfMibipMMDLFfnFh8QMo7pGgCqCvpwjFcq
         7LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=adkJ6DjWiRuo+VZGsAcXwXZhpVoDG7rs5RNyn3Cq7bQ=;
        b=qW90qGWHJgR64IYT24OMlwpOl+VZgNc1YJkVmYBYy9oEvAxZAB7j0wJeobrlYT0wOr
         xawU3XtU1vwXZyeKrTxrwXouILn0/9P2rD8MKp5Ida2tElHwHPKBSKcn7SxoBkug76Hh
         IQdXnJ5COQ7yAOStS3MrL2F4fWDQ1CXWzTqBmiMOniH3YKU431tswfxRRfuxJF/VzOe2
         BDXCVuCFuDuoe0qZlKvi4sAlJsdgRrGf6ewkT1Ch6S6MybrUw55/vEddI3VALqbAiTkc
         yY8Zds8F8QxSJJHjG/04B84Sr3euGr3Qwuj6agj3W8luI/vRcLq79Zw+mVa/JT/vp0ih
         i7bA==
X-Gm-Message-State: AOAM533boAD1uAmth1Zy254Vhvk1EIcsQWe9xf7tEags8nb3kA2q+ekJ
        8LRfA3vbp9fw2bodNi9kvyYCGu9GbjETQh70
X-Google-Smtp-Source: ABdhPJyrG+muLzxfQGoXDzfbtuprrchI/oR+Y/WKh2O476rVHqCwLbNv3WflKpvrM9azwDBNgxCcoQ==
X-Received: by 2002:a63:e903:: with SMTP id i3mr21017390pgh.374.1617692806817;
        Tue, 06 Apr 2021 00:06:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x33sm909395pfu.71.2021.04.06.00.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:06:46 -0700 (PDT)
Message-ID: <606c0886.1c69fb81.ca3c1.2949@mx.google.com>
Date:   Tue, 06 Apr 2021 00:06:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-05-v5.12-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 3 regressions (renesas-devel-2021-04-05-v5.12-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 3 regressions (renesas-devel-2021-=
04-05-v5.12-rc6)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-05-v5.12-rc6/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-05-v5.12-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea0aa7f2e67d781466efc1f9867e42062aa6e685

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  cd3681976c3bbefa08236be86551c11bd4599c88
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2c2fc6470646eb5e25fc6ea02449ef744f8b70c2 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:     https://kernelci.org/test/plan/id/606bf5b6da4fe2fd95dac6c5

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210324.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/606bf5b7da4fe2fd95dac74b
        failing since 28 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-06 05:45:55.689000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-06 05:45:55.692000+00:00  Pipe E does not exist or not enabled
    2021-04-06 05:45:55.700000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-06 05:45:55.710000+00:00  Test requirement: !(pipe >=3D display=
-><6>[  143.737510] Console: switching to colour dummy device 80x25
    2021-04-06 05:45:55.715000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-04-06 05:45:55.722000+00:00  Pipe F does not exist<14>[  143.74780=
7] [IGT] kms_vblank: executing
    2021-04-06 05:45:55.723000+00:00   or not enabled
    2021-04-06 05:45:55.738000+00:00  IGT-Version: 1.25-g2c2fc64 (aarch64) =
(Linux: 5.12.0-rc6 aarch64)<14>[  143.759643] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-04-06 05:45:55.738000+00:00  =

    2021-04-06 05:45:55.742000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-idle =

    ... (67 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/606bf5b7da4fe2fd95dac74e
        failing since 28 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-06 05:46:00.787000+00:00  <14>[  148.819518] [IGT] kms_vblank: =
executing
    2021-04-06 05:46:00.804000+00:00  IGT-Version: 1.25-g2c2fc64 (aarch64) =
(Linux: 5.12.0-rc6 aarch64)<14>[  148.826513] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-04-06 05:46:00.805000+00:00  =

    2021-04-06 05:46:00.810000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-04-06 05:46:01.719000+00:00  (kms_vblank:774) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-04-06 05:46:01.728000+00:00  (kms_vblank:774) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-04-06 05:46:01.735000+00:00  (kms_vblank:774) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-04-06 05:46:01.737000+00:00  Stack trace:
    2021-04-06 05:46:01.741000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-04-06 05:46:01.744000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/606bf5b7da4fe2fd95dac750
        failing since 28 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-06 05:46:05.668000+00:00  <6>[  153.698333] Console: switching =
to colour dummy device 80x25
    2021-04-06 05:46:05.673000+00:00  <14>[  153.705023] [IGT] kms_vblank: =
executing
    2021-04-06 05:46:05.689000+00:00  IGT-Version: 1.25-g2c2fc64 (aarch64) =
(Linux: 5.12.0-rc6 aarch64)<14>[  153.712013] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-04-06 05:46:05.690000+00:00  =

    2021-04-06 05:46:05.694000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-04-06 05:46:06.623000+00:00  (kms_vblank:780) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-04-06 05:46:06.632000+00:00  (kms_vblank:780) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-04-06 05:46:06.639000+00:00  (kms_vblank:780) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-04-06 05:46:06.641000+00:00  Stack trace:
    2021-04-06 05:46:06.645000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =

 =20
