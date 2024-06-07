Return-Path: <linux-renesas-soc+bounces-5968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C3900B51
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 19:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45D61C21AA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 17:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFD619478;
	Fri,  7 Jun 2024 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="x+7Bdxpt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6782D33C0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717781780; cv=none; b=tC/6A8427ymM7OtTj45BBiXmXtoBBSXZvC3YPq0JLMb3YRvnxiPXpQL0YDaq3wHpQdmgyMx9kMCuXPrpMqJh/4uAKhf8EQUjuNAuCeq/phTH9dnyQPZuG2/g2XIsQrMW46pnwn/B4cJQFCWxEVkQqMN1eQtDOsDQT0R1ou1HSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717781780; c=relaxed/simple;
	bh=4LZkm2F6Z7dK8X8CfVAE8omA9jI/m6V3pI/BgSaK5Cc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=LsuhUXkP7vyiYWWpDfVd6NqRZNFF6IdvDFM/NB6n7tSF1FoyGBm2yAsmKfjD7nPtkWYEri6iSLuFqsV015LBka5GOsYmd6bz2O95hIHRWoOAM7V8r/0WHIb3UYMdjUQRFXWXf7sbek6NifGP+CsMNYswKCTXm4K/lpOZOh2sTls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=x+7Bdxpt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-681ad26f4a5so1352608a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jun 2024 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717781777; x=1718386577; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9n/NB8h+XPKm+iVsbn9SrmqP5LWe4PLdneu4yL67I4g=;
        b=x+7BdxptaJn5hWPlI15TrTQxeqdcczmab163qXOiqO/fwd31JvhL9eBRE7limhPKTR
         q1u3m3ZLJYuFEW5zJGDwepp+xsr3dJyqGv/Xw764iUyDjODY5awV/xX5Mg58GkvBcBnz
         B2bInVKhQbGkeAIqxx+ctU8QaSLHSgCVUHyiSc8oajmFMW+Pe2h1V8OvaWVjEjBrTEQy
         PHQ1V+TWZJG5y7rKl39paYNCm7/WIEONfvRcs9pNiui773JCQ8KXFBXbXX4XF+KNTj3I
         xFU3uPbJwEJyftXcHpwVjedTvA38SgzkVGfUJ3eX9b7QwAASwEejAq8mUDTFMqRbTWKo
         n5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717781777; x=1718386577;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9n/NB8h+XPKm+iVsbn9SrmqP5LWe4PLdneu4yL67I4g=;
        b=R9j3xloBVgf/OltZGvLeqKVD6rHVLCZ9WzV5k+mDqKAF1xdOkxKYPZj8+CCqmZct0O
         FdD6e23Xg2La8gfFRPBn8BUTQXqYFkbfxsImHHSAz4eXKzjl+4mK8Afq9LX7qiCQRF+O
         WjcU1VHoBrJc0PcqFu9DPwM1Kzwv+ksX0PAziD2OC3tFWrMGxtveFYFAnsI1i9fDcPDa
         Rf+bIxuAq9j0iDiHQzjByi6nZB3dSxcHtKzuTyoWzIpTM+uW5jGcm+VTqD+iAo7x2CQm
         mDj6v5K4/bwlpb8W5hm+vdXWg0x6GIG0mCxW5RjGOU/WUahP++uvkvxkMajZIAgE2QLg
         QJOA==
X-Gm-Message-State: AOJu0YzgsvPYguvk5z28D58Uo9UJnr3y/2QHm9ZM17F1FdQpvYwYFXy/
	8YTrLp3paPcuTQyietwReUkHA3LBuP/r8fuW/0//AHE7Vc6KRMasJpwbbkRTbSI3EPMpSfyrphf
	/
X-Google-Smtp-Source: AGHT+IHhMUHeWebKtolN9pJUzt0/62tai3AIn+rVDT3+9bSKSMJKEe94qiZrJIKcepWmB0S57NqWng==
X-Received: by 2002:a17:902:dacf:b0:1f6:850c:3c67 with SMTP id d9443c01a7336-1f6d02e6c41mr39812775ad.26.1717781777316;
        Fri, 07 Jun 2024 10:36:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6e3469535sm12126085ad.253.2024.06.07.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:36:17 -0700 (PDT)
Message-ID: <66634511.170a0220.1f490.3121@mx.google.com>
Date: Fri, 07 Jun 2024 10:36:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-07-v6.10-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 23 runs,
 1 regressions (renesas-devel-2024-06-07-v6.10-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 23 runs, 1 regressions (renesas-devel-2024-06-=
07-v6.10-rc2)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-07-v6.10-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-07-v6.10-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7699f2c204f1bcfb84958af300430f19282fda9e =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/66631576df786f1ea97e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-07-v6.10-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-07-v6.10-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66631576df786f1ea=
97e706e
        failing since 137 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

