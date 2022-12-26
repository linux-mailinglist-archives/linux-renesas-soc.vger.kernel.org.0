Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBCF6562AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 13:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiLZMyB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 07:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiLZMyA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 07:54:00 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EDFB61
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 04:53:59 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id fy4so10642441pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 04:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nN41/GCEEUhz5JPzpODfmMOzoptj3j3s/Qix/yotOEU=;
        b=nWyn4Utv3Nb8NMn8QDd13R6bADbenYdX4i1FlppuMnpMHkOo6xjUJtUCqFWOpiVPRp
         dvuMlzs3kjsFalMGHiB0E7r/Qst5IJ+FVQlXfygUgM26YiiFB+CRwM9s8G0VHjBQvLy2
         sOVlxE7BGYnmv4mWCErsxuWpOMcOJB2luWHV/mHoC828puA2MXfGiosRybXzcmGw57Im
         vd77hkkqLJRIcg8pH6WbEvONJCyEAtdYjJ428g5Rn4U//efz24S4Oe5ob8AXwyQtZuP/
         WYbyb+P6ayJxsopz18gHQTlfx3I6LQmPlE17oejmXsUx7UpDsISDKQYCibivQ4blFr4y
         baOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nN41/GCEEUhz5JPzpODfmMOzoptj3j3s/Qix/yotOEU=;
        b=FPfY3NpEbD0xTiUsJDyI641PYwAReQaluYRD8Z+NPZk2XjzwDu66NojIItouboO9JR
         QqIifZxxGSvHmPVLzg8OdSJ3VcclZBuCc2VBd2QXcTUNBu34m+wYGc0wqNV8NXuMWRyY
         CqJwnnTCYUp7a9QtvQgZlZmWCApRnVVA3IyKSxOIX9a+TfsqJ5UkmwhR37pKwDJGEX4+
         U4xCpGRWshDoFSR5PeGuJSzzc+dtPrnFm/NX89krE5b7uiI5MArcITufv8nVNSVMJWcb
         0/3UCPNR6N/ong82NcDdl3thu+DTu+IIpWJW2SDyFVlhXOzJkjOVlhkc4PHe6/sWD2TM
         GKHA==
X-Gm-Message-State: AFqh2kpP+SxG6vC78+elT/q3+7pECG5kkMSv/dEecSoXWsdxkfKh/VWg
        AlmXejK3TH36d34RlGrtoXE339kX6qm7kxRB1Ro=
X-Google-Smtp-Source: AMrXdXu9yhAtMjaJqwgVTF9J7Ch1GKS2knE2QKEclBpPtFw4+qpaL7nM5nwZeOWguE93RJt73tlCNw==
X-Received: by 2002:a17:902:7590:b0:189:7100:c50e with SMTP id j16-20020a170902759000b001897100c50emr32116005pll.48.1672059238016;
        Mon, 26 Dec 2022 04:53:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709027e4a00b0018913417ba2sm4579392pln.130.2022.12.26.04.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 04:53:57 -0800 (PST)
Message-ID: <63a99965.170a0220.fec3a.7f26@mx.google.com>
Date:   Mon, 26 Dec 2022 04:53:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-12-26-v6.2-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2022-12-26-v6.2-rc1)
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
-12-26-v6.2-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-12-26-v6.2-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-12-26-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b0aba6507e1ff279b0c30d78c75eb192aaedf22b

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  874af994636a534236a747a88aec086b9b35b001
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f2f515390fb11554d22c7b78b94e288026545326 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63a98b0c0d4a31b0634eef3d

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-26-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-26-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221216.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63a98b0c0d4a31b0634eefca
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:36.231725  e ../lib/igt_kms.c:2358:
    2022-12-26T11:50:36.240447  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-26T11:50:36.243159  Pipe E does not exist or not enabled
    2022-12-26T11:50:36.243929  =

    2022-12-26T11:50:36.254323  Test requirement not met in function igt_re=
quire<6>[   65.508625] Console: switching to colour dummy device 80x25
    2022-12-26T11:50:36.259488  <14>[   65.515249] [IGT] kms_vblank: execut=
ing
    2022-12-26T11:50:36.262673  _pipe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:36.272809  Test requirement: !(pipe >=3D <14>[   65.52=
0986] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-busy
    2022-12-26T11:50:36.278425  display->n_pipes || !display->pipes[pipe].e=
nabled)
    2022-12-26T11:50:36.282284  Pipe F does not exist or not enabled =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63a98b0c0d4a31b0634eefcc
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:35.071954  uirement not met in function igt_require_pi=
pe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:35.079669  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-26T11:50:35.080098  =

    2022-12-26T11:50:35.083191  Pipe D does not exist or not enabled
    2022-12-26T11:50:35.083655  =

    2022-12-26T11:50:35.091964  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:35.102484  Test requirement: !(pipe >=3D display->n_pi=
p<6>[   64.354003] Console: switching to colour dummy device 80x25
    2022-12-26T11:50:35.106531  es || !display->pipes[pipe].enabled)
    2022-12-26T11:50:35.113478  Pipe E does not exist or n<14>[   64.363749=
] [IGT] kms_vblank: executing
    2022-12-26T11:50:35.114084   =

    ... (111 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63a98b0c0d4a31b0634eefce
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:33.895090  =

    2022-12-26T11:50:33.902596  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-26T11:50:33.905713  Pipe E does not exist or not enabled
    2022-12-26T11:50:33.914099  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:33.914926  =

    2022-12-26T11:50:33.926150  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<6>[   63.174335] Console: switching to colour dummy device 80x25
    2022-12-26T11:50:33.928360  isplay->pipes[pipe].enabled)
    2022-12-26T11:50:33.929095  =

    2022-12-26T11:50:33.936896  Pipe F does not exist or not enabl<14>[   6=
3.186555] [IGT] kms_vblank: executing
    2022-12-26T11:50:33.937442  ed =

    ... (131 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63a98b0c0d4a31b0634eefd0
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:32.683762  2.0-rc1 aarch64)
    2022-12-26T11:50:32.688664  Starting subtest: pipe-A-query-forked-busy-=
hang
    2022-12-26T11:50:32.698834  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-12-26T11:50:32.703548  Test requirement: has_ban_period || has_ban=
nable
    2022-12-26T11:50:32.706501  Last errno: 22, Invalid argument
    2022-12-26T11:50:32.712763  =1B[1mSubtest pipe-A-query-forked-busy-hang=
: SKIP (0.000s)=1B[0m
    2022-12-26T11:50:32.725519  Test requirement not met in function igt_re=
quire_pipe, file ../lib/<6>[   61.975716] Console: switching to colour dumm=
y device 80x25
    2022-12-26T11:50:32.726183  =

    2022-12-26T11:50:32.728081  igt_kms.c:2358:
    2022-12-26T11:50:32.736821  Test requirement: !(pipe >=3D display->n_pi=
pes ||<14>[   61.986617] [IGT] kms_vblank: executing =

    ... (118 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63a98b0c0d4a31b0634eefd2
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:31.477064  =

    2022-12-26T11:50:31.483065  nt not met in function igt_require_pipe, fi=
le ../lib/igt_kms.c:2358:
    2022-12-26T11:50:31.491240  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-26T11:50:31.494877  Pipe E does not exist or not enabled
    2022-12-26T11:50:31.495345  =

    2022-12-26T11:50:31.503038  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:31.514197  Test requirement: !(pipe >=3D display->n_pi=
pes || <6>[   60.766890] Console: switching to colour dummy device 80x25
    2022-12-26T11:50:31.517761  !display->pipes[pipe].enabled)
    2022-12-26T11:50:31.524748  Pipe F does not exist or not ena<14>[   60.=
774959] [IGT] kms_vblank: executing
    2022-12-26T11:50:31.525333  bled =

    ... (133 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63a98b0c0d4a31b0634eefd4
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:30.368109  require_pipe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:30.376286  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-26T11:50:30.379911  Pipe E does not exist or not enabled
    2022-12-26T11:50:30.380235  =

    2022-12-26T11:50:30.387986  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:30.388289  =

    2022-12-26T11:50:30.395496  Test requir<6>[   59.648213] Console: switc=
hing to colour dummy device 80x25
    2022-12-26T11:50:30.395813  =

    2022-12-26T11:50:30.400351  <14>[   59.656510] [IGT] kms_vblank: execut=
ing
    2022-12-26T11:50:30.413798  ement: !(pipe >=3D display->n_pipes || !dis=
play->pipes[pipe].enabl<14>[   59.662233] [IGT] kms_vblank: starting subtes=
t pipe-A-query-busy =

    ... (128 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63a98b0c0d4a31b0634eefd6
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:29.148580  nt not met in function igt_require_pipe, fi=
le ../lib/igt_kms.c:2358:
    2022-12-26T11:50:29.149271  =

    2022-12-26T11:50:29.156781  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-12-26T11:50:29.157053  =

    2022-12-26T11:50:29.160400  Pipe E does not exist or not enabled
    2022-12-26T11:50:29.168986  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2022-12-26T11:50:29.169257  =

    2022-12-26T11:50:29.180085  Test requirement: !(pipe >=3D display->n_pi=
pes || <6>[   58.431067] Console: switching to colour dummy device 80x25
    2022-12-26T11:50:29.183671  !display->pipes[pipe].enabled)
    2022-12-26T11:50:29.190912  Pipe F does not exist or not ena<14>[   58.=
441266] [IGT] kms_vblank: executing =

    ... (136 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63a98b0c0d4a31b0634eefd8
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:27.942946  <8>[   57.194757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-12-26T11:50:27.982870  <6>[   57.236809] Console: switching to col=
our dummy device 80x25
    2022-12-26T11:50:27.987740  <14>[   57.243509] [IGT] kms_vblank: execut=
ing
    2022-12-26T11:50:27.994278  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc1 aarch64)
    2022-12-26T11:50:28.001515  <14>[   57.249836] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-12-26T11:50:28.001602  =

    2022-12-26T11:50:28.004627  Starting subtest: pipe-A-query-idle
    2022-12-26T11:50:28.101076  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-12-26T11:50:28.473271  (kms_vblank:545) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-12-26T11:50:28.481119  (kms_vblank:545) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (91 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63a98b0c0d4a31b0634eefd9
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:26.794990  <6>[   56.048986] Console: switching to col=
our dummy device 80x25
    2022-12-26T11:50:26.799579  <14>[   56.055758] [IGT] kms_vblank: execut=
ing
    2022-12-26T11:50:26.806178  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc1 aarch64)
    2022-12-26T11:50:26.813200  <14>[   56.062141] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-12-26T11:50:26.813578  =

    2022-12-26T11:50:26.818097  Starting subtest: pipe-A-accuracy-idle
    2022-12-26T11:50:26.917853  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-12-26T11:50:27.340302  (kms_vblank:542) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-12-26T11:50:27.347296  (kms_vblank:542) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-12-26T11:50:27.347572   =

    ... (94 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3a98b0c0d4a31b0634eefe2
        failing since 191 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-12-26T11:50:23.180447  =

    2022-12-26T11:50:23.187610  <8>[   52.443888] <LAVA_SIGNAL_TESTSET STOP>
    2022-12-26T11:50:23.230266  <8>[   52.484726] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-12-26T11:50:23.265370  <6>[   52.519771] Console: switching to col=
our dummy device 80x25
    2022-12-26T11:50:23.265737  =

    2022-12-26T11:50:23.270321  <14>[   52.526480] [IGT] kms_setmode: execu=
ting
    2022-12-26T11:50:23.277056  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc1 aarch64)
    2022-12-26T11:50:23.282982  <14>[   52.531840] [IGT] kms_setmode: start=
ing subtest basic
    2022-12-26T11:50:23.283862  =

    2022-12-26T11:50:23.283955   =

    ... (93 line(s) more)  =

 =20
