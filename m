Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16744333D45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 14:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhCJNFs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 08:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbhCJNFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 08:05:40 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D668EC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:05:39 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so7455311pjv.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Jx/PEP3+iHfKQ9JepHLani4BdIq833YEsX7V2Hr5J4I=;
        b=gRf41feQFV3pChCOqJWBTbNqWFQBEGWqWtBivx3svjGAuAuQ98twYAE6fnzW0T9xUg
         a/hH+o1q14MGjVa9FPocXnmi6g7wAg3DW8iKpIQm3rPqS5qwM6nj8K5DtdLslFHdg+k/
         u9fdK/EXXjwSSfM+3VEB8GFGerOnI3x/XR6BynZZP46aI44x6/vhGtkBIdiZJpYpd57R
         rrQjPRT6/9ZZSkzp9IC6Jv/QD12SqfqHKjp8BzomcDo+CytMiFP/Fimcw/ThKUJ/F7+H
         4URsK7vsr6q3ZfZpQlaEQDv52JjGFDw8s/q+ogYTW5ZZZ0cKe9LP+E4rYhYPfZy/MxMa
         c6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Jx/PEP3+iHfKQ9JepHLani4BdIq833YEsX7V2Hr5J4I=;
        b=IBGBUQNKrMdYwF+efRed5ouNzwFirinCcPtVvx04ne7+NtVOMdrbDtqvBzKfuoXGWJ
         rMQrf14OLkUZO+ZaFvanNL3DCmlD2E4rkvpwq0nYTYFBsveiDgr3/F2ucBhA0O8oPfiC
         JLwV18H62HxNobCWmk+3jg55oO578lrl6q/oiuAFBzcwdTbawrhifhXUg77oviC2VC9J
         TZIpKmnQeFiIcuNAt8vYUDv5yks+dWrEeIRQJ6Rg2kuhU15t/D1Rqh0babUUCw79PJz3
         mTzU/vrpEVRDQdt0mglEdWAhjUgmR68ZcjQCR2TC9jKe6lNLmB5t9tReQ7JIJxaGjZRL
         XZWA==
X-Gm-Message-State: AOAM530QQYqbUHzUThtzWtaE5H1S1ygdgoRVq1eKUybBoigH7S2YsQUU
        fe668QunV8UgJyaAu2oxDcWVmTuJ8ycMpZ6S
X-Google-Smtp-Source: ABdhPJxjQzua5e31vqVJGYPYxZJnNiqWUmV+52u38mAucHN5038YkuOhm1gJl0g6Bq0+r2or7ZDTEg==
X-Received: by 2002:a17:90a:9f83:: with SMTP id o3mr3472886pjp.133.1615381538853;
        Wed, 10 Mar 2021 05:05:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id il6sm6122146pjb.56.2021.03.10.05.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:05:38 -0800 (PST)
Message-ID: <6048c422.1c69fb81.dc4af.f2ac@mx.google.com>
Date:   Wed, 10 Mar 2021 05:05:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-402-g439caa20adad
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 13 regressions (v5.12-rc2-402-g439caa20adad)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 13 regressions (v5.12-rc2-402-g439=
caa20adad)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 13       =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-rc2-402-g439caa20adad/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: v5.12-rc2-402-g439caa20adad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      439caa20adad0b30e626d9bc776057f3a124a4e2

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  a9bb32cfe1ee87ff831707dfdcbcae56f2b2a036
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2107b0a53692fb329175bc16169c3699712187aa =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 13       =
  =


  Details:     https://kernelci.org/test/plan/id/6048afdcad45e246c0addcd1

  Results:     67 PASS, 29 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6048afddad45e246c0addd2d
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:19.418000+00:00  (kms_vblank:562) CRITICAL: error: -22=
 !=3D 0
    2021-03-10 11:37:19.420000+00:00  Stack trace:
    2021-03-10 11:37:19.424000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-10 11:37:19.427000+00:00    #1 [<unknown>+0xc4a91eb4]
    2021-03-10 11:37:19.430000+00:00    #2 [<unknown>+0xc4a92374]
    2021-03-10 11:37:19.433000+00:00    #3 [<unknown>+0xc4a92ac8]
    2021-03-10 11:37:19.436000+00:00    #4 [<unknown>+0xc4a92d80]
    2021-03-10 11:37:19.438000+00:00    #5 [<unknown>+0xc4a91acc]
    2021-03-10 11:37:19.442000+00:00    #6 [__libc_start_main+0xe4]
    2021-03-10 11:37:19.445000+00:00    #7 [<unknown>+0xc4a91b04] =

    ... (58 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6048afddad45e246c0addd2e
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:20.085000+00:00  <14>[   89.154403] [IGT] kms_vblank: =
executing
    2021-03-10 11:37:20.100000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[   89.161282] [IGT] kms_vblank: starting su=
btest pipe-A-query-idle
    2021-03-10 11:37:20.100000+00:00  =

    2021-03-10 11:37:20.104000+00:00  Starting subtest: pipe-A-query-idle
    2021-03-10 11:37:20.180000+00:00  Beginning pipe-A-query-idle on pipe A=
, connector eDP-1
    2021-03-10 11:37:20.551000+00:00  (kms_vblank:565) CRITICAL: Test asser=
tion failure function vblank_query, file ../tests/kms_vblank.c:283:
    2021-03-10 11:37:20.558000+00:00  (kms_vblank:565) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0
    2021-03-10 11:37:20.564000+00:00  (kms_vblank:565) CRITICAL: Last errno=
: 22, Invalid argument
    2021-03-10 11:37:20.568000+00:00  (kms_vblank:565) CRITICAL: error: -22=
 !=3D 0
    2021-03-10 11:37:20.570000+00:00  Stack trace: =

    ... (65 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6048afddad45e246c0addd30
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:21.221000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:21.229000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:21.233000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:37:21.241000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:21.252000+00:00  Test requirement: !(pipe >=3D<6>[   9=
0.313995] Console: switching to colour dummy device 80x25
    2021-03-10 11:37:21.255000+00:00   display->n_pipes || !display->pipes[=
pipe].enabled)
    2021-03-10 11:37:21.261000+00:00  Pipe F does<14>[   90.324715] [IGT] k=
ms_vblank: executing
    2021-03-10 11:37:21.264000+00:00   not exist or not enabled
    2021-03-10 11:37:21.273000+00:00  <14>[   90.336415] [IGT] kms_vblank: =
starting subtest pipe-A-query-forked
    2021-03-10 11:37:21.278000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64) =

    ... (141 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6048afddad45e246c0addd32
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:22.486000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes <14>[   91.547761] [IGT] kms_vblank: starting subtest pipe-A-quer=
y-busy
    2021-03-10 11:37:22.489000+00:00  || !display->pipes[pipe].enabled)
    2021-03-10 11:37:22.493000+00:00  Pipe F does not exist or not enabled
    2021-03-10 11:37:22.500000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)
    2021-03-10 11:37:22.503000+00:00  Starting subtest: pipe-A-query-busy
    2021-03-10 11:37:22.562000+00:00  Beginning pipe-A-query-busy on pipe A=
, connector eDP-1
    2021-03-10 11:37:22.884000+00:00  (kms_vblank:583) CRITICAL: Test asser=
tion failure function vblank_query, file ../tests/kms_vblank.c:283:
    2021-03-10 11:37:22.891000+00:00  (kms_vblank:583) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0
    2021-03-10 11:37:22.897000+00:00  (kms_vblank:583) CRITICAL: Last errno=
: 22, Invalid argument
    2021-03-10 11:37:22.901000+00:00  (kms_vblank:583) CRITICAL: error: -22=
 !=3D 0 =

    ... (67 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6048afddad45e246c0addd34
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:23.582000+00:00  Pipe D does not exist or not enabled
    2021-03-10 11:37:23.591000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:23.598000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:23.602000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:37:23.616000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/ig<6>[   92.678452] Console: switching to col=
our dummy device 80x25
    2021-03-10 11:37:23.617000+00:00  t_kms.c:1910:
    2021-03-10 11:37:23.626000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !<14>[   92.689867] [IGT] kms_vblank: executing
    2021-03-10 11:37:23.629000+00:00  display->pipes[pipe].enabled)
    2021-03-10 11:37:23.640000+00:00  Pipe F does not exist or not enab<14>=
[   92.702284] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy
    2021-03-10 11:37:23.641000+00:00  led =

    ... (109 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6048afddad45e246c0addd36
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:24.797000+00:00  b/igt_kms.c:1910:
    2021-03-10 11:37:24.805000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:24.808000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:37:24.817000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:24.825000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:24.833000+00:00  Pipe F does not exi<6>[   93.896690] =
Console: switching to colour dummy device 80x25
    2021-03-10 11:37:24.835000+00:00  st or not enabled
    2021-03-10 11:37:24.839000+00:00  <14>[   93.907632] [IGT] kms_vblank: =
executing
    2021-03-10 11:37:24.852000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[   93.914831] [IGT] kms_vblank: starting su=
btest pipe-A-wait-idle
    2021-03-10 11:37:24.853000+00:00   =

    ... (73 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6048afddad45e246c0addd38
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:26.061000+00:00  !display->pipes[pipe].enabled)
    2021-03-10 11:37:26.065000+00:00  Pipe D does not exist or not enabled
    2021-03-10 11:37:26.073000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:26.081000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:26.084000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:37:26.095000+00:00  Test requirement not met in function =
igt_require<6>[   95.158940] Console: switching to colour dummy device 80x25
    2021-03-10 11:37:26.099000+00:00  _pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:26.106000+00:00  Test requirement: !(pipe >=3D <14>[  =
 95.170356] [IGT] kms_vblank: executing
    2021-03-10 11:37:26.112000+00:00  display->n_pipes || !display->pipes[p=
ipe].enabled)
    2021-03-10 11:37:26.120000+00:00  Pipe F does <14>[   95.182047] [IGT] =
kms_vblank: starting subtest pipe-A-wait-forked =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6048afddad45e246c0addd3a
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:27.306000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:27.309000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:37:27.318000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:27.325000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:27.333000+00:00  Pipe F doe<6>[   96.394069] Console: =
switching to colour dummy device 80x25
    2021-03-10 11:37:27.336000+00:00  s not exist or not enabled
    2021-03-10 11:37:27.340000+00:00  <14>[   96.407661] [IGT] kms_vblank: =
executing
    2021-03-10 11:37:27.354000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[   96.415718] [IGT] kms_vblank: starting su=
btest pipe-A-wait-busy
    2021-03-10 11:37:27.354000+00:00  =

    2021-03-10 11:37:27.358000+00:00  Starting subtest: pipe-A-wait-busy =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6048afddad45e246c0addd3c
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:28.606000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:28.610000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:37:28.619000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:28.630000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !di<6>[   97.693952] Console: switching to colour dummy device=
 80x25
    2021-03-10 11:37:28.633000+00:00  splay->pipes[pipe].enabled)
    2021-03-10 11:37:28.640000+00:00  Pipe F does not exist or not enable<1=
4>[   97.703877] [IGT] kms_vblank: executing
    2021-03-10 11:37:28.641000+00:00  d
    2021-03-10 11:37:28.655000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[   97.715935] [IGT] kms_vblank: starting su=
btest pipe-A-wait-forked-busy
    2021-03-10 11:37:28.655000+00:00  =

    2021-03-10 11:37:28.659000+00:00  Starting subtest: pipe-A-wait-forked-=
busy =

    ... (89 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6048afddad45e246c0addd42
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:37:47.876000+00:00  ipe E does not exist or not enabled
    2021-03-10 11:37:47.884000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:37:47.891000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:37:47.895000+00:00  Pipe F does not exist or not enabled
    2021-03-10 11:37:47.904000+00:00  <6>[  101.945077] Console: switching =
to colour dummy device 80x25
    2021-03-10 11:37:47.909000+00:00  <14>[  101.951745] [IGT] kms_vblank: =
executing
    2021-03-10 11:37:47.924000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  101.958252] [IGT] kms_vblank: starting su=
btest pipe-A-ts-continuation-suspend
    2021-03-10 11:37:47.925000+00:00  =

    2021-03-10 11:37:47.930000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-03-10 11:37:48.005000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1 =

    ... (132 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/6048afddad45e246c0addd57
        failing since 1 day (last pass: renesas-devel-2021-02-15-v5.11, fir=
st fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:38:31.830000+00:00  igt_kms.c:1910:
    2021-03-10 11:38:31.838000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:38:31.841000+00:00  Pipe E does not exist or not enabled
    2021-03-10 11:38:31.850000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-10 11:38:31.858000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-10 11:38:31.866000+00:00  Pipe F does not exist<6>[  130.212193=
] Console: switching to colour dummy device 80x25
    2021-03-10 11:38:31.868000+00:00   or not enabled
    2021-03-10 11:38:31.872000+00:00  <14>[  130.225350] [IGT] kms_vblank: =
executing
    2021-03-10 11:38:31.887000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  130.232311] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-03-10 11:38:31.888000+00:00   =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/6048afddad45e246c0addd5a
        failing since 1 day (last pass: renesas-devel-2021-02-15-v5.11, fir=
st fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:38:37.091000+00:00  <14>[  135.444225] [IGT] kms_vblank: =
executing
    2021-03-10 11:38:37.097000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)
    2021-03-10 11:38:37.234000+00:00  <14>[  135.583993] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-dpms-suspend
    2021-03-10 11:38:37.240000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-10 11:38:38.188000+00:00  (kms_vblank:775) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-10 11:38:38.199000+00:00  (kms_vblank:775) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-10 11:38:38.205000+00:00  (kms_vblank:775) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-10 11:38:38.207000+00:00  Stack trace:
    2021-03-10 11:38:38.211000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-10 11:38:38.215000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/6048afddad45e246c0addd5c
        failing since 1 day (last pass: renesas-devel-2021-02-15-v5.11, fir=
st fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:38:42.273000+00:00  <6>[  140.625239] Console: switching =
to colour dummy device 80x25
    2021-03-10 11:38:42.278000+00:00  <14>[  140.631940] [IGT] kms_vblank: =
executing
    2021-03-10 11:38:42.285000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)
    2021-03-10 11:38:42.404000+00:00  <14>[  140.754326] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-modeset
    2021-03-10 11:38:42.409000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-10 11:38:43.342000+00:00  (kms_vblank:781) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-10 11:38:43.352000+00:00  (kms_vblank:781) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-10 11:38:43.359000+00:00  (kms_vblank:781) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-10 11:38:43.360000+00:00  Stack trace:
    2021-03-10 11:38:43.365000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =

 =20
