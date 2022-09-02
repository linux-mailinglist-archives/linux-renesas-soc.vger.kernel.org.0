Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 490545AB7AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 19:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbiIBRl1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 13:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237142AbiIBRl0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:41:26 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5198CDEB63
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 10:41:22 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id x23so2533767pll.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2022 10:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=KSGSJjTabECbbd/dHLuPz3hO4redFUwFyvxSzX4yWOU=;
        b=ap8zHwRnhKwdtrgAJ/fAkfITHiWdnx2YPowzi+1b59I7i8W7ulUZGWGAQKC8o2PIjX
         +vDrOdWrPvT1lXAulBA1IjKYMK1PNzQy32u9zBNbagYIh6qXQo+oETkSqoTAnzUoA640
         OAy9loMa392yJ/wWctgFEgJGVk4fuXlOZLmBQmCMep5jwijgXDIM5vlNIWYZA4jQ7rdA
         v4kT2nHsIvIMbZ7/qspuCnbxsGqhKCYPi6JQRekuJr0ull/oZimpmhKEMPE9nyddRwN9
         X+Eqc8XMt5Ca49YV6ql2CxOU8I+WJCo6r/jqQrowgGG85B41hkhSAkPoEqXd9e0Wunts
         bAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=KSGSJjTabECbbd/dHLuPz3hO4redFUwFyvxSzX4yWOU=;
        b=jETcQP9ggLrmjNWlC7F0McrmxQAlOeWgtlJ96afwiTN9fuU6AMe4w2K31AmiGUu2Wy
         CCNQp42ZTkIdPE7R/G3nngPkL0B/+m5o4xBapieQ8Gq2b+MFavRfBc957+fTUhSUyadW
         xrj3PVDOZ4UcHZRNccR/ncG+YYdyUKCL6SEwTpqA1rlJuHGq3So8XMXPJ9ZA1vZFmlom
         lMsG96SwfRGaaFuuxC0SRvWI1RgTsFXwIir9lSdc40czAoiEt1ZPHUw2OoZC8YpSZIg8
         coiCZKNWxuX9IlrrsoSELDn77VQDzpxh84r8Qr6bSICNUQy3VieroaX3DxfWEPSZGBHH
         fF+w==
X-Gm-Message-State: ACgBeo0pwExflPFKGviI86NeOrbjBip1FiFuQnQOgww8chf8YqOizlgA
        V2YWCW2eEVtS7YXRFrG0hwGhhayUtRmQ3KvyImo=
X-Google-Smtp-Source: AA6agR6bgx9pXue+aXNiG81HvPft7q6TNP0RB31Z/leKYRl4blKIDVQukilaB2KIs/DWfgbA9yaCBg==
X-Received: by 2002:a17:903:32d2:b0:172:f62a:2f33 with SMTP id i18-20020a17090332d200b00172f62a2f33mr36197718plr.16.1662140481374;
        Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b68-20020a62cf47000000b00537bdc9c2f2sm2155738pfg.170.2022.09.02.10.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Message-ID: <63124041.620a0220.e193.3b91@mx.google.com>
Date:   Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-02-v6.0-rc3
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-09-02-v6.0-rc3)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2022=
-09-02-v6.0-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-02-v6.0-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-02-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cac9a30c2d54cde55723b592346005941a139ded

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


  Details:     https://kernelci.org/test/plan/id/63122dd52cc558123a355681

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220826.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63122dd62cc558123a35570f
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:51.421737  n function igt_require_pipe, file ../lib/ig=
t_kms.c:2281:
    2022-09-02T16:20:51.429420  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-02T16:20:51.433390  Pipe D does not exist or not enabled
    2022-09-02T16:20:51.441591  Test requirement<6>[   58.336036] Console: =
switching to colour dummy device 80x25
    2022-09-02T16:20:51.452352   not met in function igt_require_pipe, file=
 ../lib/igt_kms.c:228<14>[   58.343198] [IGT] kms_vblank: executing
    2022-09-02T16:20:51.453115  1:
    2022-09-02T16:20:51.466175  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pi<14>[   58.355095] [IGT] kms_vblank: starting subtest pi=
pe-A-wait-forked-busy
    2022-09-02T16:20:51.468555  pes[pipe].enabled)
    2022-09-02T16:20:51.471300  Pipe E does not exist or not enabled
    2022-09-02T16:20:51.480117  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281: =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63122dd62cc558123a355711
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:50.289353  ux: 6.0.0-rc3 aarch64)
    2022-09-02T16:20:50.293497  Starting subtest: pipe-A-wait-forked-hang
    2022-09-02T16:20:50.303671  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-09-02T16:20:50.308088  Test requirement: has_ban_period || has_ban=
nable
    2022-09-02T16:20:50.311769  Last errno: 22, Invalid argument
    2022-09-02T16:20:50.317284  [1mSubtest pipe-A-wait-forked-hang: SKIP (0=
.000s)[0m
    2022-09-02T16:20:50.330980  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_km<6>[   57.221871] Console: switching to colou=
r dummy device 80x25
    2022-09-02T16:20:50.332709  s.c:2281:
    2022-09-02T16:20:50.342167  Test requirement: !(pipe >=3D display->n_pi=
pes || !disp<14>[   57.233123] [IGT] kms_vblank: executing
    2022-09-02T16:20:50.344461  lay->pipes[pipe].enabled) =

    ... (98 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63122dd62cc558123a355713
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:49.208364   not met in function igt_require_pipe, file=
 ../lib/igt_kms.c:2281:
    2022-09-02T16:20:49.216728  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-02T16:20:49.220519  Pipe E does not exist or not enabled
    2022-09-02T16:20:49.233320  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt<6>[   56.128538] Console: switching to colour d=
ummy device 80x25
    2022-09-02T16:20:49.238783  <14>[   56.135716] [IGT] kms_vblank: execut=
ing
    2022-09-02T16:20:49.239890  _kms.c:2281:
    2022-09-02T16:20:49.252140  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   56.141501] [IGT] kms_vblank: starting subtest pipe-A-wait-=
forked
    2022-09-02T16:20:49.255417  isplay->pipes[pipe].enabled)
    2022-09-02T16:20:49.258563  Pipe F does not exist or not enabled
    2022-09-02T16:20:49.265714  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc3 aarch64) =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63122dd62cc558123a355715
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:48.093765  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-02T16:20:48.096960  Pipe D does not exist or not enabled
    2022-09-02T16:20:48.104721  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-02T16:20:48.117024  Test requirement: !(pipe >=3D display->n_pi=
pes || !disp<6>[   55.009460] Console: switching to colour dummy device 80x=
25
    2022-09-02T16:20:48.119995  lay->pipes[pipe].enabled)
    2022-09-02T16:20:48.127986  Pipe E does not exist or not enabled<14>[  =
 55.018947] [IGT] kms_vblank: executing
    2022-09-02T16:20:48.141503  Test requirement not met in function igt_re=
quire_pipe, file ../<14>[   55.030763] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-idle
    2022-09-02T16:20:48.143088  lib/igt_kms.c:2281:
    2022-09-02T16:20:48.151789  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-02T16:20:48.154647  Pipe F does not exist or not enabled =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63122dd62cc558123a355717
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:46.971760  (0.000s)[0m
    2022-09-02T16:20:46.979382  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-02T16:20:46.987504  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-02T16:20:46.991031  Pipe C does not exist or not enabled
    2022-09-02T16:20:46.998941  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-02T16:20:47.008123  Test requirement: !(<6>[   53.899826] Conso=
le: switching to colour dummy device 80x25
    2022-09-02T16:20:47.013801  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-09-02T16:20:47.018185  Pipe<14>[   53.909764] [IGT] kms_vblank: ex=
ecuting
    2022-09-02T16:20:47.022887   D does not exist or not enabled
    2022-09-02T16:20:47.032689  Test requirement not met in fu<14>[   53.92=
1941] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63122dd62cc558123a355719
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:45.920000  (kms_vblank:595) INFO: Beginning pipe-A-<8>=
[   52.806685] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-han=
g RESULT=3Dskip>
    2022-09-02T16:20:45.922991  query-forked on pipe A, connector eDP-1
    2022-09-02T16:20:45.926982  (kms_vblank:595) DEBUG: Spawning 6 threads
    2022-09-02T16:20:45.928822  ****  END  ****
    2022-09-02T16:20:45.933215  [1mSubtest pipe-A-query-forked: FAIL (0.772=
s)[0m
    2022-09-02T16:20:45.944218  Test requirement not met in function i<6>[ =
  52.838612] Console: switching to colour dummy device 80x25
    2022-09-02T16:20:45.948207  gt_require_pipe, file ../lib/igt_kms.c:2281:
    2022-09-02T16:20:45.955749  Test requirement: <14>[   52.846237] [IGT] =
kms_vblank: executing
    2022-09-02T16:20:45.961840  !(pipe >=3D display->n_pipes || !display->p=
ipes[pipe].enabled)
    2022-09-02T16:20:45.969118  Pi<14>[   52.857950] [IGT] kms_vblank: star=
ting subtest pipe-A-query-busy =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63122dd62cc558123a35571b
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:44.806713  (0.000s)[0m
    2022-09-02T16:20:44.814443  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-02T16:20:44.822145  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-09-02T16:20:44.825815  Pipe C does not exist or not enabled
    2022-09-02T16:20:44.834185  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-09-02T16:20:44.842106  Test requirement: !(<6>[   51.734327] Conso=
le: switching to colour dummy device 80x25
    2022-09-02T16:20:44.847816  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-09-02T16:20:44.852933  Pipe<14>[   51.744367] [IGT] kms_vblank: ex=
ecuting
    2022-09-02T16:20:44.856650   D does not exist or not enabled
    2022-09-02T16:20:44.867438  Test requirement not met in fu<14>[   51.75=
6760] [IGT] kms_vblank: starting subtest pipe-A-query-forked =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63122dd62cc558123a35571d
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:43.756782  <6>[   50.651883] Console: switching to col=
our dummy device 80x25
    2022-09-02T16:20:43.761047  <14>[   50.658571] [IGT] kms_vblank: execut=
ing
    2022-09-02T16:20:43.774778  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc3 aarch64)<14>[   50.664306] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-09-02T16:20:43.775662  =

    2022-09-02T16:20:43.778524  Starting subtest: pipe-A-query-idle
    2022-09-02T16:20:43.839229  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-09-02T16:20:44.178086  (kms_vblank:589) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-09-02T16:20:44.185169  (kms_vblank:589) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-02T16:20:44.190947  (kms_vblank:589) CRITICAL: Last errno: 22, =
Invalid argument
    2022-09-02T16:20:44.195693  (kms_vblank:589) CRITICAL: error: -22 !=3D =
0 =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63122dd62cc558123a35571e
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:42.617797  <8>[   49.510613] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-09-02T16:20:42.652653  <6>[   49.547262] Console: switching to col=
our dummy device 80x25
    2022-09-02T16:20:42.656374  <14>[   49.553931] [IGT] kms_vblank: execut=
ing
    2022-09-02T16:20:42.670131  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc3 aarch64)<14>[   49.559665] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-09-02T16:20:42.671114  =

    2022-09-02T16:20:42.674303  Starting subtest: pipe-A-accuracy-idle
    2022-09-02T16:20:42.739205  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-09-02T16:20:43.111685  (kms_vblank:586) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-09-02T16:20:43.119180  (kms_vblank:586) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-09-02T16:20:43.125289  (kms_vblank:586) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (81 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3122dd62cc558123a355727
        failing since 77 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-09-02T16:20:39.328348  <8>[   46.225197] <LAVA_SIGNAL_TESTSET STOP>
    2022-09-02T16:20:39.364065  <8>[   46.260063] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-09-02T16:20:39.398015  <6>[   46.293537] Console: switching to col=
our dummy device 80x25
    2022-09-02T16:20:39.403496  <14>[   46.300218] [IGT] kms_setmode: execu=
ting
    2022-09-02T16:20:39.415460  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc3 aarch64)<14>[   46.305576] [IGT] kms_setmode: starting subtest =
basic
    2022-09-02T16:20:39.416257  =

    2022-09-02T16:20:39.418237  Starting subtest: basic
    2022-09-02T16:20:39.422906  Testing: basic 1 connector combinations
    2022-09-02T16:20:39.529753  <14>[   46.423457] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-09-02T16:20:39.533527  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
