Return-Path: <linux-renesas-soc+bounces-2178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F608448A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 21:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38DED28C577
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 20:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465F23F8F9;
	Wed, 31 Jan 2024 20:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="23uKqfk1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2893FB1E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 20:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732340; cv=none; b=Wt0HqUvLrYFRb9eeHiLz/8VTcq2Usf5U228LxVeHnXfy6D8+XR1hdAM3LxnqkFDskFNrv81TMx5fVG0eU04Wwcp3WneluadNE3tDNoQJn9v0IYDyk8z0X6UUccXBKC6DAMhR0qvGu3fTNQBZDT7om+nI799nSyNvLEu3tsbGlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732340; c=relaxed/simple;
	bh=h8adrivRiRfP9h/YA3CgRy/DOhcj0V8nVT1XEb4MK/w=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nc7bD3KX2JmDyNFZEskBNhKypzSzFySRWMz8sgeGwgXkcykYGrMXX87vE3NSMp62Luwz+6jIgZEHwNK5mmJ79xeoyTIiekoEeG0vDpS3xdY4L6XkNNMVbgven0QmsNXpKOFBiXGG1pzcBBi43tbMEnipjyVn8zTmmys+4S/d7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=23uKqfk1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-290fb65531eso75209a91.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 12:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706732337; x=1707337137; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xH1VS07EKF3gwSTU+g2zvOx73sacfXQ4BLEWjutryfU=;
        b=23uKqfk1DwX0Ini/OzkQAeXnMYOp92EH3Nu7/4j8m41NnM34RzFp2OxCJKQcSJ11pY
         TEXE+W9M8+JSTUc+kC8h8Jxrnjfd2fjX3ecqcNu0NClyP6MgidMwDJxrUAqn7Jqf/KwC
         kQNH+3/TJvl85OZtjKwettWveXuRLU4TVs3knuMfTLfIjEDh3hryiDdB0vJVWNZkLIo2
         mONpJB4b9LJO5l5zyKmcOE125zN/9dUiEVf4HrrUI2lQGLTTtE0IWW8sf8mxOCV7LCYR
         WWdlmsNEpiU7CmLtNIs0QWW6RawDTKf67/K/pie7x29ActXnYVeB5vxOJu2oO4fc4LOl
         7fSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732337; x=1707337137;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH1VS07EKF3gwSTU+g2zvOx73sacfXQ4BLEWjutryfU=;
        b=ZqRs7mKZsftGB97hB0i28DSN1+/O0UTzQvPG5+YL8Qgb00OvmY8ARBTPl1YQrJpPCB
         7Urd4H+ZoRysON7sbHu5r1MFAfJdPy1pVSzNDqO9rVM+e17geYUg0UHcF9Rrlnp4O4A9
         AastnxYRuMWFBDjoz2COUOEA7QtFUIEnZZ3SRvEXM3iyC9ASUKhBs6fq0oF6wQZvI9SG
         C3tEJCopbWJfWtZI5DLo5veBKZHmZDi4MbiUrRgCEHHBjIeyyzwv87FLkto6QZazLDFB
         6qJr2jdwz8rvZidLRbi3YH6xD+F9Yqw5ZhPGFqKJNle2r1f0eGxuXFLjygUVg67gkZn0
         +YKQ==
X-Gm-Message-State: AOJu0YxNlOoJ53xa5wPvgZm8a0tOkK5Q6L1UhYIxdYfCXslkRhZa9IRV
	AJ5t00jAUvn5f+mazUgy7kNIBitvUvEG9PpBmu36xKZzdn4mzS2vbAd+uMSJBcjwe8JT8tCd1Hb
	g
X-Google-Smtp-Source: AGHT+IF7zOvN3ZK7a6C7pcaKnYQieupatkAQlm6h6FjrjsH4wWL+QeUNFmuCKxXKXxRTnmqsrblTPA==
X-Received: by 2002:a17:90a:ebc9:b0:290:f4d:c9b1 with SMTP id cf9-20020a17090aebc900b002900f4dc9b1mr62583pjb.13.1706732336967;
        Wed, 31 Jan 2024 12:18:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXqN3xhKtHlEWBaboXjKNlIHI/6tHpOuMwDE70L9DtfZ/ZoVjasEQeLtJaW5Y68JGSQakqcmIIKnsldIG4tSznfvJwCZv+DzG0yYQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pb8-20020a17090b3c0800b00295fdf538e1sm774887pjb.12.2024.01.31.12.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 12:18:56 -0800 (PST)
Message-ID: <65baab30.170a0220.2f54d.4c84@mx.google.com>
Date: Wed, 31 Jan 2024 12:18:56 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-01-31-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 50 runs,
 7 regressions (renesas-next-2024-01-31-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 50 runs, 7 regressions (renesas-next-2024-01-31-v6.8=
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
s-next-2024-01-31-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-01-31-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6fc5bb9da080f9f12f2dc13647a695846cb2f8f5 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65ba7a3ed96c6ede5d00a1b3

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ba7a3ed96c6ede5d00a1ba
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-31T16:49:48.878524  / # #
    2024-01-31T16:49:48.980468  export SHELL=3D/bin/sh
    2024-01-31T16:49:48.980796  #
    2024-01-31T16:49:49.081422  / # export SHELL=3D/bin/sh. /lava-424622/en=
vironment
    2024-01-31T16:49:49.082020  =

    2024-01-31T16:49:49.183108  / # . /lava-424622/environment/lava-424622/=
bin/lava-test-runner /lava-424622/1
    2024-01-31T16:49:49.184031  =

    2024-01-31T16:49:49.193342  / # /lava-424622/bin/lava-test-runner /lava=
-424622/1
    2024-01-31T16:49:49.289043  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-31T16:49:49.289428  + cd /lava-424622/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ba7a3ed96c6ede5d00a1be
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-31T16:49:51.503731  /lava-424622/1/../bin/lava-test-case
    2024-01-31T16:49:51.530861  <8>[   26.060670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ba7a3ed96c6ede5d00a1c0
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-31T16:49:52.591614  /lava-424622/1/../bin/lava-test-case
    2024-01-31T16:49:52.618956  <8>[   27.148631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ba7a3ed96c6ede5d00a1c5
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-31T16:49:53.851221  /lava-424622/1/../bin/lava-test-case
    2024-01-31T16:49:53.878892  <8>[   28.408426] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ba7a3ed96c6ede5d00a1c6
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-31T16:49:54.901578  /lava-424622/1/../bin/lava-test-case
    2024-01-31T16:49:54.929462  <8>[   29.458458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65ba7a41d96c6ede5d00a214

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ba7a41d96c6ede5d00a21b
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-31T16:49:48.761451  / # #
    2024-01-31T16:49:48.862768  export SHELL=3D/bin/sh
    2024-01-31T16:49:48.863596  #
    2024-01-31T16:49:48.964697  / # export SHELL=3D/bin/sh. /lava-424626/en=
vironment
    2024-01-31T16:49:48.964997  =

    2024-01-31T16:49:49.065644  / # . /lava-424626/environment/lava-424626/=
bin/lava-test-runner /lava-424626/1
    2024-01-31T16:49:49.066430  =

    2024-01-31T16:49:49.073114  / # /lava-424626/bin/lava-test-runner /lava=
-424626/1
    2024-01-31T16:49:49.171250  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-31T16:49:49.171682  + cd /lava-424626/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ba7a41d96c6ede5d00a22e
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-31T16:49:52.101142  /lava-424626/1/../bin/lava-test-case
    2024-01-31T16:49:52.128795  <8>[   27.198058] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

