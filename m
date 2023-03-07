Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54E116AF873
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 23:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjCGWT6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 17:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbjCGWTs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 17:19:48 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB74F955
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 14:19:11 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id h8so15699033plf.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2023 14:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678227550;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qrYoi85owe0YV7nq0hK+Lg7oLC4mn7w6OMgkQGywT9A=;
        b=a4cSXX02glvKIgpQ1sMwB+BGz/QCRRF9AkdRTkeduLBR2vWPVe7uZEy5SEHdH/NUq1
         uGTVAF/r8tHsQI/UH4YQfOPsZX7aBT6h8fp1oGXXHTFcJ6xZdy6AKXFsKGz4hcpEXiJs
         jnHkKpg1noArBU+y0UnLEORXREuXBlDxFzBG8Z0RZDezq2EtlUYXmv10q50amHj7xe2U
         kJx2Rldl+w5Agy4b7Us+zUdlvdYC9YbhS3bCmMgLE6diQKdUivwKuQyCKkzaN5R/2X9a
         bsegls/2NH2PNm7F1dU8zAqKI/JiF0Cjl0d+g11MmfKC7zw9H/JwIpxgOfg8stYlR1Jn
         L+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678227550;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrYoi85owe0YV7nq0hK+Lg7oLC4mn7w6OMgkQGywT9A=;
        b=Ux6xaYzQy+H8opiJF9YxCakcrrS0mhyBYpIZD8eBcpiBV0Ij1HQaRm8QzalPVxsV9G
         pKklRfaW8Ad08lSHWeXIGRpXAcDYSSnV1bVcZhxKjCFBBnnKYU5p4kvWr4s8Vt8YgMSC
         OxvlmICRyNsziyq9ZHFUS4QwXBf4VntdpsQb7aIYL/2mZxGXm61rt8B5s7K/otAxyyhy
         STOTbkBstXEE6kuGac42WGR2sElE8mrRfqm3m1S5QLuzO81xWtl66Qh+Q6meCAAI9ElF
         lJrDqO45lZQaswtc8dPegqfDQEQGZCSbpY7d1lKnSb52QmM6wX4F4Gq8yzoe3/MnytKw
         mjrw==
X-Gm-Message-State: AO0yUKVVrmbavBTHURwNFpraX87aTlL7uZmFgUQB+bzy4hAlLNaBje7/
        cB9cDHkNC/PHpGXgZz6vq1VkUGZ/j47upKxyu7lMMQGu
X-Google-Smtp-Source: AK7set+Pz+39d6AasspiBFQhSslwAzd84jVHn9WYqh5v5uNcUfkJU2Q/TP8jgfcquzEVb+cMqeIhyg==
X-Received: by 2002:a05:6a20:49aa:b0:cd:53b0:960d with SMTP id fs42-20020a056a2049aa00b000cd53b0960dmr12834402pzb.10.1678227550277;
        Tue, 07 Mar 2023 14:19:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x20-20020a62fb14000000b005d6fcd8f9desm8555844pfm.94.2023.03.07.14.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:19:09 -0800 (PST)
Message-ID: <6407b85d.620a0220.fb08c.f7e0@mx.google.com>
Date:   Tue, 07 Mar 2023 14:19:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-07-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-03-07-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-03-07-v6.3-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-07-v6.3-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-07-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      525eb92e46b94fe4a641aa2f6cc0481874cff436

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  332809f3ee19f07abc03b62d5892fae51b9d9902
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  b6b1ceb4fc4d8f83a9540e4628a6c2648514bb19 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6407a643133879509c8c863b

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230303.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6407a643133879509c8c86c8
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:41.209246  <6>[   68.525162] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:41.214561  <14>[   68.532274] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:41.228886  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   68.539045] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-03-07T20:59:41.229633  )

    2023-03-07T20:59:41.233465  Starting subtest: pipe-A-wait-forked-busy

    2023-03-07T20:59:41.314416  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-03-07T20:59:41.571045  (kms_vblank:610) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-07T20:59:41.581590  (kms_vblank:608) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-07T20:59:41.591298  (kms_vblank:607) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-07T20:59:41.601968  (kms_vblank:611) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6407a643133879509c8c86ca
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:39.875891  <8>[   67.189203] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>

    2023-03-07T20:59:39.911387  <6>[   67.227431] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:39.916701  <14>[   67.234128] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:39.930288  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   67.240658] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-03-07T20:59:39.930881  )

    2023-03-07T20:59:39.934161  Starting subtest: pipe-A-wait-busy

    2023-03-07T20:59:40.014463  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-03-07T20:59:40.270655  (kms_vblank:599) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-07T20:59:40.278481  (kms_vblank:599) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-07T20:59:40.284262  (kms_vblank:599) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6407a643133879509c8c86cc
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:38.572120  <8>[   65.882701] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>

    2023-03-07T20:59:38.605763  <6>[   65.921550] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:38.611238  <14>[   65.928224] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:38.624041  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   65.934655] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-03-07T20:59:38.624338  )

    2023-03-07T20:59:38.628436  Starting subtest: pipe-A-wait-forked

    2023-03-07T20:59:38.715226  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-03-07T20:59:38.971306  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-07T20:59:38.980840  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-07T20:59:38.991518  (kms_vblank:593) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:
 =

    ... (117 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6407a643133879509c8c86ce
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:37.235916  Pipe<8>[   64.541872] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>

    2023-03-07T20:59:37.238248   F does not exist or not enabled

    2023-03-07T20:59:37.278410  <6>[   64.594212] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:37.283278  <14>[   64.600877] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:37.296700  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   64.607307] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle

    2023-03-07T20:59:37.296994  )

    2023-03-07T20:59:37.300462  Starting subtest: pipe-A-wait-idle

    2023-03-07T20:59:37.381395  Beginning pipe-A-wait-idle on pipe A, conne=
ctor eDP-1

    2023-03-07T20:59:37.654703  (kms_vblank:581) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-07T20:59:37.661994  (kms_vblank:581) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6407a643133879509c8c86d0
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:35.922405  Pipe F does not exist or not e<8>[   63.232=
967] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Ds=
kip>

    2023-03-07T20:59:35.923059  nabled

    2023-03-07T20:59:35.958041  <6>[   63.273726] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:35.963280  <14>[   63.280373] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:35.976806  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   63.286927] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-03-07T20:59:35.977091  )

    2023-03-07T20:59:35.981706  Starting subtest: pipe-A-query-forked-busy

    2023-03-07T20:59:36.065949  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-03-07T20:59:36.386824  (kms_vblank:572) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-07T20:59:36.395076  (kms_vblank:572) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6407a643133879509c8c86d2
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:34.713167  <6>[   62.028986] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:34.718354  <14>[   62.036093] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:34.731995  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   62.042648] [IGT] kms_vblank: starting subtest =
pipe-A-query-busy

    2023-03-07T20:59:34.732288  )

    2023-03-07T20:59:34.735962  Starting subtest: pipe-A-query-busy

    2023-03-07T20:59:34.815518  Beginning pipe-A-query-busy on pipe A, conn=
ector eDP-1

    2023-03-07T20:59:35.171522  (kms_vblank:563) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-07T20:59:35.178220  (kms_vblank:563) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-07T20:59:35.184076  (kms_vblank:563) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-07T20:59:35.188627  (kms_vblank:563) CRITICAL: error: -22 !=3D 0
 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6407a643133879509c8c86d4
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:33.315992   not exist or not enabled

    2023-03-07T20:59:33.355163  <6>[   60.670077] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:33.359669  <14>[   60.676765] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:33.374028  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   60.683530] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-03-07T20:59:33.374487  )

    2023-03-07T20:59:33.378304  Starting subtest: pipe-A-query-forked

    2023-03-07T20:59:33.449749  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-03-07T20:59:33.822393  (kms_vblank:556) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-07T20:59:33.832671  (kms_vblank:554) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-07T20:59:33.842813  (kms_vblank:555) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6407a643133879509c8c86d6
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:32.040361  <8>[   59.353136] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>

    2023-03-07T20:59:32.072286  <6>[   59.388044] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:32.077200  <14>[   59.394689] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:32.090725  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   59.400608] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-03-07T20:59:32.091010  )

    2023-03-07T20:59:32.094848  Starting subtest: pipe-A-query-idle

    2023-03-07T20:59:32.166871  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-03-07T20:59:32.571595  (kms_vblank:545) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-07T20:59:32.578124  (kms_vblank:545) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-07T20:59:32.585037  (kms_vblank:545) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6407a643133879509c8c86d7
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:30.773643  <6>[   58.088909] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:30.778478  <14>[   58.095532] [IGT] kms_vblank: execut=
ing

    2023-03-07T20:59:30.791793  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   58.101441] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-03-07T20:59:30.792951  )

    2023-03-07T20:59:30.796395  Starting subtest: pipe-A-accuracy-idle

    2023-03-07T20:59:30.867537  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-03-07T20:59:31.354667  (kms_vblank:541) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:254:

    2023-03-07T20:59:31.361584  (kms_vblank:541) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-07T20:59:31.368103  (kms_vblank:541) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-07T20:59:31.373224  (kms_vblank:541) CRITICAL: error: -22 !=3D 0
 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
407a643133879509c8c86e0
        failing since 263 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-07T20:59:26.751485  <8>[   54.069141] <LAVA_SIGNAL_TESTSET STOP>

    2023-03-07T20:59:26.789251  <8>[   54.105328] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-03-07T20:59:26.827187  <6>[   54.142789] Console: switching to col=
our dummy device 80x25

    2023-03-07T20:59:26.832625  <14>[   54.149547] [IGT] kms_setmode: execu=
ting

    2023-03-07T20:59:26.845267  IGT-Version: 1.27.1-gb6b1ceb (aarch64) (Lin=
ux: 6.3.0-rc1 aarch64<14>[   54.155125] [IGT] kms_setmode: starting subtest=
 basic

    2023-03-07T20:59:26.845807  )

    2023-03-07T20:59:26.847748  Starting subtest: basic

    2023-03-07T20:59:26.851900  Testing: basic 1 connector combinations

    2023-03-07T20:59:26.968103  <14>[   54.281878] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-03-07T20:59:26.972487  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
