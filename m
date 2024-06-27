Return-Path: <linux-renesas-soc+bounces-6850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E60191B22D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 00:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA6F1C215A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 22:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82921EB40;
	Thu, 27 Jun 2024 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="iigeQRp/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4444013B587
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719527128; cv=none; b=GFE/uqyKy87DBUerX8eLYs7zWkK5y4T5NRCmYof6omxhX6HiKzyNQmfRFxVbXKmMx0qRRE98qWq7MgEWqcRZkoHZgeGjkRnX30YeJv1nXH6dg8TvadYw5kQc+xBfof1kMHA9BYgWjyhzmTaVt9nIvh82Gm2T/tseUF3Fx+HWdBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719527128; c=relaxed/simple;
	bh=O/Ea+DsWP4/zftf0gF7AaeTmeIHwAO8E7IxcpktQiIk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=mLi/zKDzhj0WtaGy44rV13oTI5bqwbzSX4LaEFp66U2vS2xWOwyuMo5d1n7cXpxGS2mKQqdVTmG+4qwAaZpEw425IU5hbxJ2GtxAu7NffwWDMSFiTNtZw7pRXAfMitzCYG8obtH4+Svabz12eRdMQUuaOq4/EaJzYNU+fLJoMJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=iigeQRp/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fab03d2f23so10288755ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719527126; x=1720131926; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BBBwr0QU3Mny2G/VhVnVXbkep1FkZe7E4c8tp8vV+8w=;
        b=iigeQRp//53teooMZGc8JVqMtBqnUpJaUijr8fRPBjrXuJDTwJSNbnI0EPDk/4a7wq
         FHfp9bB8emmVyQSdcaozmgr39s4y/EFex5d7LL6zoJFouzcOMjTSoV/R38X28rQTVRid
         zetzH0DaTHKfRUkMzpoCXaq5r7NMVNwbfSbx8Gw16Q4Wp35V7A/t2IO8ko+9yzQzp3fb
         jltnOKABO07Q3hnAUDW1KAmeGjIQrcKKwkiBVBOWZuYNlSiM3JKkwVIJqJCUSVq0c/r+
         G2hWxvzP74O4VW6uiQp1WSSHDBenFH6OqTZlJxu7/ohlix0pjqFtv6JoOtCp8g6pGDJB
         6E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719527126; x=1720131926;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBBwr0QU3Mny2G/VhVnVXbkep1FkZe7E4c8tp8vV+8w=;
        b=Dj2QL91goPYsycU81Qp5IY8BIRbED5Jk/8xKPq1a68QKxrppRJ71rJyEu7Clx41lZl
         D+ifu22aWuywiEQfz7Ec8eNHZgqrW9HbAI874mcsjo7dIDbpD6w2lKnztyEYTIb4lGOw
         JhuSqgyi+MiTfeVUYSkcaGRCK70LfJdkOA+yKE8aaFcNAQUakxoo2yiZGG0QWmrEDsXa
         LDucWIiOCEgi8yVQwKX8vL+wfPJNikBRrNIVXkO48YxfP2lcDevICcvbutt8mpdJ0HD1
         R/E2PILjmynegsYiHtF/lr8d9QpmuN2q7qA7LXUOdUirxEuTCkLB2wkXQ1C7PSLIqU0g
         7VcQ==
X-Gm-Message-State: AOJu0YwuE4oz3uBSXQkNySOO3rYSoSDhl2cAaCeUkMjCyeO4PJPsCLml
	cPTqM7YtiTNvMDOv7enGtE+1hWmvQRULSeFAQhL5N3fDDTC11OW/iCZBvZPbQA0DjtKXWO3DxB6
	M
X-Google-Smtp-Source: AGHT+IF7z9PClIjnWFIsdwwk6EJn3Wn+8+1PBAkccgL90Oa2xmGbJjOtwT5c8Pq4yolxR37iRzkZYg==
X-Received: by 2002:a17:903:41c3:b0:1f9:b369:7ca with SMTP id d9443c01a7336-1fa158d0820mr171774055ad.11.1719527126057;
        Thu, 27 Jun 2024 15:25:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1535b89sm2631965ad.137.2024.06.27.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:25:25 -0700 (PDT)
Message-ID: <667de6d5.170a0220.fafb5.15d2@mx.google.com>
Date: Thu, 27 Jun 2024 15:25:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-27-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 60 runs,
 2 regressions (renesas-next-2024-06-27-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 60 runs, 2 regressions (renesas-next-2024-06-27-v6.1=
0-rc1)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-27-v6.10-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-27-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      91aa9e4e18c70bc2160b63e403932a83226dfc67 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667db66c91c4ba5a997e70a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667db66c91c4ba5a997e7=
0a5
        failing since 29 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667dbeaebf5a1928727e706e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dbeaebf5a1928727e7=
06f
        failing since 29 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =20

