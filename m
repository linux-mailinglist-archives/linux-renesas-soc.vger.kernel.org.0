Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176936FC8E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 16:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbjEIO01 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 10:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235913AbjEIO0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 10:26:20 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744E64EF1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 07:26:02 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-250175762b8so5140467a91.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683642360; x=1686234360;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BA4UfUCSZybq/z3tjww7fNTULxe57QVu6cUDNcuZcEg=;
        b=OOu5qbDYS6KdkTYRNIPWBZvlSlCQ1yU6k7sL9OXQDWNUE09+RGaZOpAwEMfyYFX0BL
         Qu9K8AE5RDNaO7iV8x2rhI2jW0mN0PEWUML8tEibO/MaVP4blNekZPozzNTV0bazJOnj
         aqJ/31pfAZjL+zSaYCn5bpuHwgHDMBX6l27f0wQPhgCMUFsKwb3lTtRC9lyaTMXGtWSt
         j/bdkWorsZM2qLG3vEWxqlFFi0Nox+R5JE7MqhJjXVNYPWO6guc/8tAIDMn3ZBTjY8rx
         ggugG3N1lU25Qod2Pnn64wojllIgPEvi8Yao9LVZ4BzX4MT84Qaz1icVGu+nFHF/f0Ks
         uYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642360; x=1686234360;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BA4UfUCSZybq/z3tjww7fNTULxe57QVu6cUDNcuZcEg=;
        b=ZCI4Wpd6T2dUbsf6fddeblPHqCwxER+8S9Gtet0vjILF4uc6KPDxTj/05+FsZGQzpU
         QZ7xuqRjZjsd+tLVfLLnRy3mnSwuM7EFkqYra+NL2yYIv1IEk//gfFoU1XFU8w+TBuxY
         /rm/2M7w8Eb+5m5fbCGkBJvk7W9oOnhtNUagTu9YQ/wo/FAT8q4XmrlyBKgV1TwYhgAV
         evpM1Zt+geQFSEJ/hFdmQKvsAvFw2sFUijfIwVJhO15doikzih4DwvsRAy/9Xs19kYfq
         d3wG6t1CmUm6rcN/Ym4YaSEYqGtt4o9yZYXo7/nkqWZfdkjikalIXyMZHqVSPyxN/F2i
         i44A==
X-Gm-Message-State: AC+VfDyl0NDvNpj5miv6+mE22VHU6AcY+xkvekMWp4OgD2blQkNL6JmM
        dlp0mZ9JBNpgCA9Uf2LSk+IsGWtali8PzSFcTlVHcQ==
X-Google-Smtp-Source: ACHHUZ6Hnm/y93j8cE5o0Zzejw7pEsFL8bnv5rgVy/fOck3PJsNaeNT2HpJbveqtqVg98wMSfDBm3Q==
X-Received: by 2002:a17:90b:1810:b0:250:981f:365a with SMTP id lw16-20020a17090b181000b00250981f365amr5288999pjb.23.1683642360211;
        Tue, 09 May 2023 07:26:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x4-20020a17090a6c0400b002310ed024adsm12188856pjj.12.2023.05.09.07.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:25:59 -0700 (PDT)
Message-ID: <645a57f7.170a0220.a2d6d.7ee8@mx.google.com>
Date:   Tue, 09 May 2023 07:25:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-05-09-v6.4-rc1)
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
-05-09-v6.4-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-09-v6.4-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  28d9a3c4fb4c99aafc31b288b3f735e19e728d64
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2f0a07378e58e5c7d7b589b39ace7e3a2317f6b2 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/645a4950b77e48e59d2e8603

  Results:     66 PASS, 23 FAIL, 198 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230421.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/645a4951b77e48e59d2e86c2
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:11.052139  ].enabled)

    2023-05-09T13:21:11.056151  Pipe D does not exist or not enabled

    2023-05-09T13:21:11.064360  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-05-09T13:21:11.071893  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-09T13:21:11.075348  Pipe E does not exist or not enabled

    2023-05-09T13:21:11.088675  Test requirement not met in function igt_re=
quire_pipe, file ../lib/i<6>[   55.726179] Console: switching to colour dum=
my device 80x25

    2023-05-09T13:21:11.090420  gt_kms.c:2411:

    2023-05-09T13:21:11.099644  Test requirement: !(pipe >=3D display->n_pi=
pes || <14>[   55.738269] [IGT] kms_vblank: executing

    2023-05-09T13:21:11.102961  !display->pipes[pipe].enabled)

    2023-05-09T13:21:11.113539  Pipe F does not exist or not ena<14>[   55.=
750009] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-busy
 =

    ... (120 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/645a4951b77e48e59d2e86c4
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:09.875772  equirement: !(pipe >=3D display->n_pipes ||=
 !display->pipes[pipe].enabled)

    2023-05-09T13:21:09.879837  Pipe H does not exist or not enabled

    2023-05-09T13:21:09.886012  IGT-Version: 1.27.1-g2f0a073 (aarch64) (Lin=
ux: 6.4.0-rc1 aarch64)

    2023-05-09T13:21:09.890512  Starting subtest: pipe-A-wait-forked-hang

    2023-05-09T13:21:09.900289  Test requirement not met in functi<6>[   54=
.542529] Console: switching to colour dummy device 80x25

    2023-05-09T13:21:09.905434  <14>[   54.549671] [IGT] kms_vblank: execut=
ing

    2023-05-09T13:21:09.918508  on gem_context_require_bannable, file ../li=
b/i915/gem_context.c:<14>[   54.555402] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy

    2023-05-09T13:21:09.919409  324:

    2023-05-09T13:21:09.924058  Test requirement: has_ban_period || has_ban=
nable

    2023-05-09T13:21:09.927978  Last errno: 22, Invalid argument
 =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/645a4951b77e48e59d2e86c6
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:08.650731  nabled)

    2023-05-09T13:21:08.655030  Pipe D does not exist or not enabled

    2023-05-09T13:21:08.663412  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-05-09T13:21:08.671131  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-09T13:21:08.674385  Pipe E does not exist or not enabled

    2023-05-09T13:21:08.688067  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<6>[   53.329952] Console: switching to colour =
dummy device 80x25

    2023-05-09T13:21:08.689358  kms.c:2411:

    2023-05-09T13:21:08.699226  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   53.337844] [IGT] kms_vblank: executing

    2023-05-09T13:21:08.701908  splay->pipes[pipe].enabled)

    2023-05-09T13:21:08.712588  Pipe F does not exist or not enable<14>[   =
53.350270] [IGT] kms_vblank: starting subtest pipe-A-wait-forked
 =

    ... (122 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/645a4951b77e48e59d2e86c8
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:07.415901  nabled)

    2023-05-09T13:21:07.418171  Pipe E does not exist or not enabled

    2023-05-09T13:21:07.425946  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-05-09T13:21:07.434366  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-09T13:21:07.437736  Pipe F does not exist or not enabled

    2023-05-09T13:21:07.450971  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<6>[   52.089593] Console: switching to colour =
dummy device 80x25

    2023-05-09T13:21:07.452879  kms.c:2411:

    2023-05-09T13:21:07.462202  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   52.100513] [IGT] kms_vblank: executing

    2023-05-09T13:21:07.465103  splay->pipes[pipe].enabled)

    2023-05-09T13:21:07.475414  Pipe G does not exist or not enable<14>[   =
52.112662] [IGT] kms_vblank: starting subtest pipe-A-wait-idle
 =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/645a4951b77e48e59d2e86ca
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:06.200930  ile ../lib/i915/gem_context.c:324:

    2023-05-09T13:21:06.206326  Test requirement: has_ban_period || has_ban=
nable

    2023-05-09T13:21:06.209289  Last errno: 22, Invalid argument

    2023-05-09T13:21:06.215113  =1B[1mSubtest pipe-A-query-busy-hang: SKIP =
(0.000s)=1B[0m

    2023-05-09T13:21:06.223515  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-05-09T13:21:06.235298  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pip<6>[   50.875847] Console: switching to colour dummy de=
vice 80x25

    2023-05-09T13:21:06.236893  es[pipe].enabled)

    2023-05-09T13:21:06.241055  Pipe C does not exist or not enabled

    2023-05-09T13:21:06.246264  Test re<14>[   50.884734] [IGT] kms_vblank:=
 executing

    2023-05-09T13:21:06.260230  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   50.896980] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy
 =

    ... (128 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/645a4951b77e48e59d2e86cc
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:05.052114  kms.c:2411:

    2023-05-09T13:21:05.058816  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-09T13:21:05.062426  Pipe E does not exist or not enabled

    2023-05-09T13:21:05.070950  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-05-09T13:21:05.078798  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-05-09T13:21:05.087542  Pipe F does not exist or <6>[   49.726903] =
Console: switching to colour dummy device 80x25

    2023-05-09T13:21:05.088915  not enabled

    2023-05-09T13:21:05.098382  Test requirement not met in function igt_re=
quire_pi<14>[   49.737252] [IGT] kms_vblank: executing

    2023-05-09T13:21:05.101744  pe, file ../lib/igt_kms.c:2411:

    2023-05-09T13:21:05.111452  Test requirement: !(pipe >=3D dis<14>[   49=
.749079] [IGT] kms_vblank: starting subtest pipe-A-query-busy
 =

    ... (113 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/645a4951b77e48e59d2e86ce
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:03.802112  ile ../lib/i915/gem_context.c:324:

    2023-05-09T13:21:03.806908  Test requirement: has_ban_period || has_ban=
nable

    2023-05-09T13:21:03.810488  Last errno: 22, Invalid argument

    2023-05-09T13:21:03.815772  =1B[1mSubtest pipe-A-query-idle-hang: SKIP =
(0.000s)=1B[0m

    2023-05-09T13:21:03.823962  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2411:

    2023-05-09T13:21:03.836436  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pip<6>[   48.477691] Console: switching to colour dummy de=
vice 80x25

    2023-05-09T13:21:03.838180  es[pipe].enabled)

    2023-05-09T13:21:03.841712  Pipe C does not exist or not enabled

    2023-05-09T13:21:03.846871  Test re<14>[   48.485727] [IGT] kms_vblank:=
 executing

    2023-05-09T13:21:03.860358  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   48.498229] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked
 =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/645a4951b77e48e59d2e86d0
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:02.584116  <6>[   47.226759] Console: switching to col=
our dummy device 80x25

    2023-05-09T13:21:02.589421  <14>[   47.233524] [IGT] kms_vblank: execut=
ing

    2023-05-09T13:21:02.602619  IGT-Version: 1.27.1-g2f0a073 (aarch64) (Lin=
ux: 6.4.0-rc1 aarch64<14>[   47.239977] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle

    2023-05-09T13:21:02.603088  )

    2023-05-09T13:21:02.606991  Starting subtest: pipe-A-query-idle

    2023-05-09T13:21:02.695485  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1

    2023-05-09T13:21:03.118060  (kms_vblank:561) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-05-09T13:21:03.125567  (kms_vblank:561) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-05-09T13:21:03.131127  (kms_vblank:561) CRITICAL: Last errno: 22, =
Invalid argument

    2023-05-09T13:21:03.135960  (kms_vblank:561) CRITICAL: error: -22 !=3D 0
 =

    ... (77 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/645a4951b77e48e59d2e86d1
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:21:01.321843  <6>[   45.963942] Console: switching to col=
our dummy device 80x25

    2023-05-09T13:21:01.325871  <14>[   45.970641] [IGT] kms_vblank: execut=
ing

    2023-05-09T13:21:01.340292  IGT-Version: 1.27.1-g2f0a073 (aarch64) (Lin=
ux: 6.4.0-rc1 aarch64<14>[   45.976998] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-05-09T13:21:01.340829  )

    2023-05-09T13:21:01.344166  Starting subtest: pipe-A-accuracy-idle

    2023-05-09T13:21:01.429315  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-05-09T13:21:01.900659  (kms_vblank:558) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-05-09T13:21:01.907660  (kms_vblank:558) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-05-09T13:21:01.913587  (kms_vblank:558) CRITICAL: Last errno: 22, =
Invalid argument

    2023-05-09T13:21:01.918148  (kms_vblank:558) CRITICAL: error: -22 !=3D 0
 =

    ... (90 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
45a4951b77e48e59d2e86da
        failing since 325 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-05-09T13:20:57.656304  <8>[   42.295955] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>

    2023-05-09T13:20:57.662545  <8>[   42.307380] <LAVA_SIGNAL_TESTSET STOP>

    2023-05-09T13:20:57.695977  <8>[   42.337308] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-05-09T13:20:57.729789  <6>[   42.372473] Console: switching to col=
our dummy device 80x25

    2023-05-09T13:20:57.735116  <14>[   42.379255] [IGT] kms_setmode: execu=
ting

    2023-05-09T13:20:57.748059  IGT-Version: 1.27.1-g2f0a073 (aarch64) (Lin=
ux: 6.4.0-rc1 aarch64<14>[   42.384452] [IGT] kms_setmode: starting subtest=
 basic

    2023-05-09T13:20:57.748531  )

    2023-05-09T13:20:57.750465  Starting subtest: basic

    2023-05-09T13:20:57.754057  Testing: basic 1 connector combinations

    2023-05-09T13:20:57.846377  <14>[   42.488352] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
 =

    ... (79 line(s) more)  =

 =20
