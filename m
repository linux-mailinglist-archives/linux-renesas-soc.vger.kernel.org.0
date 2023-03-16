Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737AD6BD899
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 20:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjCPTHG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 15:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjCPTHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 15:07:04 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7229EDB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 12:06:39 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso6359586pjc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678993599;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9VWP9U0/lBbfIDAkWAT/5nb8pOIpUWl/nzYodPuR5vw=;
        b=4z001jyGyind6uZVFmy+aF3zDuGplri2NyE8HR0Cdudh2Zjy/iDVWT9ula4yTGrp0A
         KrvirURNwJM40vJXOWo91JZMUpfs8HYzLybIFQGcA7ehxmTd8SquLMNit37Z3R658Wv9
         2K9aN+Z4xVrXH2cuArIN0XAoi4RzdI6hmnrnJbAy0shdKM0NpKrZkC9ATVbgP7/v89jc
         n5lxSEla+kNkAcdUpk5cgAkMQWIVmAJx+pQxIg1F/Zz06qOlSmRhrmJeTaF6TAoiYfkw
         nDLauxBawGWT6nyaHS9B0dibwn1ztt6a1IpFAZJoQi/FfTZ3cW9UCxACdv/XUllTzLMF
         DsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678993599;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VWP9U0/lBbfIDAkWAT/5nb8pOIpUWl/nzYodPuR5vw=;
        b=Fg4C6jBDM5LnUPdV6md4VteUCKUuL+wis4/LAXk1rsSD9X++WfQS7zV5geIzwJOY6e
         dguYW3f4Reki1mN5i/jkNN/3F5R+evPBdQ0jYrAbTZ8K/joYAwlHv/qZnz45fO0beK3D
         fm0MShFsgrewe8Tfe6N8NFS6QrLfeXjvX4o4BuygxpYr/Xkk7iQ/PWUTrkHrUHU4g5kD
         t0n25GtGwN8H6ayTgCPDKCfuTS37pp/hNzyIEPO+8K9Od/t2SWqJj9ImFE5EoGved67K
         r0M7bR9EJM6b8iTZ0AaA4Lf7vJWUhm+bGR2K0UuliQg1amss1W1z1BOaFXgEW4okjbs5
         Bxzw==
X-Gm-Message-State: AO0yUKUA7+2OkG/7iWtgamXE4iV36WYt2xkpwHTWqxhRAmOcGn/rr5Hn
        BDZ6FjdVQMlu1a9WAuyvydJExhUpSx9tMz7JQhF8Kw==
X-Google-Smtp-Source: AK7set/09emdYoLRbje3sJPf+0V6edlY9a/774yTf7v3Ul5UdsR8dVhqhpEhEs+Iz2cqLCZ60u7IHA==
X-Received: by 2002:a17:903:703:b0:19e:dc0e:126a with SMTP id kk3-20020a170903070300b0019edc0e126amr3574970plb.18.1678993598911;
        Thu, 16 Mar 2023 12:06:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y3-20020a170902700300b001a19438336esm62464plk.67.2023.03.16.12.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 12:06:38 -0700 (PDT)
Message-ID: <641368be.170a0220.21fec.03a8@mx.google.com>
Date:   Thu, 16 Mar 2023 12:06:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-16-v6.3-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-03-16-v6.3-rc2)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-03-16-v6.3-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-16-v6.3-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-16-v6.3-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      051221db2246899aa46144707b31ce26056b42eb

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  332809f3ee19f07abc03b62d5892fae51b9d9902
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f9d49501eaaadd39ae471094bc45a76a1ff93e42 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/64135da9700d2193db8c86c5

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230310.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/64135da9700d2193db8c8752
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:20.406939  Test requirement: !(pipe >=3D display->n_pi=
pes || <8>[   68.678685] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-b=
usy-hang RESULT=3Dskip>

    2023-03-16T18:17:20.409093  !display->pipes[pipe].enabled)

    2023-03-16T18:17:20.413124  Pipe F does not exist or not enabled

    2023-03-16T18:17:20.439425  <6>[   68.719855] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:20.444759  <14>[   68.726479] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:20.458425  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   68.732440] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-03-16T18:17:20.458874  )

    2023-03-16T18:17:20.463503  Starting subtest: pipe-A-wait-forked-busy

    2023-03-16T18:17:20.543856  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-03-16T18:17:20.783283  (kms_vblank:609) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/64135da9700d2193db8c8754
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:19.224773  <6>[   67.504381] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:19.229287  <14>[   67.511038] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:19.242142  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   67.517685] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-03-16T18:17:19.242914  )

    2023-03-16T18:17:19.246066  Starting subtest: pipe-A-wait-busy

    2023-03-16T18:17:19.326184  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-03-16T18:17:19.566499  (kms_vblank:599) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-16T18:17:19.573502  (kms_vblank:599) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-16T18:17:19.580015  (kms_vblank:599) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-16T18:17:19.584325  (kms_vblank:599) CRITICAL: error: -22 !=3D 0
 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/64135da9700d2193db8c8756
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:17.954440  <6>[   66.234733] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:17.960164  <14>[   66.241488] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:17.972950  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   66.248172] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-03-16T18:17:17.973819  )

    2023-03-16T18:17:17.977721  Starting subtest: pipe-A-wait-forked

    2023-03-16T18:17:18.059951  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-03-16T18:17:18.317363  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-16T18:17:18.323864  (kms_vblank:588) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-16T18:17:18.334377  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-16T18:17:18.344519  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:
 =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/64135da9700d2193db8c8758
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:16.669050  <6>[   64.949296] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:16.674405  <14>[   64.956010] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:16.687113  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   64.962766] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle

    2023-03-16T18:17:16.688304  )

    2023-03-16T18:17:16.692091  Starting subtest: pipe-A-wait-idle

    2023-03-16T18:17:16.776990  Beginning pipe-A-wait-idle on pipe A, conne=
ctor eDP-1

    2023-03-16T18:17:17.049016  (kms_vblank:581) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:318:

    2023-03-16T18:17:17.055485  (kms_vblank:581) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-16T18:17:17.060912  (kms_vblank:581) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-16T18:17:17.065458  (kms_vblank:581) CRITICAL: error: -22 !=3D 0
 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/64135da9700d2193db8c875a
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:15.316246  | !display->pipes[pipe].enabled)

    2023-03-16T18:17:15.319601  Pipe F does not exist or not enabled

    2023-03-16T18:17:15.348086  <6>[   63.627842] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:15.352898  <14>[   63.635120] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:15.367546  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   63.641623] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-03-16T18:17:15.368291  )

    2023-03-16T18:17:15.373306  Starting subtest: pipe-A-query-forked-busy

    2023-03-16T18:17:15.461534  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-03-16T18:17:15.765936  (kms_vblank:571) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-16T18:17:15.772883  (kms_vblank:571) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/64135da9700d2193db8c875c
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:14.158047  <6>[   62.437429] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:14.162349  <14>[   62.444126] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:14.176038  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   62.450828] [IGT] kms_vblank: starting subtest =
pipe-A-query-busy

    2023-03-16T18:17:14.176811  )

    2023-03-16T18:17:14.179212  Starting subtest: pipe-A-query-busy

    2023-03-16T18:17:14.261564  Beginning pipe-A-query-busy on pipe A, conn=
ector eDP-1

    2023-03-16T18:17:14.583028  (kms_vblank:563) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-16T18:17:14.589843  (kms_vblank:563) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-16T18:17:14.595777  (kms_vblank:563) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-16T18:17:14.600291  (kms_vblank:563) CRITICAL: error: -22 !=3D 0
 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/64135da9700d2193db8c875e
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:12.773408  nabled

    2023-03-16T18:17:12.806056  <6>[   61.085956] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:12.810278  <14>[   61.092623] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:12.824814  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   61.099230] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-03-16T18:17:12.825332  )

    2023-03-16T18:17:12.829025  Starting subtest: pipe-A-query-forked

    2023-03-16T18:17:12.911834  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-03-16T18:17:13.266269  (kms_vblank:552) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-16T18:17:13.275940  (kms_vblank:553) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-16T18:17:13.286386  (kms_vblank:554) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/64135da9700d2193db8c8760
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:11.524137  <6>[   59.804509] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:11.529511  <14>[   59.811552] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:11.543763  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   59.818106] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-03-16T18:17:11.544224  )

    2023-03-16T18:17:11.547363  Starting subtest: pipe-A-query-idle

    2023-03-16T18:17:11.628486  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-03-16T18:17:12.050429  (kms_vblank:545) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:289:

    2023-03-16T18:17:12.057968  (kms_vblank:545) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-16T18:17:12.063874  (kms_vblank:545) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-16T18:17:12.068647  (kms_vblank:545) CRITICAL: error: -22 !=3D 0
 =

    ... (78 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/64135da9700d2193db8c8761
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:10.244068  <6>[   58.523706] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:10.248564  <14>[   58.530403] [IGT] kms_vblank: execut=
ing

    2023-03-16T18:17:10.262756  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   58.536940] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-03-16T18:17:10.263555  )

    2023-03-16T18:17:10.266486  Starting subtest: pipe-A-accuracy-idle

    2023-03-16T18:17:10.345428  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-03-16T18:17:10.818460  (kms_vblank:542) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:254:

    2023-03-16T18:17:10.825968  (kms_vblank:542) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-03-16T18:17:10.831596  (kms_vblank:542) CRITICAL: Last errno: 22, =
Invalid argument

    2023-03-16T18:17:10.835472  (kms_vblank:542) CRITICAL: error: -22 !=3D 0
 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
4135da9700d2193db8c876a
        failing since 272 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-03-16T18:17:06.250766  <8>[   54.532316] <LAVA_SIGNAL_TESTSET STOP>

    2023-03-16T18:17:06.288828  <8>[   54.569294] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-03-16T18:17:06.324473  <6>[   54.603912] Console: switching to col=
our dummy device 80x25

    2023-03-16T18:17:06.328794  <14>[   54.610602] [IGT] kms_setmode: execu=
ting

    2023-03-16T18:17:06.341164  IGT-Version: 1.27.1-gf9d4950 (aarch64) (Lin=
ux: 6.3.0-rc2 aarch64<14>[   54.616188] [IGT] kms_setmode: starting subtest=
 basic

    2023-03-16T18:17:06.342016  )

    2023-03-16T18:17:06.344175  Starting subtest: basic

    2023-03-16T18:17:06.348651  Testing: basic 1 connector combinations

    2023-03-16T18:17:06.438996  <14>[   54.717651] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-03-16T18:17:06.443194  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
