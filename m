Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357DA72C530
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 14:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbjFLM4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 08:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236714AbjFLM4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 08:56:23 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680732958
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-650c8cb68aeso3498752b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686574500; x=1689166500;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PzGCWcbpRTxm63tqveyYEJh+QgjYNAxeaENH98axA0I=;
        b=yg2WG/xsl08kZYW5b7nlBkUg/xYSuL8OPnTQlKDHwdNojr15lmKe/+tfHKI1Y7KYWs
         RLrd/yoPAAEK9qJv7r7U0RR28EZmf/trxXoyvtH73lyGfV8qaBsnk3l/XxFA+7jR16O0
         vuOQSSVSR+L68OEH1ixmuc70Jbwt5zo+gAPktzXfMbejNFM0tGUH2gkjMBsyUcKnz/PJ
         +0mV6mPXJ8r3e2q4OjlJDcE2c6e4wGma534+kgbz1aYoT/xZ1HPZqbfK+Tdab9Bgwzyg
         oH0262PuPGv78XQrtDEw8gFltKW51rsyk9dpeYFrz/lcxRNrbuKgDyMKEBJjpAmxWX1R
         PfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574500; x=1689166500;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzGCWcbpRTxm63tqveyYEJh+QgjYNAxeaENH98axA0I=;
        b=k1n2kFUMZD1UMc3dPC7mJclBADJxF6N7YSUq2utp35PSAZHboIMAF0QTWIZXeMIeIq
         TOWE8/j/h48cxn8heTFq34v3agv2r1hAPZy/yC6p697xrhYQoodnyU2BsJ+YXah0toHl
         SwNm6X4jZs/A7Aww1sm7H9uVNYjyu+8fvBZjEF1AXTmYELIr0rGLKsoCf3+xonPO2VHu
         goXpDrjz33TMwj8J8fPrqLdcc+0kC6WDhD9pW5iHIES/5mbAKQ7udnk98H5GisVD5Spx
         8KI1SA+xearvYoJFAl54+WEhProp22+LeEQY9gXBk+8rLZXWXqO7XVNrDviVnNbIQd0v
         n9Dw==
X-Gm-Message-State: AC+VfDxmDHkVK5QhuHS7zHQcfku54Z48r36tOWnhBHSC7aF89w9xHQK/
        S0eXxOGpe6Bk4cMurNv4P56Xxc6JlpptTHQhvFoWVQ==
X-Google-Smtp-Source: ACHHUZ5KnreDY63IfWiE3xdR9KOOblrG7HNAvG7jSuQ2zEhsPk9P11K00CE2sEMsMlkV9cZGd8SFzA==
X-Received: by 2002:a05:6a20:a104:b0:10b:6b1f:acf1 with SMTP id q4-20020a056a20a10400b0010b6b1facf1mr10658508pzk.29.1686574499472;
        Mon, 12 Jun 2023 05:54:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u1-20020aa78381000000b0064f7c56d8b7sm6770526pfm.219.2023.06.12.05.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Message-ID: <648715a0.a70a0220.fd228.c89c@mx.google.com>
Date:   Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-12-v6.4-rc6
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-06-12-v6.4-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-06-12-v6.4-rc6)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-12-v6.4-rc6/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-12-v6.4-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eec974413697190538e69788efc6048763f9b64e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  766edf96979bf13a10c9985c007f2baca5c9e308 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/6487041e82c5441d74306198

  Results:     66 PASS, 23 FAIL, 198 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/6487041e82c5441d74306257
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:49.162314  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<8>[   59.404760] <LAVA_SIGNAL_TESTCASE TEST_CA=
SE_ID=3Dpipe-A-wait-busy-hang RESULT=3Dskip>

    2023-06-12T11:37:49.162728  kms.c:2429:

    2023-06-12T11:37:49.169873  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:49.174565  Pipe F does not exist or not enabled

    2023-06-12T11:37:49.182921  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:49.189964  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:49.198679  Pipe G does not exist or <6>[   59.445695] =
Console: switching to colour dummy device 80x25

    2023-06-12T11:37:49.200758  not enabled

    2023-06-12T11:37:49.209810  Test requirement not met in function igt_re=
quire_pi<14>[   59.456619] [IGT] kms_vblank: executing

    2023-06-12T11:37:49.212892  pe, file ../lib/igt_kms.c:2429:
 =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/6487041e82c5441d74306259
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:47.864842  Test requirem<8>[   58.107007] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>

    2023-06-12T11:37:47.870948  ent: !(pipe >=3D display->n_pipes || !displ=
ay->pipes[pipe].enabled)

    2023-06-12T11:37:47.874613  Pipe F does not exist or not enabled

    2023-06-12T11:37:47.882327  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:47.889888  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:47.893982  Pipe G does not exist or not enabled

    2023-06-12T11:37:47.901825  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:47.914219  Test requirement: !(pipe >=3D display->n_pi=
pes || !display-<6>[   58.159029] Console: switching to colour dummy device=
 80x25

    2023-06-12T11:37:47.916355  >pipes[pipe].enabled)

    2023-06-12T11:37:47.919496  Pipe H does not exist or not enabled
 =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/6487041e82c5441d7430625b
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:46.598261  igt_require_pipe, file ../lib/igt_kms.c:242=
9:

    2023-06-12T11:37:46.605784  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:46.609378  Pipe F does not exist or not enabled

    2023-06-12T11:37:46.618397  Test requirement not met in<6>[   56.868195=
] Console: switching to colour dummy device 80x25

    2023-06-12T11:37:46.624664   function igt_require_pipe, file ../lib/igt=
_kms.c:2429:

    2023-06-12T11:37:46.629018  Test re<14>[   56.876254] [IGT] kms_vblank:=
 executing

    2023-06-12T11:37:46.642580  quirement: !(pipe >=3D display->n_pipes || =
!display->pipes[pipe].e<14>[   56.888172] [IGT] kms_vblank: starting subtes=
t pipe-A-wait-forked

    2023-06-12T11:37:46.644467  nabled)

    2023-06-12T11:37:46.647923  Pipe G does not exist or not enabled

    2023-06-12T11:37:46.656027  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:
 =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/6487041e82c5441d7430625d
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:45.236713  Test requirement: has_ban_period <8>[   55.=
481832] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang =
RESULT=3Dskip>

    2023-06-12T11:37:45.237685  || has_bannable

    2023-06-12T11:37:45.241394  Last errno: 22, Invalid argument

    2023-06-12T11:37:45.247924  =1B[1mSubtest pipe-A-query-forked-busy-hang=
: SKIP (0.000s)=1B[0m

    2023-06-12T11:37:45.255885  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:45.263184  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:45.267449  Pipe C does not exist or not enabled

    2023-06-12T11:37:45.275882  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:45.286638  Test requirement: !(pipe >=3D display->n_pi=
pes || !<6>[   55.531652] Console: switching to colour dummy device 80x25

    2023-06-12T11:37:45.290356  display->pipes[pipe].enabled)
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/6487041e82c5441d7430625f
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:43.934228  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:43.938133  Pipe F does not exist or not enabled

    2023-06-12T11:37:43.946091  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:43.953636  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:43.956641  Pipe G does not exist or not enabled

    2023-06-12T11:37:43.963683  <6>[   54.213031] Console: switching to col=
our dummy device 80x25

    2023-06-12T11:37:43.974726  Test requirement not met in function igt_re=
quire_pipe, file ../l<14>[   54.221739] [IGT] kms_vblank: executing

    2023-06-12T11:37:43.976309  ib/igt_kms.c:2429:

    2023-06-12T11:37:43.989420  Test requirement: !(pipe >=3D display->n_pi=
pes<14>[   54.234036] [IGT] kms_vblank: starting subtest pipe-A-query-forke=
d-busy

    2023-06-12T11:37:43.992326   || !display->pipes[pipe].enabled)
 =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/6487041e82c5441d74306261
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:42.699251  t_kms.c:2429:

    2023-06-12T11:37:42.707005  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:42.710757  Pipe C does not exist or not enabled

    2023-06-12T11:37:42.719535  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:42.726549  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:42.735853  Pipe D does not exist o<6>[   52.982092] Co=
nsole: switching to colour dummy device 80x25

    2023-06-12T11:37:42.737296  r not enabled

    2023-06-12T11:37:42.747101  Test requirement not met in function igt_re=
quire_<14>[   52.993534] [IGT] kms_vblank: executing

    2023-06-12T11:37:42.750241  pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:42.760606  Test requirement: !(pipe >=3D d<14>[   53.0=
05262] [IGT] kms_vblank: starting subtest pipe-A-query-busy
 =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/6487041e82c5441d74306263
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:41.317320  t: !(pipe >=3D display->n_pipes || !display=
->pipes[pipe].enabled)

    2023-06-12T11:37:41.321172  Pipe F does not exist or not enabled

    2023-06-12T11:37:41.329716  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-12T11:37:41.337234  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-12T11:37:41.341188  Pipe G does not exist or not enabled

    2023-06-12T11:37:41.348658  Test requiremen<6>[   51.598101] Console: s=
witching to colour dummy device 80x25

    2023-06-12T11:37:41.359571  t not met in function igt_require_pipe, fil=
e ../lib/igt_kms.c:24<14>[   51.606689] [IGT] kms_vblank: executing

    2023-06-12T11:37:41.360375  29:

    2023-06-12T11:37:41.373192  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->p<14>[   51.619169] [IGT] kms_vblank: starting subtest pip=
e-A-query-forked

    2023-06-12T11:37:41.375888  ipes[pipe].enabled)
 =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/6487041e82c5441d74306265
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:40.008085  <6>[   50.258747] Console: switching to col=
our dummy device 80x25

    2023-06-12T11:37:40.013471  <14>[   50.265815] [IGT] kms_vblank: execut=
ing

    2023-06-12T11:37:40.027448  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc6 aarch64<14>[   50.272340] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-06-12T11:37:40.027949  )

    2023-06-12T11:37:40.030735  Opened device: /dev/dri/card0

    2023-06-12T11:37:40.034193  Starting subtest: pipe-A-query-idle

    2023-06-12T11:37:40.119883  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-06-12T11:37:40.557860  (kms_vblank:551) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-06-12T11:37:40.565348  (kms_vblank:551) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-06-12T11:37:40.571589  (kms_vblank:551) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (84 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/6487041e82c5441d74306266
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:38.672050  <6>[   48.922709] Console: switching to col=
our dummy device 80x25

    2023-06-12T11:37:38.677640  <14>[   48.929395] [IGT] kms_vblank: execut=
ing

    2023-06-12T11:37:38.690252  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc6 aarch64<14>[   48.935870] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-06-12T11:37:38.691358  )

    2023-06-12T11:37:38.694156  Opened device: /dev/dri/card0

    2023-06-12T11:37:38.697991  Starting subtest: pipe-A-accuracy-idle

    2023-06-12T11:37:38.770105  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-06-12T11:37:39.276506  (kms_vblank:547) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-06-12T11:37:39.282889  (kms_vblank:547) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-06-12T11:37:39.289513  (kms_vblank:547) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (90 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
487041e82c5441d7430626f
        failing since 359 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-12T11:37:34.717315  <8>[   44.969465] <LAVA_SIGNAL_TESTSET STOP>

    2023-06-12T11:37:34.756667  <8>[   45.006980] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-06-12T11:37:34.787233  <6>[   45.037965] Console: switching to col=
our dummy device 80x25

    2023-06-12T11:37:34.792369  <14>[   45.044781] [IGT] kms_setmode: execu=
ting

    2023-06-12T11:37:34.804439  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc6 aarch64<14>[   45.049937] [IGT] kms_setmode: starting subtest=
 basic

    2023-06-12T11:37:34.805691  )

    2023-06-12T11:37:34.808349  Opened device: /dev/dri/card0

    2023-06-12T11:37:34.810331  Starting subtest: basic

    2023-06-12T11:37:34.814536  Testing: basic 1 connector combinations

    2023-06-12T11:37:34.912000  <14>[   45.162153] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
 =

    ... (78 line(s) more)  =

 =20
