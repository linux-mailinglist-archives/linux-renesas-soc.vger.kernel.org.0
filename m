Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3AE54FC51
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 19:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbiFQRjs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 13:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382838AbiFQRjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 13:39:47 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF103EB8F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 10:39:46 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id z17so4738283pff.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TvaTKJ9RyuesthTEOorqLM5Zk/kvFw+bUkeahkMVNfo=;
        b=oLy4rLpe8BeeCDLWz1DRmoF9FVAHGTHgxo89eVPb7vvdLzH6kznnnQcUGlpRW3QiMB
         suavL6/zx1SG+oIXx6csCbotBQ3k17Jr6RKi235MpXkX2BmHmmpFOcTcrpWlxPu8lW5Q
         pLmsmbm68V/L4qUDi0xXlPcJssVR8WWM4zWoYVL1rT6Ev6sjc0htEsgusSVRYK4A9edN
         KPQ5hVPpT54piPZ5XHSAsO2IvOJHQfVoSd7LhmAs2DUVyMtNwD1G7nklGJHLvtblMRLz
         0dlAzDlA01ECjKKuOiFw/6hQ/lYu5ZJQ4l+ugkhcCuwZZM2A2f1szia9gj29xmZzoTzv
         hslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TvaTKJ9RyuesthTEOorqLM5Zk/kvFw+bUkeahkMVNfo=;
        b=7bUQ1dbtz9loHQ/EeoiVU61d5PHjVRAnvSs1FtVKxpffdvZ0mDtXUZHEvhOcfHgaMe
         3bf63rf0fpqVZqOIkOWpq5agI/GA+Dkco/foOCYc6cqP6B1d+Tj5WvnIqrCRGsaIvJvz
         JH7brwIUtCRcw3ryVNPYlTj8QDJoYBsAaO+K8v9PZ+TpUbmenuHIIeSFxBfGWCHs3iM8
         Q7aqw920iUZa5O/EyE/Dw6wpI7dlvionlpOuwMarSvvwQo3vGFf6Y9Qn1R15+Ujvh8gK
         MQefaP9Nd0XtNPtajNk0OvxgFQjmCUQ6z1irmnbReZ2sDooqgRU03GDFQnyyF7xqbFvs
         buCA==
X-Gm-Message-State: AJIora95TTkIKF/OY3XTXg9SWawBmyi+KcV8rg8ZvXcl2hPPv+WxsSVD
        i/7MXGa23yhoIV6t8PwJZxu0AyeV8x2vV9Ewjfk=
X-Google-Smtp-Source: AGRyM1u3115+KgCcej5a+Fg6Y2RMFN9Gb3TucSP+HUKRHHJ5ZI+9J9Ho4WlQ5mN1GvXUZPYLxlLtVQ==
X-Received: by 2002:a05:6a00:248a:b0:51b:f461:8318 with SMTP id c10-20020a056a00248a00b0051bf4618318mr11257374pfv.47.1655487585405;
        Fri, 17 Jun 2022 10:39:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ji5-20020a170903324500b0016390e0db7asm3862366plb.121.2022.06.17.10.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:39:45 -0700 (PDT)
Message-ID: <62acbc61.1c69fb81.3372.5a20@mx.google.com>
Date:   Fri, 17 Jun 2022 10:39:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-17-v5.19-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-06-17-v5.19-rc2)
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
-06-17-v5.19-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-17-v5.19-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-17-v5.19-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8ee5150f6442f9872b13f459339f32db2b5084f9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f83ad09dc04c9f918ee8836bac9d88dac5de6745
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0189ca288f7188e60f5eda356b190040bf8ec704 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/62aca93b90b43bd151a39bd7

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-17-v5.19-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-17-v5.19-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62aca93c90b43bd151a39c65
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:07.563162  pipes[pipe].enabled)
    2022-06-17T16:16:07.566733  Pipe C does not exist or not enabled
    2022-06-17T16:16:07.575033  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-17T16:16:07.582802  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-17T16:16:07.592437  Pipe D does not exist or not ena<6>[   69.7=
37199] Console: switching to colour dummy device 80x25
    2022-06-17T16:16:07.597075  <14>[   69.737285] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:16:07.604816  <14>[   69.742292] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-forked-busy
    2022-06-17T16:16:07.605366  bled
    2022-06-17T16:16:07.613383  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-17T16:16:07.621417  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled) =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62aca93c90b43bd151a39c67
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:06.546238  Test requirement not<8>[   68.688740] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>
    2022-06-17T16:16:06.552180   met in function igt_require_pipe, file ../=
lib/igt_kms.c:2251:
    2022-06-17T16:16:06.559935  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-17T16:16:06.563694  Pipe E does not exist or not enabled
    2022-06-17T16:16:06.571292  Test requi<6>[   68.716725] Console: switch=
ing to colour dummy device 80x25
    2022-06-17T16:16:06.576047  <14>[   68.716807] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:16:06.583010  <14>[   68.718352] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-busy
    2022-06-17T16:16:06.590327  rement not met in function igt_require_pipe=
, file ../lib/igt_kms.c:2251:
    2022-06-17T16:16:06.598115  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-17T16:16:06.601773  Pipe F does not exist or not enabled =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62aca93c90b43bd151a39c69
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:05.472396  Test re<8>[   67.620864] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-06-17T16:16:05.479197  quirement: !(pipe >=3D display->n_pipes || =
!display->pipes[pipe].enabled)
    2022-06-17T16:16:05.483118  Pipe D does not exist or not enabled
    2022-06-17T16:16:05.491272  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-17T16:16:05.503526  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pip<6>[   67.649811] Console: switching to colour dummy de=
vice 80x25
    2022-06-17T16:16:05.508402  <14>[   67.649910] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:16:05.510138  es[pipe].enabled)
    2022-06-17T16:16:05.514120  Pipe E does not exist or not enabled
    2022-06-17T16:16:05.521657  Test re<14>[   67.651573] [IGT] kms_vblank:=
 starting subtest pipe-A-wait-forked
    2022-06-17T16:16:05.529450  quirement not met in function igt_require_p=
ipe, file ../lib/igt_kms.c:2251: =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62aca93c90b43bd151a39c6b
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:04.414473  lane_idx >=3D 0 && plane_idx < pipe->n_plan=
es
    2022-06-17T16:16:04.423198  (kms_vblank:612) igt_kms-DEBUG: display:   =
  Fixing up initial rotation pipe B, plane 3
    2022-06-17T16:16:04.435172  (kms_vblank:612) igt_kms-DEBUG: display:   =
  SetCursor pip<6>[   66.583886] Console: switching to colour dummy device =
80x25
    2022-06-17T16:16:04.436891  e B, disabling
    2022-06-17T16:16:04.446299  (kms_vblank:612) igt_kms-DEBUG: display:   =
  Mov<14>[   66.583977] [IGT] kms_vblank: executing
    2022-06-17T16:16:04.453199  <14>[   66.585574] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-idle
    2022-06-17T16:16:04.455577  eCursor pipe B, (0, 0)
    2022-06-17T16:16:04.459714  (kms_vblank:612) igt_kms-DEBUG: display: }
    2022-06-17T16:16:04.468412  (kms_vblank:612) igt_debugfs-DEBUG: Opening=
 debugfs directory '/sys/kernel/debug/dri/0'
    2022-06-17T16:16:04.476971  (kms_vblank:612) INFO: Beginning pipe-A-que=
ry-forked-busy on pipe A, connector eDP-1 =

    ... (120 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62aca93c90b43bd151a39c6d
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:03.410434  Test r<8>[   65.555700] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>
    2022-06-17T16:16:03.417488  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-06-17T16:16:03.421191  Pipe F does not exist or not enabled
    2022-06-17T16:16:03.427756  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc2 aarch64)
    2022-06-17T16:16:03.435499  Starting subte<6>[   65.584132] Console: sw=
itching to colour dummy device 80x25
    2022-06-17T16:16:03.440226  <14>[   65.584235] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:16:03.447868  <14>[   65.586017] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked-busy
    2022-06-17T16:16:03.450729  st: pipe-A-query-busy-hang
    2022-06-17T16:16:03.460951  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-06-17T16:16:03.465768  Test requirement: has_ban_period || has_ban=
nable =

    ... (114 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62aca93c90b43bd151a39c6f
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:02.429400  (kms_vblank<8>[   64.566855] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-hang RESULT=3Dskip>
    2022-06-17T16:16:02.432360  :594) DEBUG: Spawning 6 threads
    2022-06-17T16:16:02.434025  ****  END  ****
    2022-06-17T16:16:02.438989  [1mSubtest pipe-A-query-forked: FAIL (0.785=
s)[0m
    2022-06-17T16:16:02.447483  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-17T16:16:02.454218  Test r<6>[   64.604196] Console: switching =
to colour dummy device 80x25
    2022-06-17T16:16:02.458933  <14>[   64.604295] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:16:02.466312  <14>[   64.605824] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-busy
    2022-06-17T16:16:02.473533  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-06-17T16:16:02.477179  Pipe C does not exist or not enabled =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62aca93c90b43bd151a39c71
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:01.360491  n function igt_require_pipe, file ../lib/ig=
t_kms.c:2251:
    2022-06-17T16:16:01.368218  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-17T16:16:01.372234  Pipe F does not exist or not enabled
    2022-06-17T16:16:01.379913  IGT-Version: 1.2<6>[   63.528703] Console: =
switching to colour dummy device 80x25
    2022-06-17T16:16:01.384631  <14>[   63.528774] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:16:01.392156  <14>[   63.530238] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked
    2022-06-17T16:16:01.396970  6-g0189ca2 (aarch64) (Linux: 5.19.0-rc2 aar=
ch64)
    2022-06-17T16:16:01.400916  Starting subtest: pipe-A-query-idle-hang
    2022-06-17T16:16:01.411176  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-06-17T16:16:01.416018  Test requirement: has_ban_period || has_ban=
nable =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62aca93c90b43bd151a39c73
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:16:00.308617  <8>[   62.455266] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-06-17T16:16:00.338993  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc2 aarch64)<6>[   62.485018] Console: switching to colour dummy d=
evice 80x25
    2022-06-17T16:16:00.343806  <14>[   62.485106] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:16:00.344076  =

    2022-06-17T16:16:00.354640  Starting subtest: pipe-A-query-idle<14>[   =
62.493964] [IGT] kms_vblank: starting subtest pipe-A-query-idle
    2022-06-17T16:16:00.354910  =

    2022-06-17T16:16:00.439297  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-06-17T16:16:00.778232  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-06-17T16:16:00.785225  (kms_vblank:588) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-06-17T16:16:00.791337  (kms_vblank:588) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62aca93c90b43bd151a39c74
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:15:59.203344  <8>[   61.354184] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-06-17T16:15:59.242630  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc2 aarch64)<6>[   61.388441] Console: switching to colour dummy d=
evice 80x25
    2022-06-17T16:15:59.247197  <14>[   61.388538] [IGT] kms_vblank: execut=
ing
    2022-06-17T16:15:59.254713  <14>[   61.394226] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-06-17T16:15:59.254983  =

    2022-06-17T16:15:59.258943  Starting subtest: pipe-A-accuracy-idle
    2022-06-17T16:15:59.340050  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-06-17T16:15:59.727696  (kms_vblank:585) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-06-17T16:15:59.734880  (kms_vblank:585) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-06-17T16:15:59.740687  (kms_vblank:585) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2aca93c90b43bd151a39c7d
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-17T16:15:56.085763  <8>[   58.223275] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-06-17T16:15:56.090390  <8>[   58.230403] <LAVA_SIGNAL_TESTSET STOP>
    2022-06-17T16:15:56.117559  <8>[   58.270011] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-06-17T16:15:56.156251  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc2 aarch64)<6>[   58.301700] Console: switching to colour dummy d=
evice 80x25
    2022-06-17T16:15:56.157049  =

    2022-06-17T16:15:56.158651  Starting subtest: basic
    2022-06-17T16:15:56.167386  Testing: basic 1 connector combinatio<14>[ =
  58.301793] [IGT] kms_setmode: executing
    2022-06-17T16:15:56.173335  <14>[   58.302303] [IGT] kms_setmode: start=
ing subtest basic
    2022-06-17T16:15:56.174047  ns
    2022-06-17T16:15:56.258707  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (78 line(s) more)  =

 =20
