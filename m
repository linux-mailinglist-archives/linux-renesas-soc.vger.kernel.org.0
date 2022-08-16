Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5346E595A45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 13:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbiHPLe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 07:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbiHPLeA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 07:34:00 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1E446D8E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 03:56:06 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id f65so8881981pgc.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 03:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=CBYKSwfknjLCa9/vmZCaES70Pssh1hLjTSf83TcR61Y=;
        b=tQDvXb+ndhLql9pj31Wp4d1yQkl/BKSQIyQqgc4M4llNkno2QDSatwfXUG8Z9cKq7b
         7p5C+aNhp37Z+U4W+bLW+6n8JCO5y+4LaCR6tncveOxjdxAAGbMix14afOH4ZozcTs/Q
         ORGtI5eQbe5G6NoYDCf7W113PUg5eHkdCLISl/HarQASzjovGTwUcO1CLwdSkkBny09n
         ijszWLyIuAvbh2XdLJjZEilEVCjGIb0+whMp7+Yu8p+4anrFyBP79OhVm8vIFM0Lnx95
         6v0ujJJu/ZX435nK8hLfhaV0kdlAZ42DgCD07u4VrITmesrs3IF6E6QV9oXOTaoJ802b
         idDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=CBYKSwfknjLCa9/vmZCaES70Pssh1hLjTSf83TcR61Y=;
        b=rYyk8gI1UlThuPcoNw6wMi5ENXQvFKHPjwYfkkhzuSzYUxReRZMSnfPY5OOPuzl0RO
         Yhcbhcd8Anh0EDL3L98/KAsineZRBbVSpv9jBIJ6QNUkpOZ3yfPz35rpktLsJVRBhJga
         bR43MYX6/6WzST17uis/c12DwNbNzfI1vudQMKv6Xe+EVsSWfXxChWUXrIQ/Esufo2ka
         9r87jo9F2m6CI7DrBkeJeXgWUqJkY3MI4QRBpbtXUWTJUzs4CdXPQQfuLW7322byRYBU
         gFDkC5WaslKq5ejixSiyJmG2RWaGkx48psnBPNJs+XSWtizU+N8Vm6cmF/0cCEeJtRwr
         PlvA==
X-Gm-Message-State: ACgBeo3Gl74xHV2nbaPH2MkE6ugBz/h8FMDVo0vGXLseleJ1zBN4n2fu
        6BeAcrWPfwHKSUGrWRZJDb5R5Jv6e1tRRYra
X-Google-Smtp-Source: AA6agR5A+dlt38U5c4b98wswO/d7kRAufAlVZMcWbUHGlZB0q3Sj/y3O27V7A8QPC0mZy+iH8iFKYg==
X-Received: by 2002:a63:284:0:b0:41d:9b60:497c with SMTP id 126-20020a630284000000b0041d9b60497cmr17041885pgc.29.1660647365213;
        Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f17-20020a170902ab9100b00170953de050sm8718744plr.50.2022.08.16.03.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
Message-ID: <62fb77c5.170a0220.527c0.e984@mx.google.com>
Date:   Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-16-v6.0-rc1
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-08-16-v6.0-rc1)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2022=
-08-16-v6.0-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-16-v6.0-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-16-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a9c4a500b27ef2b4904a076bc44eb14dfefdff68

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98794e2a0d537f3376970918bf955361191720c7
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  c8edfca649da71b296d882bb0319181d94e619eb =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/62fb6715a565bb085c35565a

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220812.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62fb6715a565bb085c3556e8
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:58.632921  Test requirement: !(pipe >=3D display->n_pi=
pes || <8>[   58.047969] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-b=
usy-hang RESULT=3Dskip>
    2022-08-16T09:42:58.634848  !display->pipes[pipe].enabled)
    2022-08-16T09:42:58.638921  Pipe D does not exist or not enabled
    2022-08-16T09:42:58.646421  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:58.656857  Test requirement: !(pipe >=3D display->n<6>=
[   58.076770] Console: switching to colour dummy device 80x25
    2022-08-16T09:42:58.662383  <14>[   58.083562] [IGT] kms_vblank: execut=
ing
    2022-08-16T09:42:58.665982  _pipes || !display->pipes[pipe].enabled)
    2022-08-16T09:42:58.676086  Pipe E does not exist <14>[   58.089221] [I=
GT] kms_vblank: starting subtest pipe-A-wait-forked-busy
    2022-08-16T09:42:58.678241  or not enabled
    2022-08-16T09:42:58.686359  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281: =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62fb6715a565bb085c3556ea
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:57.569175  quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:57.577416  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-16T09:42:57.580867  Pipe E does not exist or not enabled
    2022-08-16T09:42:57.588623  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:57.596943  Test requirem<6>[   57.016164] Console: swi=
tching to colour dummy device 80x25
    2022-08-16T09:42:57.601148  <14>[   57.022863] [IGT] kms_vblank: execut=
ing
    2022-08-16T09:42:57.614517  ent: !(pipe >=3D display->n_pipes || !displ=
ay->pipes[pipe].enabled<14>[   57.028650] [IGT] kms_vblank: starting subtes=
t pipe-A-wait-busy
    2022-08-16T09:42:57.614605  )
    2022-08-16T09:42:57.618057  Pipe F does not exist or not enabled
    2022-08-16T09:42:57.624846  IGT-Version: 1.26-gc8edfca (aarch64) (Linux=
: 6.0.0-rc1 aarch64) =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62fb6715a565bb085c3556ec
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:56.508618  n function igt_require_pipe, file ../lib/ig=
t_kms.c:2281:
    2022-08-16T09:42:56.515430  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-16T09:42:56.518982  Pipe D does not exist or not enabled
    2022-08-16T09:42:56.533598  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:228<6>[   55.950104] Console: switching t=
o colour dummy device 80x25
    2022-08-16T09:42:56.534354  1:
    2022-08-16T09:42:56.545364  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pi<14>[   55.960006] [IGT] kms_vblank: executing
    2022-08-16T09:42:56.547486  pes[pipe].enabled)
    2022-08-16T09:42:56.550548  Pipe E does not exist or not enabled
    2022-08-16T09:42:56.558290  Test r<14>[   55.971923] [IGT] kms_vblank: =
starting subtest pipe-A-wait-forked
    2022-08-16T09:42:56.566505  equirement not met in function igt_require_=
pipe, file ../lib/igt_kms.c:2281: =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62fb6715a565bb085c3556ee
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:55.441936  pe-A-query-forked-busy on pipe A, connector=
 eDP-1
    2022-08-16T09:42:55.445356  (kms_vblank:609) DEBUG: Spawning 6 threads
    2022-08-16T09:42:55.447376  ****  END  ****
    2022-08-16T09:42:55.452277  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.705s)[0m
    2022-08-16T09:42:55.461912  Test requirement not me<6>[   54.880629] Co=
nsole: switching to colour dummy device 80x25
    2022-08-16T09:42:55.467943  t in function igt_require_pipe, file ../lib=
/igt_kms.c:2281:
    2022-08-16T09:42:55.472264  Tes<14>[   54.888070] [IGT] kms_vblank: exe=
cuting
    2022-08-16T09:42:55.486340  t requirement: !(pipe >=3D display->n_pipes=
 || !display->pipes[pip<14>[   54.899977] [IGT] kms_vblank: starting subtes=
t pipe-A-wait-idle
    2022-08-16T09:42:55.487791  e].enabled)
    2022-08-16T09:42:55.490513  Pipe C does not exist or not enabled =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62fb6715a565bb085c3556f0
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:54.386552  [1mSubtest pipe-A-query-busy-hang: SKIP <8>=
[   53.800090] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang =
RESULT=3Dskip>
    2022-08-16T09:42:54.387912  (0.000s)[0m
    2022-08-16T09:42:54.395669  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:54.403184  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-16T09:42:54.408067  Pipe C does not exist or not enabled
    2022-08-16T09:42:54.415658  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:54.424213  Test requirement: !(<6>[   53.840416] Conso=
le: switching to colour dummy device 80x25
    2022-08-16T09:42:54.430482  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-08-16T09:42:54.435373  Pipe<14>[   53.850507] [IGT] kms_vblank: ex=
ecuting
    2022-08-16T09:42:54.438183   D does not exist or not enabled =

    ... (109 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62fb6715a565bb085c3556f2
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:53.362036  irement not met in function igt_require_pip=
e, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:53.369307  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-16T09:42:53.372755  Pipe C does not exist or not enabled
    2022-08-16T09:42:53.386214  Test requirement not met in function igt_re=
quire_pipe, file ../<6>[   52.802218] Console: switching to colour dummy de=
vice 80x25
    2022-08-16T09:42:53.387584  lib/igt_kms.c:2281:
    2022-08-16T09:42:53.397233  Test requirement: !(pipe >=3D display->n_pi=
pe<14>[   52.812013] [IGT] kms_vblank: executing
    2022-08-16T09:42:53.399893  s || !display->pipes[pipe].enabled)
    2022-08-16T09:42:53.410847  Pipe D does not exist or no<14>[   52.82395=
0] [IGT] kms_vblank: starting subtest pipe-A-query-busy
    2022-08-16T09:42:53.411589  t enabled
    2022-08-16T09:42:53.419064  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281: =

    ... (100 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62fb6715a565bb085c3556f4
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:52.256425  t exist or not enabled
    2022-08-16T09:42:52.264672  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:52.272456  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-16T09:42:52.276147  Pipe D does not exist or not enabled
    2022-08-16T09:42:52.284329  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-16T09:42:52.291228  Test requi<6>[   51.706916] Console: switch=
ing to colour dummy device 80x25
    2022-08-16T09:42:52.303165  rement: !(pipe >=3D display->n_pipes || !di=
splay->pipes[pipe].enab<14>[   51.718599] [IGT] kms_vblank: executing
    2022-08-16T09:42:52.303507  led)
    2022-08-16T09:42:52.306586  Pipe E does not exist or not enabled
    2022-08-16T09:42:52.316553  Test requirement not<14>[   51.730596] [IGT=
] kms_vblank: starting subtest pipe-A-query-forked =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62fb6715a565bb085c3556f6
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:51.181822  <8>[   50.595395] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-08-16T09:42:51.204892  <6>[   50.624210] Console: switching to col=
our dummy device 80x25
    2022-08-16T09:42:51.208970  <14>[   50.630908] [IGT] kms_vblank: execut=
ing
    2022-08-16T09:42:51.223093  IGT-Version: 1.26-gc8edfca (aarch64) (Linux=
: 6.0.0-rc1 aarch64)<14>[   50.636597] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-08-16T09:42:51.224017  =

    2022-08-16T09:42:51.226588  Starting subtest: pipe-A-query-idle
    2022-08-16T09:42:51.289361  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-08-16T09:42:51.612038  (kms_vblank:585) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-08-16T09:42:51.618864  (kms_vblank:585) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-16T09:42:51.624867  (kms_vblank:585) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (72 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62fb6715a565bb085c3556f7
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:50.166705  <6>[   49.586036] Console: switching to col=
our dummy device 80x25
    2022-08-16T09:42:50.170829  <14>[   49.592722] [IGT] kms_vblank: execut=
ing
    2022-08-16T09:42:50.185908  IGT-Version: 1.26-gc8edfca (aarch64) (Linux=
: 6.0.0-rc1 aarch64)<14>[   49.599097] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-08-16T09:42:50.189362  Starting subtest: pipe-A-accuracy-idle
    2022-08-16T09:42:50.273126  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-08-16T09:42:50.627063  (kms_vblank:582) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-08-16T09:42:50.633457  (kms_vblank:582) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-16T09:42:50.639287  (kms_vblank:582) CRITICAL: Last errno: 22, =
Invalid argument
    2022-08-16T09:42:50.644121  (kms_vblank:582) CRITICAL: error: -22 !=3D 0
    2022-08-16T09:42:50.645485  Stack trace: =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2fb6715a565bb085c355700
        failing since 59 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-16T09:42:46.822702  <8>[   46.238779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-08-16T09:42:46.827884  <8>[   46.249749] <LAVA_SIGNAL_TESTSET STOP>
    2022-08-16T09:42:46.864841  <8>[   46.284613] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-08-16T09:42:46.899105  <6>[   46.318053] Console: switching to col=
our dummy device 80x25
    2022-08-16T09:42:46.903866  <14>[   46.324722] [IGT] kms_setmode: execu=
ting
    2022-08-16T09:42:46.915930  IGT-Version: 1.26-gc8edfca (aarch64) (Linux=
: 6.0.0-rc1 aarch64)<14>[   46.329983] [IGT] kms_setmode: starting subtest =
basic
    2022-08-16T09:42:46.919285  Starting subtest: basic
    2022-08-16T09:42:46.921991  Testing: basic 1 connector combinations
    2022-08-16T09:42:47.029103  <14>[   46.446930] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-08-16T09:42:47.032279  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
