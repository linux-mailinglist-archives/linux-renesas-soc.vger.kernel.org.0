Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09AAB6D6D2F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 21:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbjDDTcc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 15:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235997AbjDDTca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 15:32:30 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1361D2D79
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 12:32:29 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id j13so31698088pjd.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 12:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680636748;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1qsnHaI0gp9yTWSIocL5u5Mm69u8JxyR6Y2nZ2qrp0U=;
        b=nc2AxYylxxmHnCWyjwyM18E0mTHHWv1qwKhPC1tegEbp2yzxUe7Sz5SEeIGuCv9l7p
         xzNUtnmlyolhKffBRFGpgPTkgF98fID2UE6qD3GUNkMiqx9jOSZ14sKDPFa5WhWYia3F
         3GJo14WRw5ydWCuseYgVz/VqcEaYAzWjaRoZd3sPetv6E3Fd4Nce0L3EVH+IwcI6zcHO
         9/qUK69d+Ufw19LlrqJHCaIg5qr/CKLdwhrwkIrx2ef0Jkar1kzBWoA3FeWBiomjfOmU
         tvA1u2KkCdqcYzL/xC1KdoYcW6CAJsPYrkk1H6cPSFlRCjgNfPIRlas9VFNcJcSLf3pj
         lyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680636748;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qsnHaI0gp9yTWSIocL5u5Mm69u8JxyR6Y2nZ2qrp0U=;
        b=XWuxsW+L/CDDnKgcwhuXC2KjHp2MFnqxM3HP3CyBGkvpPhslk24xWWnA0+MwtxAhzC
         OzqOwmM7j+8qw6O+xk+KPp/nkPj8OENiGhKWlsT8sDo9TiP6LBtH9VzubNG/5aRl/YGz
         Iv3Ul9DLZK1kLTR1CK5YPOirnJ7Siyas1fy8oIF7ROCY5u8kKgQJ20yYskrpVNHeQFW5
         97PiHVy0vK25amfG0xMX4RYPP2vtC51qO3GdKMxwKXDHJGpaZOOr/9A1BA17Mu4QsFWI
         hg0W+qeLx8mE50iLzoTCk+aPTsAU8onxMZLuuGgYUkyQrqEq6hB5IBT1lMtN2Kb0W986
         PU0w==
X-Gm-Message-State: AAQBX9c0OrYM8diEpue1TcW9PjlE7hbUS41Mg0udvSldIaBXxC/f6AIi
        ZO5cCS9o7SkTsimUoilTq2Qr5T3YPK/in9E0LbWx3A==
X-Google-Smtp-Source: AKy350bEwZXCorOyWujSOxf3azxcvMXyRKjj7OnLrMcvQJPAw1U3y6Z6e8lyaADSZuk2Dgw8RE0OHA==
X-Received: by 2002:a17:903:18a:b0:19c:f476:4793 with SMTP id z10-20020a170903018a00b0019cf4764793mr4878605plg.51.1680636748185;
        Tue, 04 Apr 2023 12:32:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iy5-20020a170903130500b0019e81c8fd01sm8694608plb.249.2023.04.04.12.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 12:32:27 -0700 (PDT)
Message-ID: <642c7b4b.170a0220.fdf53.2031@mx.google.com>
Date:   Tue, 04 Apr 2023 12:32:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-04-v6.3-rc5
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-04-04-v6.3-rc5)
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
-04-04-v6.3-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-04-v6.3-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-04-v6.3-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b4dd84fbb7628443a99f26465ef2fcee5c99583f

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


  Details:     https://kernelci.org/test/plan/id/642c674fb6cc75911c79e925

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230331.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/642c674fb6cc75911c79e9b2
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:55.528810  Pipe F does not exist or not ena<8>[   68.7=
05736] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-busy-hang RESULT=3D=
skip>

    2023-04-04T18:04:55.529056  bled

    2023-04-04T18:04:55.563280  <6>[   68.747817] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:55.567860  <14>[   68.754435] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:55.581646  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   68.760192] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-04-04T18:04:55.582201  )

    2023-04-04T18:04:55.586638  Starting subtest: pipe-A-wait-forked-busy

    2023-04-04T18:04:55.666400  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-04-04T18:04:55.906464  (kms_vblank:607) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-04T18:04:55.916850  (kms_vblank:610) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/642c674fb6cc75911c79e9b4
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:54.295076   enabled

    2023-04-04T18:04:54.320590  <6>[   67.504980] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:54.325052  <14>[   67.511646] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:54.338225  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   67.517336] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-04-04T18:04:54.339095  )

    2023-04-04T18:04:54.342507  Starting subtest: pipe-A-wait-busy

    2023-04-04T18:04:54.416424  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-04-04T18:04:54.672021  (kms_vblank:599) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-04T18:04:54.678611  (kms_vblank:599) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-04T18:04:54.684555  (kms_vblank:599) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (83 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/642c674fb6cc75911c79e9b6
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:52.970843  <8>[   66.152831] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>

    2023-04-04T18:04:53.005061  <6>[   66.189791] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:53.010009  <14>[   66.196497] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:53.023861  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   66.202716] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-04-04T18:04:53.024503  )

    2023-04-04T18:04:53.027971  Starting subtest: pipe-A-wait-forked

    2023-04-04T18:04:53.116977  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-04-04T18:04:53.406899  (kms_vblank:589) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-04T18:04:53.416618  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-04T18:04:53.426310  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/642c674fb6cc75911c79e9b8
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:51.614939  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c<8>[   64.791531] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>

    2023-04-04T18:04:51.615787  :2362:

    2023-04-04T18:04:51.623698  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-04T18:04:51.627292  Pipe F does not exist or not enabled

    2023-04-04T18:04:51.642387  <6>[   64.827218] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:51.647288  <14>[   64.833902] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:51.660951  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   64.839659] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle

    2023-04-04T18:04:51.661093  )

    2023-04-04T18:04:51.665121  Starting subtest: pipe-A-wait-idle

    2023-04-04T18:04:51.750107  Beginning pipe-A-wait-idle on pipe A, conne=
ctor eDP-1
 =

    ... (86 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/642c674fb6cc75911c79e9ba
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:50.295607  nabled

    2023-04-04T18:04:50.330695  <6>[   63.515095] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:50.335381  <14>[   63.521857] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:50.349450  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   63.528230] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-04-04T18:04:50.350668  )

    2023-04-04T18:04:50.354365  Starting subtest: pipe-A-query-forked-busy

    2023-04-04T18:04:50.435157  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-04-04T18:04:50.756320  (kms_vblank:573) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-04T18:04:50.766668  (kms_vblank:572) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-04T18:04:50.776411  (kms_vblank:570) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/642c674fb6cc75911c79e9bc
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:49.090600  requirement: has_ban_period || has_bannable

    2023-04-04T18:04:49.093193  Last errno: 22, Invalid argument

    2023-04-04T18:04:49.098731  =1B[1mSubtest pipe-A-query-forked-hang: SKI=
P (0.000s)=1B[0m

    2023-04-04T18:04:49.110627  Test requirement not met in function igt_re=
quire_pipe, f<6>[   62.294840] Console: switching to colour dummy device 80=
x25

    2023-04-04T18:04:49.113507  ile ../lib/igt_kms.c:2362:

    2023-04-04T18:04:49.121978  Test requirement: !(pipe >=3D display-<14>[=
   62.301939] [IGT] kms_vblank: executing

    2023-04-04T18:04:49.125758  >n_pipes || !display->pipes[pipe].enabled)

    2023-04-04T18:04:49.135206  Pipe C does not exis<14>[   62.313844] [IGT=
] kms_vblank: starting subtest pipe-A-query-busy

    2023-04-04T18:04:49.136703  t or not enabled

    2023-04-04T18:04:49.145619  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2362:
 =

    ... (97 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/642c674fb6cc75911c79e9be
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:47.778758  Pipe F does not exist or not e<8>[   60.956=
435] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang RESULT=3Ds=
kip>

    2023-04-04T18:04:47.779703  nabled

    2023-04-04T18:04:47.814113  <6>[   60.998275] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:47.818724  <14>[   61.005452] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:47.832774  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   61.011836] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-04-04T18:04:47.833317  )

    2023-04-04T18:04:47.836826  Starting subtest: pipe-A-query-forked

    2023-04-04T18:04:47.918785  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-04-04T18:04:48.289502  (kms_vblank:552) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-04T18:04:48.300420  (kms_vblank:553) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/642c674fb6cc75911c79e9c0
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:46.501794  <6>[   59.685538] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:46.506430  <14>[   59.692231] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:46.512994  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64)

    2023-04-04T18:04:46.520454  <14>[   59.704489] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle

    2023-04-04T18:04:46.524580  Starting subtest: pipe-A-query-idle

    2023-04-04T18:04:46.601481  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-04-04T18:04:47.039431  (kms_vblank:544) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-04T18:04:47.047145  (kms_vblank:544) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-04T18:04:47.053029  (kms_vblank:544) CRITICAL: Last errno: 22, =
Invalid argument

    2023-04-04T18:04:47.056992  (kms_vblank:544) CRITICAL: error: -22 !=3D 0
 =

    ... (83 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/642c674fb6cc75911c79e9c1
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:45.129584  <8>[   58.311236] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>

    2023-04-04T18:04:45.172423  <6>[   58.356684] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:45.177167  <14>[   58.363341] [IGT] kms_vblank: execut=
ing

    2023-04-04T18:04:45.190708  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   58.369887] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-04-04T18:04:45.191222  )

    2023-04-04T18:04:45.195438  Starting subtest: pipe-A-accuracy-idle

    2023-04-04T18:04:45.285630  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-04-04T18:04:45.758218  (kms_vblank:541) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-04-04T18:04:45.764757  (kms_vblank:541) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-04T18:04:45.771586  (kms_vblank:541) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (84 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
42c674fb6cc75911c79e9c7
        failing since 291 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-04T18:04:41.224688  <8>[   54.410768] <LAVA_SIGNAL_TESTSET STOP>

    2023-04-04T18:04:41.265721  <8>[   54.449459] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-04-04T18:04:41.290208  <6>[   54.474138] Console: switching to col=
our dummy device 80x25

    2023-04-04T18:04:41.294740  <14>[   54.480824] [IGT] kms_setmode: execu=
ting

    2023-04-04T18:04:41.306733  IGT-Version: 1.27.1-g94188a1 (aarch64) (Lin=
ux: 6.3.0-rc5 aarch64<14>[   54.485987] [IGT] kms_setmode: starting subtest=
 basic

    2023-04-04T18:04:41.307842  )

    2023-04-04T18:04:41.309899  Starting subtest: basic

    2023-04-04T18:04:41.313469  Testing: basic 1 connector combinations

    2023-04-04T18:04:41.407555  <14>[   54.590364] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-04-04T18:04:41.411673  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
