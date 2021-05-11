Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BC437AAC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 17:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhEKPhF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 11:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbhEKPhD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 11:37:03 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A00C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 08:35:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id pf4-20020a17090b1d84b029015ccffe0f2eso687480pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kkHM8E0Urmm9FiMKq/sMZOPwGNPXtSzRNwbC3TZLLg8=;
        b=IQzEOWl4wRsnFjk6Oss2m9mEiu/qe9A+fyrhTrzKN2HmiPJx0bfmjJO+0WSNl+2zhY
         QAfgbAo1HnsfcVUTzZspQPkymk7IbdhprazclmXGp9TiMzfhxPqqVDKlmhFnjgmVKcZq
         f7otqIAiUFvkB5hzJtPx6N0Mz4Ti60o3SQ6B/UZDhwJL+Olf/kJaN5qJHI2CLwvR28PT
         y3Awbi57Xn9oNcw+fY+FD38VqNyHSShq9HKjyDOuAbNEI/Hn7x7aFxZ1UtJDQRnLuRBf
         tUyuVbpGvjCuYm8c/OAwrLkNmxg4BrjVI6f7SRZ9iBEln5x1AvXn8glcn1djq+11aCup
         VV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kkHM8E0Urmm9FiMKq/sMZOPwGNPXtSzRNwbC3TZLLg8=;
        b=E0xfcQjcHR6IoQyj2cDU1Nt1jpX9H9wKKZlx5XEi0YWuda1xed9XZY+bn2CX9UKVfo
         GNlE2EVGfBLwHDxQKwd91HtgRId8K72Sv6XMS3y8kvWJVc9zfs6ascsL6WAQvSTSpnxR
         80WT8XkdTHIMqzBMQX3cuziwPQBhplWqgw4RehJxVA60hbNqqsdpY1cIYfLzxwO0fD19
         FJoVxjWMbfwZgfXnAxvOgG3JkwQHIhnanmg2uEaj3YGnmNyXF9zRyV6xA4/HrDLz3zXM
         iHyHywamdvfm5F8siP6op0TXmKC5LJiacdbcNiVi+HJfsbeCmxHwsbCTJe1xbwoIdQYO
         eFgw==
X-Gm-Message-State: AOAM530cLgcbIJ9YuMXN9Z6z6Yt5uaILmoIEd+7oKQAILdhDkQyYTAx5
        8HKBRFXT/pnRxzd1ZrBz/FNNCD/EQJlbs3bd
X-Google-Smtp-Source: ABdhPJzVKRTewzwNemuUAdwMP1hA2WO6K8l8xJaEiJkgz5xRflO+R7O1GHGem0L4laSaQ7s5gUKqrA==
X-Received: by 2002:a17:902:6ac6:b029:ee:e9ac:59f9 with SMTP id i6-20020a1709026ac6b02900eee9ac59f9mr30329687plt.58.1620747353493;
        Tue, 11 May 2021 08:35:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z29sm14118135pga.52.2021.05.11.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 08:35:53 -0700 (PDT)
Message-ID: <609aa459.1c69fb81.8e22a.b0eb@mx.google.com>
Date:   Tue, 11 May 2021 08:35:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-05-11-v5.13-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 13 regressions (renesas-devel-2021-05-11-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 13 regressions (renesas-devel-2021=
-05-11-v5.13-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 13       =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-11-v5.13-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-11-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bff1b0e749d4df5f61ce46122ab7f5c522684b50

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  bf08984682a2bc7c4a1e01dd2af8d4c1d75cea46
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  126a3f6fc0e97786e2819085efc84e741093aed5 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 13       =
  =


  Details:     https://kernelci.org/test/plan/id/609a9614ddd686e1856f547f

  Results:     67 PASS, 29 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210503.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/609a9615ddd686e1856f54db
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:06.546000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:06.550000+00:00  Pipe F does not exist or not enabled
    2021-05-11 14:33:06.567000+00:00  <6>[   86.967032] Console: switching =
to colour dummy device 80x25
    2021-05-11 14:33:06.572000+00:00  <14>[   86.973703] [IGT] kms_vblank: =
executing
    2021-05-11 14:33:06.586000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[   86.980104] [IGT] kms_vblank: starting su=
btest pipe-A-accuracy-idle
    2021-05-11 14:33:06.586000+00:00  =

    2021-05-11 14:33:06.590000+00:00  Starting subtest: pipe-A-accuracy-idle
    2021-05-11 14:33:06.673000+00:00  Beginning pipe-A-accuracy-idle on pip=
e A, connector eDP-1
    2021-05-11 14:33:07.061000+00:00  (kms_vblank:565) CRITICAL: Test asser=
tion failure function accuracy, file ../tests/kms_vblank.c:248:
    2021-05-11 14:33:07.068000+00:00  (kms_vblank:565) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (68 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/609a9615ddd686e1856f54dc
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:07.734000+00:00  <6>[   88.134136] Console: switching =
to colour dummy device 80x25
    2021-05-11 14:33:07.739000+00:00  <14>[   88.140818] [IGT] kms_vblank: =
executing
    2021-05-11 14:33:07.753000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[   88.147152] [IGT] kms_vblank: starting su=
btest pipe-A-query-idle
    2021-05-11 14:33:07.753000+00:00  =

    2021-05-11 14:33:07.757000+00:00  Starting subtest: pipe-A-query-idle
    2021-05-11 14:33:07.839000+00:00  Beginning pipe-A-query-idle on pipe A=
, connector eDP-1
    2021-05-11 14:33:08.228000+00:00  (kms_vblank:568) CRITICAL: Test asser=
tion failure function vblank_query, file ../tests/kms_vblank.c:283:
    2021-05-11 14:33:08.234000+00:00  (kms_vblank:568) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0
    2021-05-11 14:33:08.240000+00:00  (kms_vblank:568) CRITICAL: Last errno=
: 22, Invalid argument
    2021-05-11 14:33:08.244000+00:00  (kms_vblank:568) CRITICAL: error: -22=
 !=3D 0 =

    ... (67 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/609a9615ddd686e1856f54de
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:08.923000+00:00  e].enabled)
    2021-05-11 14:33:08.927000+00:00  Pipe D does not exist or not enabled
    2021-05-11 14:33:08.934000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:08.942000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:08.946000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:33:08.959000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   89.355160] Console: switching to colou=
r dummy device 80x25
    2021-05-11 14:33:08.961000+00:00  igt_kms.c:2094:
    2021-05-11 14:33:08.970000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   89.365818] [IGT] kms_vblank: executing
    2021-05-11 14:33:08.973000+00:00   !display->pipes[pipe].enabled)
    2021-05-11 14:33:08.984000+00:00  Pipe F does not exist or not en<14>[ =
  89.377983] [IGT] kms_vblank: starting subtest pipe-A-query-forked =

    ... (118 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/609a9615ddd686e1856f54e0
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:10.212000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:10.216000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:33:10.224000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:10.232000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:10.241000+00:00  Pipe F does not exist or no<6>[   90.=
637872] Console: switching to colour dummy device 80x25
    2021-05-11 14:33:10.242000+00:00  t enabled
    2021-05-11 14:33:10.247000+00:00  <14>[   90.647521] [IGT] kms_vblank: =
executing
    2021-05-11 14:33:10.260000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[   90.654504] [IGT] kms_vblank: starting su=
btest pipe-A-query-busy
    2021-05-11 14:33:10.261000+00:00  =

    2021-05-11 14:33:10.264000+00:00  Starting subtest: pipe-A-query-busy =

    ... (72 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/609a9615ddd686e1856f54e2
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:11.406000+00:00  e].enabled)
    2021-05-11 14:33:11.408000+00:00  Pipe D does not exist or not enabled
    2021-05-11 14:33:11.417000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:11.425000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:11.429000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:33:11.442000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   91.838276] Console: switching to colou=
r dummy device 80x25
    2021-05-11 14:33:11.444000+00:00  igt_kms.c:2094:
    2021-05-11 14:33:11.453000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   91.847921] [IGT] kms_vblank: executing
    2021-05-11 14:33:11.456000+00:00   !display->pipes[pipe].enabled)
    2021-05-11 14:33:11.467000+00:00  Pipe F does not exist or not en<14>[ =
  91.860229] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/609a9615ddd686e1856f54e4
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:12.630000+00:00  ement: !(pipe >=3D display->n_pipes |=
| !display->pipes[pipe].enabled)
    2021-05-11 14:33:12.633000+00:00  Pipe D does not exist or not enabled
    2021-05-11 14:33:12.641000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:12.649000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:12.653000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:33:12.661000+00:00  Test requir<6>[   93.054882] Console:=
 switching to colour dummy device 80x25
    2021-05-11 14:33:12.671000+00:00  ement not met in function igt_require=
_pipe, file ../lib/igt_kms.<14>[   93.066920] [IGT] kms_vblank: executing
    2021-05-11 14:33:12.672000+00:00  c:2094:
    2021-05-11 14:33:12.684000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !displa<14>[   93.078846] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-idle
    2021-05-11 14:33:12.687000+00:00  y->pipes[pipe].enabled) =

    ... (75 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/609a9615ddd686e1856f54e6
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:13.911000+00:00  t not met in function igt_require_pip=
e, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:13.919000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:13.923000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:33:13.931000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:13.942000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !<6>[   94.338971] Console: switching to colour dummy device 8=
0x25
    2021-05-11 14:33:13.945000+00:00  display->pipes[pipe].enabled)
    2021-05-11 14:33:13.953000+00:00  Pipe F does not exist or not enab<14>=
[   94.348565] [IGT] kms_vblank: executing
    2021-05-11 14:33:13.954000+00:00  led
    2021-05-11 14:33:13.966000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[   94.360510] [IGT] kms_vblank: starting su=
btest pipe-A-wait-forked
    2021-05-11 14:33:13.967000+00:00   =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/609a9615ddd686e1856f54e8
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:15.199000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:15.203000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:33:15.211000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:15.222000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes <6>[   95.619130] Console: switching to colour dummy device 80x25
    2021-05-11 14:33:15.225000+00:00  || !display->pipes[pipe].enabled)
    2021-05-11 14:33:15.233000+00:00  Pipe F does not exist or not <14>[   =
95.628261] [IGT] kms_vblank: executing
    2021-05-11 14:33:15.233000+00:00  enabled
    2021-05-11 14:33:15.247000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[   95.640329] [IGT] kms_vblank: starting su=
btest pipe-A-wait-busy
    2021-05-11 14:33:15.248000+00:00  =

    2021-05-11 14:33:15.251000+00:00  Starting subtest: pipe-A-wait-busy =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/609a9615ddd686e1856f54ea
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:16.458000+00:00  Pipe D does not exist or not enabled
    2021-05-11 14:33:16.466000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:33:16.474000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:33:16.478000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:33:16.490000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/ig<6>[   96.887947] Console: switching to col=
our dummy device 80x25
    2021-05-11 14:33:16.492000+00:00  t_kms.c:2094:
    2021-05-11 14:33:16.502000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !<14>[   96.897477] [IGT] kms_vblank: executing
    2021-05-11 14:33:16.505000+00:00  display->pipes[pipe].enabled)
    2021-05-11 14:33:16.515000+00:00  Pipe F does not exist or not enab<14>=
[   96.909354] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-busy
    2021-05-11 14:33:16.516000+00:00  led =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/609a9615ddd686e1856f54f0
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 14:33:37.981000+00:00  <14>[  103.591974] [IGT] kms_vblank: =
executing
    2021-05-11 14:33:37.995000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[  103.598447] [IGT] kms_vblank: starting su=
btest pipe-A-ts-continuation-suspend
    2021-05-11 14:33:37.996000+00:00  =

    2021-05-11 14:33:38.001000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-05-11 14:33:38.079000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-05-11 14:33:38.111000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-05-11 14:33:38.117000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Tue May 11 14:16:53 2021
    2021-05-11 14:33:38.131000+00:00  <6>[  103.741692] PM: suspend entry (=
deep)
    2021-05-11 14:33:38.136000+00:00  <6>[  103.746075] Filesystems sync: 0=
.000 seconds
    2021-05-11 14:33:38.146000+00:00  <6>[  103.751575] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/609a9615ddd686e1856f5505
        failing since 64 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-11 14:34:24.196000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:34:24.200000+00:00  Pipe E does not exist or not enabled
    2021-05-11 14:34:24.207000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-11 14:34:24.215000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-11 14:34:24.223000+00:00  Pipe F does not exist<6>[  134.453327=
] Console: switching to colour dummy device 80x25
    2021-05-11 14:34:24.226000+00:00   or not enabled
    2021-05-11 14:34:24.230000+00:00  <14>[  134.465765] [IGT] kms_vblank: =
executing
    2021-05-11 14:34:24.244000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)<14>[  134.473563] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-05-11 14:34:24.245000+00:00  =

    2021-05-11 14:34:24.250000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-idle =

    ... (68 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/609a9615ddd686e1856f5508
        failing since 64 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-11 14:34:29.429000+00:00  <6>[  139.663606] Console: switching =
to colour dummy device 80x25
    2021-05-11 14:34:29.433000+00:00  <14>[  139.670266] [IGT] kms_vblank: =
executing
    2021-05-11 14:34:29.440000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)
    2021-05-11 14:34:29.575000+00:00  <14>[  139.808348] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-dpms-suspend
    2021-05-11 14:34:29.581000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-05-11 14:34:30.530000+00:00  (kms_vblank:775) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-11 14:34:30.540000+00:00  (kms_vblank:775) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-11 14:34:30.546000+00:00  (kms_vblank:775) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-11 14:34:30.548000+00:00  Stack trace:
    2021-05-11 14:34:30.552000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/609a9615ddd686e1856f550a
        failing since 64 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-11 14:34:34.670000+00:00  <14>[  144.906731] [IGT] kms_vblank: =
executing
    2021-05-11 14:34:34.676000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc1 aarch64)
    2021-05-11 14:34:34.794000+00:00  <14>[  145.028040] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-modeset
    2021-05-11 14:34:34.800000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-05-11 14:34:35.749000+00:00  (kms_vblank:781) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-11 14:34:35.760000+00:00  (kms_vblank:781) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-11 14:34:35.766000+00:00  (kms_vblank:781) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-11 14:34:35.767000+00:00  Stack trace:
    2021-05-11 14:34:35.774000+00:00    #0 ../lib/igt_cor<14>[  146.006565]=
 [IGT] kms_vblank: exiting, ret=3D98
    2021-05-11 14:34:35.778000+00:00  e.c:1745 __igt_fail_assert() =

    ... (62 line(s) more)  =

 =20
