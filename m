Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7082F6AC99C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 18:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjCFRRG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 12:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjCFRRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 12:17:03 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D781C12BEE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 09:16:37 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id ce7so6275436pfb.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2023 09:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678122927;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JrSSKuKEtSrsFbTdqCqv8YVNuQ94IriewRmdgnolMNc=;
        b=1vt48ILWhlpNEMO9NbDUReNJRzjatFLQhBHUAn6I+jRkf2LQyd4LY4MMW68y0R9f4t
         y+vALA1J9bVraJl8/WtdxLAksgqzFoE+udpwiTRi9c98Bndg94i40HTnOy7uWsrjoF1W
         vmLMUcYfRjxJ20ox6It61weh6GcFLwTGX1Ml3EkLOk+qnDt6C91YwKlwSwthlPGhXvvF
         N8iiK2uHUx81+vWY2wotqUQRk8OnkBC8EnO35CCZ3jPh5azfPGCWidlEzogpAJ87upGA
         1/39kB4Kc3ZqwwNzqUcqU0tHXrg0fwxDIdHLT+x6zVrcDXwKZOV7+5C1Ybs+7pFP8HVx
         th4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678122927;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrSSKuKEtSrsFbTdqCqv8YVNuQ94IriewRmdgnolMNc=;
        b=Jmlfm6XkbbtHCx8uhRGvta5tNU8z2ThWyIejcrzn6B0bxT8c9IrIjjYORr7vKDewU2
         xkv6Ej7N7Xs3gWltOHXDF7XK4jPBR80Y5PJF1l8U2QENLn+xtjA5Y1x17+Xa3PqypOXa
         H7HYz38D457s+qlq5OIG2Tywag5CSkrYuGqvkfNIdDNYFr7ERBfN1Am0lczre9pyCgDf
         J0tR2cHKWyixT2QWUy3+YsLzrppquyf3mH+OfZHF2FrU+ITOH24Rz1Qz1Ndxrg87u2NK
         a3F8L8gjzPW1+9r5KIFeE07AzQ7UsPCFkMsezQw56E0jZtLlXzJRJdElpROnRlQpJaN4
         IwFw==
X-Gm-Message-State: AO0yUKVe28sn/ZKYxXy4MQfErKYhqeK8jwRB09b0LDoEwKE1bHC7gamf
        DsaZhb4FseCQVp0jqdydpjMnKFum/w71YUumVJ3VW4yT
X-Google-Smtp-Source: AK7set895iK/3N56HmMIGTI53ZdyIdDo+zyrneSRJUpwMGP02Acga7qeky1YofQfXGfz/hLbuzTyDg==
X-Received: by 2002:a62:1d53:0:b0:593:91e4:99e2 with SMTP id d80-20020a621d53000000b0059391e499e2mr10998319pfd.34.1678122927157;
        Mon, 06 Mar 2023 09:15:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b0061998311344sm4337319pff.211.2023.03.06.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 09:15:26 -0800 (PST)
Message-ID: <64061fae.620a0220.a38e3.6445@mx.google.com>
Date:   Mon, 06 Mar 2023 09:15:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-06-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-03-06-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-03-06-v6.3-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-06-v6.3-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-06-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8b20ccdf60a58fb8e57af56ff0fb030a25a59871

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  332809f3ee19f07abc03b62d5892fae51b9d9902
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  deab4e0bdf5a9366b67d0a44f478f3da3c9a943b =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6406124a0a713495268c8630

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230224.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6406124a0a713495268c8638
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:15:58.788192  Test requirem<8>[   65.077001] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>

    2023-03-06T16:15:58.795258  ent: !(pipe >=3D display->n_pipes || !displ=
ay->pipes[pipe].enabled)

    2023-03-06T16:15:58.798244  Pipe E does not exist or not enabled

    2023-03-06T16:15:58.806847  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2361:

    2023-03-06T16:15:58.814504  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-03-06T16:15:58.818344  Pipe F does not exist or not enabled

    2023-03-06T16:15:58.824324  <6>[   65.118607] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:15:58.829783  <14>[   65.126593] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:15:58.842629  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   65.132760] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle

    2023-03-06T16:15:58.843029  )
 =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6406124a0a713495268c863a
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:15:57.508064  <8>[   63.800684] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>

    2023-03-06T16:15:57.541774  <6>[   63.836999] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:15:57.546997  <14>[   63.844348] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:15:57.561504  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   63.850679] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-03-06T16:15:57.562367  )

    2023-03-06T16:15:57.566514  Starting subtest: pipe-A-query-forked-busy

    2023-03-06T16:15:57.654841  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-03-06T16:15:57.959588  (kms_vblank:575) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-03-06T16:15:57.970095  (kms_vblank:577) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-03-06T16:15:57.980066  (kms_vblank:578) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6406124a0a713495268c863c
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:15:56.291189  nction igt_require_pipe, file ../lib/igt_km=
s.c:2361:

    2023-03-06T16:15:56.299070  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-03-06T16:15:56.302376  Pipe F does not exist or not enabled

    2023-03-06T16:15:56.315451  <6>[   62.610367] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:15:56.320150  <14>[   62.617042] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:15:56.333108  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   62.622824] [IGT] kms_vblank: starting subtest =
pipe-A-query-busy

    2023-03-06T16:15:56.333846  )

    2023-03-06T16:15:56.337432  Starting subtest: pipe-A-query-busy

    2023-03-06T16:15:56.421125  Beginning pipe-A-query-busy on pipe A, conn=
ector eDP-1

    2023-03-06T16:15:56.743861  (kms_vblank:567) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (82 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6406124a0a713495268c863e
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:15:54.943225  <8>[   61.234530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-query-idle-hang RESULT=3Dskip>

    2023-03-06T16:15:54.976775  <6>[   61.270949] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:15:54.981388  <14>[   61.278486] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:15:54.994933  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   61.284950] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-03-06T16:15:54.996038  )

    2023-03-06T16:15:54.999148  Starting subtest: pipe-A-query-forked

    2023-03-06T16:15:55.088267  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-03-06T16:15:55.459997  (kms_vblank:556) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-03-06T16:15:55.470103  (kms_vblank:559) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-03-06T16:15:55.480764  (kms_vblank:558) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6406124a0a713495268c8640
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:15:53.657227  <6>[   59.952384] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:15:53.662246  <14>[   59.959066] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:15:53.676382  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   59.966951] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-03-06T16:15:53.677199  )

    2023-03-06T16:15:53.679917  Starting subtest: pipe-A-query-idle

    2023-03-06T16:15:53.771572  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-03-06T16:15:54.176925  (kms_vblank:549) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-03-06T16:15:54.184395  (kms_vblank:549) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-06T16:15:54.190108  (kms_vblank:549) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-06T16:15:54.194223  (kms_vblank:549) CRITICAL: error: -22 !=3D 0
 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6406124a0a713495268c8641
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:15:52.314493  <8>[   58.607500] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>

    2023-03-06T16:15:52.348502  <6>[   58.643278] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:15:52.352692  <14>[   58.650026] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:15:52.366717  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   58.656424] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-03-06T16:15:52.367624  )

    2023-03-06T16:15:52.371372  Starting subtest: pipe-A-accuracy-idle

    2023-03-06T16:15:52.472381  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-03-06T16:15:52.961267  (kms_vblank:546) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:

    2023-03-06T16:15:52.968403  (kms_vblank:546) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-06T16:15:52.973976  (kms_vblank:546) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (81 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6406124a0a713495268c86ca
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:16:02.473851  gt_kms.c:2361:

    2023-03-06T16:16:02.481117  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-03-06T16:16:02.484609  Pipe F does not exist or not enabled

    2023-03-06T16:16:02.506721  <6>[   68.802084] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:16:02.511368  <14>[   68.808744] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:16:02.525947  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   68.815059] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-03-06T16:16:02.526449  )

    2023-03-06T16:16:02.530064  Starting subtest: pipe-A-wait-forked-busy

    2023-03-06T16:16:02.619903  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-03-06T16:16:02.859404  (kms_vblank:611) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6406124a0a713495268c86cc
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:16:01.253140  Test requirement: !(pipe >=3D display->n_pi=
pes || !displ<8>[   67.542879] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-=
wait-forked-hang RESULT=3Dskip>

    2023-03-06T16:16:01.255944  ay->pipes[pipe].enabled)

    2023-03-06T16:16:01.259078  Pipe E does not exist or not enabled

    2023-03-06T16:16:01.267810  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2361:

    2023-03-06T16:16:01.275404  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-03-06T16:16:01.279044  Pipe F does not exist or not enabled

    2023-03-06T16:16:01.288476  <6>[   67.583836] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:16:01.292958  <14>[   67.590507] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:16:01.306567  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   67.596721] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-03-06T16:16:01.306689  )
 =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6406124a0a713495268c86ce
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:16:00.061218  Test requirement: !(pipe >=3D <8>[   66.354=
246] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dsk=
ip>

    2023-03-06T16:16:00.066124  display->n_pipes || !display->pipes[pipe].e=
nabled)

    2023-03-06T16:16:00.069538  Pipe F does not exist or not enabled

    2023-03-06T16:16:00.085841  <6>[   66.380817] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:16:00.090590  <14>[   66.387505] [IGT] kms_vblank: execut=
ing

    2023-03-06T16:16:00.104051  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   66.393206] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-03-06T16:16:00.104747  )

    2023-03-06T16:16:00.108127  Starting subtest: pipe-A-wait-forked

    2023-03-06T16:16:00.186598  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-03-06T16:16:00.443686  (kms_vblank:597) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
406124a0a713495268c86d5
        failing since 262 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-06T16:15:48.376791  <8>[   54.668643] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>

    2023-03-06T16:15:48.383020  <8>[   54.680088] <LAVA_SIGNAL_TESTSET STOP>

    2023-03-06T16:15:48.428866  <8>[   54.723181] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-03-06T16:15:48.464003  <6>[   54.759131] Console: switching to col=
our dummy device 80x25

    2023-03-06T16:15:48.469246  <14>[   54.765827] [IGT] kms_setmode: execu=
ting

    2023-03-06T16:15:48.481378  IGT-Version: 1.27.1-gdeab4e0 (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   54.771101] [IGT] kms_setmode: starting subtest=
 basic

    2023-03-06T16:15:48.482191  )

    2023-03-06T16:15:48.484552  Starting subtest: basic

    2023-03-06T16:15:48.488282  Testing: basic 1 connector combinations

    2023-03-06T16:15:48.601093  <14>[   54.894770] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
 =

    ... (78 line(s) more)  =

 =20
