Return-Path: <linux-renesas-soc+bounces-5967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4661900B48
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 19:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14286B22F89
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 17:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215E633C0;
	Fri,  7 Jun 2024 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NU1ETMcz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B419ADB6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717781431; cv=none; b=K/8HAqS6NXUCreWKeQHy54irtduoY8kILNVzkZMnceJ7NMnqh1H9jSTe1T1PwKF8ki7k3PXxampkzj148g9eKRrN/QHlPuqtLGjg1vnrpWxOop/+nk4QDo0aE2lH4xOR9lPPt9aQnelNcZiLXB/n/+Z/MbJPX8fDRGJ66ALERA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717781431; c=relaxed/simple;
	bh=e0X5Eyhde88oE6YRIRzOwDCyDczP2gx5hlCs/9e8kAs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uNsbaRVEk+6ptksJWE6GL0dvS03LGkvJWbwdXY/v9FQDmrLUGXj1eFswPMySH2ZopeACVQim844+0k7WCm/hEP1frk0DRybkBc2+pLTwxg6p5j+sKIXpwj38G+DavnkIiS0JFqKKxmoUVxpPX/wh1S1ESZnMqKPJyf4YFlIy8Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NU1ETMcz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c2ccff8f0aso494975a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jun 2024 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717781428; x=1718386228; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ekwIIMqecTEYIsIg+g5rDkObTtOV6wJcDQIAFhrAUik=;
        b=NU1ETMcz/wxACCwzrgRXGaxlTJeGfF3M24iJdqwLZUTIlCRR+OHAA3FMPEydsYMAkE
         5IO9dejObzU6OTnhLUo5WbCQVDTrsmR+uw6M5EO/64u6T33PweVuYQreS+cG6SMeTE2W
         za7oK4/Bod4EedH7XqQfG+3am4ZCiGDvtCG6P7IHxNdGUfGjRHqFE1oA+xj4JgSdJyM5
         et2h4m0tC/tuoSHXTAillI4IamxmEISZF4o4XI9/4eVojs3/6pucQo/3hZkt/+B0kTmD
         rkLAs2ie6n0pIqBUpqiP1aQwrxli0odhyiJ89MDYXatVQPxhmH70eGjbTN2BWrxzsrkr
         LIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717781428; x=1718386228;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekwIIMqecTEYIsIg+g5rDkObTtOV6wJcDQIAFhrAUik=;
        b=XYZRTMaR979w30lDKlIaIaSup1W5sUyvEhDnmD0CJBwzcgO9onzvBEqF5Je1S5bLOL
         BwV2Fp3+GpXKsxRpjR4kKM3I3h/62BQCk6FSv2lwF1VhCiutPGN7t0Y91cptUjyZZRt3
         /VBVVBJ0KL/wOfaRD/MZzRIlN4fmoNGZ9zUMlCdWNgAJ1jzy66YyUyx8oe7s8x5wuvXi
         osJe1L4BqPTqBfIKZrUIlsdKWrQQ2whQKPm88Qfehy+ThbiTPfScRNtDGp7QVJ4OWsqT
         rw5VeDZMVmzDL6wO48b74FJUSyMpLjK+lorW9TqEBkh4Q3ASc4ymbZjfH37usvBrC9hE
         q+gg==
X-Gm-Message-State: AOJu0YyuJqwxeMpelAul8kUwqJkoQIO1ojYyMTtUTgZ0hCGIuSf4EiG9
	aYojSsyj3mjf45qTcLR+XMTwIUVi8LmUA+3+NYmFLRy0d2LvtoMkJ4xYjZPfqanL7wIv+wdODJC
	y
X-Google-Smtp-Source: AGHT+IEKLyLjH8Qrvgd/Ibs8YeE52QNnawpDeNVnFEUtMetZEWxZ7ShMt3VoemfPQu0znxg4CAXpTg==
X-Received: by 2002:a17:90b:b16:b0:2c2:a07c:f521 with SMTP id 98e67ed59e1d1-2c2bcc633damr3042497a91.39.1717781427536;
        Fri, 07 Jun 2024 10:30:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28066da1dsm5780352a91.20.2024.06.07.10.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:30:27 -0700 (PDT)
Message-ID: <666343b3.170a0220.fa504.066d@mx.google.com>
Date: Fri, 07 Jun 2024 10:30:27 -0700 (PDT)
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
Subject: renesas/next baseline-nfs: 20 runs,
 2 regressions (renesas-next-2024-06-07-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 20 runs, 2 regressions (renesas-next-2024-06-07-=
v6.10-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
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

