Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42D460A71F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 14:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbiJXMsA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 08:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbiJXMq3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 08:46:29 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FB28E716
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:10:48 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id j12so8268419plj.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2giz4x5Zd3e2oaing32mRf6q11EC7ARYY+L/wy/YK0E=;
        b=quyYDc4T5Lpf8PjYYkAR8PcYto06xRtymp/cg9OrcbS1Ey2yfFE0iMPrjDLK+xFWec
         yGZT9rnKVUZZNLbWyEJnCdPnsJVC9cv7Wv2mdyzzhBcEvh40JkvC6tybKjTil2zH6Xbj
         TPi0UzZ0PgCiIXv3wgZZlNr3cfNK8LSm3h48qUBhOokD60VmUXaalyW6Fvo0uYuMSqfl
         e6uLBwRjN2DFGnxA646w7ukX9TGSbS7OBA+mZ6kyObqybQ3eNcnBVWsh2eJodAgzpHBI
         KOtL6Tv8Z2oGCEg4svDLY72aJklC3qWLdjGFcPytjseeLst2pJajrG/cv98AQBOdTPWB
         Ye7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2giz4x5Zd3e2oaing32mRf6q11EC7ARYY+L/wy/YK0E=;
        b=ccwFxCfhMEmYMmJB1NUJ+Z2UpGc0oGTqDGh8T1HIvY3Bsq2rpa1ZQbb1MfLjNryVeh
         wE+y6oOQA5OaZzXwMS6CVd0vvc7CUcy2ArVJW3M12kibXY6KiPdZwH/gix0ZKjCdt0l1
         QEiY3EiEHDOY3OlwmMmTX2irL5oogeKTOXZDaPCg2pTGTzvSJujiVB8Im5ABl1laPFu4
         V10Md2Ysl1VBVei89tWJI19jC/I0NKKxnSWhlQvCPUJ+2ho/OmtQTe6B7SmxzdIH7jSM
         VyaDrr1snVo/sqqdUw96PYp7RFLCe8u+gfIan/6wvaCEFtpDvATn+A6IN1v4PSqZ+PRd
         Ie3w==
X-Gm-Message-State: ACrzQf3kg4zWHobvmSKkCO3vqv3pLrDogYUr5jJPyjgB6fcEV4Rup7wF
        7BZ4NFh+wIagUO/XL/L2tErxUIcSTmQCHQGJ
X-Google-Smtp-Source: AMsMyM6ep8bIHZrOaNQ1Q+SvWy2GRFI/SkAXXsJRQM83XEMXZ1rLLzJ5OcEgRWNkbdPHeoBwY33IdA==
X-Received: by 2002:a17:903:447:b0:186:b945:c0b2 with SMTP id iw7-20020a170903044700b00186b945c0b2mr579058plb.25.1666613336649;
        Mon, 24 Oct 2022 05:08:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902654e00b00185402cfedesm3763402pln.246.2022.10.24.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 05:08:56 -0700 (PDT)
Message-ID: <63568058.170a0220.ba775.608a@mx.google.com>
Date:   Mon, 24 Oct 2022 05:08:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-24-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-10-24-v6.1-rc2)
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
-10-24-v6.1-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-24-v6.1-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-24-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      547a476a7857aadfcaa264982527697926c55d6a

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  0bd3e4e94f8270e64c7fd1e361a71da4a1547b1b
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1ea9ec5e7295fbc1cb784be4692971fd342bea53 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63566d0f0c6e54df165e5b43

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221007.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63566d0f0c6e54df165e5bd0
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:31.345583   not met in function igt_require_pipe, file=
 ../lib/igt_kms.c:2302:
    2022-10-24T10:44:31.353830  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-24T10:44:31.357625  Pipe E does not exist or not enabled
    2022-10-24T10:44:31.370372  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt<6>[   70.789388] Console: switching to colour d=
ummy device 80x25
    2022-10-24T10:44:31.375648  <14>[   70.802190] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:31.377462  _kms.c:2302:
    2022-10-24T10:44:31.389473  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   70.807821] [IGT] kms_vblank: starting subtest pipe-A-wait-=
forked-busy
    2022-10-24T10:44:31.392148  isplay->pipes[pipe].enabled)
    2022-10-24T10:44:31.396659  Pipe F does not exist or not enabled
    2022-10-24T10:44:31.403040  IGT-Version: 1.26-g1ea9ec5 (aarch64) (Linux=
: 6.1.0-rc2 aarch64) =

    ... (120 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63566d0f0c6e54df165e5bd2
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:30.114701  ment not met in function igt_require_pipe, =
file ../lib/igt_kms.c:2302:
    2022-10-24T10:44:30.122952  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-24T10:44:30.126186  Pipe E does not exist or not enabled
    2022-10-24T10:44:30.138896  Test requirement not met in function igt_re=
quire_pipe, file ../lib<6>[   69.558157] Console: switching to colour dummy=
 device 80x25
    2022-10-24T10:44:30.141450  /igt_kms.c:2302:
    2022-10-24T10:44:30.150848  Test requirement: !(pipe >=3D display->n_pi=
pes |<14>[   69.570838] [IGT] kms_vblank: executing
    2022-10-24T10:44:30.154006  | !display->pipes[pipe].enabled)
    2022-10-24T10:44:30.163728  Pipe F does not exist or not e<14>[   69.58=
2655] [IGT] kms_vblank: starting subtest pipe-A-wait-busy
    2022-10-24T10:44:30.164963  nabled
    2022-10-24T10:44:30.171308  IGT-Version: 1.26-g1ea9ec5 (aarch64) (Linux=
: 6.1.0-rc2 aarch64) =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63566d0f0c6e54df165e5bd4
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:28.865820  enabled)
    2022-10-24T10:44:28.868963  Pipe D does not exist or not enabled
    2022-10-24T10:44:28.877233  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-24T10:44:28.884835  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-24T10:44:28.889157  Pipe E does not exist or not enabled
    2022-10-24T10:44:28.895863  Test r<6>[   68.316696] Console: switching =
to colour dummy device 80x25
    2022-10-24T10:44:28.900757  <14>[   68.327230] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:28.914477  equirement not met in function igt_require_=
pipe, file ../lib/igt<14>[   68.332898] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked
    2022-10-24T10:44:28.915756  _kms.c:2302:
    2022-10-24T10:44:28.923591  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled) =

    ... (123 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63566d0f0c6e54df165e5bd6
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:27.648740  ay->pipes[pipe].enabled)
    2022-10-24T10:44:27.652658  Pipe D does not exist or not enabled
    2022-10-24T10:44:27.660672  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-24T10:44:27.668456  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-24T10:44:27.672537  Pipe E does not exist or not enabled
    2022-10-24T10:44:27.684455  Test requirement not met in function igt_re=
quire_pipe,<6>[   67.103431] Console: switching to colour dummy device 80x25
    2022-10-24T10:44:27.688341  <14>[   67.115622] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:27.692176   file ../lib/igt_kms.c:2302:
    2022-10-24T10:44:27.702507  Test requirement: !(pipe >=3D displa<14>[  =
 67.121264] [IGT] kms_vblank: starting subtest pipe-A-wait-idle
    2022-10-24T10:44:27.706890  y->n_pipes || !display->pipes[pipe].enabled=
) =

    ... (88 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63566d0f0c6e54df165e5bd8
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:26.415707  Test requirement: !(<8>[   65.835717] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>
    2022-10-24T10:44:26.420695  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-10-24T10:44:26.424681  Pipe D does not exist or not enabled
    2022-10-24T10:44:26.433098  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-24T10:44:26.440610  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-24T10:44:26.444582  Pipe E does not exist or not enabled
    2022-10-24T10:44:26.452950  Test requirement not<6>[   65.871469] Conso=
le: switching to colour dummy device 80x25
    2022-10-24T10:44:26.456817  <14>[   65.884032] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:26.463493   met in function igt_require_pipe, file ../=
lib/igt_kms.c:2302:
    2022-10-24T10:44:26.471283  <14>[   65.889660] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked-busy =

    ... (117 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63566d0f0c6e54df165e5bda
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:25.307018  ay->pipes[pipe].enabled)
    2022-10-24T10:44:25.311278  Pipe E does not exist or not enabled
    2022-10-24T10:44:25.319139  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-24T10:44:25.327787  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-24T10:44:25.331776  Pipe F does not exist or not enabled
    2022-10-24T10:44:25.338856  <6>[   64.763230] Console: switching to col=
our dummy device 80x25
    2022-10-24T10:44:25.343345  <14>[   64.769860] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:25.356877  IGT-Version: 1.26-g1ea9ec5 (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   64.775669] [IGT] kms_vblank: starting subtest p=
ipe-A-query-busy
    2022-10-24T10:44:25.360749  Starting subtest: pipe-A-query-busy
    2022-10-24T10:44:25.452303  Beginning pipe-A-query-busy on pipe A, conn=
ector eDP-1 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63566d0f0c6e54df165e5bdc
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:24.019034  pipes[pipe].enabled)
    2022-10-24T10:44:24.023346  Pipe E does not exist or not enabled
    2022-10-24T10:44:24.030874  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-24T10:44:24.039428  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-24T10:44:24.043334  Pipe F does not exist or not enabled
    2022-10-24T10:44:24.089486  <6>[   63.514003] Console: switching to col=
our dummy device 80x25
    2022-10-24T10:44:24.093569  <14>[   63.520687] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:24.108214  IGT-Version: 1.26-g1ea9ec5 (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   63.527031] [IGT] kms_vblank: starting subtest p=
ipe-A-query-forked
    2022-10-24T10:44:24.111871  Starting subtest: pipe-A-query-forked
    2022-10-24T10:44:24.202578  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1 =

    ... (98 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63566d0f0c6e54df165e5bde
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:22.747324  <8>[   62.169817] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-10-24T10:44:22.819444  <6>[   62.245004] Console: switching to col=
our dummy device 80x25
    2022-10-24T10:44:22.824592  <14>[   62.251854] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:22.838655  IGT-Version: 1.26-g1ea9ec5 (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   62.258550] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-10-24T10:44:22.839263  =

    2022-10-24T10:44:22.843063  Starting subtest: pipe-A-query-idle
    2022-10-24T10:44:22.935893  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-10-24T10:44:23.290024  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-10-24T10:44:23.297611  (kms_vblank:588) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-24T10:44:23.303439  (kms_vblank:588) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (77 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63566d0f0c6e54df165e5bdf
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:21.578742  <6>[   61.003182] Console: switching to col=
our dummy device 80x25
    2022-10-24T10:44:21.583804  <14>[   61.010261] [IGT] kms_vblank: execut=
ing
    2022-10-24T10:44:21.597260  IGT-Version: 1.26-g1ea9ec5 (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   61.016868] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-10-24T10:44:21.597894  =

    2022-10-24T10:44:21.601098  Starting subtest: pipe-A-accuracy-idle
    2022-10-24T10:44:21.703972  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-10-24T10:44:22.074783  (kms_vblank:585) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-10-24T10:44:22.081747  (kms_vblank:585) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-24T10:44:22.088093  (kms_vblank:585) CRITICAL: Last errno: 22, =
Invalid argument
    2022-10-24T10:44:22.092058  (kms_vblank:585) CRITICAL: error: -22 !=3D =
0 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3566d0f0c6e54df165e5be8
        failing since 128 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-24T10:44:17.317127  <8>[   56.744117] <LAVA_SIGNAL_TESTSET STOP>
    2022-10-24T10:44:17.392552  <8>[   56.818163] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-10-24T10:44:17.465674  <6>[   56.889991] Console: switching to col=
our dummy device 80x25
    2022-10-24T10:44:17.470610  <14>[   56.896849] [IGT] kms_setmode: execu=
ting
    2022-10-24T10:44:17.483128  IGT-Version: 1.26-g1ea9ec5 (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   56.903061] [IGT] kms_setmode: starting subtest =
basic
    2022-10-24T10:44:17.483840  =

    2022-10-24T10:44:17.485714  Starting subtest: basic
    2022-10-24T10:44:17.490279  Testing: basic 1 connector combinations
    2022-10-24T10:44:17.600575  <14>[   57.024488] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-10-24T10:44:17.605110  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (76 line(s) more)  =

 =20
