Return-Path: <linux-renesas-soc+bounces-3471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60989871F86
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 13:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FAE2852A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 12:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A153B58AB6;
	Tue,  5 Mar 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nS4IPGLS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3C55C61F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709643168; cv=none; b=rWWf4vgKnrEF7p4ZOVFYjzL6j/3V3/0ZLDdhPN5SVTLqzb44BdA6REdMWAcKXYfEj5jTRC4sDWopA35kNMGiUy5PvMqw+VcyCEGUbS1hkut2uazZz+hOf6i8IBGMAJqpEYfInhGI+eLYlXxWaF14jpdaHZ8HAfy0AyN/H7XAUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709643168; c=relaxed/simple;
	bh=hLg0N8KSQki0T17mKs4XiJMcX7wQgJ4Vdi0v8O5vkUU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=r3oBC/jBBXmYvAJ8575ftGFamEhOJcNujSuMQvB/6C4numWSrII7iACP+EFF76aY/Vl5ab0SyXGd8oIavY2yYMOYjVZJxo83FCzaKmnIrexY/+VQqaS83LCINFfkI4CwV7qwzBVEtBEcCPJZaJnaiTfNo42nl03sR+lFDnukkN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nS4IPGLS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e5e4b1d1f1so2057621b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2024 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709643165; x=1710247965; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0i3ID5QWejLcTactJZP9moWGumZHauAPcy7zRk4muCQ=;
        b=nS4IPGLSeHui1QKCJ81r25jU42UP5muM7adzL7N85e4PDuY2Dbx6hT88sshjYANNFr
         a/C3mFZtGzMJRhwe9c9Pi8wJCXnswemFw+OF1ySzXG9LwnSs50XQQATKaP1JlHIJkdgh
         ba8Zq2r2l8Fq0UffKaMzyiqAQdCuVrIz0p30hFNXfveZ6gXQr5SJ6q3/WYENVzkTOHTL
         cUxIWZxyhPEoWYlndKQHh1LSSBB4bcavjVsGd3KIRGsU1Wk3ac1e+VHQIg4UqKAZcaI+
         21ZJsLzY1X/Abiz8dA2W5p3UKe9Nr7+4VmKwQaooBq5Smse3e+uzSgsaAxLoJGC1ypZU
         mgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709643165; x=1710247965;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0i3ID5QWejLcTactJZP9moWGumZHauAPcy7zRk4muCQ=;
        b=EZR2oRlwBKs3PKMSeMY5kLMEld/8TPueScxVjKz5fEBg1/dzDrqymdwxT4teUlfp6C
         PnYnFTfhC5HjZAopaxpaiCY7f0TbjhU+XY7+rw3/ILkiIWl2XE1qCcNC9W4NQ9Gz62PJ
         fBZUqqQFb/xOIrrKNSZE5jKZwxRkz42fV6h4bZpdjZnj4mwqZJ6g4EqBSx5YYqeWHm/i
         UKqDwCPdGVTxPCw1hz2pTyJPHHWZEyaIdmu5LtzYx275jRD4U3X9nqrEemrMsCa3phD5
         2iDdLf4JtUaqYAAvns72BaTTj95BwFR0NfiOPOvjEjUsweplCEkacTDE8mmthKtUDFY3
         zkoA==
X-Gm-Message-State: AOJu0Yym5GfKsMWk32FYgayLDSqtPEr+PQABk+mBda7pQoOqd8kuW/Iz
	+gap1XHdeAURczcMSer4E4/gAxV+vcq8NUyrtHVfAAZY5Px2UrJ9QsF6cx4R5CHFN5adnj/94Pe
	LSrY=
X-Google-Smtp-Source: AGHT+IEqNf+2K3ATjXkDcMz14R/cNjae46gF8Fpl48cuBQtKN9+nrOsK+JxUp0RxRGp1zn+57oL6YQ==
X-Received: by 2002:a05:6a20:3c9f:b0:1a0:8897:85f1 with SMTP id b31-20020a056a203c9f00b001a0889785f1mr1872813pzj.6.1709643165677;
        Tue, 05 Mar 2024 04:52:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c6-20020a056a000ac600b006e627f33178sm2894002pfl.213.2024.03.05.04.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:52:44 -0800 (PST)
Message-ID: <65e7159c.050a0220.94f1.a730@mx.google.com>
Date: Tue, 05 Mar 2024 04:52:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2024-03-04-v6.8-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 33 runs,
 7 regressions (renesas-devel-2024-03-04-v6.8-rc7)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 33 runs, 7 regressions (renesas-devel-2024-03-04-v=
6.8-rc7)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-03-04-v6.8-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-04-v6.8-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a101ea53f7984907ab2f8b22b5a294f8d5992a3 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65e6e1ebc6bdd128dd4c4304

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-04-v6.8-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-04-v6.8-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e6e1ebc6bdd128dd4c430b
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-05T09:11:44.293569  <8>[   20.168823] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438839_1.5.2.4.1>
    2024-03-05T09:11:44.399133  / # #
    2024-03-05T09:11:44.501338  export SHELL=3D/bin/sh
    2024-03-05T09:11:44.502078  #
    2024-03-05T09:11:44.603385  / # export SHELL=3D/bin/sh. /lava-438839/en=
vironment
    2024-03-05T09:11:44.604115  =

    2024-03-05T09:11:44.705530  / # . /lava-438839/environment/lava-438839/=
bin/lava-test-runner /lava-438839/1
    2024-03-05T09:11:44.706704  =

    2024-03-05T09:11:44.725122  / # /lava-438839/bin/lava-test-runner /lava=
-438839/1
    2024-03-05T09:11:44.769330  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e6e1ebc6bdd128dd4c430f
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-05T09:11:46.878334  /lava-438839/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e6e1ebc6bdd128dd4c4311
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-05T09:11:47.936683  /lava-438839/1/../bin/lava-test-case
    2024-03-05T09:11:47.937121  <8>[   23.774741] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-05T09:11:47.937399  /lava-438839/1/../bin/lava-test-case
    2024-03-05T09:11:47.937621  <8>[   23.791823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-03-05T09:11:47.937836  /lava-438839/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e6e1ecc6bdd128dd4c4316
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-05T09:11:49.013405  /lava-438839/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e6e1ecc6bdd128dd4c4317
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-05T09:11:49.016733  <8>[   24.887924] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-05T09:11:50.075700  /lava-438839/1/../bin/lava-test-case
    2024-03-05T09:11:50.076184  <8>[   25.909462] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-05T09:11:50.076495  /lava-438839/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65e6e1eec6bdd128dd4c4365

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-04-v6.8-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-04-v6.8-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e6e1eec6bdd128dd4c436c
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-05T09:11:53.786940  / # #
    2024-03-05T09:11:53.889085  export SHELL=3D/bin/sh
    2024-03-05T09:11:53.889790  #
    2024-03-05T09:11:53.991345  / # export SHELL=3D/bin/sh. /lava-438842/en=
vironment
    2024-03-05T09:11:53.992048  =

    2024-03-05T09:11:54.093571  / # . /lava-438842/environment/lava-438842/=
bin/lava-test-runner /lava-438842/1
    2024-03-05T09:11:54.094796  =

    2024-03-05T09:11:54.114271  / # /lava-438842/bin/lava-test-runner /lava=
-438842/1
    2024-03-05T09:11:54.167341  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-05T09:11:54.167763  + <8>[   20.975346] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 438842_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e6e1eec6bdd128dd4c437f
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-05T09:11:56.602467  /lava-438842/1/../bin/lava-test-case
    2024-03-05T09:11:56.602924  <8>[   23.397543] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-05T09:11:56.603212  /lava-438842/1/../bin/lava-test-case   =

 =20

