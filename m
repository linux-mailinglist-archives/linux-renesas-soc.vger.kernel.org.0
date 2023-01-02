Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8686C65B161
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jan 2023 12:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbjABLnf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Jan 2023 06:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbjABLnH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jan 2023 06:43:07 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F49D6561
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jan 2023 03:42:37 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so27995411pjj.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jan 2023 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zw3RstBV0k/XSjOPGarsJDjnNgRFdAxDQuTxCByd7Qg=;
        b=KAJJcwNstkZi3LMSwhywEIGK5AGp/HKWYgXRzCk7BvX6aVpfwiR8hppd8rha7vOLfP
         /fyos6o00i6asz3MLPztPjumtdFrbJb9JtllQSmqMyWq7CEuCGrzmvYcpuufTtrmkCQs
         AXbVCaI3C+/TVnBOFSud3nb7sLrEFGpiGw/I50Q6auCUThh6HmM82tcVyjSzpzbp7ufF
         SCbCNpuYlq+Z+1Phjjl2xCCLDk7USbtgsgOgl1Q9B8FGDJu8b4+RlqHUrufZAx44/zzr
         Eoz3BnzY/akjxo+jfMNvZ9kTH87StdBP+gRozCBmvNeKFWT2ipvWT9Jjq03o2Jul4czb
         HKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw3RstBV0k/XSjOPGarsJDjnNgRFdAxDQuTxCByd7Qg=;
        b=3gI785PsJP+bxL6tF7Be+i/VBZJ04FmhGf7nwrt/DTkngRiYcRP2q26WW5XEINpukB
         uYO7g/bCCK3trWVpogGGbE7be+t59LLVpsfEi9oYj2pYr7Vy2JmhyjF5qhRdLltgLSYC
         CtTc8MblYBHLwR+gXiihGCB2jpJd9kfB+hCHnkDETSmp2OUGgjkW4lv7ORN687QXB7Mp
         7h6GYvW43dn/CPR+f65oJdyPvZC7hh5C+1BmAdNscNeaNCWOZj46QDqgYsDn3Auyg4Ww
         OVvhk+DqWwFkj1d9RVYzQcvIfu4HC0m5MC87iVjG+HEAm/Fg8Jj4/9Ep/hn/tAjCv9Hk
         bUfg==
X-Gm-Message-State: AFqh2koXxqMz49MEJUJ8/1VnNoHHjGLRVEFRDrxlxKJgCLprZdkizcVe
        Zv4Gam+2AnAOJBUWs+GJ9T/tdZ5nJ0ri6YfVXI0=
X-Google-Smtp-Source: AMrXdXv2dHSevelbNVctQos/1ho/X8y1R9c/tW2TCA0IAFxbYK2m/cGTZm7iHehLbAN1uslN4ku2MQ==
X-Received: by 2002:a05:6a20:b725:b0:b0:1e9b:f517 with SMTP id fg37-20020a056a20b72500b000b01e9bf517mr43614248pzb.44.1672659756484;
        Mon, 02 Jan 2023 03:42:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u190-20020a6260c7000000b0056bc5ad4862sm18242399pfb.28.2023.01.02.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:42:35 -0800 (PST)
Message-ID: <63b2c32b.620a0220.3c25f.dbc6@mx.google.com>
Date:   Mon, 02 Jan 2023 03:42:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-02-v6.2-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 2 runs,
 10 regressions (renesas-devel-2023-01-02-v6.2-rc2)
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
-01-02-v6.2-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-02-v6.2-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-02-v6.2-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b61285fe1d0f3d98f4780d0889af30b13655c32e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  874af994636a534236a747a88aec086b9b35b001
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f2f515390fb11554d22c7b78b94e288026545326 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63b2b38d9760f465b64eee42

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221216.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63b2b38d9760f465b64eeecf
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:34:03.982066  Test requirement: !(pipe >=3D display->n_pi=
pes || <8>[   65.287458] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-wait-b=
usy-hang RESULT=3Dskip>
    2023-01-02T10:34:03.984631  !display->pipes[pipe].enabled)
    2023-01-02T10:34:03.988888  Pipe D does not exist or not enabled
    2023-01-02T10:34:03.996943  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-02T10:34:04.006836  Test requirement: !(pipe >=3D display->n<6>=
[   65.315441] Console: switching to colour dummy device 80x25
    2023-01-02T10:34:04.010488  _pipes || !display->pipes[pipe].enabled)
    2023-01-02T10:34:04.010750  =

    2023-01-02T10:34:04.017988  Pipe E does not exist <14>[   65.323184] [I=
GT] kms_vblank: executing
    2023-01-02T10:34:04.019096  or not enabled
    2023-01-02T10:34:04.031420  Test requirement not met in function igt_re=
quire<14>[   65.335033] [IGT] kms_vblank: starting subtest pipe-A-wait-fork=
ed-busy =

    ... (149 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63b2b38d9760f465b64eeed1
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:34:02.821366  t: !(pipe >=3D display->n_pipes || !display=
->pipes[pipe].enabled)
    2023-01-02T10:34:02.825428  Pipe C does not exist or not enabled
    2023-01-02T10:34:02.834173  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-02T10:34:02.841165  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-02T10:34:02.842014  =

    2023-01-02T10:34:02.845680  Pipe D does not exist or not enabled
    2023-01-02T10:34:02.859955  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:23<6>[   64.168680] Console: switching to=
 colour dummy device 80x25
    2023-01-02T10:34:02.860043  58:
    2023-01-02T10:34:02.860294  =

    2023-01-02T10:34:02.869753  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->p<14>[   64.176247] [IGT] kms_vblank: executing =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63b2b38d9760f465b64eeed3
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:34:01.648188  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].<8>[   62.953203] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2023-01-02T10:34:01.648456  =

    2023-01-02T10:34:01.649957  enabled)
    2023-01-02T10:34:01.652990  Pipe D does not exist or not enabled
    2023-01-02T10:34:01.653259  =

    2023-01-02T10:34:01.660717  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-02T10:34:01.661287  =

    2023-01-02T10:34:01.669611  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-02T10:34:01.672832  Pipe E does not exist or not enabled
    2023-01-02T10:34:01.685798  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt<6>[   62.991998] Console: switching to colour d=
ummy device 80x25 =

    ... (136 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63b2b38d9760f465b64eeed5
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:34:00.517180  IGT-Version:<8>[   61.818758] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>
    2023-01-02T10:34:00.521930   1.26-gf2f5153 (aarch64) (Linux: 6.2.0-rc2 =
aarch64)
    2023-01-02T10:34:00.526760  Starting subtest: pipe-A-query-forked-busy-=
hang
    2023-01-02T10:34:00.527027  =

    2023-01-02T10:34:00.541954  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_co<6>[   61.850883] Console: s=
witching to colour dummy device 80x25
    2023-01-02T10:34:00.546211  <14>[   61.858287] [IGT] kms_vblank: execut=
ing
    2023-01-02T10:34:00.546498  =

    2023-01-02T10:34:00.547777  ntext.c:324:
    2023-01-02T10:34:00.553255  Test requirement: has_ban_period || has_ban=
nable
    2023-01-02T10:34:00.559807  <14>[   61.864017] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-idle =

    ... (132 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63b2b38d9760f465b64eeed7
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:33:59.316282  =

    2023-01-02T10:33:59.322766  nt not met in function igt_require_pipe, fi=
le ../lib/igt_kms.c:2358:
    2023-01-02T10:33:59.331083  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-02T10:33:59.334567  Pipe E does not exist or not enabled
    2023-01-02T10:33:59.343001  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-02T10:33:59.354262  Test requirement: !(pipe >=3D display->n_pi=
pes || <6>[   60.661635] Console: switching to colour dummy device 80x25
    2023-01-02T10:33:59.357060  !display->pipes[pipe].enabled)
    2023-01-02T10:33:59.364334  Pipe F does not exist or not ena<14>[   60.=
670189] [IGT] kms_vblank: executing
    2023-01-02T10:33:59.365174  bled
    2023-01-02T10:33:59.379345  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc2 aar<14>[   60.682448] [IGT] kms_vblank: starting subtest pipe-A=
-query-forked-busy =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63b2b38d9760f465b64eeed9
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:33:58.194231  ment: has_ban_period || has_bannable
    2023-01-02T10:33:58.196704  Last errno: 22, Invalid argument
    2023-01-02T10:33:58.202622  =1B[1mSubtest pipe-A-query-forked-hang: SKI=
P (0.000s)=1B[0m
    2023-01-02T10:33:58.202892  =

    2023-01-02T10:33:58.211067  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-02T10:33:58.217980  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-02T10:33:58.218250  =

    2023-01-02T10:33:58.227277  Pipe C does not exist or no<6>[   59.533431=
] Console: switching to colour dummy device 80x25
    2023-01-02T10:33:58.229066  t enabled
    2023-01-02T10:33:58.238513  Test requirement not met in function igt_re=
quire_pipe<14>[   59.543957] [IGT] kms_vblank: executing =

    ... (115 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63b2b38d9760f465b64eeedb
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:33:56.920924  file ../lib/igt_kms.c:2358:
    2023-01-02T10:33:56.928012  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-02T10:33:56.932106  Pipe E does not exist or not enabled
    2023-01-02T10:33:56.940229  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-02T10:33:56.947789  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-02T10:33:56.954961  Pipe F do<6>[   58.261485] Console: switchi=
ng to colour dummy device 80x25
    2023-01-02T10:33:56.957805  es not exist or not enabled
    2023-01-02T10:33:56.958072  =

    2023-01-02T10:33:56.962029  <14>[   58.271650] [IGT] kms_vblank: execut=
ing
    2023-01-02T10:33:56.968524  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc2 aarch64) =

    ... (146 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63b2b38d9760f465b64eeedd
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:33:55.725180  <6>[   57.035108] Console: switching to col=
our dummy device 80x25
    2023-01-02T10:33:55.729869  <14>[   57.041772] [IGT] kms_vblank: execut=
ing
    2023-01-02T10:33:55.737013  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc2 aarch64)
    2023-01-02T10:33:55.743939  <14>[   57.048250] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2023-01-02T10:33:55.744711  =

    2023-01-02T10:33:55.744807  =

    2023-01-02T10:33:55.747350  Starting subtest: pipe-A-query-idle
    2023-01-02T10:33:55.748122  =

    2023-01-02T10:33:55.842165  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2023-01-02T10:33:56.214947  (kms_vblank:546) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290: =

    ... (100 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63b2b38d9760f465b64eeede
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:33:54.533449  <6>[   55.842916] Console: switching to col=
our dummy device 80x25
    2023-01-02T10:33:54.538103  <14>[   55.849586] [IGT] kms_vblank: execut=
ing
    2023-01-02T10:33:54.544628  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc2 aarch64)
    2023-01-02T10:33:54.552080  <14>[   55.856108] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2023-01-02T10:33:54.552775  =

    2023-01-02T10:33:54.553085  =

    2023-01-02T10:33:54.556115  Starting subtest: pipe-A-accuracy-idle
    2023-01-02T10:33:54.643326  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2023-01-02T10:33:55.065520  (kms_vblank:543) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2023-01-02T10:33:55.072613  (kms_vblank:543) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3b2b38d9760f465b64eeee7
        failing since 198 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-02T10:33:50.986679  <8>[   52.298365] <LAVA_SIGNAL_TESTSET STOP>
    2023-01-02T10:33:51.027249  <8>[   52.337653] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2023-01-02T10:33:51.064197  <6>[   52.373396] Console: switching to col=
our dummy device 80x25
    2023-01-02T10:33:51.069105  <14>[   52.380133] [IGT] kms_setmode: execu=
ting
    2023-01-02T10:33:51.075053  IGT-Version: 1.26-gf2f5153 (aarch64) (Linux=
: 6.2.0-rc2 aarch64)
    2023-01-02T10:33:51.081825  <14>[   52.385493] [IGT] kms_setmode: start=
ing subtest basic
    2023-01-02T10:33:51.082670  =

    2023-01-02T10:33:51.084939  Starting subtest: basic
    2023-01-02T10:33:51.088041  Testing: basic 1 connector combinations
    2023-01-02T10:33:51.202471  <14>[   52.510407] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1 =

    ... (94 line(s) more)  =

 =20
