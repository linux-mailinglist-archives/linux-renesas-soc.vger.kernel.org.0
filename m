Return-Path: <linux-renesas-soc+bounces-3067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004085EEB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 02:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D116B22F6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 01:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEE412B83;
	Thu, 22 Feb 2024 01:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PtDVK3QF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964091428E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 01:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708565817; cv=none; b=fUSmMqiUfDitn3u0WDcOJ00x+1g0Mpbgu3B7xPTmlAn11xP2aSSPhn/6gH1yji9wrkvhWZJaIh0BwdlqTMFeLNZlPaS2OAol2+D+FzCpP51QHByrJrcXJB3dE/xmrllhS8boNf7VWu98ZF/WjiItoS0oe1TKao6zJhwlzTcbw4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708565817; c=relaxed/simple;
	bh=sYCgsTX/9ZoWhwbGvNyY5RBRROAK24A384EFygbDzMA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=N5FFwAe3MJ1h1jzTFUiKLJqN92kGUKRRSt7rFXTm0DlxF8uF1NvfFbFzjfM8zNQ9l/Uxdh5Bk2mQvJcnpjV9atza4Pk6XVfO7vJYIPvGqtRqC3hDj9QTMZZtMwzU4/c7yOuCn/kIhgUL6UgG1ByDaDYDNszA3v9Apnj28YUnVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PtDVK3QF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e3ffafa708so4527781b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 17:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708565814; x=1709170614; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDNGnoJRTImsADFUDUnezZWGooHupu5vDFsln8zaMfM=;
        b=PtDVK3QFoNIfTWQ0GznTXxSKpTzUvyTTxhpVnvgMnmhuXLYKcNjfKdtPZB+Mnyztqy
         hvDiKG8h8rO0FHsiE1i+ioDy8ngDY1FRORwLNpWuS2I6/07RN5dvVSnwwW6uDyeH8mPv
         YcEtgcQARPgnh2wZV+iZTN+UnoyC4nJ7xwpA/KrKPttk5Rmz7XWbaFpqfnXnLBlrL+pP
         a36On0OiY5vU0558VPPzppDsylabnc08QhrxWG9xoAgQfVIKLrv3gR+7JZRAWTrF76iT
         +p4iTTWe2Y2bvdZYz2vD3a5h5D2sPPyCKP/dQdi+hPBApXk2Q0Z00cLtMdeUfSN0riYs
         CjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708565814; x=1709170614;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDNGnoJRTImsADFUDUnezZWGooHupu5vDFsln8zaMfM=;
        b=BDA7uILy84XBcXTCDhUa35a7WSNW51iMN6A+rufoOlz30+K7N+TC6mZ0XA6uGkNmdc
         Jctqf+k40cAJEmEV0aq0svlrb2NzWHgZLGj3DhD7dhPyw+qVIJmBuSs+4nQiZAmiD36y
         wRgCny9bed0V/aINkA1pQ/NVCv11XFUkMmHMRodBiBLqcsHJxEhOpEFl4K7TvgaV9u4C
         P8U/l79/4u1EarS7QSvUSoC2di6MYFgOIDYZaoGbBPigNsnwnQn+Y8br/QfTm3amOhi2
         9KYa74GXxGR3UcXdcVU/eJlrt2s4iJrQNDTz1u3L+HSNyO6lgUgOGxywX7RQFVoZYzZW
         kAew==
X-Gm-Message-State: AOJu0Yzp/ihiWBMm0m2RV0nuquouJuwQ0YqEIQ6mKUVYV8lSDAaCYGmJ
	gGbE0jr4cb+kryMEFM91gUsayj2JOx49i0VuknvLLbTZ4W8pxi/zefJDDdGEDFpjUI24Y5lN64T
	cB2E=
X-Google-Smtp-Source: AGHT+IGbtEEzNLcoG6A3cJ5sYIBd4ClTOH547/FVaFUHlKe2ufQZZTG2LtlGCmPbq2s8A11huaSWww==
X-Received: by 2002:a62:cdc5:0:b0:6e4:8df7:d52e with SMTP id o188-20020a62cdc5000000b006e48df7d52emr2874095pfg.18.1708565814166;
        Wed, 21 Feb 2024 17:36:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y27-20020aa79e1b000000b006e13ce6f4d8sm79770pfq.72.2024.02.21.17.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 17:36:53 -0800 (PST)
Message-ID: <65d6a535.a70a0220.47460.0419@mx.google.com>
Date: Wed, 21 Feb 2024 17:36:53 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-21-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 57 runs,
 10 regressions (renesas-devel-2024-02-21-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 57 runs, 10 regressions (renesas-devel-2024-02-21-=
v6.8-rc5)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx53-qsrb               | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =

rk3399-roc-pc            | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-21-v6.8-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-21-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8d8825af79e738be6f93a55cfabb93ccfea3a2b8 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx53-qsrb               | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d6743b53bdfc8e11637059

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d6743c53bdfc8e11637062
        failing since 387 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2024-02-21T22:07:36.164073  + set +x
    2024-02-21T22:07:36.164204  [   13.506711] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026913_1.5.2.3.1>
    2024-02-21T22:07:36.271049  / # #
    2024-02-21T22:07:36.372150  export SHELL=3D/bin/sh
    2024-02-21T22:07:36.372648  #
    2024-02-21T22:07:36.473378  / # export SHELL=3D/bin/sh. /lava-1026913/e=
nvironment
    2024-02-21T22:07:36.473936  =

    2024-02-21T22:07:36.574833  / # . /lava-1026913/environment/lava-102691=
3/bin/lava-test-runner /lava-1026913/1
    2024-02-21T22:07:36.575377  =

    2024-02-21T22:07:36.578458  / # /lava-1026913/bin/lava-test-runner /lav=
a-1026913/1 =

    ... (13 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65d673d753bdfc8e11637043

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d673d753bdfc8e11637=
044
        new failure (last pass: renesas-devel-2024-02-20-v6.8-rc5) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =


  Details:     https://kernelci.org/test/plan/id/65d673c433dd23a3ad63708b

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d673c433dd23a3ad637092
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-21T22:05:28.728084  <8>[   20.167881] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 433462_1.5.2.4.1>
    2024-02-21T22:05:28.830319  / # #
    2024-02-21T22:05:28.932306  export SHELL=3D/bin/sh
    2024-02-21T22:05:28.933064  #
    2024-02-21T22:05:29.034484  / # export SHELL=3D/bin/sh. /lava-433462/en=
vironment
    2024-02-21T22:05:29.035191  =

    2024-02-21T22:05:29.136629  / # . /lava-433462/environment/lava-433462/=
bin/lava-test-runner /lava-433462/1
    2024-02-21T22:05:29.137871  =

    2024-02-21T22:05:29.143579  / # /lava-433462/bin/lava-test-runner /lava=
-433462/1
    2024-02-21T22:05:29.200610  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d673c433dd23a3ad637096
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-21T22:05:31.307440  /lava-433462/1/../bin/lava-test-case
    2024-02-21T22:05:31.307889  <8>[   22.735794] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-21T22:05:31.308214  /lava-433462/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d673c433dd23a3ad637098
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-21T22:05:32.365919  /lava-433462/1/../bin/lava-test-case
    2024-02-21T22:05:32.366387  <8>[   23.774624] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-21T22:05:32.366720  /lava-433462/1/../bin/lava-test-case
    2024-02-21T22:05:32.367001  <8>[   23.791782] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d673c433dd23a3ad63709d
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-21T22:05:33.442243  /lava-433462/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d673c433dd23a3ad63709e
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-21T22:05:33.445572  <8>[   24.888155] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-21T22:05:34.504512  /lava-433462/1/../bin/lava-test-case
    2024-02-21T22:05:34.504961  <8>[   25.909601] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-21T22:05:34.505244  /lava-433462/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/65d673b033dd23a3ad637012

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d673b033dd23a3ad637019
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-21T22:05:25.338791  / # #
    2024-02-21T22:05:25.440855  export SHELL=3D/bin/sh
    2024-02-21T22:05:25.441803  #
    2024-02-21T22:05:25.543287  / # export SHELL=3D/bin/sh. /lava-433459/en=
vironment
    2024-02-21T22:05:25.544073  =

    2024-02-21T22:05:25.645404  / # . /lava-433459/environment/lava-433459/=
bin/lava-test-runner /lava-433459/1
    2024-02-21T22:05:25.646710  =

    2024-02-21T22:05:25.650671  / # /lava-433459/bin/lava-test-runner /lava=
-433459/1
    2024-02-21T22:05:25.719820  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T22:05:25.720251  + <8>[   20.872057] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433459_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d673b033dd23a3ad63702c
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-21T22:05:28.157874  /lava-433459/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
rk3399-roc-pc            | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65d6896af9333b7ee2637033

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d6896af9333b7ee2637=
034
        failing since 16 days (last pass: renesas-devel-2024-01-31-v6.8-rc2=
, first fail: renesas-devel-2024-02-05-v6.8-rc3) =

 =20

