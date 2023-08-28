Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5996678B4C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 17:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjH1PuG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 11:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjH1Pti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 11:49:38 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32329C5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 08:49:35 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c0d0bf18d6so26666255ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693237774; x=1693842574;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dFurTM5933UKMrwoo/D1a15dsIE62zIqBe+ajyjobRg=;
        b=dlu595O8IjUfpQBP9eIvo/rUW6qvDrt9OfsCyn7J6vxaQrjq0lI+E4pu6NRM1uGa0C
         lm06OYWocQt1uXkrp/rPIe20PiS6imjihbQP+0zL8yU0HeoihkrPyqsUBgf2OmKkpb6S
         AFEQ0z3br4p7dUmU4cdmFEigJ6hY0VoNrWMF3Jqjhj+dzm6BIDoxGvbXYXihD8X48CRY
         1uAAS17NKNOTHidzV1dF9W2QUGlJjBC8IhK8XmYJbmWK0JURA0yM6AdMAm5YreTMFlAU
         qzsbW7PppKwHqu4P8tbIt3mO2/FKOajwKcQopKWhftJW9EoA9HqNjilRsC5WqWrxQHVU
         oq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693237774; x=1693842574;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFurTM5933UKMrwoo/D1a15dsIE62zIqBe+ajyjobRg=;
        b=Waq7ueX3ug4QA3OwI1Tm1CLSvNP8gTkth8NR/ipldZRhekWZ7hzhsO7gSTTvS0/7Z+
         DL7jOyNym0vT0eaaNEvi8rnDKxEmQxMo1fqrm7EcFsn2ZRAIc9VuvtJms+jw+inryvYA
         b1/MsICLkK2kvbIpn2yjHrlJW2lJLVWSgvTSlFV/49WM9QntPv6HKA5u6e2E9HDh8VQV
         RxzuGmF4R6xjLweoHOGid/hDIBjUkkp354cG1HIUlguvAdTSqzpfJkr24hRH76RjjtOC
         C60hjcxwP0kpl+RFk6yFfbhn6kqcS5/7h1UKEgs2gSSA9eO+PBhzE9H1yy5rHV1tDumQ
         Ck1w==
X-Gm-Message-State: AOJu0YxiEK/MTKJiYaBS1OEoKRHAz6V3F/V1GDICS9LD1ktnG2sTq0y3
        zhzT2BZMohaDMwsm3kXTu+MUWAI1f4LPPK0L2Oo=
X-Google-Smtp-Source: AGHT+IGZ48qVcgc+TK+R823hQbWwTK+omVsqZvwKLMy4fQyNPZ+WPonWPvmmsuaSwAqaS0GdyRL5Ww==
X-Received: by 2002:a17:902:b617:b0:1bb:a4e4:54b6 with SMTP id b23-20020a170902b61700b001bba4e454b6mr23368767pls.62.1693237774023;
        Mon, 28 Aug 2023 08:49:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c3c600b001bf00317a49sm7489176plj.104.2023.08.28.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:49:33 -0700 (PDT)
Message-ID: <64ecc20d.170a0220.32d4f.bcac@mx.google.com>
Date:   Mon, 28 Aug 2023 08:49:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-08-28-v6.5
Subject: renesas/master baseline: 52 runs,
 7 regressions (renesas-devel-2023-08-28-v6.5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 52 runs, 7 regressions (renesas-devel-2023-08-28-v=
6.5)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
fsl-ls2088a-rdb          | arm64 | lab-nxp         | gcc-10   | defconfig |=
 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =

r8a774c0-ek874           | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =

r8a77960-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =

r8a779m1-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-08-28-v6.5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-08-28-v6.5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      08e3979a78878f8514a2b3e826eb22609232b421 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
fsl-ls2088a-rdb          | arm64 | lab-nxp         | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ec91bdbff01e06a4286d7e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec91bdbff01e06a4286d81
        failing since 41 days (last pass: renesas-devel-2022-09-05-v6.0-rc4=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-28T12:23:04.756722  [   13.402463] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1247203_1.5.2.4.1>
    2023-08-28T12:23:04.862596  =

    2023-08-28T12:23:04.963863  / # #export SHELL=3D/bin/sh
    2023-08-28T12:23:04.964309  =

    2023-08-28T12:23:05.065324  / # export SHELL=3D/bin/sh. /lava-1247203/e=
nvironment
    2023-08-28T12:23:05.065875  =

    2023-08-28T12:23:05.166947  / # . /lava-1247203/environment/lava-124720=
3/bin/lava-test-runner /lava-1247203/1
    2023-08-28T12:23:05.167877  =

    2023-08-28T12:23:05.172123  / # /lava-1247203/bin/lava-test-runner /lav=
a-1247203/1
    2023-08-28T12:23:05.196120  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ec914242c4e1e1dc286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec914242c4e1e1dc286=
d6d
        new failure (last pass: renesas-devel-2023-08-21-v6.5-rc7) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ec915f0386e40993286d6e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2=
m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2=
m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec915f0386e40993286d71
        failing since 41 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-28T12:21:37.100219  + set +x
    2023-08-28T12:21:37.100829  <8>[   27.382486] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1002212_1.5.2.4.1>
    2023-08-28T12:21:37.209444  / # #
    2023-08-28T12:21:38.680319  export SHELL=3D/bin/sh
    2023-08-28T12:21:38.702103  #
    2023-08-28T12:21:38.702660  / # export SHELL=3D/bin/sh
    2023-08-28T12:21:40.668456  / # . /lava-1002212/environment
    2023-08-28T12:21:44.285634  /lava-1002212/bin/lava-test-runner /lava-10=
02212/1
    2023-08-28T12:21:44.307353  . /lava-1002212/environment
    2023-08-28T12:21:44.307797  / # /lava-1002212/bin/lava-test-runner /lav=
a-1002212/1 =

    ... (28 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a774c0-ek874           | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ec916b08a1e7e99e286d8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec916b08a1e7e99e286d90
        failing since 41 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-28T12:21:47.602858  / # #
    2023-08-28T12:21:49.062626  export SHELL=3D/bin/sh
    2023-08-28T12:21:49.083095  #
    2023-08-28T12:21:49.083259  / # export SHELL=3D/bin/sh
    2023-08-28T12:21:51.036291  / # . /lava-1002213/environment
    2023-08-28T12:21:54.629743  /lava-1002213/bin/lava-test-runner /lava-10=
02213/1
    2023-08-28T12:21:54.650464  . /lava-1002213/environment
    2023-08-28T12:21:54.650572  / # /lava-1002213/bin/lava-test-runner /lav=
a-1002213/1
    2023-08-28T12:21:54.743360  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-28T12:21:54.743547  + cd /lava-1002213/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a77960-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ec965c2067accc34286d75

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec965c2067accc34286d7e
        failing since 41 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-28T12:44:30.263681  / # #

    2023-08-28T12:44:30.364229  export SHELL=3D/bin/sh

    2023-08-28T12:44:30.364361  #

    2023-08-28T12:44:30.464821  / # export SHELL=3D/bin/sh. /lava-11371936/=
environment

    2023-08-28T12:44:30.464929  =


    2023-08-28T12:44:30.565422  / # . /lava-11371936/environment/lava-11371=
936/bin/lava-test-runner /lava-11371936/1

    2023-08-28T12:44:30.565649  =


    2023-08-28T12:44:30.577418  / # /lava-11371936/bin/lava-test-runner /la=
va-11371936/1

    2023-08-28T12:44:30.621094  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-28T12:44:30.636675  + cd /lava-113719<8>[   19.421174] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11371936_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a779m1-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ec912d1a08304661286e51

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec912d1a08304661286e5a
        failing since 41 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-28T12:22:08.976139  / # #

    2023-08-28T12:22:10.056467  export SHELL=3D/bin/sh

    2023-08-28T12:22:10.058426  #

    2023-08-28T12:22:11.549370  / # export SHELL=3D/bin/sh. /lava-11371942/=
environment

    2023-08-28T12:22:11.551231  =


    2023-08-28T12:22:11.551683  / # . /lava-11371942/environment

    2023-08-28T12:22:14.274716  /lava-11371942/bin/lava-test-runner /lava-1=
1371942/1

    2023-08-28T12:22:14.282627  / # /lava-11371942/bin/lava-test-runner /la=
va-11371942/1

    2023-08-28T12:22:14.346710  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-28T12:22:14.347216  + cd /lava-113719<8>[   28.483761] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11371942_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ec9137d5248ade10286d73

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine=
-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine=
-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec9137d5248ade10286d7c
        failing since 41 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-28T12:22:26.407621  / # #

    2023-08-28T12:22:26.509762  export SHELL=3D/bin/sh

    2023-08-28T12:22:26.510463  #

    2023-08-28T12:22:26.611852  / # export SHELL=3D/bin/sh. /lava-11371947/=
environment

    2023-08-28T12:22:26.612554  =


    2023-08-28T12:22:26.714038  / # . /lava-11371947/environment/lava-11371=
947/bin/lava-test-runner /lava-11371947/1

    2023-08-28T12:22:26.715113  =


    2023-08-28T12:22:26.732167  / # /lava-11371947/bin/lava-test-runner /la=
va-11371947/1

    2023-08-28T12:22:26.800196  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-28T12:22:26.800697  + cd /lava-11371947/1/tests/1_boot<8>[   17=
.798310] <LAVA_SIGNAL_STARTRUN 1_bootrr 11371947_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
