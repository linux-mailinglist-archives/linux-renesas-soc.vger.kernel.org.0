Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003DF5AD1D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Sep 2022 13:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237459AbiIELxH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Sep 2022 07:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237349AbiIELxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2022 07:53:06 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9305C9E6
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 04:53:05 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id bh13so7936547pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Sep 2022 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=/P7QZ3CdOiRBojrAR+aBz0NJP1nw4XK9/p9DmxgYj5U=;
        b=kKNDs+ZjsyicnCM6kuxgHzjI5ATYfeq1tWKBVpToooO8JuM3PbFOtwwqkIyKm2f4TZ
         6cMAICfx+jP9EVAnCmUC+OhVNKndU8PDu2stQKtu7/kYlbxok+Np9WeYJDUA8cow5ePJ
         CeePNnKAytFAeqDgxSfQgSsWZi1hGMmpIxXdosAZkvPrQskdR/ffVLyzYyNWLB+PEZ6Y
         +zeUxFJvSKU83/i54JWFLD3xeVdeR+seqzghx8xK1a7FJukjEsw2K1o3Hf0nmKj/0zpS
         6kXXnNCji0cInG3D4aGMjKMUzkCVYxzv4CNVldPy1I9CJBbgDi9D84KGR/8leiWi8Bbr
         xKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=/P7QZ3CdOiRBojrAR+aBz0NJP1nw4XK9/p9DmxgYj5U=;
        b=73yfXxS2LEIUncH3sTMvT6cDz781kOREG9rLvcLEiuHRWx+k45hyJMFMOkI1r/aTmM
         VYM683M+Xs+HG/grLDI44UJlIg7yP6chVC1Wp4PMbBdsa54hUTNIYVurSc+LhQ96Sq6t
         XdiCfyvvU2fm0ueSQ3k+miKTxHEAVCfbw79zGVpLgQ62K5TD2W+LJeefN3xvwzkq1ecg
         9LvcCK+77kevRTstQubGCZ/PcsG07XkMv/V+sX7OOSNbSwncZIvSYpqPObod7E1WHcSl
         Hf9vr4WyH+FMfDsyg9rpUcu0ZuejdKu5s22XyfsFIebG8LEwlQiEHWnsVwrnBzmE/mXg
         fRyQ==
X-Gm-Message-State: ACgBeo3hwgz1PyTHO6RnO1RQARm305Qq+Y68umtGIwy4TeH4FG+MTpEK
        GXXAuuGqKeJ2n4eRexe1+UF6Uwp/aCOQRYv55Yw=
X-Google-Smtp-Source: AA6agR45BG/9lZ+Jkin4qI4WnVXFrkkupAJBygBu0ynmKhR0e5XrHqN/C9HAStpFM7roHI4nMwCaHg==
X-Received: by 2002:a65:68cf:0:b0:42b:44ad:7235 with SMTP id k15-20020a6568cf000000b0042b44ad7235mr41395927pgt.517.1662378784267;
        Mon, 05 Sep 2022 04:53:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s15-20020a17090302cf00b00176675adbe1sm7244531plk.208.2022.09.05.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:53:04 -0700 (PDT)
Message-ID: <6315e320.170a0220.7bf34.b1f9@mx.google.com>
Date:   Mon, 05 Sep 2022 04:53:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-05-v6.0-rc4
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-09-05-v6.0-rc4)
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
-09-05-v6.0-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-05-v6.0-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-05-v6.0-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ce5bd4a14031a91fb83af3882c226513c60d5bf1

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


  Details:     https://kernelci.org/test/plan/id/6315d1fa90e8b3cd6b355652

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220826.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6315d1fb90e8b3cd6b3556e0
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:38:00.928062  Test requirement: !(pipe >=3D display->n_pi=
pes || <8>[   58.144841] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-b=
usy-hang RESULT=3Dskip>
    2022-09-05T10:38:00.930885  !display->pipes[pipe].enabled)
    2022-09-05T10:38:00.934814  Pipe D does not exist or not enabled
    2022-09-05T10:38:00.942695  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-05T10:38:00.950505  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-05T10:38:00.959582  Pipe E does not exist <6>[   58.182675] Con=
sole: switching to colour dummy device 80x25
    2022-09-05T10:38:00.963896  <14>[   58.189916] [IGT] kms_vblank: execut=
ing
    2022-09-05T10:38:00.965531  or not enabled
    2022-09-05T10:38:00.978077  Test requirement not met in function igt_re=
quire<14>[   58.195859] [IGT] kms_vblank: starting subtest pipe-A-wait-fork=
ed-busy
    2022-09-05T10:38:00.981559  _pipe, file ../lib/igt_kms.c:2281: =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6315d1fb90e8b3cd6b3556e2
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:59.842776  Test requirement not met in funct<8>[   57.=
061716] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=
=3Dskip>
    2022-09-05T10:37:59.847005  ion igt_require_pipe, file ../lib/igt_kms.c=
:2281:
    2022-09-05T10:37:59.855762  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-05T10:37:59.858903  Pipe F does not exist or not enabled
    2022-09-05T10:37:59.865057  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc4 aarch64)
    2022-09-05T10:37:59.869040  Starting subtest: pipe-A-wait-forked-hang
    2022-09-05T10:37:59.879915  Test requirement not met in function gem_co=
<6>[   57.099873] Console: switching to colour dummy device 80x25
    2022-09-05T10:37:59.886110  ntext_require_bannable, file ../lib/i915/ge=
m_context.c:324:
    2022-09-05T10:37:59.890594  Tes<14>[   57.110969] [IGT] kms_vblank: exe=
cuting
    2022-09-05T10:37:59.895554  t requirement: has_ban_period || has_bannab=
le =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6315d1fb90e8b3cd6b3556e4
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:58.766313  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-09-05T10:37:58.769902  Pipe D does not exist or not enabled
    2022-09-05T10:37:58.778273  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-05T10:37:58.785989  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-05T10:37:58.789639  Pipe E does not exist or not enabled
    2022-09-05T10:37:58.796555  Test r<6>[   56.015629] Console: switching =
to colour dummy device 80x25
    2022-09-05T10:37:58.807874  equirement not met in function igt_require_=
pipe, file ../lib/igt<14>[   56.027512] [IGT] kms_vblank: executing
    2022-09-05T10:37:58.809017  _kms.c:2281:
    2022-09-05T10:37:58.820927  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   56.041427] [IGT] kms_vblank: starting subtest pipe-A-wait-=
forked
    2022-09-05T10:37:58.823925  isplay->pipes[pipe].enabled) =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6315d1fb90e8b3cd6b3556e6
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:57.701317  blank:615) igt_kms-DEBUG: display:     SetC=
ursor pipe B, disabling
    2022-09-05T10:37:57.708287  (kms_vblank:615) igt_kms-DEBUG: display:   =
  MoveCursor pipe B, (0, 0)
    2022-09-05T10:37:57.712688  (kms_vblank:615) igt_kms-DEBUG: display: }
    2022-09-05T10:37:57.720162  (kms_vbl<6>[   54.943105] Console: switchin=
g to colour dummy device 80x25
    2022-09-05T10:37:57.731215  ank:615) igt_debugfs-DEBUG: Opening debugfs=
 directory '/sys/kern<14>[   54.950498] [IGT] kms_vblank: executing
    2022-09-05T10:37:57.732989  el/debug/dri/1'
    2022-09-05T10:37:57.744252  (kms_vblank:615) INFO: Beginning pipe-A-que=
ry-f<14>[   54.962563] [IGT] kms_vblank: starting subtest pipe-A-wait-idle
    2022-09-05T10:37:57.748283  orked-busy on pipe A, connector eDP-1
    2022-09-05T10:37:57.752388  (kms_vblank:615) DEBUG: Spawning 6 threads
    2022-09-05T10:37:57.754405  ****  END  **** =

    ... (117 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6315d1fb90e8b3cd6b3556e8
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:56.663245  (0.000s)[0m
    2022-09-05T10:37:56.671204  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-05T10:37:56.679705  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-05T10:37:56.683190  Pipe C does not exist or not enabled
    2022-09-05T10:37:56.690942  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-05T10:37:56.699630  Test requirement: !(<6>[   53.920035] Conso=
le: switching to colour dummy device 80x25
    2022-09-05T10:37:56.705500  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-09-05T10:37:56.710661  Pipe<14>[   53.930180] [IGT] kms_vblank: ex=
ecuting
    2022-09-05T10:37:56.713752   D does not exist or not enabled
    2022-09-05T10:37:56.724459  Test requirement not met in fu<14>[   53.94=
2625] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (109 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6315d1fb90e8b3cd6b3556ea
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:55.617828  :597) INFO: Beginning pipe-A-query-forked o=
n pipe A, connector eDP-1
    2022-09-05T10:37:55.622228  (kms_vblank:597) DEBUG: Spawning 6 threads
    2022-09-05T10:37:55.623455  ****  END  ****
    2022-09-05T10:37:55.628919  [1mSubtest pipe-A-query-forked: FAIL (0.765=
s)[0m
    2022-09-05T10:37:55.637319  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-05T10:37:55.648690  Test requirement: !(pipe >=3D display->n_pi=
pes || !disp<6>[   52.868304] Console: switching to colour dummy device 80x=
25
    2022-09-05T10:37:55.651358  lay->pipes[pipe].enabled)
    2022-09-05T10:37:55.659323  Pipe C does not exist or not enabled<14>[  =
 52.879334] [IGT] kms_vblank: executing
    2022-09-05T10:37:55.659585  =

    2022-09-05T10:37:55.672738  Test requirement not met in function igt_re=
quire_pipe, file ../<14>[   52.893301] [IGT] kms_vblank: starting subtest p=
ipe-A-query-busy =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6315d1fb90e8b3cd6b3556ec
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:54.498375  (0.000s)[0m
    2022-09-05T10:37:54.506703  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-05T10:37:54.514593  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-05T10:37:54.517899  Pipe C does not exist or not enabled
    2022-09-05T10:37:54.526906  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-05T10:37:54.534694  Test requirement: !(<6>[   51.755367] Conso=
le: switching to colour dummy device 80x25
    2022-09-05T10:37:54.540477  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-09-05T10:37:54.545514  Pipe<14>[   51.765222] [IGT] kms_vblank: ex=
ecuting
    2022-09-05T10:37:54.549306   D does not exist or not enabled
    2022-09-05T10:37:54.559233  Test requirement not met in fu<14>[   51.77=
7812] [IGT] kms_vblank: starting subtest pipe-A-query-forked =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6315d1fb90e8b3cd6b3556ee
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:53.422111  <6>[   50.645501] Console: switching to col=
our dummy device 80x25
    2022-09-05T10:37:53.426471  <14>[   50.652110] [IGT] kms_vblank: execut=
ing
    2022-09-05T10:37:53.439680  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc4 aarch64)<14>[   50.658030] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-09-05T10:37:53.439963  =

    2022-09-05T10:37:53.443808  Starting subtest: pipe-A-query-idle
    2022-09-05T10:37:53.514487  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-09-05T10:37:53.870477  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-09-05T10:37:53.877486  (kms_vblank:591) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-05T10:37:53.883608  (kms_vblank:591) CRITICAL: Last errno: 22, =
Invalid argument
    2022-09-05T10:37:53.887233  (kms_vblank:591) CRITICAL: error: -22 !=3D =
0 =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6315d1fb90e8b3cd6b3556ef
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:52.308607  <8>[   49.531302] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-09-05T10:37:52.341021  <6>[   49.565176] Console: switching to col=
our dummy device 80x25
    2022-09-05T10:37:52.346472  <14>[   49.571807] [IGT] kms_vblank: execut=
ing
    2022-09-05T10:37:52.360191  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc4 aarch64)<14>[   49.577744] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-09-05T10:37:52.363741  Starting subtest: pipe-A-accuracy-idle
    2022-09-05T10:37:52.431520  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-09-05T10:37:52.820525  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-09-05T10:37:52.827618  (kms_vblank:588) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-05T10:37:52.833584  (kms_vblank:588) CRITICAL: Last errno: 22, =
Invalid argument
    2022-09-05T10:37:52.838137  (kms_vblank:588) CRITICAL: error: -22 !=3D =
0 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
315d1fb90e8b3cd6b3556f8
        failing since 79 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-05T10:37:48.985595  <8>[   46.211014] <LAVA_SIGNAL_TESTSET STOP>
    2022-09-05T10:37:49.021314  <8>[   46.245507] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-09-05T10:37:49.055585  <6>[   46.279166] Console: switching to col=
our dummy device 80x25
    2022-09-05T10:37:49.060550  <14>[   46.285864] [IGT] kms_setmode: execu=
ting
    2022-09-05T10:37:49.073804  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc4 aarch64)<14>[   46.291486] [IGT] kms_setmode: starting subtest =
basic
    2022-09-05T10:37:49.076471  Starting subtest: basic
    2022-09-05T10:37:49.079814  Testing: basic 1 connector combinations
    2022-09-05T10:37:49.190460  <14>[   46.413028] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-09-05T10:37:49.194759  Starting dynamic subtest: pipe-A-eDP-1
    2022-09-05T10:37:49.197577    Test id#1 CRTC count 1 =

    ... (76 line(s) more)  =

 =20
