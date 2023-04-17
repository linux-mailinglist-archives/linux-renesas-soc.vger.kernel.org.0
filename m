Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E010E6E47AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 14:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjDQM2w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 08:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjDQM2t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 08:28:49 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394467EF2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 05:28:24 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b5312bd4fso4977661b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681734502; x=1684326502;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=flNf14jmZQk5umdU7t/YFP24+qpUoG5c5g0Uyr1kvio=;
        b=jNbCiWow8DWDRjJc5KD4TgYvYtIFR1LW6MvjMev4STg8wUuwIjusGBCBPJShiMmfyy
         OL0DOF/tMZn+lvRBHU8UAHymz5We03Jsa11TrEOyaRzQpHVNXyrzwFs6MgKyBnezTfSm
         Tjpw4exJ3xwC0AutA3/ABzXt6MualDVMdkaSLwPxWr+OzpjzpG/+bRysmC0XP5a1D5sG
         TPv0R8ElwNXErQNLfh71Dy5STdfMSI1ma1/9MgDpB8rtCjHybEJiif8/QGa1h7OsNx+2
         UvaEgqePAYHSvr7zjLKcIgX3ug4uw0l+8LRuQ9BqFGUbPa8QaX4q3ssX8Vjlf5T57dkl
         X+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681734502; x=1684326502;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flNf14jmZQk5umdU7t/YFP24+qpUoG5c5g0Uyr1kvio=;
        b=CXaTnNRqY4HwXNOj5xKR7Av6oT1JsJOgL6ki4WZVdjBFf4GiVSC3qKFcHe60OGDahN
         oX6UxKiLLBHPH5Xgd5+SNeIf1xn+dAglW9+D3JugFEr1p1uqM00Cyo0XErOFJCnFuhro
         FBIy3EZkwgXS04ZmX+YIyUB4KKEbFOwdLtdRqGBb7OSzO1YQXGYwPxJxWJei1T84C2qu
         CeECua3U0jkE99Mj7WIZ/66AXJhpJCTL/GilmOOAEw6g/KGfxVU674IBFamj+0Wy2+Ki
         2oI5gzVFpEpvrNxxOm1zb1+N5gv/8Ij730dUxqwicwGmodfWN0owj1Pl3ON1VxKSxTKY
         lT4w==
X-Gm-Message-State: AAQBX9e6KprC+gz6RaCh5c/FAoMYp/HUrP41K82V7B4PVQvwxJPY7yZ4
        AjiYIM3Kzc3BVKE35/+ep6Z1+Gmcjj+RikKknjLcrLcv
X-Google-Smtp-Source: AKy350adnLuo/oSRfkNv/KPu3h7batlec0BubzMZ1ZOLCr+laj2zb8IPxoIN1WIJRXooMvpDTbLgRQ==
X-Received: by 2002:a05:6a00:8013:b0:63b:7489:f77 with SMTP id eg19-20020a056a00801300b0063b74890f77mr12722596pfb.0.1681734502042;
        Mon, 17 Apr 2023 05:28:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c17-20020a62e811000000b0063b8f17768dsm2066404pfi.129.2023.04.17.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 05:28:21 -0700 (PDT)
Message-ID: <643d3b65.620a0220.4a0f2.388a@mx.google.com>
Date:   Mon, 17 Apr 2023 05:28:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-04-17-v6.3-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-04-17-v6.3-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-04-17-v6.3-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-17-v6.3-rc7/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-17-v6.3-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53ed7cc3a28d0a629a2167e35a25cccbdc64ed42

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  28d9a3c4fb4c99aafc31b288b3f735e19e728d64
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  b4252c86f4470e6b2d1201b1cf11d991bc5710eb =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/643d2d91adcc9061372e8609

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230407.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/643d2d91adcc9061372e8696
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:15.136068  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<8>[   67.933105] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wai=
t-busy-hang RESULT=3Dskip>

    2023-04-17T11:27:15.136883  splay->pipes[pipe].enabled)

    2023-04-17T11:27:15.140357  Pipe F does not exist or not enabled

    2023-04-17T11:27:15.159462  <6>[   67.964309] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:15.164698  <14>[   67.970949] [IGT] kms_vblank: execut=
ing

    2023-04-17T11:27:15.178822  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   67.976800] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-04-17T11:27:15.179567  )

    2023-04-17T11:27:15.183074  Starting subtest: pipe-A-wait-forked-busy

    2023-04-17T11:27:15.258613  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-04-17T11:27:15.514962  (kms_vblank:607) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/643d2d91adcc9061372e8698
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:13.873987  Test requirement: !(pipe >=3D display->n_pi=
pes<8>[   66.669996] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-forke=
d-hang RESULT=3Dskip>

    2023-04-17T11:27:13.877038   || !display->pipes[pipe].enabled)

    2023-04-17T11:27:13.880464  Pipe F does not exist or not enabled

    2023-04-17T11:27:13.901374  <6>[   66.706240] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:13.906407  <14>[   66.712970] [IGT] kms_vblank: execut=
ing

    2023-04-17T11:27:13.920044  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   66.718700] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-04-17T11:27:13.920443  )

    2023-04-17T11:27:13.923123  Starting subtest: pipe-A-wait-busy

    2023-04-17T11:27:13.991961  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-04-17T11:27:14.247838  (kms_vblank:600) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (86 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/643d2d91adcc9061372e869a
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:12.603090  <6>[   65.407337] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:12.607449  <14>[   65.414050] [IGT] kms_vblank: execut=
ing

    2023-04-17T11:27:12.621133  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   65.419767] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-04-17T11:27:12.621613  )

    2023-04-17T11:27:12.625247  Starting subtest: pipe-A-wait-forked

    2023-04-17T11:27:12.708725  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-04-17T11:27:12.982543  (kms_vblank:593) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-17T11:27:12.992812  (kms_vblank:589) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-17T11:27:13.002852  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-17T11:27:13.012821  (kms_vblank:594) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/643d2d91adcc9061372e869c
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:11.244639  s.c:2362:

    2023-04-17T11:27:11.251353  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-17T11:27:11.254655  Pipe D does not exist or not enabled

    2023-04-17T11:27:11.263499  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2362:

    2023-04-17T11:27:11.270558  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-17T11:27:11.279917  Pipe E does not exist or no<6>[   64.081798=
] Console: switching to colour dummy device 80x25

    2023-04-17T11:27:11.281631  t enabled

    2023-04-17T11:27:11.290413  Test requirement not met in function igt_re=
quire_pipe<14>[   64.091601] [IGT] kms_vblank: executing

    2023-04-17T11:27:11.294533  , file ../lib/igt_kms.c:2362:

    2023-04-17T11:27:11.303514  Test requirement: !(pipe >=3D displ<14>[   =
64.103862] [IGT] kms_vblank: starting subtest pipe-A-wait-idle
 =

    ... (92 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/643d2d91adcc9061372e869e
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:09.976245  | !display->pipes[pipe].enabled)

    2023-04-17T11:27:09.979747  Pipe F does not exist or not enabled

    2023-04-17T11:27:10.009618  <6>[   62.813934] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:10.014838  <14>[   62.820639] [IGT] kms_vblank: execut=
ing

    2023-04-17T11:27:10.028556  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   62.827169] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-04-17T11:27:10.029399  )

    2023-04-17T11:27:10.032880  Starting subtest: pipe-A-query-forked-busy

    2023-04-17T11:27:10.110200  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-04-17T11:27:10.414450  (kms_vblank:574) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-17T11:27:10.424476  (kms_vblank:572) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/643d2d91adcc9061372e86a0
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:08.731360  Test requirement: !(pipe >=3D display->n_pi=
pes || !<8>[   61.531407] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query=
-forked-hang RESULT=3Dskip>

    2023-04-17T11:27:08.734184  display->pipes[pipe].enabled)

    2023-04-17T11:27:08.738273  Pipe D does not exist or not enabled

    2023-04-17T11:27:08.746197  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2362:

    2023-04-17T11:27:08.753691  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-17T11:27:08.762908  Pipe E does not exist o<6>[   61.561952] Co=
nsole: switching to colour dummy device 80x25

    2023-04-17T11:27:08.764417  r not enabled

    2023-04-17T11:27:08.773641  Test requirement not met in function igt_re=
quire_<14>[   61.574460] [IGT] kms_vblank: executing

    2023-04-17T11:27:08.777635  pipe, file ../lib/igt_kms.c:2362:

    2023-04-17T11:27:08.787317  Test requirement: !(pipe >=3D d<14>[   61.5=
86404] [IGT] kms_vblank: starting subtest pipe-A-query-busy
 =

    ... (92 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/643d2d91adcc9061372e86a2
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:07.382412  /igt_kms.c:2362:

    2023-04-17T11:27:07.390600  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-17T11:27:07.393809  Pipe F does not exist or not enabled

    2023-04-17T11:27:07.406902  <6>[   60.211330] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:07.411226  <14>[   60.218002] [IGT] kms_vblank: execut=
ing

    2023-04-17T11:27:07.425396  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   60.223757] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-04-17T11:27:07.425878  )

    2023-04-17T11:27:07.429697  Starting subtest: pipe-A-query-forked

    2023-04-17T11:27:07.510101  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-04-17T11:27:07.898533  (kms_vblank:556) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/643d2d91adcc9061372e86a4
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:06.104221  <6>[   58.908443] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:06.108735  <14>[   58.915133] [IGT] kms_vblank: execut=
ing

    2023-04-17T11:27:06.121871  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   58.921433] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-04-17T11:27:06.122634  )

    2023-04-17T11:27:06.126394  Starting subtest: pipe-A-query-idle

    2023-04-17T11:27:06.210840  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-04-17T11:27:06.649310  (kms_vblank:546) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-17T11:27:06.656717  (kms_vblank:546) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-17T11:27:06.663044  (kms_vblank:546) CRITICAL: Last errno: 22, =
Invalid argument

    2023-04-17T11:27:06.666786  (kms_vblank:546) CRITICAL: error: -22 !=3D 0
 =

    ... (81 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/643d2d91adcc9061372e86a5
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:04.788780  <6>[   57.592937] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:04.792585  <14>[   57.599568] [IGT] kms_vblank: execut=
ing

    2023-04-17T11:27:04.806656  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   57.605292] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-04-17T11:27:04.807151  )

    2023-04-17T11:27:04.811298  Starting subtest: pipe-A-accuracy-idle

    2023-04-17T11:27:04.894522  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-04-17T11:27:05.365685  (kms_vblank:542) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-04-17T11:27:05.372656  (kms_vblank:542) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-17T11:27:05.379157  (kms_vblank:542) CRITICAL: Last errno: 22, =
Invalid argument

    2023-04-17T11:27:05.383251  (kms_vblank:542) CRITICAL: error: -22 !=3D 0
 =

    ... (83 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
43d2d91adcc9061372e86ae
        failing since 303 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-17T11:27:00.819318  <8>[   53.625736] <LAVA_SIGNAL_TESTSET STOP>

    2023-04-17T11:27:00.858902  <8>[   53.664439] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-04-17T11:27:00.895883  <6>[   53.700101] Console: switching to col=
our dummy device 80x25

    2023-04-17T11:27:00.901099  <14>[   53.706760] [IGT] kms_setmode: execu=
ting

    2023-04-17T11:27:00.913049  IGT-Version: 1.27.1-gb4252c8 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   53.712052] [IGT] kms_setmode: starting subtest=
 basic

    2023-04-17T11:27:00.913533  )

    2023-04-17T11:27:00.915840  Starting subtest: basic

    2023-04-17T11:27:00.919725  Testing: basic 1 connector combinations

    2023-04-17T11:27:01.028115  <14>[   53.831508] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-04-17T11:27:01.031994  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (76 line(s) more)  =

 =20
