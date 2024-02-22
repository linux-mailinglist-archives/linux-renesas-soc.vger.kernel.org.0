Return-Path: <linux-renesas-soc+bounces-3110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6085FD9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 17:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B308B2852E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 16:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23FD1482F7;
	Thu, 22 Feb 2024 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HF8FX7Sl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9360B99
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708618008; cv=none; b=lVgFx+4Byda6dWB3HUuzg1nTRNmQ2lfrq51u1QKqk+pGhfC3a7i66kdcjKbSlSy+A+ND+d8MpZ6cTw+ygz8JpWs77699EY8BkjWrpV0yBBmaZytbYSdVH59GVaubMigJefC96hlqz5QkxL7yeL9wWzT0+X0EJqp/uGeFfEpWyvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708618008; c=relaxed/simple;
	bh=1xvTztAXsxrtBqzyifRsyy8irz3CcQe1peYuyzRdeN0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XNjkEGZH69qI7ALgqbFiMji1ntJPhkX9t6X+IzHT4NF4/uQOXbyGfrf09VMdMvByQdwW7QFGJ8PZ75zbf12IiZhv4fALiLscPht7v1rWpQQqbUWkjowYbv0o1atnAqX6MtsbJoWSajbxeWfJcexLAe7Aj+of/sWqApJ7dp5CUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HF8FX7Sl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-299a2456948so3393977a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 08:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708618005; x=1709222805; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MRU+/kSH+oyHhD84YQ6WxrIVUrZxV2tFd6pLAeg1b64=;
        b=HF8FX7SlSiwCacg3yDQDGoJ0beCx6Xa61HPynVFI/UGd2wq3VRFzIHpaVuFp0lZwyj
         IofzOVzEFyNkYdvYnkaSxdLYDZ1r8mg+yRyGQnNdV6y6pY1jGoTMHAmyMS4NGeCgdfNl
         U/w3/0pV8MJnBDC1p/upFDHRLujxoASyu1DWvYpJ9nGJhGPDHVeiDaX8TmUieTWyvVSf
         LKYMvyHJTZ9vfwItcWwAxKB8c02oVukXeVMFpXdvgF76nXAYSDe5ZGe1dk8aOoBlUWEp
         2/OOEw+maqxynyRuwAxgFd5xBlT6tS0NEBqWWVjOj9E+SdOaO22LUNSDKuMKmuXDPte1
         1vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708618005; x=1709222805;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRU+/kSH+oyHhD84YQ6WxrIVUrZxV2tFd6pLAeg1b64=;
        b=XzmIr44rz2Wbm++2ZCDQCVelT1EbkkslAmjIYSbveShqXVvFys7xa4q7eDabIeuS9F
         NfeLZPmhETdW+RKXQvFXfETnfR6O/pBuRaMctzqm6BHc90s7oY6QzlNFtdSkkx0Bg2Y9
         f1ftkLbaRCOGb335EDX0x1+avsUCPdq0TkSndL3PrbsZOSLc9wo+MMNKws2kTXpGEZdF
         sGc4LN0yHw8L85mG76tKuJAxhjeIn2akpozVWgxp+KKCweXGlyPRViWAvxUIECZJoP/h
         T0WEoXd1dba9qNpYoyM7N2kkGI+RifyVbGPHwY8Q60BlFdMSpvSrTIPvtR3Pi1OkN9LR
         cpRg==
X-Gm-Message-State: AOJu0YyMo2JH4YkkcVndiLzTUx6/QPzLm6mNEmQp9EjCcrm7Ep2uTFhb
	MqYc1N9fK4J4gc4EYmYRcP8BhYo3J+mv1Z/u84rB20VqFpTcBD0Jw8GSmncqe3rCA4HMvT7oymC
	E
X-Google-Smtp-Source: AGHT+IEtrZf3tNLHzjfwMbDwkG/yg+a9ugrE+5Nnw726HxJz4mN7FhHQr3CeIH5Za7cc78R2JyYJ1A==
X-Received: by 2002:a17:90a:ca8d:b0:299:4060:3a54 with SMTP id y13-20020a17090aca8d00b0029940603a54mr14255411pjt.1.1708618005492;
        Thu, 22 Feb 2024 08:06:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w4-20020a17090ad60400b00296a23e407csm4258848pju.7.2024.02.22.08.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 08:06:45 -0800 (PST)
Message-ID: <65d77115.170a0220.7a156.f8f4@mx.google.com>
Date: Thu, 22 Feb 2024 08:06:45 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-02-22-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 50 runs,
 8 regressions (renesas-next-2024-02-22-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 50 runs, 8 regressions (renesas-next-2024-02-22-v6.8=
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
s-next-2024-02-22-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-22-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb8362db9d70ae053d6286cece6d60a339a9794c =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d73f9bbea7ae8cc8637036

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d73f9bbea7ae8cc863703b
        failing since 264 days (last pass: renesas-next-2023-03-06-v6.3-rc1=
, first fail: renesas-next-2023-06-02-v6.4-rc1)

    2024-02-22T12:35:18.546438  + set +x
    2024-02-22T12:35:18.546600  [   13.488389] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1027374_1.5.2.3.1>
    2024-02-22T12:35:18.654038  / # #
    2024-02-22T12:35:18.755257  export SHELL=3D/bin/sh
    2024-02-22T12:35:18.755764  #
    2024-02-22T12:35:18.856791  / # export SHELL=3D/bin/sh. /lava-1027374/e=
nvironment
    2024-02-22T12:35:18.857294  =

    2024-02-22T12:35:18.958199  / # . /lava-1027374/environment/lava-102737=
4/bin/lava-test-runner /lava-1027374/1
    2024-02-22T12:35:18.958884  =

    2024-02-22T12:35:18.962315  / # /lava-1027374/bin/lava-test-runner /lav=
a-1027374/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d740462d8927ce766370a0

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d740462d8927ce766370a7
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-22T12:37:59.154479  / # #
    2024-02-22T12:37:59.255827  export SHELL=3D/bin/sh
    2024-02-22T12:37:59.256343  #
    2024-02-22T12:37:59.357231  / # export SHELL=3D/bin/sh. /lava-433800/en=
vironment
    2024-02-22T12:37:59.357572  =

    2024-02-22T12:37:59.458309  / # . /lava-433800/environment/lava-433800/=
bin/lava-test-runner /lava-433800/1
    2024-02-22T12:37:59.459174  =

    2024-02-22T12:37:59.467079  / # /lava-433800/bin/lava-test-runner /lava=
-433800/1
    2024-02-22T12:37:59.562925  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T12:37:59.563114  + cd /lava-433800/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d740462d8927ce766370ab
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-22T12:38:01.775691  /lava-433800/1/../bin/lava-test-case
    2024-02-22T12:38:01.804574  <8>[   26.156000] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d740462d8927ce766370ad
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-22T12:38:02.864346  /lava-433800/1/../bin/lava-test-case
    2024-02-22T12:38:02.892232  <8>[   27.243667] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d740462d8927ce766370b2
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-22T12:38:04.124811  /lava-433800/1/../bin/lava-test-case
    2024-02-22T12:38:04.152740  <8>[   28.504122] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d740462d8927ce766370b3
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-22T12:38:05.174899  /lava-433800/1/../bin/lava-test-case
    2024-02-22T12:38:05.202776  <8>[   29.554471] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d740342d8927ce7663702b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d740342d8927ce76637032
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-22T12:37:41.196329  / # #
    2024-02-22T12:37:41.297154  export SHELL=3D/bin/sh
    2024-02-22T12:37:41.297411  #
    2024-02-22T12:37:41.397876  / # export SHELL=3D/bin/sh. /lava-433802/en=
vironment
    2024-02-22T12:37:41.398320  =

    2024-02-22T12:37:41.498917  / # . /lava-433802/environment/lava-433802/=
bin/lava-test-runner /lava-433802/1
    2024-02-22T12:37:41.499281  =

    2024-02-22T12:37:41.510738  / # /lava-433802/bin/lava-test-runner /lava=
-433802/1
    2024-02-22T12:37:41.603704  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T12:37:41.603843  + cd /lava-433802/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d740342d8927ce76637045
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-22T12:37:44.532850  /lava-433802/1/../bin/lava-test-case
    2024-02-22T12:37:44.560094  <8>[   27.149225] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

