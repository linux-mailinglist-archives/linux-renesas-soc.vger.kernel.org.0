Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E81D62EACD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 02:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240882AbiKRBPX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 20:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240915AbiKRBPD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 20:15:03 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE81E2937C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:14:11 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so6994029pji.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wp0HOAaGeCyE3HFNclpIBhYnJw2A8KlSiik3/FRqX0w=;
        b=QKWgWDf5J0d+i+fbs6e/N02tNuHb7hzQoLWJqkrSJnpgKXfMZ0g++9RtKSZuA09cSi
         nMjkJHWBH+TN//NZY7F8ArFhpkPxuUmTOgCjhbs3LLG8wK2hDTvTPxQEYEg6RKIEvYq1
         XZxkFyEVNLCezf+hZugV1kjYuPt9JbnfLZGxjhp+0UI86kWZx4uFAfe7ZcLY8KekSCPf
         9iLgpOCluTmJYq1GCq87D2TxXvWnIxFZpYSevSp31guL7wp4MKcmYq0vnVMxnb4vm/vC
         FfFnSCJQb8hps8E0Z6JCyULxzUg5bUTpQ57TADkevFkG7TZLD++KkZCrvVLwBTJxg/NF
         sGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp0HOAaGeCyE3HFNclpIBhYnJw2A8KlSiik3/FRqX0w=;
        b=S0AQwdDDqQv+CQ+BjqRAekuqbx62UNOTMnDoUjZGAB3aFAP0PeA3qpngn9x+0vix1i
         wAAuJZDtJOaTAqC9Y1MsdQUuAStDt3wzooeZMWQk5nEgrr6O0ufVHrSvTsY8PNSilCrQ
         Hk1+eSDK2mMl7I36LpgCNQs30mH97YHGCnjxEUPXqLAP+Xjx9w02KcV1ZPQ5ohepWNU6
         Tb+NEYx6XRjav8YAf+ckBZuMpcnLnTL2qhUk4neK78xnq2qLYiB3Ufi5MzihU8qPbh8h
         K1jM6aWfwIB1HpLEPmVZ7gQVHKzcEZ1PFbckW86tuPX0R3xy1g8PiGAu1ZuLK7LDDbkF
         8Ruw==
X-Gm-Message-State: ANoB5pn+D+4p1Vfx8anRtDeVDmXbRkGtIRCEgXd1MZ6Nmpa96jJsRW6d
        2qXkcRYF2F29kw5mfNtozqELCTyPZuWe7mwL+AM=
X-Google-Smtp-Source: AA0mqf6yv/B3q4qdFEMW/nHQZOL70tJ1cQbuOfAOAKFxa3Qgpu6UvrvacnCOV+QoNQabPfejykCIXQ==
X-Received: by 2002:a17:90a:458a:b0:214:166e:e202 with SMTP id v10-20020a17090a458a00b00214166ee202mr5376361pjg.165.1668734046158;
        Thu, 17 Nov 2022 17:14:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c132-20020a621c8a000000b0056be1581126sm1848761pfc.143.2022.11.17.17.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 17:14:05 -0800 (PST)
Message-ID: <6376dc5d.620a0220.62987.3382@mx.google.com>
Date:   Thu, 17 Nov 2022 17:14:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-11-17-v6.1-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 424 runs,
 10 regressions (renesas-next-2022-11-17-v6.1-rc1)
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

renesas/next baseline: 424 runs, 10 regressions (renesas-next-2022-11-17-v6=
.1-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | imx_v6_v7_=
defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig           | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
ima                | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron  | gcc-10   | defconfig =
                   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre | gcc-10   | oxnas_v6_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-17-v6.1-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-17-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      22360f65e18b2935b5e4695b868a6ef310f46a11 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6376ac62c9c7583ef52abd39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376ac62c9c7583ef52ab=
d3a
        failing since 94 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6376aaf9edc21892a42abcff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseli=
ne-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseli=
ne-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376aaf9edc21892a42ab=
d00
        failing since 7 days (last pass: renesas-next-2022-09-26-v6.0-rc1, =
first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6376ae2e1ed6fe4c182abd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376ae2e1ed6fe4c182ab=
d12
        failing since 7 days (last pass: renesas-next-2022-09-26-v6.0-rc1, =
first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6376afbf50dbdd67252abd08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376afbf50dbdd67252ab=
d09
        failing since 7 days (last pass: renesas-next-2022-09-26-v6.0-rc1, =
first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b23edb6e5259532abcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b23edb6e5259532ab=
cfd
        failing since 7 days (last pass: renesas-next-2022-09-26-v6.0-rc1, =
first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b3a6edc7ffccec2abd02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b3a6edc7ffccec2ab=
d03
        failing since 7 days (last pass: renesas-next-2022-09-26-v6.0-rc1, =
first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a43716fb2fc6a52abcfe

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
76a43716fb2fc6a52abd07
        failing since 163 days (last pass: renesas-next-2022-04-25-v5.18-rc=
1, first fail: renesas-next-2022-06-07-v5.19-rc1)

    2022-11-17T21:14:11.919270  /lava-207435/1/../bin/lava-test-case
    2022-11-17T21:14:11.919897  <8>[   13.796334] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-11-17T21:14:11.920345  /lava-207435/1/../bin/lava-test-case
    2022-11-17T21:14:11.920652  <8>[   13.813006] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-11-17T21:14:11.920936  /lava-207435/1/../bin/lava-test-case
    2022-11-17T21:14:11.921178  <8>[   13.829130] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-11-17T21:14:11.921409  /lava-207435/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a707b567cd077b2abcfd

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
76a707b567cd077b2abd06
        failing since 135 days (last pass: renesas-next-2022-04-25-v5.18-rc=
1, first fail: renesas-next-2022-07-05-v5.19-rc1)

    2022-11-17T21:26:12.248935  /lava-207460/1/../bin/lava-test-case
    2022-11-17T21:26:12.249343  <8>[   13.797871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-11-17T21:26:12.249584  /lava-207460/1/../bin/lava-test-case
    2022-11-17T21:26:12.250206  <8>[   13.814494] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a21de3c8e2a8dc2abcfa

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/637=
6a21de3c8e2a8dc2abd0d
        new failure (last pass: renesas-next-2022-11-10-v6.1-rc1)

    2022-11-17T21:05:18.968541  /lava-207422/1/../bin/lava-test-case
    2022-11-17T21:05:18.968980  <8>[   16.874396] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-11-17T21:05:18.969258  /lava-207422/1/../bin/lava-test-case
    2022-11-17T21:05:18.969567  <8>[   16.895264] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-11-17T21:05:18.969848  /lava-207422/1/../bin/lava-test-case
    2022-11-17T21:05:18.970119  <8>[   16.917335] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-11-17T21:05:18.970372  /lava-207422/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre | gcc-10   | oxnas_v6_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63769fa044d5d6ff6a2abd0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63769fa044d5d6ff6a2ab=
d0b
        failing since 30 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-17-v6.1-rc1) =

 =20
