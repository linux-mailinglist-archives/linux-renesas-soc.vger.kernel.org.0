Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3A757EAB2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Jul 2022 02:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiGWAlw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 20:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiGWAlv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 20:41:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0911ADF5C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 17:41:50 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id gq7so5652489pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 17:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VrIe87ntrIeE1HpxUdyzM2z/jLYZMwCVB15wxc2nz9M=;
        b=oAoT1ptbXXY95j7/bxrE+ravsa+3SlqA1BEM7uBSnBa6cShG772zpkmsUa1o8So9vm
         e/eOo8hpQpRNuMhxyYhNgV/v7vudg2f4NsczddYttSsJrT/7k3uhX1lNKw7vFMIC5xfi
         FbsGcBkvaJawqdC/rq3okovxzbY2CKGTWSJWuc2tQBQzrR4zJGMdCiZzE1q3CGlMEphl
         0aU/O1xx2iSHwBYjaeUrYR6C57+3zg2fceo2jvcEqva8fv/p63s/rdUp77QDDrMJ+Yhq
         v8trIywAfJPJ7bkQJEf5xFzk4iJYmFToO0WmfoqojosbzJQIYghx0TUZONf/hqebWp0f
         sMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VrIe87ntrIeE1HpxUdyzM2z/jLYZMwCVB15wxc2nz9M=;
        b=sAzeD9xRG4ps9jSROkdR4aazfitBPMBDS64MqREN1/eU0iU0GOXMS9VFOGQlCC9mJM
         8U6me/Yv+asSHzx8wG/zJ/tiBAgLHzMR1SDOxvIvfEQt4wPOoqC3/age0NfQmEFEgyop
         OSf2MfgWQFc9jxnYpVelqqvzuQSBYMTqST5elUv3veax6dFkgwz8662edFUGdfx4wmwG
         hmwGM1ZvvXdcRAyw1BX4QZcWvd9wmuR9cA3StbBFyX6MKwcBXBSeL93jIfVJvg3mpZ68
         wESlFZptttjiAL0bUa3B7W1yPqtz7P546U9Vc62K3nuhuWwFe+eCnldBKEQFKDTAus1e
         mJkw==
X-Gm-Message-State: AJIora89RLAKUdAwZvA7s1w2qCcbg2IYndObQrrQy1TC8slqARZEmZ/P
        L3M9MfYEeBx0itXqs01EB39y88WtHrK1jgwW
X-Google-Smtp-Source: AGRyM1sAQdkNBc/dOzyVlSu+ns6JbvhZ8ZNnEGtNm4KYTooVlIIoOkHaN4gtUXF9IGwEWxr076SonQ==
X-Received: by 2002:a17:903:228b:b0:16b:edb1:a609 with SMTP id b11-20020a170903228b00b0016bedb1a609mr2306216plh.77.1658536908928;
        Fri, 22 Jul 2022 17:41:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d21-20020a170902f15500b0016bdf3d630fsm4317038plb.27.2022.07.22.17.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 17:41:48 -0700 (PDT)
Message-ID: <62db43cc.1c69fb81.6fff4.761a@mx.google.com>
Date:   Fri, 22 Jul 2022 17:41:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-22-v5.19-rc7
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2022-07-22-v5.19-rc7)
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

renesas/master igt-kms-rockchip: 2 runs, 10 regressions (renesas-devel-2022=
-07-22-v5.19-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-22-v5.19-rc7/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-22-v5.19-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3ddd67eca4592c2e96f8aa938195d645d1f8324b

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  60cf6bcef1390473419df14e3214da149dbd8f99
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0e5931f66eb283ba404b07394840b8e0b0c5e621 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/62db30f237c46b469ddaf056

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220716.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62db30f337c46b469ddaf0e4
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:18.115548  !display->pipes[pipe].enabled)
    2022-07-22T23:19:18.119572  Pipe D does not exist or not enabled
    2022-07-22T23:19:18.128186  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-07-22T23:19:18.135883  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-22T23:19:18.139262  Pipe E does not exist or not enabled
    2022-07-22T23:19:18.150510  Test requirement not met in function igt_re=
quire<6>[   58.057895] Console: switching to colour dummy device 80x25
    2022-07-22T23:19:18.153554  _pipe, file ../lib/igt_kms.c:2281:
    2022-07-22T23:19:18.160992  Test requirement: !(pipe >=3D <14>[   58.06=
8037] [IGT] kms_vblank: executing
    2022-07-22T23:19:18.166890  display->n_pipes || !display->pipes[pipe].e=
nabled)
    2022-07-22T23:19:18.174695  Pipe F does <14>[   58.081975] [IGT] kms_vb=
lank: starting subtest pipe-A-wait-forked-busy =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62db30f337c46b469ddaf0e6
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:17.049368  not exist or not enabled
    2022-07-22T23:19:17.055557  IGT-Version: 1.26-g0e5931f (aarch64) (Linux=
: 5.19.0-rc7 aarch64)
    2022-07-22T23:19:17.059359  Starting subtest: pipe-A-wait-forked-hang
    2022-07-22T23:19:17.070183  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-07-22T23:19:17.074402  Test requirement: has_ban_period || has_ban=
nable
    2022-07-22T23:19:17.084158  Last errno: 22, Invalid argumen<6>[   56.99=
2855] Console: switching to colour dummy device 80x25
    2022-07-22T23:19:17.084566  t
    2022-07-22T23:19:17.089652  [1mSubtest pipe-A-wait-forked-hang: SKIP (0=
.000s)[0m
    2022-07-22T23:19:17.094781  Test <14>[   57.002079] [IGT] kms_vblank: e=
xecuting
    2022-07-22T23:19:17.108937  requirement not met in function igt_require=
_pipe, file ../lib/ig<14>[   57.014503] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy =

    ... (98 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62db30f337c46b469ddaf0e8
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:15.943254  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe]<8>[   55.849922] <LAVA_SIGNAL_TESTCASE TEST_CA=
SE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-07-22T23:19:15.944516  .enabled)
    2022-07-22T23:19:15.948851  Pipe D does not exist or not enabled
    2022-07-22T23:19:15.956522  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-07-22T23:19:15.963722  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-22T23:19:15.967390  Pipe E does not exist or not enabled
    2022-07-22T23:19:15.980710  Test requirement not met in function igt_re=
quire_pipe, file ../lib/ig<6>[   55.888005] Console: switching to colour du=
mmy device 80x25
    2022-07-22T23:19:15.983172  t_kms.c:2281:
    2022-07-22T23:19:15.991613  Test requirement: !(pipe >=3D display->n_pi=
pes || !<14>[   55.898805] [IGT] kms_vblank: executing
    2022-07-22T23:19:15.995243  display->pipes[pipe].enabled) =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62db30f337c46b469ddaf0ea
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:14.847521  Test requirement not me<8>[   54.750226] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Ds=
kip>
    2022-07-22T23:19:14.853142  t in function igt_require_pipe, file ../lib=
/igt_kms.c:2281:
    2022-07-22T23:19:14.860969  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-22T23:19:14.865136  Pipe C does not exist or not enabled
    2022-07-22T23:19:14.873127  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-07-22T23:19:14.884798  Test requirement: !(pipe >=3D display->n_pi=
pes || !display-<6>[   54.791969] Console: switching to colour dummy device=
 80x25
    2022-07-22T23:19:14.887032  >pipes[pipe].enabled)
    2022-07-22T23:19:14.891367  Pipe D does not exist or not enabled
    2022-07-22T23:19:14.896440  Tes<14>[   54.803248] [IGT] kms_vblank: exe=
cuting
    2022-07-22T23:19:14.910285  t requirement not met in function igt_requi=
re_pipe, file ../lib/<14>[   54.815545] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle =

    ... (109 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62db30f337c46b469ddaf0ec
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:13.778858  Test requirement: !<8>[   53.683866] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>
    2022-07-22T23:19:13.785187  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)
    2022-07-22T23:19:13.788623  Pipe D does not exist or not enabled
    2022-07-22T23:19:13.797177  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-07-22T23:19:13.804173  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-22T23:19:13.807836  Pipe E does not exist or not enabled
    2022-07-22T23:19:13.817506  Test requirement no<6>[   53.723540] Consol=
e: switching to colour dummy device 80x25
    2022-07-22T23:19:13.827545  t met in function igt_require_pipe, file ..=
/lib/igt_kms.c:2281:<14>[   53.734685] [IGT] kms_vblank: executing
    2022-07-22T23:19:13.841366  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes<14>[   53.748335] [IGT] kms_vblank: starting subtest=
 pipe-A-query-forked-busy
    2022-07-22T23:19:13.843477  [pipe].enabled) =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62db30f337c46b469ddaf0ee
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:12.696725  (kms_vblank:590) INFO: Beginning pipe-A-<8>=
[   52.600668] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-han=
g RESULT=3Dskip>
    2022-07-22T23:19:12.700406  query-forked on pipe A, connector eDP-1
    2022-07-22T23:19:12.705016  (kms_vblank:590) DEBUG: Spawning 6 threads
    2022-07-22T23:19:12.706411  ****  END  ****
    2022-07-22T23:19:12.711475  [1mSubtest pipe-A-query-forked: FAIL (0.769=
s)[0m
    2022-07-22T23:19:12.719712  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-07-22T23:19:12.728092  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-22T23:19:12.734173  Pi<6>[   52.641837] Console: switching to c=
olour dummy device 80x25
    2022-07-22T23:19:12.737838  pe C does not exist or not enabled
    2022-07-22T23:19:12.744755  Test requirement not met in <14>[   52.6518=
61] [IGT] kms_vblank: executing =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62db30f337c46b469ddaf0f0
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:11.585748  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)
    2022-07-22T23:19:11.588773  Pipe D does not exist or not enabled
    2022-07-22T23:19:11.596922  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2281:
    2022-07-22T23:19:11.604626  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-22T23:19:11.608062  Pipe E does not exist or not enabled
    2022-07-22T23:19:11.616579  Test requirement no<6>[   51.523343] Consol=
e: switching to colour dummy device 80x25
    2022-07-22T23:19:11.627267  t met in function igt_require_pipe, file ..=
/lib/igt_kms.c:2281:<14>[   51.534339] [IGT] kms_vblank: executing
    2022-07-22T23:19:11.627770  =

    2022-07-22T23:19:11.641669  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes<14>[   51.546740] [IGT] kms_vblank: starting subtest=
 pipe-A-query-forked
    2022-07-22T23:19:11.642562  [pipe].enabled) =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62db30f337c46b469ddaf0f2
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:10.454022  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe]<8>[   50.361887] <LAVA_SIGNAL_TESTCASE TEST_CA=
SE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-07-22T23:19:10.455028  .enabled)
    2022-07-22T23:19:10.458402  Pipe F does not exist or not enabled
    2022-07-22T23:19:10.488985  <6>[   50.399892] Console: switching to col=
our dummy device 80x25
    2022-07-22T23:19:10.494235  <14>[   50.406712] [IGT] kms_vblank: execut=
ing
    2022-07-22T23:19:10.507417  IGT-Version: 1.26-g0e5931f (aarch64) (Linux=
: 5.19.0-rc7 aarch64)<14>[   50.413205] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle
    2022-07-22T23:19:10.508097  =

    2022-07-22T23:19:10.511674  Starting subtest: pipe-A-query-idle
    2022-07-22T23:19:10.598704  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-07-22T23:19:10.920687  (kms_vblank:584) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290: =

    ... (75 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62db30f337c46b469ddaf0f3
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:09.428455  <6>[   49.339504] Console: switching to col=
our dummy device 80x25
    2022-07-22T23:19:09.433318  <14>[   49.346183] [IGT] kms_vblank: execut=
ing
    2022-07-22T23:19:09.446895  IGT-Version: 1.26-g0e5931f (aarch64) (Linux=
: 5.19.0-rc7 aarch64)<14>[   49.352589] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle
    2022-07-22T23:19:09.447396  =

    2022-07-22T23:19:09.451111  Starting subtest: pipe-A-accuracy-idle
    2022-07-22T23:19:09.533004  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-07-22T23:19:09.905233  (kms_vblank:581) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-07-22T23:19:09.912918  (kms_vblank:581) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-07-22T23:19:09.918483  (kms_vblank:581) CRITICAL: Last errno: 22, =
Invalid argument
    2022-07-22T23:19:09.922539  (kms_vblank:581) CRITICAL: error: -22 !=3D =
0 =

    ... (77 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2db30f337c46b469ddaf0fc
        failing since 35 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-22T23:19:06.147183  <8>[   46.059982] <LAVA_SIGNAL_TESTSET STOP>
    2022-07-22T23:19:06.185330  <8>[   46.097292] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-07-22T23:19:06.219155  <6>[   46.129611] Console: switching to col=
our dummy device 80x25
    2022-07-22T23:19:06.224113  <14>[   46.136823] [IGT] kms_setmode: execu=
ting
    2022-07-22T23:19:06.236240  IGT-Version: 1.26-g0e5931f (aarch64) (Linux=
: 5.19.0-rc7 aarch64)<14>[   46.142256] [IGT] kms_setmode: starting subtest=
 basic
    2022-07-22T23:19:06.237283  =

    2022-07-22T23:19:06.239537  Starting subtest: basic
    2022-07-22T23:19:06.243402  Testing: basic 1 connector combinations
    2022-07-22T23:19:06.355305  <14>[   46.265052] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-07-22T23:19:06.359492  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
