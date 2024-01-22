Return-Path: <linux-renesas-soc+bounces-1639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2AE83649A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75623B26F79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7F93D0A0;
	Mon, 22 Jan 2024 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GS+6HAT4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7C3CF7C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705930937; cv=none; b=FA+uqXibyvWqk9zeuLkUG1THK2Ygu1l+lU7qIVDrVbQYbgAHjpsfjKuS9mUOSaaweagAIk9VZenscufReJm1oRuAaj0DreP0HJvBl6gmekbqsFbX1W/QciIzLhsxjnDIq5hqlK8g7Atm02v1qlniu4cEhl9DGt3OsLaYccYGetw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705930937; c=relaxed/simple;
	bh=VQaOMJ/IAP9V8TKwzjMQ9r2Qhc4PtWndxEScrqyS93U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=n/5ukPtttkjBmaWLljrS4IzcwQ7zM5pL8BtLnMbww2TzyK0ZweWsrBbg3POEflIU//ajTTog+b5nI+E0oZ4hCzTZiY19BscXTpniQU0uawsxQTPXYNDsiIHSkM+sRqVq/prFDK5oiiGFx89DG970HiOeVh85DsARH6deZi2k014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=GS+6HAT4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d746856d85so3921205ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 05:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705930934; x=1706535734; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwz6MQ/X4VN0mouNxvXP1q1WMLYZns74bI3MAwwf3sw=;
        b=GS+6HAT4Phltbr7+izRUID9GlqTZy7PmADSy8f5ncYoIgozUiKHZElBV6qz3IVza6Y
         szQ00ISSjAmEblHn2XTK9jhSKI/jPXTuQqkdwULGP1LCeVpNm/pmsW+fUO0Or2TC4C8Q
         Xw8f1aT0JMZb+lMwCbsw+qNvoSniKySNI4C8kaD1sQn672jf48DSuAfkgwXuzxssEykc
         y0pORAUy2WV/uho3mfqzbfx2WNM66rar5BuTPHv9f11spQ9/cZgsGq/Xm9eVZP/m5WAq
         Z4NOtXSg2rXXu/CDP21/PaW60WDDTFLP1/9qViIx6HJLq5hRWMnNFLtuMuosqXTD3v4o
         IYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705930934; x=1706535734;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uwz6MQ/X4VN0mouNxvXP1q1WMLYZns74bI3MAwwf3sw=;
        b=JIlOGK7TxkYLo1UB43BGpsFMukApnS5fcm/HzYlsfh90fLt9AEJR65ulkq+rxq8bbQ
         9CJfQPUJDTgEYNAFCQBomss290+HoWmMRb0cezGpnPAQsi2u7ahdlBx0gAob5NSA7k5R
         glxWC1cC8VJ4zcNCRzBMpF5xB/sZecQxiSsyx3fI85+qEkuZSHjaZrKaxABwtxtLvMeJ
         LEKy4lAVMx2bvttiDH1pUrHELf14tJ38IWX6DUWgVWDGHQPk8zbRO0+/V/gANAdnycY8
         cMKZcGpuE7q5fpLl7kBC7o+15ZZoO8ivh5pr4F4QKA64EZ6sm3IXnSRpCRTlFHAua5vh
         iHPA==
X-Gm-Message-State: AOJu0Yx2z+3ZUMclNlr3y06m2K++bdfHaS4oXRN/zVRqDUhZUtkJfthV
	Avi8w2S7sFEMxH7Qry8EDNuXTH95YqSiEkuCp5F09ocCrF7Zo8pGH04iYf4Qwtf3gn6F3Bvg50L
	TKDA=
X-Google-Smtp-Source: AGHT+IF0TuR4Xt51CekjERzhVXwN7MOd2SVFqQFQHpL+FAAkuMN3FpmgD6ELMw1U2bdD5lKMbVT9dw==
X-Received: by 2002:a17:902:f7c3:b0:1d4:e237:2c3f with SMTP id h3-20020a170902f7c300b001d4e2372c3fmr1784378plw.28.1705930934488;
        Mon, 22 Jan 2024 05:42:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jd1-20020a170903260100b001d76019e822sm786113plb.20.2024.01.22.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:42:14 -0800 (PST)
Message-ID: <65ae70b6.170a0220.abf63.2472@mx.google.com>
Date: Mon, 22 Jan 2024 05:42:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2024-01-22-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 51 runs,
 8 regressions (renesas-next-2024-01-22-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 51 runs, 8 regressions (renesas-next-2024-01-22-v6.8=
-rc1)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx6dl-riotboard       | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-01-22-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-01-22-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6251f25da3c72088c750c8f5ce28c3a23d69c1a7 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx6dl-riotboard       | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ae3fc398e63a84b852a504

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ae3fc398e63a84b852a50d
        new failure (last pass: renesas-next-2023-11-27-v6.7-rc1)

    2024-01-22T10:13:05.960104  + set[   15.103607] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1021347_1.5.2.3.1>
    2024-01-22T10:13:05.960249   +x
    2024-01-22T10:13:06.065383  / # #
    2024-01-22T10:13:06.166424  export SHELL=3D/bin/sh
    2024-01-22T10:13:06.166844  #
    2024-01-22T10:13:06.267562  / # export SHELL=3D/bin/sh. /lava-1021347/e=
nvironment
    2024-01-22T10:13:06.267956  =

    2024-01-22T10:13:06.368870  / # . /lava-1021347/environment/lava-102134=
7/bin/lava-test-runner /lava-1021347/1
    2024-01-22T10:13:06.369482  =

    2024-01-22T10:13:06.372638  / # /lava-1021347/bin/lava-test-runner /lav=
a-1021347/1 =

    ... (12 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65ae3dc791bbc0c8ea52a3f1

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ae3dc791bbc0c8ea52a3f8
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1)

    2024-01-22T10:04:29.049290  / # #
    2024-01-22T10:04:29.151007  export SHELL=3D/bin/sh
    2024-01-22T10:04:29.151300  #
    2024-01-22T10:04:29.251935  / # export SHELL=3D/bin/sh. /lava-420328/en=
vironment
    2024-01-22T10:04:29.252823  =

    2024-01-22T10:04:29.354006  / # . /lava-420328/environment/lava-420328/=
bin/lava-test-runner /lava-420328/1
    2024-01-22T10:04:29.354422  =

    2024-01-22T10:04:29.360897  / # /lava-420328/bin/lava-test-runner /lava=
-420328/1
    2024-01-22T10:04:29.458897  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T10:04:29.459070  + cd /lava-420328/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ae3dc791bbc0c8ea52a3fc
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1)

    2024-01-22T10:04:31.673373  /lava-420328/1/../bin/lava-test-case
    2024-01-22T10:04:31.700483  <8>[   26.071540] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ae3dc791bbc0c8ea52a3fe
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1)

    2024-01-22T10:04:32.761876  /lava-420328/1/../bin/lava-test-case
    2024-01-22T10:04:32.787497  <8>[   27.158971] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ae3dc791bbc0c8ea52a403
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1)

    2024-01-22T10:04:34.019881  /lava-420328/1/../bin/lava-test-case
    2024-01-22T10:04:34.046853  <8>[   28.417883] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ae3dc791bbc0c8ea52a404
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1)

    2024-01-22T10:04:35.070334  /lava-420328/1/../bin/lava-test-case
    2024-01-22T10:04:35.096508  <8>[   29.468460] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65ae3ddb1dc4b0531152a41f

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ae3ddb1dc4b0531152a426
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1)

    2024-01-22T10:04:56.353966  / # #
    2024-01-22T10:04:56.455801  export SHELL=3D/bin/sh
    2024-01-22T10:04:56.456236  #
    2024-01-22T10:04:56.557144  / # export SHELL=3D/bin/sh. /lava-420329/en=
vironment
    2024-01-22T10:04:56.557446  =

    2024-01-22T10:04:56.657973  / # . /lava-420329/environment/lava-420329/=
bin/lava-test-runner /lava-420329/1
    2024-01-22T10:04:56.658326  =

    2024-01-22T10:04:56.664481  / # /lava-420329/bin/lava-test-runner /lava=
-420329/1
    2024-01-22T10:04:56.728550  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T10:04:56.762368  + cd /lava-420329/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ae3ddb1dc4b0531152a439
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1)

    2024-01-22T10:04:59.692029  /lava-420329/1/../bin/lava-test-case
    2024-01-22T10:04:59.719936  <8>[   27.092899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

