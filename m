Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59D88614AE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 13:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiKAMj0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 08:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiKAMjS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 08:39:18 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF28C3889
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 05:39:13 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f9so13314420pgj.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7RuU5fyAgl1ipTL1D63/309tuk9VF5nwcReAqd+TbDI=;
        b=QXrnGvOjsk8MPtvVhkSE7xxttzBYP1s3NuSgdsnN+d3ZMOvCdt1AvwUuxF17NQn6Kr
         W1VwmFkwjeG8/uICtdCuGwG1GZbaQeU84AubRX2Rw6aZ4tXnGKxdEiUjAVS6zmiDM9Ny
         HiiarUMj3UMgtmL0AImi1MF8a4qczmF75hr0QYxmyoRzZQ/82/WyLl/HhJPCx+YLCvcs
         QppApnC63Ci300nGBxN8dm7nmnRIOwQUrrHfMkTq8wqlUgZAEJqSVH4CraI50bkXk09X
         nh2jikZ7Ow5K0OA6IUQXASa2aTJh4T4sSiBJm4Jl7BZpHCtvb0vzrjXd14BwFXFVyhlN
         URCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RuU5fyAgl1ipTL1D63/309tuk9VF5nwcReAqd+TbDI=;
        b=EghaqkuLpxTn5ivjGNH1bUnrSCMsosQmOrRRuTHcaGKSWrHZSGwPMFDBJfMo/Wzsg6
         ygjb4g7OCxiQdMkNA9waSI09n/YLjapFUZwdXbdB/A1/PWN3nYrVjVtdcOJlac9LL8th
         AwBNqlyGWw7Sc5GjZ3LkQCdKo/HgV/ACO+ouakAAjenCfsg4VXrg8rtoIcH8vZXdTBmP
         7iVAyXqF7zl5dAjiQZ8KykIWHjIFNrqnEnHZ5GuziZTgxSQFXE3Lm23WzuYHXX19Sn1r
         d7qBUQiuNLOmJCPibR/Gds0LmnFXCdtlpYrni4GAvRaD4N81ypl2bJbcpneU9ZZoWt6Y
         n7OQ==
X-Gm-Message-State: ACrzQf1AYy8g5NlqUDtE3SUOlzHrop/ng1WY4veaygGiA8v607dxDiBF
        WPkkh6w/qBc6rsDlpfwNws/SODWgO4T8zA==
X-Google-Smtp-Source: AMsMyM5dfXU/aClg/WxrxAwEiIomGyUwUizUg9dejl5RtAhGAY/QXggib+IZ3yH1x3StXIYfMAHUQw==
X-Received: by 2002:a65:5644:0:b0:46f:e930:1968 with SMTP id m4-20020a655644000000b0046fe9301968mr3772334pgs.458.1667306352512;
        Tue, 01 Nov 2022 05:39:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id qe13-20020a17090b4f8d00b001fe39bda429sm5922341pjb.38.2022.11.01.05.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:39:12 -0700 (PDT)
Message-ID: <63611370.170a0220.83265.a4a4@mx.google.com>
Date:   Tue, 01 Nov 2022 05:39:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-01-v6.1-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-11-01-v6.1-rc3)
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
-11-01-v6.1-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-01-v6.1-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-01-v6.1-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      484e5fc34235bd38f3d58742e7af8455e2699205

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  82b2b1e8987c182d14fcaf5a3a3b8ee1b4d5e1df
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  9eff5fba09403bf1df3a1edd655b66fa1b60de2e =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/636100cc685dab6922e7db89

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221024.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/636100cd685dab6922e7dc16
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:20.311276  _pipes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:20.314851  Pipe E does not exist or not enabled
    2022-11-01T11:17:20.323404  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:20.331299  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:20.335262  Pipe F does not exist or not enabled
    2022-11-01T11:17:20.341566  <6>[   69.878747] Console: switching to col=
our dummy device 80x25
    2022-11-01T11:17:20.346054  <14>[   69.887240] [IGT] kms_vblank: execut=
ing
    2022-11-01T11:17:20.360439  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc3 aarch64)<14>[   69.892900] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-forked-busy
    2022-11-01T11:17:20.360816  =

    2022-11-01T11:17:20.364248  Starting subtest: pipe-A-wait-forked-busy =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/636100cd685dab6922e7dc18
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:19.119217  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pi<8>[   68.652877] <LAVA_SIGNAL_TESTCASE TEST_CASE_=
ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>
    2022-11-01T11:17:19.119967  pe].enabled)
    2022-11-01T11:17:19.123997  Pipe D does not exist or not enabled
    2022-11-01T11:17:19.132174  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:19.139889  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:19.143379  Pipe E does not exist or not enabled
    2022-11-01T11:17:19.150622  Te<6>[   68.684338] Console: switching to c=
olour dummy device 80x25
    2022-11-01T11:17:19.155425  <14>[   68.696196] [IGT] kms_vblank: execut=
ing
    2022-11-01T11:17:19.168616  st requirement not met in function igt_requ=
ire_pipe, file ../lib<14>[   68.701819] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy
    2022-11-01T11:17:19.169835  /igt_kms.c:2318: =

    ... (88 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/636100cd685dab6922e7dc1a
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:17.822580   not met in function igt_require_pipe, file=
 ../lib/igt_kms.c:2318:
    2022-11-01T11:17:17.830450  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:17.834461  Pipe E does not exist or not enabled
    2022-11-01T11:17:17.842398  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:17.850446  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:17.853527  Pipe F does not exist or not enabled
    2022-11-01T11:17:17.886682  <6>[   67.426015] Console: switching to col=
our dummy device 80x25
    2022-11-01T11:17:17.892809  <14>[   67.433100] [IGT] kms_vblank: execut=
ing
    2022-11-01T11:17:17.906000  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc3 aarch64)<14>[   67.439692] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-forked
    2022-11-01T11:17:17.906284   =

    ... (120 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/636100cd685dab6922e7dc1c
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:16.603308  <8>[   66.135109] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>
    2022-11-01T11:17:16.611214  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:16.619158  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:16.622697  Pipe E does not exist or not enabled
    2022-11-01T11:17:16.634550  Test requirement not met in function igt_re=
quire_pipe,<6>[   66.168209] Console: switching to colour dummy device 80x25
    2022-11-01T11:17:16.639595  <14>[   66.180402] [IGT] kms_vblank: execut=
ing
    2022-11-01T11:17:16.642296   file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:16.653553  Test requirement: !(pipe >=3D displa<14>[  =
 66.186024] [IGT] kms_vblank: starting subtest pipe-A-wait-idle
    2022-11-01T11:17:16.657702  y->n_pipes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:16.661253  Pipe F does not exist or not enabled =

    ... (87 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/636100cd685dab6922e7dc1e
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:15.326752  Test requirement: !(<8>[   64.858375] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>
    2022-11-01T11:17:15.332238  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)
    2022-11-01T11:17:15.335939  Pipe D does not exist or not enabled
    2022-11-01T11:17:15.344203  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:15.353170  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:15.356054  Pipe E does not exist or not enabled
    2022-11-01T11:17:15.363943  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:15.371558  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:15.375081  Pipe F does not exist or not enabled
    2022-11-01T11:17:15.400034  <6>[   64.938780] Console: switching to col=
our dummy device 80x25 =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/636100cd685dab6922e7dc20
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:14.232450   met in function igt_require_pipe, file ../=
lib/igt_kms.c:2318:
    2022-11-01T11:17:14.240239  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:14.243931  Pipe D does not exist or not enabled
    2022-11-01T11:17:14.257691  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms<6>[   63.792251] Console: switching to colo=
ur dummy device 80x25
    2022-11-01T11:17:14.262054  <14>[   63.803252] [IGT] kms_vblank: execut=
ing
    2022-11-01T11:17:14.263578  .c:2318:
    2022-11-01T11:17:14.276239  Test requirement: !(pipe >=3D display->n_pi=
pes || !displ<14>[   63.808924] [IGT] kms_vblank: starting subtest pipe-A-q=
uery-busy
    2022-11-01T11:17:14.278451  ay->pipes[pipe].enabled)
    2022-11-01T11:17:14.282090  Pipe E does not exist or not enabled
    2022-11-01T11:17:14.290016  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318: =

    ... (82 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/636100cd685dab6922e7dc22
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:12.928534  318:
    2022-11-01T11:17:12.935727  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-01T11:17:12.939185  Pipe E does not exist or not enabled
    2022-11-01T11:17:12.947621  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-01T11:17:12.959264  Test requirement: !(pipe >=3D display->n_pi=
pes || <6>[   62.495930] Console: switching to colour dummy device 80x25
    2022-11-01T11:17:12.961960  !display->pipes[pipe].enabled)
    2022-11-01T11:17:12.969860  Pipe F does not exist or not ena<14>[   62.=
504717] [IGT] kms_vblank: executing
    2022-11-01T11:17:12.970687  bled
    2022-11-01T11:17:12.983483  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc3 aar<14>[   62.516569] [IGT] kms_vblank: starting subtest pipe-A=
-query-forked
    2022-11-01T11:17:12.984882  ch64) =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/636100cd685dab6922e7dc24
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:11.722151  <6>[   61.261443] Console: switching to col=
our dummy device 80x25
    2022-11-01T11:17:11.727405  <14>[   61.268086] [IGT] kms_vblank: execut=
ing
    2022-11-01T11:17:11.741116  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc3 aarch64)<14>[   61.273829] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-11-01T11:17:11.744570  Starting subtest: pipe-A-query-idle
    2022-11-01T11:17:11.829567  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-11-01T11:17:12.219105  (kms_vblank:593) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-11-01T11:17:12.226104  (kms_vblank:593) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-11-01T11:17:12.231567  (kms_vblank:593) CRITICAL: Last errno: 22, =
Invalid argument
    2022-11-01T11:17:12.236270  (kms_vblank:593) CRITICAL: error: -22 !=3D 0
    2022-11-01T11:17:12.238126  Stack trace: =

    ... (73 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/636100cd685dab6922e7dc25
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:10.467685  <8>[   60.005806] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-11-01T11:17:10.494468  <6>[   60.033214] Console: switching to col=
our dummy device 80x25
    2022-11-01T11:17:10.498872  <14>[   60.039900] [IGT] kms_vblank: execut=
ing
    2022-11-01T11:17:10.512910  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc3 aarch64)<14>[   60.045581] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-11-01T11:17:10.513717  =

    2022-11-01T11:17:10.517526  Starting subtest: pipe-A-accuracy-idle
    2022-11-01T11:17:10.596646  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-11-01T11:17:10.760962  <4>[   60.296446] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-11-01T11:17:11.035215  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-11-01T11:17:11.041625  (kms_vblank:590) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (82 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
36100cd685dab6922e7dc2e
        failing since 136 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-01T11:17:06.617995  <8>[   56.159016] <LAVA_SIGNAL_TESTSET STOP>
    2022-11-01T11:17:06.693963  <8>[   56.234030] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-11-01T11:17:06.767250  <6>[   56.306178] Console: switching to col=
our dummy device 80x25
    2022-11-01T11:17:06.772530  <14>[   56.313426] [IGT] kms_setmode: execu=
ting
    2022-11-01T11:17:06.785917  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc3 aarch64)<14>[   56.319150] [IGT] kms_setmode: starting subtest =
basic
    2022-11-01T11:17:06.787942  Starting subtest: basic
    2022-11-01T11:17:06.792475  Testing: basic 1 connector combinations
    2022-11-01T11:17:06.903836  <14>[   56.441651] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-11-01T11:17:06.907310  Starting dynamic subtest: pipe-A-eDP-1
    2022-11-01T11:17:06.910483    Test id#1 CRTC count 1 =

    ... (76 line(s) more)  =

 =20
