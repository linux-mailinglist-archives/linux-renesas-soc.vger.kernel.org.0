Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE24D5F43FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Oct 2022 15:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiJDNNq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 09:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiJDNNq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 09:13:46 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BED36DE5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 06:13:41 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id f21so4797861plb.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Oct 2022 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=vekrWF0HUS8PPd7QCupfWQGz5YyNnuOZzb8uh0E74BU=;
        b=0KdDpFaWKj8POxRzE3A5UEyGxH+Q554o1Yh4NhL557zYFZ9NZceX8PaIllZFF7Qaeq
         pA0St0aui1BWW4isNNnXSGaPbTxZZ4b7N+qHkKUF42CXU8uk0gxk0ZLSATAcD1myxqMf
         1Hnk6Fe5+nPjtRp5f97gCuMgZSeKeJprY04J5IDbywEks5BTLT4x12+witjudxjjs87M
         u/RXN5lRsjn781lS/xkk4Nc5muWB+64+z3agMThLoi9SgGOHEvIT3ax4FSrB8JaClLd9
         OUJA6D5WBmWAg6Quk20Cuy3c++sMU1CK8Tujo5aVkvIgB2O1CCeW9Y2szqg+u8xS1ySf
         OXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=vekrWF0HUS8PPd7QCupfWQGz5YyNnuOZzb8uh0E74BU=;
        b=a/+Bas8IaQbo49RDHMIfdPYXS6fvT5sR8e4FoDPFhjVQtW8lVOn1fM4WJl9BPZWi8k
         Ait0ZcK+4EZ2W0PshbBnrpKPz9dactPj8SETTBM4I2RANaHtVo0IKq5HgS1rplqguqi5
         Zawm6/5IxJuvmd4i+KiSCyyWUjPpdzLeRjoJIrD440D6w7pJ4Z0wKNTrZq1f9sO45VQ6
         M4wdamoRAohNuMMYKGysFOZ55FIER4kIwOaNgt2pqvF4LfkLfHeL2ufjFFGp0ta2AMJh
         1iMHVrYHe/1TMZOtKW/tn3qSN8DOaqh9tBDycd5P2/6cI9E3Q6Qz9lKtnqe0ZGgO6Bc1
         ajgw==
X-Gm-Message-State: ACrzQf2auZgBWBW0aNomP0VdFerVpxZCxgvRDG6Ok3cnUk5DoFfZXE+B
        7aJxIE8tnENhBlftDD+9d19OaNKIvB02mJUvxBs=
X-Google-Smtp-Source: AMsMyM7HtQulht8+4YNYH15zbS0+6TzI2sOD5I2iL3iLTWQ91ehzQu4hMsBkI+Xq+lYS+QzUJ4I7Jw==
X-Received: by 2002:a17:902:8695:b0:17f:71ed:dac1 with SMTP id g21-20020a170902869500b0017f71eddac1mr4068091plo.127.1664889220978;
        Tue, 04 Oct 2022 06:13:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n18-20020a170902e55200b0017ca9f4d22fsm8266990plf.209.2022.10.04.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:13:40 -0700 (PDT)
Message-ID: <633c3184.170a0220.c9d88.d82a@mx.google.com>
Date:   Tue, 04 Oct 2022 06:13:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-04-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-10-04-v6.0)
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
-10-04-v6.0)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-04-v6.0/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-04-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a341ff11c47c3b9175e02fd34c584a0c19c12e0b

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  474894ed17a037a464e5bd845a0765a50f647898
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  dcb1d7a8822e62935f4fe3f2e6a04caaee669369 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/633c30891f341f4bfccab5f6

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220923.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/633c308a1f341f4bfccab683
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:13.821273  nabled)
    2022-10-04T13:07:13.823910  Pipe D does not exist or not enabled
    2022-10-04T13:07:13.831817  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:13.839708  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:13.843130  Pipe E does not exist or not enabled
    2022-10-04T13:07:13.856768  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<6>[   58.348827] Console: switching to colour =
dummy device 80x25
    2022-10-04T13:07:13.858459  kms.c:2302:
    2022-10-04T13:07:13.867432  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   58.360118] [IGT] kms_vblank: executing
    2022-10-04T13:07:13.871061  splay->pipes[pipe].enabled)
    2022-10-04T13:07:13.881498  Pipe F does not exist or not enable<14>[   =
58.372483] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-busy =

    ... (100 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/633c308a1f341f4bfccab685
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:12.736988  Test requirement not met in function igt_re=
quire_pip<8>[   57.227605] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait=
-forked-hang RESULT=3Dskip>
    2022-10-04T13:07:12.739358  e, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:12.747123  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:12.751722  Pipe E does not exist or not enabled
    2022-10-04T13:07:12.759045  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:12.767696  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:12.774361  Pipe F<6>[   57.267496] Console: switching =
to colour dummy device 80x25
    2022-10-04T13:07:12.777917   does not exist or not enabled
    2022-10-04T13:07:12.785846  IGT-Version: 1.26-gdcb1d7a (aarc<14>[   57.=
277114] [IGT] kms_vblank: executing
    2022-10-04T13:07:12.788546  h64) (Linux: 6.0.0 aarch64) =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/633c308a1f341f4bfccab687
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:11.678910  quirement: !(pipe >=3D display->n_pipes || =
!display->pipes[pipe].enabled)
    2022-10-04T13:07:11.682668  Pipe D does not exist or not enabled
    2022-10-04T13:07:11.691328  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:11.698435  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:11.702153  Pipe E does not exist or not enabled
    2022-10-04T13:07:11.709963  Test re<6>[   56.201465] Console: switching=
 to colour dummy device 80x25
    2022-10-04T13:07:11.720482  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   56.212914] [IGT] kms_vblank: executing
    2022-10-04T13:07:11.721894  kms.c:2302:
    2022-10-04T13:07:11.733883  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   56.224715] [IGT] kms_vblank: starting subtest pipe-A-wait=
-forked
    2022-10-04T13:07:11.737479  splay->pipes[pipe].enabled) =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/633c308a1f341f4bfccab689
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:10.594034  ry-forked-busy: FAIL (0.703s)[0m
    2022-10-04T13:07:10.602525  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:10.610198  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:10.613494  Pipe C does not exist or not enabled
    2022-10-04T13:07:10.627729  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:<6>[   55.121479] Console: switching=
 to colour dummy device 80x25
    2022-10-04T13:07:10.628048  =

    2022-10-04T13:07:10.639053  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes<14>[   55.131030] [IGT] kms_vblank: executing
    2022-10-04T13:07:10.640756  [pipe].enabled)
    2022-10-04T13:07:10.644155  Pipe D does not exist or not enabled
    2022-10-04T13:07:10.652807  Test requ<14>[   55.143265] [IGT] kms_vblan=
k: starting subtest pipe-A-wait-idle =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/633c308a1f341f4bfccab68b
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:09.520838  ist or not enabled
    2022-10-04T13:07:09.528814  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:09.537432  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:09.540121  Pipe D does not exist or not enabled
    2022-10-04T13:07:09.548395  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:09.556607  Test requireme<6>[   54.050555] Console: sw=
itching to colour dummy device 80x25
    2022-10-04T13:07:09.567725  nt: !(pipe >=3D display->n_pipes || !displa=
y->pipes[pipe].enabled)<14>[   54.059549] [IGT] kms_vblank: executing
    2022-10-04T13:07:09.567998  =

    2022-10-04T13:07:09.571584  Pipe E does not exist or not enabled
    2022-10-04T13:07:09.581827  Test requirement not met<14>[   54.071917] =
[IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/633c308a1f341f4bfccab68d
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:08.464965  irement not met in function igt_require_pip=
e, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:08.473192  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:08.476259  Pipe C does not exist or not enabled
    2022-10-04T13:07:08.484364  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:08.494558  Test requirement: !(pipe >=3D display->n_pi=
pe<6>[   52.987688] Console: switching to colour dummy device 80x25
    2022-10-04T13:07:08.499330  s || !display->pipes[pipe].enabled)
    2022-10-04T13:07:08.506271  Pipe D does not exist or no<14>[   52.99812=
0] [IGT] kms_vblank: executing
    2022-10-04T13:07:08.507031  t enabled
    2022-10-04T13:07:08.519219  Test requirement not met in function igt_re=
quire_pipe<14>[   53.009970] [IGT] kms_vblank: starting subtest pipe-A-quer=
y-busy
    2022-10-04T13:07:08.522228  , file ../lib/igt_kms.c:2302: =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/633c308a1f341f4bfccab68f
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:07.325484  00s)[0m
    2022-10-04T13:07:07.332442  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:07.340711  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-04T13:07:07.344046  Pipe C does not exist or not enabled
    2022-10-04T13:07:07.352241  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-04T13:07:07.361564  Test requirement: !(pipe<6>[   51.853288] C=
onsole: switching to colour dummy device 80x25
    2022-10-04T13:07:07.367307   >=3D display->n_pipes || !display->pipes[p=
ipe].enabled)
    2022-10-04T13:07:07.371839  Pipe D d<14>[   51.864410] [IGT] kms_vblank=
: executing
    2022-10-04T13:07:07.375037  oes not exist or not enabled
    2022-10-04T13:07:07.385658  Test requirement not met in functi<14>[   5=
1.876696] [IGT] kms_vblank: starting subtest pipe-A-query-forked =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/633c308a1f341f4bfccab691
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:06.209890  <8>[   50.703804] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-10-04T13:07:06.243204  <6>[   50.739262] Console: switching to col=
our dummy device 80x25
    2022-10-04T13:07:06.248238  <14>[   50.746294] [IGT] kms_vblank: execut=
ing
    2022-10-04T13:07:06.255164  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-04T13:07:06.261481  <14>[   50.752583] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-10-04T13:07:06.265870  Starting subtest: pipe-A-query-idle
    2022-10-04T13:07:06.341204  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-10-04T13:07:06.696450  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-10-04T13:07:06.704521  (kms_vblank:592) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-04T13:07:06.710036  (kms_vblank:592) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/633c308a1f341f4bfccab692
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:05.150713  <6>[   49.646901] Console: switching to col=
our dummy device 80x25
    2022-10-04T13:07:05.156721  <14>[   49.653573] [IGT] kms_vblank: execut=
ing
    2022-10-04T13:07:05.161751  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-04T13:07:05.169577  <14>[   49.660027] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-10-04T13:07:05.173706  Starting subtest: pipe-A-accuracy-idle
    2022-10-04T13:07:05.259565  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-10-04T13:07:05.647639  (kms_vblank:589) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-10-04T13:07:05.655614  (kms_vblank:589) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-04T13:07:05.661680  (kms_vblank:589) CRITICAL: Last errno: 22, =
Invalid argument
    2022-10-04T13:07:05.666221  (kms_vblank:589) CRITICAL: error: -22 !=3D =
0 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
33c308a1f341f4bfccab69b
        failing since 108 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-04T13:07:01.853459  <8>[   46.351310] <LAVA_SIGNAL_TESTSET STOP>
    2022-10-04T13:07:01.890090  <8>[   46.387283] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-10-04T13:07:01.926812  <6>[   46.422909] Console: switching to col=
our dummy device 80x25
    2022-10-04T13:07:01.932521  <14>[   46.429587] [IGT] kms_setmode: execu=
ting
    2022-10-04T13:07:01.937682  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-04T13:07:01.943672  <14>[   46.434922] [IGT] kms_setmode: start=
ing subtest basic
    2022-10-04T13:07:01.947341  Starting subtest: basic
    2022-10-04T13:07:01.950875  Testing: basic 1 connector combinations
    2022-10-04T13:07:02.054368  <14>[   46.549083] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-10-04T13:07:02.058755  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
