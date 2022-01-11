Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A27448B1A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jan 2022 17:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349835AbiAKQJc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jan 2022 11:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349820AbiAKQJb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 11:09:31 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AADC06173F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 08:09:31 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso6184667pje.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VSqPfOpseUJ5ExhyYmswu/5ztgs6zobYnp8iUOCh+Xk=;
        b=vd816g2ra/qRz0YgkJEUgHyibwOWfji+8P7/XqmRIpmzxomLE1Gn49T1Q7m5WIyEIV
         WzZhJ2biEsH3/M3r481doMLbkKTmLv8STSpgRBh1lPL9bzRpRRl5rO15WQnGk9TdDfoi
         1oPyUx5aPJXN1tg598WN+UgO4Iz5IRNNmbV2TXd7RlmbgmojAgX6ZDXvQF7yICdmgP4i
         qyCtlTcmKItFJE9Jk5tWuMnkCDZIIxgYheL4SLOfXpHucqnycWwJg4E9h2/Y4oA2dVTr
         t4s2E0wIuzO04HwxzmmHjHaV2r1mo/YfBuI1cYMR/yuUpkNaTyr7kA5J571PS3mmSPuC
         qRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VSqPfOpseUJ5ExhyYmswu/5ztgs6zobYnp8iUOCh+Xk=;
        b=PApWtlTc70jOQ2Cyy+aqFymfNSDT7aqx/vy/UAXgnSkdAIWB5xXoDvAtZecPF6eGju
         NYAHDlAsqFkLEfwkpMk4raWMW7JAPnzlG3UfihLq0wmuDH2XXklS0Pfld6X9jW6Is8Ae
         Cgvd4ngnPpTKBy0UcmP8FMOAIrybT4mumhSGApBzlsF9B88wcTqJbRnVKJwlMpbcLGOv
         wOsRk5LbKT/VlNKbYIRL5Rot1ojMjQhVIa2aYRf2YL/ZANwCFHs/ncd+G/GmZh0dMNgE
         qeBrvPAnuxmUZ66rBsONGo9ySt2IpAgpvFSjrwBo7cJgMBH1uBojiba/ke93SXEs0Fgo
         8lCg==
X-Gm-Message-State: AOAM532HqfjPihbUn5PoUrL/m5Y+r9mj6893EPid61RnNYNm6y6I5HCc
        WMt/nxA6gvTlUUmqo6p9uwbfI0jXEG7ZXhiX
X-Google-Smtp-Source: ABdhPJyL5FGMBSgjqKMXqfnDVllg0aere9maXMehbn5xrVVKH7VXbk9kyJBSd6PjN0/wAoLKI0kmNg==
X-Received: by 2002:a17:903:191:b0:14a:59cb:3199 with SMTP id z17-20020a170903019100b0014a59cb3199mr2314966plg.139.1641917371026;
        Tue, 11 Jan 2022 08:09:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f13sm11615726pfv.98.2022.01.11.08.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:09:30 -0800 (PST)
Message-ID: <61ddabba.1c69fb81.db520.c9e1@mx.google.com>
Date:   Tue, 11 Jan 2022 08:09:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-01-11-v5.16
X-Kernelci-Branch: master
Subject: renesas/master baseline: 476 runs,
 3 regressions (renesas-devel-2022-01-11-v5.16)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 476 runs, 3 regressions (renesas-devel-2022-01-11-=
v5.16)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-11-v5.16/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-11-v5.16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6db3d37d04fb23ae868d4ab8b0f4a869c32e0b4b =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dd7bad93cf7ce1d8ef6741

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dd7bad93cf7ce1d8ef6=
742
        failing since 56 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dd79c11982db02fdef6751

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dd79c11982db02fdef6=
752
        new failure (last pass: renesas-devel-2022-01-10-v5.16) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dd7daa4333b29d5def6761

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dd7daa4333b29d5def6=
762
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8) =

 =20
