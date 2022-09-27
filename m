Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE5B5EC016
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 12:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiI0Ks3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 06:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbiI0Ks0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 06:48:26 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC401023B8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 03:48:25 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id e129so2978470pgc.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=hByBFcLOhxmJ5pUv7Es8+QmjlpZMmhD3q8+Hs3a+mJQ=;
        b=U7sqO6kPUGdxJaQ4k5l53SUcCs5g1zd9toZZGXfTQaI+fGA0gxmkTpFfdAdzup2A+a
         qsulHyannedxHlvuDw6GLBeSHBYF+IXLvKbtZL3amMM0L9W8M96+aFSO+SyFiuCEsLjV
         w5RalYL7TGOqziwKN8ko9HHt07o22GwWA8od5Bs3TJiSyux64RiQx1MJXd64MJyY3U6e
         ixZJCa/5xp300LowUlIHrw+mQi4kigql5+DDSr4UpO1SonKJ/5kvGCg6LagVvF74c/wY
         877yV7gLm3CgXGJo93HKUw1A3skmg+4RBjCUZyda0Js5rU8VjQhNF9dJpxVJKa0CJQeP
         ZALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=hByBFcLOhxmJ5pUv7Es8+QmjlpZMmhD3q8+Hs3a+mJQ=;
        b=R4I/yunVkzYzZI/xTZOfcv00oAo6Crk9HsQc655ShEsuUvUlelC6mgN7Is6bHkf1xa
         CdFq6DGMUkSNNSBSAVgA1cUuuUpTPCp4yE6DSLZJxzUIDUB2Os0gAXtscT4rlanb05ra
         o8UCHrZHXCFNQxHuBTeiAwukrcRG+OiOukemX0KgoH3R5SQVUjEmA9v5eEPX8cWVwgCA
         HO5IvQwIy03ZEbZTSYe/fWYldtK+2A30g+vDQ3kyqf27HFShDBBxSnbHqTBDTFzA0LeX
         tEiSqv6HqL2sB4mqucv+SpEpcw1WsiIOhELKM4/B3GQ9DsFiPXUt2g1cz9EF/EaLiu9X
         hUdw==
X-Gm-Message-State: ACrzQf29929oc+1iOZ9Mo8uZRXQq7pjPM3YQeKcxyl7zuqcFXkzQxLW6
        6zDpinFBwMeX3SPXsxDQfqu5Ve3fwIA46qje
X-Google-Smtp-Source: AMsMyM574ObbqGSnYILxRp7F0Vo/Z1VrU4/7pPQ+AMTwaWCYn/yfweBnTSam+vdTTIZYGgitQt+5kg==
X-Received: by 2002:a63:90:0:b0:439:befb:fdab with SMTP id 138-20020a630090000000b00439befbfdabmr23029014pga.341.1664275704560;
        Tue, 27 Sep 2022 03:48:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b00176cdd80148sm1164753pll.305.2022.09.27.03.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 03:48:24 -0700 (PDT)
Message-ID: <6332d4f8.170a0220.ee9a4.1b0d@mx.google.com>
Date:   Tue, 27 Sep 2022 03:48:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-27-v6.0-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2022-09-27-v6.0-rc7)
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
-09-27-v6.0-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-27-v6.0-rc7/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-27-v6.0-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      021286ccf6c17f224e1137ebdbbbecae1e64612f

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  474894ed17a037a464e5bd845a0765a50f647898
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  dcb1d7a8822e62935f4fe3f2e6a04caaee669369 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6332c92065e299ac80ec4ec9

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220923.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6332c92065e299ac80ec4f56
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:50.069175  Test r<8>[   58.440198] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpipe-A-wait-busy-hang RESULT=3Dskip>
    2022-09-27T09:55:50.076185  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-09-27T09:55:50.080030  Pipe D does not exist or not enabled
    2022-09-27T09:55:50.087482  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:50.100289  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pi<6>[   58.474109] Console: switching to colour dummy dev=
ice 80x25
    2022-09-27T09:55:50.105255  <14>[   58.481083] [IGT] kms_vblank: execut=
ing
    2022-09-27T09:55:50.106758  pes[pipe].enabled)
    2022-09-27T09:55:50.110648  Pipe E does not exist or not enabled
    2022-09-27T09:55:50.119161  Test r<14>[   58.486799] [IGT] kms_vblank: =
starting subtest pipe-A-wait-forked-busy
    2022-09-27T09:55:50.127269  equirement not met in function igt_require_=
pipe, file ../lib/igt_kms.c:2302: =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6332c92065e299ac80ec4f58
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:49.008704  Test requirement not met in function gem_co=
ntext_require_banna<8>[   57.375576] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dp=
ipe-A-wait-forked-hang RESULT=3Dskip>
    2022-09-27T09:55:49.012474  ble, file ../lib/i915/gem_context.c:324:
    2022-09-27T09:55:49.016859  Test requirement: has_ban_period || has_ban=
nable
    2022-09-27T09:55:49.020657  Last errno: 22, Invalid argument
    2022-09-27T09:55:49.025763  [1mSubtest pipe-A-wait-forked-hang: SKIP (0=
.000s)[0m
    2022-09-27T09:55:49.033717  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:49.045727  Test requirement: !(pipe >=3D display->n_pi=
pes || !displ<6>[   57.415312] Console: switching to colour dummy device 80=
x25
    2022-09-27T09:55:49.048377  ay->pipes[pipe].enabled)
    2022-09-27T09:55:49.052282  Pipe C does not exist or not enabled
    2022-09-27T09:55:49.056209  <14>[   57.426815] [IGT] kms_vblank: execut=
ing =

    ... (95 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6332c92065e299ac80ec4f5a
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:42.419558  <8>[   50.791785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-09-27T09:55:42.453568  <6>[   50.828030] Console: switching to col=
our dummy device 80x25
    2022-09-27T09:55:42.458809  <14>[   50.834813] [IGT] kms_vblank: execut=
ing
    2022-09-27T09:55:42.472873  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0-rc7 aarch64)<14>[   50.841607] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-09-27T09:55:42.473736  =

    2022-09-27T09:55:42.476265  Starting subtest: pipe-A-query-idle
    2022-09-27T09:55:42.561932  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-09-27T09:55:42.917723  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-09-27T09:55:42.924969  (kms_vblank:590) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-27T09:55:42.930403  (kms_vblank:590) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (73 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6332c92065e299ac80ec4f5b
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:41.338143  <8>[   49.711044] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-09-27T09:55:41.374592  <6>[   49.747888] Console: switching to col=
our dummy device 80x25
    2022-09-27T09:55:41.378749  <14>[   49.754555] [IGT] kms_vblank: execut=
ing
    2022-09-27T09:55:41.392513  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0-rc7 aarch64)<14>[   49.760979] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-09-27T09:55:41.393127  =

    2022-09-27T09:55:41.397165  Starting subtest: pipe-A-accuracy-idle
    2022-09-27T09:55:41.478311  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-09-27T09:55:41.849284  (kms_vblank:586) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-09-27T09:55:41.856912  (kms_vblank:586) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-27T09:55:41.862115  (kms_vblank:586) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6332c92065e299ac80ec4f5f
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:47.924364  Test r<8>[   56.294907] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-09-27T09:55:47.931217  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-09-27T09:55:47.935337  Pipe D does not exist or not enabled
    2022-09-27T09:55:47.942967  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:47.951695  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-27T09:55:47.954880  Pipe E does not exist or not enabled
    2022-09-27T09:55:47.961595  Test r<6>[   56.331575] Console: switching =
to colour dummy device 80x25
    2022-09-27T09:55:47.972628  equirement not met in function igt_require_=
pipe, file ../lib/igt<14>[   56.343182] [IGT] kms_vblank: executing
    2022-09-27T09:55:47.974019  _kms.c:2302:
    2022-09-27T09:55:47.986430  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   56.355368] [IGT] kms_vblank: starting subtest pipe-A-wait-=
forked =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6332c92065e299ac80ec4f61
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:46.844626  s/kernel/debug/dri/0'
    2022-09-27T09:55:46.852942  (kms_vblank:614) INFO: Beginning pipe-A-que=
ry-forked-busy on pipe A, connector eDP-1
    2022-09-27T09:55:46.857295  (kms_vblank:614) DEBUG: Spawning 6 threads
    2022-09-27T09:55:46.859706  ****  END  ****
    2022-09-27T09:55:46.864435  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.700s)[0m
    2022-09-27T09:55:46.872544  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:46.879925  Test requ<6>[   55.250176] Console: switchi=
ng to colour dummy device 80x25
    2022-09-27T09:55:46.891013  irement: !(pipe >=3D display->n_pipes || !d=
isplay->pipes[pipe].ena<14>[   55.261500] [IGT] kms_vblank: executing
    2022-09-27T09:55:46.892005  bled)
    2022-09-27T09:55:46.895229  Pipe C does not exist or not enabled =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6332c92065e299ac80ec4f63
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:45.793198  Test requirement not met in function igt_re=
quire_p<8>[   54.159727] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-=
busy-hang RESULT=3Dskip>
    2022-09-27T09:55:45.795596  ipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:45.803737  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-27T09:55:45.806937  Pipe C does not exist or not enabled
    2022-09-27T09:55:45.815147  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:45.822931  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-27T09:55:45.829766  Pipe<6>[   54.200063] Console: switching to=
 colour dummy device 80x25
    2022-09-27T09:55:45.833727   D does not exist or not enabled
    2022-09-27T09:55:45.841286  Test requirement not met in fu<14>[   54.21=
1397] [IGT] kms_vblank: executing
    2022-09-27T09:55:45.847026  nction igt_require_pipe, file ../lib/igt_km=
s.c:2302: =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6332c92065e299ac80ec4f65
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:44.705647  *
    2022-09-27T09:55:44.710219  [1mSubtest pipe-A-query-forked: FAIL (0.768=
s)[0m
    2022-09-27T09:55:44.718445  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:44.725849  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-27T09:55:44.730259  Pipe C does not exist or not enabled
    2022-09-27T09:55:44.742252  Test requirement not met in function igt_re=
quire_pipe, file ../<6>[   53.112530] Console: switching to colour dummy de=
vice 80x25
    2022-09-27T09:55:44.744260  lib/igt_kms.c:2302:
    2022-09-27T09:55:44.753944  Test requirement: !(pipe >=3D display->n_pi=
pe<14>[   53.123592] [IGT] kms_vblank: executing
    2022-09-27T09:55:44.756951  s || !display->pipes[pipe].enabled)
    2022-09-27T09:55:44.766734  Pipe D does not exist or no<14>[   53.13616=
9] [IGT] kms_vblank: starting subtest pipe-A-query-busy =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6332c92065e299ac80ec4f67
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:43.581663  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-09-27T09:55:43.585507  Pipe D does not exist or not enabled
    2022-09-27T09:55:43.593110  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-09-27T09:55:43.601276  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-27T09:55:43.604616  Pipe E does not exist or not enabled
    2022-09-27T09:55:43.614025  Test requirement not<6>[   51.983005] Conso=
le: switching to colour dummy device 80x25
    2022-09-27T09:55:43.619316   met in function igt_require_pipe, file ../=
lib/igt_kms.c:2302:
    2022-09-27T09:55:43.624139  <14>[   51.994759] [IGT] kms_vblank: execut=
ing
    2022-09-27T09:55:43.638754  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[<14>[   52.006769] [IGT] kms_vblank: starting subtes=
t pipe-A-query-forked
    2022-09-27T09:55:43.639524  pipe].enabled) =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
332c92065e299ac80ec4f6e
        failing since 101 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-27T09:55:38.031155  <8>[   46.407430] <LAVA_SIGNAL_TESTSET STOP>
    2022-09-27T09:55:38.067011  <8>[   46.442112] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-09-27T09:55:38.109574  <6>[   46.484050] Console: switching to col=
our dummy device 80x25
    2022-09-27T09:55:38.114941  <14>[   46.491054] [IGT] kms_setmode: execu=
ting
    2022-09-27T09:55:38.127396  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0-rc7 aarch64)<14>[   46.496391] [IGT] kms_setmode: starting subtest =
basic
    2022-09-27T09:55:38.128059  =

    2022-09-27T09:55:38.130803  Starting subtest: basic
    2022-09-27T09:55:38.133930  Testing: basic 1 connector combinations
    2022-09-27T09:55:38.236314  <14>[   46.609568] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-09-27T09:55:38.240986  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
