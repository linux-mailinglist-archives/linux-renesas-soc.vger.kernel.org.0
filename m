Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B257B055D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 15:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbjI0N3Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 09:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjI0N3Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 09:29:24 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5485D136
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 06:29:22 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c5cd27b1acso99577195ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695821361; x=1696426161; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5bA9WcB1Y4kfAMAsgfr6wgLha2Jr0C2IZPhLlzJr5Ho=;
        b=uicy91GnJf98OwNTRHhhq94dZrvd1m2g87cPLtr8LnebZ/HxmtC2Uvb+WSi13zJggS
         9gahmp7uenS8gyy0ZlBGhM+5TlYYZHz++R5gopYRc83sPchQgJJjThpZ4VApWfG8BSRd
         yOJrIj2nKBiYhOIEbpbWtzIuKofbJ+7yitFQKEq/CrwObpHoP+uQgHH4vZ8P4f03Tlve
         BR8K4NGd30hGnkm6fGXD+Oq/R7soZjAq4g2JMFU5xWlMPWrpTmK0Zy8TGzbgHHyfwfJw
         3ELkM+FnZb5FaDnGKQuyw5RnACddM8L7YZNCGBVDVcLtq0mpeSoyUdMMKotLUT/ZvMvm
         PZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695821361; x=1696426161;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bA9WcB1Y4kfAMAsgfr6wgLha2Jr0C2IZPhLlzJr5Ho=;
        b=v6j9FQtRoTg/1L3We+eQIJsGI9tCLm/TgupzNpPHQvXLpVe+zY1ZS1lJXfLHYxOci8
         xoh3gsMimGyCqN3MDQR0q6Hb93O76dx5Kax+RnKoeB0CdhF8BUGiIOyeYYJZukxUp0NU
         7PIWgWkBxt9KnFN2YBIdFW61icf6m98DtVjSBU9vklryJO59FLcscxRITST9HZ3E1VvN
         pll6L+XV7jAfBUWUbXvh1pMn7f6RKsCUlLEOqaT3ibY8ICbXDOf+4kwrzSrNbQhKG/5j
         BGUkafyhF6Uh7BLRd5etvB4qlhKuhm7wKLmX6fAWTw/FMwhfFp7p6bGT7z33C3jMxHL1
         Q76A==
X-Gm-Message-State: AOJu0Yy/Ibz5SIBVMgTqYj2zz8dt3AsTNPlsa73g3ni0sbhnxdo8M1Jl
        nQTG3FR7pv+8rBFIVIUEghvwOb96zRNnURavuTFihQ==
X-Google-Smtp-Source: AGHT+IHVsA1hu6xEzCbD2jy76KX4ks3n1Hlf0cZRNCwJ9nBytwMot4QdYa+hdDB2sSUTk6jpBa+c8A==
X-Received: by 2002:a17:902:d2d1:b0:1be:384:7b29 with SMTP id n17-20020a170902d2d100b001be03847b29mr2171330plc.34.1695821361281;
        Wed, 27 Sep 2023 06:29:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id je20-20020a170903265400b001c5fc291f02sm9223868plb.216.2023.09.27.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 06:29:20 -0700 (PDT)
Message-ID: <65142e30.170a0220.25dfe.1941@mx.google.com>
Date:   Wed, 27 Sep 2023 06:29:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-09-27-v6.6-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 48 runs,
 4 regressions (renesas-next-2023-09-27-v6.6-rc1)
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

renesas/next baseline: 48 runs, 4 regressions (renesas-next-2023-09-27-v6.6=
-rc1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-09-27-v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-09-27-v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e3de1a23ef40aafe6eaf82011431f87646c091f4 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140353c58c5aa5fd8a0a57

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65140353c58c5aa5fd8a0a60
        failing since 15 days (last pass: renesas-next-2023-07-27-v6.5-rc1,=
 first fail: renesas-next-2023-09-11-v6.6-rc1)

    2023-09-27T10:26:10.569611  / # #
    2023-09-27T10:26:11.735383  export SHELL=3D/bin/sh
    2023-09-27T10:26:11.741457  #
    2023-09-27T10:26:13.239932  / # export SHELL=3D/bin/sh. /lava-135617/en=
vironment
    2023-09-27T10:26:13.246008  =

    2023-09-27T10:26:15.969315  / # . /lava-135617/environment/lava-135617/=
bin/lava-test-runner /lava-135617/1
    2023-09-27T10:26:15.976049  =

    2023-09-27T10:26:15.983761  / # /lava-135617/bin/lava-test-runner /lava=
-135617/1
    2023-09-27T10:26:16.013335  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-27T10:26:16.017202  + cd /l<8>[   33.580510] <LAVA_SIGNAL_START=
RUN 1_bootrr 135617_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6513fd59be6fd40c9c8a0acd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513fd59be6fd40c9c8a0ad6
        failing since 61 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-27T10:05:00.709697  / # #

    2023-09-27T10:05:00.810206  export SHELL=3D/bin/sh

    2023-09-27T10:05:00.810372  #

    2023-09-27T10:05:00.910807  / # export SHELL=3D/bin/sh. /lava-11626845/=
environment

    2023-09-27T10:05:00.910946  =


    2023-09-27T10:05:01.011394  / # . /lava-11626845/environment/lava-11626=
845/bin/lava-test-runner /lava-11626845/1

    2023-09-27T10:05:01.011653  =


    2023-09-27T10:05:01.023261  / # /lava-11626845/bin/lava-test-runner /la=
va-11626845/1

    2023-09-27T10:05:01.063845  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T10:05:01.082826  + cd /lava-116268<8>[   20.449052] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11626845_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6513fd82a16b767bc98a0a83

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513fd82a16b767bc98a0a8c
        failing since 61 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-27T10:01:34.089212  / # #

    2023-09-27T10:01:35.168454  export SHELL=3D/bin/sh

    2023-09-27T10:01:35.170305  #

    2023-09-27T10:01:36.660003  / # export SHELL=3D/bin/sh. /lava-11626838/=
environment

    2023-09-27T10:01:36.661836  =


    2023-09-27T10:01:39.384865  / # . /lava-11626838/environment/lava-11626=
838/bin/lava-test-runner /lava-11626838/1

    2023-09-27T10:01:39.387334  =


    2023-09-27T10:01:39.397078  / # /lava-11626838/bin/lava-test-runner /la=
va-11626838/1

    2023-09-27T10:01:39.456083  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T10:01:39.456533  + cd /lava-116268<8>[   28.502934] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11626838_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6513fd6cbba299a7cd8a0a43

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-27-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513fd6cbba299a7cd8a0a4c
        failing since 61 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-27T10:05:13.646681  / # #

    2023-09-27T10:05:13.747228  export SHELL=3D/bin/sh

    2023-09-27T10:05:13.747421  #

    2023-09-27T10:05:13.847943  / # export SHELL=3D/bin/sh. /lava-11626836/=
environment

    2023-09-27T10:05:13.848163  =


    2023-09-27T10:05:13.948864  / # . /lava-11626836/environment/lava-11626=
836/bin/lava-test-runner /lava-11626836/1

    2023-09-27T10:05:13.949166  =


    2023-09-27T10:05:13.960137  / # /lava-11626836/bin/lava-test-runner /la=
va-11626836/1

    2023-09-27T10:05:14.034036  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T10:05:14.034161  + cd /lava-11626836/1/tests/1_boot<8>[   17=
.055634] <LAVA_SIGNAL_STARTRUN 1_bootrr 11626836_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
