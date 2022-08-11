Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A4B58FC3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 14:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbiHKM3o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 08:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234073AbiHKM3i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 08:29:38 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629C289805
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 05:29:36 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso5198318pjq.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=/lipDYIZjkUYGcbOZzSC8O8YXtq7neXbFldXBuQfr6M=;
        b=SYrDyfl+s//Qq31xN1rmB9WUeshZAuIu6yHvRqUqOU/w4T6Qkft9lZHp99HhgdU79m
         7RQ9/ABD3sjx5Lc9VzOsvYPHniNALALUrIKHcPtbH9KJMfT8l8muNIpMHhyDwJHoz0Jz
         N/u+uB9T2cnr6B4HtVQOZvkUHo8FLo9O/5v18NGy0/JzXTG9AbZ8JJK0CfyrMJoJTtzc
         UAXAwNT/PE/Gkeu1AQefwQk+rzEmtZVFVmp6FEA5qJsQ/TQij1tRoHaBALc2jyJH7wF2
         jYG244vqaVV+JGHlYRsOw4Mi0Xaj8N/3+ZLHd3ST79Ze1cDqrr9vrCsewPIpTtWyrx7H
         6Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=/lipDYIZjkUYGcbOZzSC8O8YXtq7neXbFldXBuQfr6M=;
        b=Gr/XAT4AvdfM6/qB//ZaUwT/8uwgGlxsitCSjoeJuj5Ln8ZqsSX+oaWb/Sf3orayn8
         aFHcBgDKxpT1UGhclUG2z1P6Fm4jkrZfAVk+d7LCY5wqhMZ/XRZ8NDrY/qjUg9RYhqeT
         9nmztquL83qBq9/FOdAS8uBZbnNAPRNg0nPUWRNd0ZxLlTaXvavPfG1OoSRTRewHsxNN
         gEGbfKJdGymy0J0flPrzKgl+2isWeSI4ywOvOQTFwgLw/up3yDO95Yuno8Y0YS8qR7Oz
         n65rD8z/imIiy0QHZ7PetJPDn4NYpaUVTC9BacVO6PqKU9ubbUifvPuZBxyIM5ktkf5t
         7Nvg==
X-Gm-Message-State: ACgBeo1sXN9WbdeqPjjAfq7V6gmQWvN06dCQIR+FQkQ3dis+aSwSGYVx
        P+p6xLt0U68OKJGrTPlmAxP5WBxADBhe+QT0pBE=
X-Google-Smtp-Source: AA6agR4FIWplqO8QMsn8YkSuUe4KKcP0l9r9kjlBgDMntFBeg6wMiaKkuND9O2dlJm1bYLhFjYYyFg==
X-Received: by 2002:a17:90b:3805:b0:1f4:ebfe:558b with SMTP id mq5-20020a17090b380500b001f4ebfe558bmr8687020pjb.48.1660220975532;
        Thu, 11 Aug 2022 05:29:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709026b4200b0016db51ca7dfsm14803140plt.15.2022.08.11.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 05:29:35 -0700 (PDT)
Message-ID: <62f4f62f.170a0220.9ff23.92eb@mx.google.com>
Date:   Thu, 11 Aug 2022 05:29:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-11-v5.19-rc8
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2022-08-11-v5.19-rc8)
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

renesas/master igt-kms-rockchip: 2 runs, 10 regressions (renesas-devel-2022=
-08-11-v5.19-rc8)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-11-v5.19-rc8/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-11-v5.19-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a245a07d9664fde5a92478ad52da19ba8962926

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98794e2a0d537f3376970918bf955361191720c7
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  a98a66399db9939b16e1cb3b47055f400834affb =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/62f4e71bd36523c578daf057

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220805.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62f4e71bd36523c578daf0e5
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:58.796343  gt_kms.c:2281:
    2022-08-11T11:22:58.802845  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T11:22:58.806969  Pipe D does not exist or not enabled
    2022-08-11T11:22:58.815048  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:58.823022  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T11:22:58.831700  Pipe E does not exist <6>[   55.487345] Con=
sole: switching to colour dummy device 80x25
    2022-08-11T11:22:58.832453  or not enabled
    2022-08-11T11:22:58.842658  Test requirement not met in function igt_re=
quire<14>[   55.498873] [IGT] kms_vblank: executing
    2022-08-11T11:22:58.845269  _pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:58.856744  Test requirement: !(pipe >=3D <14>[   55.51=
1196] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-busy =

    ... (100 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62f4e71bd36523c578daf0e7
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:57.711017  Starting subtest: pipe-A-wait-forked-hang
    2022-08-11T11:22:57.721849  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-08-11T11:22:57.725457  Test requirement: has_ban_period || has_ban=
nable
    2022-08-11T11:22:57.729587  Last errno: 22, Invalid argument
    2022-08-11T11:22:57.734331  [1mSubtest pipe-A-wait-forked-hang: SKIP (0=
.000s)[0m
    2022-08-11T11:22:57.744371  Test requirement not met in <6>[   54.40096=
5] Console: switching to colour dummy device 80x25
    2022-08-11T11:22:57.749836  function igt_require_pipe, file ../lib/igt_=
kms.c:2281:
    2022-08-11T11:22:57.754717  Test req<14>[   54.411239] [IGT] kms_vblank=
: executing
    2022-08-11T11:22:57.768785  uirement: !(pipe >=3D display->n_pipes || !=
display->pipes[pipe].en<14>[   54.423762] [IGT] kms_vblank: starting subtes=
t pipe-A-wait-busy
    2022-08-11T11:22:57.769455  abled) =

    ... (97 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62f4e71bd36523c578daf0e9
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:56.607682  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe]<8>[   53.259451] <LAVA_SIGNAL_TESTCASE TEST_CA=
SE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-08-11T11:22:56.608469  .enabled)
    2022-08-11T11:22:56.612413  Pipe D does not exist or not enabled
    2022-08-11T11:22:56.620066  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:56.627613  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T11:22:56.631301  Pipe E does not exist or not enabled
    2022-08-11T11:22:56.645217  Test requirement not met in function igt_re=
quire_pipe, file ../lib/ig<6>[   53.301445] Console: switching to colour du=
mmy device 80x25
    2022-08-11T11:22:56.646063  t_kms.c:2281:
    2022-08-11T11:22:56.656017  Test requirement: !(pipe >=3D display->n_pi=
pes || !<14>[   53.312482] [IGT] kms_vblank: executing
    2022-08-11T11:22:56.658856  display->pipes[pipe].enabled) =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62f4e71bd36523c578daf0eb
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:55.514353  t in function igt_require_pipe, file ../lib=
/igt_kms.c:2281:
    2022-08-11T11:22:55.521859  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T11:22:55.525720  Pipe C does not exist or not enabled
    2022-08-11T11:22:55.533367  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:55.545960  Test requirement: !(pipe >=3D display->n_pi=
pes || !display-<6>[   52.202003] Console: switching to colour dummy device=
 80x25
    2022-08-11T11:22:55.547605  >pipes[pipe].enabled)
    2022-08-11T11:22:55.551993  Pipe D does not exist or not enabled
    2022-08-11T11:22:55.557210  Tes<14>[   52.213401] [IGT] kms_vblank: exe=
cuting
    2022-08-11T11:22:55.570595  t requirement not met in function igt_requi=
re_pipe, file ../lib/<14>[   52.225752] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle
    2022-08-11T11:22:55.572000  igt_kms.c:2281: =

    ... (109 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62f4e71cd36523c578daf0ed
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:54.426624  ot exist or not enabled
    2022-08-11T11:22:54.434620  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:54.442557  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T11:22:54.452275  Pip<4>[   51.106550] cdn-dp fec00000.dp: Di=
rect firmware load for rockchip/dptx.bin failed with error -2
    2022-08-11T11:22:54.456531  e D does not exist or not enabled
    2022-08-11T11:22:54.464890  Test requirement not met in f<6>[   51.1204=
71] Console: switching to colour dummy device 80x25
    2022-08-11T11:22:54.471368  unction igt_require_pipe, file ../lib/igt_k=
ms.c:2281:
    2022-08-11T11:22:54.476802  Test requ<14>[   51.132477] [IGT] kms_vblan=
k: executing
    2022-08-11T11:22:54.489796  irement: !(pipe >=3D display->n_pipes || !d=
isplay->pipes[pipe].ena<14>[   51.144898] [IGT] kms_vblank: starting subtes=
t pipe-A-query-forked-busy
    2022-08-11T11:22:54.490840  bled) =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62f4e71cd36523c578daf0ef
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:53.356583  (kms_vblank:586) INFO: Beginning pipe-A-<8>=
[   50.010903] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-han=
g RESULT=3Dskip>
    2022-08-11T11:22:53.360565  query-forked on pipe A, connector eDP-1
    2022-08-11T11:22:53.364638  (kms_vblank:586) DEBUG: Spawning 6 threads
    2022-08-11T11:22:53.366175  ****  END  ****
    2022-08-11T11:22:53.371509  [1mSubtest pipe-A-query-forked: FAIL (0.768=
s)[0m
    2022-08-11T11:22:53.379259  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:53.387396  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T11:22:53.393829  Pi<6>[   50.049537] Console: switching to c=
olour dummy device 80x25
    2022-08-11T11:22:53.397953  pe C does not exist or not enabled
    2022-08-11T11:22:53.404332  Test requirement not met in <14>[   50.0612=
72] [IGT] kms_vblank: executing =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62f4e71cd36523c578daf0f1
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:52.241281   (0.000s)[0m
    2022-08-11T11:22:52.249195  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:52.257901  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T11:22:52.260718  Pipe C does not exist or not enabled
    2022-08-11T11:22:52.269311  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T11:22:52.277279  Test requirement: !<6>[   48.933422] Consol=
e: switching to colour dummy device 80x25
    2022-08-11T11:22:52.283041  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)
    2022-08-11T11:22:52.288364  Pip<14>[   48.944998] [IGT] kms_vblank: exe=
cuting
    2022-08-11T11:22:52.292102  e D does not exist or not enabled
    2022-08-11T11:22:52.301782  Test requirement not met in f<14>[   48.957=
224] [IGT] kms_vblank: starting subtest pipe-A-query-forked =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62f4e71cd36523c578daf0f3
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:51.167561  <6>[   47.828247] Console: switching to col=
our dummy device 80x25
    2022-08-11T11:22:51.172233  <14>[   47.834918] [IGT] kms_vblank: execut=
ing
    2022-08-11T11:22:51.186300  IGT-Version: 1.26-ga98a663 (aarch64) (Linux=
: 5.19.0-rc8 aarch64)<14>[   47.841288] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle
    2022-08-11T11:22:51.186983  =

    2022-08-11T11:22:51.189585  Starting subtest: pipe-A-query-idle
    2022-08-11T11:22:51.275847  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-08-11T11:22:51.612766  (kms_vblank:580) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-08-11T11:22:51.620485  (kms_vblank:580) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-11T11:22:51.626035  (kms_vblank:580) CRITICAL: Last errno: 22, =
Invalid argument
    2022-08-11T11:22:51.630177  (kms_vblank:580) CRITICAL: error: -22 !=3D =
0 =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62f4e71cd36523c578daf0f4
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:50.076202  <6>[   46.736849] Console: switching to col=
our dummy device 80x25
    2022-08-11T11:22:50.081585  <14>[   46.743525] [IGT] kms_vblank: execut=
ing
    2022-08-11T11:22:50.095210  IGT-Version: 1.26-ga98a663 (aarch64) (Linux=
: 5.19.0-rc8 aarch64)<14>[   46.749869] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle
    2022-08-11T11:22:50.095312  =

    2022-08-11T11:22:50.100039  Starting subtest: pipe-A-accuracy-idle
    2022-08-11T11:22:50.175650  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-08-11T11:22:50.564010  (kms_vblank:577) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-08-11T11:22:50.570008  (kms_vblank:577) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-11T11:22:50.576423  (kms_vblank:577) CRITICAL: Last errno: 22, =
Invalid argument
    2022-08-11T11:22:50.580962  (kms_vblank:577) CRITICAL: error: -22 !=3D =
0 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2f4e71cd36523c578daf0fd
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T11:22:46.712902  <8>[   43.371252] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-08-11T11:22:46.719676  <8>[   43.382174] <LAVA_SIGNAL_TESTSET STOP>
    2022-08-11T11:22:46.755139  <8>[   43.416436] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-08-11T11:22:46.790751  <6>[   43.451224] Console: switching to col=
our dummy device 80x25
    2022-08-11T11:22:46.796616  <14>[   43.458001] [IGT] kms_setmode: execu=
ting
    2022-08-11T11:22:46.808515  IGT-Version: 1.26-ga98a663 (aarch64) (Linux=
: 5.19.0-rc8 aarch64)<14>[   43.463356] [IGT] kms_setmode: starting subtest=
 basic
    2022-08-11T11:22:46.809137  =

    2022-08-11T11:22:46.810550  Starting subtest: basic
    2022-08-11T11:22:46.815145  Testing: basic 1 connector combinations
    2022-08-11T11:22:46.914979  <14>[   43.574702] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1 =

    ... (78 line(s) more)  =

 =20
