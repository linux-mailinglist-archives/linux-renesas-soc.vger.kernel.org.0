Return-Path: <linux-renesas-soc+bounces-3681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E03728780B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 14:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45872283CEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F0541215;
	Mon, 11 Mar 2024 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="S4eTgaBp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6944122C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710164059; cv=none; b=aBJCgInX4AP8SdKbcGbFVF1ahLEdQI5pmUrLMr4gdQosceSM/msy2JiQB3djX2sS5Vz0lrfvC1APFHaz4NzsQqhpH0KOkeiuLOQQ2O79XNRgit95yZOPO0I7p358pGeyGYqX0G88IWBZ+l/BLk0T9PVFKNp3XtuHI7PqQBx97Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710164059; c=relaxed/simple;
	bh=EXY1vLDWN+3jJq+btz+VAGUwARTgQg1h1epd+SJvDUg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ULt+w345iEQa/7Gndi7sX2lSh73+bq5Fsd6lA8IS9ULVCzmmubfRMnRvmi9hYK3tREuJVIh25ANOTEMb+ye5eGj8QEt7TMKAyWZMiW9ZIVbKbt3YEGrdMx8VNx31JeqH2H82bFgq2oUdCahMT3h6UQTkDBwDzq19a/x0xFEbyyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=S4eTgaBp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dd878da011so8486285ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710164057; x=1710768857; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OJci+pHIkxoqQrqqdtIo/WNbNJh2SMd8GAfm7Yp21YE=;
        b=S4eTgaBpwtiWyHifGyLHyZZOZXnxLEbfqlmScrPqDqsQxmLF6Xh8+3SWpUqDBzS6/b
         eNoLaXe/9ONYNHr6F9TuhAaKkKC+uWNgMLBznJqlpe3PSTgyvhrpJAod7AFW2uaK/kMv
         RmQCazSNpuVjr1DkF+RG5hOder1rdyJV5rXwbMp+hJrCfvP0fOd85aBa9OQFy0VtwM8x
         ZawyixF1+5l0c9EsN0UjWun2zjUEtDFIdfY6oE0+nIrZlFpjourf7K90Dv3IQ2BOzURS
         sKqnRdvJr29wlQtdd9B7ZQBehNKJcy/mcrjH+qxk9/3vpqaQ4O9TIRsEEi2hHFTKXKBk
         fGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710164057; x=1710768857;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJci+pHIkxoqQrqqdtIo/WNbNJh2SMd8GAfm7Yp21YE=;
        b=J2N+9i/AsAwxuUhNknlviFnsx++PWeSJgUzL6eUenEL6uJzgk3C+O1Xcu/7t1+vdCC
         P5moQgvAvewPg9Uw1AR1NQ6Ri6l1xQk1u3UVrW5MQvXmCjCnlCByuO/WixNhbyNGfrWw
         b2rnSM8JPstXqducwzX8UQL43EmAVHXhERNGU6zCSNaIFo6mK0CZQxjFNrccuBuS0PNS
         poAh9zjjZzP51mwPygR8LwzYVHe8prHJ4r8AjBIBnTmirDO0VNQypMAAeP/fvrac2CSU
         JhMSsUmeFOfNs7bgfRTl6ngW+qrrUYcUwR4PN3u5ThjhP7678E/SLXc6zZ24q+NXhrvo
         Quew==
X-Gm-Message-State: AOJu0YyI+3+TcNIM6CZKv6gUtA16DuB3DR9aFgZHy6M1GPViQjMHo0+T
	gSF+IapCRLP+nxB5awI9vjdYUWBfzeTlV3gUoXOaBp6FBXKYxTL2iEnuF43fBbGQuPakk4x24gi
	ii8s=
X-Google-Smtp-Source: AGHT+IEGN2oBt0OyuZWaFmAl/vI/6kULbBK92QvFvoiqad/EotxkcNkz6aHmSiac8P93Iy4/KvfoUg==
X-Received: by 2002:a17:903:1206:b0:1dd:76f0:4455 with SMTP id l6-20020a170903120600b001dd76f04455mr7070161plh.49.1710164056893;
        Mon, 11 Mar 2024 06:34:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jy8-20020a17090342c800b001dd5806eff3sm4754781plb.306.2024.03.11.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:34:16 -0700 (PDT)
Message-ID: <65ef0858.170a0220.9734b.af81@mx.google.com>
Date: Mon, 11 Mar 2024 06:34:16 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-03-11-v6.8
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 65 runs,
 7 regressions (renesas-devel-2024-03-11-v6.8)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 65 runs, 7 regressions (renesas-devel-2024-03-11-v=
6.8)

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
sas-devel-2024-03-11-v6.8/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-11-v6.8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e60eab20a8f0eebadd576a31d449c6b503c4013 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65eed79cf46d21e6b54c431d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65eed79cf46d21e6b54c4324
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-11T10:05:59.666563  / ##
    2024-03-11T10:05:59.768755  export SHELL=3D/bin/sh
    2024-03-11T10:05:59.769514   #
    2024-03-11T10:05:59.870906  / # export SHELL=3D/bin/sh. /lava-441609/en=
vironment
    2024-03-11T10:05:59.871812  =

    2024-03-11T10:05:59.973194  / # . /lava-441609/environment/lava-441609/=
bin/lava-test-runner /lava-441609/1
    2024-03-11T10:05:59.974380  =

    2024-03-11T10:05:59.994084  / # /lava-441609/bin/lava-test-runner /lava=
-441609/1
    2024-03-11T10:06:00.036911  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-11T10:06:00.037334  + <8>[   20.533737] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 441609_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65eed79cf46d21e6b54c4328
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-11T10:06:02.110654  /lava-441609/1/../bin/lava-test-case
    2024-03-11T10:06:02.145516  <8>[   22.643874] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-11T10:06:02.145682  /lava-441609/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
eed79cf46d21e6b54c432a
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-11T10:06:03.204555  /lava-441609/1/../bin/lava-test-case
    2024-03-11T10:06:03.204980  <8>[   23.682658] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-11T10:06:03.205309  /lava-441609/1/../bin/lava-test-case
    2024-03-11T10:06:03.205538  <8>[   23.699763] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-03-11T10:06:03.205752  /lava-441609/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65eed79cf46d21e6b54c432f
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-11T10:06:04.280607  /lava-441609/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65eed79cf46d21e6b54c4330
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-11T10:06:04.283851  <8>[   24.795850] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-11T10:06:05.342848  /lava-441609/1/../bin/lava-test-case
    2024-03-11T10:06:05.343402  <8>[   25.817495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-11T10:06:05.343711  /lava-441609/1/../bin/lava-test-case
    2024-03-11T10:06:05.344021  <8>[   25.834992] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-11T10:06:05.344256  /lava-441609/1/../bin/lava-test-case
    2024-03-11T10:06:05.344466  <8>[   25.854395] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-03-11T10:06:05.344675  /lava-441609/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65eed75fc4104530bb4c4319

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65eed75fc4104530bb4c4320
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-11T10:04:58.578094  / # #
    2024-03-11T10:04:58.680327  export SHELL=3D/bin/sh
    2024-03-11T10:04:58.681082  #
    2024-03-11T10:04:58.782527  / # export SHELL=3D/bin/sh. /lava-441607/en=
vironment
    2024-03-11T10:04:58.783232  =

    2024-03-11T10:04:58.884486  / # . /lava-441607/environment/lava-441607/=
bin/lava-test-runner /lava-441607/1
    2024-03-11T10:04:58.885624  =

    2024-03-11T10:04:58.889691  / # /lava-441607/bin/lava-test-runner /lava=
-441607/1
    2024-03-11T10:04:58.958769  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-11T10:04:58.959216  + <8>[   20.880080] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 441607_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65eed75fc4104530bb4c4333
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-11T10:05:01.400346  /lava-441607/1/../bin/lava-test-case
    2024-03-11T10:05:01.400804  <8>[   23.309075] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-11T10:05:01.401099  /lava-441607/1/../bin/lava-test-case   =

 =20

