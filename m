Return-Path: <linux-renesas-soc+bounces-2325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A812849BDA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 14:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6217EB23E0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 13:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B98249FA;
	Mon,  5 Feb 2024 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="c3wsdgtl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC422F03
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Feb 2024 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707139997; cv=none; b=U0y4GQS/YTlQkl+10/nb8TfpGWCbCePrBTa5vykEyNX7nJbM1Dy0G7DrRIaj+0BYEDDV37PpwsGICq3u4AuoMKE5bAaxeREx2JCgFdMbwzcenTh1ap3RJJF4aj1CMKFDHb0HFOpoN5Il3CrQ2877xkiq2RSuseRqlxXCO5Sg3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707139997; c=relaxed/simple;
	bh=ZLC+5gVjryYJndw7D2+sQRHeBfwWnmeRmVgZ/Gfdu/s=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=r4H59Ntjf9DD+xqVIeIm1BZ6qAxHz4P65X1Y5Qx8ihxJvZ2c8DW65J2gJVlJhf5HnXJWud5SRSVFgwVxbCTpnyCTWj9CeolcjUgjf2qIT3YE1yTrDZQ0NpIcjEMqEHGKc5dONWshId4VQHIG9mLHx6VulPoEPHdkGA87LZyDwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=c3wsdgtl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d780a392fdso37543695ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707139994; x=1707744794; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RBJURwR1suIiJ9SpGO08o/nC4xVzzSdyOPAm17bcb6A=;
        b=c3wsdgtlcmduj85mlozZnxO7Q9AA8XEpptRsmUPsG5I44VAC7lXuuUOb4HE35Dfwhz
         TCItbbU/T8EwSe8VVjAjAyIbLESjTsQJV+r+a94wJiMMR4S1k6I9vyMhTVDXZIbJLSLS
         JZRXDFDJUgZen+gTSO8bur0hmQ8GZLBgJoyVGj0ReiyQevg96ej2/HeDgDH/I2hB5/yK
         ZSTEbJ2Lzrd5yiiPKR6mw4oE9QqVD2Hio9b5ZTGI677FeyH1053nsvFXqteDylwY1EIS
         tUNRQqQdyJYMAOnUUHlt9nI4J2yXfdYj5d1wSl7eS+4MnSxToGf4/3PS5Rn/RPPuaBox
         8Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139994; x=1707744794;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBJURwR1suIiJ9SpGO08o/nC4xVzzSdyOPAm17bcb6A=;
        b=QR+QeSni0JIzwfydysMxu4d9/3gsHyavJnQCMvc9/Tr72jo5QwVFD3RDfjyRxbYxwl
         u59TXOez1KwtB4pvrFFKH1RzK1zaYjq4Q3JrdqRNbGfRLvo02LMz7rBnGOa6ADaRVAgU
         ZWUzSaLtgcbuZSIQ/lIkYW7r7dqGGPKAENXeFvnlI0lfs5g3wJfSRWmufdDbk8+LP0qS
         pOjrHh7w0DTVrZzjsqtnviSrxJY+IZuOBfNdHl3ntmZft2ATpyarAyPsgJcFWEK7QaUu
         c3ku8Wl7uPmJPjuch+g+AW4aEf0TR/eVzfeKFigr1iSqG1g7f9DYwmOfrJbiklr83bnL
         n4LQ==
X-Gm-Message-State: AOJu0YwCfBOXlWRLN00VJB2FAItqj/H3AtRB3URinX06SV26AA9FkTgZ
	5PgHLJ4/LTTGh9w7Cp+TzslvHaYWBvpottghs1zDwR17JylqX/MhY7PAgHzXHPt89EIioWQNZXU
	X
X-Google-Smtp-Source: AGHT+IHH5hl4AqkHPcWeILoE7aJRUwTRxTIFMvkPjbVBEgn5k231MWei/5iNW8xavXOs73JNssK/ZQ==
X-Received: by 2002:a17:902:d2c1:b0:1d9:b5d8:854c with SMTP id n1-20020a170902d2c100b001d9b5d8854cmr4360767plc.58.1707139994381;
        Mon, 05 Feb 2024 05:33:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXtf+02ZFOVw5BgS6a1qTXU0p3ThUayI8K68PJtqCtkKUKKiegBeeeL1aPHsvQ5BB+8Gd2CSzd2NJPYZ6DfZD+AN6/Zo2t2TnhIFg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kr15-20020a170903080f00b001d96a0cddccsm6254062plb.296.2024.02.05.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 05:33:13 -0800 (PST)
Message-ID: <65c0e399.170a0220.22b60.352e@mx.google.com>
Date: Mon, 05 Feb 2024 05:33:13 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-05-v6.8-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 54 runs,
 8 regressions (renesas-devel-2024-02-05-v6.8-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 54 runs, 8 regressions (renesas-devel-2024-02-05-v=
6.8-rc3)

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

rk3399-roc-pc          | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-05-v6.8-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-05-v6.8-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5ee5c13dd1cd222d2add58f1546f05b849c402ff =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65c0b2bcd149f1ec9900a04a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c0b2bcd149f1ec9900a051
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-05T10:04:23.924800  =

    2024-02-05T10:04:24.026324  / # #export SHELL=3D/bin/sh
    2024-02-05T10:04:24.027032  =

    2024-02-05T10:04:24.128308  / # export SHELL=3D/bin/sh. /lava-426115/en=
vironment
    2024-02-05T10:04:24.129012  =

    2024-02-05T10:04:24.230420  / # . /lava-426115/environment/lava-426115/=
bin/lava-test-runner /lava-426115/1
    2024-02-05T10:04:24.231509  =

    2024-02-05T10:04:24.235841  / # /lava-426115/bin/lava-test-runner /lava=
-426115/1
    2024-02-05T10:04:24.299959  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-05T10:04:24.339817  + cd /lava-426115/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c0b2bcd149f1ec9900a055
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-05T10:04:26.550568  /lava-426115/1/../bin/lava-test-case
    2024-02-05T10:04:26.577775  <8>[   26.058008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c0b2bcd149f1ec9900a057
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-05T10:04:27.637963  /lava-426115/1/../bin/lava-test-case
    2024-02-05T10:04:27.665514  <8>[   27.146151] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c0b2bcd149f1ec9900a05c
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-05T10:04:28.898275  /lava-426115/1/../bin/lava-test-case
    2024-02-05T10:04:28.925281  <8>[   28.405888] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c0b2bcd149f1ec9900a05d
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-05T10:04:29.948762  /lava-426115/1/../bin/lava-test-case
    2024-02-05T10:04:29.975787  <8>[   29.456405] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65c0b2b93f837ea01c00a047

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c0b2b93f837ea01c00a04e
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-05T10:04:29.147218  / # #
    2024-02-05T10:04:29.249295  export SHELL=3D/bin/sh
    2024-02-05T10:04:29.250019  #
    2024-02-05T10:04:29.351498  / # export SHELL=3D/bin/sh. /lava-426112/en=
vironment
    2024-02-05T10:04:29.352201  =

    2024-02-05T10:04:29.453595  / # . /lava-426112/environment/lava-426112/=
bin/lava-test-runner /lava-426112/1
    2024-02-05T10:04:29.454888  =

    2024-02-05T10:04:29.458902  / # /lava-426112/bin/lava-test-runner /lava=
-426112/1
    2024-02-05T10:04:29.563011  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-05T10:04:29.563437  + cd /lava-426112/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c0b2b93f837ea01c00a061
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-05T10:04:32.490692  /lava-426112/1/../bin/lava-test-case
    2024-02-05T10:04:32.518898  <8>[   27.181974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
rk3399-roc-pc          | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65c0b3ae779c4149f500a039

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c0b3ae779c4149f500a=
03a
        new failure (last pass: renesas-devel-2024-01-31-v6.8-rc2) =

 =20

