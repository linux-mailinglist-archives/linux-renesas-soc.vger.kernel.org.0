Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF7F62FD58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 19:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242444AbiKRS5m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 13:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242646AbiKRS50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 13:57:26 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F3C9E09B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 10:55:09 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id n17so5731658pgh.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 10:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SIbQMqLAIjIBfGBUk167psAhhbOCfOpDHNaJwDShed4=;
        b=Y+0DT2nGV/4JJqTcQkf0c4tGpRm+8Mmx90RYlpD7DdzGDDfNdlzicq2Xh1tu8Ti0h9
         A+P71mAYQfM1X1V7pslI6KXYpF6RnfLmIuHRoVUVIPJ8GawUr7vhI7TdMycDNww6AprN
         2DchSDHNNyTrMEq4EY9ye6tYYPt6Eq4RTAI3catGAtS0ZU0XchU+ULTlDpHstMH99Vkv
         0se6fvQUuLoR4uIIViOEWcp1FI5rjnimFEy4vqE4++jFgTcNcg2ubpLLliGTeziOOfEf
         gTP7ascsvewCqNXbk4R/8hOIHzAd6Mtp/dbVNDQCoLv+eEI1zc8CvaIKmELbbfMzdHu1
         eipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIbQMqLAIjIBfGBUk167psAhhbOCfOpDHNaJwDShed4=;
        b=2AKf6FB8dok6ZTAEHPpwBaJ3w+NtkY1TRYhJP0dC6kpYBxZU1XJmPtA3tXWo8LE5EX
         8CYc4yhTaxiGadSpPAw6M/hw4z+c74neZ4rE38cybtfd5lM86U5vtQei3Q9VBtxEaBbR
         GZhRHD0cDpsGaeFb2Senmx40Wl6TLFXGOXvGKrzAMmFCFr5+tZp/YT6wXsixvD8MXJnP
         v2nP1WATinXhWrN1tsrouQvdDfyehI2WvGO/NMGjdAZqp0RgdiazORUViJE/4pjobprh
         PEUhlvp1Fi3J6O6unxS/f5MqRynkDTclz5jHca5xMCAVkCF1F2/ngLz+2ndhymmczOOC
         KCOw==
X-Gm-Message-State: ANoB5pnOHUYPHK2R7A0hU6y2kSbZ+X1120r0a7Uj5yxRYIWP2XVHk7xJ
        RaFGfoJLipgHZojk9UfPgOjIexqph3wPHca+X6I=
X-Google-Smtp-Source: AA0mqf66Nzu0GNWP0jcBIjEoiArFhNIxTANQH2IAPnyZCWnxQkC3gnGskSA2FXLxYpDhC6iHmnCjcQ==
X-Received: by 2002:a63:491a:0:b0:43c:c4cf:6682 with SMTP id w26-20020a63491a000000b0043cc4cf6682mr7745373pga.49.1668797708579;
        Fri, 18 Nov 2022 10:55:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090ab90100b001f8c532b93dsm3181404pjr.15.2022.11.18.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 10:55:08 -0800 (PST)
Message-ID: <6377d50c.170a0220.39883.59be@mx.google.com>
Date:   Fri, 18 Nov 2022 10:55:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967)
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
-11-17-v6.1-rc5-5-gf68db0d22967)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f68db0d2296736d50da811c3d26889e9b803eb83

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  b9ca37b3134861048986b75896c0915cbf2e97f9
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  c58d96d0fe237474b074e3472ce09c57c830d5de =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6377c8c70c378693fd2abd14

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/igt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/igt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221107.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6377c8c70c378693fd2abda1
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:28.721992  6:
    2022-11-18T18:00:28.729621  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:28.733011  Pipe E does not exist or not enabled
    2022-11-18T18:00:28.742129  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:28.749751  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:28.753568  Pipe F does not exist or not enabled
    2022-11-18T18:00:28.794294  <6>[   72.178670] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:28.799475  <14>[   72.185355] [IGT] kms_vblank: execut=
ing
    2022-11-18T18:00:28.806315  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-18T18:00:28.814195  <14>[   72.191768] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-forked-busy =

    ... (156 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6377c8c70c378693fd2abda3
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:27.509894  ->pipes[pipe].enabled)
    2022-11-18T18:00:27.513104  Pipe E does not exist or not enabled
    2022-11-18T18:00:27.521065  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:27.529327  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:27.533284  Pipe F does not exist or not enabled
    2022-11-18T18:00:27.578545  <6>[   70.962126] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:27.582666  <14>[   70.968806] [IGT] kms_vblank: execut=
ing
    2022-11-18T18:00:27.589272  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-18T18:00:27.596840  <14>[   70.975262] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-busy
    2022-11-18T18:00:27.596932   =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6377c8c70c378693fd2abda5
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:26.172128  Test requirement<8>[   69.549043] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2022-11-18T18:00:26.178274   not met in function igt_require_pipe, file=
 ../lib/igt_kms.c:2326:
    2022-11-18T18:00:26.186601  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:26.189498  Pipe E does not exist or not enabled
    2022-11-18T18:00:26.189812  =

    2022-11-18T18:00:26.198484  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:26.206286  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:26.210202  Pipe F does not exist or not enabled
    2022-11-18T18:00:26.245890  <6>[   69.629599] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:26.250924  <14>[   69.636282] [IGT] kms_vblank: execut=
ing =

    ... (138 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6377c8c70c378693fd2abda7
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:24.929248  ib/igt_kms.c:2326:
    2022-11-18T18:00:24.937636  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:24.941483  Pipe E does not exist or not enabled
    2022-11-18T18:00:24.948884  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:24.949341  =

    2022-11-18T18:00:24.957253  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:24.960235  Pipe F does not exist or not enabled
    2022-11-18T18:00:24.998139  <6>[   68.382175] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:25.004002  <14>[   68.389240] [IGT] kms_vblank: execut=
ing
    2022-11-18T18:00:25.010026  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64) =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6377c8c70c378693fd2abda9
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:23.612046  ].enabled)
    2022-11-18T18:00:23.612309  =

    2022-11-18T18:00:23.615473  Pipe D does not exist or not enabled
    2022-11-18T18:00:23.623549  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:23.631664  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:23.631940  =

    2022-11-18T18:00:23.635557  Pipe E does not exist or not enabled
    2022-11-18T18:00:23.643541  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:23.650706  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:23.651241   =

    ... (143 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6377c8c70c378693fd2abdab
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:21.090828  Test requireme<8>[   64.468919] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang RESULT=3Dskip>
    2022-11-18T18:00:21.097409  nt not met in function igt_require_pipe, fi=
le ../lib/igt_kms.c:2326:
    2022-11-18T18:00:21.106015  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:21.109418  Pipe E does not exist or not enabled
    2022-11-18T18:00:21.117152  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:21.125276  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:21.129149  Pipe F does not exist or not enabled
    2022-11-18T18:00:21.162643  <6>[   64.545997] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:21.167109  <14>[   64.552681] [IGT] kms_vblank: execut=
ing
    2022-11-18T18:00:21.173439  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64) =

    ... (140 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6377c8c70c378693fd2abdad
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:19.899898  <6>[   63.283545] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:19.904844  <14>[   63.290656] [IGT] kms_vblank: execut=
ing
    2022-11-18T18:00:19.911640  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-18T18:00:19.918418  <14>[   63.297397] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-11-18T18:00:19.918911  =

    2022-11-18T18:00:19.922903  Starting subtest: pipe-A-query-idle
    2022-11-18T18:00:20.009449  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-11-18T18:00:20.382211  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-11-18T18:00:20.382543  =

    2022-11-18T18:00:20.389091  (kms_vblank:592) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (97 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6377c8c70c378693fd2abdae
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:18.623219  <6>[   62.006690] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:18.628292  <14>[   62.013884] [IGT] kms_vblank: execut=
ing
    2022-11-18T18:00:18.635011  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-18T18:00:18.642336  <14>[   62.020696] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-11-18T18:00:18.642427  =

    2022-11-18T18:00:18.646158  Starting subtest: pipe-A-accuracy-idle
    2022-11-18T18:00:18.646838  =

    2022-11-18T18:00:18.743332  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-11-18T18:00:19.165769  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-11-18T18:00:19.166077   =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6377c8c70c378693fd2abdb1
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:22.440376  Test requi<8>[   65.817871] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Dpipe-A-query-forked-hang RESULT=3Dskip>
    2022-11-18T18:00:22.440648  =

    2022-11-18T18:00:22.447643  rement not met in function igt_require_pipe=
, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:22.447922  =

    2022-11-18T18:00:22.455714  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:22.456387  =

    2022-11-18T18:00:22.459645  Pipe E does not exist or not enabled
    2022-11-18T18:00:22.467666  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-18T18:00:22.475740  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-18T18:00:22.479113  Pipe F does not exist or not enabled =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
377c8c70c378693fd2abdb9
        failing since 154 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-18T18:00:14.298481  <8>[   57.684377] <LAVA_SIGNAL_TESTSET STOP>
    2022-11-18T18:00:14.376458  <8>[   57.760943] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-11-18T18:00:14.376769  =

    2022-11-18T18:00:14.448812  <6>[   57.832365] Console: switching to col=
our dummy device 80x25
    2022-11-18T18:00:14.449184  =

    2022-11-18T18:00:14.454027  <14>[   57.839233] [IGT] kms_setmode: execu=
ting
    2022-11-18T18:00:14.461156  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-18T18:00:14.467090  <14>[   57.845408] [IGT] kms_setmode: start=
ing subtest basic
    2022-11-18T18:00:14.467369  =

    2022-11-18T18:00:14.470405  Starting subtest: basic =

    ... (102 line(s) more)  =

 =20
