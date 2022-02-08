Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507644ADAC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 15:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350967AbiBHOFY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 09:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239804AbiBHOFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 09:05:23 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCF6C03FED1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 06:05:22 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t4-20020a17090a510400b001b8c4a6cd5dso2870612pjh.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Feb 2022 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/CrcokIha9TbIiSdVT9Iw1TF/Deop0xhXsEGIlklJ9Y=;
        b=2QVUihclxBWE2pVvVVrXqtRFjz8xzxXT394fmaSWMJP93Y7dRAO9k3mNkHzqbGuwhH
         s/F41lMfeTaJFoJWQf5THSkn/CEnBb8jPJRGDuvlwXch0+RslDNXUX0rQnTnAuXCHal0
         cp06fRxyEoNTjv0A5VEDyOydB41xFqaR9BrHhq/REW4c97pWL8F7lVQRqO3ADgAxeuPK
         hElr+wy+3U/+Viib53JAxB8ohaLeBEdcEHLCSsJTVKpIo5ntGX88Js2bpc4f07szxY3v
         JVcu5RaNByciighztjcLNJGZtRpElkmwxPszKUf+bzQLMEm4t1mnCvd1kcrFwegOeO+r
         YqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/CrcokIha9TbIiSdVT9Iw1TF/Deop0xhXsEGIlklJ9Y=;
        b=NS1CLYlSxdXDENyOjD4dkDjKRV/EVROl0DoGvcbRFwCeHhU1gT5ffaId3vOIGmtmtT
         xno3amENereG6sJbn8N4TxXY1GMqn6hWqlrgUDI3FHqfvPY+eXsz7t++DN7FkGmZKmZa
         7DDNRNUva4y/wRx3s+yCKMs6pK/TUirTCqjj+MG7ZTQxBt9tipYZpqbj0IWQfFt8ZnUx
         xeTRTBr+kZEKjUe7llb+RMDcrHTd4VzO/jwSqXhbkE8979vimkRoLDdsUKE/BofMVS0K
         XHKp6GOqb7/ucUn5L78LmEIcw5fA2gRORCFSwj7JapL8q/yPEOIzW6kTtZxScMpr5Zb8
         8nrQ==
X-Gm-Message-State: AOAM530URh0SLtW2pCgmtynNxBHgaAQnW4iAizeKwHIZQG52AQUPjmeh
        LTWwXzq8E5syir9kNt2nZz4xgCmCs+HIvtr6
X-Google-Smtp-Source: ABdhPJzhCugCHsZMOPLJ7YgCDa9C+iyG96ogEFjt0k5/Sl47IpPOdYKMLUgrDxG+12J4Y75RXDeSnw==
X-Received: by 2002:a17:90b:3852:: with SMTP id nl18mr1541733pjb.228.1644329121666;
        Tue, 08 Feb 2022 06:05:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13sm15817354pfm.161.2022.02.08.06.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 06:05:21 -0800 (PST)
Message-ID: <620278a1.1c69fb81.dcbb0.7a78@mx.google.com>
Date:   Tue, 08 Feb 2022 06:05:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-08-v5.17-rc3
Subject: renesas/master baseline: 270 runs,
 12 regressions (renesas-devel-2022-02-08-v5.17-rc3)
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

renesas/master baseline: 270 runs, 12 regressions (renesas-devel-2022-02-08=
-v5.17-rc3)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
            | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig        =
            | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m     | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
            | 1          =

kontron-pitx-imx8m     | arm64 | lab-kontron | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
            | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig        =
            | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-08-v5.17-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-08-v5.17-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      429683cd533e19e9d252957b958c071b011dd88e =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62023ccec6eefbc34d5d6f1b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62023ccec6eefbc34d5d6f5c
        failing since 13 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: renesas-devel-2022-01-25-v5.17-rc1)

    2022-02-08T09:49:40.964850  /lava-85115/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
23ccec6eefbc34d5d6f5d
        failing since 13 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: renesas-devel-2022-01-25-v5.17-rc1)

    2022-02-08T09:49:40.967936  <8>[   16.670251] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T09:49:42.014252  /lava-85115/1/../bin/lava-test-case
    2022-02-08T09:49:42.014654  <8>[   17.688934] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62024b31fa8b2380335d6f0e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62024b31fa8b2380335d6f4f
        failing since 14 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: v5.17-rc1-611-g4ccda2778be0)

    2022-02-08T10:51:23.161758  /lava-85128/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
24b31fa8b2380335d6f50
        failing since 14 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: v5.17-rc1-611-g4ccda2778be0)

    2022-02-08T10:51:23.164895  <8>[   18.538372] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T10:51:24.212660  /lava-85128/1/../bin/lava-test-case
    2022-02-08T10:51:24.213008  <8>[   19.557147] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T10:51:24.213200  /lava-85128/1/../bin/lava-test-case
    2022-02-08T10:51:24.213380  <8>[   19.574213] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-08T10:51:24.213560  /lava-85128/1/../bin/lava-test-case
    2022-02-08T10:51:24.213734  <8>[   19.590164] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-08T10:51:24.213906  /lava-85128/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62024c49ff54678a7c5d6f4c

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62024c49ff54678a7c5d6f8d
        failing since 13 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: renesas-devel-2022-01-25-v5.17-rc1)

    2022-02-08T10:55:55.662103  /lava-85137/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
24c49ff54678a7c5d6f8e
        failing since 13 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: renesas-devel-2022-01-25-v5.17-rc1)

    2022-02-08T10:55:55.665294  <8>[   13.786647] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T10:55:56.715387  /lava-85137/1/../bin/lava-test-case
    2022-02-08T10:55:56.715779  <8>[   14.805455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T10:55:56.716019  /lava-85137/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-pitx-imx8m     | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62023c1d53bc8d3a105d6f4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62023c1d53bc8d3a105d6=
f4f
        new failure (last pass: renesas-devel-2022-01-25-v5.17-rc1) =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-pitx-imx8m     | arm64 | lab-kontron | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62024b1c807a6972345d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62024b1c807a6972345d6=
ee9
        new failure (last pass: renesas-devel-2022-01-25-v5.17-rc1) =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62023aedc2d07f487a5d6f0b

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62023aedc2d07f487a5d6f53
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-02-08T09:41:54.962628  /lava-85112/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
23aedc2d07f487a5d6f54
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-02-08T09:41:54.965798  <8>[   13.467131] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T09:41:56.014527  /lava-85112/1/../bin/lava-test-case
    2022-02-08T09:41:56.014930  <8>[   14.485838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62023f03d66ba1a5825d6efb

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl2=
8-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl2=
8-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62023f03d66ba1a5825d6f43
        failing since 14 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: v5.17-rc1-611-g4ccda2778be0)

    2022-02-08T09:59:15.427248  /lava-85131/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
23f03d66ba1a5825d6f44
        failing since 14 days (last pass: renesas-devel-2022-01-11-v5.16, f=
irst fail: v5.17-rc1-611-g4ccda2778be0)

    2022-02-08T09:59:15.430658  <8>[   13.483070] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T09:59:16.477169  /lava-85131/1/../bin/lava-test-case
    2022-02-08T09:59:16.477567  <8>[   14.502283] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T09:59:16.477806  /lava-85131/1/../bin/lava-test-case
    2022-02-08T09:59:16.478032  <8>[   14.518165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =20
