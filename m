Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE0458FDB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 15:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbiHKNub (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 09:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbiHKNu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 09:50:28 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA3865E3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:50:27 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gp7so3328299pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=szLf4I+g4co40k6JXnifNCz863hDFFo5mh1vqiLXanw=;
        b=Vc6xEa/fWQwNVTLe1q2vh2E1oM9BD2u4vYE7jaXp7tIZkti40RE5d4Y7kbPVVk3X1/
         uegWHdB3h0xFYtEuRtnqKha7Hg1KG/LrfJToj32JUf+bfqlapoOGoZVU2hJBXgXZTv6R
         +j4gRBtuyX99B25/HcUPUlKNy9+yI4ZLKHb18Wb2tRDC5SJfdWcxH2WJx93GXnciKxO7
         Sml5g64El6gAbMAFSNNfZuRPrIUmSdcmbF4bnachLizx/aEYuf8o1JSwZy8yxhigT+1V
         gjvm1+6yWCxRabtMuqfmpLczWHCzOfUZVa3nzquBZelbTJMCoHgGE9mjD2wDI7y2ekzz
         R7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=szLf4I+g4co40k6JXnifNCz863hDFFo5mh1vqiLXanw=;
        b=3TLUu/pgt5ZOfuwxnnXAxgH3L7wwGK6d8FecHvs5+2bkWf/6nmww+WFnjDbJz8iUUl
         kzjpGkC1p3P4a6xuxMndrnmigt4SqNT8FMjEgU9IYMwnd3Jq+czhnlsgTOl+A/Z/B2pC
         uf0oNfgFJy/K1BERqORc9zZMQhLa5JxQH1sXC42j+v43EE4mERRv0qo5WbQIrziRHyWG
         n+TxZhWZ/ME6I7/D0VizdFVZdC25bteR/73ztE5YqMYnH2u7+vr4x9C39cTqc6p/uYvp
         8BgaoklRid6dbdjUKUHP8MGoCftWezw4nhAUHpphqgcdsILfYLZxYL55ycM4QWqbzxia
         Xf6A==
X-Gm-Message-State: ACgBeo2QMm5hSomOexx0s6xbMQPtE/kdN1+mQZONxkegwmVPhAMsKBxv
        IS5EcDn05eR+IPLkMrd7VZmUgDADTxA8k+YmQ9M=
X-Google-Smtp-Source: AA6agR60Um0ye7j1uahtYuQqGsm5l3tXeUu97R8JM5svT1R9stK0ph8DncfuinpG1z3PMRNGj4CO/A==
X-Received: by 2002:a17:902:f082:b0:16f:18b6:71d7 with SMTP id p2-20020a170902f08200b0016f18b671d7mr32869795pla.94.1660225826634;
        Thu, 11 Aug 2022 06:50:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d3-20020a623603000000b0052d981e7842sm4010346pfa.208.2022.08.11.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 06:50:18 -0700 (PDT)
Message-ID: <62f5091a.620a0220.4abf2.6e7f@mx.google.com>
Date:   Thu, 11 Aug 2022 06:50:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-11-v5.19
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2022-08-11-v5.19)
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
-08-11-v5.19)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-11-v5.19/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-11-v5.19
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      afa6e8225571047286d61812f393c879ef344b1d

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


  Details:     https://kernelci.org/test/plan/id/62f4f83417753f6e94daf093

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-k=
ms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-k=
ms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220805.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62f4f83417753f6e94daf121
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:36:02.696659  quirement: !(pipe >=3D display->n_pipes || =
!display->pipes[pipe].enabled)
    2022-08-11T12:36:02.700395  Pipe D does not exist or not enabled
    2022-08-11T12:36:02.708223  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:36:02.716062  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T12:36:02.719543  Pipe E does not exist or not enabled
    2022-08-11T12:36:02.727253  Test re<6>[   57.900441] Console: switching=
 to colour dummy device 80x25
    2022-08-11T12:36:02.738067  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   57.911483] [IGT] kms_vblank: executing
    2022-08-11T12:36:02.739123  kms.c:2281:
    2022-08-11T12:36:02.752076  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   57.923663] [IGT] kms_vblank: starting subtest pipe-A-wait=
-forked-busy
    2022-08-11T12:36:02.755119  splay->pipes[pipe].enabled) =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62f4f83417753f6e94daf123
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:36:01.588343  s[pipe].enabled)
    2022-08-11T12:36:01.592181  Pipe E does not exist or not enabled
    2022-08-11T12:36:01.600242  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:36:01.608308  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T12:36:01.612108  Pipe F does not exist or not enabled
    2022-08-11T12:36:01.617535  IGT-Version: 1.26-ga98a663 (aarch64) (Linux=
: 5.19.0 aarch64)
    2022-08-11T12:36:01.624124  <6>[   56.798215] Console: switching to col=
our dummy device 80x25
    2022-08-11T12:36:01.628298  Starting subtest: pipe-A-wait-forked-hang
    2022-08-11T12:36:01.635315  Test requirement not <14>[   56.808340] [IG=
T] kms_vblank: executing
    2022-08-11T12:36:01.648399  met in function gem_context_require_bannabl=
e, file ../lib/i915/g<14>[   56.820728] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62f4f83417753f6e94daf125
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:36:00.501624  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].e<8>[   55.675752] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-08-11T12:36:00.502582  nabled)
    2022-08-11T12:36:00.506300  Pipe D does not exist or not enabled
    2022-08-11T12:36:00.514731  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:36:00.522312  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T12:36:00.525895  Pipe E does not exist or not enabled
    2022-08-11T12:36:00.539338  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<6>[   55.713081] Console: switching to colour =
dummy device 80x25
    2022-08-11T12:36:00.540197  kms.c:2281:
    2022-08-11T12:36:00.550326  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   55.723044] [IGT] kms_vblank: executing
    2022-08-11T12:36:00.553175  splay->pipes[pipe].enabled) =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62f4f83417753f6e94daf127
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:35:59.406161  =

    2022-08-11T12:35:59.407908  ****  END  ****
    2022-08-11T12:35:59.413056  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.716s)[0m
    2022-08-11T12:35:59.421512  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:35:59.429100  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T12:35:59.432723  Pipe C does not exist or not enabled
    2022-08-11T12:35:59.443147  Test requirement not met in function igt_r<=
6>[   54.616819] Console: switching to colour dummy device 80x25
    2022-08-11T12:35:59.447170  equire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:35:59.454370  Test requirement: !(pi<14>[   54.627589] [I=
GT] kms_vblank: executing
    2022-08-11T12:35:59.459967  pe >=3D display->n_pipes || !display->pipes=
[pipe].enabled) =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62f4f83417753f6e94daf129
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:35:58.324368  000s)[0m
    2022-08-11T12:35:58.332767  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:35:58.340333  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T12:35:58.344131  Pipe C does not exist or not enabled
    2022-08-11T12:35:58.352519  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:35:58.360812  Test requirement: !(pip<6>[   53.533846] Co=
nsole: switching to colour dummy device 80x25
    2022-08-11T12:35:58.366712  e >=3D display->n_pipes || !display->pipes[=
pipe].enabled)
    2022-08-11T12:35:58.371722  Pipe D <14>[   53.544712] [IGT] kms_vblank:=
 executing
    2022-08-11T12:35:58.375014  does not exist or not enabled
    2022-08-11T12:35:58.385698  Test requirement not met in funct<14>[   53=
.557149] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62f4f83417753f6e94daf12b
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:35:57.290973  abled)
    2022-08-11T12:35:57.294737  Pipe C does not exist or not enabled
    2022-08-11T12:35:57.303069  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:35:57.310977  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T12:35:57.314373  Pipe D does not exist or not enabled
    2022-08-11T12:35:57.328071  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_k<6>[   52.500694] Console: switching to colour=
 dummy device 80x25
    2022-08-11T12:35:57.329033  ms.c:2281:
    2022-08-11T12:35:57.339143  Test requirement: !(pipe >=3D display->n_pi=
pes || !dis<14>[   52.512000] [IGT] kms_vblank: executing
    2022-08-11T12:35:57.341723  play->pipes[pipe].enabled)
    2022-08-11T12:35:57.352004  Pipe E does not exist or not enabled<14>[  =
 52.524254] [IGT] kms_vblank: starting subtest pipe-A-query-busy =

    ... (98 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62f4f83417753f6e94daf12d
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:35:56.157738  [1mSubtest pipe-A-query-idle-hang: SKIP (0.=
<8>[   51.327741] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-ha=
ng RESULT=3Dskip>
    2022-08-11T12:35:56.158487  000s)[0m
    2022-08-11T12:35:56.166747  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:35:56.174116  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-08-11T12:35:56.178195  Pipe C does not exist or not enabled
    2022-08-11T12:35:56.186299  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-08-11T12:35:56.194814  Test requirement: !(pip<6>[   51.368329] Co=
nsole: switching to colour dummy device 80x25
    2022-08-11T12:35:56.200427  e >=3D display->n_pipes || !display->pipes[=
pipe].enabled)
    2022-08-11T12:35:56.206378  Pipe D <14>[   51.378767] [IGT] kms_vblank:=
 executing
    2022-08-11T12:35:56.209016  does not exist or not enabled =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62f4f83417753f6e94daf12f
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:35:55.032827  <8>[   50.207590] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-08-11T12:35:55.068387  <6>[   50.245150] Console: switching to col=
our dummy device 80x25
    2022-08-11T12:35:55.073461  <14>[   50.252263] [IGT] kms_vblank: execut=
ing
    2022-08-11T12:35:55.079668  IGT-Version: 1.26-ga98a663 (aarch64) (Linux=
: 5.19.0 aarch64)
    2022-08-11T12:35:55.086768  <14>[   50.258678] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-08-11T12:35:55.090719  Starting subtest: pipe-A-query-idle
    2022-08-11T12:35:55.175253  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-08-11T12:35:55.530777  (kms_vblank:583) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-08-11T12:35:55.537786  (kms_vblank:583) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-11T12:35:55.543486  (kms_vblank:583) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62f4f83417753f6e94daf130
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:35:53.954219  <6>[   49.131340] Console: switching to col=
our dummy device 80x25
    2022-08-11T12:35:53.959369  <14>[   49.138233] [IGT] kms_vblank: execut=
ing
    2022-08-11T12:35:53.965939  IGT-Version: 1.26-ga98a663 (aarch64) (Linux=
: 5.19.0 aarch64)
    2022-08-11T12:35:53.973129  <14>[   49.144794] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-08-11T12:35:53.977069  Starting subtest: pipe-A-accuracy-idle
    2022-08-11T12:35:54.059057  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-08-11T12:35:54.447150  (kms_vblank:579) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-08-11T12:35:54.454189  (kms_vblank:579) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-08-11T12:35:54.459970  (kms_vblank:579) CRITICAL: Last errno: 22, =
Invalid argument
    2022-08-11T12:35:54.464300  (kms_vblank:579) CRITICAL: error: -22 !=3D =
0 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2f4f83417753f6e94daf139
        failing since 54 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-08-11T12:35:50.654229  <8>[   45.829363] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-08-11T12:35:50.661503  <8>[   45.840489] <LAVA_SIGNAL_TESTSET STOP>
    2022-08-11T12:35:50.699264  <8>[   45.876828] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-08-11T12:35:50.732514  <6>[   45.909488] Console: switching to col=
our dummy device 80x25
    2022-08-11T12:35:50.737425  <14>[   45.916318] [IGT] kms_setmode: execu=
ting
    2022-08-11T12:35:50.749568  IGT-Version: 1.26-ga98a663 (aarch64) (Linux=
: 5.19.0 aarch64)<14>[   45.921796] [IGT] kms_setmode: starting subtest bas=
ic
    2022-08-11T12:35:50.749864  =

    2022-08-11T12:35:50.752911  Starting subtest: basic
    2022-08-11T12:35:50.757181  Testing: basic 1 connector combinations
    2022-08-11T12:35:50.864593  <14>[   46.040485] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1 =

    ... (78 line(s) more)  =

 =20
