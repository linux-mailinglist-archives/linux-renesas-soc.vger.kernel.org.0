Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F634E37CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 05:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbiCVED2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 00:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbiCVEDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 00:03:20 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50182201A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 21:01:53 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e5so2647657pls.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 21:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JaBE286KjiC+FASrxLQrz8I9+pnAQnMUMnHFkgpRLOY=;
        b=uiGjhI3Zzlb8Jl9GaOE/rhstwUvLkkWsOSLIA3HTv2TihZW69NY81+BXSPajnABOcr
         G/PhIzqrlI6aGh+zwQIDy7Z+papmloVMDYdHSINLzmnG/n0ty59bKIB8yTLEORKUXHFp
         oBX9J0fsUUEZEfsZBP8TwsqADMOM4kLTWDqO10J2sMPcx7CDUsv4e3dHglLS8/AlNY0W
         8W1wqKbc0YS3mFlcfTBnTqVF/LIPnDAHVPeSi6CtJjlV2Q2UEYm+GJxoQazNnAerlSE7
         i9UuvmIeMOjG4zoEqxUP9cSwss7XfD5xl5NDnYltP2GW66zYlV8sOYz4/MUs2DLHeh4y
         46lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JaBE286KjiC+FASrxLQrz8I9+pnAQnMUMnHFkgpRLOY=;
        b=ipZorcBiMEGbq539Wcn+pE3TeB7XV9+bvpAHfqtqecYkZ1jCn7/njyR+jY7SVNJNaj
         P2+F6ulyiUekiv3YNqh71IoY51dQih4/x/SEFhGJY5LXpyGLmEj11kZn6JZrKLkIX70E
         0H7GCfFT8nkk8MqgP66957GsNiV5p1bVz+1sR8MtXZOsAwLSi9bwh6O5o2MzC+zMOKnI
         lCoLGuHfPgWC+I7GNG1uX2OREk4rf8vFybmyxidlaJvDzolpALWHhIdIZIA75TOI39MI
         Keg47xamv50E35lMY98fujIWCi/XXedJZE1obkp5Cold+e8ofOkW0RLLG+o+Lxexont6
         4lNA==
X-Gm-Message-State: AOAM530KoawzB4j/pqRGiqAvZws06lShLymOrLRfLKioBK8uAVNXXPoh
        543LX8CX82vTodlPQGZyJh9bsZgu45JdJ62/m8U=
X-Google-Smtp-Source: ABdhPJzFdatOEcvWCzA/zm1nt4PSzGV72xiW37ycLEBTzPcu5sz1/1lN26uRMQzKsZlq251lHttXdg==
X-Received: by 2002:a17:902:d488:b0:154:6df6:1e81 with SMTP id c8-20020a170902d48800b001546df61e81mr5125074plg.105.1647921712627;
        Mon, 21 Mar 2022 21:01:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d18-20020a056a0010d200b004fa2e13ce80sm19561911pfu.76.2022.03.21.21.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 21:01:52 -0700 (PDT)
Message-ID: <62394a30.1c69fb81.927bd.6df8@mx.google.com>
Date:   Mon, 21 Mar 2022 21:01:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-03-21-v5.17
Subject: renesas/master baseline: 237 runs,
 4 regressions (renesas-devel-2022-03-21-v5.17)
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

renesas/master baseline: 237 runs, 4 regressions (renesas-devel-2022-03-21-=
v5.17)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

kontron-pitx-imx8m       | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =

rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-21-v5.17/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-21-v5.17
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bb77d4c08c656dc6f9863818e8405efba05abf1e =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/623935560a851254ad2172c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623935560a851254ad217=
2c6
        failing since 126 days (last pass: renesas-devel-2021-11-02-v5.15, =
first fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-pitx-imx8m       | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6239140a59b8d704902172c6

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/623=
9140a59b8d704902172d9
        new failure (last pass: renesas-devel-2022-03-14-v5.17-rc8)

    2022-03-22T00:10:33.580111  /lava-101366/1/../bin/lava-test-case
    2022-03-22T00:10:33.580508  <8>[   11.355691] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-03-22T00:10:33.580728  /lava-101366/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/623913e30d96ff6d17217365

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minno=
wboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minno=
wboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623913e30d96ff6d17217=
366
        new failure (last pass: renesas-devel-2022-03-08-v5.17-rc7) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62391453b48f329ce52172d6

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62391453b48f329ce52172f8
        failing since 13 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-03-22T00:11:47.190530  <8>[   32.797765] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-22T00:11:48.217341  /lava-5918954/1/../bin/lava-test-case   =

 =20
