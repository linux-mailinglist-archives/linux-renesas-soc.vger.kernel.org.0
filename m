Return-Path: <linux-renesas-soc+bounces-3008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED285C43E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 20:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35542B225E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 19:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D9F12E1D8;
	Tue, 20 Feb 2024 19:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="r3GXH7Rj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDABD78B51
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708455917; cv=none; b=DWUQVTZC7eYR4PtVwt2ysLmA9n89Xs9EqarCITJUAKMFfc1Q+muLq4BFFY64ICUSxH771xGzfSDCdcowJe/kzQ80xZL9M0vKVTTNzSImnBWEBIjtug0jSafpddETNYOTeuoddkuPHj3nmrDlv27O3O/yNKFEgZot8GnnYzy/If4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708455917; c=relaxed/simple;
	bh=Lwr2+2GgHRF57aDXFlCDaOBTflNMapzaxF23qqt8tYY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cFrbA5TwIrRd7Vs5F4Upz6OUvnNvYLwBgdTcm97xKX0eBkbG4RIgCtsg5rw9vu5x0fiPaZZVdJP/Ncae6oU5SsT1cbyIHBpuzYohFSgzMU5ew27DWwUTkpqoLItSF7uXk6iTqnbgkMmXI23h5m9a06Drjg/0HKd1R/5l3j7lqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=r3GXH7Rj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d94323d547so42485475ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 11:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708455915; x=1709060715; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vxdagKyaurlgu1pzgpyrDBsYntYe3De5mUzIOL3+f4E=;
        b=r3GXH7RjcCOcaIqEqRO02tNK0rZD3cKbTudHT7RGXDq4aT2SCt8O07/f74gw/9aO4J
         WQ/DtGzlnb+0pfxeG24WsGToAZ3KtV6hTugYz+dq6WKe0ynzptqVCF42iX4gihmrPuSR
         G5SnLtd4kBwnmT+m0dwhCdiSbL3hvHRUEwBgpaxHqI6DRRW0SIgayphZRZImZtPoVgMO
         FpCPXl574c4TecXIi833XyvPme4ecM7XzgENJLCYJ3fxnWg/i4YHvxRFmSrO4oycu4jK
         gLZnzn8NujzjYZPc/V2oBSB0GJA/TDSBCcziAxy2kXV3V6M1lmMM+OjaBQfU6ktAYBW/
         jJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708455915; x=1709060715;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxdagKyaurlgu1pzgpyrDBsYntYe3De5mUzIOL3+f4E=;
        b=ZVjfv2ZzxIh/HCVgcyxww7n6n9CcBaaGEdcV2tA3Z28VtYGssXELljQxfcjOTCkHUT
         c2o1GDONY3II6CKfmuZoHj9dvpu0OlTQtFrD0xIWvzgO2DnjsxZcHLGJUxSTgUQwg5c+
         5Ut1UZKcqsOCAruZvWPY04dHAiAZPJh2nQ4OQs5J4bLvUnaDVGhwwmvzuTcel5m6e01S
         ku4h+3ohYUzdYkzXHiaszQlBlpkhlQiUIkw/DX3C8btNKQ9pfdLDtuPjKQvKBvxYJ8hb
         NaX5V+m+VA41l/f0T2OwvgW0HvSCRZULw3gl1jUL3eegCvvRseeEbFVsAlyBTUVfkfo6
         L7cg==
X-Gm-Message-State: AOJu0Yy7r6bpZH/fm7pfvDm7rZSboy0j32eYX1KVA2VVGTSI257OW+kY
	ZbQEHD4Efwn5BMy06vlaI9HzoRI/GOPuG2uzGLQtZa+RM/Q9IA2u+4J8y/Ow2dQiIwxXLvMM995
	YBpc=
X-Google-Smtp-Source: AGHT+IFqx63gtvPCG9vkEuz53TcDjXvSNnYzt2cfjAmVfD2RBLCwsYG0o+mKFaDcQy/L+hPXfYfnvg==
X-Received: by 2002:a17:902:b407:b0:1d9:9c96:673c with SMTP id x7-20020a170902b40700b001d99c96673cmr14986634plr.46.1708455914584;
        Tue, 20 Feb 2024 11:05:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n17-20020a170902e55100b001d8f2438298sm6525602plf.269.2024.02.20.11.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 11:05:14 -0800 (PST)
Message-ID: <65d4f7ea.170a0220.1f224.4701@mx.google.com>
Date: Tue, 20 Feb 2024 11:05:14 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-20-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 56 runs,
 8 regressions (renesas-devel-2024-02-20-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 56 runs, 8 regressions (renesas-devel-2024-02-20-v=
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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-20-v6.8-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-20-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b69e73e919f617121d1fc0703b270e999ac5f559 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4c6fc9709304724637065

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4c6fc970930472463706e
        failing since 386 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2024-02-20T15:36:04.884381  + set +x
    2024-02-20T15:36:04.884548  [   13.415961] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026105_1.5.2.3.1>
    2024-02-20T15:36:04.991247  / # #
    2024-02-20T15:36:05.092862  export SHELL=3D/bin/sh
    2024-02-20T15:36:05.093254  #
    2024-02-20T15:36:05.194175  / # export SHELL=3D/bin/sh. /lava-1026105/e=
nvironment
    2024-02-20T15:36:05.194667  =

    2024-02-20T15:36:05.295496  / # . /lava-1026105/environment/lava-102610=
5/bin/lava-test-runner /lava-1026105/1
    2024-02-20T15:36:05.296218  =

    2024-02-20T15:36:05.299197  / # /lava-1026105/bin/lava-test-runner /lav=
a-1026105/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d4c4848d42c48297637050

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4c4848d42c48297637057
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-20T15:25:40.476265  <8>[   20.106823] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 432692_1.5.2.4.1>
    2024-02-20T15:25:40.583787  / # #
    2024-02-20T15:25:40.685527  export SHELL=3D/bin/sh
    2024-02-20T15:25:40.685939  #
    2024-02-20T15:25:40.786616  / # export SHELL=3D/bin/sh. /lava-432692/en=
vironment
    2024-02-20T15:25:40.786885  =

    2024-02-20T15:25:40.887418  / # . /lava-432692/environment/lava-432692/=
bin/lava-test-runner /lava-432692/1
    2024-02-20T15:25:40.887838  =

    2024-02-20T15:25:40.929984  / # /lava-432692/bin/lava-test-runner /lava=
-432692/1
    2024-02-20T15:25:40.950170  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (19 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d4c4848d42c4829763705b
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-20T15:25:43.056505  /lava-432692/1/../bin/lava-test-case
    2024-02-20T15:25:43.056643  <8>[   22.675736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-20T15:25:43.056713  /lava-432692/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d4c4848d42c4829763705d
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-20T15:25:44.116020  /lava-432692/1/../bin/lava-test-case
    2024-02-20T15:25:44.116196  <8>[   23.715987] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-20T15:25:44.116300  /lava-432692/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4c4848d42c48297637062
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-20T15:25:45.192495  /lava-432692/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d4c4848d42c48297637063
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-20T15:25:45.195802  <8>[   24.828146] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-20T15:25:46.249982  /lava-432692/1/../bin/lava-test-case
    2024-02-20T15:25:46.250485  <8>[   25.849639] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-20T15:25:46.250843  /lava-432692/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d4c4d424fd391d19637025

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4c4d424fd391d1963702c
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-20T15:26:56.826111  / # #
    2024-02-20T15:26:56.928150  export SHELL=3D/bin/sh
    2024-02-20T15:26:56.928754  #
    2024-02-20T15:26:57.030107  / # export SHELL=3D/bin/sh. /lava-432691/en=
vironment
    2024-02-20T15:26:57.030842  =

    2024-02-20T15:26:57.132101  / # . /lava-432691/environment/lava-432691/=
bin/lava-test-runner /lava-432691/1
    2024-02-20T15:26:57.133384  =

    2024-02-20T15:26:57.174201  / # /lava-432691/bin/lava-test-runner /lava=
-432691/1
    2024-02-20T15:26:57.206134  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T15:26:57.206570  + <8>[   20.902290] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 432691_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4c4d424fd391d1963703f
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-20T15:26:59.641495  /lava-432691/1/../bin/lava-test-case   =

 =20

