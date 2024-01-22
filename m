Return-Path: <linux-renesas-soc+bounces-1638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC0836485
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65B511C2283A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A243986C;
	Mon, 22 Jan 2024 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="y+Z5dJ9l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A83CF74
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705930606; cv=none; b=Mp0v3tV40jfUMRvAublGh7TdihwTxNeJwCEsndkmwIepAsowFGA2wwEVVxYr718IFxoY2UiwYPyICgJqb+8ReH0jLY/RssjTOYzDmj70tD1bLljclxVw+QOCnroCwFZhA+C098BOb/0OhdDBmhkWooLl+/OL23DKJ2y66FgM8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705930606; c=relaxed/simple;
	bh=ZUlyAsRFyJgJ74R1g7ysbgmvIUDZ9KvNW2dtsi0WuI8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=MhP2QmpZwz6u1tTOOOE+Co7qURY1qozMAP7N/zQXF1Ms32Zr0CY+cXjLb5j4+2TjI+26FwUqTMbm4mPyUZOdiqnTaiyRTIJ4Y82RdIWLTwQj0XENY+3uEWbynoCx0J0MVSUs2H66cqjHJnN27RDraFS/Z6scJj7Gv1ziMMkHTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=y+Z5dJ9l; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d6ff29293dso16958085ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705930604; x=1706535404; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztd3JQBFCCDYyaaNv4pQOJpZJEED1NdvyPnH0iXFO18=;
        b=y+Z5dJ9lE0KnYmcVsC9Y4ZzbW2v/YfYZM7p/a/8unCYmUQtnCW0Cfg3lFs6MITbeDp
         HtYRaO9THMG57r5FARBAde6zP4NanqE9yHrdj2sEQAJ56ew6hLBaLxUD2Np5atPpy/uj
         vxgcxC9RG0DKfWuvOjR/wOFHkfKGAcGWfGV2Q9GdPkP9OAB2zHTAAUClBQrFA/E6JRJv
         vhaqA5ZrwCPlgyo1MVmtqaOzK8sj4L9zFthIpKCwwH35Y0YqC4/mzRYj2s6kD921B56g
         8JsQK65YbKNfjZug541wRrnI1+qg2cKgKvz509u+21ZX2WoPf8LHFSLrnaO3M6Fzkzdv
         0KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705930604; x=1706535404;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ztd3JQBFCCDYyaaNv4pQOJpZJEED1NdvyPnH0iXFO18=;
        b=SlluTbNLlE77O9+v1Fs7TUfn/QozVg4+90VSQ48EjUEuZpUfw98wKflkyt4TYpIgfB
         WC2HqqDsGJkpf6zgnqFxATxLtnwrkHrY3jpwOfv572k1SNa9ncpBRC9+rO5ezw8qvzU7
         JEW70zqEeU0P8dGSt1RUDy9Rzx3GFnSGtQopmWKHxjQChjYy9mlUkQ/0i2eQqbjr6xfV
         46Fl0AA1xIfCVCGLjlSci2MHO5oO85lf9kUgOAWYdmWorgXcP5mp3OarIC4Y/AMEN8Rs
         Dbe/eRT2fNHud1Y8vTv1B7180rieQUAJ2WC6wuKeLyCaXFlfUT8n235kQbWhm78Z42zD
         xOLw==
X-Gm-Message-State: AOJu0YyfGSWbAZZkb0GePFrkLok8hJbE4+JpxKB8gkE2ady4AtC3/B5S
	Hz+xMS2ZfFu4cuT1kVvgEA/kMinhTFT4Yhxim51y8sQTVcnK8Z4Ma3Jw2MLGJ0kSHh3AaSuyqKd
	0JIk=
X-Google-Smtp-Source: AGHT+IEW6O7ZHMXaX5s9EYhjfzKbiefxOjedBA61fAqFFXWh/VcfuVUVIYVOLCAx9QgNfiFzj2odwA==
X-Received: by 2002:a17:902:82cb:b0:1d6:96b:5de with SMTP id u11-20020a17090282cb00b001d6096b05demr2101592plz.51.1705930604281;
        Mon, 22 Jan 2024 05:36:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902bc4a00b001d714a1530bsm6096835plz.176.2024.01.22.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:36:43 -0800 (PST)
Message-ID: <65ae6f6b.170a0220.4b86f.5071@mx.google.com>
Date: Mon, 22 Jan 2024 05:36:43 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-01-22-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 54 runs,
 8 regressions (renesas-devel-2024-01-22-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 54 runs, 8 regressions (renesas-devel-2024-01-22-v=
6.8-rc1)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
beaglebone-black       | arm   | lab-cip     | gcc-10   | multi_v7_defconfi=
g | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-01-22-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-22-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a70319e919d665138916eb65e32b00ffdae66671 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
beaglebone-black       | arm   | lab-cip     | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/65ae4422161249aeef52a3f8

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65ae4422161249ae=
ef52a3fd
        new failure (last pass: renesas-devel-2024-01-08-v6.7)
        1 lines

    2024-01-22T10:31:23.912368  / # =

    2024-01-22T10:31:23.921379  =

    2024-01-22T10:31:24.026516  / # #
    2024-01-22T10:31:24.033336  #
    2024-01-22T10:31:24.151207  / # export SHELL=3D/bin/sh
    2024-01-22T10:31:24.160841  export SHELL=3D/bin/sh
    2024-01-22T10:31:24.262625  / # . /lava-1080943/environment
    2024-01-22T10:31:24.273095  . /lava-1080943/environment
    2024-01-22T10:31:24.375012  / # /lava-1080943/bin/lava-test-runner /lav=
a-1080943/0
    2024-01-22T10:31:24.385006  /lava-1080943/bin/lava-test-runner /lava-10=
80943/0 =

    ... (9 line(s) more)  =

 =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 5          =


  Details:     https://kernelci.org/test/plan/id/65ae3ef368eb0dca4852a40b

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ae3ef368eb0dca4852a412
        new failure (last pass: renesas-devel-2024-01-08-v6.7)

    2024-01-22T10:09:27.584043  / # #
    2024-01-22T10:09:27.686217  export SHELL=3D/bin/sh
    2024-01-22T10:09:27.686926  #
    2024-01-22T10:09:27.788268  / # export SHELL=3D/bin/sh. /lava-420334/en=
vironment
    2024-01-22T10:09:27.788975  =

    2024-01-22T10:09:27.890397  / # . /lava-420334/environment/lava-420334/=
bin/lava-test-runner /lava-420334/1
    2024-01-22T10:09:27.891507  =

    2024-01-22T10:09:27.911309  / # /lava-420334/bin/lava-test-runner /lava=
-420334/1
    2024-01-22T10:09:27.999144  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T10:09:27.999573  + cd /lava-420334/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ae3ef368eb0dca4852a416
        new failure (last pass: renesas-devel-2024-01-08-v6.7)

    2024-01-22T10:09:30.208846  /lava-420334/1/../bin/lava-test-case
    2024-01-22T10:09:30.237985  <8>[   25.997322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ae3ef368eb0dca4852a418
        new failure (last pass: renesas-devel-2024-01-08-v6.7)

    2024-01-22T10:09:31.297579  /lava-420334/1/../bin/lava-test-case
    2024-01-22T10:09:31.325206  <8>[   27.085156] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ae3ef368eb0dca4852a41d
        new failure (last pass: renesas-devel-2024-01-08-v6.7)

    2024-01-22T10:09:32.556242  /lava-420334/1/../bin/lava-test-case
    2024-01-22T10:09:32.585466  <8>[   28.344689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ae3ef368eb0dca4852a41e
        new failure (last pass: renesas-devel-2024-01-08-v6.7)

    2024-01-22T10:09:33.606928  /lava-420334/1/../bin/lava-test-case
    2024-01-22T10:09:33.635283  <8>[   29.394545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 2          =


  Details:     https://kernelci.org/test/plan/id/65ae3ecbf247cd68f952a3f4

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ae3ecbf247cd68f952a3fb
        new failure (last pass: renesas-devel-2024-01-08-v6.7)

    2024-01-22T10:08:55.479574  / # #
    2024-01-22T10:08:55.581067  export SHELL=3D/bin/sh
    2024-01-22T10:08:55.581629  #
    2024-01-22T10:08:55.682738  / # export SHELL=3D/bin/sh. /lava-420331/en=
vironment
    2024-01-22T10:08:55.683337  =

    2024-01-22T10:08:55.784403  / # . /lava-420331/environment/lava-420331/=
bin/lava-test-runner /lava-420331/1
    2024-01-22T10:08:55.785359  =

    2024-01-22T10:08:55.791725  / # /lava-420331/bin/lava-test-runner /lava=
-420331/1
    2024-01-22T10:08:55.854706  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T10:08:55.889608  + cd /lava-420331/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ae3ecbf247cd68f952a40e
        new failure (last pass: renesas-devel-2024-01-08-v6.7)

    2024-01-22T10:08:58.821613  /lava-420331/1/../bin/lava-test-case
    2024-01-22T10:08:58.848468  <8>[   27.023472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

