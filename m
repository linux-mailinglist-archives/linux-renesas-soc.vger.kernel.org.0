Return-Path: <linux-renesas-soc+bounces-2181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6C8449E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 22:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E34B284C3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 21:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A89C38FB5;
	Wed, 31 Jan 2024 21:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Q+NIsfm2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD8C3B793
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706736067; cv=none; b=MPV16VYfo35LV/vx26d9V37eJGulC/Z3O0AJjfcE544s4FtYcmHODgi3+kRZuuK0YJRQgjxBmvNOswlYEciyF1DP/3GG1fLcMzz5niOwAT8Dchrm/EqE6RcSD36DrmuvV6C+fHLBEZJZh+LIvSE44N+VuN4cnkFxtbzh4V11+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706736067; c=relaxed/simple;
	bh=mY9ZigsQBvKS5h+ABkJy2p5M7EhQrHZxt1Dv2hJyufI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IRkp7HMtAJuzf0OYDyy7zfsXZRn/cKY2Mv32C+iwB2d9EacGaaEgfWIm8jBJJsSJ0Jp0K7fL9MzI2lgeW+CoH47jXYtCtMA7QYPQeb/nhD7Ig0xAFtdR3vrLRoknjeEWO2hkdtJjGAESNkTvav7hPUq9SnZQJI+53G0DFRR07qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Q+NIsfm2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d7881b1843so1801755ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 13:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706736064; x=1707340864; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+QLIfNM3qy3bVk4WStdwHdUyj3FlKLdoYlEZfIxsfqk=;
        b=Q+NIsfm2uvRZzLED6bDpYtGq97R/KbhHf+w9gSif7WNCpNbyYQeNyCJqpG7p+7V/3h
         sfyPlM9maNhWt6wgig6bt8cJ9rjeZ0ps7PSW0t93XhCP943ReM7sjXTjRDdF+IYJunTp
         Qj8w8shaxCIZnFC8lHLn0wsdMXZWbMArhVTJeaACZG5frrSqnCMmjzOYH0OtKyMZ6A8b
         7dD40MIC+fPXnqIqFHUBJnBeKSvUCIA06/p1kV+5GMK61MYJ8p64/agRDuI1u2hp9pqO
         rMzcr0Eta5vSdXr9mu3xQZa9bAor+cjtisQlAOHKURqnav8OtgiyboJMTun8QznkIWtz
         n5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706736064; x=1707340864;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QLIfNM3qy3bVk4WStdwHdUyj3FlKLdoYlEZfIxsfqk=;
        b=qPnVhKFCJFWhq8CMge48C/BjfuLRRJm7r57g2RH2bM63yOfEzO0MiKX+zNA7CZNvG+
         3oWOqhz0h/lNcJ9kVOcPQLaEou2KWgPST1kr39xA9Ihq9EZ+2eDq00nAkLFhePprxvXt
         d7Ff8LwJsoeLvA4UCbApJWLdD9rsntxD7kNYn6XIQ89XWgUWytSeOBjlUu+szeElxO2T
         nJ9Z5WysOZRwjlLhblOoAUGCMcncj3OviqPxhnVImMGl52/wt9bKYlL1dkk8wPxT8LEu
         yEOENA49+Jn4Q2WVV6LcHflht5lFHJN+9cgh+b581g4pnyXDVMHFDNeFBvVeR80Z3SOp
         MIyw==
X-Gm-Message-State: AOJu0YwNT/jen2hdNG6deHbF69DCu7vxij+dIeE8nB/k36XEo1ooT1LG
	zg52gsd8E2AvADVYaZlpKei3p4z3eD7mdVGEiD02oWRN1+kjOMG+vXOlWAi7VUmGEN2waKMUlh9
	B
X-Google-Smtp-Source: AGHT+IFVU38wq8Hdv3q8+EU9Lu/3fkfzV7Dz44RK0J8FmF+M9jYtRnnAPJ+J9KKG/1NlCwqghxSaMw==
X-Received: by 2002:a17:902:ce85:b0:1d8:f968:3b4f with SMTP id f5-20020a170902ce8500b001d8f9683b4fmr3741676plg.24.1706736063963;
        Wed, 31 Jan 2024 13:21:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV4NyjaFOHTsReIxP2D5xRpVoqn5NdCN+FNuWTKXi2JWOglQetqk98NhCl5YDUmL2OByFMAspZ1n4XTdOUmkjYgSCUkKrtg66Ve7g==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902ec8900b001d8fb2591a6sm755679plg.171.2024.01.31.13.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 13:21:03 -0800 (PST)
Message-ID: <65bab9bf.170a0220.d9b59.4871@mx.google.com>
Date: Wed, 31 Jan 2024 13:21:03 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-01-31-v6.8-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 53 runs,
 8 regressions (renesas-devel-2024-01-31-v6.8-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 53 runs, 8 regressions (renesas-devel-2024-01-31-v=
6.8-rc2)

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
sas-devel-2024-01-31-v6.8-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-31-v6.8-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7d7dc8c44825e8fc58f8d9e23b06b9b82183fd67 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
beaglebone-black       | arm   | lab-cip     | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/65ba896373768ef4d300a062

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65ba896473768ef4=
d300a067
        new failure (last pass: renesas-devel-2024-01-23-v6.8-rc1)
        1 lines

    2024-01-31T17:54:22.272917  / # =

    2024-01-31T17:54:22.281913  =

    2024-01-31T17:54:22.387160  / # #
    2024-01-31T17:54:22.393696  #
    2024-01-31T17:54:22.511314  / # export SHELL=3D/bin/sh
    2024-01-31T17:54:22.521583  export SHELL=3D/bin/sh
    2024-01-31T17:54:22.623176  / # . /lava-1085564/environment
    2024-01-31T17:54:22.633188  . /lava-1085564/environment
    2024-01-31T17:54:22.734607  / # /lava-1085564/bin/lava-test-runner /lav=
a-1085564/0
    2024-01-31T17:54:22.745362  /lava-1085564/bin/lava-test-runner /lava-10=
85564/0 =

    ... (9 line(s) more)  =

 =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 5          =


  Details:     https://kernelci.org/test/plan/id/65ba88e1cc6cbb51db00a043

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ba88e1cc6cbb51db00a04a
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-31T17:52:09.235970  / # #
    2024-01-31T17:52:09.338378  export SHELL=3D/bin/sh
    2024-01-31T17:52:09.339141  #
    2024-01-31T17:52:09.440389  / # export SHELL=3D/bin/sh. /lava-424645/en=
vironment
    2024-01-31T17:52:09.441113  =

    2024-01-31T17:52:09.542407  / # . /lava-424645/environment/lava-424645/=
bin/lava-test-runner /lava-424645/1
    2024-01-31T17:52:09.543520  =

    2024-01-31T17:52:09.547280  / # /lava-424645/bin/lava-test-runner /lava=
-424645/1
    2024-01-31T17:52:09.612448  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-31T17:52:09.646371  + cd /lava-424645/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ba88e1cc6cbb51db00a04e
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-31T17:52:11.863386  /lava-424645/1/../bin/lava-test-case
    2024-01-31T17:52:11.890685  <8>[   26.207476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ba88e1cc6cbb51db00a050
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-31T17:52:12.952182  /lava-424645/1/../bin/lava-test-case
    2024-01-31T17:52:12.978707  <8>[   27.295364] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ba88e1cc6cbb51db00a055
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-31T17:52:14.211636  /lava-424645/1/../bin/lava-test-case
    2024-01-31T17:52:14.238347  <8>[   28.554754] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ba88e1cc6cbb51db00a056
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-31T17:52:15.262293  /lava-424645/1/../bin/lava-test-case
    2024-01-31T17:52:15.288168  <8>[   29.604822] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 2          =


  Details:     https://kernelci.org/test/plan/id/65ba88f124e5af52dc00a078

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ba88f124e5af52dc00a07f
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-31T17:52:29.560163  / # #
    2024-01-31T17:52:29.662185  export SHELL=3D/bin/sh
    2024-01-31T17:52:29.662816  #
    2024-01-31T17:52:29.764312  / # export SHELL=3D/bin/sh. /lava-424641/en=
vironment
    2024-01-31T17:52:29.765010  =

    2024-01-31T17:52:29.866236  / # . /lava-424641/environment/lava-424641/=
bin/lava-test-runner /lava-424641/1
    2024-01-31T17:52:29.867842  =

    2024-01-31T17:52:29.887857  / # /lava-424641/bin/lava-test-runner /lava=
-424641/1
    2024-01-31T17:52:29.975535  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-31T17:52:29.975968  + cd /lava-424641/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ba88f124e5af52dc00a092
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-01-31T17:52:32.901594  /lava-424641/1/../bin/lava-test-case
    2024-01-31T17:52:32.930828  <8>[   27.077323] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

