Return-Path: <linux-renesas-soc+bounces-3729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B12879CC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 21:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56689281A68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 20:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050DA142903;
	Tue, 12 Mar 2024 20:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="V1EAlv4d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190C6139572
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 20:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710274904; cv=none; b=isrZGHZr4wUBU6nOAUxhRZP3a/tkB+tUS/VP21OcOIHOyM2ibEH+U1Pqh6cJ39uyslSPKMoIS3HhR5xovzdRNnqarU2DNj1r8SupABKRYP9GQ+Y6tcIhWczVapOnkP4JKt9v2fC7iG+AxUFXs8U85w3zsvUIkRVIkdAqoTwwRA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710274904; c=relaxed/simple;
	bh=Ry1g9yU6HIcgOaC/BWpGFy4Bngy8pJ5nzdwiQGr13vU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=O7JKC2lPc43fWVnI/HtkPmdqxvGNJPYrQGn64lZPGiN8UqQnDTCW8BhocDwUWggNjpGqCn5DZR+N/Efg0baZ2E5R6M9PJdqtYkBIo8+6vH27fYXzumNsAvfcT7/vdkvxjj5RJm5rqsl0Q/s07/qNt3HdPX9tkpKMkm5qPRiQalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=V1EAlv4d; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a11f42324dso178260eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 13:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710274901; x=1710879701; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I4tQMxDfIeYfqtzYeTnZAOmd0atrKDvy13RBVytbuZ8=;
        b=V1EAlv4dFPY3D53FONzQw5KVDnPxOZTsw05YjkOlZLb0sC1TKg/wylQyyV60Pm4tnk
         ZsBZJPbnEjSXYBFTtnImTmkoV3cIDRG2/x/MzJlkR/irjahWfWuzF052JIj9+Ad9lEi2
         xyYSYBJRj7XuBhPiu+tzEDAeGRAvCti6glXF2TmPGSwlXerW5YwlVfkjDbQezwbSyox4
         lI3BnE+O1KvkwMCZXCzv8KrNuqo2iEoWOY/NPoiTzVNg9YL6en2GJIwdk0igu8WQ2bHu
         y/UWygNjGtAmGQely3Inm90YAU9kLq6Q9hSizirvNHEO9weZDLB/n+6BxpuoBNLW0U5l
         5G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710274901; x=1710879701;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4tQMxDfIeYfqtzYeTnZAOmd0atrKDvy13RBVytbuZ8=;
        b=cBqQLyzcuQ8PypoLUNvIXch+GaVX/FhWhf62MkgYwNim/YpGG534ETJ64DzS6MZC4k
         E+94wHAAZR+NOyR3jbaqMmcmyKsBeq15G3rUuMTtllBMOf+pa8f9vi49850Okqdfp/O4
         mXzq6fJ1o9rerjKY84JjgbAddJWMCQbesW0PEKT3tErBfKFF8f0vXH8ISlj+88i8i26q
         J/sPS5ExlfmTQ7F/57xrm/x838Nx6qIp68NyRSM3YxkIB0acpe9wzjQBUEaFtyNQhynV
         aTJdfEUYnVMe1lPTwegMiWreSKIIK9TeZylnPtHpkzO9ENRgzvnGRIQw5Dr0zSr8TTK7
         Ds+w==
X-Gm-Message-State: AOJu0YwEARr9OSaL8goCa3R7SinEUxSlhKnWDeO1npbq+a/xMp7O8hlR
	3ehDNx+msgOOSivjlGdH8evxtw9b6Ukxwi3T7go1HvnTmgK1cGv70iJVguCB0It1F09TbGKTwSq
	wyw4=
X-Google-Smtp-Source: AGHT+IGv68n+TRPFvNB/+HEtcG2+n/hcz2GQghM3JI5/5i8i8PWimLuUa+xfXeeV8+e7yLEHuF1SXA==
X-Received: by 2002:a05:6358:5401:b0:17e:6bfc:b31e with SMTP id u1-20020a056358540100b0017e6bfcb31emr4633636rwe.31.1710274901214;
        Tue, 12 Mar 2024 13:21:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o7-20020a656a47000000b005d6b5934deesm5654556pgu.48.2024.03.12.13.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 13:21:40 -0700 (PDT)
Message-ID: <65f0b954.650a0220.b0ff3.085a@mx.google.com>
Date: Tue, 12 Mar 2024 13:21:40 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-03-12-v6.8
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 38 runs,
 7 regressions (renesas-devel-2024-03-12-v6.8)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 38 runs, 7 regressions (renesas-devel-2024-03-12-v=
6.8)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-03-12-v6.8/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-12-v6.8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      62823f1b4e74f3cfdc7166b044ecab3e2751e930 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65f0865ca8c5b6f3d54c42df

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-12-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-12-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f0865ca8c5b6f3d54c42e6
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-12T16:43:43.869294  / # #
    2024-03-12T16:43:43.971569  export SHELL=3D/bin/sh
    2024-03-12T16:43:43.972339  #
    2024-03-12T16:43:44.073902  / # export SHELL=3D/bin/sh. /lava-441941/en=
vironment
    2024-03-12T16:43:44.074677  =

    2024-03-12T16:43:44.175993  / # . /lava-441941/environment/lava-441941/=
bin/lava-test-runner /lava-441941/1
    2024-03-12T16:43:44.177209  =

    2024-03-12T16:43:44.195727  / # /lava-441941/bin/lava-test-runner /lava=
-441941/1
    2024-03-12T16:43:44.239851  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-12T16:43:44.240293  + <8>[   20.511963] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 441941_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65f0865ca8c5b6f3d54c42ea
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-12T16:43:46.347348  /lava-441941/1/../bin/lava-test-case
    2024-03-12T16:43:46.347796  <8>[   22.620105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-12T16:43:46.348221  /lava-441941/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
f0865ca8c5b6f3d54c42ec
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-12T16:43:47.408802  /lava-441941/1/../bin/lava-test-case
    2024-03-12T16:43:47.409320  <8>[   23.658850] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-12T16:43:47.409683  /lava-441941/1/../bin/lava-test-case
    2024-03-12T16:43:47.410066  <8>[   23.676308] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f0865ca8c5b6f3d54c42f1
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-12T16:43:48.485223  /lava-441941/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65f0865ca8c5b6f3d54c42f2
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-12T16:43:48.488532  <8>[   24.775832] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-12T16:43:49.543428  /lava-441941/1/../bin/lava-test-case
    2024-03-12T16:43:49.543886  <8>[   25.796573] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-12T16:43:49.544248  /lava-441941/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65f0864832850543754c4369

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-12-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-12-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f0864832850543754c4370
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-12T16:43:33.364069  / # #
    2024-03-12T16:43:33.466048  export SHELL=3D/bin/sh
    2024-03-12T16:43:33.466752  #
    2024-03-12T16:43:33.568161  / # export SHELL=3D/bin/sh. /lava-441938/en=
vironment
    2024-03-12T16:43:33.568865  =

    2024-03-12T16:43:33.670176  / # . /lava-441938/environment/lava-441938/=
bin/lava-test-runner /lava-441938/1
    2024-03-12T16:43:33.671086  =

    2024-03-12T16:43:33.689436  / # /lava-441938/bin/lava-test-runner /lava=
-441938/1
    2024-03-12T16:43:33.743185  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-12T16:43:33.743327  + <8>[   20.997515] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 441938_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f0864932850543754c4383
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-03-12T16:43:36.172215  /lava-441938/1/../bin/lava-test-case
    2024-03-12T16:43:36.172705  <8>[   23.412363] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-12T16:43:36.173002  /lava-441938/1/../bin/lava-test-case   =

 =20

