Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8DE6DC65E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 13:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjDJLnn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 07:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjDJLnm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 07:43:42 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9174EE3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 04:43:40 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id h24-20020a17090a9c1800b002404be7920aso4126276pjp.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681127020; x=1683719020;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+Ul2qQqH0tE59GAP8ciGGfMbS+Fo5+Jj5wFB0iYMPY=;
        b=tTB65FGh+j5p54PMPekRKde1Rn/trQeOEY8A8k/SyNjNJQDz7ZG3n0fMM0/Ofd77fd
         9ySokosek579N9EwC5E4a75HQkMZ8bK6UDrCb748CPmkHQEEfbh8bqypSVcnZvvmHJ2s
         Aqbrep4AeffK53kc/NLl3mMWubOMsMMWrhHBRbboovVVZ4BT/N3FLJG10rDAHgvEihtW
         LySq3BvJcSGwhpTbQ/lTEXpFH9Xds72Xn0qflXgBYeV12pipZC85dbfwSDs2qEmiQUV3
         sMkpDCvH9SHDIxeJGG3e27bHWjd+o2C3R+Fdn9IB2PczLzeeKvHTX1iloNwnpKCmioZ5
         C0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681127020; x=1683719020;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+Ul2qQqH0tE59GAP8ciGGfMbS+Fo5+Jj5wFB0iYMPY=;
        b=zhq+xJBpLaL0Fua3dPUwjT0bniTdJORozEltSsS0I2eq7nPl+v14H9LDe065UJylp7
         JfTAkB44vpYoYZFUniFocfCLtE1WwXD3R/SmclNkOYh/Qs3sERAFociTyG+qTd4HkNKC
         4eRx2QNTFG+ekIAsVVTlOlFEBS4TyQn+nSAzqK94FAsv627eyEe3TbdS3QU+tmaevnRS
         rPY78uxiuyGeCQvhpgq/XDJMR1uVfkn3N1c6LynJZOfPl66KCWGYgcr14gD0gb3RFJuN
         ANjRg7M0z93aiHB0VLr0HuSFotKg5kMWrnP/WXHPXokgHy3QgVco5ypP7MHVfkelWxfI
         Vr4g==
X-Gm-Message-State: AAQBX9fCdOSz9AhEYtSfqIsFti+bhoAltkGH34F83tMJlU7nyqFIwwfq
        OrR1CccEOPwIpjxYbktVJQcgSuFInxvMUlDldfyfJQ==
X-Google-Smtp-Source: AKy350ZnKXoKSxTKBMPUJB8bDeb18AvZ2HMcOHlgE6ZYe+rg/ATEsNf5eCgsl83z0SfsycgUeHKi6w==
X-Received: by 2002:a05:6a20:c101:b0:d8:e59f:408c with SMTP id bh1-20020a056a20c10100b000d8e59f408cmr7133976pzb.33.1681127019736;
        Mon, 10 Apr 2023 04:43:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a4-20020aa780c4000000b00627e87f51a5sm7658821pfn.161.2023.04.10.04.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 04:43:39 -0700 (PDT)
Message-ID: <6433f66b.a70a0220.2e07d.d5b5@mx.google.com>
Date:   Mon, 10 Apr 2023 04:43:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-10-v6.3-rc6
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-04-10-v6.3-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-04-10-v6.3-rc6)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-10-v6.3-rc6/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-10-v6.3-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5715ce18c1fd304f842f76a49a615fc0ace2320f

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  28d9a3c4fb4c99aafc31b288b3f735e19e728d64
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  94188a1dc91b6ef1cf3e9df1440ff00b6ff25935 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6433e3c7d06a6803a079e968

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230331.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6433e3c8d06a6803a079e9f5
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:22:03.257093  splay->pipes[pipe].enabled)

    2023-04-10T10:22:03.261646  Pipe F does not exist or not enabled

    2023-04-10T10:22:03.296706  <6>[   68.575620] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:22:03.301238  <14>[   68.582345] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:22:03.315871  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   68.588578] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-04-10T10:22:03.316011  )

    2023-04-10T10:22:03.319395  Starting subtest: pipe-A-wait-forked-busy

    2023-04-10T10:22:03.399446  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-04-10T10:22:03.639146  (kms_vblank:607) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-10T10:22:03.649546  (kms_vblank:605) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6433e3c8d06a6803a079e9f7
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:22:02.047794  =3D display->n_pipes || !display->pipes[pip=
e].enabled)

    2023-04-10T10:22:02.051158  Pipe F does not exist or not enabled

    2023-04-10T10:22:02.083079  <6>[   67.362429] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:22:02.088074  <14>[   67.369121] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:22:02.101108  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   67.375582] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-04-10T10:22:02.102167  )

    2023-04-10T10:22:02.105600  Starting subtest: pipe-A-wait-busy

    2023-04-10T10:22:02.182467  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-04-10T10:22:02.422195  (kms_vblank:597) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-10T10:22:02.429574  (kms_vblank:597) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (84 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6433e3c8d06a6803a079e9f9
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:22:00.790360  <8>[   66.067056] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>

    2023-04-10T10:22:00.837603  <6>[   66.116487] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:22:00.842878  <14>[   66.123610] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:22:00.855863  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   66.129939] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-04-10T10:22:00.856559  )

    2023-04-10T10:22:00.860034  Starting subtest: pipe-A-wait-forked

    2023-04-10T10:22:00.949876  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-04-10T10:22:01.205860  (kms_vblank:589) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-10T10:22:01.215499  (kms_vblank:587) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-10T10:22:01.225886  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6433e3c8d06a6803a079e9fb
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:21:59.479905  <8>[   64.750947] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>

    2023-04-10T10:21:59.480011  =


    2023-04-10T10:21:59.488690  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2362:

    2023-04-10T10:21:59.496028  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-10T10:21:59.500132  Pipe E does not exist or not enabled

    2023-04-10T10:21:59.508275  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2362:

    2023-04-10T10:21:59.516225  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-10T10:21:59.519675  Pipe F does not exist or not enabled

    2023-04-10T10:21:59.525961  <6>[   64.803886] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:21:59.530321  <14>[   64.811810] [IGT] kms_vblank: execut=
ing
 =

    ... (91 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6433e3c8d06a6803a079e9fd
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:21:58.246361  <6>[   63.525130] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:21:58.250474  <14>[   63.531850] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:21:58.265808  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   63.538337] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-04-10T10:21:58.265942  )

    2023-04-10T10:21:58.270447  Starting subtest: pipe-A-query-forked-busy

    2023-04-10T10:21:58.351432  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-04-10T10:21:58.640411  (kms_vblank:568) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-10T10:21:58.650454  (kms_vblank:571) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-10T10:21:58.660334  (kms_vblank:569) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-10T10:21:58.671357  (kms_vblank:570) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6433e3c8d06a6803a079e9ff
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:21:56.966151  lib/igt_kms.c:2362:

    2023-04-10T10:21:56.974281  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-10T10:21:56.977237  Pipe F does not exist or not enabled

    2023-04-10T10:21:57.004781  <6>[   62.283612] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:21:57.009861  <14>[   62.290302] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:21:57.023730  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   62.296641] [IGT] kms_vblank: starting subtest =
pipe-A-query-busy

    2023-04-10T10:21:57.023819  )

    2023-04-10T10:21:57.026406  Starting subtest: pipe-A-query-busy

    2023-04-10T10:21:57.117885  Beginning pipe-A-query-busy on pipe A, conn=
ector eDP-1

    2023-04-10T10:21:57.456648  (kms_vblank:560) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (86 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6433e3c8d06a6803a079ea01
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:21:55.605684  Pipe F does not exist or not e<8>[   60.876=
658] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang RESULT=3Ds=
kip>

    2023-04-10T10:21:55.606449  nabled

    2023-04-10T10:21:55.640812  <6>[   60.919571] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:21:55.645625  <14>[   60.926694] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:21:55.660065  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   60.933016] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-04-10T10:21:55.660160  )

    2023-04-10T10:21:55.663860  Starting subtest: pipe-A-query-forked

    2023-04-10T10:21:55.751302  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-04-10T10:21:56.107416  (kms_vblank:550) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-10T10:21:56.116926  (kms_vblank:553) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6433e3c8d06a6803a079ea03
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:21:54.326201  <6>[   59.605260] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:21:54.331760  <14>[   59.611984] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:21:54.345379  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   59.617713] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-04-10T10:21:54.345492  )

    2023-04-10T10:21:54.348707  Starting subtest: pipe-A-query-idle

    2023-04-10T10:21:54.434698  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-04-10T10:21:54.856571  (kms_vblank:542) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-10T10:21:54.863564  (kms_vblank:542) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-10T10:21:54.868660  (kms_vblank:542) CRITICAL: Last errno: 22, =
Invalid argument

    2023-04-10T10:21:54.873507  (kms_vblank:542) CRITICAL: error: -22 !=3D 0
 =

    ... (83 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6433e3c8d06a6803a079ea04
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:21:53.046671  <6>[   58.325329] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:21:53.051893  <14>[   58.332041] [IGT] kms_vblank: execut=
ing

    2023-04-10T10:21:53.064685  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   58.337894] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-04-10T10:21:53.065452  )

    2023-04-10T10:21:53.069371  Starting subtest: pipe-A-accuracy-idle

    2023-04-10T10:21:53.151572  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-04-10T10:21:53.624443  (kms_vblank:539) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-04-10T10:21:53.631590  (kms_vblank:539) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-10T10:21:53.637789  (kms_vblank:539) CRITICAL: Last errno: 22, =
Invalid argument

    2023-04-10T10:21:53.641960  (kms_vblank:539) CRITICAL: error: -22 !=3D 0
 =

    ... (83 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
433e3c8d06a6803a079ea0d
        failing since 296 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-10T10:21:49.057113  <8>[   54.337686] <LAVA_SIGNAL_TESTSET STOP>

    2023-04-10T10:21:49.095202  <8>[   54.375078] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-04-10T10:21:49.133946  <6>[   54.412481] Console: switching to col=
our dummy device 80x25

    2023-04-10T10:21:49.138078  <14>[   54.419171] [IGT] kms_setmode: execu=
ting

    2023-04-10T10:21:49.151061  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc6 aarch64<14>[   54.424404] [IGT] kms_setmode: starting subtest=
 basic

    2023-04-10T10:21:49.151793  )

    2023-04-10T10:21:49.153847  Starting subtest: basic

    2023-04-10T10:21:49.157902  Testing: basic 1 connector combinations

    2023-04-10T10:21:49.266620  <14>[   54.544563] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-04-10T10:21:49.271189  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
