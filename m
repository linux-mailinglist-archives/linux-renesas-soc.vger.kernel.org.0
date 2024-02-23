Return-Path: <linux-renesas-soc+bounces-3138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F68861BD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 19:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 425781C20BB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 18:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A602679E1;
	Fri, 23 Feb 2024 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nTlKBIlO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8012B7B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 18:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708713394; cv=none; b=Ob4sJAXSDnqPxwyqj8IVDURhkB1gUJBHtTTsWvyzDCYF4TdJyhMr71PwJssWyd4r6l8LOVZ62KdMXqwtuQqJaqYvk49EJYo6d/RzSFN/nTJqz9Na1Re1vALHFC+a5BNQYSjAFuyApJ5jQ+Vzny4zR9XBr9IO3EsOjHMlb+3JMGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708713394; c=relaxed/simple;
	bh=d8Pq7fp6pgXztP4jmaeH2JwZoHi2qdYOHL5dDSEm0aw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=GBpo7kBJxB+DF5DP291yqnkO7meORka66X+a1Axhl1xZqwdHo8a454MkbgPzTxwOr8K9o/Wc5CGM2Ue4U/w/0odJuEeBuS7cp7Bi7M4+YwfoJBZQyOzF8OMjXgob1A/nsvMcnqfD0cUDO4nXGu28JkpSlzG0zEh9icDC7jd8Tco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nTlKBIlO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-299372abcfeso913982a91.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 10:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708713392; x=1709318192; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MRs6pb+pLBFxUX0hVbOd9O7Im24uFnGPpd2Tdy3ypLY=;
        b=nTlKBIlOtRB2RYGbR2tXgK13BL9/Iwdl9bGErWqXkbyo+28CZ0Qr00CmJrejcNvzHN
         s0GEuVbAW23qVeXadqp13AbV+vHAgduM4+py0Y37HtQqiix+HBT64j6lmCeqOU81GYLt
         8jgwyM0a064WVFwVnfpMBUz3pvmCmT1SZJXtoH8kiSKm2Cjs99LkHvRliJVv97Aa7jqg
         IBbgFVn4SPxBUYjhQVY1O9HcjiPqzcsJde19vze77GP3UuFRShXzRiXtuEfFVgKUvop3
         dtBO/+masGC5EpoE7UPfKRsA59daa00viVBQrcbiH123IoZVqpHdNwfmu5c0MzzSLKPb
         kDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708713392; x=1709318192;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRs6pb+pLBFxUX0hVbOd9O7Im24uFnGPpd2Tdy3ypLY=;
        b=l30X4izXHEKMemwkHf32W4OFSlP4Kvx+rDev9Kzn6zRMVPuRU1P2qc0f62ylbqonXG
         7l8/FQTSo/9Cw463vsZOWWx4mVQeKV3h7+eBvDzkTM1sk+JrXK7o/fqruAULLtCeCiAQ
         uXqDw6ky6d3FYqrhxf/hlf8njEmKF3d/GWWbBTdqLoWovw1gpEJTM36DGQxV87cV1qC4
         mm2SJzRDwVNsKd1aMct7dqN25Em2JjBAJyiRQbFcdrRQvhLS9/8eIggE1VC1EmBX5Jd2
         IAH3FJDYDzmwkpjUMskpxXIATgeSaB2O7cUL+2uTuvUixvePKpvrz8sP8c/YEjTIdL0s
         v4Ew==
X-Gm-Message-State: AOJu0Yx1dvYYgyyse72aniE9gfc2WSn6akz1Xd35f8n1hyM3GUel3Rd3
	c1kGRygHvUcX67y2peHXYDrfQDRg5VggaTcuVZAL8fcH225yLvk2hj3xHrCF4wAGKX4s8EKc6fb
	jGNE=
X-Google-Smtp-Source: AGHT+IFXo3KXtuiAz1/EwTjIFZJDyWKew54tFnEfjpYEFXWp2CSj6+ZrBehgrt+dfGzAKyxPnXXe4A==
X-Received: by 2002:a17:90b:1e4e:b0:299:4ae4:7a17 with SMTP id pi14-20020a17090b1e4e00b002994ae47a17mr815361pjb.15.1708713391793;
        Fri, 23 Feb 2024 10:36:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c15-20020a17090ab28f00b0029a7a2fbb25sm1756687pjr.57.2024.02.23.10.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 10:36:31 -0800 (PST)
Message-ID: <65d8e5af.170a0220.59a9f.79bb@mx.google.com>
Date: Fri, 23 Feb 2024 10:36:31 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-02-23-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 51 runs,
 8 regressions (renesas-next-2024-02-23-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 51 runs, 8 regressions (renesas-next-2024-02-23-v6.8=
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
s-next-2024-02-23-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-23-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      06a019816e5194bbabfe2df324371f6c962ff7f1 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8b1f49b88e69345637029

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d8b1f49b88e6934563702e
        failing since 266 days (last pass: renesas-next-2023-03-06-v6.3-rc1=
, first fail: renesas-next-2023-06-02-v6.4-rc1)

    2024-02-23T14:55:28.007434  + set +x
    2024-02-23T14:55:28.007594  [   13.463720] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1027985_1.5.2.3.1>
    2024-02-23T14:55:28.115348  / # #
    2024-02-23T14:55:28.216579  export SHELL=3D/bin/sh
    2024-02-23T14:55:28.216986  #
    2024-02-23T14:55:28.317811  / # export SHELL=3D/bin/sh. /lava-1027985/e=
nvironment
    2024-02-23T14:55:28.318337  =

    2024-02-23T14:55:28.419183  / # . /lava-1027985/environment/lava-102798=
5/bin/lava-test-runner /lava-1027985/1
    2024-02-23T14:55:28.419724  =

    2024-02-23T14:55:28.423250  / # /lava-1027985/bin/lava-test-runner /lav=
a-1027985/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d8b43f778ffbc2bd63703a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d8b43f778ffbc2bd637041
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-23T15:05:03.868441  / # #
    2024-02-23T15:05:03.970700  export SHELL=3D/bin/sh
    2024-02-23T15:05:03.971402  #
    2024-02-23T15:05:04.072789  / # export SHELL=3D/bin/sh. /lava-434207/en=
vironment
    2024-02-23T15:05:04.073485  =

    2024-02-23T15:05:04.174951  / # . /lava-434207/environment/lava-434207/=
bin/lava-test-runner /lava-434207/1
    2024-02-23T15:05:04.175904  =

    2024-02-23T15:05:04.194602  / # /lava-434207/bin/lava-test-runner /lava=
-434207/1
    2024-02-23T15:05:04.282489  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-23T15:05:04.282917  + cd /lava-434207/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d8b43f778ffbc2bd637045
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-23T15:05:06.494182  /lava-434207/1/../bin/lava-test-case
    2024-02-23T15:05:06.522281  <8>[   26.105193] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d8b43f778ffbc2bd637047
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-23T15:05:07.581976  /lava-434207/1/../bin/lava-test-case
    2024-02-23T15:05:07.609527  <8>[   27.192773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d8b43f778ffbc2bd63704c
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-23T15:05:08.840508  /lava-434207/1/../bin/lava-test-case
    2024-02-23T15:05:08.869622  <8>[   28.452180] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d8b43f778ffbc2bd63704d
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-23T15:05:09.891567  /lava-434207/1/../bin/lava-test-case
    2024-02-23T15:05:09.919697  <8>[   29.502117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d8b42af9cbbd797263706b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d8b42bf9cbbd7972637072
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-23T15:04:54.513021  / # #
    2024-02-23T15:04:54.615241  export SHELL=3D/bin/sh
    2024-02-23T15:04:54.616070  #
    2024-02-23T15:04:54.717594  / # export SHELL=3D/bin/sh. /lava-434204/en=
vironment
    2024-02-23T15:04:54.718379  =

    2024-02-23T15:04:54.819801  / # . /lava-434204/environment/lava-434204/=
bin/lava-test-runner /lava-434204/1
    2024-02-23T15:04:54.821006  =

    2024-02-23T15:04:54.840043  / # /lava-434204/bin/lava-test-runner /lava=
-434204/1
    2024-02-23T15:04:54.927926  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-23T15:04:54.928358  + cd /lava-434204/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d8b42bf9cbbd7972637085
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-23T15:04:57.855234  /lava-434204/1/../bin/lava-test-case
    2024-02-23T15:04:57.882240  <8>[   27.236966] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

