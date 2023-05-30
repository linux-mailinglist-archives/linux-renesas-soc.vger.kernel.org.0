Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453F0715D45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 13:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbjE3Lbo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 07:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjE3Lbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 07:31:42 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71E5102
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:36 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d5b4c3ffeso3106816b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685446295; x=1688038295;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wR/3LXNByZPt3ADZT3olqziFNkyBi7CBqoAc7w8GUeE=;
        b=3XGwe0lIKPOk2VncwujJSQ9T/EZfkArCWKKeIizMh1noHJ2h+eATTJILw244RUHTlb
         0TSYAv0ha1d5nbbWCmWW/hGKmZOD9djNFrqO8NFk55UN4mLcL6aSPNuBmk+bnBkqHmUr
         v/GbqUQDMlH4wKS0RUQy2ax1jksrsOY87UvOl7ExFHAM8D28rD4RUxnhEpNzH8M+oMwY
         GWP5wCQ5lHdqRRqK2NhgjVsRmwl4YYHSdxTexPXswSwDFNPaxHALC4KTLus8i5DaVTtg
         WdcXI8CequUGpkngcEsy1I5oLdM3tKfp8u3olZZFtGPe9V8LxHHaqYty1bqDSNEjGLZN
         R/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446295; x=1688038295;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wR/3LXNByZPt3ADZT3olqziFNkyBi7CBqoAc7w8GUeE=;
        b=UJR+erUag6/wUYew5CM+ZO2F1uSssEc1s3kvZ/zcgkhXVwcD7tkMgOERK0b1fyLLsu
         QE7il8iCR1yZH5dIViIQ34r1jJE/Tg4HdYsO/GjO3Ejptsn0lM6Nhf6pul76GFMkFd8y
         BOCgdHFMDINhNOAaN2xnBa31xL628iQ2FqiIAPx2FLEkffcbDMcN8YGmyXTgrBO+HlxU
         XRCGoTB8HEbNVm5VBJIurcXg42ZOCDqUkycee/HbOfLvAwq38/ejj4rPP/yYJVkjB0Wt
         Zd1zISQFPwaM6XlqErrbjby5rZLMt3l7f+H24Z+cLQz/GXRI6TPRPO+t0FmzGt3uiFYt
         z5fA==
X-Gm-Message-State: AC+VfDw6vQjYs12mIFGDRNzS6IatCSp014s02ZJDvl4aV6lmkorPkfQ9
        R/uFNh6+LjoiS0RGkO/4uFdwnGbvUq2wYhC9OrUJiw==
X-Google-Smtp-Source: ACHHUZ4+sYJTrl1sU4ruvn2DuOI09sgmwOyNymvvRapmHqqifRTmOCG9D+3yL3sM0Sum0rDzjv0mhg==
X-Received: by 2002:a05:6a20:7490:b0:10c:7a20:6dd6 with SMTP id p16-20020a056a20749000b0010c7a206dd6mr2319692pzd.42.1685446295281;
        Tue, 30 May 2023 04:31:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78552000000b0062cf75a9e6bsm1433995pfn.131.2023.05.30.04.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 04:31:34 -0700 (PDT)
Message-ID: <6475de96.a70a0220.36e5a.29e8@mx.google.com>
Date:   Tue, 30 May 2023 04:31:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-30-v6.4-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-05-30-v6.4-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-05-30-v6.4-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-30-v6.4-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-30-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      520bf28625c74fdd976c6c37fb519ccad1cef65b

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  766edf96979bf13a10c9985c007f2baca5c9e308 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6475cf37a1aaae3ed62e85f2

  Results:     66 PASS, 23 FAIL, 198 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6475cf37a1aaae3ed62e86ae
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:28.953835  Test <8>[   54.313096] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>

    2023-05-30T10:23:28.960837  requirement: !(pipe >=3D display->n_pipes |=
| !display->pipes[pipe].enabled)

    2023-05-30T10:23:28.964413  Pipe G does not exist or not enabled

    2023-05-30T10:23:28.973619  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:28.980384  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:28.984245  Pipe H does not exist or not enabled

    2023-05-30T10:23:28.990793  <6>[   54.356102] Console: switching to col=
our dummy device 80x25

    2023-05-30T10:23:28.996291  <14>[   54.364515] [IGT] kms_vblank: execut=
ing

    2023-05-30T10:23:29.010715  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc4 aarch64<14>[   54.371270] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-05-30T10:23:29.010984  )
 =

    ... (124 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6475cf37a1aaae3ed62e86b0
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:27.662711  text.c:324:

    2023-05-30T10:23:27.668078  Test requirement: has_ban_period || has_ban=
nable

    2023-05-30T10:23:27.671461  Last errno: 22, Invalid argument

    2023-05-30T10:23:27.676977  =1B[1mSubtest pipe-A-query-forked-hang: SKI=
P (0.000s)=1B[0m

    2023-05-30T10:23:27.684752  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:27.692334  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:27.699486  Pi<6>[   53.063141] Console: switching to c=
olour dummy device 80x25

    2023-05-30T10:23:27.703212  pe C does not exist or not enabled

    2023-05-30T10:23:27.710117  Test requirement not met in <14>[   53.0725=
38] [IGT] kms_vblank: executing

    2023-05-30T10:23:27.715645  function igt_require_pipe, file ../lib/igt_=
kms.c:2429:
 =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6475cf37a1aaae3ed62e86b2
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:26.296490  Test requiremen<8>[   51.657152] <LAVA_SIGN=
AL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang RESULT=3Dskip>

    2023-05-30T10:23:26.303313  t: !(pipe >=3D display->n_pipes || !display=
->pipes[pipe].enabled)

    2023-05-30T10:23:26.306541  Pipe F does not exist or not enabled

    2023-05-30T10:23:26.314973  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:26.322485  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:26.326844  Pipe G does not exist or not enabled

    2023-05-30T10:23:26.334327  Test requiremen<6>[   51.698930] Console: s=
witching to colour dummy device 80x25

    2023-05-30T10:23:26.345008  t not met in function igt_require_pipe, fil=
e ../lib/igt_kms.c:24<14>[   51.707223] [IGT] kms_vblank: executing

    2023-05-30T10:23:26.346245  29:

    2023-05-30T10:23:26.358596  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->p<14>[   51.719777] [IGT] kms_vblank: starting subtest pip=
e-A-query-forked
 =

    ... (127 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6475cf37a1aaae3ed62e86b7
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:34.088901  quirement not met in function igt_require_p=
ipe, file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:34.096405  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:34.105670  Pipe F does not exist or not enable<6>[   5=
9.472385] Console: switching to colour dummy device 80x25

    2023-05-30T10:23:34.106344  d

    2023-05-30T10:23:34.116998  Test requirement not met in function igt_re=
quire_pipe, file .<14>[   59.479188] [IGT] kms_vblank: executing

    2023-05-30T10:23:34.119371  ./lib/igt_kms.c:2429:

    2023-05-30T10:23:34.131565  Test requirement: !(pipe >=3D display->n_pi=
<14>[   59.491201] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-bu=
sy

    2023-05-30T10:23:34.135262  pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:34.138537  Pipe G does not exist or not enabled

    2023-05-30T10:23:34.147572  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:
 =

    ... (121 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6475cf37a1aaae3ed62e86b9
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:32.850526  ay->pipes[pipe].enabled)

    2023-05-30T10:23:32.853699  Pipe E does not exist or not enabled

    2023-05-30T10:23:32.861674  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:32.869918  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:32.873816  Pipe F does not exist or not enabled

    2023-05-30T10:23:32.884792  Test requirement not met in function igt_re=
quire_pipe,<6>[   58.249362] Console: switching to colour dummy device 80x25

    2023-05-30T10:23:32.887712   file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:32.895882  Test requirement: !(pipe >=3D displa<14>[  =
 58.258780] [IGT] kms_vblank: executing

    2023-05-30T10:23:32.901378  y->n_pipes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:32.909295  Pipe G does not ex<14>[   58.271394] [IGT] =
kms_vblank: starting subtest pipe-A-wait-busy
 =

    ... (100 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6475cf37a1aaae3ed62e86bb
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:31.560454  ipe F does not exist or not enabled

    2023-05-30T10:23:31.568439  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:31.577048  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:31.580640  Pipe G does not exist or not enabled

    2023-05-30T10:23:31.594237  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429<6>[   56.957515] Console: switching =
to colour dummy device 80x25

    2023-05-30T10:23:31.595154  :

    2023-05-30T10:23:31.606063  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pip<14>[   56.967700] [IGT] kms_vblank: executing

    2023-05-30T10:23:31.608175  es[pipe].enabled)

    2023-05-30T10:23:31.611440  Pipe H does not exist or not enabled

    2023-05-30T10:23:31.619369  IGT-Ver<14>[   56.979823] [IGT] kms_vblank:=
 starting subtest pipe-A-wait-forked
 =

    ... (122 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6475cf37a1aaae3ed62e86bd
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:30.270578  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:24<8>[   55.628694] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>

    2023-05-30T10:23:30.271201  29:

    2023-05-30T10:23:30.278681  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:30.282407  Pipe C does not exist or not enabled

    2023-05-30T10:23:30.290590  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-30T10:23:30.298753  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-30T10:23:30.307907  Pipe D does not exist or not enab<6>[   55.=
671431] Console: switching to colour dummy device 80x25

    2023-05-30T10:23:30.308795  led

    2023-05-30T10:23:30.319475  Test requirement not met in function igt_re=
quire_pipe, file<14>[   55.681372] [IGT] kms_vblank: executing

    2023-05-30T10:23:30.321733   ../lib/igt_kms.c:2429:
 =

    ... (109 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6475cf37a1aaae3ed62e86bf
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:25.029568  <6>[   50.396134] Console: switching to col=
our dummy device 80x25

    2023-05-30T10:23:25.034731  <14>[   50.402800] [IGT] kms_vblank: execut=
ing

    2023-05-30T10:23:25.048202  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc4 aarch64<14>[   50.409367] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-05-30T10:23:25.048727  )

    2023-05-30T10:23:25.051148  Opened device: /dev/dri/card1

    2023-05-30T10:23:25.055748  Starting subtest: pipe-A-query-idle

    2023-05-30T10:23:25.134360  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-05-30T10:23:25.539288  (kms_vblank:543) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-05-30T10:23:25.545851  (kms_vblank:543) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-05-30T10:23:25.551722  (kms_vblank:543) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6475cf37a1aaae3ed62e86c0
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:23.752687  <6>[   49.119120] Console: switching to col=
our dummy device 80x25

    2023-05-30T10:23:23.757440  <14>[   49.125971] [IGT] kms_vblank: execut=
ing

    2023-05-30T10:23:23.771703  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc4 aarch64<14>[   49.135804] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-05-30T10:23:23.772358  )

    2023-05-30T10:23:23.775292  Opened device: /dev/dri/card1

    2023-05-30T10:23:23.779629  Starting subtest: pipe-A-accuracy-idle

    2023-05-30T10:23:23.851016  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-05-30T10:23:24.322984  (kms_vblank:539) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-05-30T10:23:24.329689  (kms_vblank:539) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-05-30T10:23:24.335774  (kms_vblank:539) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (90 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
475cf37a1aaae3ed62e86c9
        failing since 346 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-30T10:23:19.840948  <8>[   45.209032] <LAVA_SIGNAL_TESTSET STOP>

    2023-05-30T10:23:19.882105  <8>[   45.249308] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-05-30T10:23:19.912995  <6>[   45.279409] Console: switching to col=
our dummy device 80x25

    2023-05-30T10:23:19.918159  <14>[   45.286096] [IGT] kms_setmode: execu=
ting

    2023-05-30T10:23:19.930147  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc4 aarch64<14>[   45.291423] [IGT] kms_setmode: starting subtest=
 basic

    2023-05-30T10:23:19.930424  )

    2023-05-30T10:23:19.934226  Opened device: /dev/dri/card1

    2023-05-30T10:23:19.936096  Starting subtest: basic

    2023-05-30T10:23:19.940507  Testing: basic 1 connector combinations

    2023-05-30T10:23:20.026859  <14>[   45.392578] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
