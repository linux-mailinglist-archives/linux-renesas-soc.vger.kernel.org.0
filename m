Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23F1F55163E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 12:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239006AbiFTKtD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 06:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240610AbiFTKs5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 06:48:57 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B151180E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id r66so4013700pgr.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IT7WIw617JoJlznAECf4W36uCpZzll8ehgK3Y2/+DlQ=;
        b=UiAv6QhujFJiNLcilb4/UrIQuUpYgpT8S/rfXsKmHO8lXL9PAtNRHLuBKFGdRU5ZgT
         uu0bsQ2Nx77sp0xzPfa/o500t8lLgDf0Uj2i6gA12BjoNfYw7YBzGJCqCJzi9UvoHrOQ
         A5MMW1pHNFT8vltIb6PUWRRliOWyuJajgOqQFh9ZRoJ3irXDPD5MkvqeERIp3sdIvEL0
         pHgWwnm91vH6tx4/bevJ3LRdRcgtGX6vWxXFLX1JwY7dEQdvpOjMc91jG/yxRGCAC1Qt
         /p2di1q2r5getaIWeX37kzhhSRxCCeyMJmw8qs4KZNpfqOtBH4LZsiUyy7SfKhZOi+Bt
         P/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IT7WIw617JoJlznAECf4W36uCpZzll8ehgK3Y2/+DlQ=;
        b=S7BLq7una45WcFic12m6AXhYcR8RyTD+W2qycE2L+fgATZy/oPvKt87hcFIInlEPu8
         9S7+2Af7c8+2nW7xA1fsioQ31sAu2IeBAfAcHPMHr9qhFXnmfyxyu0IH/nPq4NsTL40c
         MSdW/cFBoTw6bBXS9R1qi/TTAauBYfalIXirS9Kh80jtos7LKHxit2QAEltJNlHhXXok
         UnQTLsmfWqMyKYE2fMjSDHUUYGEq4xMqxTd6JCXpksXDIhYXrx6RS00Cj0vvF2RJruxz
         FiA3uqYp9n7JjgCgJnGnatRFqWZzmnPn4ZsB2VrfQZrNtbYwFh7Ovgyuf8tI7+Owb7b3
         9hKw==
X-Gm-Message-State: AJIora+QKWxWWquip9uuHqOnvkIHONQuO6hIJF2L6ipRy0U2KPCOlC2i
        43EYN9BqOTA4BVCs/zSij/LP21ud594G1IZasLI=
X-Google-Smtp-Source: AGRyM1vhivdyP1tVw2bX5eduMugHyQdwbMMmp/oEyT1PoWy5muR2QnhUvrHaVB9WVbDcTHGXDUs2Tw==
X-Received: by 2002:a63:3c14:0:b0:40c:a165:b85 with SMTP id j20-20020a633c14000000b0040ca1650b85mr6293501pga.504.1655722134619;
        Mon, 20 Jun 2022 03:48:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w9-20020a639349000000b003fc5fd21752sm8871980pgm.50.2022.06.20.03.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 03:48:54 -0700 (PDT)
Message-ID: <62b05096.1c69fb81.45afc.c151@mx.google.com>
Date:   Mon, 20 Jun 2022 03:48:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-20-v5.19-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 2 runs,
 11 regressions (renesas-devel-2022-06-20-v5.19-rc3)
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

renesas/master igt-kms-rockchip: 2 runs, 11 regressions (renesas-devel-2022=
-06-20-v5.19-rc3)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-20-v5.19-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-20-v5.19-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ebde835d00b25f6852cef819b7b8c96e07c709b5

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f83ad09dc04c9f918ee8836bac9d88dac5de6745
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0189ca288f7188e60f5eda356b190040bf8ec704 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b0493b796cfab5fda39c10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/62b0493b796cf=
ab5fda39c11
        failing since 13 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 10         =


  Details:     https://kernelci.org/test/plan/id/62b03f6d75d819fc41a39bfa

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62b03f6e75d819fc41a39c88
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:39.409544  /igt_kms.c:2251:
    2022-06-20T09:33:39.416744  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-20T09:33:39.420404  Pipe D does not exist or not enabled
    2022-06-20T09:33:39.432135  Test requirement not met in function igt_re=
quire_pipe, f<6>[   71.363786] Console: switching to colour dummy device 80=
x25
    2022-06-20T09:33:39.437571  <14>[   71.363867] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:39.444587  <14>[   71.365673] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-forked-busy
    2022-06-20T09:33:39.448150  ile ../lib/igt_kms.c:2251:
    2022-06-20T09:33:39.454935  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-20T09:33:39.459118  Pipe E does not exist or not enabled
    2022-06-20T09:33:39.467714  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251: =

    ... (100 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62b03f6e75d819fc41a39c8a
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:38.392120  nes
    2022-06-20T09:33:38.400577  (kms_vblank:630) igt_kms-DEBUG: display:   =
  Fixing up initial rotation pipe B, plane 3
    2022-06-20T09:33:38.410457  (kms_vblank:630) igt_kms-DEBUG: di<6>[   70=
.340651] Console: switching to colour dummy device 80x25
    2022-06-20T09:33:38.415310  <14>[   70.340734] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:38.418700  splay:     SetCursor pipe B, disabling
    2022-06-20T09:33:38.428082  (kms_vblank:630) igt_kms<14>[   70.358150] =
[IGT] kms_vblank: starting subtest pipe-A-wait-busy
    2022-06-20T09:33:38.433130  -DEBUG: display:     MoveCursor pipe B, (0,=
 0)
    2022-06-20T09:33:38.437011  (kms_vblank:630) igt_kms-DEBUG: display: }
    2022-06-20T09:33:38.445905  (kms_vblank:630) igt_debugfs-DEBUG: Opening=
 debugfs directory '/sys/kernel/debug/dri/0'
    2022-06-20T09:33:38.453266  (kms_vblank:630) INFO: Beginning pipe-A-wai=
t-forked on pipe A, connector eDP-1 =

    ... (119 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62b03f6e75d819fc41a39c8c
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:37.450753  pipes[pipe].enabled)
    2022-06-20T09:33:37.454700  Pipe C does not exist or not enabled
    2022-06-20T09:33:37.467667  Test requirement not met in function igt_re=
quire_pipe, file ../lib/i<6>[   69.397404] Console: switching to colour dum=
my device 80x25
    2022-06-20T09:33:37.472422  <14>[   69.397457] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:37.479571  <14>[   69.406479] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-forked
    2022-06-20T09:33:37.481438  gt_kms.c:2251:
    2022-06-20T09:33:37.488823  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-20T09:33:37.492550  Pipe D does not exist or not enabled
    2022-06-20T09:33:37.501025  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-20T09:33:37.508866  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled) =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62b03f6e75d819fc41a39c8e
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:36.410537  (kms_vblank:612) igt_kms-DEBUG: display:   =
  SetCursor pip<8>[   68.338537] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-=
A-query-forked-busy-hang RESULT=3Dskip>
    2022-06-20T09:33:36.411718  e B, disabling
    2022-06-20T09:33:36.419083  (kms_vblank:612) igt_kms-DEBUG: display:   =
  MoveCursor pipe B, (0, 0)
    2022-06-20T09:33:36.423335  (kms_vblank:612) igt_kms-DEBUG: display: }
    2022-06-20T09:33:36.434767  (kms_vblank:612) igt_debugfs-DEBUG: Opening=
 debugfs director<6>[   68.366623] Console: switching to colour dummy devic=
e 80x25
    2022-06-20T09:33:36.440129  <14>[   68.366715] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:36.447098  <14>[   68.368522] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-idle
    2022-06-20T09:33:36.450183  y '/sys/kernel/debug/dri/0'
    2022-06-20T09:33:36.458224  (kms_vblank:612) INFO: Beginning pipe-A-que=
ry-forked-busy on pipe A, connector eDP-1
    2022-06-20T09:33:36.462821  (kms_vblank:612) DEBUG: Spawning 6 threads =

    ... (119 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62b03f6e75d819fc41a39c90
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:35.399193  enabled)
    2022-06-20T09:33:35.402824  Pipe F does not exist or not enabled
    2022-06-20T09:33:35.409647  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc3 aarch64)
    2022-06-20T09:33:35.413302  Starting subtest: pipe-A-query-busy-hang
    2022-06-20T09:33:35.423438  Test requirement not met in function<6>[   =
67.352309] Console: switching to colour dummy device 80x25
    2022-06-20T09:33:35.428217  <14>[   67.352394] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:35.442158   gem_context_require_bannable, file ../lib/=
i915/gem_context.c:32<14>[   67.371119] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy
    2022-06-20T09:33:35.442250  4:
    2022-06-20T09:33:35.447455  Test requirement: has_ban_period || has_ban=
nable
    2022-06-20T09:33:35.450752  Last errno: 22, Invalid argument =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62b03f6e75d819fc41a39c92
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:34.429720  ms-DEBUG: display: }
    2022-06-20T09:33:34.437705  (kms_vblank:594) igt_debugfs-DEBUG: Opening=
 debugfs directory '/sys/kernel/debug/dri/0'
    2022-06-20T09:33:34.446135  (kms_vblank:594) INFO: Beginning pipe-A-que=
ry-forked on pipe A, connector eDP-1
    2022-06-20T09:33:34.452450  <6>[   66.383148] Console: switching to col=
our dummy device 80x25
    2022-06-20T09:33:34.456810  <14>[   66.383239] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:34.464580  <14>[   66.385147] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-busy
    2022-06-20T09:33:34.468292  (kms_vblank:594) DEBUG: Spawning 6 threads
    2022-06-20T09:33:34.470613  ****  END  ****
    2022-06-20T09:33:34.475434  [1mSubtest pipe-A-query-forked: FAIL (0.748=
s)[0m
    2022-06-20T09:33:34.483506  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251: =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62b03f6e75d819fc41a39c94
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:33.394066  6-g0189ca2 (aarch64) (Linux: 5.19.0-rc3 aar=
ch64)
    2022-06-20T09:33:33.397833  Starting subtest: pipe-A-query-idle-hang
    2022-06-20T09:33:33.408428  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-06-20T09:33:33.413241  Test requirement: has_ban_period || has_ban=
nable
    2022-06-20T09:33:33.420605  Last errno<6>[   65.346364] Console: switch=
ing to colour dummy device 80x25
    2022-06-20T09:33:33.425414  <14>[   65.346454] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:33.432869  <14>[   65.347934] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked
    2022-06-20T09:33:33.434843  : 22, Invalid argument
    2022-06-20T09:33:33.440385  [1mSubtest pipe-A-query-idle-hang: SKIP (0.=
000s)[0m
    2022-06-20T09:33:33.448309  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251: =

    ... (114 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62b03f6e75d819fc41a39c96
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:32.367520  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc3 aarch64)<6>[   64.295702] Console: switching to colour dummy d=
evice 80x25
    2022-06-20T09:33:32.372290  <14>[   64.295785] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:32.378620  <14>[   64.298642] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-06-20T09:33:32.379247  =

    2022-06-20T09:33:32.383209  Starting subtest: pipe-A-query-idle
    2022-06-20T09:33:32.454490  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-06-20T09:33:32.793632  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-06-20T09:33:32.800932  (kms_vblank:588) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-06-20T09:33:32.806689  (kms_vblank:588) CRITICAL: Last errno: 22, =
Invalid argument
    2022-06-20T09:33:32.811426  (kms_vblank:588) CRITICAL: error: -22 !=3D =
0 =

    ... (68 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62b03f6e75d819fc41a39c97
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:31.292830  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc3 aarch64)<6>[   63.221120] Console: switching to colour dummy d=
evice 80x25
    2022-06-20T09:33:31.292917  =

    2022-06-20T09:33:31.297158  <14>[   63.221224] [IGT] kms_vblank: execut=
ing
    2022-06-20T09:33:31.305589  <14>[   63.225677] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-06-20T09:33:31.309138  Starting subtest: pipe-A-accuracy-idle
    2022-06-20T09:33:31.388808  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-06-20T09:33:31.777752  (kms_vblank:585) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-06-20T09:33:31.784811  (kms_vblank:585) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-06-20T09:33:31.791068  (kms_vblank:585) CRITICAL: Last errno: 22, =
Invalid argument
    2022-06-20T09:33:31.794790  (kms_vblank:585) CRITICAL: error: -22 !=3D =
0 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2b03f6e75d819fc41a39ca0
        failing since 2 days (last pass: renesas-devel-2022-06-06-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:33:28.184561  <8>[   60.120072] <LAVA_SIGNAL_TESTSET STOP>
    2022-06-20T09:33:28.216975  <8>[   60.151304] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-06-20T09:33:28.248205  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc3 aarch64)<6>[   60.176323] Console: switching to colour dummy d=
evice 80x25
    2022-06-20T09:33:28.248802  =

    2022-06-20T09:33:28.252638  <14>[   60.176409] [IGT] kms_setmode: execu=
ting
    2022-06-20T09:33:28.256246  Starting subtest: basic
    2022-06-20T09:33:28.262125  <14>[   60.194564] [IGT] kms_setmode: start=
ing subtest basic
    2022-06-20T09:33:28.265863  Testing: basic 1 connector combinations
    2022-06-20T09:33:28.380159  Starting dynamic subtest: pipe-A-eDP-1
    2022-06-20T09:33:28.389736    Test id#1 CRTC count 1<14>[   60.317136] =
[IGT] kms_setmode: starting dynamic subtest pipe-A-eDP-1 =

    ... (76 line(s) more)  =

 =20
