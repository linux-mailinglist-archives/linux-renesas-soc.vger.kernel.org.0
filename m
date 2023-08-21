Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD88782A6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbjHUNZX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbjHUNZX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:25:23 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462CE8F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 06:25:18 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bc83a96067so17307715ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692624317; x=1693229117;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3YT9uXZ/GGB2eB2hN3crnTfV7pra4nLXzx0LvhWuyUc=;
        b=FAF5ijAew2dLeN22O8W3tBLUvcVy6z3SoFWJOOBXyPxA7IBaDu8Z3hydEUow3vjsM3
         kO28QS7wP0nfXYNethkGCAX2DIwzr+Iq2O/pNHACpublCF1WW3DdXegk12ihZvNT2NUe
         8/yZDQZ3bqrI3WwNf8cGh+K4sXFdx5cCsJA/GE37VqSKN9w6zFD0LnDUzAnd5Y9G7G6T
         Wpp9N9b+EYiyDfKLlrKlydZqN5UJ185cYjEu3cMP1UEFGaS+N7B73q9XsMOyTsztIf8j
         JBaDO9rLNAfqqAZgJWIiWBvpj7JVaXuboNcUq+7NeGwu0o5d0huGV0ncCqCbVthc2O0A
         quYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692624317; x=1693229117;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YT9uXZ/GGB2eB2hN3crnTfV7pra4nLXzx0LvhWuyUc=;
        b=RtCmIj+8ryrSORbH+HmKiexWFl9etamAvLvNEunj9DnTf+scI4jnpNiN4ppbR4ykb6
         eduRhoLjQEjD+HHSI8hty6vbEGlPKmBasOCCiU/qHGJGqHuJh0hH4F1GIn8SKQ7scwNP
         DgVlNwwLlg3uUQ+wBsA5zFm1OLKjOJq/fURVPk6yk+fiM5GCySbbw0cDxzSBYmHOl4W8
         uQoJfFySXO5nCqmB3t0pL/W7fiaM0SQ+rYpfBsu2IcHEq9z1NYV3ZZEk2U5P0RWYeKdW
         iKWBnhLIeZpbnQio8K6WrAhDmT5/ehcE3rodmxv7w1bspdvSYfyTZfeO11Uuqiwl9aSI
         yUPg==
X-Gm-Message-State: AOJu0Yz8GUNIKl+OcVDv5jmF4bWEya88GhgTkAXgFtw6TblkmX57yL0A
        M/tJqgizCn3Dce5MgXaDxNkXNkauiJd9jNCS+6YIFw==
X-Google-Smtp-Source: AGHT+IFemkkElyD9YfcpfjCyre4GlZanAtHDuIPVUUrf4AJcZLroLaVRjyN8kEzJDi0kqEYbYjfcYg==
X-Received: by 2002:a17:902:dad1:b0:1bc:afa:95a6 with SMTP id q17-20020a170902dad100b001bc0afa95a6mr5291980plx.40.1692624317126;
        Mon, 21 Aug 2023 06:25:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ce8400b001bb9f104328sm7028713plg.146.2023.08.21.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 06:25:16 -0700 (PDT)
Message-ID: <64e365bc.170a0220.be493.c35b@mx.google.com>
Date:   Mon, 21 Aug 2023 06:25:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-08-21-v6.5-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 52 runs,
 5 regressions (renesas-devel-2023-08-21-v6.5-rc7)
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

renesas/master baseline: 52 runs, 5 regressions (renesas-devel-2023-08-21-v=
6.5-rc7)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
fsl-ls2088a-rdb    | arm64 | lab-nxp       | gcc-10   | defconfig | 1      =
    =

r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-08-21-v6.5-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-08-21-v6.5-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      03d3ebbbd18ce9927bc14fd9945d14fb156ab595 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
fsl-ls2088a-rdb    | arm64 | lab-nxp       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64e33510720f5f269035b1de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e33510720f5f269035b1e1
        failing since 34 days (last pass: renesas-devel-2022-09-05-v6.0-rc4=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-21T09:58:07.272753  + [   17.859495] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1244557_1.5.2.4.1>
    2023-08-21T09:58:07.273041  set +x
    2023-08-21T09:58:07.378154  =

    2023-08-21T09:58:07.479322  / # #export SHELL=3D/bin/sh
    2023-08-21T09:58:07.479726  =

    2023-08-21T09:58:07.580678  / # export SHELL=3D/bin/sh. /lava-1244557/e=
nvironment
    2023-08-21T09:58:07.581080  =

    2023-08-21T09:58:07.682042  / # . /lava-1244557/environment/lava-124455=
7/bin/lava-test-runner /lava-1244557/1
    2023-08-21T09:58:07.682706  =

    2023-08-21T09:58:07.687161  / # /lava-1244557/bin/lava-test-runner /lav=
a-1244557/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64e335657d382c97a835b1f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e335657d382c97a835b1f4
        failing since 34 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-21T10:01:54.908157  / # #
    2023-08-21T10:01:56.370716  export SHELL=3D/bin/sh
    2023-08-21T10:01:56.391257  #
    2023-08-21T10:01:56.391462  / # export SHELL=3D/bin/sh
    2023-08-21T10:01:58.277210  / # . /lava-998877/environment
    2023-08-21T10:02:01.737264  /lava-998877/bin/lava-test-runner /lava-998=
877/1
    2023-08-21T10:02:01.758067  . /lava-998877/environment
    2023-08-21T10:02:01.758178  / # /lava-998877/bin/lava-test-runner /lava=
-998877/1
    2023-08-21T10:02:01.840575  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-21T10:02:01.840792  + cd /lava-998877/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64e359f8da9db6a6b035b1dd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e359f9da9db6a6b035b1e2
        failing since 34 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-21T12:37:42.056730  / # #

    2023-08-21T12:37:42.158916  export SHELL=3D/bin/sh

    2023-08-21T12:37:42.159649  #

    2023-08-21T12:37:42.261072  / # export SHELL=3D/bin/sh. /lava-11323892/=
environment

    2023-08-21T12:37:42.261808  =


    2023-08-21T12:37:42.363279  / # . /lava-11323892/environment/lava-11323=
892/bin/lava-test-runner /lava-11323892/1

    2023-08-21T12:37:42.364402  =


    2023-08-21T12:37:42.381041  / # /lava-11323892/bin/lava-test-runner /la=
va-11323892/1

    2023-08-21T12:37:42.431134  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-21T12:37:42.431646  + cd /lava-113238<8>[   19.244810] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11323892_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64e334b532102926dd35b1e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e334b532102926dd35b1eb
        failing since 34 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-21T09:56:22.188602  / # #

    2023-08-21T09:56:23.265242  export SHELL=3D/bin/sh

    2023-08-21T09:56:23.266859  #

    2023-08-21T09:56:24.753630  / # export SHELL=3D/bin/sh. /lava-11323895/=
environment

    2023-08-21T09:56:24.755356  =


    2023-08-21T09:56:27.471129  / # . /lava-11323895/environment/lava-11323=
895/bin/lava-test-runner /lava-11323895/1

    2023-08-21T09:56:27.473118  =


    2023-08-21T09:56:27.480636  / # /lava-11323895/bin/lava-test-runner /la=
va-11323895/1

    2023-08-21T09:56:27.543253  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-21T09:56:27.543722  + cd /lava-113238<8>[   28.530408] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11323895_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64e334ac7ff03ae1e635b2b7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-21-v6.5-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e334ac7ff03ae1e635b2bc
        failing since 34 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-21T09:57:31.688986  / # #

    2023-08-21T09:57:31.789505  export SHELL=3D/bin/sh

    2023-08-21T09:57:31.789627  #

    2023-08-21T09:57:31.890119  / # export SHELL=3D/bin/sh. /lava-11323894/=
environment

    2023-08-21T09:57:31.890242  =


    2023-08-21T09:57:31.990736  / # . /lava-11323894/environment/lava-11323=
894/bin/lava-test-runner /lava-11323894/1

    2023-08-21T09:57:31.990934  =


    2023-08-21T09:57:32.002752  / # /lava-11323894/bin/lava-test-runner /la=
va-11323894/1

    2023-08-21T09:57:32.076584  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-21T09:57:32.076671  + cd /lava-11323894/1/te<8>[   17.665683] <=
LAVA_SIGNAL_STARTRUN 1_bootrr 11323894_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
