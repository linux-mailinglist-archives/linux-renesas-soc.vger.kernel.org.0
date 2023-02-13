Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6828A6953B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 23:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjBMWUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 17:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjBMWUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 17:20:33 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621281C328
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 14:20:31 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id gd1so2527944pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 14:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TWVkSGY3yQ3LnSPk7nj307twg4Pip4ptbp0HRr0yKuw=;
        b=EY9zBWt4xegVG0jgiCl3IKlk2VDyi3ZLd5Eo2vq1AXETBA3oyvwit8HukHq7+i3IZt
         a7SocfGVnaKG1fuJsPJgMBwdm3ADdsds3ws9Lb2JeoaM/bMAP95hKOBiuBb+VpjB8GOR
         xm0TVDmdXV8jZ96cpCxOJrIfiy2hfJpiNOV1XyxYp6vZZ6JWX1puYQJDhplUHGHyscZw
         otqZJ8FB6RLo+4WqwG69XkrA9HQV4wYFGgOsw0UrS7r4PVe2fn7zGpbONxh913tXnPiX
         raXqSUbtj8Jv6wjEZGSpMs/KZ9361CU1uw1alsof6v3yiVj24vww0SQGdN32Jf8PrTK9
         eJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWVkSGY3yQ3LnSPk7nj307twg4Pip4ptbp0HRr0yKuw=;
        b=5yKVfXRGD3iiGearYY07G89zfiAU+r9GJs0dt8yxbx2C6qjBdYzzvO9h/6JuiYhisb
         iY9tXQvcTpWYGgJRsLn66XtRTrkCc/k6FvB23NBr7SvQ02lrtqghXOSLrFyT8y0KGWZr
         hLi3cd7QIg7tHLuzJE0MlNYfV3J78UQRKk/KvY0tW7rpcmQ2bF6fPNzWEvTsfjWxpkjV
         RbdQFcZJ215aiCNHCVndxBFqse2ExtTnJHlr+TVaGr5kObjtJTgN8QNPLlBDbmgb2oXE
         GgeBNl9Dbe3LIxJWyk3ldUUtVw5uYUTylk/dl82ZqphChaNGqHLbeOInbU5eu8XPevSw
         O/Ow==
X-Gm-Message-State: AO0yUKU+DdZXGwW10HADF7ywf/CyRjTVxj5Tvia8qgmh7ClO5A5Rp5+D
        39laOY68la4HDbf5N7a3OvZkmvpNVhvtf7smR84=
X-Google-Smtp-Source: AK7set/zh/N3mG3f0u/NGRF74Gn/pPSDzYjmPu+WFbUSRpUmRrbdZYtN/W5aMs5ZzArn/6FXtrHstw==
X-Received: by 2002:a17:903:41c2:b0:19a:aba6:f214 with SMTP id u2-20020a17090341c200b0019aaba6f214mr432022ple.48.1676326830535;
        Mon, 13 Feb 2023 14:20:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902b10a00b00174f61a7d09sm8660284plr.247.2023.02.13.14.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 14:20:30 -0800 (PST)
Message-ID: <63eab7ae.170a0220.6755c.0a66@mx.google.com>
Date:   Mon, 13 Feb 2023 14:20:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-02-13-v6.2-rc8
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-02-13-v6.2-rc8)
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
-02-13-v6.2-rc8)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-13-v6.2-rc8/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-13-v6.2-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1114d4a0bbbebed7e53c9c2279c0c7adab6ca959

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  c6d6dce99fb3e7e681fbba9e198345fdbd10e49e
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  d2ca8db8bf83a19034eee61c11ec01a4e973e0ed =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63eaa4ef5334e9fa5e8c8632

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230211.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63eaa4ef5334e9fa5e8c86bf
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:15.389408  Test requirement: !(pipe >=3D display->n_pi=
pes || <8>[   68.614992] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-b=
usy-hang RESULT=3Dskip>

    2023-02-13T20:58:15.392589  !display->pipes[pipe].enabled)

    2023-02-13T20:58:15.396175  Pipe F does not exist or not enabled

    2023-02-13T20:58:15.430298  <6>[   68.662499] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:15.434699  <14>[   68.669151] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:15.449392  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   68.675377] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-02-13T20:58:15.449669  )

    2023-02-13T20:58:15.453601  Starting subtest: pipe-A-wait-forked-busy

    2023-02-13T20:58:15.543780  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-02-13T20:58:15.782542  (kms_vblank:611) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63eaa4ef5334e9fa5e8c86c1
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:14.149446  ib/igt_kms.c:2361:

    2023-02-13T20:58:14.156761  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-02-13T20:58:14.160700  Pipe F does not exist or not enabled

    2023-02-13T20:58:14.178924  <6>[   67.411311] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:14.183823  <14>[   67.417942] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:14.197587  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   67.423800] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-02-13T20:58:14.197967  )

    2023-02-13T20:58:14.201463  Starting subtest: pipe-A-wait-busy

    2023-02-13T20:58:14.293225  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1

    2023-02-13T20:58:14.549751  (kms_vblank:602) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (82 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63eaa4ef5334e9fa5e8c86c3
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:12.906097  Test requirement: !(pipe >=3D display->n_pi=
pes || <8>[   66.133383] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-i=
dle-hang RESULT=3Dskip>

    2023-02-13T20:58:12.909184  !display->pipes[pipe].enabled)

    2023-02-13T20:58:12.913406  Pipe F does not exist or not enabled

    2023-02-13T20:58:12.946797  <6>[   66.179203] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:12.951538  <14>[   66.185871] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:12.965330  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   66.192009] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-02-13T20:58:12.965787  )

    2023-02-13T20:58:12.969290  Starting subtest: pipe-A-wait-forked

    2023-02-13T20:58:13.060542  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-02-13T20:58:13.316497  (kms_vblank:594) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
 =

    ... (114 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63eaa4ef5334e9fa5e8c86c5
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:11.605505  Pipe D does n<8>[   64.829201] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>

    2023-02-13T20:58:11.607881  ot exist or not enabled

    2023-02-13T20:58:11.615998  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2361:

    2023-02-13T20:58:11.623858  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-02-13T20:58:11.627486  Pipe E does not exist or not enabled

    2023-02-13T20:58:11.635744  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2361:

    2023-02-13T20:58:11.649326  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].ena<6>[   64.880795] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:11.649829  bled)

    2023-02-13T20:58:11.653457  Pipe F does not exist or not enabled

    2023-02-13T20:58:11.658781  <14>[   64.888717] [IGT] kms_vblank: execut=
ing
 =

    ... (88 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63eaa4ef5334e9fa5e8c86c7
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:10.327727  Pipe F does not exist or not e<8>[   63.554=
937] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Ds=
kip>

    2023-02-13T20:58:10.328615  nabled

    2023-02-13T20:58:10.362392  <6>[   63.594697] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:10.367508  <14>[   63.601373] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:10.381417  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   63.607563] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-02-13T20:58:10.381997  )

    2023-02-13T20:58:10.386119  Starting subtest: pipe-A-query-forked-busy

    2023-02-13T20:58:10.478266  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-02-13T20:58:10.783290  (kms_vblank:573) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-13T20:58:10.793719  (kms_vblank:576) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63eaa4ef5334e9fa5e8c86c9
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:09.078525  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)

    2023-02-13T20:58:09.082538  Pipe E does not exist or not enabled

    2023-02-13T20:58:09.090929  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2361:

    2023-02-13T20:58:09.098252  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-02-13T20:58:09.101996  Pipe F does not exist or not enabled

    2023-02-13T20:58:09.116664  <6>[   62.348713] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:09.121412  <14>[   62.355502] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:09.135295  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   62.361921] [IGT] kms_vblank: starting subtest =
pipe-A-query-busy

    2023-02-13T20:58:09.135577  )

    2023-02-13T20:58:09.139254  Starting subtest: pipe-A-query-busy
 =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63eaa4ef5334e9fa5e8c86cb
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:07.717884  nabled

    2023-02-13T20:58:07.742043  <6>[   60.974225] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:07.746858  <14>[   60.980913] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:07.760725  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   60.986698] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-02-13T20:58:07.760996  )

    2023-02-13T20:58:07.764442  Starting subtest: pipe-A-query-forked

    2023-02-13T20:58:07.845457  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-02-13T20:58:08.233499  (kms_vblank:556) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-13T20:58:08.240653  (kms_vblank:556) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-13T20:58:08.250690  (kms_vblank:555) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
 =

    ... (114 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63eaa4ef5334e9fa5e8c86cd
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:06.402272  <6>[   59.634039] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:06.406950  <14>[   59.640668] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:06.420494  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   59.646441] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-02-13T20:58:06.421229  )

    2023-02-13T20:58:06.424263  Starting subtest: pipe-A-query-idle

    2023-02-13T20:58:06.512403  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-02-13T20:58:06.951285  (kms_vblank:548) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:

    2023-02-13T20:58:06.957944  (kms_vblank:548) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-13T20:58:06.964154  (kms_vblank:548) CRITICAL: Last errno: 22, =
Invalid argument

    2023-02-13T20:58:06.968520  (kms_vblank:548) CRITICAL: error: -22 !=3D 0
 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63eaa4ef5334e9fa5e8c86ce
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:05.038715  <8>[   58.268212] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>

    2023-02-13T20:58:05.070011  <6>[   58.301737] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:05.075157  <14>[   58.308352] [IGT] kms_vblank: execut=
ing

    2023-02-13T20:58:05.088888  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   58.314118] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-02-13T20:58:05.089630  )

    2023-02-13T20:58:05.092998  Starting subtest: pipe-A-accuracy-idle

    2023-02-13T20:58:05.179827  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-02-13T20:58:05.666973  (kms_vblank:545) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:

    2023-02-13T20:58:05.674000  (kms_vblank:545) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-02-13T20:58:05.680278  (kms_vblank:545) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (81 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3eaa4ef5334e9fa5e8c86d7
        failing since 241 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-02-13T20:58:01.026953  <8>[   54.259580] <LAVA_SIGNAL_TESTSET STOP>

    2023-02-13T20:58:01.066164  <8>[   54.297843] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-02-13T20:58:01.101801  <6>[   54.333671] Console: switching to col=
our dummy device 80x25

    2023-02-13T20:58:01.107254  <14>[   54.340373] [IGT] kms_setmode: execu=
ting

    2023-02-13T20:58:01.119730  IGT-Version: 1.27.1-gd2ca8db (aarch64) (Lin=
ux: 6.2.0-rc8 aarch64<14>[   54.346446] [IGT] kms_setmode: starting subtest=
 basic

    2023-02-13T20:58:01.120495  )

    2023-02-13T20:58:01.123275  Starting subtest: basic

    2023-02-13T20:58:01.126253  Testing: basic 1 connector combinations

    2023-02-13T20:58:01.221099  <14>[   54.451963] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-02-13T20:58:01.225364  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
