Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE0C611670
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 17:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiJ1P41 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 11:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiJ1P40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 11:56:26 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010C31FAE65
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:24 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id f23so5196860plr.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P4XYgtmjYsnmSQ+5udi7n8GxSRHGrUD3vypMUaTh7ok=;
        b=OdwQwEtc3Tye0X4N6059rc8zs0P5uE5Xfm1k/Sf2HfuveBvNDwvjc0vAwA2GCl6Wzj
         ilVfILVkHeBr+X1oyLTkd0Ju+XwbvL1zdZjgrAzGwtQe36vDXyoNzQnPWtrfH5CWEjo6
         hXf4cvg2a9GmJ/6xCixeHrdWBfVVuP80pFXAREghsqrZEezgYL/dLiSNuniHmEotyn7P
         fJ0O1R1vbU3VSHas2azF+kAZ2pIjhaeL/+7yRwbKYdViMHM3K/VbN2tkmVQs3olraZoX
         S3/ZM6YKmDbWmwtjikNxy6OGcP8gGlKjxR4fF0eawQ8TJHtWkBT/Cvy7VQ44SR6I1soz
         IkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4XYgtmjYsnmSQ+5udi7n8GxSRHGrUD3vypMUaTh7ok=;
        b=BubcLDbWfiwvNzsr9Hp1+Bb85/CQyF7p1eb9pFiq6ZPCke/ZQItFsQeTf7b4iZJbT+
         cGlqn5fl4yDEgN+dlZ++gU/i4EjxC+xtE2axyeUmQt9QI/x9BUDoQiJ+8iS4HftdAO8N
         GuWzimY/8NaibFAgJhs5zB9DWMtv2Eyqb94jmLwfvGf6lSOWBciLdisUnFiC6sI+g6ob
         WRL1dsF+ZgxSAynX7FWQjyMb/TAiaPeeQlIocArCMSZQbpvDOPwC8uakZjZ9nT2gkO6k
         otRDNHfE5BKfRxbY3QaL6Dj7mQ7dUsd7xohtBAncLjvq6fU6DyVsHdyENE1u2bj/qoMA
         6cVw==
X-Gm-Message-State: ACrzQf07UlLiikRRtL4YLFqaZcZiIjhS+8joWyfnJinFTGaECcopS25u
        M0YemfdMoe7l3j1rUaUuHDtoCbydmx7oAG4h
X-Google-Smtp-Source: AMsMyM75nP8+MIJnGhNroJlmBklN2NKoJ2kqWLttu3nlnsD2ilRYZyTrX6Ikq+oqJzuaftD1UKATgg==
X-Received: by 2002:a17:902:ef43:b0:186:99be:2ee9 with SMTP id e3-20020a170902ef4300b0018699be2ee9mr19472plx.148.1666972584107;
        Fri, 28 Oct 2022 08:56:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lr2-20020a17090b4b8200b0020d9c2f6c39sm4415255pjb.34.2022.10.28.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:56:23 -0700 (PDT)
Message-ID: <635bfba7.170a0220.cf5c1.8810@mx.google.com>
Date:   Fri, 28 Oct 2022 08:56:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-28-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-10-28-v6.1-rc2)
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
-10-28-v6.1-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-28-v6.1-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-28-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e3ee6a5b11b04ae5efa890cdfe9c94b77e36f136

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


  Details:     https://kernelci.org/test/plan/id/635beaeed25cc39448e7db6a

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221024.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/635beaeed25cc39448e7dbf7
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:53.219196  bled
    2022-10-28T14:42:53.227933  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:53.235669  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:53.238893  Pipe E does not exist or not enabled
    2022-10-28T14:42:53.246992  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:53.254939  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:53.258595  Pipe F does not exist or not enabled
    2022-10-28T14:42:53.292992  <6>[   69.762232] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:53.297573  <14>[   69.769303] [IGT] kms_vblank: execut=
ing
    2022-10-28T14:42:53.312003  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   69.775916] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-forked-busy =

    ... (111 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/635beaeed25cc39448e7dbf9
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:51.985322  Test require<8>[   68.447803] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>
    2022-10-28T14:42:51.991934  ment not met in function igt_require_pipe, =
file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:51.999527  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:52.003661  Pipe E does not exist or not enabled
    2022-10-28T14:42:52.012018  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:52.019686  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:52.023493  Pipe F does not exist or not enabled
    2022-10-28T14:42:52.051852  <6>[   68.521483] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:52.056919  <14>[   68.528299] [IGT] kms_vblank: execut=
ing
    2022-10-28T14:42:52.071184  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   68.535335] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-busy =

    ... (86 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/635beaeed25cc39448e7dbfb
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:50.701281  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)
    2022-10-28T14:42:50.705231  Pipe D does not exist or not enabled
    2022-10-28T14:42:50.713821  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:50.721346  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:50.725112  Pipe E does not exist or not enabled
    2022-10-28T14:42:50.733175  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:50.740874  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:50.744159  Pipe F does not exist or not enabled
    2022-10-28T14:42:50.763607  <6>[   67.233163] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:50.768606  <14>[   67.240141] [IGT] kms_vblank: execut=
ing =

    ... (121 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/635beaeed25cc39448e7dbfd
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:49.407972  ib/igt_kms.c:2318:
    2022-10-28T14:42:49.416145  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:49.419473  Pipe E does not exist or not enabled
    2022-10-28T14:42:49.427773  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:49.435749  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:49.439044  Pipe F does not exist or not enabled
    2022-10-28T14:42:49.477945  <6>[   65.947596] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:49.483841  <14>[   65.954794] [IGT] kms_vblank: execut=
ing
    2022-10-28T14:42:49.497021  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   65.961531] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-idle
    2022-10-28T14:42:49.497646   =

    ... (86 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/635beaeed25cc39448e7dbff
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:48.094837  ].enabled)
    2022-10-28T14:42:48.098241  Pipe D does not exist or not enabled
    2022-10-28T14:42:48.106274  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:48.114375  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:48.118182  Pipe E does not exist or not enabled
    2022-10-28T14:42:48.126449  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:48.133669  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:48.138013  Pipe F does not exist or not enabled
    2022-10-28T14:42:48.166076  <6>[   64.635718] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:48.171497  <14>[   64.642920] [IGT] kms_vblank: execut=
ing =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/635beaeed25cc39448e7dc01
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:46.969599  .c:2318:
    2022-10-28T14:42:46.977958  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:46.981225  Pipe E does not exist or not enabled
    2022-10-28T14:42:46.989561  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:46.999984  Test requirement: !(pipe >=3D display->n_pi=
pes<6>[   63.464395] Console: switching to colour dummy device 80x25
    2022-10-28T14:42:47.005080  <14>[   63.476491] [IGT] kms_vblank: execut=
ing
    2022-10-28T14:42:47.008743   || !display->pipes[pipe].enabled)
    2022-10-28T14:42:47.018970  Pipe F does not exist or not<14>[   63.4821=
31] [IGT] kms_vblank: starting subtest pipe-A-query-busy
    2022-10-28T14:42:47.019609   enabled
    2022-10-28T14:42:47.026019  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64) =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/635beaeed25cc39448e7dc03
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:45.629295  le ../lib/igt_kms.c:2318:
    2022-10-28T14:42:45.636247  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:45.640671  Pipe E does not exist or not enabled
    2022-10-28T14:42:45.648401  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-10-28T14:42:45.656037  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-28T14:42:45.659974  Pipe F does not exist or not enabled
    2022-10-28T14:42:45.696857  <6>[   62.166821] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:45.702563  <14>[   62.173508] [IGT] kms_vblank: execut=
ing
    2022-10-28T14:42:45.716283  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   62.179895] [IGT] kms_vblank: starting subtest p=
ipe-A-query-forked
    2022-10-28T14:42:45.720308  Starting subtest: pipe-A-query-forked =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/635beaeed25cc39448e7dc05
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:44.338556  <8>[   60.805486] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-10-28T14:42:44.409738  <6>[   60.879257] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:44.415554  <14>[   60.886394] [IGT] kms_vblank: execut=
ing
    2022-10-28T14:42:44.429001  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   60.892961] [IGT] kms_vblank: starting subtest p=
ipe-A-query-idle
    2022-10-28T14:42:44.432322  Starting subtest: pipe-A-query-idle
    2022-10-28T14:42:44.525884  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-10-28T14:42:44.898518  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-10-28T14:42:44.905644  (kms_vblank:590) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-28T14:42:44.911673  (kms_vblank:590) CRITICAL: Last errno: 22, =
Invalid argument
    2022-10-28T14:42:44.914798  (kms_vblank:590) CRITICAL: error: -22 !=3D =
0 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/635beaeed25cc39448e7dc06
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:43.124404  <6>[   59.593504] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:43.129516  <14>[   59.600561] [IGT] kms_vblank: execut=
ing
    2022-10-28T14:42:43.143521  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   59.607162] [IGT] kms_vblank: starting subtest p=
ipe-A-accuracy-idle
    2022-10-28T14:42:43.147246  Starting subtest: pipe-A-accuracy-idle
    2022-10-28T14:42:43.243329  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-10-28T14:42:43.648621  (kms_vblank:587) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-10-28T14:42:43.656197  (kms_vblank:587) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-28T14:42:43.661950  (kms_vblank:587) CRITICAL: Last errno: 22, =
Invalid argument
    2022-10-28T14:42:43.666060  (kms_vblank:587) CRITICAL: error: -22 !=3D 0
    2022-10-28T14:42:43.667732  Stack trace: =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
35beaeed25cc39448e7dc0f
        failing since 132 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-28T14:42:39.119689  <8>[   55.585732] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-10-28T14:42:39.131446  <8>[   55.601998] <LAVA_SIGNAL_TESTSET STOP>
    2022-10-28T14:42:39.208332  <8>[   55.678008] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-10-28T14:42:39.238930  <6>[   55.707992] Console: switching to col=
our dummy device 80x25
    2022-10-28T14:42:39.243911  <14>[   55.714760] [IGT] kms_setmode: execu=
ting
    2022-10-28T14:42:39.256069  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc2 aarch64)<14>[   55.719895] [IGT] kms_setmode: starting subtest =
basic
    2022-10-28T14:42:39.259103  Starting subtest: basic
    2022-10-28T14:42:39.262570  Testing: basic 1 connector combinations
    2022-10-28T14:42:39.366732  <14>[   55.835025] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-10-28T14:42:39.371158  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
