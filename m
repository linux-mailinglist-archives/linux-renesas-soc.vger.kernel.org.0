Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCFC4C80A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Mar 2022 03:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiCACC3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 21:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiCACC2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 21:02:28 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C55D1AF1D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 18:01:49 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id q8-20020a17090a178800b001bc299b8de1so885958pja.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 18:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Op/78mcumELS/hfmiDdphhJRGp3ehPuyZLljP5bJRws=;
        b=LVnlZtMsh57gXaYGL9QEOZdcN5ty96OeLoz9NVFAkdXuIyfSC40VAPVDWULBY2e5o/
         LfdCIlRNvoFYPMDs8t4tj4zSrd8op1BIj3LGHvbhc+lT8dAMzeWGyncXAmGmW00rT9a1
         tRd+YYGsl7wBmapAh9JNAcSGjlcZf+utc12YGzXbHVxf6HjO9+JTlH3d5pSk85sr4PiL
         kRQTMKfycYr1n2aZUKzygepugT2jtJaOJzU1VGkIvVpMFyWZR9UBQGPc6it4Jz9XOO7P
         YmiOL2zd3oM26FNLr6OSYGkD8T4TvQLGzsU3BrF2ccfuCGB2x5s12ect4vFiJbHQemSq
         dpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Op/78mcumELS/hfmiDdphhJRGp3ehPuyZLljP5bJRws=;
        b=L+Rq0hj5QiLtjldCCYBvXBwgwpyKxmPvMLPhrd1VSjhcJdbBBPmD3/SyL3qgyJIPbP
         6LE1ZMCDnAqXp2WURECOurxAmrcWnMkVy+nLIw05Gnc3c8FXOUcQufKH8+MVqKoGipiq
         /9hLRMklaA30WXMwEQ7ha7Y6d1OsEYwHoY2EcTzUNn1sSuUPM94I2V3UaGaKpuX1fxaX
         N/Hj9x0ZaGyNYBlLOeIesaN+a9LtULGckoQtS1PsoOiUKtuqe18SsQrROr7BZG233J0v
         1Ovbhxx9gGiDEQlFPEluyji/XVzcJLN3wnBe2ddSk1pZlr9yImT4y/xsg8ABln2sSm3d
         ay4A==
X-Gm-Message-State: AOAM533GKZtK2MmdQBsg/i7NiAvABQzcf0v1L05rCSkQwHgYidmkTHpn
        KDworhG/mp/55rfpJZ6Ucrb4UKTamknvqmEC4Bo=
X-Google-Smtp-Source: ABdhPJzbXgFPqDOYi+kzqcpXTCBZeVQPxWnDEn4lBihsdMAcs/bMpkH+BzBXAdw4USpHcuMNpYIMKg==
X-Received: by 2002:a17:90b:3682:b0:1bc:3891:b266 with SMTP id mj2-20020a17090b368200b001bc3891b266mr19635155pjb.137.1646100108236;
        Mon, 28 Feb 2022 18:01:48 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b004e1bf2a3376sm15169482pfh.215.2022.02.28.18.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 18:01:48 -0800 (PST)
Message-ID: <621d7e8c.1c69fb81.99f30.732e@mx.google.com>
Date:   Mon, 28 Feb 2022 18:01:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-28-v5.17-rc6
Subject: renesas/master baseline: 290 runs,
 3 regressions (renesas-devel-2022-02-28-v5.17-rc6)
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

renesas/master baseline: 290 runs, 3 regressions (renesas-devel-2022-02-28-=
v5.17-rc6)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-28-v5.17-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-28-v5.17-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a71d9945241e2e2c40b48a4e45d486664a83354d =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621d5a395def000e79c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d5a395def000e79c62=
97a
        failing since 105 days (last pass: renesas-devel-2021-11-02-v5.15, =
first fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/621d4bca39535b04a1c62992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d4bca39535b04a1c62=
993
        new failure (last pass: renesas-devel-2022-02-22-v5.17-rc5) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/621d4f27b996d9df45c62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d4f27b996d9df45c62=
973
        new failure (last pass: renesas-devel-2022-02-22-v5.17-rc5) =

 =20
