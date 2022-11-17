Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C517B62E998
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 00:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiKQX3W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 18:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234710AbiKQX3V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 18:29:21 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFCA76153
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 15:29:19 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so6773620pjc.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 15:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AIBQMaKwGq8phdHZ7PUP3p02cVLOamdMzjwglHMaOdc=;
        b=1l75HjhU5rI8XWiRBNqhenNB/wrmWKo9qWHz22cqK7YDQoUFoYrO751NbsLVIvP1+d
         67H6no8kNknIdjTHdtVjFODtA+Y9K+ZLWl1/9N3k2kLxS3QuaLGykiG/TU0JHCJmLQ0i
         q7+Z1PPv3b35rByO5cH618kIBYv7KM2RAMAZ1awKG/oTFtMQMtpLK4wxbUq1CxntWamn
         yRA41IbXYAdcD5aPPjZ5cvnphKwpxwMzwhqoF/jB58CCSRH/IB8B6L2fZG+o14wLCZTj
         zLkDYOjt8lynNWPJk3oHBVtJ4KG58EX0W6A9C/ti2pGXWwBeblxwEbHnu3bpJAH5fcLC
         fs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIBQMaKwGq8phdHZ7PUP3p02cVLOamdMzjwglHMaOdc=;
        b=6trD23LEAyv2e/HQfIwCIrIlE8KU9KPorz2iNWHcMeCxX4ADP8/BCIPKRmeFFRZ7C5
         65zQ5qNKz1SbgpZBIvDhNZQLqQ4vbhpDS61s4tZYXYMbt3QNa0evuE2bXzRHYCAaWQmy
         wV7BqjAX7c8fu82SCkEH23EHm2YxaMJmBStjSJzwIKM3fQ+yfgXcTIbf1PDSMxWqmhnY
         EOFCOXMIAbktfwlIoKd8a1Ep/4A0J7QwpLCVpyvAWuTfJ/2k2U08XonFTVBFH4ZhhNPN
         c/vy+SYC3rKVr7wFINKEBB0FI+WpATQVC0cxZbA2K502xhVjM2ls9uP9fEfOIxIfj0sj
         ZnWA==
X-Gm-Message-State: ANoB5plOstsSlYiemNcadrTUMJIS+DLXTnlAXpKFysj/ipmac7VaSMgO
        hjH8p9S864lb6MlK2mhas7TvPj3fDtjC9wBzNgQ=
X-Google-Smtp-Source: AA0mqf4x04K/J7r731HkCT6ZY/Hjz2yIsavpmVe9uzkDzo39VeuzBId2E4GM/KDXx58vQ/ht/ofd7w==
X-Received: by 2002:a17:90b:4b4a:b0:214:6fc:31cf with SMTP id mi10-20020a17090b4b4a00b0021406fc31cfmr10668794pjb.21.1668727758878;
        Thu, 17 Nov 2022 15:29:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z14-20020a65610e000000b004768b74f208sm1623395pgu.4.2022.11.17.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 15:29:18 -0800 (PST)
Message-ID: <6376c3ce.650a0220.a8cc4.2b3b@mx.google.com>
Date:   Thu, 17 Nov 2022 15:29:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-11-17-v6.1-rc5)
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
-11-17-v6.1-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-17-v6.1-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      882ccb9771f9e9985a9ada17c5e35b4863258378

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


  Details:     https://kernelci.org/test/plan/id/6376ad63dbb46f9b042abd30

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221107.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6376ad63dbb46f9b042abdbd
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:54.450803  Test requirement: !(pipe >=3D display->n<8>=
[   72.864534] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-busy-hang R=
ESULT=3Dskip>
    2022-11-17T21:51:54.454359  _pipes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:54.457814  Pipe E does not exist or not enabled
    2022-11-17T21:51:54.466807  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:54.473541  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:54.474177  =

    2022-11-17T21:51:54.477770  Pipe F does not exist or not enabled
    2022-11-17T21:51:54.523589  <6>[   72.943176] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:54.528332  <14>[   72.949865] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:54.534960  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64) =

    ... (150 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6376ad63dbb46f9b042abdbf
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:53.150923  Test requirement: !(pipe >=3D display->n_pi=
pes || !display<8>[   71.562790] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-=
A-wait-forked-hang RESULT=3Dskip>
    2022-11-17T21:51:53.152441  ->pipes[pipe].enabled)
    2022-11-17T21:51:53.157233  Pipe E does not exist or not enabled
    2022-11-17T21:51:53.164824  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:53.172884  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:53.173182  =

    2022-11-17T21:51:53.176984  Pipe F does not exist or not enabled
    2022-11-17T21:51:53.222646  <6>[   71.641766] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:53.227304  <14>[   71.648965] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:53.228068   =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6376ad63dbb46f9b042abdc1
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:51.875053  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:51.877324  Pipe E does not exist or not enabled
    2022-11-17T21:51:51.877589  =

    2022-11-17T21:51:51.885595  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:51.893487  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:51.897126  Pipe F does not exist or not enabled
    2022-11-17T21:51:51.938356  <6>[   70.357917] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:51.943391  <14>[   70.364585] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:51.943661  =

    2022-11-17T21:51:51.949934  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64) =

    ... (144 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6376ad63dbb46f9b042abdc3
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:50.558712  ipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:50.565483  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:50.565768  =

    2022-11-17T21:51:50.568965  Pipe E does not exist or not enabled
    2022-11-17T21:51:50.577577  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:50.586080  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:50.588608  Pipe F does not exist or not enabled
    2022-11-17T21:51:50.626585  <6>[   69.045949] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:50.631629  <14>[   69.052620] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:50.631901   =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6376ad63dbb46f9b042abdc5
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:49.258251  le ../lib/igt_kms.c:2326:
    2022-11-17T21:51:49.258872  =

    2022-11-17T21:51:49.266639  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:49.269939  Pipe E does not exist or not enabled
    2022-11-17T21:51:49.278281  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:49.287897  Test requirement: !(pipe >=3D<6>[   67.7023=
63] Console: switching to colour dummy device 80x25
    2022-11-17T21:51:49.292010  <14>[   67.713481] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:49.297746   display->n_pipes || !display->pipes[pipe].=
enabled)
    2022-11-17T21:51:49.298019  =

    2022-11-17T21:51:49.306791  Pipe F does<14>[   67.719175] [IGT] kms_vbl=
ank: starting subtest pipe-A-query-forked-busy =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6376ad63dbb46f9b042abdc7
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:48.058391  rement not met in function igt_require_pipe=
, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:48.065567  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:48.065841  =

    2022-11-17T21:51:48.070065  Pipe E does not exist or not enabled
    2022-11-17T21:51:48.077740  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:48.078288  =

    2022-11-17T21:51:48.085909  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:48.089985  Pipe F does not exist or not enabled
    2022-11-17T21:51:48.121488  <6>[   66.540782] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:48.126701  <14>[   66.547899] [IGT] kms_vblank: execut=
ing =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6376ad63dbb46f9b042abdc9
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:46.676014  nt not met in function igt_require_pipe, fi=
le ../lib/igt_kms.c:2326:
    2022-11-17T21:51:46.684135  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:46.687770  Pipe E does not exist or not enabled
    2022-11-17T21:51:46.695969  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2326:
    2022-11-17T21:51:46.703716  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-17T21:51:46.707055  Pipe F does not exist or not enabled
    2022-11-17T21:51:46.742484  <6>[   65.161418] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:46.747048  <14>[   65.168289] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:46.753697  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-17T21:51:46.761223  <14>[   65.174744] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6376ad63dbb46f9b042abdcb
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:45.452430  <6>[   63.871763] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:45.457644  <14>[   63.878903] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:45.465114  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-17T21:51:45.470941  <14>[   63.885623] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-11-17T21:51:45.471453  =

    2022-11-17T21:51:45.471707  =

    2022-11-17T21:51:45.476087  Starting subtest: pipe-A-query-idle
    2022-11-17T21:51:45.570679  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-11-17T21:51:45.959983  (kms_vblank:589) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-11-17T21:51:45.966272  (kms_vblank:589) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (94 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6376ad63dbb46f9b042abdcc
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:44.151641  =

    2022-11-17T21:51:44.177649  <6>[   62.596964] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:44.182398  <14>[   62.603627] [IGT] kms_vblank: execut=
ing
    2022-11-17T21:51:44.189651  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-17T21:51:44.196429  <14>[   62.609391] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-11-17T21:51:44.196698  =

    2022-11-17T21:51:44.196781  =

    2022-11-17T21:51:44.200843  Starting subtest: pipe-A-accuracy-idle
    2022-11-17T21:51:44.287220  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-11-17T21:51:44.708586  (kms_vblank:586) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255: =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
376ad63dbb46f9b042abdd5
        failing since 153 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-17T21:51:40.163310  <8>[   58.584249] <LAVA_SIGNAL_TESTSET STOP>
    2022-11-17T21:51:40.241027  <8>[   58.660356] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-11-17T21:51:40.312863  <6>[   58.732328] Console: switching to col=
our dummy device 80x25
    2022-11-17T21:51:40.313227  =

    2022-11-17T21:51:40.318244  <14>[   58.739149] [IGT] kms_setmode: execu=
ting
    2022-11-17T21:51:40.324866  IGT-Version: 1.26-gc58d96d (aarch64) (Linux=
: 6.1.0-rc5 aarch64)
    2022-11-17T21:51:40.331411  <14>[   58.745051] [IGT] kms_setmode: start=
ing subtest basic
    2022-11-17T21:51:40.331631  =

    2022-11-17T21:51:40.333779  Starting subtest: basic
    2022-11-17T21:51:40.337649  Testing: basic 1 connector combinations =

    ... (96 line(s) more)  =

 =20
