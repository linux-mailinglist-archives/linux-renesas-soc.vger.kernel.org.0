Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933545BC9A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 12:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiISKjs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 06:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiISKhr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 06:37:47 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4758D2CE0A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 03:21:17 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a80so19036828pfa.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=4ygfG6g48hAWs3D/y8wBlJDEhcPMAKT0JX6XfIiEqlI=;
        b=cTfifssMYIjYZMsydptOMWc6bdBaGK3pKNA8OF+zHAvMfIVZpyn0aSa/A9pzmYlQFD
         szISwUNtL7S3Nw0VKm/sfU5kzNNXa1Yw4eJi/mqgkyUYBYb3sjoZQywzNLNN5NIf3hbJ
         HxDJoiLD9erIP3eqS669i2ziYj5LEeWtn9icyrURoroHIxzdnCLbEO71vgdSE6pjEh1i
         7t0aIzn8vfpgAoXWcjX2GbI/3Kka8DCk6cTW0co5zAQg0EDS+CJNuZ1JgQfZ7flZ7SYp
         qsOsS9yl6y5h+1n0zmfX9u9lmI3x00H4nwdpwY1uzc9N/kqjhY3oR656my9bfVBleqcS
         WHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=4ygfG6g48hAWs3D/y8wBlJDEhcPMAKT0JX6XfIiEqlI=;
        b=S5RKwbnCjIXIqrhS7582eIjGcqWDqY5Ui2/H7Jz+em1nFEcp+cj+sTuHbFI6FNvazQ
         O8PkcAUsQi9836bUkkLeRiM1jaKnqb4TrNaCpFtO3ofLzGjWa6gGeGfn0Q0nXGxsx0w6
         DMRJnlmDuKXUyd2Vz3Lij1TsqCTBh2oY7tWioinopSwItDC6OB8+rfxVmi4AqmWXrmWi
         28YqrfrezbDP8KwDr9Jy1TFgzRBpszomdJoepNoK5/gTT6+dkOiRjehGcwjkAA/BSc9+
         2o+wNcNpOC4UXjsFvKo7pDhIhtlw5Yu+HZRTTwHJb1OD2Y+Y+HFiQQBep36ny6xFftRW
         RTqA==
X-Gm-Message-State: ACrzQf0xLJG+iPj/fqUeEjnx2lj3lWBvNms4UGkbLnJac4YqgnfnJCah
        waoTMzfcTO1grSrAEtA59CCqIok/tuMPyq4JAYY=
X-Google-Smtp-Source: AMsMyM6WIbafe3yrw3wIoerIH2aCPFuK+iSgeLA8jnoPvOJ99NFMocIa7OXdU5kCbE19B7Yis8sfow==
X-Received: by 2002:a63:91c3:0:b0:439:c38a:1a95 with SMTP id l186-20020a6391c3000000b00439c38a1a95mr11476058pge.568.1663582873065;
        Mon, 19 Sep 2022 03:21:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y189-20020a6232c6000000b0053e19468443sm19757479pfy.37.2022.09.19.03.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 03:21:12 -0700 (PDT)
Message-ID: <63284298.620a0220.ae68d.1f72@mx.google.com>
Date:   Mon, 19 Sep 2022 03:21:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-19-v6.0-rc6
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2022-09-19-v6.0-rc6)
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

renesas/master igt-kms-rockchip: 2 runs, 10 regressions (renesas-devel-2022=
-09-19-v6.0-rc6)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-19-v6.0-rc6/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-19-v6.0-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5c8e5995413313a628eb0f9ea0d9ae6641854298

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  d4bb19e2c49de32a01cef56ad739cc10e9afd237
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1298b5f0e1b3e010657ffba41d2e775fab028e08 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63283731e36b55bc4d355650

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-19-v6.0-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-19-v6.0-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220826.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63283731e36b55bc4d3556de
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:31.335120  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].<8>[   57.600252] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpipe-A-wait-busy-hang RESULT=3Dskip>
    2022-09-19T09:30:31.335928  enabled)
    2022-09-19T09:30:31.339965  Pipe D does not exist or not enabled
    2022-09-19T09:30:31.348135  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-19T09:30:31.355688  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-19T09:30:31.359205  Pipe E does not exist or not enabled
    2022-09-19T09:30:31.366921  Test r<6>[   57.637983] Console: switching =
to colour dummy device 80x25
    2022-09-19T09:30:31.377516  equirement not met in function igt_require_=
pipe, file ../lib/igt<14>[   57.644714] [IGT] kms_vblank: executing
    2022-09-19T09:30:31.378949  _kms.c:2281:
    2022-09-19T09:30:31.391297  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   57.656589] [IGT] kms_vblank: starting subtest pipe-A-wait-=
forked-busy =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63283731e36b55bc4d3556e0
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:30.251647  Test requirement not met in function igt_re=
<8>[   56.518696] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-forked-h=
ang RESULT=3Dskip>
    2022-09-19T09:30:30.254101  quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-19T09:30:30.262418  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-19T09:30:30.265520  Pipe E does not exist or not enabled
    2022-09-19T09:30:30.275131  Test requirement not met in funct<6>[   56.=
545739] Console: switching to colour dummy device 80x25
    2022-09-19T09:30:30.280197  ion igt_require_pipe, file ../lib/igt_kms.c=
:2281:
    2022-09-19T09:30:30.286136  Test requirem<14>[   56.553147] [IGT] kms_v=
blank: executing
    2022-09-19T09:30:30.299447  ent: !(pipe >=3D display->n_pipes || !displ=
ay->pipes[pipe].enabled<14>[   56.565087] [IGT] kms_vblank: starting subtes=
t pipe-A-wait-busy
    2022-09-19T09:30:30.299819  )
    2022-09-19T09:30:30.303331  Pipe F does not exist or not enabled =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63283731e36b55bc4d3556e2
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:29.179636  Test r<8>[   55.443435] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-09-19T09:30:29.185709  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-09-19T09:30:29.189612  Pipe D does not exist or not enabled
    2022-09-19T09:30:29.197458  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-19T09:30:29.204750  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-19T09:30:29.208845  Pipe E does not exist or not enabled
    2022-09-19T09:30:29.216514  Test r<6>[   55.484057] Console: switching =
to colour dummy device 80x25
    2022-09-19T09:30:29.226604  equirement not met in function igt_require_=
pipe, file ../lib/igt<14>[   55.493873] [IGT] kms_vblank: executing
    2022-09-19T09:30:29.228422  _kms.c:2281:
    2022-09-19T09:30:29.240679  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   55.506179] [IGT] kms_vblank: starting subtest pipe-A-wait-=
forked =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63283731e36b55bc4d3556e4
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:28.103841  (kms_vblank:607) igt_kms-DEBUG: display:<8>=
[   54.369340] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-bus=
y-hang RESULT=3Dskip>
    2022-09-19T09:30:28.104251   }
    2022-09-19T09:30:28.111828  (kms_vblank:607) igt_debugfs-DEBUG: Opening=
 debugfs directory '/sys/kernel/debug/dri/0'
    2022-09-19T09:30:28.120270  (kms_vblank:607) INFO: Beginning pipe-A-que=
ry-forked-busy on pipe A, connector eDP-1
    2022-09-19T09:30:28.124219  (kms_vblank:607) DEBUG: Spawning 6 threads
    2022-09-19T09:30:28.126018  ****  END  ****
    2022-09-19T09:30:28.131763  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.705s)[0m
    2022-09-19T09:30:28.140690  Test requirement not me<6>[   54.407500] Co=
nsole: switching to colour dummy device 80x25
    2022-09-19T09:30:28.147313  t in function igt_require_pipe, file ../lib=
/igt_kms.c:2281:
    2022-09-19T09:30:28.151276  Tes<14>[   54.418639] [IGT] kms_vblank: exe=
cuting =

    ... (117 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63283731e36b55bc4d3556e6
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:27.072773  (0.000s)[0m
    2022-09-19T09:30:27.080802  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-19T09:30:27.088722  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-19T09:30:27.096317  Pipe C does no<6>[   53.367834] Console: sw=
itching to colour dummy device 80x25
    2022-09-19T09:30:27.099113  t exist or not enabled
    2022-09-19T09:30:27.107327  Test requirement not met in function igt<14=
>[   53.374639] [IGT] kms_vblank: executing
    2022-09-19T09:30:27.112156  _require_pipe, file ../lib/igt_kms.c:2281:
    2022-09-19T09:30:27.121974  Test requirement: !(<14>[   53.386483] [IGT=
] kms_vblank: starting subtest pipe-A-query-forked-busy
    2022-09-19T09:30:27.127612  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-09-19T09:30:27.131212  Pipe D does not exist or not enabled =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63283731e36b55bc4d3556e8
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:26.028180  :589) igt_debugfs-DEBUG: Opening debugfs di=
rectory '/sys/kernel/debug/dri/0'
    2022-09-19T09:30:26.035890  (kms_vblank:589) INFO: Beginning pipe-A-que=
ry-forked on pipe A, connector eDP-1
    2022-09-19T09:30:26.039941  (kms_vblank:589) DEBUG: Spawning 6 threads
    2022-09-19T09:30:26.041727  ****  END  ****
    2022-09-19T09:30:26.047060  [1mSubtest pipe-A-query-forked: FAIL (0.755=
s)[0m
    2022-09-19T09:30:26.058219  Test requirement not met in function igt_re=
quire<6>[   52.326058] Console: switching to colour dummy device 80x25
    2022-09-19T09:30:26.062039  _pipe, file ../lib/igt_kms.c:2281:
    2022-09-19T09:30:26.068939  Test requirement: !(pipe >=3D <14>[   52.33=
6363] [IGT] kms_vblank: executing
    2022-09-19T09:30:26.074616  display->n_pipes || !display->pipes[pipe].e=
nabled)
    2022-09-19T09:30:26.082371  Pipe C does <14>[   52.348641] [IGT] kms_vb=
lank: starting subtest pipe-A-query-busy =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63283731e36b55bc4d3556ea
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:24.922640  splay->n_pipes || !display->pipes[pipe].ena=
bled)
    2022-09-19T09:30:24.926070  Pipe C does not exist or not enabled
    2022-09-19T09:30:24.934366  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-19T09:30:24.942350  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-19T09:30:24.945808  Pipe D does not exist or not enabled
    2022-09-19T09:30:24.955491  Test requirement not met in fu<6>[   51.223=
725] Console: switching to colour dummy device 80x25
    2022-09-19T09:30:24.960937  nction igt_require_pipe, file ../lib/igt_km=
s.c:2281:
    2022-09-19T09:30:24.966340  Test requi<14>[   51.233448] [IGT] kms_vbla=
nk: executing
    2022-09-19T09:30:24.979630  rement: !(pipe >=3D display->n_pipes || !di=
splay->pipes[pipe].enab<14>[   51.245670] [IGT] kms_vblank: starting subtes=
t pipe-A-query-forked
    2022-09-19T09:30:24.981298  led) =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63283731e36b55bc4d3556ec
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:23.808975  <8>[   50.077806] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-09-19T09:30:23.844726  <6>[   50.116008] Console: switching to col=
our dummy device 80x25
    2022-09-19T09:30:23.850102  <14>[   50.122734] [IGT] kms_vblank: execut=
ing
    2022-09-19T09:30:23.863390  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc6 aarch64)<14>[   50.131160] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-09-19T09:30:23.864164  =

    2022-09-19T09:30:23.867368  Starting subtest: pipe-A-query-idle
    2022-09-19T09:30:23.940721  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-09-19T09:30:24.278290  (kms_vblank:583) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-09-19T09:30:24.286209  (kms_vblank:583) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-19T09:30:24.291817  (kms_vblank:583) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63283731e36b55bc4d3556ed
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:22.733545  <8>[   49.002678] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-09-19T09:30:22.773637  <6>[   49.044619] Console: switching to col=
our dummy device 80x25
    2022-09-19T09:30:22.778851  <14>[   49.051729] [IGT] kms_vblank: execut=
ing
    2022-09-19T09:30:22.793236  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc6 aarch64)<14>[   49.058089] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-09-19T09:30:22.794116  =

    2022-09-19T09:30:22.797108  Starting subtest: pipe-A-accuracy-idle
    2022-09-19T09:30:22.875012  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-09-19T09:30:23.247807  (kms_vblank:580) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-09-19T09:30:23.254119  (kms_vblank:580) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-19T09:30:23.260015  (kms_vblank:580) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3283731e36b55bc4d35570d
        failing since 93 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-19T09:30:19.500333  <8>[   45.772471] <LAVA_SIGNAL_TESTSET STOP>
    2022-09-19T09:30:19.538009  <8>[   45.810338] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-09-19T09:30:19.572681  <6>[   45.843597] Console: switching to col=
our dummy device 80x25
    2022-09-19T09:30:19.577398  <14>[   45.850278] [IGT] kms_setmode: execu=
ting
    2022-09-19T09:30:19.590114  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc6 aarch64)<14>[   45.855621] [IGT] kms_setmode: starting subtest =
basic
    2022-09-19T09:30:19.592659  Starting subtest: basic
    2022-09-19T09:30:19.596329  Testing: basic 1 connector combinations
    2022-09-19T09:30:19.699321  <14>[   45.968678] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-09-19T09:30:19.702842  Starting dynamic subtest: pipe-A-eDP-1
    2022-09-19T09:30:19.705627    Test id#1 CRTC count 1 =

    ... (76 line(s) more)  =

 =20
