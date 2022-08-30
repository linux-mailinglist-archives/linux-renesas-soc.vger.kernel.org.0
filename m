Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05D35A6106
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 12:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiH3KqK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 06:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiH3KqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 06:46:09 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEA05F119
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:46:05 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 72so10935348pfx.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=zc6T7RqAF74Cva5LQ2mIV3b6PI4wkW5qPrrj6c8j49E=;
        b=VmuwNbpWSHLYDdAHLakXz7RsGchFuUG3nmhc44FE4wvdvS1ywl5CEvCrEVjw3IjXkG
         0eoHbB4x6eCnkS4/qnhx3xZArvGStxKhP/bwO+Cs2KD30qeoJfSzEbao7xbpLHg7/W6P
         hzz99QKuYvEuHzANW+ipPCoGifDVg6kWUlO2hyVmedwoEQbaZnKGpGS1hpyu5UrkdkLn
         3oWpWGEIeOHJqyosZepkHT2ibLljslA8CBDz3j7pEzg/VRm/iPdh9qTbV/gQsu9rfIpG
         sA4pYnCLPBIqw4GEAMmD/ywDCctvd2nXcU8WEDzQB4c5VnlDyWoYnZ/ILzm0fCxeJL+U
         w3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=zc6T7RqAF74Cva5LQ2mIV3b6PI4wkW5qPrrj6c8j49E=;
        b=E8TLveUE/PDDTEk4AAK0HkTeXvRO6erv0M3+veQ2F09kTCqjgkASKVxDyy2zeTEiyQ
         wwBw18aomtxJpOY6czDKtpSMhQbIZoQMV18iwNTxblrjPUqlTGhn4HXRVV7xjA71oXYq
         Zphx5YSGLvSae6Un+KziRUQIFMfXf3UyB/M4fSJcvkKrhoEE58wJhXprwdf0PwLW5UtV
         ELxYrJ6ntuUu1PZNThzC3z4O0e4/0011QVSe0SQvNMf6iLiPYPgKC/wWIftaLVpNb7ts
         J0bO8Yz0uZFELuC0CAa/HGYbGXLCv9Yev338TBxBaZViZYIUCSon3fkMFK0axWGdcgba
         7WBw==
X-Gm-Message-State: ACgBeo12aLPWkHEic5TgY/E91p0q4q+pWYXAhAhvmRYuP+WQefu831Gs
        K+/mgie1qA3rFQKZvEfgj9Kq38BBjiHSEC7XNJ8=
X-Google-Smtp-Source: AA6agR6xu1ePnrEcSEcPr1o5Gp/nAuLHOCyklilW+xPs8xiVqtoeFj85o0wf9w70Hi9+g/5LppbaOw==
X-Received: by 2002:a63:8a4b:0:b0:42b:576a:bc2 with SMTP id y72-20020a638a4b000000b0042b576a0bc2mr18028214pgd.450.1661856364289;
        Tue, 30 Aug 2022 03:46:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902bd8900b0016f035dcd75sm9220581pls.193.2022.08.30.03.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 03:46:03 -0700 (PDT)
Message-ID: <630dea6b.170a0220.c9c0b.0532@mx.google.com>
Date:   Tue, 30 Aug 2022 03:46:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-30-v6.0-rc3
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2022-08-30-v6.0-rc3)
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
-08-30-v6.0-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-30-v6.0-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-30-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      87c1cb103bc6896ad3e45e0cc1417b57696d733a

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  d4bb19e2c49de32a01cef56ad739cc10e9afd237
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1298b5f0e1b3e010657ffba41d2e775fab028e08 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/630dd93b73a58cf966355657

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220826.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/630dd93c73a58cf9663556e5
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:42.828214  n function igt_require_pipe, file ../lib/ig=
t_kms.c:2281:
    2022-08-30T09:30:42.835881  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-30T09:30:42.839555  Pipe D does not exist or not enabled
    2022-08-30T09:30:42.847552  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-30T09:30:42.860169  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pi<6>[   58.181376] Console: switching to colour dummy dev=
ice 80x25
    2022-08-30T09:30:42.862074  pes[pipe].enabled)
    2022-08-30T09:30:42.865314  Pipe E does not exist or not enabled
    2022-08-30T09:30:42.870654  Test r<14>[   58.191755] [IGT] kms_vblank: =
executing
    2022-08-30T09:30:42.884954  equirement not met in function igt_require_=
pipe, file ../lib/igt<14>[   58.203742] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy
    2022-08-30T09:30:42.886469  _kms.c:2281: =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/630dd93c73a58cf9663556e7
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:41.763404  as_ban_period || has_bannable
    2022-08-30T09:30:41.766759  Last errno: 22, Invalid argument
    2022-08-30T09:30:41.772430  [1mSubtest pipe-A-wait-forked-hang: SKIP (0=
.000s)[0m
    2022-08-30T09:30:41.779943  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-30T09:30:41.792058  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<6>[   57.116345] Console: switching to colour dummy device 80x25
    2022-08-30T09:30:41.796882  <14>[   57.123932] [IGT] kms_vblank: execut=
ing
    2022-08-30T09:30:41.799482  splay->pipes[pipe].enabled)
    2022-08-30T09:30:41.810339  Pipe C does not exist or not enable<14>[   =
57.129617] [IGT] kms_vblank: starting subtest pipe-A-wait-busy
    2022-08-30T09:30:41.810841  d
    2022-08-30T09:30:41.818792  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281: =

    ... (95 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/630dd93c73a58cf9663556e9
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:40.670718  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-08-30T09:30:40.673307  Pipe D does not exist or not enabled
    2022-08-30T09:30:40.687983  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:228<6>[   56.012579] Console: switching t=
o colour dummy device 80x25
    2022-08-30T09:30:40.689296  1:
    2022-08-30T09:30:40.699450  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pi<14>[   56.020061] [IGT] kms_vblank: executing
    2022-08-30T09:30:40.701065  pes[pipe].enabled)
    2022-08-30T09:30:40.705097  Pipe E does not exist or not enabled
    2022-08-30T09:30:40.712961  Test r<14>[   56.031952] [IGT] kms_vblank: =
starting subtest pipe-A-wait-forked
    2022-08-30T09:30:40.720307  equirement not met in function igt_require_=
pipe, file ../lib/igt_kms.c:2281:
    2022-08-30T09:30:40.728260  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled) =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/630dd93c73a58cf9663556eb
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:39.583510  blank:614) INFO: Beginning pipe-A-query-for=
ked-busy on pipe A, connector eDP-1
    2022-08-30T09:30:39.587198  (kms_vblank:614) DEBUG: Spawning 6 threads
    2022-08-30T09:30:39.589150  ****  END  ****
    2022-08-30T09:30:39.594604  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.733s)[0m
    2022-08-30T09:30:39.606942  Test requirement not met in function igt_re=
quire_pipe, fil<6>[   54.929381] Console: switching to colour dummy device =
80x25
    2022-08-30T09:30:39.609550  e ../lib/igt_kms.c:2281:
    2022-08-30T09:30:39.618167  Test requirement: !(pipe >=3D display->n<14=
>[   54.938342] [IGT] kms_vblank: executing
    2022-08-30T09:30:39.621715  _pipes || !display->pipes[pipe].enabled)
    2022-08-30T09:30:39.631572  Pipe C does not exist <14>[   54.950142] [I=
GT] kms_vblank: starting subtest pipe-A-wait-idle
    2022-08-30T09:30:39.632315  or not enabled =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/630dd93c73a58cf9663556ed
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:38.497258  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-08-30T09:30:38.501318  Pipe D does not exist or not enabled
    2022-08-30T09:30:38.509562  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-30T09:30:38.517946  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-30T09:30:38.520450  Pipe E does not exist or not enabled
    2022-08-30T09:30:38.530100  Test requirement not<6>[   53.850973] Conso=
le: switching to colour dummy device 80x25
    2022-08-30T09:30:38.535201   met in function igt_require_pipe, file ../=
lib/igt_kms.c:2281:
    2022-08-30T09:30:38.540634  <14>[   53.861714] [IGT] kms_vblank: execut=
ing
    2022-08-30T09:30:38.554394  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[<14>[   53.874014] [IGT] kms_vblank: starting subtes=
t pipe-A-query-forked-busy
    2022-08-30T09:30:38.556537  pipe].enabled) =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/630dd93c73a58cf9663556ef
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:37.393296  (kms_vblank:596) igt_debugfs-DEBUG: Openin<=
8>[   52.711123] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-h=
ang RESULT=3Dskip>
    2022-08-30T09:30:37.397027  g debugfs directory '/sys/kernel/debug/dri/=
0'
    2022-08-30T09:30:37.405042  (kms_vblank:596) INFO: Beginning pipe-A-que=
ry-forked on pipe A, connector eDP-1
    2022-08-30T09:30:37.409466  (kms_vblank:596) DEBUG: Spawning 6 threads
    2022-08-30T09:30:37.411478  ****  END  ****
    2022-08-30T09:30:37.416386  [1mSubtest pipe-A-query-forked: FAIL (0.752=
s)[0m
    2022-08-30T09:30:37.430734  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:22<6>[   52.752303] Console: switching to=
 colour dummy device 80x25
    2022-08-30T09:30:37.431499  81:
    2022-08-30T09:30:37.441175  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->p<14>[   52.762781] [IGT] kms_vblank: executing
    2022-08-30T09:30:37.444160  ipes[pipe].enabled) =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/630dd93c73a58cf9663556f1
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:36.298669  :
    2022-08-30T09:30:36.303111  Test requirement: has_ban_period || has_ban=
nable
    2022-08-30T09:30:36.306848  Last errno: 22, Invalid argument
    2022-08-30T09:30:36.312029  [1mSubtest pipe-A-query-idle-hang: SKIP (0.=
000s)[0m
    2022-08-30T09:30:36.319884  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-30T09:30:36.327896  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-30T09:30:36.336063  Pipe C does no<6>[   51.657186] Console: sw=
itching to colour dummy device 80x25
    2022-08-30T09:30:36.337583  t exist or not enabled
    2022-08-30T09:30:36.346441  Test requirement not met in function igt<14=
>[   51.667773] [IGT] kms_vblank: executing
    2022-08-30T09:30:36.351182  _require_pipe, file ../lib/igt_kms.c:2281: =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/630dd93c73a58cf9663556f3
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:35.272160  <6>[   50.597385] Console: switching to col=
our dummy device 80x25
    2022-08-30T09:30:35.276747  <14>[   50.604110] [IGT] kms_vblank: execut=
ing
    2022-08-30T09:30:35.290026  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc3 aarch64)<14>[   50.609744] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-08-30T09:30:35.290696  =

    2022-08-30T09:30:35.294232  Starting subtest: pipe-A-query-idle
    2022-08-30T09:30:35.361540  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-08-30T09:30:35.683609  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-08-30T09:30:35.690984  (kms_vblank:590) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-30T09:30:35.696328  (kms_vblank:590) CRITICAL: Last errno: 22, =
Invalid argument
    2022-08-30T09:30:35.700679  (kms_vblank:590) CRITICAL: error: -22 !=3D =
0 =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/630dd93c73a58cf9663556f4
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:34.175379  <6>[   49.500715] Console: switching to col=
our dummy device 80x25
    2022-08-30T09:30:34.180097  <14>[   49.507405] [IGT] kms_vblank: execut=
ing
    2022-08-30T09:30:34.194070  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc3 aarch64)<14>[   49.513690] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-08-30T09:30:34.194720  =

    2022-08-30T09:30:34.198141  Starting subtest: pipe-A-accuracy-idle
    2022-08-30T09:30:34.279019  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-08-30T09:30:34.668237  (kms_vblank:587) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-08-30T09:30:34.674705  (kms_vblank:587) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-30T09:30:34.680610  (kms_vblank:587) CRITICAL: Last errno: 22, =
Invalid argument
    2022-08-30T09:30:34.685194  (kms_vblank:587) CRITICAL: error: -22 !=3D =
0 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
30dd93c73a58cf9663556fd
        failing since 73 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-30T09:30:30.825466  <8>[   46.147371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-08-30T09:30:30.830941  <8>[   46.158347] <LAVA_SIGNAL_TESTSET STOP>
    2022-08-30T09:30:30.868197  <8>[   46.194021] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-08-30T09:30:30.905266  <6>[   46.230354] Console: switching to col=
our dummy device 80x25
    2022-08-30T09:30:30.909663  <14>[   46.237030] [IGT] kms_setmode: execu=
ting
    2022-08-30T09:30:30.923015  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc3 aarch64)<14>[   46.242480] [IGT] kms_setmode: starting subtest =
basic
    2022-08-30T09:30:30.925829  Starting subtest: basic
    2022-08-30T09:30:30.929157  Testing: basic 1 connector combinations
    2022-08-30T09:30:31.039648  <14>[   46.364023] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-08-30T09:30:31.043406  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
