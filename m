Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFCF35DFE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Apr 2021 15:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241309AbhDMNPE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Apr 2021 09:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240304AbhDMNPD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:15:03 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B6EC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Apr 2021 06:14:44 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so1312863pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Apr 2021 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=l1JZdo9ZCzXZLNy7QfYu/1FOShr4mzI8qU/hAsKhGvg=;
        b=EMjyMUicn5GPu/PGLNph2zStKg6SzWJkoc748RD/rzioCFYVnevve1MobuzbCqi42E
         hde+4IL+t1ZJa+eM/j5VPBrdC9/FFW/QBQEgxj2diJ+7zifIp6YEza/vV474aDaJnkSa
         RBlc/YXF4fnzNmhYNu6Fy5qSCdTjqmVsSYZDwJGIzB4Ov3f4Bv/o+y1f+re7hZMQjtK/
         dHcLv85LuRE0sqRwGpgL2wMo8/1c+WHW9Wj3SfDzlbigGML5NQ9U3qyhkvjTKzPC5Ebk
         5DAhXyHZIIHfEfUJy/MJunUGdS3LgZ4asCZz0+I0j2IBbsu5+Cn5hjXobOEfQt8lAven
         d38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=l1JZdo9ZCzXZLNy7QfYu/1FOShr4mzI8qU/hAsKhGvg=;
        b=hdIIAqj5eqgzOA/rymKWfLlIZcKe5p8JuL4gBU8aa4N9xksiknCxVVom+6h28GueZz
         bFvRAOOklo8AVBZ3fM80EmtCnpm42KQYOielj8CjhLtDl7sTh1UbN0TVhdnbYqsHQjkQ
         X9bSAulpWWtfbvknSFuzQXDVQ6X48YC+2YslfQjpo2qTIP9Emm0GEGsE7Yi0NC5vGXD9
         uygqh+XPBSohSxNBe89JFObQTdA7P9AnZ1k54MA5HLpVPEmC2qAJoVeTt0iyiJetLGgc
         cA2rTFXyBe8X5ZxvToaMGL1yAVWRqSki7nB6D1eqRDP7bBhB+bTO4EsgO6PPwouRGpN+
         Sqvg==
X-Gm-Message-State: AOAM530MEmh8oGCshZtgsIibxRJ6dTm+kYdKBf0MdLPVcE8zIcu+vQdQ
        6/pNo4cTBH08Y5hoRnGto1QzHFRxaQ99lm5p
X-Google-Smtp-Source: ABdhPJwD30je2/xEwn9FxundVe+Xt3RWaJxlGcM8SZjA5fbCGB6G714FemNu2fobv0B6DhOfX2Zf4w==
X-Received: by 2002:a17:902:848a:b029:e9:914b:7421 with SMTP id c10-20020a170902848ab02900e9914b7421mr27000601plo.78.1618319683404;
        Tue, 13 Apr 2021 06:14:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 3sm4419605pff.132.2021.04.13.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 06:14:43 -0700 (PDT)
Message-ID: <60759943.1c69fb81.6ee01.b19b@mx.google.com>
Date:   Tue, 13 Apr 2021 06:14:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-12-v5.12-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 13 regressions (renesas-devel-2021-04-12-v5.12-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 13 regressions (renesas-devel-2021=
-04-12-v5.12-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 13       =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-12-v5.12-rc7/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-12-v5.12-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9e681b617b0ea7601b4b2764a26e6fbfe7dd13ed

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


  Details:     https://kernelci.org/test/plan/id/6075885f3556642e2bdac6db

  Results:     67 PASS, 29 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-12-v5.12-rc7/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210412.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6075885f3556642e2bdac737
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:46.293000+00:00  Pipe F does not exist or not enabled
    2021-04-13 12:00:46.317000+00:00  <6>[   88.211028] Console: switching =
to colour dummy device 80x25
    2021-04-13 12:00:46.322000+00:00  <14>[   88.218422] [IGT] kms_vblank: =
executing
    2021-04-13 12:00:46.336000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc7 aarch64)<14>[   88.224762] [IGT] kms_vblank: starting su=
btest pipe-A-accuracy-idle
    2021-04-13 12:00:46.336000+00:00  =

    2021-04-13 12:00:46.340000+00:00  Starting subtest: pipe-A-accuracy-idle
    2021-04-13 12:00:46.418000+00:00  Beginning pipe-A-accuracy-idle on pip=
e A, connector eDP-1
    2021-04-13 12:00:46.790000+00:00  (kms_vblank:568) CRITICAL: Test asser=
tion failure function accuracy, file ../tests/kms_vblank.c:248:
    2021-04-13 12:00:46.797000+00:00  (kms_vblank:568) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0
    2021-04-13 12:00:46.802000+00:00  (kms_vblank:568) CRITICAL: Last errno=
: 22, Invalid argument =

    ... (40 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6075885f3556642e2bdac738
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:47.073000+00:00  (kms_vblank:568) CRITICAL: Test asser=
tion failure function accuracy, file ../tests/kms_vblank.c:248:
    2021-04-13 12:00:47.080000+00:00  (kms_vblank:568) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0
    2021-04-13 12:00:47.086000+00:00  (kms_vblank:568) CRITICAL: Last errno=
: 22, Invalid argument
    2021-04-13 12:00:47.090000+00:00  (kms_vblank:568) CRITICAL: error: -22=
 !=3D 0
    2021-04-13 12:00:47.101000+00:00  (kms_vblank:568) igt_core-INFO: <6>[ =
  88.990813] Console: switching to colour dummy device 80x25
    2021-04-13 12:00:47.102000+00:00  Stack trace:
    2021-04-13 12:00:47.110000+00:00  (kms_vblank:568) igt_core-INFO:   #0 =
../lib/igt_co<14>[   89.001381] [IGT] kms_vblank: executing
    2021-04-13 12:00:47.114000+00:00  re.c:1726 __igt_fail_assert()
    2021-04-13 12:00:47.125000+00:00  (kms_vblank:568) igt_core-INFO:  <14>=
[   89.013384] [IGT] kms_vblank: starting subtest pipe-A-query-idle
    2021-04-13 12:00:47.127000+00:00   #1 [<unknown>+0xc1ed1eb4] =

    ... (94 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6075885f3556642e2bdac73a
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:48.250000+00:00  e].enabled)
    2021-04-13 12:00:48.253000+00:00  Pipe D does not exist or not enabled
    2021-04-13 12:00:48.261000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:48.269000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:48.273000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:00:48.286000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   90.176518] Console: switching to colou=
r dummy device 80x25
    2021-04-13 12:00:48.288000+00:00  igt_kms.c:1910:
    2021-04-13 12:00:48.297000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   90.187478] [IGT] kms_vblank: executing
    2021-04-13 12:00:48.300000+00:00   !display->pipes[pipe].enabled)
    2021-04-13 12:00:48.311000+00:00  Pipe F does not exist or not en<14>[ =
  90.199447] [IGT] kms_vblank: starting subtest pipe-A-query-forked =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6075885f3556642e2bdac73c
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:49.491000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:49.494000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:00:49.503000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:49.511000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:49.518000+00:00  Pipe F do<6>[   91.408775] Console: s=
witching to colour dummy device 80x25
    2021-04-13 12:00:49.521000+00:00  es not exist or not enabled
    2021-04-13 12:00:49.525000+00:00  <14>[   91.419732] [IGT] kms_vblank: =
executing
    2021-04-13 12:00:49.539000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc7 aarch64)<14>[   91.428429] [IGT] kms_vblank: starting su=
btest pipe-A-query-busy
    2021-04-13 12:00:49.540000+00:00  =

    2021-04-13 12:00:49.544000+00:00  Starting subtest: pipe-A-query-busy =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6075885f3556642e2bdac73e
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:50.685000+00:00  Pipe D does not exist or not enabled
    2021-04-13 12:00:50.694000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:50.702000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:50.705000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:00:50.718000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   92.609424] Console: switching to colou=
r dummy device 80x25
    2021-04-13 12:00:50.721000+00:00  igt_kms.c:1910:
    2021-04-13 12:00:50.729000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   92.620099] [IGT] kms_vblank: executing
    2021-04-13 12:00:50.732000+00:00   !display->pipes[pipe].enabled)
    2021-04-13 12:00:50.743000+00:00  Pipe F does not exist or not en<14>[ =
  92.632033] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy
    2021-04-13 12:00:50.744000+00:00  abled =

    ... (114 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6075885f3556642e2bdac740
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:51.905000+00:00  Pipe D does not exist or not enabled
    2021-04-13 12:00:51.914000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:51.921000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:51.926000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:00:51.937000+00:00  Test requirement not met in function =
igt_require_pipe, <6>[   93.825468] Console: switching to colour dummy devi=
ce 80x25
    2021-04-13 12:00:51.939000+00:00  file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:51.948000+00:00  Test requirement: !(pipe >=3D display=
<14>[   93.838457] [IGT] kms_vblank: executing
    2021-04-13 12:00:51.952000+00:00  ->n_pipes || !display->pipes[pipe].en=
abled)
    2021-04-13 12:00:51.961000+00:00  Pipe F does not exi<14>[   93.850538]=
 [IGT] kms_vblank: starting subtest pipe-A-wait-idle
    2021-04-13 12:00:51.963000+00:00  st or not enabled =

    ... (48 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6075885f3556642e2bdac742
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:52.878000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:52.881000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:00:52.889000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:52.903000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pi<6>[   94.793033] Console: switching to colo=
ur dummy device 80x25
    2021-04-13 12:00:52.904000+00:00  pe].enabled)
    2021-04-13 12:00:52.908000+00:00  Pipe F does not exist or not enabled
    2021-04-13 12:00:52.914000+00:00  IGT-Version:<14>[   94.804334] [IGT] =
kms_vblank: executing
    2021-04-13 12:00:52.919000+00:00   1.25-gd3b7f74 (aarch64) (Linux: 5.12=
.0-rc7 aarch64)
    2021-04-13 12:00:52.928000+00:00  Starting s<14>[   94.816232] [IGT] km=
s_vblank: starting subtest pipe-A-wait-forked
    2021-04-13 12:00:52.931000+00:00  ubtest: pipe-A-wait-idle-hang =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6075885f3556642e2bdac744
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:54.147000+00:00  e].enabled)
    2021-04-13 12:00:54.150000+00:00  Pipe D does not exist or not enabled
    2021-04-13 12:00:54.158000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:54.166000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:54.170000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:00:54.183000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   96.073394] Console: switching to colou=
r dummy device 80x25
    2021-04-13 12:00:54.184000+00:00  igt_kms.c:1910:
    2021-04-13 12:00:54.194000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   96.084281] [IGT] kms_vblank: executing
    2021-04-13 12:00:54.198000+00:00   !display->pipes[pipe].enabled)
    2021-04-13 12:00:54.208000+00:00  Pipe F does not exist or not en<14>[ =
  96.097011] [IGT] kms_vblank: starting subtest pipe-A-wait-busy =

    ... (49 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6075885f3556642e2bdac746
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:00:55.127000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:00:55.131000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:00:55.140000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:00:55.152000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pi<6>[   97.042852] Console: switching to colo=
ur dummy device 80x25
    2021-04-13 12:00:55.154000+00:00  pe].enabled)
    2021-04-13 12:00:55.157000+00:00  Pipe F does not exist or not enabled
    2021-04-13 12:00:55.163000+00:00  IGT-Version:<14>[   97.054043] [IGT] =
kms_vblank: executing
    2021-04-13 12:00:55.168000+00:00   1.25-gd3b7f74 (aarch64) (Linux: 5.12=
.0-rc7 aarch64)
    2021-04-13 12:00:55.177000+00:00  Starting s<14>[   97.065888] [IGT] km=
s_vblank: starting subtest pipe-A-wait-forked-busy
    2021-04-13 12:00:55.181000+00:00  ubtest: pipe-A-wait-busy-hang =

    ... (123 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6075885f3556642e2bdac74c
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6)

    2021-04-13 12:01:17.497000+00:00  <14>[  103.875400] [IGT] kms_vblank: =
executing
    2021-04-13 12:01:17.512000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc7 aarch64)<14>[  103.881753] [IGT] kms_vblank: starting su=
btest pipe-A-ts-continuation-suspend
    2021-04-13 12:01:17.512000+00:00  =

    2021-04-13 12:01:17.517000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-04-13 12:01:17.600000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-04-13 12:01:17.630000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-04-13 12:01:17.636000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Tue Apr 13 12:00:51 2021
    2021-04-13 12:01:17.650000+00:00  <6>[  104.028354] PM: suspend entry (=
deep)
    2021-04-13 12:01:17.655000+00:00  <6>[  104.032770] Filesystems sync: 0=
.000 seconds
    2021-04-13 12:01:17.665000+00:00  <6>[  104.038292] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (127 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/6075885f3556642e2bdac761
        failing since 35 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-13 12:02:02.761000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:02:02.765000+00:00  Pipe E does not exist or not enabled
    2021-04-13 12:02:02.774000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-04-13 12:02:02.781000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-04-13 12:02:02.789000+00:00  Pipe F does not exist<6>[  133.890891=
] Console: switching to colour dummy device 80x25
    2021-04-13 12:02:02.791000+00:00   or not enabled
    2021-04-13 12:02:02.796000+00:00  <14>[  133.899442] [IGT] kms_vblank: =
executing
    2021-04-13 12:02:02.810000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc7 aarch64)<14>[  133.907403] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-04-13 12:02:02.810000+00:00  =

    2021-04-13 12:02:02.815000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-idle =

    ... (68 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/6075885f3556642e2bdac764
        failing since 35 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-13 12:02:08.010000+00:00  <6>[  139.113020] Console: switching =
to colour dummy device 80x25
    2021-04-13 12:02:08.015000+00:00  <14>[  139.119838] [IGT] kms_vblank: =
executing
    2021-04-13 12:02:08.021000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc7 aarch64)
    2021-04-13 12:02:08.159000+00:00  <14>[  139.259060] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-dpms-suspend
    2021-04-13 12:02:08.163000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-04-13 12:02:09.112000+00:00  (kms_vblank:780) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-04-13 12:02:09.122000+00:00  (kms_vblank:780) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-04-13 12:02:09.128000+00:00  (kms_vblank:780) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-04-13 12:02:09.130000+00:00  Stack trace:
    2021-04-13 12:02:09.135000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/6075885f3556642e2bdac766
        failing since 35 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-04-13 12:02:13.170000+00:00  <14>[  144.275394] [IGT] kms_vblank: =
executing
    2021-04-13 12:02:13.176000+00:00  IGT-Version: 1.25-gd3b7f74 (aarch64) =
(Linux: 5.12.0-rc7 aarch64)
    2021-04-13 12:02:13.295000+00:00  <14>[  144.396392] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-modeset
    2021-04-13 12:02:13.300000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-04-13 12:02:14.232000+00:00  (kms_vblank:786) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-04-13 12:02:14.242000+00:00  (kms_vblank:786) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-04-13 12:02:14.248000+00:00  (kms_vblank:786) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-04-13 12:02:14.250000+00:00  Stack trace:
    2021-04-13 12:02:14.255000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-04-13 12:02:14.257000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =

 =20
