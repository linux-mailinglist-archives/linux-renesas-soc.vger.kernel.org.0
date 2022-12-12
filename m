Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39AE64AB9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 00:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiLLXgm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 18:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbiLLXgl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 18:36:41 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9097D1A07F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 15:36:39 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d15so4138656pls.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 15:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YPTsFJQLV1u1ZTE34GQBZpklobfxBanGqGoLq6fcvEU=;
        b=gxfnQXBQEh41bFJpQOpTquddSMyBZX+PozJ+l5ooXmaqLxiUybfHkn+6YLczPE+hbD
         Z26dUJtZLrQL7hYEF6ChT8J+3PoOwliTfU6c4ACSRMpG0xBnDVSyoJ2eCxCvNYsHX3JD
         e6qtML8w/FVkOnf9HgmNdWIdsyEIzEhg96GRixw2RNLiVjPer1uXiKq2aRd9Rs7m/UAh
         CymwG2ZWHgE7enayTFfob5cOPxYirdVdH5yIkw1aKzzD92hgFJTcwDzOf6mANnGeKW+2
         t0ZPmNuHmGVbgYTNmb2+Lwp0GS7Glcjfh7Estlv9gcpdxIoTj1xhfhrQyQRuWt9vd7IT
         MTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPTsFJQLV1u1ZTE34GQBZpklobfxBanGqGoLq6fcvEU=;
        b=r01sphMF3h0N/qgWEfjXgdG1GG3YFJRw202kftmDyWptlIvaL7NJf0VHj4C8kNWRTY
         Gjmoep8pPn3b5sIP36bE1SuO8P+dNqRv+h2z1ErW8ATDqI8+BdfrXjx+Z43TiklfmsSY
         B3mni5b0OxlP3p3bH1/1jAqSi3T3MogImhNJV13kjrXcZTnW3rHTNTubOPAfIr6dBzqt
         fmSjf+7qWQIHr4g+AmCqN5wvleWiBJachhpdMdCDxAYUiHAk3B/5lzHThrRVsl4Q/LwM
         u0GEcPNIigI9StG3AE3ZXt0h3X/bGVec+Lzhfg9N/LUEfTI/T0rZatwTFKlORXjXLv28
         lnQw==
X-Gm-Message-State: ANoB5pkSKQM75UBGWWTehqAqAeh24bF3gzgkT3aYTW5qW/CfBotWSdpk
        VlR5n/9sH4R6dwsLffluZ6mHjF+FpxpoWsMJ4VB1Aw==
X-Google-Smtp-Source: AA0mqf7dLrcXw9tVf6oE7SJpjVvcGfcWxgCCj+QEerKJlNqdWHgpmgFeFJw0KALhsQBDVxiM7hL2Fg==
X-Received: by 2002:a17:902:aa91:b0:189:b8a2:27ed with SMTP id d17-20020a170902aa9100b00189b8a227edmr17018492plr.57.1670888198382;
        Mon, 12 Dec 2022 15:36:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i4-20020a632204000000b004785a63b44bsm5653331pgi.43.2022.12.12.15.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 15:36:37 -0800 (PST)
Message-ID: <6397bb05.630a0220.972e2.a0d4@mx.google.com>
Date:   Mon, 12 Dec 2022 15:36:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-12-12-v6.1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-12-12-v6.1)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2022=
-12-12-v6.1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-12-12-v6.1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-12-12-v6.1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  874af994636a534236a747a88aec086b9b35b001
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f8a4a0b59ab9f0e408cb0817e440f63e7859917e =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6397ac18c3b33a7af52abdc1

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221209.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6397ac18c3b33a7af52abe4e
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:54.030430  Test requirement: !(pipe >=3D display->n<8>=
[   66.456758] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-busy-hang R=
ESULT=3Dskip>
    2022-12-12T22:30:54.033824  _pipes || !display->pipes[pipe].enabled)
    2022-12-12T22:30:54.037374  Pipe E does not exist or not enabled
    2022-12-12T22:30:54.044736  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-12T22:30:54.053025  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-12T22:30:54.057535  Pipe F does not exist or not enabled
    2022-12-12T22:30:54.063937  <6>[   66.498018] Console: switching to col=
our dummy device 80x25
    2022-12-12T22:30:54.069495  <14>[   66.505207] [IGT] kms_vblank: execut=
ing
    2022-12-12T22:30:54.070279  =

    2022-12-12T22:30:54.075438  IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux=
: 6.1.0 aarch64) =

    ... (132 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6397ac18c3b33a7af52abe50
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:52.874848  L<8>[   65.303608] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>
    2022-12-12T22:30:52.877398  ast errno: 22, Invalid argument
    2022-12-12T22:30:52.882412  =1B[1mSubtest pipe-A-wait-forked-hang: SKIP=
 (0.000s)=1B[0m
    2022-12-12T22:30:52.890243  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-12T22:30:52.891023  =

    2022-12-12T22:30:52.898956  Test requirement: !<6>[   65.332644] Consol=
e: switching to colour dummy device 80x25
    2022-12-12T22:30:52.904874  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)
    2022-12-12T22:30:52.910085  Pip<14>[   65.339346] [IGT] kms_vblank: exe=
cuting
    2022-12-12T22:30:52.913812  e C does not exist or not enabled
    2022-12-12T22:30:52.923311  Test requirement not met in f<14>[   65.351=
285] [IGT] kms_vblank: starting subtest pipe-A-wait-busy =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6397ac18c3b33a7af52abe52
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:51.731848  not met in function igt_require_pipe, file =
../lib/igt_kms.c:2358:
    2022-12-12T22:30:51.732716  =

    2022-12-12T22:30:51.740331  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-12T22:30:51.743627  Pipe E does not exist or not enabled
    2022-12-12T22:30:51.752520  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-12T22:30:51.763978  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<6>[   64.194742] Console: switching to colour dummy device 80x25
    2022-12-12T22:30:51.766366  splay->pipes[pipe].enabled)
    2022-12-12T22:30:51.774556  Pipe F does not exist or not enable<14>[   =
64.204014] [IGT] kms_vblank: executing
    2022-12-12T22:30:51.775302  d
    2022-12-12T22:30:51.781604  IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux=
: 6.1.0 aarch64) =

    ... (124 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6397ac18c3b33a7af52abe54
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:50.545570  =

    2022-12-12T22:30:50.547865  le, file ../lib/i915/gem_context.c:324:
    2022-12-12T22:30:50.552688  Test requirement: has_ban_period || has_ban=
nable
    2022-12-12T22:30:50.555925  Last errno: 22, Invalid argument
    2022-12-12T22:30:50.556737  =

    2022-12-12T22:30:50.562297  =1B[1mSubtest pipe-A-query-forked-busy-hang=
: SKIP (0.000s)=1B[0m
    2022-12-12T22:30:50.570262  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-12T22:30:50.581494  Test requirement: !(pipe >=3D display->n_pi=
pes || !<6>[   63.013637] Console: switching to colour dummy device 80x25
    2022-12-12T22:30:50.584723  display->pipes[pipe].enabled)
    2022-12-12T22:30:50.585455   =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6397ac18c3b33a7af52abe56
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:49.332493  Test requirement: !(pipe<8>[   61.759670] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>
    2022-12-12T22:30:49.335952   >=3D display->n_pipes || !display->pipes[p=
ipe].enabled)
    2022-12-12T22:30:49.336639  =

    2022-12-12T22:30:49.339451  Pipe D does not exist or not enabled
    2022-12-12T22:30:49.348241  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-12T22:30:49.355364  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-12T22:30:49.356172  =

    2022-12-12T22:30:49.359066  Pipe E does not exist or not enabled
    2022-12-12T22:30:49.368008  Test requirement not met<6>[   61.800308] C=
onsole: switching to colour dummy device 80x25
    2022-12-12T22:30:49.368832   =

    ... (138 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6397ac18c3b33a7af52abe58
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:48.218760  =

    2022-12-12T22:30:48.219995   not exist or not enabled
    2022-12-12T22:30:48.227677  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-12T22:30:48.228485  =

    2022-12-12T22:30:48.235657  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-12T22:30:48.240031  Pipe F does not exist or not enabled
    2022-12-12T22:30:48.248101  IGT-Version: 1.26-gf8a4a0b <6>[   60.679739=
] Console: switching to colour dummy device 80x25
    2022-12-12T22:30:48.248850  =

    2022-12-12T22:30:48.252363  (aarch64) (Linux: 6.1.0 aarch64)
    2022-12-12T22:30:48.253120   =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6397ac18c3b33a7af52abe5a
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:47.014963  t not met in function igt_require_pipe, fil=
e ../lib/igt_kms.c:2358:
    2022-12-12T22:30:47.022350  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-12T22:30:47.026852  Pipe E does not exist or not enabled
    2022-12-12T22:30:47.033879  Test <6>[   59.467233] Console: switching t=
o colour dummy device 80x25
    2022-12-12T22:30:47.044456  requirement not met in function igt_require=
_pipe, file ../lib/ig<14>[   59.473914] [IGT] kms_vblank: executing
    2022-12-12T22:30:47.045294  =

    2022-12-12T22:30:47.046078  t_kms.c:2358:
    2022-12-12T22:30:47.057800  Test requirement: !(pipe >=3D display->n_pi=
pes || !<14>[   59.485859] [IGT] kms_vblank: starting subtest pipe-A-query-=
forked
    2022-12-12T22:30:47.058468  =

    2022-12-12T22:30:47.060812  display->pipes[pipe].enabled) =

    ... (130 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6397ac18c3b33a7af52abe5c
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:45.811662  <8>[   58.241542] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-12-12T22:30:45.854903  <6>[   58.288070] Console: switching to col=
our dummy device 80x25
    2022-12-12T22:30:45.859307  <14>[   58.294812] [IGT] kms_vblank: execut=
ing
    2022-12-12T22:30:45.865304  IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux=
: 6.1.0 aarch64)
    2022-12-12T22:30:45.872898  <14>[   58.301246] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-12-12T22:30:45.876400  Starting subtest: pipe-A-query-idle
    2022-12-12T22:30:45.967328  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-12-12T22:30:46.339648  (kms_vblank:594) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-12-12T22:30:46.347289  (kms_vblank:594) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-12-12T22:30:46.352455  (kms_vblank:594) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6397ac18c3b33a7af52abe5d
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:44.683652  <6>[   57.117700] Console: switching to col=
our dummy device 80x25
    2022-12-12T22:30:44.684545  =

    2022-12-12T22:30:44.688899  <14>[   57.124315] [IGT] kms_vblank: execut=
ing
    2022-12-12T22:30:44.689873  =

    2022-12-12T22:30:44.695156  IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux=
: 6.1.0 aarch64)
    2022-12-12T22:30:44.701863  <14>[   57.130070] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-12-12T22:30:44.706372  Starting subtest: pipe-A-accuracy-idle
    2022-12-12T22:30:44.784318  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-12-12T22:30:44.785220  =

    2022-12-12T22:30:45.190270  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255: =

    ... (97 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
397ac18c3b33a7af52abe66
        failing since 178 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-12T22:30:41.183521  <8>[   53.618915] <LAVA_SIGNAL_TESTSET STOP>
    2022-12-12T22:30:41.221539  <8>[   53.655457] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-12-12T22:30:41.260160  <6>[   53.693755] Console: switching to col=
our dummy device 80x25
    2022-12-12T22:30:41.264769  <14>[   53.700539] [IGT] kms_setmode: execu=
ting
    2022-12-12T22:30:41.271523  IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux=
: 6.1.0 aarch64)
    2022-12-12T22:30:41.277436  <14>[   53.705855] [IGT] kms_setmode: start=
ing subtest basic
    2022-12-12T22:30:41.279612  Starting subtest: basic
    2022-12-12T22:30:41.280369  =

    2022-12-12T22:30:41.284086  Testing: basic 1 connector combinations
    2022-12-12T22:30:41.386749  <14>[   53.819635] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1 =

    ... (91 line(s) more)  =

 =20
