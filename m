Return-Path: <linux-renesas-soc+bounces-3017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03B85C7D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 22:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4671C220E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 21:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD5D1509BF;
	Tue, 20 Feb 2024 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aWf4C4zg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866B1509AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708463804; cv=none; b=lCE9JoRnBELpEm5d2fT9KfIwO86q5Yow0CKw1IWcgluvkSfbIqDNYY4HSv7z9DWuOdFTxYoISrr9/ZwXYcHexhoNDdKwWGnk6gzUFaawYLSjMzdUo9sGQcJBwzZEE0dtU2dYLgHpvXxpYImK3IUehtIjdXOZui2UP+QaQ7baD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708463804; c=relaxed/simple;
	bh=p+s9kkWWuWKl5Rp5sWijQQPiv01Os4Rngc45A2HWBLY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=o8pMkUKzHXXrhJU+I37Mm9VeTkXy8AnO6C4ULa9BSWjf7JhB+ftiCuDuku1kGCP8/TjQyr7Aa41NC6SlA5ZBfRXrorQxzazgaQflFh+DTNTB/tfWhjkIslMSypuiQlESOXFDIPTY8K33BGDbDdZfsO/YyBenTSw7fXwaP02DVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=aWf4C4zg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso5017791b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 13:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708463802; x=1709068602; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sN0fUsdLA0BIXZOm1aVPCgI7vwXUMGB++3JQXRKObvo=;
        b=aWf4C4zgKk4iqSid6kBNopg4K/U93cAz0aVabPPNOOhdU+SfWGhl+vZuqc5ItrYIt1
         BVq5PkhOI7RO0N1jXIzSsiU+5EuCgLIWEURfkNnBx7tQAH1YJ4UWfanm3pl2FHPO+4MM
         2vF8l6qg1DRcGERMAINnONjsc9vTLtCUxhR5Qfyqr+uTHhKDk25Wn7aiILm0ZPkw5cSa
         tanhLHTWjOFL+Y4hwqfENl6BiPu12QE6Kyqw3nEQrNPSNUBjTbujfVzIi1kDfnUbzWaj
         yhBDS6mNDLbCfz8hkx4+1zxCSoX2lVPj8ZAK4lxJBLjP55SUTN7UhZQA6+odR6+GPnCo
         aRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708463802; x=1709068602;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sN0fUsdLA0BIXZOm1aVPCgI7vwXUMGB++3JQXRKObvo=;
        b=iS3bDXxoUgE76O8ZpSSVLYWJsRrZBCFTLYbP0YTbzuVh5BzTPEErtGKz36U7NQVGxV
         rB7bEu7hTUSCwgcZyv03U8vPf/cflebhlvqpcYT6MeAMqzRP/9AGBoA2hxqxngON7JFa
         TYf6+jkOZocojr9E5/dU4KmzKtWlABVpwEhEjoMty3eQ2iRhp7Zs95SZaJlxAgp+aB7V
         pLMiCpdc6FOSi20xnqsMQDMRLxNxM1EKzSIuxDuBb1neyzjKOk+lVv/oRcRDRAe5swLx
         H9N45gSLVpNu07SvmpT7OItEwpikKSmnROnkx6ALzFDMXFvSxgZGy9sODhlni9TiZj2a
         agmA==
X-Gm-Message-State: AOJu0YwQx5wW7gUrQvzKl8r8jff7kgVZD68NE9U/UG4q/LS71WcyIPqC
	rHmljvVocQfTHCXcZAeVIX0fg9wgENkXDHAsUQjk5fkGQMuvAr02U6wJ4zIQ1D+5kWOTRA8CB2l
	dmbw=
X-Google-Smtp-Source: AGHT+IGtNNzo//A2xN4LH9HY64D8pqxEXtvzk68k9Z74gWk3Kq1ucgMXJ2uzzns7gNH3B55wf6lKqg==
X-Received: by 2002:a05:6a21:151b:b0:1a0:6eb4:76e1 with SMTP id nq27-20020a056a21151b00b001a06eb476e1mr16150924pzb.4.1708463801697;
        Tue, 20 Feb 2024 13:16:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n30-20020a634d5e000000b005d7994a08dcsm7118352pgl.36.2024.02.20.13.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 13:16:41 -0800 (PST)
Message-ID: <65d516b9.630a0220.a0eba.6d89@mx.google.com>
Date: Tue, 20 Feb 2024 13:16:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2024-02-20-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 53 runs,
 8 regressions (renesas-next-2024-02-20-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 53 runs, 8 regressions (renesas-next-2024-02-20-v6.8=
-rc1)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-20-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-20-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0c096fb42ae57ad9733eb6c0e0ba8b1d856ddfc3 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4e5b004368210716370d2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4e5b004368210716370db
        failing since 263 days (last pass: renesas-next-2023-03-06-v6.3-rc1=
, first fail: renesas-next-2023-06-02-v6.4-rc1)

    2024-02-20T17:47:05.152409  + set +x
    2024-02-20T17:47:05.152607  [   13.512985] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026160_1.5.2.3.1>
    2024-02-20T17:47:05.260348  / # #
    2024-02-20T17:47:05.361613  export SHELL=3D/bin/sh
    2024-02-20T17:47:05.362089  #
    2024-02-20T17:47:05.462897  / # export SHELL=3D/bin/sh. /lava-1026160/e=
nvironment
    2024-02-20T17:47:05.463363  =

    2024-02-20T17:47:05.564231  / # . /lava-1026160/environment/lava-102616=
0/bin/lava-test-runner /lava-1026160/1
    2024-02-20T17:47:05.564859  =

    2024-02-20T17:47:05.568360  / # /lava-1026160/bin/lava-test-runner /lav=
a-1026160/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d4e5317a9e9505e763707b

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4e5317a9e9505e7637082
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:44:52.242273  / # #
    2024-02-20T17:44:52.342975  export SHELL=3D/bin/sh
    2024-02-20T17:44:52.343201  #
    2024-02-20T17:44:52.443960  / # export SHELL=3D/bin/sh. /lava-432769/en=
vironment
    2024-02-20T17:44:52.444285  =

    2024-02-20T17:44:52.545392  / # . /lava-432769/environment/lava-432769/=
bin/lava-test-runner /lava-432769/1
    2024-02-20T17:44:52.546639  =

    2024-02-20T17:44:52.557426  / # /lava-432769/bin/lava-test-runner /lava=
-432769/1
    2024-02-20T17:44:52.650633  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T17:44:52.651057  + cd /lava-432769/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d4e5317a9e9505e7637086
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:44:54.867519  /lava-432769/1/../bin/lava-test-case
    2024-02-20T17:44:54.894777  <8>[   26.053173] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d4e5317a9e9505e7637088
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:44:55.954092  /lava-432769/1/../bin/lava-test-case
    2024-02-20T17:44:55.981851  <8>[   27.140952] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4e5317a9e9505e763708d
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:44:57.214757  /lava-432769/1/../bin/lava-test-case
    2024-02-20T17:44:57.240615  <8>[   28.399490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d4e5317a9e9505e763708e
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:44:58.264315  /lava-432769/1/../bin/lava-test-case
    2024-02-20T17:44:58.291294  <8>[   29.449840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d4e4f5424701aeb2637065

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4e4f5424701aeb263706c
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:44:07.649641  / # #
    2024-02-20T17:44:07.750757  export SHELL=3D/bin/sh
    2024-02-20T17:44:07.751011  #
    2024-02-20T17:44:07.851705  / # export SHELL=3D/bin/sh. /lava-432772/en=
vironment
    2024-02-20T17:44:07.851977  =

    2024-02-20T17:44:07.952720  / # . /lava-432772/environment/lava-432772/=
bin/lava-test-runner /lava-432772/1
    2024-02-20T17:44:07.953277  =

    2024-02-20T17:44:07.962068  / # /lava-432772/bin/lava-test-runner /lava=
-432772/1
    2024-02-20T17:44:08.058660  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T17:44:08.058829  + cd /lava-432772/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4e4f5424701aeb263707f
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:44:10.990214  /lava-432772/1/../bin/lava-test-case
    2024-02-20T17:44:11.017134  <8>[   27.043250] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

