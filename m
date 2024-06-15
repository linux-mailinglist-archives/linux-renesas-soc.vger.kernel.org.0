Return-Path: <linux-renesas-soc+bounces-6282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5481909839
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 14:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C494D1C21169
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 12:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3136D4503C;
	Sat, 15 Jun 2024 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="VRs1bDkZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE545038
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718453921; cv=none; b=R1EfocjsVxQCBwmHAKBbdcL5ekUtqumFT/QEUXgmHD52LzGbxNeWNS1XfJFO92i1yxBDBtFnVka5e9H0mujypQ3GVOWhYRs0XpAnADtAGWo91SGNdCJbGHVeeOGKjUALdsO/r2LtgrEH8inpW28gSP5HN3aJZelUEQJuxU9+gNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718453921; c=relaxed/simple;
	bh=3Tu5nyehshpGImkrDAjkXso6/dm/7aDyEtm/ghMFhbo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=SccLThtzt6fXSBaBV1iea836u17K46ooYp1laxqKGsqJq7pGlBsOtwVTlVhj1rzl98RK2sdw6Tsg25l/3eWfk9Ijcpjo6yDrG/09g0d7j4gniTuxgO+BHZ7hwmAFlz5tCW196Z1fIqR9HjXHqwHz+6ksLsmCiCPKmVpAxrE/mEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=VRs1bDkZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f7274a453bso26618965ad.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718453918; x=1719058718; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rAWf07uSapWeQPMTEfz7ySNkGn0m7OQWv6zxucZyqZA=;
        b=VRs1bDkZ9M+7/1jPiRTEW0SH0IyJWtTwUA6nZG3EZhRnKZ03mgs0GI0ODDiY96zXcX
         FRcvvoeNcQUWfKUXxMlaxByDcmPgo65cDzLMJU8+DYWgSNv+t6wqj7V2ZssUNoSYDAO6
         IgZcxN0vm4nIwe36bLgql8M0Sd/osuHuIbkGSb1EvrCghHqXRqPj7M+VCMjDhf9+ha9D
         trwRo/NAA22bCxcZ1+jmc0fJtKdlO9p5J8iXG8crxl1wBj74JaiXFlXB/7HhK9lGOe+V
         6J23UBd4RNGZ8HnCahlPneO8ZRsy+Z6EYSlYp95lky9nVEKUJ7E/kJn81SzcA+flRQNf
         hvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718453918; x=1719058718;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAWf07uSapWeQPMTEfz7ySNkGn0m7OQWv6zxucZyqZA=;
        b=cdgtGoXcyMV9NNVhq7An9TEATP0Af0eqKpkB3fRHI7ByW9bBtkOhzbTH8TsfswtWBA
         zwj8LEF2SlKYLRTQOt7p0P/cIjp0lQfMqy1XaQVygoJRChhwJWQSCg49hmC8ht8M6FwQ
         gABNLgB9puLPUNC6eMYaqHFTqMInCtbyR0iLaYNdxsTYQNVMYl4oLAiX1HE1u96+maIm
         81QgGeJxGjVns5F9fHIdslrlzkxbqeLQ5Ci3h5bek9fLor+Dn07GiFyg2rm9/iO22cDB
         65g5anCDzTRsFVsLCooBhGSHJ3CkmO4hgF4REXpuRK486JOaZj6N36CW0pJwzcks53uO
         4hdg==
X-Gm-Message-State: AOJu0YxBn8lkbBrsbP9K2k7mLuVZ+1TwdVcyrkha2Q/uEg5I3oFVULmG
	SU/ro3pWzKfthC1BhhjpekMLAlJFOyVpz+De32oHwGII74au91wAbHcQSi5XQPt2NFBxo1j+gL8
	w
X-Google-Smtp-Source: AGHT+IHjpTO3bqM/+6p3RRiWN2AZBVvZwtOr/mcBjUBVIJm1xnQr1qpLhMB3G4QOgZrd3+ImeSQw0A==
X-Received: by 2002:a17:902:dacd:b0:1f8:67e4:397f with SMTP id d9443c01a7336-1f867e4539dmr47261575ad.7.1718453918239;
        Sat, 15 Jun 2024 05:18:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e6fce1sm48778485ad.78.2024.06.15.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 05:18:37 -0700 (PDT)
Message-ID: <666d869d.170a0220.d2c9d.e068@mx.google.com>
Date: Sat, 15 Jun 2024 05:18:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-07-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 23 runs,
 3 regressions (renesas-next-2024-06-07-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 23 runs, 3 regressions (renesas-next-2024-06-07-=
v6.10-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-07-v6.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-07-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d1ef2e3bcb03040dfe57f59896a00a69a5eb4b54 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/666349939548369f697e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/666349939548369f6=
97e7074
        failing since 9 days (last pass: renesas-next-2024-04-22-v6.9-rc1, =
first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/66633ce2ede686a9967e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66633ce2ede686a99=
67e706e
        failing since 9 days (last pass: renesas-next-2024-04-22-v6.9-rc1, =
first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/666313e5e9e60bb2d27e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/666313e5e9e60bb2d=
27e7073
        failing since 137 days (last pass: renesas-next-2023-11-28-v6.7-rc1=
, first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

