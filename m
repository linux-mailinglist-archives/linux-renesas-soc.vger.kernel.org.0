Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A66765A4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 19:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjG0Rbz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 13:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbjG0Rby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 13:31:54 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153E72D67
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 10:31:52 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so533628b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690479111; x=1691083911;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jBj8YNAwxzQ2lzSlsD4e1xxudkoYpbk3wJu4Ndt5uFU=;
        b=23NpncLUSAf0DS8hUZp4PID2biNuftYK/A/FMCq7yXHMF43Lm25VPS0ATwu34RXxO5
         MsB+MXb2hmBparQHmq76c6G8BZP78BFpu9TDyL3rXlH7xx9jwIsntDPEcWx6Ue01YK8w
         ioWB51sptx4lRuP7OEB2moO2da0ZO43Pxd1xTnykq6CoDPnxaGm85dQjcQI0qV14DiJ6
         j0BIJ6NYuYZywdYcZVe8Sh+COjRhAaNZKSMd5QVLID1AjgZUn5fs65Y3Hudo14O15g4m
         egzVXPRA62zxljL7gNclNHhdNRzf55KjFDzbnF0sBOJvXkyeYPbXlZDPc8Yd7Sdwaa6V
         1ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479111; x=1691083911;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBj8YNAwxzQ2lzSlsD4e1xxudkoYpbk3wJu4Ndt5uFU=;
        b=k+otyUnyeNr/VgGbXRfUdy9sKcHLIgK4PCsxrns1swX1opdr0jS2N8yaVoLFKEr2fP
         hasw68s9JRFP6ii+bd3y4Rhfu8XxDwgFa8F63H31d1Vc7sZe/CkOTl70bQxXlVm0XHrq
         H1n9EJHhytKWGdsXsGnzmpK6U9BxbbCnJ/hG8MwTkM+VwEvBDJxxhm+C73tC4saZiMHC
         yVDHuJK0N4rd4JaDHqrHJxG9g2U7E6+HNVcWoTgnvrifNhjR0cjtPmCHhl64p25WNNBY
         aDSmX3bncpGZFcZ0wT1dMz4wGYvItd6WeY+t4Fa8jiM3pnwP9Nrs043R6VIp0zlbCCLA
         gIIA==
X-Gm-Message-State: ABy/qLa1KSJHDW4YJcTxyK+TiEUKflu+LBNwQR35MdbtQ9AgLtFNq+yB
        DoPaJ1vI1o3VXxlfAAlWM77VBg+xl2FgmcbtZreu+g==
X-Google-Smtp-Source: APBJJlEYCOnKMhQtlPjlCtcnK4uIruoqEmKdtqbJtSPAYlcp2ZI8AnXq3RZiLJlA8c1poxkGsnlkLg==
X-Received: by 2002:a05:6a21:9991:b0:126:9081:2156 with SMTP id ve17-20020a056a21999100b0012690812156mr6406364pzb.4.1690479110978;
        Thu, 27 Jul 2023 10:31:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b00682a16f0b00sm1718436pfh.210.2023.07.27.10.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:31:49 -0700 (PDT)
Message-ID: <64c2aa05.a70a0220.df081.34e3@mx.google.com>
Date:   Thu, 27 Jul 2023 10:31:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-07-27-v6.5-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 52 runs,
 7 regressions (renesas-devel-2023-07-27-v6.5-rc3)
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

renesas/master baseline: 52 runs, 7 regressions (renesas-devel-2023-07-27-v=
6.5-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-07-27-v6.5-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-07-27-v6.5-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b121b3b5c8039bc37b13c6c92511acb957a4421 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2795341268e831f8ace1e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2795341268e831f8ace21
        failing since 9 days (last pass: renesas-devel-2022-09-05-v6.0-rc4,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-27T14:03:41.282608  + [   12.698998] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1239052_1.5.2.4.1>
    2023-07-27T14:03:41.282752  set +x
    2023-07-27T14:03:41.385184  =

    2023-07-27T14:03:41.485878  / # #export SHELL=3D/bin/sh
    2023-07-27T14:03:41.486116  =

    2023-07-27T14:03:41.586697  / # export SHELL=3D/bin/sh. /lava-1239052/e=
nvironment
    2023-07-27T14:03:41.586906  =

    2023-07-27T14:03:41.687517  / # . /lava-1239052/environment/lava-123905=
2/bin/lava-test-runner /lava-1239052/1
    2023-07-27T14:03:41.687935  =

    2023-07-27T14:03:41.691786  / # /lava-1239052/bin/lava-test-runner /lav=
a-1239052/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c27987f386bd489e8ace24

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c27987f386bd489e8ace27
        failing since 9 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-27T14:04:36.768968  / # #
    2023-07-27T14:04:38.229929  export SHELL=3D/bin/sh
    2023-07-27T14:04:38.250405  #
    2023-07-27T14:04:38.250612  / # export SHELL=3D/bin/sh
    2023-07-27T14:04:40.138150  / # . /lava-989834/environment
    2023-07-27T14:04:43.596789  /lava-989834/bin/lava-test-runner /lava-989=
834/1
    2023-07-27T14:04:43.617553  . /lava-989834/environment
    2023-07-27T14:04:43.617663  / # /lava-989834/bin/lava-test-runner /lava=
-989834/1
    2023-07-27T14:04:43.700532  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T14:04:43.700750  + cd /lava-989834/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2792ee78c90ce748ace87

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2792ee78c90ce748ace8c
        failing since 9 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-27T14:04:55.020735  / # #

    2023-07-27T14:04:55.121307  export SHELL=3D/bin/sh

    2023-07-27T14:04:55.121424  #

    2023-07-27T14:04:55.221948  / # export SHELL=3D/bin/sh. /lava-11151531/=
environment

    2023-07-27T14:04:55.222053  =


    2023-07-27T14:04:55.322605  / # . /lava-11151531/environment/lava-11151=
531/bin/lava-test-runner /lava-11151531/1

    2023-07-27T14:04:55.322831  =


    2023-07-27T14:04:55.334433  / # /lava-11151531/bin/lava-test-runner /la=
va-11151531/1

    2023-07-27T14:04:55.377091  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T14:04:55.393562  + cd /lava-111515<8>[   19.267835] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11151531_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c27942f039fd855e8ace66

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c27943f039fd855e8ace6b
        failing since 9 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-27T14:03:45.022815  / # #

    2023-07-27T14:03:46.102199  export SHELL=3D/bin/sh

    2023-07-27T14:03:46.104076  #

    2023-07-27T14:03:47.594079  / # export SHELL=3D/bin/sh. /lava-11151529/=
environment

    2023-07-27T14:03:47.596033  =


    2023-07-27T14:03:50.317852  / # . /lava-11151529/environment/lava-11151=
529/bin/lava-test-runner /lava-11151529/1

    2023-07-27T14:03:50.319335  =


    2023-07-27T14:03:50.332531  / # /lava-11151529/bin/lava-test-runner /la=
va-11151529/1

    2023-07-27T14:03:50.391641  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T14:03:50.392120  + cd /lava-111515<8>[   29.504165] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11151529_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c27ae5c7c7563d258ace38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-p=
ine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-p=
ine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c27ae5c7c7563d258ac=
e39
        failing since 16 days (last pass: renesas-devel-2023-06-12-v6.4-rc6=
, first fail: renesas-devel-2023-07-11-v6.5-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c27a4587651daf468ace3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-li=
bretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-li=
bretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c27a4587651daf468ac=
e3b
        failing since 45 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c27942e78c90ce748ace96

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-27-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c27942e78c90ce748ace9b
        failing since 9 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-27T14:05:06.399204  / # #

    2023-07-27T14:05:06.501316  export SHELL=3D/bin/sh

    2023-07-27T14:05:06.501946  #

    2023-07-27T14:05:06.603308  / # export SHELL=3D/bin/sh. /lava-11151539/=
environment

    2023-07-27T14:05:06.604019  =


    2023-07-27T14:05:06.705521  / # . /lava-11151539/environment/lava-11151=
539/bin/lava-test-runner /lava-11151539/1

    2023-07-27T14:05:06.706655  =


    2023-07-27T14:05:06.723502  / # /lava-11151539/bin/lava-test-runner /la=
va-11151539/1

    2023-07-27T14:05:06.791550  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T14:05:06.792065  + cd /lava-11151539/1/tests/1_boot<8>[   18=
.330352] <LAVA_SIGNAL_STARTRUN 1_bootrr 11151539_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
