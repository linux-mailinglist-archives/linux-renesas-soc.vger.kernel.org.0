Return-Path: <linux-renesas-soc+bounces-2415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D70AF84C431
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 05:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49CB31F2734F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 04:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B7D1C2AD;
	Wed,  7 Feb 2024 04:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fXVGxBn1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D912E63
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281329; cv=none; b=IEsS9b2Z0s5E8ShozBkUTcp4ZNRhMMaR2uU70iNF/V9+s7R1yOZ01YEq7BohEMISKcxmJqxz0dUT+1vQEEzKxJuJRWDN6JoVspSq2+LOpAJ8C8mjEobEpgYlhrSxeppSU7en9djLRlCoJQd28D0hVvCuINkjgQJ5kUk1qDgf4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281329; c=relaxed/simple;
	bh=Jq/V2kNXc5qFvRh9drdbsDmsh48W0+vXzn4GePhLQcs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cEeup/eItCNLOCO1yG/WeIGUGBcjOkvLXCi1yUKThRFG36KhnBP4++rrQeuVMn5G4YlNDXfJlPRmK4S4E0nazX0Se11D8vfaYpN/Pxn5mRXYLL55MJ5L7PkZtxztiODIJvcsz9KTXrG4FViJWazubcLyid4jaVseq49x0vpKqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fXVGxBn1; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so192577b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 20:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707281326; x=1707886126; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cEwGUleRl2t6QowrbAsTtwre3LNh8uauzxM75x1nccw=;
        b=fXVGxBn1uJ/fPeG57Pm9t9jphpaOat/DazsuhzhpjLYV8dx8zHVlLbBVUYt7EG94q/
         TOUO20uipxUwyzq/OdA+JYuBdFW6PBjvvq1gAeLbezh2kTTl/R07oW5pNaF73642pjFR
         rZ3ylGoUj00XjI+P1+c+7uZIeNu91FVSz20hvveMaKK9EEDTE4zOxlLNL6DAMyAzPjSZ
         7+ndluYa9zyUncj9jcDgCwoJWw4yBTeOcxbOyJazaN3H4J/1uPcV6qLWvX3wzfki+lyA
         kw6//cBjXPtj3K8xDQd8KP3s514CsVej2Gi6nqhqXw/1oDubqphK3IUxQAI7lW4rcc41
         iVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707281326; x=1707886126;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEwGUleRl2t6QowrbAsTtwre3LNh8uauzxM75x1nccw=;
        b=uSXNyKDtkq4KNYF82ZwYn32JrcK11hySAes4RC/o7ZkkegRkKIXRPvauTrEulrLYHL
         1lSg1CpzVtrrKXUm9NcgkjI0bWd/CvxOGMHOuYJ1HPEpBosTTqJ5qlm1aiUTP7WJVsBc
         11DxC3j0e8MzqxAmxKqcnj9X2NNZ1NSEnU8yu7GTjWzuGAKX+GeKrB604lqNviWB05N8
         dlV3LsmnP665MeQHgTbIeGhauXaP7dVzR8l7EOLyac+5S852y4JlOgfybOo5eajx8YB8
         TjvOacRaBtRdqFnpm6t2Ptr97lDDLGa+K3dadXn7Cs4sYxfmKuNYxH22tdy3uP61scpg
         FbCQ==
X-Gm-Message-State: AOJu0YymBzzwpkwY72OT3KSW5qAYxqWj8iWhpQJCOVi59xRo/ON3a3JP
	y13RejCXkv+toIeiCt0i3CscPo3j360pKy2AkDS9ZArh4opIXI0UBdNu+uYT91ZOqFMNzO6oqiz
	q
X-Google-Smtp-Source: AGHT+IEsSPiqV3MQRZNwk0+qbdRRXHbM+RJQZBfva4ti8DW7Ptosdr192IjTmBV680OgkvBIn0bN0w==
X-Received: by 2002:a05:6808:4192:b0:3bf:dff4:6fa8 with SMTP id dj18-20020a056808419200b003bfdff46fa8mr3919245oib.20.1707281326355;
        Tue, 06 Feb 2024 20:48:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuVlimJkcP9y2/pcmy/zvr5865JR3zIjIk1xV/qLNPWBZvETKS+qQkJuXVb/QRfWqC875pczlU01MnnEkR1UmohRX8yD/glBRvXQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e03927d124sm397647pfb.201.2024.02.06.20.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 20:48:45 -0800 (PST)
Message-ID: <65c30bad.050a0220.84114.12e8@mx.google.com>
Date: Tue, 06 Feb 2024 20:48:45 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-02-06-v6.8-rc3
Subject: renesas/master baseline: 55 runs,
 8 regressions (renesas-devel-2024-02-06-v6.8-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 55 runs, 8 regressions (renesas-devel-2024-02-06-v=
6.8-rc3)

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

rk3399-roc-pc          | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-06-v6.8-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-06-v6.8-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d9725adb75e9a17df52743713a914fb7449ba066 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2da7fcf52eef1a08e1f27

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c2da7fcf52eef1a08e1f2a
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-07T01:18:36.440237  / # #
    2024-02-07T01:18:36.540871  export SHELL=3D/bin/sh
    2024-02-07T01:18:36.541077  #
    2024-02-07T01:18:36.641587  / # export SHELL=3D/bin/sh. /lava-426560/en=
vironment
    2024-02-07T01:18:36.641803  =

    2024-02-07T01:18:36.742309  / # . /lava-426560/environment/lava-426560/=
bin/lava-test-runner /lava-426560/1
    2024-02-07T01:18:36.742673  =

    2024-02-07T01:18:36.754945  / # /lava-426560/bin/lava-test-runner /lava=
-426560/1
    2024-02-07T01:18:36.847174  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T01:18:36.847603  + cd /lava-426560/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c2da7fcf52eef1a08e1f2e
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-07T01:18:39.061653  /lava-426560/1/../bin/lava-test-case
    2024-02-07T01:18:39.087663  <8>[   26.051449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c2da7fcf52eef1a08e1f30
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-07T01:18:40.147937  /lava-426560/1/../bin/lava-test-case
    2024-02-07T01:18:40.174742  <8>[   27.139131] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c2da7fcf52eef1a08e1f35
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-07T01:18:41.407488  /lava-426560/1/../bin/lava-test-case
    2024-02-07T01:18:41.434672  <8>[   28.398416] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c2da7fcf52eef1a08e1f36
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-07T01:18:42.458060  /lava-426560/1/../bin/lava-test-case
    2024-02-07T01:18:42.485213  <8>[   29.448399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2da828c089751488e1e7b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c2da828c089751488e1e7e
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-07T01:18:38.392900  <8>[   23.658298] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 426563_1.5.2.4.1>
    2024-02-07T01:18:38.499653  / # #
    2024-02-07T01:18:38.601211  export SHELL=3D/bin/sh
    2024-02-07T01:18:38.601975  #
    2024-02-07T01:18:38.703295  / # export SHELL=3D/bin/sh. /lava-426563/en=
vironment
    2024-02-07T01:18:38.704017  =

    2024-02-07T01:18:38.805348  / # . /lava-426563/environment/lava-426563/=
bin/lava-test-runner /lava-426563/1
    2024-02-07T01:18:38.806529  =

    2024-02-07T01:18:38.824035  / # /lava-426563/bin/lava-test-runner /lava=
-426563/1
    2024-02-07T01:18:38.913040  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c2da828c089751488e1e91
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-07T01:18:41.843879  /lava-426563/1/../bin/lava-test-case
    2024-02-07T01:18:41.870729  <8>[   27.141508] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
rk3399-roc-pc          | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2dc21b00e5613bc8e1e83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c2dc21b00e5613bc8e1=
e84
        failing since 1 day (last pass: renesas-devel-2024-01-31-v6.8-rc2, =
first fail: renesas-devel-2024-02-05-v6.8-rc3) =

 =20

