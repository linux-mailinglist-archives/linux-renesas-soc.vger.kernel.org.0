Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910417B2138
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 17:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjI1P0n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 11:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbjI1P0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 11:26:39 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BA7AC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:26:37 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c5db4925f9so97444745ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695914797; x=1696519597; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CyBACHD6DOaduPKJzxmkrZdupHGM0T09ubdIL/d1zLE=;
        b=yKHkffVTgn7YcLa3pmpAhz/8kCZdP1cJMDGZ3uhwK5oW/kecVvF3DV3vZU0q9zk8+D
         bJs4PVbXrqBhztYZUZgsAReRMn7KJnQUeJbF2SvGo4fG5evAdyQkzaBwRyYCV5NHbfK4
         uIOhYKmb3GCFhSReBZd1phKQdrjoRyhz6bmpxslSChX0JwcRE9KAWEeN90Y49FM/nI7b
         GunA7fFsLkFUivfqb6e/+fUKBei9aFqUXTP0r5qdQoTbMbQw/hhOuJrJRRR6i6kHNycu
         oiAAkuuQGTq7IYS+ctU0KTmg4taiQnDD9q00N/GqikLjqypBaACxCtsarSgzA5w8i5gL
         n1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914797; x=1696519597;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyBACHD6DOaduPKJzxmkrZdupHGM0T09ubdIL/d1zLE=;
        b=cMnQeaufpng09LdPFW2pD4RgLS2zySzjxOSQKfYDO/j+sYOfJX13VhGMRsjyVBiwfO
         1B6sFwbRvTKuyrutuq1rAheeG/qObtOVnDC0MZWmoObTloeG1Qcg00vjEI8BobIXjQFI
         jnDFlvzVVoKrpjsmRkf65GUOGclGjDg67lCdbpIAsfETx3urgzPPxDWcpzWjVNe2LGlV
         cHvxf9seVOMO5N1zBuSO2nFKPVvlbyOQruY6xv3ywlbzUGVEcqnTaIsDZFG7KK/tmzhA
         ZFRTxvYjHwOIbtmXaasg5Rl+jHkGizePANSVDmtq5ZAsxE3AXEUovARGQNQAR/SPDd7P
         j4dA==
X-Gm-Message-State: AOJu0YwzRbZYg0UHtyARhfo5VsMRwdbc7FdIDXZDdqRG6v5yubD/0Bgk
        OqqnznBM7Al5hlWzF3VrC+vyPps1BzYcFKaCq/Ry/Q==
X-Google-Smtp-Source: AGHT+IHxqLPhdvOGUtMBbzcdLBBkd8CPfIFXpMyjIizHPkrkEH79cLW9u8gCPW0LdgJXTvqDvHgY9A==
X-Received: by 2002:a17:902:e851:b0:1c6:e1d:8be0 with SMTP id t17-20020a170902e85100b001c60e1d8be0mr2789052plg.2.1695914796910;
        Thu, 28 Sep 2023 08:26:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iw15-20020a170903044f00b001c5d09e9437sm15217965plb.25.2023.09.28.08.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:26:36 -0700 (PDT)
Message-ID: <65159b2c.170a0220.713aa.da55@mx.google.com>
Date:   Thu, 28 Sep 2023 08:26:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-09-28-v6.6-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 48 runs,
 5 regressions (renesas-next-2023-09-28-v6.6-rc1)
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

renesas/next baseline: 48 runs, 5 regressions (renesas-next-2023-09-28-v6.6=
-rc1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
bcm2711-rpi-4-b    | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-09-28-v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-09-28-v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      152c71433da27547ba0c00f19487f71d76fde6b5 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
bcm2711-rpi-4-b    | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65156ad739d223ac528a0ab8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4=
-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4=
-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65156ad739d223ac528a0=
ab9
        new failure (last pass: renesas-next-2023-09-27-v6.6-rc1) =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65156b6a82226f790a8a0a8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65156b6a82226f790a8a0a94
        failing since 16 days (last pass: renesas-next-2023-07-27-v6.5-rc1,=
 first fail: renesas-next-2023-09-11-v6.6-rc1)

    2023-09-28T12:02:29.411405  + set<8>[   28.822233] <LAVA_SIGNAL_ENDRUN =
0_dmesg 138262_1.5.2.4.1>
    2023-09-28T12:02:29.412015   +x
    2023-09-28T12:02:29.529448  / # #
    2023-09-28T12:02:30.695097  export SHELL=3D/bin/sh
    2023-09-28T12:02:30.701168  #
    2023-09-28T12:02:32.200334  / # export SHELL=3D/bin/sh. /lava-138262/en=
vironment
    2023-09-28T12:02:32.206369  =

    2023-09-28T12:02:34.929293  / # . /lava-138262/environment/lava-138262/=
bin/lava-test-runner /lava-138262/1
    2023-09-28T12:02:34.936030  =

    2023-09-28T12:02:34.943086  / # /lava-138262/bin/lava-test-runner /lava=
-138262/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65156a49dbbeeba5878a0b1f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65156a49dbbeeba5878a0b28
        failing since 62 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-28T12:02:13.301078  / # #

    2023-09-28T12:02:13.403229  export SHELL=3D/bin/sh

    2023-09-28T12:02:13.403982  #

    2023-09-28T12:02:13.505391  / # export SHELL=3D/bin/sh. /lava-11635203/=
environment

    2023-09-28T12:02:13.506358  =


    2023-09-28T12:02:13.607917  / # . /lava-11635203/environment/lava-11635=
203/bin/lava-test-runner /lava-11635203/1

    2023-09-28T12:02:13.609050  =


    2023-09-28T12:02:13.625257  / # /lava-11635203/bin/lava-test-runner /la=
va-11635203/1

    2023-09-28T12:02:13.674605  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-28T12:02:13.675068  + cd /lava-116352<8>[   20.374993] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11635203_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65156a6e246aaf76098a0aae

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65156a6e246aaf76098a0ab7
        failing since 62 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-28T11:58:27.092551  / # #

    2023-09-28T11:58:28.167566  export SHELL=3D/bin/sh

    2023-09-28T11:58:28.169299  #

    2023-09-28T11:58:29.656079  / # export SHELL=3D/bin/sh. /lava-11635199/=
environment

    2023-09-28T11:58:29.657630  =


    2023-09-28T11:58:32.375431  / # . /lava-11635199/environment/lava-11635=
199/bin/lava-test-runner /lava-11635199/1

    2023-09-28T11:58:32.376746  =


    2023-09-28T11:58:32.385031  / # /lava-11635199/bin/lava-test-runner /la=
va-11635199/1

    2023-09-28T11:58:32.446091  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-28T11:58:32.446506  + cd /lava-116351<8>[   29.528340] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11635199_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65156a5c0d91cdf24f8a0a8a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-28-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65156a5c0d91cdf24f8a0a93
        failing since 62 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-28T12:02:32.900389  / # #

    2023-09-28T12:02:33.002350  export SHELL=3D/bin/sh

    2023-09-28T12:02:33.003055  #

    2023-09-28T12:02:33.104528  / # export SHELL=3D/bin/sh. /lava-11635210/=
environment

    2023-09-28T12:02:33.105234  =


    2023-09-28T12:02:33.206691  / # . /lava-11635210/environment/lava-11635=
210/bin/lava-test-runner /lava-11635210/1

    2023-09-28T12:02:33.207814  =


    2023-09-28T12:02:33.209077  / # /lava-11635210/bin/lava-test-runner /la=
va-11635210/1

    2023-09-28T12:02:33.290152  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-28T12:02:33.290649  + cd /lava-1163521<8>[   19.292813] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11635210_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
