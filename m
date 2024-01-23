Return-Path: <linux-renesas-soc+bounces-1737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61497839988
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 20:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D756B294C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 19:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBEB8003A;
	Tue, 23 Jan 2024 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oaWVTX7m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A081207
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706037906; cv=none; b=PGrZujwA385y0ym+3UQgi9icke8qPQlj0fDPvjpawXYrFtCPwkrYXDEZ4TlgahWHhutleCZA+jBNdNPGJ4HywrW4BVUMr9ovgQHByYSsuUNh2zHu/5MI0fcyw59mmxIEUUriUj2itbQyxaJ7BoiD25cXwUXicxnCF0RITZBaKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706037906; c=relaxed/simple;
	bh=JKyTygTHBu7tYwcE4V8skNvGQoSJcWwAbBBq5SeU+pg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AQTgOmrE0GPBYtXOT7I/a7FZsTKE4AfBw56bc88e3hJVLD1ikslTvJIIA0a4yM3rX/buFnn60dovqc2hZLIkJocymLWMH/YPJ23+YZuSDcTkiV6q6FzYS+sKFakfcbtrXCLYAwn0BlTVfJ4rfurz0vHrBYDcor8GcAEsXI1l6i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oaWVTX7m; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d730b6943bso13004795ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 11:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706037903; x=1706642703; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PmleK6+jOgIuGuZ59nzed7iHfIMcmJgKyFOp8i5amb4=;
        b=oaWVTX7mMDfNesP3SvEFhxkhs/tK64UUVIb5wI8IDhLc5kY7lfmpIt9x5h/1m5d67x
         gKE9WKUejfBwC/qXVvy8O08lM6bdSs4aaDM3u4mLvDMllnY3K0Jqih0/LTcg2VVNRaGW
         W8BbU1kotnT6VyzwQ9WphP28Ck/fIJVCP88tqLoyXGG+IIiNGprTYNYVQubgLczorXDI
         1QE88uD5ntBHXp5zO4sRTWQBzomLhaOMhs3NTB+LOzVvZ8sopjxaeiw3kIDZe/MYBNeD
         7djkDyhMh93+Flt3RlufcVA5A69n3+/Vj2QPysxYgbgXTiz1e5XRUrI5eCHOZUdcR+6R
         +6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706037903; x=1706642703;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmleK6+jOgIuGuZ59nzed7iHfIMcmJgKyFOp8i5amb4=;
        b=e97+gKicWkvhYFjz52uYUp5XYk4+fRPCBoThXdQTN9EZFYJ7mpm1wY34czuQuS9LOY
         4FZHKZ+9tG10Ls55AxeLL/mrWtqq5cvl8ALt0oJg/8XdLru1YWEGB47vUdVbcC8kc5bn
         ZkXfJIc000UqFMr1yi2zablEbYv0UYMLXJEirr1XEBrMNnVjz5QZ2wRaJusDmMIJXGkT
         oowwKYNiB1qr4B7zDWVvuul4hDkELIHIOdsv0sOaiGO1kDOosmF6dnrmZllmMkdtyJQW
         +LPi9eD/Vb5+lm4eWY+VRCOi4fIC7UiVPjFcdE7RcWye1nY1eGcfU2RNX86mkkGpVJYV
         cZ5w==
X-Gm-Message-State: AOJu0YwOPsr3HnW1cgFQ3gdvjmZxPPdyIt7GHgJN/enhbMwRL7zGB5U0
	csB/+pdpISeWdyDDs+sVjnrJlttiDBJRLyS4HMrpBPZhoD7lNvKiKAExaLgWHyajZKVwOB5mOo9
	Gszk=
X-Google-Smtp-Source: AGHT+IFwwZfeA+UWMBxHslXF6bVWu+DZsLVe1ewf3uEK6IXPlefEJCbY5Wg6ush6o7P+Hp11nKHRgA==
X-Received: by 2002:a17:902:ed13:b0:1d7:2279:15e9 with SMTP id b19-20020a170902ed1300b001d7227915e9mr3136984pld.122.1706037903438;
        Tue, 23 Jan 2024 11:25:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902744200b001d6f584ee1esm9151078plt.34.2024.01.23.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 11:25:03 -0800 (PST)
Message-ID: <65b0128f.170a0220.424dc.0a43@mx.google.com>
Date: Tue, 23 Jan 2024 11:25:03 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-01-23-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 54 runs,
 8 regressions (renesas-devel-2024-01-23-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 54 runs, 8 regressions (renesas-devel-2024-01-23-v=
6.8-rc1)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
    | regressions
-----------------------+-------+---------------+----------+----------------=
----+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
    | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
    | 2          =

odroid-xu3             | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-01-23-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-23-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      05f5ab22e2ee3974e366c09d59419933c49f7a14 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | regressions
-----------------------+-------+---------------+----------+----------------=
----+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
    | 5          =


  Details:     https://kernelci.org/test/plan/id/65afe1be98affa443252a401

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65afe1be98affa443252a408
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-23T15:56:13.626187  / # #
    2024-01-23T15:56:13.728270  export SHELL=3D/bin/sh
    2024-01-23T15:56:13.728591  #
    2024-01-23T15:56:13.829460  / # export SHELL=3D/bin/sh. /lava-421073/en=
vironment
    2024-01-23T15:56:13.830261  =

    2024-01-23T15:56:13.931623  / # . /lava-421073/environment/lava-421073/=
bin/lava-test-runner /lava-421073/1
    2024-01-23T15:56:13.932874  =

    2024-01-23T15:56:13.937514  / # /lava-421073/bin/lava-test-runner /lava=
-421073/1
    2024-01-23T15:56:14.001702  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-23T15:56:14.035617  + cd /lava-421073/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65afe1be98affa443252a40c
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-23T15:56:16.252046  /lava-421073/1/../bin/lava-test-case
    2024-01-23T15:56:16.279491  <8>[   26.070378] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
afe1be98affa443252a40e
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-23T15:56:17.340574  /lava-421073/1/../bin/lava-test-case
    2024-01-23T15:56:17.367137  <8>[   27.158503] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65afe1be98affa443252a413
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-23T15:56:18.599503  /lava-421073/1/../bin/lava-test-case
    2024-01-23T15:56:18.627842  <8>[   28.418251] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65afe1be98affa443252a414
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-23T15:56:19.651184  /lava-421073/1/../bin/lava-test-case
    2024-01-23T15:56:19.677280  <8>[   29.468310] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
    | regressions
-----------------------+-------+---------------+----------+----------------=
----+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
    | 2          =


  Details:     https://kernelci.org/test/plan/id/65afe1d3979b9ee76b52a424

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65afe1d3979b9ee76b52a42b
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-23T15:56:36.110738  / # #
    2024-01-23T15:56:36.212763  export SHELL=3D/bin/sh
    2024-01-23T15:56:36.213381  #
    2024-01-23T15:56:36.314510  / # export SHELL=3D/bin/sh. /lava-421075/en=
vironment
    2024-01-23T15:56:36.315269  =

    2024-01-23T15:56:36.416482  / # . /lava-421075/environment/lava-421075/=
bin/lava-test-runner /lava-421075/1
    2024-01-23T15:56:36.417176  =

    2024-01-23T15:56:36.421877  / # /lava-421075/bin/lava-test-runner /lava=
-421075/1
    2024-01-23T15:56:36.486071  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-23T15:56:36.519730  + cd /lava-421075/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65afe1d3979b9ee76b52a43e
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-23T15:56:39.449144  /lava-421075/1/../bin/lava-test-case
    2024-01-23T15:56:39.479267  <8>[   27.056008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
    | regressions
-----------------------+-------+---------------+----------+----------------=
----+------------
odroid-xu3             | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/65afdff70f679bda3252a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odr=
oid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odr=
oid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65afdff70f679bda3252a=
3f2
        new failure (last pass: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

