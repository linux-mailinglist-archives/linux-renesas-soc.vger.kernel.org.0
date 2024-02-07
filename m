Return-Path: <linux-renesas-soc+bounces-2412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 717DF84C2FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 04:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96D181C21522
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 03:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF825FC0C;
	Wed,  7 Feb 2024 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NwfKOdNl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CF2FC0A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 03:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707275959; cv=none; b=kFoIZgAUIOX3NKBytrUAFXE3GVImUgsj5JKU22HXP3GyWCtqVpe9Y539uSD9D+GSf59N6OukHCMDUMzsVs2mfpmHiUApUEDHpOqRkWvg6OxXbSBtPpt5BFH/eC2nVVQLJfQKePJW3AxJQ8F1heYSnDzVxdZ0wEsZL47KwteQ/Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707275959; c=relaxed/simple;
	bh=McrEvjhlZNVLmwaiQbCVT7XqAQ8K/qroJC0QJtXbFSk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=V3h8ZjwngyyKHidEvVCGkw8HRwZx3SkXJVNkqmPRJ1BAP2spJfDMHzZCu49cqIcpSsrX0DnmZAorLoDZO1m1D8x3DT2IRqns6Da/yRZsNroKUiC8HoMOQIwI0xHJVNcMbDkg9Gu2oWDW+OAreaTcV/t8UKLANRBkInOzfeHVHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NwfKOdNl; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso159292276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 19:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707275956; x=1707880756; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=veAhZkokALFr04d0PMtzCBdEAiz5fOw8RMQfdEr2610=;
        b=NwfKOdNlKy60EFMsmySOsEmifrwaUub2wHp49u4IVnmZEJ0yA2oR0j/q1pWS3Q8GaY
         R0A/4/4jl2/vKQX/XXSAdYA7bqdo37nymJo/zdwE8qQs15smTaVfBgquPq8IJsB9JNs/
         RvhtcleDzuXSsdM9QroLgOWo2GNJXj9UL1rTw2DnBWK0xjmNe9b2E7Ry1SpV8QR3+RO2
         UqvdsCAJdbjp33OboiCrOMPNkxAPYzr4Q9+w/SMDSZ2Wzwz8HKZEDvbSQ/Y02VGDUW6g
         1yXsH5w4nVNy2ngnCJHwsJmD/fAOLJw68X0G+3qvgV0AC/Nxq0Sgnuw8TXEpGfMHfMnV
         kMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707275956; x=1707880756;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veAhZkokALFr04d0PMtzCBdEAiz5fOw8RMQfdEr2610=;
        b=YeIuiNUOAtq0nF5yNNQlk53Ds8kaoCIc4QXE2+/j1p4tFNjrPMd1DedxN2f1APGm9K
         D0cSu+BSdmp5Ucii8exjaetqYads4YcxKEuwIXQXIMaDoIe1daKZ+Z9D1FZWJGeJ+sKh
         CoL270QxW1L/ZJyPEM7ckP5PPVc1t9+9yNlPiuWD6YuWQTZoy0nQIjsp4bW8WJ1zuLZa
         /hlglIJqvn9jUlq2D5uLm4uU6qQjJNS812H9bufRhTuvFdRrNDXykPig+MLX9eEkLs2j
         xe4RF6cC9nO2ofwmUIeTfj/4Po71trgRG3vvVeMtEZ5uTeEutGAwFRsum0Jo2OHORLdN
         d7UA==
X-Gm-Message-State: AOJu0YxMAEzP/0zy31kVN9I9UR+AE87COpSX64Mr0ljvLhSb3eYPZLPS
	nHsvGoVxiIG20Mam129T5xK5TP7abUjVlQ7qCVol6PyikSHcRORUVwYGaNxz8yhTcIok0lGoLva
	Z
X-Google-Smtp-Source: AGHT+IGx0V0j7Ni4ihfggbhAMQNi33rYxROVTuNJ/BoUlsMgqqIuUT+uYyyjlVVtoH1Orpxe6logbQ==
X-Received: by 2002:a25:8010:0:b0:dc7:32ea:c89f with SMTP id m16-20020a258010000000b00dc732eac89fmr515010ybk.15.1707275956125;
        Tue, 06 Feb 2024 19:19:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUc0aUNzcB8yitJSO4b7uiJSvARC92LQPD2KW1szhLr9c9ojQ4hTPhFBnbyYmk9K7bSahHCy+VEPtkaDxrBzNRANZuqJAkWjXSvTg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n19-20020aa78a53000000b006dd810cdd91sm269575pfa.88.2024.02.06.19.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 19:19:15 -0800 (PST)
Message-ID: <65c2f6b3.a70a0220.b08c.0ef6@mx.google.com>
Date: Tue, 06 Feb 2024 19:19:15 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2024-02-06-v6.8-rc1
Subject: renesas/next baseline: 50 runs,
 7 regressions (renesas-next-2024-02-06-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 50 runs, 7 regressions (renesas-next-2024-02-06-v6.8=
-rc1)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-06-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-06-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      91487349a9c3f75c983229f900978df1d14e7ff2 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2c5caf5dc33d8ae8e1ea3

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c2c5caf5dc33d8ae8e1ea6
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-06T23:50:16.236897  / # #
    2024-02-06T23:50:16.338998  export SHELL=3D/bin/sh
    2024-02-06T23:50:16.339723  #
    2024-02-06T23:50:16.441221  / # export SHELL=3D/bin/sh. /lava-426523/en=
vironment
    2024-02-06T23:50:16.441977  =

    2024-02-06T23:50:16.543265  / # . /lava-426523/environment/lava-426523/=
bin/lava-test-runner /lava-426523/1
    2024-02-06T23:50:16.544413  =

    2024-02-06T23:50:16.548740  / # /lava-426523/bin/lava-test-runner /lava=
-426523/1
    2024-02-06T23:50:16.612909  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-06T23:50:16.646822  + cd /lava-426523/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c2c5caf5dc33d8ae8e1eaa
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-06T23:50:18.863415  /lava-426523/1/../bin/lava-test-case
    2024-02-06T23:50:18.891730  <8>[   26.181136] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c2c5caf5dc33d8ae8e1eac
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-06T23:50:19.952770  /lava-426523/1/../bin/lava-test-case
    2024-02-06T23:50:19.978476  <8>[   27.269174] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c2c5caf5dc33d8ae8e1eb1
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-06T23:50:21.212206  /lava-426523/1/../bin/lava-test-case
    2024-02-06T23:50:21.239360  <8>[   28.529105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c2c5caf5dc33d8ae8e1eb2
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-06T23:50:22.261666  /lava-426523/1/../bin/lava-test-case
    2024-02-06T23:50:22.289735  <8>[   29.579291] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2c5c87ff683703c8e1eb7

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c2c5c87ff683703c8e1eba
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-06T23:50:13.764646  / # #
    2024-02-06T23:50:13.866755  export SHELL=3D/bin/sh
    2024-02-06T23:50:13.867477  #
    2024-02-06T23:50:13.968985  / # export SHELL=3D/bin/sh. /lava-426518/en=
vironment
    2024-02-06T23:50:13.969714  =

    2024-02-06T23:50:14.071097  / # . /lava-426518/environment/lava-426518/=
bin/lava-test-runner /lava-426518/1
    2024-02-06T23:50:14.072241  =

    2024-02-06T23:50:14.076836  / # /lava-426518/bin/lava-test-runner /lava=
-426518/1
    2024-02-06T23:50:14.140758  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-06T23:50:14.180528  + cd /lava-426518/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c2c5c87ff683703c8e1ecd
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-06T23:50:17.107325  /lava-426518/1/../bin/lava-test-case
    2024-02-06T23:50:17.135416  <8>[   27.149260] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

