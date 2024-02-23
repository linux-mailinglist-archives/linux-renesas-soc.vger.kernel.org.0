Return-Path: <linux-renesas-soc+bounces-3140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A8861C4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 20:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B9C1F2392A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 19:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED2046B8;
	Fri, 23 Feb 2024 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="R/CZa63n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C04179A8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 19:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708715530; cv=none; b=gORwHV+1c/veIWyX5/8KRuAsuEgsKhkkc4hxCfI3Nd/D7XlXujH8mfhL7JkOTdgaXdhs31CkeXvy2zdknVYCHSP/mcvSq/NELxEJnWLlvrDo1eTsNJG89ik7z7Irk+hjC8W8CLpVBvJklGpQmXOgBkt+pJZwqOKPvRyM2/hsa2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708715530; c=relaxed/simple;
	bh=tmPWBz/n6ydigbrSIdYMziKndu3jnof3gGbRM797tGo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AgGrS1BHr+lFWM6Czw9jD9cN405xoN/0WjybJYceLOkvmAWZwa9iv95IP2U+MABMeeAkAO0EBqG0BLyl2lZTD5HplGKilLolNlpGjS5OijuEWQkgYtaNOMFK0a2bqtMzNSw2JB9Vm7IgNQGC4xvr1nIycdPtMzMNPMCuOjmJLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=R/CZa63n; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso1016661b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 11:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708715527; x=1709320327; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zGxHSrdZEugfaDCAQNZwojqrgiIkeTbeaHurDqMQ3LY=;
        b=R/CZa63n6mvhK7DD1bQ+wCsG2BGBtb4KxA68nts/wfC9tzSnZM1czjJs2Z7grct0gi
         WI+IvlQb18ZRsG3wU/r3CMWQd/UiLjj9dB2TjDaCMdc5frcatgiqOSoCHR9Ua1QXXBhx
         Z/2ozRDMG6mHnLIiSl6CePioR2y3ccsB5s7vTBMM3PViSyrvEAi6AIEVoCf64UkJGXIY
         CqteJPihV2PuD3Dabhy7Hj469Sn/GMDWrI8t0E6fnI7nF1MZ86J+jT6Ljz2CHwdGRtGg
         y746fGPyk0pTryTBddN59MczXDIo382kPKV2zLq9uO1ee0i3Qp5tYuN58DHfg+NdLTps
         pH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708715527; x=1709320327;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGxHSrdZEugfaDCAQNZwojqrgiIkeTbeaHurDqMQ3LY=;
        b=tP7mqj3xW6xLF/vf7ZSHrNR42N4kJatyUx51wRIoFsS8UcInQe0pcof/reC6igCRqw
         +VQ9Fgpr6D8x3sjx0jz0ZDTwuWaIaUfO3Fj0KYZxSayt0bZGICBTJw7ejVUtVbXoTvOO
         dLkPqFmG3vWJ3kWEQsxBFiRJnGs2xIbOEGryyZCjihMAiUsJMx9MOrOgWN1FfSq1IfU4
         pcNxtgGvW1re00NXjvyC8mhYgcPuAIw1AhRuBgTXbwXuA8KrRkCKZVoocScvuUXO8fJB
         tigXElDaW1kV0lAmxaji6nG1JvNohw2U9eXYzeM3Bfje903Kge+E/SilMMaN3qQhAOUU
         j/5A==
X-Gm-Message-State: AOJu0YyuXYBWDGDRO0qXRvrftQxRGB02m1xuOh3IMphura0F9FVWxaeI
	eUnOUDmH9dY91DrnNKM4H4QtQ7RUddh4PjVq19uhFEf7536gNI2veDWrfPoUb4Kg0fHncXunHx9
	oR2A=
X-Google-Smtp-Source: AGHT+IE4y02m6lumsG7pPLeqwYT/hR1SOfbCGEQLOk2iQyushEkH3/eRWkyAaC1RWpSqRA67fxGBbA==
X-Received: by 2002:aa7:8883:0:b0:6e0:50cb:5f0a with SMTP id z3-20020aa78883000000b006e050cb5f0amr778092pfe.12.1708715527214;
        Fri, 23 Feb 2024 11:12:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t22-20020a056a00139600b006e47ccc2e2esm7765858pfg.5.2024.02.23.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 11:12:06 -0800 (PST)
Message-ID: <65d8ee06.050a0220.494e6.f733@mx.google.com>
Date: Fri, 23 Feb 2024 11:12:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2024-02-23-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 56 runs,
 9 regressions (renesas-devel-2024-02-23-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 56 runs, 9 regressions (renesas-devel-2024-02-23-v=
6.8-rc5)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =

rk3399-roc-pc          | arm64 | lab-broonie     | gcc-10   | defconfig    =
      | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-23-v6.8-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-23-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      74deefee78fc74bf27b23a5c00267a5e697f72e9 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8bd0a10918bb525637049

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d8bd0a10918bb52563704e
        failing since 389 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2024-02-23T15:42:48.505102  + set +x
    2024-02-23T15:42:48.505343  [   13.431568] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1027991_1.5.2.3.1>
    2024-02-23T15:42:48.612747  / # #
    2024-02-23T15:42:48.714050  export SHELL=3D/bin/sh
    2024-02-23T15:42:48.714559  #
    2024-02-23T15:42:48.815347  / # export SHELL=3D/bin/sh. /lava-1027991/e=
nvironment
    2024-02-23T15:42:48.815841  =

    2024-02-23T15:42:48.916870  / # . /lava-1027991/environment/lava-102799=
1/bin/lava-test-runner /lava-1027991/1
    2024-02-23T15:42:48.917484  =

    2024-02-23T15:42:48.920822  / # /lava-1027991/bin/lava-test-runner /lav=
a-1027991/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d8bd64cacfb009e66370da

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d8bd64cacfb009e66370e1
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-23T15:44:07.107401  / # #
    2024-02-23T15:44:07.208169  export SHELL=3D/bin/sh
    2024-02-23T15:44:07.208663  #
    2024-02-23T15:44:07.309817  / # export SHELL=3D/bin/sh. /lava-434220/en=
vironment
    2024-02-23T15:44:07.310603  =

    2024-02-23T15:44:07.412117  / # . /lava-434220/environment/lava-434220/=
bin/lava-test-runner /lava-434220/1
    2024-02-23T15:44:07.413172  =

    2024-02-23T15:44:07.421799  / # /lava-434220/bin/lava-test-runner /lava=
-434220/1
    2024-02-23T15:44:07.477968  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-23T15:44:07.478407  + <8>[   20.645936] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 434220_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d8bd64cacfb009e66370e5
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-23T15:44:08.545768  <8>[   21.730301] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-23T15:44:09.582438  /lava-434220/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d8bd64cacfb009e66370e7
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-23T15:44:10.644593  /lava-434220/1/../bin/lava-test-case
    2024-02-23T15:44:10.645087  <8>[   23.791904] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-23T15:44:10.645379  /lava-434220/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d8bd64cacfb009e66370ec
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-23T15:44:11.722292  /lava-434220/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d8bd64cacfb009e66370ed
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-23T15:44:11.725576  <8>[   24.910761] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-23T15:44:12.780119  /lava-434220/1/../bin/lava-test-case
    2024-02-23T15:44:12.780281  <8>[   25.932390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-23T15:44:12.780406  /lava-434220/1/../bin/lava-test-case
    2024-02-23T15:44:12.780524  <8>[   25.950089] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-23T15:44:12.780640  /lava-434220/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d8bd501ed034773b637068

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d8bd501ed034773b63706f
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-23T15:44:01.288718  / # #
    2024-02-23T15:44:01.390549  export SHELL=3D/bin/sh
    2024-02-23T15:44:01.391202  #
    2024-02-23T15:44:01.492381  / # export SHELL=3D/bin/sh. /lava-434213/en=
vironment
    2024-02-23T15:44:01.493037  =

    2024-02-23T15:44:01.594215  / # . /lava-434213/environment/lava-434213/=
bin/lava-test-runner /lava-434213/1
    2024-02-23T15:44:01.595251  =

    2024-02-23T15:44:01.602819  / # /lava-434213/bin/lava-test-runner /lava=
-434213/1
    2024-02-23T15:44:01.663785  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-23T15:44:01.664145  + <8>[   20.995471] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 434213_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d8bd501ed034773b637082
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-23T15:44:03.041214  <8>[   22.394775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-23T15:44:04.101952  /lava-434213/1/../bin/lava-test-case
    2024-02-23T15:44:04.102411  <8>[   23.415995] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-23T15:44:04.102773  /lava-434213/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
rk3399-roc-pc          | arm64 | lab-broonie     | gcc-10   | defconfig    =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8d66cbd2195399b637013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d8d66cbd2195399b637=
014
        failing since 18 days (last pass: renesas-devel-2024-01-31-v6.8-rc2=
, first fail: renesas-devel-2024-02-05-v6.8-rc3) =

 =20

