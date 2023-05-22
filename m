Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94F670BE74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 14:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbjEVMhj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 08:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbjEVMhf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 08:37:35 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7837AAC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:13 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d577071a6so1970602b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684759030; x=1687351030;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8n2pY+BHV1Yr0IozDHqG3zyHlyU7L9sVgu4C9nNVbQw=;
        b=iaZd/hdfC01TzCf381y9MqgX5MqOIdYQO2XakuS6DKdqMO59OWz4+6n/hpld7m9VwT
         TFP5oOk08JSOuag/6FPZrAq/jDCml6qwgoowkrxStgl+LkbeH4Kv4iygkMFc0IPhROOY
         eF267NzRafV5zLoJax+HwUQW0qzN7I/GXU12dmALXPTS1+ca7FtzfgrcZyOHup95mi+5
         BfKoXBEhc78yieqA9qekBsNiIG4YMbUQ/7GvXBgoB9d6LocYE0OuI+0JZcvV8bVLOD4i
         ciTBnlnU3YplpMrEZvA9bYAG5SmD6FlSGshcBGdOHIWLHg6KUaTfznRMPkzxzNNGqSLD
         jZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759030; x=1687351030;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n2pY+BHV1Yr0IozDHqG3zyHlyU7L9sVgu4C9nNVbQw=;
        b=P4Mj0jI6XASb/WjAEd2Aq9JDV5wEyxF0hPO0xa9vbpfcVgeu4ec1xsvw6kM/0Y0GiY
         gyo9a6zebyaxNMkMjThgbLovVDKbcWfk9+54r0NNQKvCsvtMWkRM6VP/XExfAGRuztc6
         1J24PvuqfZI0rHmJl6cFUKmrIXB/kZmw0d2IHFb6K8gaKI/zVzw/y5QDnR8xFlIbDYVO
         iSG2H+V7T8jtclWswBdb+6Pi81d5mgQzwEl3ptkWzeBvHSTOFFaYJ8Ljs+xBuf9trPXh
         FHyjT6tvx5VufjWouDrPM+IMBVipK3fT6A15ai9Agivf9ctcOalW+7KAflJw5H9Jkliv
         QgPQ==
X-Gm-Message-State: AC+VfDwLTuV7Un3lr4GznttSDSmHC0d8p4dS/20186XMtSJsZyYXiJKD
        ScHsKf9jEVT/YcB7kSol/9jSHviO7Dqj9xc4v1nm3Q==
X-Google-Smtp-Source: ACHHUZ5uDOiI/NYe/f3/ASe6NxLRuegy1+XmgVLjgr9sWd0S5I+bJRtlqDylcKZ3Q+LrynqfP9lVHw==
X-Received: by 2002:a05:6a00:248a:b0:64e:6862:8553 with SMTP id c10-20020a056a00248a00b0064e68628553mr1444131pfv.32.1684759029859;
        Mon, 22 May 2023 05:37:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm4096461pfn.68.2023.05.22.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:37:08 -0700 (PDT)
Message-ID: <646b61f4.a70a0220.f3f89.660c@mx.google.com>
Date:   Mon, 22 May 2023 05:37:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-22-v6.4-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-05-22-v6.4-rc3)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-05-22-v6.4-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-22-v6.4-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-22-v6.4-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      44b93b667d845927e0168aa763b3a14e93b21a66

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  a482779488f11c432d7ddcb1980691ab1603f356 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/646b5773f686a21be52e85ec

  Results:     66 PASS, 23 FAIL, 198 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230512.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/646b5773f686a21be52e86ab
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:48.413109  nabled)

    2023-05-22T11:49:48.416241  Pipe D does not exist or not enabled

    2023-05-22T11:49:48.424736  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:48.432441  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-22T11:49:48.435803  Pipe E does not exist or not enabled

    2023-05-22T11:49:48.443315  Test re<6>[   55.660671] Console: switching=
 to colour dummy device 80x25

    2023-05-22T11:49:48.454261  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   55.672277] [IGT] kms_vblank: executing

    2023-05-22T11:49:48.455877  kms.c:2429:

    2023-05-22T11:49:48.468115  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   55.684019] [IGT] kms_vblank: starting subtest pipe-A-wait=
-forked-busy

    2023-05-22T11:49:48.471025  splay->pipes[pipe].enabled)
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/646b5773f686a21be52e86ad
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:47.229113  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pi<8>[   54.444330] <LAVA_SIGNAL_TESTCASE TEST_CASE_=
ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>

    2023-05-22T11:49:47.229955  pe].enabled)

    2023-05-22T11:49:47.234131  Pipe F does not exist or not enabled

    2023-05-22T11:49:47.241926  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:47.249928  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-22T11:49:47.253605  Pipe G does not exist or not enabled

    2023-05-22T11:49:47.261425  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:47.269238  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-22T11:49:47.279180  Pipe H does not exist or not e<6>[   54.495=
252] Console: switching to colour dummy device 80x25

    2023-05-22T11:49:47.280105  nabled
 =

    ... (122 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/646b5773f686a21be52e86af
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:46.058660  Test<8>[   53.277346] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>

    2023-05-22T11:49:46.066188   requirement: !(pipe >=3D display->n_pipes =
|| !display->pipes[pipe].enabled)

    2023-05-22T11:49:46.069311  Pipe D does not exist or not enabled

    2023-05-22T11:49:46.078460  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:46.086267  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-22T11:49:46.090082  Pipe E does not exist or not enabled

    2023-05-22T11:49:46.102969  Test requirement not met in function igt_re=
quire_pipe, file ../lib/i<6>[   53.323690] Console: switching to colour dum=
my device 80x25

    2023-05-22T11:49:46.104624  gt_kms.c:2429:

    2023-05-22T11:49:46.113348  Test requirement: !(pipe >=3D display->n_pi=
pes || <14>[   53.331328] [IGT] kms_vblank: executing

    2023-05-22T11:49:46.117004  !display->pipes[pipe].enabled)
 =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/646b5773f686a21be52e86b1
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:44.856579  =


    2023-05-22T11:49:44.864640  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:44.871707  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-22T11:49:44.875683  Pipe C does not exist or not enabled

    2023-05-22T11:49:44.883659  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:44.891319  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-22T11:49:44.899295  Pipe D does not e<6>[   52.119461] Console:=
 switching to colour dummy device 80x25

    2023-05-22T11:49:44.901436  xist or not enabled

    2023-05-22T11:49:44.910305  Test requirement not met in function igt_re=
<14>[   52.128523] [IGT] kms_vblank: executing

    2023-05-22T11:49:44.914751  quire_pipe, file ../lib/igt_kms.c:2429:
 =

    ... (132 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/646b5773f686a21be52e86b3
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:43.671320  not met in function igt_require_pipe, file =
../lib/igt_kms.c:2429:

    2023-05-22T11:49:43.678930  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-22T11:49:43.682896  Pipe C does not exist or not enabled

    2023-05-22T11:49:43.690894  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:43.701895  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<6>[   50.922229] Console: switching to colour dummy device 80x25

    2023-05-22T11:49:43.705330  splay->pipes[pipe].enabled)

    2023-05-22T11:49:43.713011  Pipe D does not exist or not enable<14>[   =
50.930762] [IGT] kms_vblank: executing

    2023-05-22T11:49:43.713093  d

    2023-05-22T11:49:43.727484  Test requirement not met in function igt_re=
quire_pipe, file .<14>[   50.943173] [IGT] kms_vblank: starting subtest pip=
e-A-query-forked-busy

    2023-05-22T11:49:43.729077  ./lib/igt_kms.c:2429:
 =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/646b5773f686a21be52e86b5
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:42.511893  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)

    2023-05-22T11:49:42.515559  Pipe C does not exist or not enabled

    2023-05-22T11:49:42.523669  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:42.537593  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].ena<6>[   49.753211] Console: switching to col=
our dummy device 80x25

    2023-05-22T11:49:42.538178  bled)

    2023-05-22T11:49:42.541889  Pipe D does not exist or not enabled

    2023-05-22T11:49:42.548304  Test requirement no<14>[   49.766005] [IGT]=
 kms_vblank: executing

    2023-05-22T11:49:42.554943  t met in function igt_require_pipe, file ..=
/lib/igt_kms.c:2429:
    2023-05-22T11:49:42.561124  <14>[   49.778029] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-busy

    2023-05-22T11:49:42.561762  =

 =

    ... (122 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/646b5773f686a21be52e86b7
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:41.281665  ile ../lib/i915/gem_context.c:324:

    2023-05-22T11:49:41.286367  Test requirement: has_ban_period || has_ban=
nable

    2023-05-22T11:49:41.290253  Last errno: 22, Invalid argument

    2023-05-22T11:49:41.295570  =1B[1mSubtest pipe-A-query-idle-hang: SKIP =
(0.000s)=1B[0m

    2023-05-22T11:49:41.303526  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-05-22T11:49:41.315743  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pip<6>[   48.535437] Console: switching to colour dummy de=
vice 80x25

    2023-05-22T11:49:41.317923  es[pipe].enabled)

    2023-05-22T11:49:41.321936  Pipe C does not exist or not enabled

    2023-05-22T11:49:41.327374  Test re<14>[   48.545308] [IGT] kms_vblank:=
 executing

    2023-05-22T11:49:41.341063  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   48.557596] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked
 =

    ... (130 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/646b5773f686a21be52e86b9
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:40.096702  <6>[   47.318644] Console: switching to col=
our dummy device 80x25

    2023-05-22T11:49:40.101198  <14>[   47.325269] [IGT] kms_vblank: execut=
ing

    2023-05-22T11:49:40.114929  IGT-Version: 1.27.1-ga482779 (aarch64) (Lin=
ux: 6.4.0-rc3 aarch64<14>[   47.331170] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-05-22T11:49:40.115450  )

    2023-05-22T11:49:40.118932  Starting subtest: pipe-A-query-idle

    2023-05-22T11:49:40.193210  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-05-22T11:49:40.597618  (kms_vblank:560) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-05-22T11:49:40.605073  (kms_vblank:560) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-05-22T11:49:40.611235  (kms_vblank:560) CRITICAL: Last errno: 22, =
Invalid argument

    2023-05-22T11:49:40.615957  (kms_vblank:560) CRITICAL: error: -22 !=3D 0
 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/646b5773f686a21be52e86ba
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:38.819388  <8>[   46.038518] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>

    2023-05-22T11:49:38.842507  <6>[   46.064233] Console: switching to col=
our dummy device 80x25

    2023-05-22T11:49:38.847890  <14>[   46.070906] [IGT] kms_vblank: execut=
ing

    2023-05-22T11:49:38.861079  IGT-Version: 1.27.1-ga482779 (aarch64) (Lin=
ux: 6.4.0-rc3 aarch64<14>[   46.076660] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-05-22T11:49:38.861556  )

    2023-05-22T11:49:38.865465  Starting subtest: pipe-A-accuracy-idle

    2023-05-22T11:49:38.943221  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-05-22T11:49:39.449496  (kms_vblank:556) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-05-22T11:49:39.456204  (kms_vblank:556) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-05-22T11:49:39.462379  (kms_vblank:556) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (91 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
46b5773f686a21be52e86c3
        failing since 338 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-22T11:49:35.261746  <8>[   42.485202] <LAVA_SIGNAL_TESTSET STOP>

    2023-05-22T11:49:35.308348  <8>[   42.530019] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-05-22T11:49:35.338352  <6>[   42.560044] Console: switching to col=
our dummy device 80x25

    2023-05-22T11:49:35.343575  <14>[   42.566823] [IGT] kms_setmode: execu=
ting

    2023-05-22T11:49:35.355722  IGT-Version: 1.27.1-ga482779 (aarch64) (Lin=
ux: 6.4.0-rc3 aarch64<14>[   42.571995] [IGT] kms_setmode: starting subtest=
 basic

    2023-05-22T11:49:35.356199  )

    2023-05-22T11:49:35.358257  Starting subtest: basic

    2023-05-22T11:49:35.363269  Testing: basic 1 connector combinations

    2023-05-22T11:49:35.465034  <14>[   42.685919] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-05-22T11:49:35.468989  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
