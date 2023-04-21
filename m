Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A11C6EA9D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 14:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjDUMAJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 08:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjDUL7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 07:59:49 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168AD7D80
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 04:59:45 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-24799a2ee83so1445694a91.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 04:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682078384; x=1684670384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/3Gqheq5NIlDwCpQdWYGUvnafRbWUgPLHiDCVWCwNFU=;
        b=e4kt80iymnypr1pRtY7nse4FzStysx9mfRKxjLTLQYKhu3vYcKHV+lY4UxuTzfOaus
         3VWrkmjn5Rgqanu9gaIDizuMSHz1ePn1tUDBDmRixck1KhDwiB7mNknAen5/aIsIRSuZ
         WTwPXX583g579ExbuRtOiX34rtOh9BpU3RY07JwJYuI6F1JAyggZW4rFGiDKFXGmoI7p
         yWtaAPT1LS1/8zxfvRyVoMIrfS6taugyIH0lCLczHPSyplD30vJ98ou6LdxVDMEJhejZ
         qtvOQCGlHRu7vPMUvjH9un1haS2EM1QjVfiZFCDQTaPw3gAlejkNjLB+qP605JoRvkSX
         ak2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682078384; x=1684670384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Gqheq5NIlDwCpQdWYGUvnafRbWUgPLHiDCVWCwNFU=;
        b=lr7NXC761MiSdTvU3UOEkiPDi8oQsfGGd5iV+npy42Tphc9lbZMY5t1UgrBZQl/MGS
         bm3TqXxzIEvKGYNMak/mqskTRO9SLduZPDzBkMW4aXpmDpI0bfJ3JifnbMC8T4OVpzjM
         76kmAm5WZFl74JiPABbtqBDHzM2MfaiRYDVHcslMNGmjy1HVYRv4/t5pGog8Og7gHbU1
         Xr/H+pSVEDYTugau2BtKMl00Z/WthvaabQYZzpsP7haL61l5RmQ/NBRGYxf2DFEF1I4o
         dp9k15sewrSzQDX4eJp63l+/an6Cu3jw7g+hvHLRxCrruSBjhFA/RQfq+Uj6bbvntx/b
         vGqA==
X-Gm-Message-State: AAQBX9fXkHyK8ZHL812Eo17Qj/vB5+CKAw5JztI8M/gVQnstUeXNxVp5
        XEp1zz5Y4YpK+CLA6vO6Uc367J3uY06PZa+QeOHCkxQN
X-Google-Smtp-Source: AKy350YFkRtlYgXopUN9cABfBXGdrD/JVGil+uptrsyP+lbx2QS++lOxVFKVRY9Z+dgrXByObea/RA==
X-Received: by 2002:a17:90b:3e8b:b0:246:c3e1:c931 with SMTP id rj11-20020a17090b3e8b00b00246c3e1c931mr4428432pjb.23.1682078384222;
        Fri, 21 Apr 2023 04:59:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gd12-20020a17090b0fcc00b00246578736bbsm2622504pjb.8.2023.04.21.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 04:59:43 -0700 (PDT)
Message-ID: <64427aaf.170a0220.c7603.58a2@mx.google.com>
Date:   Fri, 21 Apr 2023 04:59:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-04-21-v6.3-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-04-21-v6.3-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-04-21-v6.3-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-21-v6.3-rc7/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-21-v6.3-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      58c481b761fe2bc4936caea1c712d28e30488ef4

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  28d9a3c4fb4c99aafc31b288b3f735e19e728d64
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  7fab01340a3f360abacd7914015be1ad485363d7 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/64427007581a689c3e2e85ec

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230414.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/64427008581a689c3e2e8679
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:12:05.198490  Test requirement: !(pipe >=3D display->n_pi=
pes || <8>[   67.476821] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-b=
usy-hang RESULT=3Dskip>

    2023-04-21T11:12:05.200953  !display->pipes[pipe].enabled)

    2023-04-21T11:12:05.204612  Pipe F does not exist or not enabled

    2023-04-21T11:12:05.221999  <6>[   67.506692] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:12:05.227050  <14>[   67.513462] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:12:05.241356  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   67.519328] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy

    2023-04-21T11:12:05.241447  )

    2023-04-21T11:12:05.246329  Starting subtest: pipe-A-wait-forked-busy

    2023-04-21T11:12:05.331326  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1

    2023-04-21T11:12:05.570984  (kms_vblank:609) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:
 =

    ... (111 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/64427008581a689c3e2e867b
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:12:03.931314  c:2411:

    2023-04-21T11:12:03.939163  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-21T11:12:03.943353  Pipe E does not exist or not enabled

    2023-04-21T11:12:03.951348  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-04-21T11:12:03.959162  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-21T11:12:03.968230  Pipe F does not exist or not <6>[   66.2502=
37] Console: switching to colour dummy device 80x25

    2023-04-21T11:12:03.969496  enabled

    2023-04-21T11:12:03.973957  <14>[   66.259624] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:12:03.987354  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   66.266512] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-04-21T11:12:03.987630  )
 =

    ... (89 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/64427008581a689c3e2e867d
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:12:02.734081  <6>[   65.018114] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:12:02.738195  <14>[   65.024747] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:12:02.752845  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   65.030459] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked

    2023-04-21T11:12:02.752957  )

    2023-04-21T11:12:02.756587  Starting subtest: pipe-A-wait-forked

    2023-04-21T11:12:02.831652  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1

    2023-04-21T11:12:03.105293  (kms_vblank:592) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-21T11:12:03.114925  (kms_vblank:588) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-21T11:12:03.125782  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:343:

    2023-04-21T11:12:03.132756  (kms_vblank:592) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
 =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/64427008581a689c3e2e867f
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:12:01.430209  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)<8>[   63.708463] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>

    2023-04-21T11:12:01.430311  =


    2023-04-21T11:12:01.433713  Pipe E does not exist or not enabled

    2023-04-21T11:12:01.442462  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-04-21T11:12:01.449972  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-21T11:12:01.453571  Pipe F does not exist or not enabled

    2023-04-21T11:12:01.472310  <6>[   63.756900] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:12:01.477948  <14>[   63.764196] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:12:01.491232  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   63.770542] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle

    2023-04-21T11:12:01.491705  )
 =

    ... (89 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/64427008581a689c3e2e8681
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:12:00.109535  <8>[   62.390299] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Dskip>

    2023-04-21T11:12:00.142147  <6>[   62.426487] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:12:00.147744  <14>[   62.433668] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:12:00.161745  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   62.440169] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy

    2023-04-21T11:12:00.162570  )

    2023-04-21T11:12:00.166933  Starting subtest: pipe-A-query-forked-busy

    2023-04-21T11:12:00.249630  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1

    2023-04-21T11:12:00.570673  (kms_vblank:570) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-21T11:12:00.581258  (kms_vblank:573) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-21T11:12:00.591309  (kms_vblank:572) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/64427008581a689c3e2e8684
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:11:58.899173  requirement not met in function igt_require=
_pipe, file ../lib/igt_kms.c:2411:

    2023-04-21T11:11:58.907398  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-04-21T11:11:58.916606  Pipe D does not exist or not enab<6>[   61.=
200883] Console: switching to colour dummy device 80x25

    2023-04-21T11:11:58.917658  led

    2023-04-21T11:11:58.927739  Test requirement not met in function igt_re=
quire_pipe, file<14>[   61.207980] [IGT] kms_vblank: executing

    2023-04-21T11:11:58.930524   ../lib/igt_kms.c:2411:

    2023-04-21T11:11:58.940870  Test requirement: !(pipe >=3D display->n_<1=
4>[   61.219825] [IGT] kms_vblank: starting subtest pipe-A-query-busy

    2023-04-21T11:11:58.945800  pipes || !display->pipes[pipe].enabled)

    2023-04-21T11:11:58.948905  Pipe E does not exist or not enabled

    2023-04-21T11:11:58.957591  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:
 =

    ... (92 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/64427008581a689c3e2e8686
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:11:57.542489  led

    2023-04-21T11:11:57.577670  <6>[   59.861101] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:11:57.582332  <14>[   59.868183] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:11:57.596109  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   59.874536] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked

    2023-04-21T11:11:57.596787  )

    2023-04-21T11:11:57.600594  Starting subtest: pipe-A-query-forked

    2023-04-21T11:11:57.683435  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1

    2023-04-21T11:11:58.071340  (kms_vblank:551) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-21T11:11:58.081720  (kms_vblank:552) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-21T11:11:58.092223  (kms_vblank:553) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:
 =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/64427008581a689c3e2e8688
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:11:56.254360  <8>[   58.535013] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>

    2023-04-21T11:11:56.277672  <6>[   58.561982] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:11:56.283103  <14>[   58.568650] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:11:56.296876  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   58.574572] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-04-21T11:11:56.297362  )

    2023-04-21T11:11:56.300046  Starting subtest: pipe-A-query-idle

    2023-04-21T11:11:56.383058  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-04-21T11:11:56.788841  (kms_vblank:544) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-04-21T11:11:56.795653  (kms_vblank:544) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-21T11:11:56.802350  (kms_vblank:544) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (84 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/64427008581a689c3e2e8689
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:11:55.022236  <6>[   57.306315] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:11:55.026887  <14>[   57.313004] [IGT] kms_vblank: execut=
ing

    2023-04-21T11:11:55.040913  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   57.319028] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-04-21T11:11:55.041171  )

    2023-04-21T11:11:55.045185  Starting subtest: pipe-A-accuracy-idle

    2023-04-21T11:11:55.117330  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-04-21T11:11:55.605880  (kms_vblank:541) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-04-21T11:11:55.612910  (kms_vblank:541) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-04-21T11:11:55.619334  (kms_vblank:541) CRITICAL: Last errno: 22, =
Invalid argument

    2023-04-21T11:11:55.623637  (kms_vblank:541) CRITICAL: error: -22 !=3D 0
 =

    ... (82 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
4427008581a689c3e2e8691
        failing since 307 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-04-21T11:11:51.057978  <8>[   53.343707] <LAVA_SIGNAL_TESTSET STOP>

    2023-04-21T11:11:51.097205  <8>[   53.382000] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-04-21T11:11:51.132565  <6>[   53.416387] Console: switching to col=
our dummy device 80x25

    2023-04-21T11:11:51.137023  <14>[   53.423048] [IGT] kms_setmode: execu=
ting

    2023-04-21T11:11:51.150161  IGT-Version: 1.27.1-g7fab013 (aarch64) (Lin=
ux: 6.3.0-rc7 aarch64<14>[   53.428284] [IGT] kms_setmode: starting subtest=
 basic

    2023-04-21T11:11:51.150640  )

    2023-04-21T11:11:51.152681  Starting subtest: basic

    2023-04-21T11:11:51.156653  Testing: basic 1 connector combinations

    2023-04-21T11:11:51.253975  <14>[   53.536511] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1

    2023-04-21T11:11:51.257382  Starting dynamic subtest: pipe-A-eDP-1
 =

    ... (77 line(s) more)  =

 =20
