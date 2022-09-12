Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A315B5AE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Sep 2022 15:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiILNKx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 09:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiILNKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 09:10:51 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD4D1C121
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 06:10:48 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so12299927pjm.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=rXlH3IENKg/wGvEVNNW3Xh5ZzZc3DywvQhOcdE4AvB4=;
        b=1zs7q1qbZusz79GHIZe6NEIZdKKpml89WkxidUHUxBcCR9ESDgWQkKECdfGhQl+2k7
         CDdQgs4c29AvvGyqic2TJ/q5rbhy1GQc4iaFsU1Y1MC6Iee4BrgjNNf7XPzOy5qkAliq
         RhPn9b+qECirqqRx+YUCA7y/Vsp7z2VEpJlYeXWxanQ9PykP77OxOhNLqCz0yHlizPmk
         qwtZicu3MfeO92p6lRu+sW4UQt1SRpoGEwPQuPm2CBvOzLO7QJWahNCeQ14OB73h9Cz6
         XsuyRl6fHb/uCj6difny0fUL0xnkm4SYXFuCXw8v4r2XF9+Y7K0W2KNK1sNZ0WzSyuAP
         jokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=rXlH3IENKg/wGvEVNNW3Xh5ZzZc3DywvQhOcdE4AvB4=;
        b=aejTkRbCgcAcYEgE+6L39rk+uL8rgKZZ64rmLKxH86gtB6bjjHze/DVyO2waRIOdmQ
         eeqRYlhgx6eo8XFJ4avi6EbzaelVL5fqKcrjaXWDaP5UhqvwCUvXV8ar9kKLYXF0E+NV
         VrA3BQAKhNUoF0/r7HHLM1aXQLSM3pom56XZfmZAEmcLbeuoVR3GTA/v4CCoz8ET9YR7
         ionHg9xBu9fn+JO7+O/RN6k8z5bjyKYWVsE44/rUS1225shZbdcU+TpB092RuiCGz8LP
         WAA8QNTu0Gb+HbRV6cemJ+tuMJtyitIgfd0Hj8BsGf2TtsEJfvC9wbh1mj0A76b3SVV+
         CkMQ==
X-Gm-Message-State: ACgBeo1lOqzLjoeImFuESFSlMYBMMHwzK1KYFBNjP7AcvrMZEnOwd9JS
        AY+MAMgqQoJ4MwwmnOQo5Vi/8jqANkiEtoBiseQ=
X-Google-Smtp-Source: AA6agR5iv/5C/VqhliAnZit8/V8PQgEBflorXOO8aZowNehdeRiGgeTZnNr3YeusJmC5hVYL8wnnQQ==
X-Received: by 2002:a17:902:d381:b0:178:2a6f:bc80 with SMTP id e1-20020a170902d38100b001782a6fbc80mr6680136pld.64.1662988248043;
        Mon, 12 Sep 2022 06:10:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k29-20020aa7973d000000b00537ff911a89sm5416051pfg.105.2022.09.12.06.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 06:10:47 -0700 (PDT)
Message-ID: <631f2fd7.a70a0220.fc5cc.822b@mx.google.com>
Date:   Mon, 12 Sep 2022 06:10:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc5-843-g94f27a9ea269
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (v6.0-rc5-843-g94f27a9ea269)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (v6.0-rc5-843-g94f2=
7a9ea269)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.0=
-rc5-843-g94f27a9ea269/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: v6.0-rc5-843-g94f27a9ea269
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      94f27a9ea2691030ed8a87c33e1e6a0badc3bde9

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


  Details:     https://kernelci.org/test/plan/id/631f1e5e77e5afc4e235567f

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-kms-r=
ockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-kms-r=
ockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220826.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/631f1e5f77e5afc4e2355709
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:38.354469  Test requirement not met in function igt_re=
quire_pipe, file ../lib/i<8>[   53.311354] <LAVA_SIGNAL_TESTCASE TEST_CASE_=
ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-09-12T11:54:38.355215  gt_kms.c:2281:
    2022-09-12T11:54:38.363709  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-12T11:54:38.366862  Pipe D does not exist or not enabled
    2022-09-12T11:54:38.379050  Test requirement not met in function igt_re=
quire_pipe, fil<6>[   53.339703] Console: switching to colour dummy device =
80x25
    2022-09-12T11:54:38.381896  e ../lib/igt_kms.c:2281:
    2022-09-12T11:54:38.390648  Test requirement: !(pipe >=3D display->n<14=
>[   53.347056] [IGT] kms_vblank: executing
    2022-09-12T11:54:38.394109  _pipes || !display->pipes[pipe].enabled)
    2022-09-12T11:54:38.403493  Pipe E does not exist <14>[   53.358838] [I=
GT] kms_vblank: starting subtest pipe-A-wait-forked
    2022-09-12T11:54:38.405124  or not enabled =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/631f1e5f77e5afc4e235570b
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:37.295268  t_kms-DEBUG: display:     MoveCursor pipe B=
, (0, 0)
    2022-09-12T11:54:37.299226  (kms_vblank:610) igt_kms-DEBUG: display: }
    2022-09-12T11:54:37.307950  (kms_vblank:610) igt_debugfs-DEBUG: Opening=
 debugfs directory '/sys/kernel/debug/dri/0'
    2022-09-12T11:54:37.316406  (kms_vblank:610) INFO: Beginning pipe-A-que=
ry-forked-busy on pipe A, connector eDP-1
    2022-09-12T11:54:37.320619  (kms_vblank:610) DEBUG: Spawning 6 threads
    2022-09-12T11:54:37.327615  ****<6>[   52.284597] Console: switching to=
 colour dummy device 80x25
    2022-09-12T11:54:37.328652    END  ****
    2022-09-12T11:54:37.338624  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.697s)<14>[   52.295528] [IGT] kms_vblank: executing
    2022-09-12T11:54:37.339254  [0m
    2022-09-12T11:54:37.351803  Test requirement not met in function igt_re=
quire_pipe, fil<14>[   52.307706] [IGT] kms_vblank: starting subtest pipe-A=
-wait-idle =

    ... (117 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/631f1e5f77e5afc4e235570d
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:36.267991  Test requirement: !(pipe >=3D di<8>[   51.2=
25741] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=
=3Dskip>
    2022-09-12T11:54:36.272450  splay->n_pipes || !display->pipes[pipe].ena=
bled)
    2022-09-12T11:54:36.276416  Pipe C does not exist or not enabled
    2022-09-12T11:54:36.284845  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-12T11:54:36.292445  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-12T11:54:36.299399  Pipe<6>[   51.258641] Console: switching to=
 colour dummy device 80x25
    2022-09-12T11:54:36.302443   D does not exist or not enabled
    2022-09-12T11:54:36.310480  Test requirement not met in fu<14>[   51.26=
7158] [IGT] kms_vblank: executing
    2022-09-12T11:54:36.315941  nction igt_require_pipe, file ../lib/igt_km=
s.c:2281:
    2022-09-12T11:54:36.324796  Test requi<14>[   51.279025] [IGT] kms_vbla=
nk: starting subtest pipe-A-query-forked-busy =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/631f1e5f77e5afc4e235570f
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:35.223283  [1mSubtest pipe-A-query-forked: FAIL (0.758=
s)[0m
    2022-09-12T11:54:35.232059  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-12T11:54:35.239186  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-12T11:54:35.249096  Pipe C does not exist or not enabled<6>[   =
50.209902] Console: switching to colour dummy device 80x25
    2022-09-12T11:54:35.254225  <14>[   50.217233] [IGT] kms_vblank: execut=
ing
    2022-09-12T11:54:35.254904  =

    2022-09-12T11:54:35.267814  Test requirement not met in function igt_re=
quire_pipe, file ../<14>[   50.222940] [IGT] kms_vblank: starting subtest p=
ipe-A-query-busy
    2022-09-12T11:54:35.270131  lib/igt_kms.c:2281:
    2022-09-12T11:54:35.277807  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-12T11:54:35.281013  Pipe D does not exist or not enabled =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/631f1e5f77e5afc4e2355711
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:34.105588  [1mSubtest pipe-A-query-idle-hang: SKIP <8>=
[   49.060468] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang =
RESULT=3Dskip>
    2022-09-12T11:54:34.106259  (0.000s)[0m
    2022-09-12T11:54:34.114368  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-12T11:54:34.122382  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-12T11:54:34.126157  Pipe C does not exist or not enabled
    2022-09-12T11:54:34.134043  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-12T11:54:34.142533  Test requirement: !(<6>[   49.100650] Conso=
le: switching to colour dummy device 80x25
    2022-09-12T11:54:34.148596  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-09-12T11:54:34.153415  Pipe<14>[   49.110513] [IGT] kms_vblank: ex=
ecuting
    2022-09-12T11:54:34.157396   D does not exist or not enabled =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/631f1e5f77e5afc4e2355717
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:40.518869  Test r<8>[   55.474750] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpipe-A-wait-busy-hang RESULT=3Dskip>
    2022-09-12T11:54:40.526366  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-09-12T11:54:40.529402  Pipe D does not exist or not enabled
    2022-09-12T11:54:40.544394  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:228<6>[   55.504228] Console: switching t=
o colour dummy device 80x25
    2022-09-12T11:54:40.544996  1:
    2022-09-12T11:54:40.554955  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pi<14>[   55.511689] [IGT] kms_vblank: executing
    2022-09-12T11:54:40.557165  pes[pipe].enabled)
    2022-09-12T11:54:40.561010  Pipe E does not exist or not enabled
    2022-09-12T11:54:40.569270  Test r<14>[   55.523583] [IGT] kms_vblank: =
starting subtest pipe-A-wait-forked-busy
    2022-09-12T11:54:40.576657  equirement not met in function igt_require_=
pipe, file ../lib/igt_kms.c:2281: =

    ... (100 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/631f1e5f77e5afc4e2355719
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:39.419412  Test requirement not met in function igt_r<=
8>[   54.373981] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-forked-ha=
ng RESULT=3Dskip>
    2022-09-12T11:54:39.423271  equire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-12T11:54:39.431246  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-12T11:54:39.434802  Pipe F does not exist or not enabled
    2022-09-12T11:54:39.441254  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc5 aarch64)
    2022-09-12T11:54:39.445038  Starting subtest: pipe-A-wait-forked-hang
    2022-09-12T11:54:39.457085  Test requirement not met in function gem_co=
ntext_req<6>[   54.412824] Console: switching to colour dummy device 80x25
    2022-09-12T11:54:39.461606  <14>[   54.424694] [IGT] kms_vblank: execut=
ing
    2022-09-12T11:54:39.467024  uire_bannable, file ../lib/i915/gem_context=
.c:324:
    2022-09-12T11:54:39.475005  Test require<14>[   54.430387] [IGT] kms_vb=
lank: starting subtest pipe-A-wait-busy =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/631f1e5f77e5afc4e235571b
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:33.048493  <6>[   48.009648] Console: switching to col=
our dummy device 80x25
    2022-09-12T11:54:33.053455  <14>[   48.016355] [IGT] kms_vblank: execut=
ing
    2022-09-12T11:54:33.066483  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc5 aarch64)<14>[   48.022043] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-09-12T11:54:33.066924  =

    2022-09-12T11:54:33.070450  Starting subtest: pipe-A-query-idle
    2022-09-12T11:54:33.140142  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-09-12T11:54:33.478552  (kms_vblank:585) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-09-12T11:54:33.485421  (kms_vblank:585) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-12T11:54:33.491461  (kms_vblank:585) CRITICAL: Last errno: 22, =
Invalid argument
    2022-09-12T11:54:33.496061  (kms_vblank:585) CRITICAL: error: -22 !=3D =
0 =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/631f1e5f77e5afc4e235571c
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:31.947671  <8>[   46.907482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-09-12T11:54:31.988846  <6>[   46.949794] Console: switching to col=
our dummy device 80x25
    2022-09-12T11:54:31.994337  <14>[   46.956937] [IGT] kms_vblank: execut=
ing
    2022-09-12T11:54:32.008012  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc5 aarch64)<14>[   46.963346] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-09-12T11:54:32.012054  Starting subtest: pipe-A-accuracy-idle
    2022-09-12T11:54:32.090816  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-09-12T11:54:32.462209  (kms_vblank:582) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-09-12T11:54:32.469517  (kms_vblank:582) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-12T11:54:32.475057  (kms_vblank:582) CRITICAL: Last errno: 22, =
Invalid argument
    2022-09-12T11:54:32.480111  (kms_vblank:582) CRITICAL: error: -22 !=3D =
0 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
31f1e5f77e5afc4e2355725
        failing since 86 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-12T11:54:28.657720  <8>[   43.620430] <LAVA_SIGNAL_TESTSET STOP>
    2022-09-12T11:54:28.696224  <8>[   43.657682] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-09-12T11:54:28.728492  <6>[   43.689770] Console: switching to col=
our dummy device 80x25
    2022-09-12T11:54:28.734667  <14>[   43.697241] [IGT] kms_setmode: execu=
ting
    2022-09-12T11:54:28.747419  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc5 aarch64)<14>[   43.702677] [IGT] kms_setmode: starting subtest =
basic
    2022-09-12T11:54:28.749659  Starting subtest: basic
    2022-09-12T11:54:28.754090  Testing: basic 1 connector combinations
    2022-09-12T11:54:28.865040  <14>[   43.825420] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-09-12T11:54:28.869443  Starting dynamic subtest: pipe-A-eDP-1
    2022-09-12T11:54:28.872000    Test id#1 CRTC count 1 =

    ... (76 line(s) more)  =

 =20
