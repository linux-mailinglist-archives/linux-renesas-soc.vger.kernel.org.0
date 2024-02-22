Return-Path: <linux-renesas-soc+bounces-3069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2C285EF0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 03:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B804BB2242A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 02:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87145111B2;
	Thu, 22 Feb 2024 02:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NSRJ1U7d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA89C1427A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708568158; cv=none; b=uUUpqQMyly9shItDFGB22qZ83EkxeLZh1i1ZcvV0uT6UyZ0YqEbhDRQDJlF0n+q9Tbuf9JwAp5GzeqS+oZ6q25ks2WMv0Xwv+c4YV8fBFEk5oo1JkHN1w0iGOmCJ1Ysm8DgdvUjJzUDJliWbcoLXB9xWOg50OytP/dyzI02o0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708568158; c=relaxed/simple;
	bh=uQPa5cw/OEG4O3DNEMVTWJ0VLwVma9QWirouXi7fRT4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=kd+XKNVCaAvoZddFnn/ctMkLehgD59tyB96V/A5MvrFUcMv/WAFiYnQSKxGdJJtdYRK/xgHyriFqireQgfnWCrQ8Z5fb8m8r2+SKFoNipVGlJeem2klIDpiM21m88KiuYFJrmAxnf2OdYuMSZGlpqLEgAxUnuhe+f2+7x69fRqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NSRJ1U7d; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29a430c3057so197123a91.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 18:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708568155; x=1709172955; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zvzGsTdSQE0pg67GYbQusJA7O4OA0kmtcfkhH/s9VtQ=;
        b=NSRJ1U7dCqxWKArcyRHBk0s5G7I3Xh/8okMGB8rIETIN5YP/yPFA6sOxfYoo53/JqD
         ruJafL9HvbwzuxdJXSPyRvNfhF6kLQd2tXkh32DqOdqZFRXc+mW6gD9Uxc70UympncFY
         k5HgU4lVDV9Ht2PLSyI+UxfmcCqQZ/STpB80s9YJB5ongp4dafn1lORA4kEpQuMB2+HJ
         Esq2/qZK9bapz+mkBVPmoVRdFGnpcmecf7bkIjEYy7GVQcmJMNzVJ9tFBEqHF2lPypvu
         uvDvce4W+xZHzyk/ljL6JpzUION2zPe1AJE4f4NmIwU6x65B4uoe5Y/3i656oAqpRAD1
         uZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708568155; x=1709172955;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvzGsTdSQE0pg67GYbQusJA7O4OA0kmtcfkhH/s9VtQ=;
        b=MoC4BwSpzgfEIjtgUAmwBNEFdv72sBvjotweHXqj3s/Wi7hF3yxhxdB58IzekJPQBm
         65F1tZ7EUSLLu/rtVXOBHbRJcgxhr8e04kmEB266kt2LiGG9xTAoR5+hnEoEgAryMXQV
         cJtaQuIdSfxkz8N9fT/XgT0IXTHfZqDd9hEMb2QAbVUNIidxKWMMQNR8xvCc9sxOXap6
         dBmBuZw80qlpCqvtEBdhbZ7DVSjiabztK50VeYVEpwx+kgT8oLohmWBcHGiNxo89GuRH
         FkIi6De3SDHyZ1ur1C29QGQJnxbOA0y48//ApJsumqcZhBdY5ZqYBVqe1YwSCglDjOAV
         BdAA==
X-Gm-Message-State: AOJu0Yxgn/WNK3jYPVp9EnmltXz8YKTMb9egc6GQ2Gx9aSl3w0sF1nY4
	aySziYLP5n9rA4DyfelFYswbX2YCfpQ+EzmVHdnxcwz/7LKdC9Ig0cb/AQlCXI6rKxr6BQiUTME
	Lz4I=
X-Google-Smtp-Source: AGHT+IFpQUkKQvgqOC/HD32AMwVA3pVUmoUNudnUD0Ul1UZh0Xxv/C+C3uFQ/aLyHA+AUzqYCenMZQ==
X-Received: by 2002:a17:90a:1149:b0:299:ef19:1778 with SMTP id d9-20020a17090a114900b00299ef191778mr5492730pje.10.1708568155592;
        Wed, 21 Feb 2024 18:15:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sy6-20020a17090b2d0600b00296f4fc7e60sm2603022pjb.12.2024.02.21.18.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 18:15:55 -0800 (PST)
Message-ID: <65d6ae5b.170a0220.ce5a6.a489@mx.google.com>
Date: Wed, 21 Feb 2024 18:15:55 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-02-21-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 51 runs,
 8 regressions (renesas-next-2024-02-21-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 51 runs, 8 regressions (renesas-next-2024-02-21-v6.8=
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
s-next-2024-02-21-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-21-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8da5df713f13e5bc5dfe15948c042e97e57db5ea =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d67b82054977534a63706a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d67b82054977534a637073
        failing since 264 days (last pass: renesas-next-2023-03-06-v6.3-rc1=
, first fail: renesas-next-2023-06-02-v6.4-rc1)

    2024-02-21T22:38:37.319050  + set +x
    2024-02-21T22:38:37.319194  [   13.496571] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026926_1.5.2.3.1>
    2024-02-21T22:38:37.426596  / # #
    2024-02-21T22:38:37.527798  export SHELL=3D/bin/sh
    2024-02-21T22:38:37.528255  #
    2024-02-21T22:38:37.629073  / # export SHELL=3D/bin/sh. /lava-1026926/e=
nvironment
    2024-02-21T22:38:37.629520  =

    2024-02-21T22:38:37.730304  / # . /lava-1026926/environment/lava-102692=
6/bin/lava-test-runner /lava-1026926/1
    2024-02-21T22:38:37.730913  =

    2024-02-21T22:38:37.733996  / # /lava-1026926/bin/lava-test-runner /lav=
a-1026926/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d67d8af5e17c8f26637014

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d67d8af5e17c8f2663701b
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-21T22:47:06.962703  / # #
    2024-02-21T22:47:07.064844  export SHELL=3D/bin/sh
    2024-02-21T22:47:07.065552  #
    2024-02-21T22:47:07.166850  / # export SHELL=3D/bin/sh. /lava-433490/en=
vironment
    2024-02-21T22:47:07.167565  =

    2024-02-21T22:47:07.268932  / # . /lava-433490/environment/lava-433490/=
bin/lava-test-runner /lava-433490/1
    2024-02-21T22:47:07.270144  =

    2024-02-21T22:47:07.310116  / # /lava-433490/bin/lava-test-runner /lava=
-433490/1
    2024-02-21T22:47:07.338297  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T22:47:07.378117  + cd /lava-433490/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d67d8af5e17c8f2663701f
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-21T22:47:09.590303  /lava-433490/1/../bin/lava-test-case
    2024-02-21T22:47:09.617447  <8>[   26.009118] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d67d8af5e17c8f26637021
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-21T22:47:10.678643  /lava-433490/1/../bin/lava-test-case
    2024-02-21T22:47:10.704207  <8>[   27.096893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d67d8af5e17c8f26637026
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-21T22:47:11.936863  /lava-433490/1/../bin/lava-test-case
    2024-02-21T22:47:11.964063  <8>[   28.356000] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d67d8af5e17c8f26637027
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-21T22:47:12.987366  /lava-433490/1/../bin/lava-test-case
    2024-02-21T22:47:13.014286  <8>[   29.406296] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d67d8c12562ce298637013

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d67d8c12562ce29863701a
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-21T22:47:16.972348  / # #
    2024-02-21T22:47:17.074484  export SHELL=3D/bin/sh
    2024-02-21T22:47:17.075182  #
    2024-02-21T22:47:17.176510  / # export SHELL=3D/bin/sh. /lava-433493/en=
vironment
    2024-02-21T22:47:17.177208  =

    2024-02-21T22:47:17.278624  / # . /lava-433493/environment/lava-433493/=
bin/lava-test-runner /lava-433493/1
    2024-02-21T22:47:17.279615  =

    2024-02-21T22:47:17.284173  / # /lava-433493/bin/lava-test-runner /lava=
-433493/1
    2024-02-21T22:47:17.348368  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T22:47:17.382272  + cd /lava-433493/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d67d8c12562ce29863702d
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-21T22:47:20.311371  /lava-433493/1/../bin/lava-test-case
    2024-02-21T22:47:20.341251  <8>[   27.145892] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

