Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79C94F221D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 06:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiDEEdW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Apr 2022 00:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbiDEEdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 00:33:09 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7A617E37
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 21:30:27 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ku13-20020a17090b218d00b001ca8fcd3adeso1373429pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Apr 2022 21:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X5Ib7zYup7gdfx5eqBQS7gMiPBfuiYPwBABAsY1/YhI=;
        b=xvLNZy+TofdeD1AtYQvGojLVmOkUclxLbPeJpsed5Nb2/y6P/KFMczA7wexjtPoIEa
         JaK29SkzbOg8P1XE5ee4ht0XxIPw0xd1XCSE/BOoZF7ptAkYd0EoFMTlwT3x03L3Lms4
         J9AoqL8gJ4FFyXPlxsants/o2FP22jZRd1jpQszbOmvu6y1DhStx4XlmaJNSDQDYsEoX
         DtW4AKL44GP8efCtdj8Yiak/EmOrLnV/JGNDCCE7O4hvNpnLYFH5mPiSrsC5BOBsBPDQ
         UePDHFA596jhZBKvt9+jozbIN8lDenRV/g2vMGmqApmMPk0YMVpXQlfLrJ9w38DOg9AE
         vBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X5Ib7zYup7gdfx5eqBQS7gMiPBfuiYPwBABAsY1/YhI=;
        b=KuOKsOvveBKnmL5feXIZsj/dKmLf/1u8o2pCgzqUFvxhllBhjVQ9l0cBvYzRmbXsvY
         jfT/hl2u/SgY4S5STThMbyvKtQLZbymvlZawkMgceRVik/wx4mfVrWgS+Wtum1nfysI+
         HBMI5IkecWoVrOUTZ948Y/2rTLDicDtoSKA3NzsOCvU25aZ+8z5oRWbxaNDiLhXNdJJG
         wqx1OVGwWgxEkem216ebXD33xmmdcJzj6np2rOu9bq0ecPaul32d7tAQiZSPEvZut2uj
         eg2DljXpEd/aBG5cbbLGva1XWd0MACMirNi20mgccofzqkwBmtEScvCU1tKNDlTVMbJM
         PYYg==
X-Gm-Message-State: AOAM530f33Pb9/7XeVi0sNaY1/UlIUOO+z7PAClryASK8SocYm6KdllC
        tTANZnxiWml3Hm7T623aRooTwxWzc8I8c8ddHf8=
X-Google-Smtp-Source: ABdhPJyGlry2D4gaF4QGoXzE1UyDqXl2x0YluDhw6B9p4Ckg71qHrz2C32EcllheiTfjISznLJ+78w==
X-Received: by 2002:a17:90b:38c9:b0:1c7:1ffb:533b with SMTP id nn9-20020a17090b38c900b001c71ffb533bmr1956373pjb.220.1649133027092;
        Mon, 04 Apr 2022 21:30:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d5-20020a056a0010c500b004faee9887ccsm13760415pfu.64.2022.04.04.21.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 21:30:26 -0700 (PDT)
Message-ID: <624bc5e2.1c69fb81.7d75d.4e64@mx.google.com>
Date:   Mon, 04 Apr 2022 21:30:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-04-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 161 runs,
 3 regressions (renesas-devel-2022-04-04-v5.18-rc1)
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

renesas/master baseline: 161 runs, 3 regressions (renesas-devel-2022-04-04-=
v5.18-rc1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
        | regressions
-------------------+-------+---------------+----------+--------------------=
--------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
        | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+ima      =
        | 1          =

rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-04-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-04-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d2f27dc76d3d5a290f9dfcafae3047e5c9d0ba2b =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
        | regressions
-------------------+-------+---------------+----------+--------------------=
--------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/624b91929ad26cd7abae06a2

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/624=
b91929ad26cd7abae06b5
        failing since 14 days (last pass: renesas-devel-2022-03-14-v5.17-rc=
8, first fail: renesas-devel-2022-03-21-v5.17)

    2022-04-05T00:46:58.608769  /lava-105672/1/../bin/lava-test-case
    2022-04-05T00:46:58.609142  <8>[   13.565995] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-04-05T00:46:58.609384  /lava-105672/1/../bin/lava-test-case
    2022-04-05T00:46:58.609612  <8>[   13.585664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-04-05T00:46:58.609838  /lava-105672/1/../bin/lava-test-case
    2022-04-05T00:46:58.610058  <8>[   13.606847] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-04-05T00:46:58.610277  /lava-105672/1/../bin/lava-test-case   =

 =



platform           | arch  | lab           | compiler | defconfig          =
        | regressions
-------------------+-------+---------------+----------+--------------------=
--------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+ima      =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/624b93736bb469db0eae0698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624b93736bb469db0eae0=
699
        new failure (last pass: renesas-devel-2022-03-08-v5.17-rc7) =

 =



platform           | arch  | lab           | compiler | defconfig          =
        | regressions
-------------------+-------+---------------+----------+--------------------=
--------+------------
rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624b91aa9ad26cd7abae06ec

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/624b91aa9ad26cd7abae070e
        failing since 27 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-05T00:47:16.258647  /lava-6021610/1/../bin/lava-test-case
    2022-04-05T00:47:16.269195  <8>[   33.851504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
