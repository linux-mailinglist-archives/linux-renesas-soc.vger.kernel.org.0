Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8D16BDB11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 22:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjCPVgr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 17:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCPVgo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 17:36:44 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297E960D45
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 14:36:41 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id v21so3225983ple.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679002600;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O3RPPxz3LdHPgRqTupv9JiXH40KGrZgnI091nKS4TnM=;
        b=IsUQDdZ8xelX15Uo8uuOtlYWUTF6lOrL9d+2gf46kaHb6YkC14NUtY0bD+HUxDqMJC
         sW2wM0RSC0EZU13FSBjN+k1vYyrNCtK08TihLMkKyOx4PlINZnEeJCUR0NuC1F3q4CJa
         XmnBzA14gtobCTC3yAN6QmjOctGAFLUG/6JtyET6XfWan/mCVnuhAsiMS8PtL3Jp01Sc
         F9ncCM7fW296JG6S2X7VWbAvSvzswR+X8eyuL1hYAdTOo90/FPj5/0dXWT+9Wi8xGCf5
         l4VOHE1Wehq4ity7WlnY+CNfqRVpqnmosifLkD7V2kBIB1wv/HW8/ZzMI+aJzUdehOK2
         Tvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679002600;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3RPPxz3LdHPgRqTupv9JiXH40KGrZgnI091nKS4TnM=;
        b=VorJCDStuwHBoThE8eBBu7FpOxXTaZyVOOVvj+ut/H9SiSjslI9V/vBYoBBbvkvoRi
         9SuuItNQse7lGzkIT4EN6T+9qgvr5CVNduUDL+v9DWWK2fwqrfa/1FB4He7PwpGEItHa
         pmuZP6CX5ghfu3zns38oHg1exaotL8QuKKCytKgw5BPNIucUvlF7my/4y1hEi4D7e+7o
         zV/Y8GdZ1NeaqxEh6klSNSxFcGpxleZzG3L0m0C0OqMFvj4aoFATSlreEahyH7G9niQy
         eSa7hyBZzfmiDfTiU4VOPfO7gB1JaAdOidChh5iq6xxkyenuKEdc3UYaF2ib7gGjlS8R
         U9Bg==
X-Gm-Message-State: AO0yUKWIhkM7svhMF/vbIeJ58CX6MiNPSk4glvyZVQPoMMCmGXdmBnz1
        6yU0Rg9s6iBQiQK86ZZ1BHAPgubA9pB6obo22xkyV+61
X-Google-Smtp-Source: AK7set9nvRz4m0KfkOD6Rxo0dW2UoVknMEwqmSv/NDp5pYlSCiAtkXG/nBvvKBYOrCS2yQ9jFGTGEw==
X-Received: by 2002:a05:6a20:7f8e:b0:cc:ce95:7db5 with SMTP id d14-20020a056a207f8e00b000ccce957db5mr5457292pzj.57.1679002600035;
        Thu, 16 Mar 2023 14:36:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l19-20020a63f313000000b0050bd71ed66fsm90094pgh.92.2023.03.16.14.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:36:39 -0700 (PDT)
Message-ID: <64138be7.630a0220.7b2c6.0415@mx.google.com>
Date:   Thu, 16 Mar 2023 14:36:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-16-v6.3-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 323 runs,
 27 regressions (renesas-devel-2023-03-16-v6.3-rc2)
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

renesas/master baseline: 323 runs, 27 regressions (renesas-devel-2023-03-16=
-v6.3-rc2)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+videodec           | 1          =

fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+ima                | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 5          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 3          =

qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-16-v6.3-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-16-v6.3-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      051221db2246899aa46144707b31ce26056b42eb =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6413560e9d5cdada8d8c8668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6413560e9d5cdada8d8c8=
669
        failing since 10 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64135435aba76a25878c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1=
043a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1=
043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64135435aba76a25878c8=
63d
        new failure (last pass: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0=
d22967) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641355b1dc8978b8f68c865f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp=
/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp=
/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641355b1dc8978b8f68c8=
660
        failing since 10 days (last pass: renesas-devel-2022-11-17-v6.1-rc5=
-5-gf68db0d22967, first fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/641357d0dc276cd5b78c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641357d0dc276cd5b78c8=
630
        failing since 0 day (last pass: renesas-devel-2022-11-17-v6.1-rc5, =
first fail: renesas-devel-2023-03-07-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/641351349f7c11e8958c8646

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kon=
tron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kon=
tron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641351349f7c11e8958c864d
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-16T17:25:56.621944  <8>[   21.974152] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 297056_1.5.2.4.1>
    2023-03-16T17:25:56.727255  / # #
    2023-03-16T17:25:56.829264  export SHELL=3D/bin/sh
    2023-03-16T17:25:56.829767  #
    2023-03-16T17:25:56.931258  / # export SHELL=3D/bin/sh. /lava-297056/en=
vironment
    2023-03-16T17:25:56.931730  =

    2023-03-16T17:25:57.033250  / # . /lava-297056/environment/lava-297056/=
bin/lava-test-runner /lava-297056/1
    2023-03-16T17:25:57.033997  =

    2023-03-16T17:25:57.053574  / # /lava-297056/bin/lava-test-runner /lava=
-297056/1
    2023-03-16T17:25:57.106542  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/641351349f7c11e8958c8651
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-16T17:25:59.201701  /lava-297056/1/../bin/lava-test-case
    2023-03-16T17:25:59.202099  <8>[   24.543348] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-16T17:25:59.202345  /lava-297056/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
1351349f7c11e8958c8653
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-16T17:26:00.258584  /lava-297056/1/../bin/lava-test-case
    2023-03-16T17:26:00.259028  <8>[   25.581325] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-16T17:26:00.259329  /lava-297056/1/../bin/lava-test-case
    2023-03-16T17:26:00.259613  <8>[   25.598285] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-03-16T17:26:00.259844  /lava-297056/1/../bin/lava-test-case
    2023-03-16T17:26:00.260090  <8>[   25.616743] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-03-16T17:26:00.260314  /lava-297056/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/641351349f7c11e8958c8658
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-16T17:26:01.332811  /lava-297056/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/641351349f7c11e8958c8659
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-16T17:26:01.336007  <8>[   26.691503] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-16T17:26:02.389494  /lava-297056/1/../bin/lava-test-case
    2023-03-16T17:26:02.389890  <8>[   27.712606] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-16T17:26:02.391654  /lava-297056/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/6413561da6980ed46b8c874e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6413561da6980ed46b8c8755
        failing since 8 days (last pass: renesas-devel-2023-02-21-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1)

    2023-03-16T17:46:49.977784  / # #
    2023-03-16T17:46:50.079546  export SHELL=3D/bin/sh
    2023-03-16T17:46:50.080093  #
    2023-03-16T17:46:50.192714  / # export SHELL=3D/bin/sh. /lava-297087/en=
vironment
    2023-03-16T17:46:50.193121  =

    2023-03-16T17:46:50.304042  / # . /lava-297087/environment/lava-297087/=
bin/lava-test-runner /lava-297087/1
    2023-03-16T17:46:50.304818  =

    2023-03-16T17:46:50.322949  / # /lava-297087/bin/lava-test-runner /lava=
-297087/1
    2023-03-16T17:46:50.377051  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-16T17:46:50.377347  + <8>[   22.439355] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 297087_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6413561da6980ed46b8c8759
        failing since 8 days (last pass: renesas-devel-2023-02-21-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1)

    2023-03-16T17:46:52.472522  /lava-297087/1/../bin/lava-test-case
    2023-03-16T17:46:52.472808  <8>[   24.545472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-16T17:46:52.472958  /lava-297087/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
13561da6980ed46b8c875b
        failing since 8 days (last pass: renesas-devel-2023-02-21-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1)

    2023-03-16T17:46:53.531840  /lava-297087/1/../bin/lava-test-case
    2023-03-16T17:46:53.532148  <8>[   25.583374] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-16T17:46:53.532296  /lava-297087/1/../bin/lava-test-case
    2023-03-16T17:46:53.532442  <8>[   25.600343] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6413561da6980ed46b8c8760
        failing since 8 days (last pass: renesas-devel-2023-02-21-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1)

    2023-03-16T17:46:54.607421  /lava-297087/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6413561da6980ed46b8c8761
        failing since 8 days (last pass: renesas-devel-2023-02-21-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1)

    2023-03-16T17:46:54.610583  <8>[   26.698304] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-16T17:46:55.667755  /lava-297087/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6413563756822021048c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6413563756822021048c8=
65e
        new failure (last pass: renesas-devel-2023-03-07-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64135b25ee906c1c828c867e

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/641=
35b25ee906c1c828c86d1
        failing since 10 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-16T18:08:15.118043  /lava-9655985/1/../bin/lava-test-case

    2023-03-16T18:08:15.124173  <8>[   23.403602] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64135b25ee906c1c828c8726
        failing since 10 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-16T18:08:12.260279  /lava-9655985/1/../bin/lava-test-case

    2023-03-16T18:08:12.270211  <8>[   20.547631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64135b25ee906c1c828c8727
        failing since 10 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-16T18:08:11.230406  /lava-9655985/1/../bin/lava-test-case

    2023-03-16T18:08:11.241305  <8>[   19.518669] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6413561500aadb18e18c8635

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/6413561500aadb18e18c86ef
        failing since 10 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-16T17:46:32.422325  /lava-9655893/1/../bin/lava-test-case

    2023-03-16T17:46:32.428653  <8>[   21.084095] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/6413561500aadb18e18c86f0
        failing since 10 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-16T17:46:31.403272  /lava-9655893/1/../bin/lava-test-case

    2023-03-16T17:46:31.410196  <8>[   20.064878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/6413561500aadb18e18c86f1
        failing since 10 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-16T17:46:30.384536  /lava-9655893/1/../bin/lava-test-case

    2023-03-16T17:46:30.390974  <8>[   19.045345] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/64134e00fe045b5ed58c864a

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64134e00fe045b5=
ed58c864e
        new failure (last pass: renesas-devel-2023-02-21-v6.2)
        1 lines

    2023-03-16T17:12:24.389519  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 5267cc14, epc =3D=3D 80205558, ra =3D=
=3D 80207f1c
    2023-03-16T17:12:24.389664  =


    2023-03-16T17:12:24.418589  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-03-16T17:12:24.418692  =

   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64135273daf093b8da8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64135273daf093b8da8c8=
630
        failing since 5 days (last pass: renesas-devel-2023-03-07-v6.3-rc1,=
 first fail: renesas-devel-2023-03-10-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641354cc96dd6936d58c8738

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641354cc96dd6936d58c8=
739
        failing since 73 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641353772c91871e258c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641353772c91871e258c8=
647
        failing since 73 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/641355e9932aed63608c8655

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641355e9932aed63608c865e
        failing since 10 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-16T17:46:09.305653  + set +x<8>[   16.862196] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9655906_1.5.2.3.1>

    2023-03-16T17:46:09.306321  =


    2023-03-16T17:46:09.414835  / # #

    2023-03-16T17:46:09.517895  export SHELL=3D/bin/sh

    2023-03-16T17:46:09.518856  #

    2023-03-16T17:46:09.620716  / # export SHELL=3D/bin/sh. /lava-9655906/e=
nvironment

    2023-03-16T17:46:09.621615  =


    2023-03-16T17:46:09.723705  / # . /lava-9655906/environment/lava-965590=
6/bin/lava-test-runner /lava-9655906/1

    2023-03-16T17:46:09.725090  =


    2023-03-16T17:46:09.732238  / # /lava-9655906/bin/lava-test-runner /lav=
a-9655906/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6413547b0ab3b940e78c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6413547b0ab3b940e78c8=
640
        failing since 71 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
