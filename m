Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD6C565687
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 15:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbiGDNHH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 09:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbiGDNHA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 09:07:00 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC50DF37
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 06:06:41 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id l6so8506281plg.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cVBzsO3k+5D+JuoWLnsoFJdKBuLcepWaLfFasKsMVxQ=;
        b=pBY6R8xqXskM0uIKS7k9ToxC6Uqjen6cQTNXDFFxSoPeC/CJbW/VPfW5INM+s1pCf5
         QJ1SpGDu/n3Tlb4Xz1Da2CC51lBVt+qQqAEofIo/B+T+VBZncn/JES2Yq7G4HxuF4vSt
         yo6JTFSAiCWn4SqDidFWeZAMtQrAlwPM6aZlPqmiExFFiMEjhfw7leuY6krd+syG2a6q
         3nURfvNLix1v20B7nCGy93u4JLVYMzNUzmRNxrICaTVhKy8kPkOxj4iQCd5gJPPOrGRf
         l2kMsxO4/Rfg11S6GxtEcPPAuyi/dxoa0Z/HbOvNG2nxJ4k7icYSd7XX3+qyjXJT+hde
         npuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cVBzsO3k+5D+JuoWLnsoFJdKBuLcepWaLfFasKsMVxQ=;
        b=MXzdrwPUgZIUTI66CIN4wGRHbN7kfAXOtVtXNRG3ESuproc47W6Tx5ZR1QUSbWta7Q
         wLwquds1n6yf2KjeRIGR4RON56/u8GiRU0hdU6GFl3TtkfwqUHZVLgOCZHhQAtN/ABUd
         L389MAaxaypiW3K5GSg+HMODttRRm1dsY4v5KgohBzC8F1aSMwMxhegLVu4qXkDz/MV3
         LbdDe0ZboufHoixeJGyrn3Rc9kVVGQJiBXTOcVb3qzcc9uY9jim3nrBlolr8Ef9AZUQr
         u9Fkj3J+b5nvJRgdMW6eJBWriLPpKJsnQXQhYfhe8BvsF+cq3wKHy0XWLXDcszsldHHe
         woRA==
X-Gm-Message-State: AJIora95K3H8bhGZ5V044i29+wx44o1yQhk2+KmEYIcjLarhDiJm+f/B
        pNHwNbZlcE9S+3Y/dywOxmq8Ol7LwqeVkZTU
X-Google-Smtp-Source: AGRyM1tPWVCl6eVrzTkzJyugpkT7grFuKrcGCUvp8okpTLN9i/+5qyaD0ql7jAJqt2qvVYs5Br+YjA==
X-Received: by 2002:a17:902:efd1:b0:16b:dc3b:7fbc with SMTP id ja17-20020a170902efd100b0016bdc3b7fbcmr8185109plb.45.1656940000915;
        Mon, 04 Jul 2022 06:06:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709027e0100b001641b2d61d4sm21307998plm.30.2022.07.04.06.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 06:06:40 -0700 (PDT)
Message-ID: <62c2e5e0.1c69fb81.70319.e755@mx.google.com>
Date:   Mon, 04 Jul 2022 06:06:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-04-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-07-04-v5.19-rc5)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2022=
-07-04-v5.19-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-04-v5.19-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-04-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53f4b75e60cf6c4bedcc6638ff37f56eab20dc19

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f7828dc180ba3427b5e405fab25e9846c07322bc
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  02153f109bd422d93cfce7f5aa9d7b0e22fab13c =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/62c2d4b9585135a404a39bee

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62c2d4ba585135a404a39c7c
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:51:02.276801  quirement: !(pipe >=3D display->n_pipes || =
!display->pipes[pipe].enabled)
    2022-07-04T11:51:02.280497  Pipe D does not exist or not enabled
    2022-07-04T11:51:02.288339  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-07-04T11:51:02.295877  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-04T11:51:02.299579  Pipe E does not exist or not enabled
    2022-07-04T11:51:02.306867  Test re<6>[   72.146371] Console: switching=
 to colour dummy device 80x25
    2022-07-04T11:51:02.317558  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   72.157374] [IGT] kms_vblank: executing
    2022-07-04T11:51:02.319334  kms.c:2251:
    2022-07-04T11:51:02.331392  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   72.170322] [IGT] kms_vblank: starting subtest pipe-A-wait=
-forked-busy
    2022-07-04T11:51:02.334945  splay->pipes[pipe].enabled) =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62c2d4ba585135a404a39c7e
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:51:01.138016  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<8>[   70.975095] <LAVA_SIGNAL_TESTCASE TEST_CA=
SE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>
    2022-07-04T11:51:01.138722  kms.c:2251:
    2022-07-04T11:51:01.145778  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-04T11:51:01.150566  Pipe F does not exist or not enabled
    2022-07-04T11:51:01.156213  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc5 aarch64)
    2022-07-04T11:51:01.160585  Starting subtest: pipe-A-wait-forked-hang
    2022-07-04T11:51:01.174609  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i<6>[   71.015592] Console: switching t=
o colour dummy device 80x25
    2022-07-04T11:51:01.177864  915/gem_context.c:324:
    2022-07-04T11:51:01.186081  Test requirement: has_ban_period || has_<14=
>[   71.025106] [IGT] kms_vblank: executing
    2022-07-04T11:51:01.186972  bannable =

    ... (102 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62c2d4ba585135a404a39c80
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:51:00.057787  nabled)
    2022-07-04T11:51:00.060284  Pipe D does not exist or not enabled
    2022-07-04T11:51:00.068325  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-07-04T11:51:00.076543  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-04T11:51:00.080277  Pipe E does not exist or not enabled
    2022-07-04T11:51:00.093582  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<6>[   69.932632] Console: switching to colour =
dummy device 80x25
    2022-07-04T11:51:00.094420  kms.c:2251:
    2022-07-04T11:51:00.103876  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   69.943606] [IGT] kms_vblank: executing
    2022-07-04T11:51:00.107913  splay->pipes[pipe].enabled)
    2022-07-04T11:51:00.117554  Pipe F does not exist or not enable<14>[   =
69.957527] [IGT] kms_vblank: starting subtest pipe-A-wait-forked =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62c2d4ba585135a404a39c82
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:50:58.954647  BUG: Spawning 6 threads
    2022-07-04T11:50:58.956195  ****  END  ****
    2022-07-04T11:50:58.961431  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.706s)[0m
    2022-07-04T11:50:58.970475  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-07-04T11:50:58.977609  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-04T11:50:58.982218  Pipe C does not exist or not enabled
    2022-07-04T11:50:58.989972  Test requirement no<6>[   68.829452] Consol=
e: switching to colour dummy device 80x25
    2022-07-04T11:50:59.000916  t met in function igt_require_pipe, file ..=
/lib/igt_kms.c:2251:<14>[   68.840282] [IGT] kms_vblank: executing
    2022-07-04T11:50:59.014124  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes<14>[   68.854233] [IGT] kms_vblank: starting subtest=
 pipe-A-wait-idle
    2022-07-04T11:50:59.015876  [pipe].enabled) =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62c2d4ba585135a404a39c84
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:50:57.890828  [1mSubtest pipe-A-query-busy-hang: SKIP<8>[=
   67.726590] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang R=
ESULT=3Dskip>
    2022-07-04T11:50:57.891989   (0.000s)[0m
    2022-07-04T11:50:57.899076  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-07-04T11:50:57.907539  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-04T11:50:57.911211  Pipe C does not exist or not enabled
    2022-07-04T11:50:57.919200  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-07-04T11:50:57.927470  Test requirement: !<6>[   67.768048] Consol=
e: switching to colour dummy device 80x25
    2022-07-04T11:50:57.933864  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)
    2022-07-04T11:50:57.938338  Pip<14>[   67.777892] [IGT] kms_vblank: exe=
cuting
    2022-07-04T11:50:57.941924  e D does not exist or not enabled =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62c2d4ba585135a404a39c86
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:50:56.837836  abled)
    2022-07-04T11:50:56.840860  Pipe D does not exist or not enabled
    2022-07-04T11:50:56.849643  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-07-04T11:50:56.857542  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-04T11:50:56.860547  Pipe E does not exist or not enabled
    2022-07-04T11:50:56.875041  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_k<6>[   66.714582] Console: switching to colour=
 dummy device 80x25
    2022-07-04T11:50:56.875682  ms.c:2251:
    2022-07-04T11:50:56.885850  Test requirement: !(pipe >=3D display->n_pi=
pes || !dis<14>[   66.725322] [IGT] kms_vblank: executing
    2022-07-04T11:50:56.888469  play->pipes[pipe].enabled)
    2022-07-04T11:50:56.898856  Pipe F does not exist or not enabled<14>[  =
 66.737145] [IGT] kms_vblank: starting subtest pipe-A-query-busy =

    ... (96 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62c2d4ba585135a404a39c88
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:50:55.711326  t requirement: !(pipe >=3D display->n_pipes=
 || !display->pipes[pipe].enabled)
    2022-07-04T11:50:55.715044  Pipe D does not exist or not enabled
    2022-07-04T11:50:55.722681  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-07-04T11:50:55.730325  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-07-04T11:50:55.734401  Pipe E does not exist or not enabled
    2022-07-04T11:50:55.741471  Tes<6>[   65.580511] Console: switching to =
colour dummy device 80x25
    2022-07-04T11:50:55.752388  t requirement not met in function igt_requi=
re_pipe, file ../lib/<14>[   65.591551] [IGT] kms_vblank: executing
    2022-07-04T11:50:55.753441  igt_kms.c:2251:
    2022-07-04T11:50:55.766231  Test requirement: !(pipe >=3D display->n_pi=
pes ||<14>[   65.605418] [IGT] kms_vblank: starting subtest pipe-A-query-fo=
rked
    2022-07-04T11:50:55.769152   !display->pipes[pipe].enabled) =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62c2d4ba585135a404a39c8a
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:50:54.601984  <6>[   64.445783] Console: switching to col=
our dummy device 80x25
    2022-07-04T11:50:54.607070  <14>[   64.452739] [IGT] kms_vblank: execut=
ing
    2022-07-04T11:50:54.621455  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc5 aarch64)<14>[   64.459014] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle
    2022-07-04T11:50:54.621898  =

    2022-07-04T11:50:54.624534  Starting subtest: pipe-A-query-idle
    2022-07-04T11:50:54.707565  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-07-04T11:50:55.047256  (kms_vblank:586) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-07-04T11:50:55.054793  (kms_vblank:586) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-07-04T11:50:55.060071  (kms_vblank:586) CRITICAL: Last errno: 22, =
Invalid argument
    2022-07-04T11:50:55.064863  (kms_vblank:586) CRITICAL: error: -22 !=3D =
0 =

    ... (73 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62c2d4ba585135a404a39c8b
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:50:53.497836  <6>[   63.341592] Console: switching to col=
our dummy device 80x25
    2022-07-04T11:50:53.503122  <14>[   63.348539] [IGT] kms_vblank: execut=
ing
    2022-07-04T11:50:53.517025  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc5 aarch64)<14>[   63.354844] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle
    2022-07-04T11:50:53.517113  =

    2022-07-04T11:50:53.521021  Starting subtest: pipe-A-accuracy-idle
    2022-07-04T11:50:53.592006  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-07-04T11:50:53.962447  (kms_vblank:582) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-07-04T11:50:53.969610  (kms_vblank:582) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-07-04T11:50:53.975931  (kms_vblank:582) CRITICAL: Last errno: 22, =
Invalid argument
    2022-07-04T11:50:53.980250  (kms_vblank:582) CRITICAL: error: -22 !=3D =
0 =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2c2d4ba585135a404a39c94
        failing since 16 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-07-04T11:50:50.096896  <8>[   59.942674] <LAVA_SIGNAL_TESTSET STOP>
    2022-07-04T11:50:50.133756  <8>[   59.978304] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-07-04T11:50:50.167781  <6>[   60.010780] Console: switching to col=
our dummy device 80x25
    2022-07-04T11:50:50.172336  <14>[   60.017753] [IGT] kms_setmode: execu=
ting
    2022-07-04T11:50:50.185050  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc5 aarch64)<14>[   60.023089] [IGT] kms_setmode: starting subtest=
 basic
    2022-07-04T11:50:50.185508  =

    2022-07-04T11:50:50.187829  Starting subtest: basic
    2022-07-04T11:50:50.191970  Testing: basic 1 connector combinations
    2022-07-04T11:50:50.300889  <14>[   60.143502] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-07-04T11:50:50.305236  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
