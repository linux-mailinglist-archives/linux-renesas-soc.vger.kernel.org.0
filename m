Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF03641B755
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 21:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242426AbhI1TSF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 15:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242422AbhI1TSF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 15:18:05 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDCAC06161C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id b68so1794829pfb.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Igxeg+LOa3PfPznlFPrZ3IIhw8laVTwIPPt4sRNV06o=;
        b=lUG9UmzB0Ay9ezOmqRro8w9SzOseaVUKW+zQXhVLGZ9/hcZv9zVGCEv1Zh3KSizWrx
         Qn/wXiCHtdbJ1Nd9GATsmoFDMtKCatMcMDFp8Dxs2DFUHh58QGPAl1zcF4bcgJBtSi2F
         bMI/FRUqW3tWycXu9GXMTUPJsLdAb36SAmtl3vA7Xox6KFxyyDK61PgqBtIZES6MfmZD
         rpeJd7/GEg2hKS1MC7A10aRiwWUnQyK0b6rvWO0DP0Bd5iGeCbNGWPQn/ZynglvtIP21
         XFsjoQVjsjRPXmd3dl+20zBk/QPgG825IFUam2GSDr4vDqFLfN0VG9o2S38fvDnU2JSf
         lDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Igxeg+LOa3PfPznlFPrZ3IIhw8laVTwIPPt4sRNV06o=;
        b=eZihl6GI165W1GgxJYx3y98yFKkLtuS2klRlOOPqX8qptKl0zl5GWSWubY31I0+FEk
         lpglDR5/oIYgBorfeOu+vX/wb1AGX7elTANXWzF1OHGDKfGT/WqPkZQbfcUWIOK0Kb7Y
         kX6QWH8KKVxnh6JuLx/Gcan9oW3uApO1Z3iyaf3XG+ejAJvI0qEA2MinLvzrQLWnDgNl
         KCBEFCpS1OHt7fEY5Vj5MlJMseXhNYFfpLRYBugBCMFOvYxi1FIE/AN2zuIuGyoddfd3
         yLhf7BjKmDXvl4+UPSqeXZ41KAW0rn3OrzjZuAC4h5QtOVMFEZ2dUNmF7CCI0l2HFRmB
         NyQw==
X-Gm-Message-State: AOAM530F30nGJ/R/f5WM2QXWDAaXQIQzCbG3Ev9J3/Ffb8u9BMtvZiF9
        usYTkrurYhFpRRon/UA63Ji4v0uKUd+BdRaM
X-Google-Smtp-Source: ABdhPJzpvVm667bYycL2HO+qwxniVWLv85obD3dhFmbWv1Esr9u0cgVjo2o6+tk0Mf9dvAUdmvt+Ng==
X-Received: by 2002:a05:6a00:1a87:b0:448:7376:20c3 with SMTP id e7-20020a056a001a8700b00448737620c3mr7165198pfv.24.1632856584705;
        Tue, 28 Sep 2021 12:16:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u24sm22880561pfm.81.2021.09.28.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 12:16:24 -0700 (PDT)
Message-ID: <61536a08.1c69fb81.42d6a.98b6@mx.google.com>
Date:   Tue, 28 Sep 2021 12:16:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-28-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2021-09-28-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2021-09-=
28-v5.15-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-28-v5.15-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-28-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a462ac13da67252c742a2c044b302f37eae9d089

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1084c5eb74fd0daf8c9b8e83e85f5208c396579b =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61535c7371bd8ed93399a2dd

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61535c7371bd8ed93399a2e0
        failing since 6 days (last pass: v5.15-rc1-39-gcbbd8f16ae1c, first =
fail: renesas-next-2021-09-20-v5.15-rc1)

    2021-09-28T18:18:06.382411  <8>[   22.981184] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2021-09-28T18:18:06.418347  <6>[   23.020484] Console: switching to col=
our dummy device 80x25
    2021-09-28T18:18:06.424033  <14>[   23.027812] [IGT] panfrost_submit: e=
xecuting
    2021-09-28T18:18:06.430672  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc1 aarch64)
    2021-09-28T18:18:06.441452  <14>[   23.042606] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-09-28T18:18:06.446342  Starting subtest: pan-unhandled-pagefault
    2021-09-28T18:18:06.558144  (panfrost_submit:346) CRITICAL: Test assert=
ion failure function __real_main65, file ../tests/panfrost_submit.c:179:
    2021-09-28T18:18:06.565943  (panfrost_s<14>[   23.165295] [IGT] panfros=
t_submit: exiting, ret=3D98
    2021-09-28T18:18:06.578167  ubmit:346) CRITICAL: Failed assertion: sync=
obj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_NSEC), 0, N=
ULL)
    2021-09-28T18:18:06.579373  Stack trace: =

    ... (17 line(s) more)  =

 =20
