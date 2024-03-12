Return-Path: <linux-renesas-soc+bounces-3728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BA879CC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 21:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88F411C21285
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 20:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B061428FC;
	Tue, 12 Mar 2024 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2GJ9Efov"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A21428F9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710274904; cv=none; b=IJPi6H1hcufdXSv/iNhkHwAlUaE2zFcRKCOkzckInasd+y5U2+OJnKd7X0hBi/y7qxx4i1jZsFM0vns0nrPYM8uylIY7O0Rij7FWZXHzvS1xdZH7i6MU0e5AZSbyBk8o9hYXma4n8+YfQG48Are5ly8yzpWBkB3JAGcYkCQ618A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710274904; c=relaxed/simple;
	bh=rb//qmIjj1TzfUnE+G0U4eJy1NhGLNnzOjJxr1CfZkA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Mk3f0/wUWM8CpXp31L+NF64AkxKj8RXVODC0JwZWl/R0s/fPYI92118py/RnKuse/7G29oOcFxOiUHC2hwhqOPfPRf8rvW2Ora1SuBKT7+zy4DUI+L/zqEDz3NB/iZrRlNbbiNmcMUcQFkFlHiLX1NQFgw846MDYAmKT9yCqk9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2GJ9Efov; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so294587b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710274902; x=1710879702; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tW+yLoiCj9/DLI27szj42TXQmajaoaspVTRbXQY3wVM=;
        b=2GJ9EfovxBDitulBMXRAvr+BmHzWVNFk3o7PQIB5sEUbExd2zxw6SJAW9DCueCwnry
         pDf4U4FfU54SBHaZ7JitZye5nMXgRMpNnw/2FjRG3pxhW3FBmwRcdWU0Ybw0ZkBwer0v
         LeBxsgHgCZgYP9WqEJUjjHLklMS2Pdh/fkV9QPei2XpI5VdKkkeI4JGgicQp1xzWHoHB
         CWwcMRhFjppdIb1WPY1U6wcLjZK1yaupAnbm87PhhmP5oUFENNkZSsAsNsLje/scNC5n
         xf75rteEPiG3vBEbke08X85j/bHtD2FPU2OECpTUq9bkgSB1jxnitTvs+vUVdwJcPdJ3
         8CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710274902; x=1710879702;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tW+yLoiCj9/DLI27szj42TXQmajaoaspVTRbXQY3wVM=;
        b=FGQ4iLrzhHBhg8bpIrK4GHcI5BX7M/NH36LBhTuWTMAr2JzARHwTYROjepvbmcZrlY
         XdGPKLUwvB9a2F21WJOD4Y7+XlBe+zyzyp65ppEUmCrnF0G6NTyTDu/lNZt+AEuThAul
         SX++HkJARY66Wga06QdPpRQ641lSaxgIx0fMgYFWl1gmg2JvWpmuM3qYdywTQDTlA3QL
         jDnHHaqGCAQ9yYrsJss+XCIbvOCtZQ5J84fd3eAvsh6ZUPA22U6CnTL/N0AL2B8urpya
         8/hI50wPbyS9ZjkzrsXNiy2gqw6kdcFQ6UG5xbhrWHpU0rXGhTIOMG0v8myy+57kf+bw
         MfMA==
X-Gm-Message-State: AOJu0YzrJvnUPcwmUFFXNS6YmtrNR4ZYbYmY0g/tUrhxC+rrRb8bPL2R
	H9S8VTSMrrYDF/sdJJSAuRXogEprNBitasvoU/KlsF7DQKU1c+pS9ZR0dm3nk8oCsA/4FQKS23M
	oLsM=
X-Google-Smtp-Source: AGHT+IEaYipSZplqWA+HhE2KZwXx+TKu8/fioGi1bNRmFUOyOgtvF99WoY+bFlZ7KH23Md9nZnKP4A==
X-Received: by 2002:a05:6a20:8984:b0:1a1:4cad:89fc with SMTP id h4-20020a056a20898400b001a14cad89fcmr1102197pzg.62.1710274901700;
        Tue, 12 Mar 2024 13:21:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id r2-20020a056a00216200b006e69ef5c79bsm2337910pff.93.2024.03.12.13.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 13:21:41 -0700 (PDT)
Message-ID: <65f0b955.050a0220.b99ba.b2af@mx.google.com>
Date: Tue, 12 Mar 2024 13:21:41 -0700 (PDT)
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
Subject: renesas/master baseline-nfs: 15 runs,
 1 regressions (renesas-devel-2024-03-12-v6.8)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 15 runs, 1 regressions (renesas-devel-2024-03-=
12-v6.8)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-03-12-v6.8/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-12-v6.8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      62823f1b4e74f3cfdc7166b044ecab3e2751e930 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65f08724fbdd182ecc4c430f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-12-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-12-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65f08724fbdd182ec=
c4c4310
        failing since 50 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

