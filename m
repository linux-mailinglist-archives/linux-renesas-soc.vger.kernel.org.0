Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01065365010
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Apr 2021 04:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbhDTCB4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 22:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhDTCBz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 22:01:55 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AE3C06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 19:01:23 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id c3so5668603pfo.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 19:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oBWo1RFI9cHn68dZHHwOuKWVe9ETPhccvjHe1+HzCIY=;
        b=eNN73r4FGBYz/7UXK72QRyRcRGTCLr3C5mlg8CRuhKEVTuGFpUzYkTg/sTlIOVvNlT
         sSBpUGmN3Y35+cauNfumDv21Sx6KI13R2Ii7oq4ns2ArDWVeeckzT71pg7eUDTFU5Qj2
         zH6mp0lhl5iEPHzCqkqAQ8MGi7dC+eSjMhFbi4d3kFDzshUIwUYDNEUk4XUUesm2vVza
         6cbSlqxp0Zz8Kly7esGVBLGEiKbEoL0+sllZeebETnJJtWjrNUJwMPZFZ1etdB+pRWW0
         0h/FbX+F/rcyMD/bvcOOtEcmaS+sUtkmKeHaGtFQj30te9YinCwJkBvtKmyZATvABmag
         fo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oBWo1RFI9cHn68dZHHwOuKWVe9ETPhccvjHe1+HzCIY=;
        b=Z01oI7lSI+K81RvemoiJz6pEyz6F1XBTCPBUEnBWKcQCVdFrJypF3pcxYEPXXUihY9
         Cdl5gMXNKTSaE2DKLA7OAU9E7isZkF44/q2MWW7rGlFv7DBgteyEAhpMQpX5p6JdL9Md
         gX/kj0mD0Ojkxz/+Thcl0oJ9elV3KaqdYUaK5ZwgJ0vL/+Zdk6gC5poOh3FStSu73m+q
         +6ScNh5FA8EDDRIczsGiG4XOabrH/zB+C/5BN2fXGcPLgwEiMyFO7YZaGUhhO/Q7B3er
         RGrj7kRPEWmnC6TOMU6vl7m6uqJ0+OBM8Ne1uGXcLBVxEDGVdulzKfO3yOsGIXzXJTsE
         Bwyw==
X-Gm-Message-State: AOAM533kntySmQwMAzH3BJmgk5Qrc3ximFU1Q8AR8XHLQhwBGEUoNLCt
        v8DAfqgBTpz85a9tHc4R/x54ANDt6WBJl/sa
X-Google-Smtp-Source: ABdhPJyyV8TMol1dQf7+DQ1AnyEP9mHTjdBppDxsRVfV5gJsAT8/5xRz011xl9FtFv6rSLTh9WU40Q==
X-Received: by 2002:a63:485b:: with SMTP id x27mr15022764pgk.0.1618884082640;
        Mon, 19 Apr 2021 19:01:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r14sm620321pjz.43.2021.04.19.19.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 19:01:22 -0700 (PDT)
Message-ID: <607e35f2.1c69fb81.ed54.31ec@mx.google.com>
Date:   Mon, 19 Apr 2021 19:01:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-04-19-v5.12-rc8
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 13 regressions (renesas-devel-2021-04-19-v5.12-rc8)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 13 regressions (renesas-devel-2021=
-04-19-v5.12-rc8)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 13       =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-19-v5.12-rc8/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-19-v5.12-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a07b5a56e02f9a237f18f2335bd7f029b63739e3

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  991e95fd138e6b651e4c549772a08bc21a054ff6
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 13       =
  =


  Details:     https://kernelci.org/test/plan/id/607e237c42034285ce9b77ad

  Results:     67 PASS, 29 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210412.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/607e237c42034285ce9b7809
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:47.080000+00:00  nt: !(pipe >=3D display->n_pipes || !=
display->pipes[pipe].enabled)
    2021-04-20 00:40:47.084000+00:00  Pipe F does not exist or not enabled
    2021-04-20 00:40:47.108000+00:00  <6>[   87.901416] Console: switching =
to colour dummy device 80x25
    2021-04-20 00:40:47.113000+00:00  <14>[   87.908112] [IGT] kms_vblank: =
executing
    2021-04-20 00:40:47.127000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc8 aarch64)<14>[   87.914307] [IGT] kms_vblank: starting su=
btest pipe-A-accuracy-idle
    2021-04-20 00:40:47.128000+00:00  =

    2021-04-20 00:40:47.131000+00:00  Starting subtest: pipe-A-accuracy-idle
    2021-04-20 00:40:47.208000+00:00  Beginning pipe-A-accuracy-idle on pip=
e A, connector eDP-1
    2021-04-20 00:40:47.564000+00:00  (kms_vblank:563) CRITICAL: Test asser=
tion failure function accuracy, file ../tests/kms_vblank.c:248:
    2021-04-20 00:40:47.571000+00:00  (kms_vblank:563) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/607e237c42034285ce9b780a
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:48.243000+00:00  <14>[   89.037972] [IGT] kms_vblank: =
executing
    2021-04-20 00:40:48.256000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc8 aarch64)<14>[   89.044154] [IGT] kms_vblank: starting su=
btest pipe-A-query-idle
    2021-04-20 00:40:48.257000+00:00  =

    2021-04-20 00:40:48.260000+00:00  Starting subtest: pipe-A-query-idle
    2021-04-20 00:40:48.341000+00:00  Beginning pipe-A-query-idle on pipe A=
, connector eDP-1
    2021-04-20 00:40:48.697000+00:00  (kms_vblank:566) CRITICAL: Test asser=
tion failure function vblank_query, file ../tests/kms_vblank.c:283:
    2021-04-20 00:40:48.704000+00:00  (kms_vblank:566) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0
    2021-04-20 00:40:48.711000+00:00  (kms_vblank:566) CRITICAL: Last errno=
: 22, Invalid argument
    2021-04-20 00:40:48.715000+00:00  (kms_vblank:566) CRITICAL: error: -22=
 !=3D 0
    2021-04-20 00:40:48.716000+00:00  Stack trace: =

    ... (66 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/607e237c42034285ce9b780c
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:49.391000+00:00  e].enabled)
    2021-04-20 00:40:49.395000+00:00  Pipe D does not exist or not enabled
    2021-04-20 00:40:49.403000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:49.411000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:40:49.415000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:40:49.427000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   90.217589] Console: switching to colou=
r dummy device 80x25
    2021-04-20 00:40:49.429000+00:00  igt_kms.c:1910:
    2021-04-20 00:40:49.438000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   90.227674] [IGT] kms_vblank: executing
    2021-04-20 00:40:49.442000+00:00   !display->pipes[pipe].enabled)
    2021-04-20 00:40:49.452000+00:00  Pipe F does not exist or not en<14>[ =
  90.239430] [IGT] kms_vblank: starting subtest pipe-A-query-forked =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/607e237c42034285ce9b780e
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:50.597000+00:00  Pipe D does not exist or not enabled
    2021-04-20 00:40:50.605000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:50.612000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:40:50.616000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:40:50.629000+00:00  Test requirement not met in function =
igt_require_pipe, file ../<6>[   91.417716] Console: switching to colour du=
mmy device 80x25
    2021-04-20 00:40:50.631000+00:00  lib/igt_kms.c:1910:
    2021-04-20 00:40:50.640000+00:00  Test requirement: !(pipe >=3D display=
->n_pipe<14>[   91.429015] [IGT] kms_vblank: executing
    2021-04-20 00:40:50.644000+00:00  s || !display->pipes[pipe].enabled)
    2021-04-20 00:40:50.653000+00:00  Pipe F does not exist or no<14>[   91=
.440795] [IGT] kms_vblank: starting subtest pipe-A-query-busy
    2021-04-20 00:40:50.655000+00:00  t enabled =

    ... (73 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/607e237c42034285ce9b7810
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:51.774000+00:00  e].enabled)
    2021-04-20 00:40:51.777000+00:00  Pipe D does not exist or not enabled
    2021-04-20 00:40:51.786000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:51.794000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:40:51.797000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:40:51.810000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   92.599710] Console: switching to colou=
r dummy device 80x25
    2021-04-20 00:40:51.812000+00:00  igt_kms.c:1910:
    2021-04-20 00:40:51.821000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   92.610065] [IGT] kms_vblank: executing
    2021-04-20 00:40:51.825000+00:00   !display->pipes[pipe].enabled)
    2021-04-20 00:40:51.835000+00:00  Pipe F does not exist or not en<14>[ =
  92.622075] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (118 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/607e237c42034285ce9b7812
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:53.046000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:53.054000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:40:53.058000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:40:53.066000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:53.076000+00:00  Test requirement: !(pipe >=3D displ<6=
>[   93.865218] Console: switching to colour dummy device 80x25
    2021-04-20 00:40:53.080000+00:00  ay->n_pipes || !display->pipes[pipe].=
enabled)
    2021-04-20 00:40:53.087000+00:00  Pipe F does not e<14>[   93.875828] [=
IGT] kms_vblank: executing
    2021-04-20 00:40:53.089000+00:00  xist or not enabled
    2021-04-20 00:40:53.095000+00:00  <14>[   93.887576] [IGT] kms_vblank: =
starting subtest pipe-A-wait-idle
    2021-04-20 00:40:53.102000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc8 aarch64) =

    ... (72 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/607e237c42034285ce9b7814
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:54.324000+00:00  .enabled)
    2021-04-20 00:40:54.327000+00:00  Pipe D does not exist or not enabled
    2021-04-20 00:40:54.335000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:54.343000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:40:54.347000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:40:54.360000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/ig<6>[   95.149570] Console: switching to col=
our dummy device 80x25
    2021-04-20 00:40:54.362000+00:00  t_kms.c:1910:
    2021-04-20 00:40:54.371000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !<14>[   95.160546] [IGT] kms_vblank: executing
    2021-04-20 00:40:54.374000+00:00  display->pipes[pipe].enabled)
    2021-04-20 00:40:54.385000+00:00  Pipe F does not exist or not enab<14>=
[   95.172207] [IGT] kms_vblank: starting subtest pipe-A-wait-forked =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/607e237c42034285ce9b7816
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:55.587000+00:00  ipe].enabled)
    2021-04-20 00:40:55.591000+00:00  Pipe D does not exist or not enabled
    2021-04-20 00:40:55.599000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:55.607000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:40:55.610000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:40:55.623000+00:00  Test requirement not met in function =
igt_require_pipe, file ../li<6>[   96.413084] Console: switching to colour =
dummy device 80x25
    2021-04-20 00:40:55.625000+00:00  b/igt_kms.c:1910:
    2021-04-20 00:40:55.634000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes <14>[   96.423478] [IGT] kms_vblank: executing
    2021-04-20 00:40:55.637000+00:00  || !display->pipes[pipe].enabled)
    2021-04-20 00:40:55.647000+00:00  Pipe F does not exist or not <14>[   =
96.435317] [IGT] kms_vblank: starting subtest pipe-A-wait-busy =

    ... (74 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/607e237c42034285ce9b7818
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:40:56.844000+00:00  Pipe D does not exist or not enabled
    2021-04-20 00:40:56.852000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:40:56.860000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:40:56.863000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:40:56.877000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/ig<6>[   97.666035] Console: switching to col=
our dummy device 80x25
    2021-04-20 00:40:56.879000+00:00  t_kms.c:1910:
    2021-04-20 00:40:56.888000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !<14>[   97.677200] [IGT] kms_vblank: executing
    2021-04-20 00:40:56.891000+00:00  display->pipes[pipe].enabled)
    2021-04-20 00:40:56.902000+00:00  Pipe F does not exist or not enab<14>=
[   97.689094] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-busy
    2021-04-20 00:40:56.903000+00:00  led =

    ... (94 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/607e237c42034285ce9b781e
        failing since 6 days (last pass: renesas-devel-2021-04-05-v5.12-rc6=
, first fail: renesas-devel-2021-04-12-v5.12-rc7)

    2021-04-20 00:41:16.643000+00:00  ipe E does not exist or not enabled
    2021-04-20 00:41:16.651000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:41:16.658000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:41:16.662000+00:00  Pipe F does not exist or not enabled
    2021-04-20 00:41:16.673000+00:00  <6>[  101.812398] Console: switching =
to colour dummy device 80x25
    2021-04-20 00:41:16.678000+00:00  <14>[  101.819078] [IGT] kms_vblank: =
executing
    2021-04-20 00:41:16.693000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc8 aarch64)<14>[  101.825345] [IGT] kms_vblank: starting su=
btest pipe-A-ts-continuation-suspend
    2021-04-20 00:41:16.693000+00:00  =

    2021-04-20 00:41:16.698000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-04-20 00:41:16.777000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1 =

    ... (132 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/607e237c42034285ce9b7833
        failing since 42 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-20 00:41:58.644000+00:00  igt_kms.c:1910:
    2021-04-20 00:41:58.652000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:41:58.655000+00:00  Pipe E does not exist or not enabled
    2021-04-20 00:41:58.663000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-20 00:41:58.671000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-20 00:41:58.680000+00:00  Pipe F does not exist<6>[  128.949653=
] Console: switching to colour dummy device 80x25
    2021-04-20 00:41:58.681000+00:00   or not enabled
    2021-04-20 00:41:58.686000+00:00  <14>[  128.962294] [IGT] kms_vblank: =
executing
    2021-04-20 00:41:58.701000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc8 aarch64)<14>[  128.969660] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-04-20 00:41:58.701000+00:00   =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/607e237c42034285ce9b7836
        failing since 42 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-20 00:42:03.834000+00:00  <6>[  134.110219] Console: switching =
to colour dummy device 80x25
    2021-04-20 00:42:03.839000+00:00  <14>[  134.116917] [IGT] kms_vblank: =
executing
    2021-04-20 00:42:03.846000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc8 aarch64)
    2021-04-20 00:42:03.981000+00:00  <14>[  134.254941] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-dpms-suspend
    2021-04-20 00:42:03.987000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-04-20 00:42:04.952000+00:00  (kms_vblank:776) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-04-20 00:42:04.962000+00:00  (kms_vblank:776) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-04-20 00:42:04.969000+00:00  (kms_vblank:776) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-04-20 00:42:04.970000+00:00  Stack trace:
    2021-04-20 00:42:04.975000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/607e237c42034285ce9b7838
        failing since 42 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-20 00:42:09.086000+00:00  <6>[  139.361536] Console: switching =
to colour dummy device 80x25
    2021-04-20 00:42:09.091000+00:00  <14>[  139.368225] [IGT] kms_vblank: =
executing
    2021-04-20 00:42:09.098000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc8 aarch64)
    2021-04-20 00:42:09.234000+00:00  <14>[  139.508209] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-modeset
    2021-04-20 00:42:09.239000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-04-20 00:42:10.188000+00:00  (kms_vblank:782) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-04-20 00:42:10.198000+00:00  (kms_vblank:782) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-04-20 00:42:10.204000+00:00  (kms_vblank:782) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-04-20 00:42:10.206000+00:00  Stack trace:
    2021-04-20 00:42:10.211000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (62 line(s) more)  =

 =20
