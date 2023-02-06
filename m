Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5939A68C1E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Feb 2023 16:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjBFPmJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Feb 2023 10:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjBFPlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2023 10:41:52 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3252BF20
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Feb 2023 07:40:58 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id hv11-20020a17090ae40b00b002307b580d7eso8118176pjb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Feb 2023 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8BK7+mlENqld79u+EoVHLasgu7KPW3w85LY+nWbG1LE=;
        b=Vs32uc/iguc2rH7BMSjf5MudFEFqvgo9YY9IuQJeNh+cyozlvQGJ5qrGlLP7zHHYrA
         iblS6iUpNqSz3mLNT2icCkwmqAHQQjD9XkSoDZsEISRjlPjnbO/TLZGqWfQ/OxLilrC+
         qrl23rgJ4jWE+V8F4W8T8QT4pwWJrNq6sxz3NOGLVWbfRjEV2ibImxxF4/OBCrKpwLcQ
         bC0jVB8u0L/eqPoPCKYcpNDtq2Z0BRsuJ8DpzAoi6vp1SieRpbaTNxYhPTzc2qptGIol
         T0RYzsvjkrlskrWUFAEeMrL4TrTz5r4OdTrkUqWb7S+V/618vfL0+/d77ystxXp/DvtS
         amrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BK7+mlENqld79u+EoVHLasgu7KPW3w85LY+nWbG1LE=;
        b=JnwNvBLFRIDX2BVVXRhJahvngbAjmSABNDZ9Sr5ThowLJhjQo4aBA4S+ZO3wPLUoBz
         MLtKzf1lQxe9zaVUM4PgPeAtR982lf70nhi24cWSIHAPpI+Cbawm0yqTPHapQy/fprY4
         xdfbymwqFoqQXq9BO7bua9y94oUyHkTSWyrqwG7dxfEkkmm0fN1knoJxNXcbBUvHQPaY
         cRIG6D4P9p+/RIayudBwnuwna0ganJnzaJIV/2biazMkXKddAzf8cU2d8dp3RCWsfrXI
         lNaxE2+Nt9AJL35yXT5Ls7H0R5ccRJ0mTOcylwbk9YJtE/1jiPAltfh+fjgt/zuqCvFl
         GWxA==
X-Gm-Message-State: AO0yUKUAoRn8Mk3A0zPJZT5fL3YwoS3YAHCH1YTgTQtub09w9lMigobt
        7E5jYaV+Fv4hS06K5JbiTORQtLP4q4JlAduG6m8=
X-Google-Smtp-Source: AK7set/MX9X9lKYRQ/U52U+32dKhNhYNuQnkJQWP8kApCACpF1ATBbuygw21TwXsrV0pM8Tymp2Xqg==
X-Received: by 2002:a17:90b:4b4b:b0:22b:f9c2:d1a0 with SMTP id mi11-20020a17090b4b4b00b0022bf9c2d1a0mr161167pjb.6.1675697999349;
        Mon, 06 Feb 2023 07:39:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090a284200b00213c7cf21c0sm6238927pjf.5.2023.02.06.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:39:58 -0800 (PST)
Message-ID: <63e11f4e.170a0220.ed727.9c02@mx.google.com>
Date:   Mon, 06 Feb 2023 07:39:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-02-06-v6.2-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2023-02-06-v6.2-rc7)
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

renesas/master igt-kms-rockchip: 2 runs, 10 regressions (renesas-devel-2023=
-02-06-v6.2-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-06-v6.2-rc7/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-06-v6.2-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3254c086a1ff58a54773d12eb58e0210601e352f

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  0e2c7d05712d65903a9b77fb9f960ddff43bac64
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  ec87a6a636b9337ac9c8fec57350812bcb48fc09 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63e10d08f3c7c44336915f7d

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230127.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63e10d08f3c7c4433691600a
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:43.444597  <6>[   68.517582] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:43.449772  <14>[   68.524443] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:43.463864  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   68.530540] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-02-06T14:19:43.464432  )

    2023-02-06T14:19:43.468636  Starting subtest: pipe-A-wait-forked-busy

    2023-02-06T14:19:43.556951  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-02-06T14:19:43.811351  (kms_vblank:610) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-06T14:19:43.821390  (kms_vblank:609) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-06T14:19:43.831196  (kms_vblank:612) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-06T14:19:43.841876  (kms_vblank:608) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (111 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63e10d08f3c7c4433691600c
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:42.123960  <8>[   67.193922] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>

    2023-02-06T14:19:42.157794  <6>[   67.230371] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:42.163255  <14>[   67.237503] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:42.176352  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   67.243904] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-02-06T14:19:42.177181  )

    2023-02-06T14:19:42.180519  Starting subtest: pipe-A-wait-busy

    2023-02-06T14:19:42.272717  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-02-06T14:19:42.529462  (kms_vblank:601) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-06T14:19:42.536548  (kms_vblank:601) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-06T14:19:42.542091  (kms_vblank:601) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63e10d08f3c7c4433691600e
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:40.862277  <6>[   65.934312] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:40.867030  <14>[   65.941465] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:40.881200  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   65.948068] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-02-06T14:19:40.881881  )

    2023-02-06T14:19:40.885077  Starting subtest: pipe-A-wait-forked

    2023-02-06T14:19:40.973126  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-02-06T14:19:41.229589  (kms_vblank:594) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-06T14:19:41.239979  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-06T14:19:41.251028  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:

    2023-02-06T14:19:41.257246  (kms_vblank:594) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (111 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63e10d08f3c7c44336916010
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:39.505800  ay->pipes[pipe].enabled)

    2023-02-06T14:19:39.509059  Pipe E does not exist or not enabled

    2023-02-06T14:19:39.517696  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2361:

    2023-02-06T14:19:39.525753  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-02-06T14:19:39.534590  Pipe F does not exist or not<6>[   64.60298=
5] Console: switching to colour dummy device 80x25

    2023-02-06T14:19:39.535625   enabled

    2023-02-06T14:19:39.540241  <14>[   64.613911] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:39.553918  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   64.620611] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle

    2023-02-06T14:19:39.554231  )

    2023-02-06T14:19:39.557620  Starting subtest: pipe-A-wait-idle
 =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63e10d08f3c7c44336916012
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:38.226830  <8>[   63.295118] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>

    2023-02-06T14:19:38.260040  <6>[   63.332018] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:38.264747  <14>[   63.339157] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:38.279008  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   63.345490] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-02-06T14:19:38.279972  )

    2023-02-06T14:19:38.283862  Starting subtest: pipe-A-query-forked-busy

    2023-02-06T14:19:38.374708  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-02-06T14:19:38.663184  (kms_vblank:573) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-06T14:19:38.673084  (kms_vblank:575) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-06T14:19:38.683456  (kms_vblank:572) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63e10d08f3c7c44336916014
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:37.010703  Pipe F does not exist or<8>[   62.080041] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-hang RESULT=3Dskip>

    2023-02-06T14:19:37.012679   not enabled

    2023-02-06T14:19:37.039051  <6>[   62.111347] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:37.043815  <14>[   62.118049] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:37.057562  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   62.123790] [IGT] kms_vblank: starting subtest =
pipe-A-query-busy

    2023-02-06T14:19:37.058387  )

    2023-02-06T14:19:37.061327  Starting subtest: pipe-A-query-busy

    2023-02-06T14:19:37.140339  Beginning pipe-A-query-busy on pipe A, conn=
ector eDP-1

    2023-02-06T14:19:37.478731  (kms_vblank:565) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-06T14:19:37.486116  (kms_vblank:565) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (82 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63e10d08f3c7c44336916016
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:35.632747  | !display->pipes[pipe].enabled)

    2023-02-06T14:19:35.636750  Pipe F does not exist or not enabled

    2023-02-06T14:19:35.664913  <6>[   60.737281] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:35.670337  <14>[   60.744411] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:35.684075  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   60.750729] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-02-06T14:19:35.684617  )

    2023-02-06T14:19:35.688002  Starting subtest: pipe-A-query-forked

    2023-02-06T14:19:35.774593  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-02-06T14:19:36.146777  (kms_vblank:553) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-06T14:19:36.156635  (kms_vblank:555) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63e10d08f3c7c44336916018
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:34.335698  <8>[   59.405589] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>

    2023-02-06T14:19:34.368612  <6>[   59.441036] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:34.373351  <14>[   59.447650] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:34.387017  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   59.453419] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-02-06T14:19:34.387517  )

    2023-02-06T14:19:34.390694  Starting subtest: pipe-A-query-idle

    2023-02-06T14:19:34.474445  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-02-06T14:19:34.897763  (kms_vblank:546) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-06T14:19:34.904289  (kms_vblank:546) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-06T14:19:34.910739  (kms_vblank:546) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63e10d08f3c7c44336916019
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:33.018072  <8>[   58.087953] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>

    2023-02-06T14:19:33.049482  <6>[   58.121602] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:33.053996  <14>[   58.128213] [IGT] kms_vblank: execut=
ing

    2023-02-06T14:19:33.068297  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   58.134008] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-02-06T14:19:33.069197  )

    2023-02-06T14:19:33.072306  Starting subtest: pipe-A-accuracy-idle

    2023-02-06T14:19:33.158552  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-02-06T14:19:33.646811  (kms_vblank:543) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:

    2023-02-06T14:19:33.653398  (kms_vblank:543) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-06T14:19:33.659431  (kms_vblank:543) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (81 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3e10d08f3c7c44336916022
        failing since 233 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-06T14:19:28.940123  <8>[   54.008902] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>

    2023-02-06T14:19:28.945987  <8>[   54.020207] <LAVA_SIGNAL_TESTSET STOP>

    2023-02-06T14:19:28.990393  <8>[   54.063178] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-02-06T14:19:29.026787  <6>[   54.098960] Console: switching to col=
our dummy device 80x25

    2023-02-06T14:19:29.032072  <14>[   54.105634] [IGT] kms_setmode: execu=
ting

    2023-02-06T14:19:29.044419  IGT-Version: 1.27.1-gec87a6a (aarch64) (Lin=
ux: 6.2.0-rc7 aarch64<14>[   54.111104] [IGT] kms_setmode: starting subtest=
 basic

    2023-02-06T14:19:29.045254  )

    2023-02-06T14:19:29.046770  Starting subtest: basic

    2023-02-06T14:19:29.050793  Testing: basic 1 connector combinations

    2023-02-06T14:19:29.149845  <14>[   54.221155] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
 =

    ... (78 line(s) more)  =

 =20
