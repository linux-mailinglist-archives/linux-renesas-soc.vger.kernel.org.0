Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D05558FEA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 16:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbiHKO7m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 10:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbiHKO7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 10:59:42 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B278A6F549
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 07:59:40 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y141so16694702pfb.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=Mr5DlYlYguRjOfCosO7nGKQkgX7ELU9Q/v+xazV66ok=;
        b=euaEtlbunpetpYcg5FAUU6XqzxL3S9isqyDJSQ7dHEDwi6cS2PrL3h5b2rFedC0xgg
         a93l7T2Nb/2Gx28qyP2m/1k7RTjQYxoI6LOJkSuV8LGYb5hPsx4Jrv9+YLlDCB4esJuh
         W7CPojBPMuozjItWjAOVgWx6Cqwd+pgzEA7XTERXxqQ7j6vDxO0cmNayFwj5iwA0yisI
         H99VOwVLsSLLXUBHF+QEDHebJT+pIjzOU4LChKglpglk5ThjnIrKxAmg9v5UUkyZmwj6
         z0mEZiNndVFjJ/quBEeY+ou3Wj1gCpVcf6zNck0lx8iECHV/XTzpFXBr7KBMCQmLzDAg
         ePoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=Mr5DlYlYguRjOfCosO7nGKQkgX7ELU9Q/v+xazV66ok=;
        b=0vp7T5KtfO8KsYjyjtteo0hm4DjnoN03g5dKYDHwhzHttSkqZVNxroZVuipzbjMMGW
         D2WQVlKcnNvKO8uRzYEdNQkS+Ion4b2R4Q11L58KluZLHVXuiDoYalA5GogSoIOX0SXg
         Hjcp27tNCtO+5auNEQTiXWRdtgYkqkEYkcx0q/GxMPEIG2YHwJgfHTZRAxRP8u4gX2rY
         W+ejl2+YiyUdanJyDI0mt5RELrxDgYCC0jmXS6EmFGjKrcrc69FxlUBhol8/lmc7ANfH
         gMGX+kEc61ssAVcYVMJSWu0aZiuiEqX9XPtgxtSW0zdt5Y+gl11zN733xpD1WO53AR/L
         YKwQ==
X-Gm-Message-State: ACgBeo2YMtUEk+lSom9QnkM8KZE3KSqYciUICFSYj+lCGM/vKkLV8gy+
        vw51T3lmWr8Ll4sbIjm1lAZaFST8435oteN/s2k=
X-Google-Smtp-Source: AA6agR6H44uawe1rUw/trly4N4Lw+YAZGuuLqBFsFmOl9md5XZPRIysMME23wPn8FRHPbtEhxO5+/g==
X-Received: by 2002:a63:2cc6:0:b0:41c:5f9c:e15c with SMTP id s189-20020a632cc6000000b0041c5f9ce15cmr26612139pgs.241.1660229979846;
        Thu, 11 Aug 2022 07:59:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p11-20020a635b0b000000b0041a615381d5sm11806158pgb.4.2022.08.11.07.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 07:59:39 -0700 (PDT)
Message-ID: <62f5195b.630a0220.40f8b.3e7f@mx.google.com>
Date:   Thu, 11 Aug 2022 07:59:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-11-v5.19-rc8
Subject: renesas/master baseline: 512 runs,
 13 regressions (renesas-devel-2022-08-11-v5.19-rc8)
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

renesas/master baseline: 512 runs, 13 regressions (renesas-devel-2022-08-11=
-v5.19-rc8)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-11-v5.19-rc8/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-11-v5.19-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a245a07d9664fde5a92478ad52da19ba8962926 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e1cb06747326e3daf06c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f4e1cb06747326e3daf=
06d
        failing since 93 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e3bfca13ca70d3daf0a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f4e3bfca13ca70d3daf=
0a6
        failing since 93 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e5c739a4cedb4edaf14b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/ba=
seline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/ba=
seline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f4e5c739a4cedb4edaf=
14c
        failing since 65 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e94bb63c73c3dedaf066

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f4e94bb63c73c3dedaf=
067
        failing since 52 days (last pass: renesas-devel-2022-06-17-v5.19-rc=
2, first fail: renesas-devel-2022-06-20-v5.19-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e765b96259ea24daf057

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
f4e765b96259ea24daf060
        failing since 37 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5)

    2022-08-11T11:26:03.836071  /lava-153575/1/../bin/lava-test-case
    2022-08-11T11:26:03.915838  <8>[   38.008722][  T314] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e729d36523c578daf15c

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62f=
4e729d36523c578daf16f
        new failure (last pass: renesas-devel-2022-07-22-v5.19-rc7)

    2022-08-11T11:25:10.353742  /lava-153569/1/../bin/lava-test-case
    2022-08-11T11:25:10.354353  <8>[   22.637049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-08-11T11:25:10.354624  /lava-153569/1/../bin/lava-test-case
    2022-08-11T11:25:10.354872  <8>[   22.656810] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-08-11T11:25:10.355120  /lava-153569/1/../bin/lava-test-case
    2022-08-11T11:25:10.355361  <8>[   22.677912] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-08-11T11:25:10.355604  /lava-153569/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e737fefa4eb38cdaf0cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f4e737fefa4eb38cdaf=
0cc
        failing since 37 days (last pass: renesas-devel-2022-07-04-v5.19-rc=
5, first fail: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e7125c73aee56adaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f4e7125c73aee56adaf=
057
        failing since 37 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e7036898bda007daf06a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f4e7036898bda007daf=
06b
        failing since 37 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62f4e7917a679f9014daf065

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62f4e7917a679f9014daf087
        failing since 155 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-08-11T11:26:59.217368  /lava-7013528/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62f4e7917a679f9014daf0aa
        failing since 65 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-08-11T11:26:56.016180  <8>[   33.121808] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-08-11T11:26:57.031381  /lava-7013528/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62f4e7917a679f9014daf0ab
        failing since 65 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-08-11T11:26:54.988661  <8>[   32.094260] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-08-11T11:26:56.004048  /lava-7013528/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62f4e7917a679f9014daf0ac
        failing since 65 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-08-11T11:26:54.256953  <4>[   31.362902] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-08-11T11:26:54.975748  /lava-7013528/1/../bin/lava-test-case   =

 =20
