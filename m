Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0A769CB5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Feb 2023 13:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjBTMtf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Feb 2023 07:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbjBTMtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Feb 2023 07:49:17 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A781D910
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Feb 2023 04:48:44 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id s5so1166922plg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Feb 2023 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q/Pfau/1aWUIKI+0rMbZ4++Qkrkijje42qVIk+n0E3k=;
        b=Npip9ZkZQmA46HxTCUWaXuwfgDvV8bkEedQgqhX/5SSqNyLsnFppW6o1UpLc/6BnSj
         IHxa0C2+oHL3euOKS07P0TBCx+7/F7IrVofGvNWRM0Iq4wTAw3eEgTlm+stf1yMQ9gXP
         LRjsI0H7l3vlM0CDesfq0r9B3DPYT7v+M02zxZOf58LwbRf4ByGOf7QyzzTEYV/yHQxP
         iYiPJzrv0tAEvlhHMNwblEhmZD/e8f6fPqqxKQ/ZFDmvwwmWkIeTiEOuUKGJg+htKZa4
         SRXH739Jc1YpcpkQuduMY0k3GHW8WDlHrPFHYzzw8cw9BA2ivCfuKbqwOSI3JMbLeRGQ
         DGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/Pfau/1aWUIKI+0rMbZ4++Qkrkijje42qVIk+n0E3k=;
        b=gp6Ei5O6zyI+vNmva6St8lfjuGh/WDixOIrHFcSSgZFNKX5WVX0L2K7ykmnDBX0cLa
         +aZ6XPP8/Q7kN2S0s8Ysa0ARFZnh7bxN7jF5iPu0OjpD+d5f9fMVSWL4Ddtg0lTAQmYj
         z84HmtRuEXEE2JUH8VLS7am7TVuP2n6KMTmx4SZIfeXxu38BS1hIj215OxxaPtTBN4DW
         re9UCfbPMGu5rXdwxx2F/Y1jvq/oCmZBUje8IwNlcM08xtrSLiuRM41K/cryBcIkD9Bc
         eTmY5EiZPuCev5BiWx9zWRdPrURGiruUK4IWqMv4iCP+MxDuji8hqHXqF0gOg2/cCdmz
         tClA==
X-Gm-Message-State: AO0yUKXX6bEU8G/mADapY7DoUCDBrT04bcQy37TqSUa2kTxCsLuaMHnu
        9YPygVgfhaWnkT1yam2fENotRCe4qCpvKAaa0Cg=
X-Google-Smtp-Source: AK7set/p/bKIK4rKtIshkpPkrmuGfa2q0LVQ/vLI2hJQPCkcXVbO1zc0gjeb1IImQsugq7FPbsaYIA==
X-Received: by 2002:a17:902:c40d:b0:19a:b312:bf3f with SMTP id k13-20020a170902c40d00b0019ab312bf3fmr4653828plk.47.1676897323855;
        Mon, 20 Feb 2023 04:48:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902868d00b0019a859739c5sm1324943plo.94.2023.02.20.04.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 04:48:43 -0800 (PST)
Message-ID: <63f36c2b.170a0220.2efe0.2125@mx.google.com>
Date:   Mon, 20 Feb 2023 04:48:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-02-20-v6.2
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-02-20-v6.2)
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
-02-20-v6.2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-20-v6.2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-20-v6.2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9737ff6b7ac85bfd246c51d8df015cb8635f35c5

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  c6d6dce99fb3e7e681fbba9e198345fdbd10e49e
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  d2ca8db8bf83a19034eee61c11ec01a4e973e0ed =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63f35bfc9affaaf0248c8644

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230211.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63f35bfc9affaaf0248c86d1
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:35.907740  <6>[   68.823671] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:35.912994  <14>[   68.830308] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:35.919098  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:35.926510  <14>[   68.836042] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-forked-busy

    2023-02-20T11:37:35.930136  Starting subtest: pipe-A-wait-forked-busy

    2023-02-20T11:37:36.015172  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-02-20T11:37:36.269609  (kms_vblank:607) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-20T11:37:36.279986  (kms_vblank:609) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-20T11:37:36.291033  (kms_vblank:608) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-20T11:37:36.301072  (kms_vblank:611) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (111 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63f35bfc9affaaf0248c86d3
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:34.600001  =3D display->n_pipes || !display->pipes[pip=
e].enabled)

    2023-02-20T11:37:34.603379  Pipe F does not exist or not enabled

    2023-02-20T11:37:34.620475  <6>[   67.536403] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:34.624724  <14>[   67.543088] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:34.631704  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:34.638373  <14>[   67.548848] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-busy

    2023-02-20T11:37:34.641954  Starting subtest: pipe-A-wait-busy

    2023-02-20T11:37:34.731485  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-02-20T11:37:34.988494  (kms_vblank:600) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-20T11:37:34.995394  (kms_vblank:600) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (82 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63f35bfc9affaaf0248c86d5
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:33.334446  <6>[   66.250621] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:33.339464  <14>[   66.257757] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:33.346227  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:33.353688  <14>[   66.264123] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-forked

    2023-02-20T11:37:33.357911  Starting subtest: pipe-A-wait-forked

    2023-02-20T11:37:33.448987  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-02-20T11:37:33.737484  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-20T11:37:33.748034  (kms_vblank:594) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-20T11:37:33.758431  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-20T11:37:33.764896  (kms_vblank:592) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (111 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63f35bfc9affaaf0248c86d7
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:31.982200  rement not met in function igt_require_pipe=
, file ../lib/igt_kms.c:2361:

    2023-02-20T11:37:31.990392  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-02-20T11:37:31.993599  Pipe F does not exist or not enabled

    2023-02-20T11:37:32.017020  <6>[   64.933484] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:32.022031  <14>[   64.940122] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:32.029486  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:32.036026  <14>[   64.946332] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-idle

    2023-02-20T11:37:32.039050  Starting subtest: pipe-A-wait-idle

    2023-02-20T11:37:32.132234  Beginning pipe-A-wait-idle on pipe A, conne=
ctor eDP-1

    2023-02-20T11:37:32.421683  (kms_vblank:582) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (83 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63f35bfc9affaaf0248c86d9
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:30.667086  display->pipes[pipe].enabled)

    2023-02-20T11:37:30.670798  Pipe F does not exist or not enabled

    2023-02-20T11:37:30.700265  <6>[   63.616093] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:30.705449  <14>[   63.623220] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:30.711878  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:30.720218  <14>[   63.629994] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked-busy

    2023-02-20T11:37:30.724837  Starting subtest: pipe-A-query-forked-busy

    2023-02-20T11:37:30.816715  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-02-20T11:37:31.121661  (kms_vblank:572) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-20T11:37:31.132506  (kms_vblank:575) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (118 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63f35bfc9affaaf0248c86db
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:29.430514  enabled

    2023-02-20T11:37:29.437480  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2361:

    2023-02-20T11:37:29.446331  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-02-20T11:37:29.449309  Pipe D does not exist or not enabled

    2023-02-20T11:37:29.460482  Test requirement not met in function igt_re=
qu<6>[   62.375002] Console: switching to colour dummy device 80x25

    2023-02-20T11:37:29.464552  ire_pipe, file ../lib/igt_kms.c:2361:

    2023-02-20T11:37:29.471537  Test requirement: !(pipe <14>[   62.382886]=
 [IGT] kms_vblank: executing

    2023-02-20T11:37:29.476870  >=3D display->n_pipes || !display->pipes[pi=
pe].enabled)

    2023-02-20T11:37:29.484281  Pipe E do<14>[   62.394774] [IGT] kms_vblan=
k: starting subtest pipe-A-query-busy

    2023-02-20T11:37:29.487828  es not exist or not enabled
 =

    ... (88 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63f35bfc9affaaf0248c86dd
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:28.084409  led

    2023-02-20T11:37:28.117883  <6>[   61.034053] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:28.122571  <14>[   61.040724] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:28.128834  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:28.137173  <14>[   61.046958] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked

    2023-02-20T11:37:28.140754  Starting subtest: pipe-A-query-forked

    2023-02-20T11:37:28.233369  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-02-20T11:37:28.621547  (kms_vblank:553) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-20T11:37:28.632027  (kms_vblank:555) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-20T11:37:28.641762  (kms_vblank:556) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63f35bfc9affaaf0248c86df
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:26.779225  <8>[   59.691636] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>

    2023-02-20T11:37:26.809737  <6>[   59.725885] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:26.814223  <14>[   59.732523] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:26.820791  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:26.828648  <14>[   59.738281] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle

    2023-02-20T11:37:26.831978  Starting subtest: pipe-A-query-idle

    2023-02-20T11:37:26.916697  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-02-20T11:37:27.339059  (kms_vblank:545) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-20T11:37:27.346008  (kms_vblank:545) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-20T11:37:27.352160  (kms_vblank:545) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63f35bfc9affaaf0248c86e0
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:25.493299  <6>[   58.409263] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:25.498393  <14>[   58.415888] [IGT] kms_vblank: execut=
ing

    2023-02-20T11:37:25.504783  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:25.511665  <14>[   58.421641] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle

    2023-02-20T11:37:25.515775  Starting subtest: pipe-A-accuracy-idle

    2023-02-20T11:37:25.601413  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-02-20T11:37:26.090012  (kms_vblank:542) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:

    2023-02-20T11:37:26.098108  (kms_vblank:542) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-20T11:37:26.102649  (kms_vblank:542) CRITICAL: Last errno: 22, =
Invalid argument

    2023-02-20T11:37:26.107653  (kms_vblank:542) CRITICAL: error: -22 !=3D 0
 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3f35bfc9affaaf0248c86e9
        failing since 247 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-20T11:37:21.431171  <8>[   54.348917] <LAVA_SIGNAL_TESTSET STOP>

    2023-02-20T11:37:21.473693  <8>[   54.390193] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-02-20T11:37:21.510951  <6>[   54.426598] Console: switching to col=
our dummy device 80x25

    2023-02-20T11:37:21.516644  <14>[   54.433254] [IGT] kms_setmode: execu=
ting

    2023-02-20T11:37:21.522174  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0 aarch64)

    2023-02-20T11:37:21.527789  <14>[   54.438625] [IGT] kms_setmode: start=
ing subtest basic

    2023-02-20T11:37:21.531360  Starting subtest: basic

    2023-02-20T11:37:21.534485  Testing: basic 1 connector combinations

    2023-02-20T11:37:21.642907  <14>[   54.556953] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-02-20T11:37:21.646605  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
