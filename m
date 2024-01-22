Return-Path: <linux-renesas-soc+bounces-1640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E16836498
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6E4D1F2543F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F953D0A4;
	Mon, 22 Jan 2024 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Weh06PIU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53533CF7D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705930938; cv=none; b=SqaiwWCtNORPtohtBlqBMMyHpX8Z62n0aOGznrSbk/W0+lFRyv1M5QAzb7qvTQbiEIOPtxaU1ViE23K0y7ax/oosPlNtpEf9UVIbM2hMMRaFlWuJlLQxVivQktub+GMmrpGv8AHqyqSolsRaGJvLH7p0CsdDKahLR5xgfWrCaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705930938; c=relaxed/simple;
	bh=+8ReKdd43NKlN4ijDXotUm7zIo8Sr+eAr3bFBvJXb7U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=tFysqvUJQzg4xqov3jSXwq/jDevQhXKfA5XzmiAuEqoAx4lbHUu0RQz28imGtENGuKE6F7lxK5PznOSUNU0OIDG8JKpGm6VoLbwQ7IZZG8fUhHe+TFPWC/rGglOrTNanlTsni99ZigV375/Dz7VlRWA+1drytFKzt6uegASe29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Weh06PIU; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bd9030d68fso1987332b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 05:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705930934; x=1706535734; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ecHilolpEWabifRK/UqER6hH+iNa9ejCYZlsGdirMqM=;
        b=Weh06PIUnoobp6xKtO8xezm1LkTYj93Ghag2SymBxqUWXTMV3lbbuYQI5gIMQxcQ5B
         o7hpDYSV9uGViznk2YnRDl+fZpLt6b3VFxqNIjC+Jsq4i7voJZWRggEmXN6PmlghezT1
         YsigTxDYYPkPiTaX1WZYBcyDvkLcO/6FwzLd+OaFjBCKE7QOGz50jh8HKpYPe+oHt66M
         28nOtpTVYnnug7ptjM8bmsPxIrCg6rL/OLUpwSIWdkGNJISBKLowk8aN2t0cilRF4Fzt
         enGxzxnx3tIEe+ixSrGgtvV+AlXAMpYDtJ2cU97PMv8qICxxC+K4XB2k2A30qvCNEACG
         h+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705930934; x=1706535734;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecHilolpEWabifRK/UqER6hH+iNa9ejCYZlsGdirMqM=;
        b=Bxe6jHGq7hO5W0XISZkxqY+A1Hc4i2iQKIKButmrjdZJqNAjSJmZeU+DUtzGcdcpMw
         Codj6/kxriDmwHT6Nq1f+CMfaPUvGuYwlKJ/Oy/h5oHnP9LCF7qrGpSkI0dkHcBAIrfU
         ulhqOMtzxXKGRV7oDEcoIVAIBBc5LBgZFmcPrn1rjSTTvQ1RVY/jIdZGnRzGHOIlkO58
         LSiHmhpYYNSOx09JtFC6G/hwSPN9DrjIssJkZbSJTR3/BO+WN5dU+bj1AosAbEqH3eQt
         a1QfEwL9OqYazRJoj6Tytu5FtV3idQTur/7DJAL3HubwSSyR2fYwCTpbLoeGBNXOdfBn
         2WXg==
X-Gm-Message-State: AOJu0YwuhG/zimXxEV9UnzbNIQwhGy8JBlGxrlTKqJm88UHfY2gS8e7i
	pU+VbCa/cGnYl0FNMy8RB+OyXQ2chlkI7lPx5Y9cff4wWZVYcfT+X2r14XPITWieRuiJsPy35Kn
	1Wa4=
X-Google-Smtp-Source: AGHT+IEyVwQVMQd5omnx96pFK+tW766INDzejm38XNW92U3+snmcHxoIpJgXB0R6BQ1IH7uuKPtO8g==
X-Received: by 2002:a05:6870:96ac:b0:210:8cbc:aba1 with SMTP id o44-20020a05687096ac00b002108cbcaba1mr4039596oaq.95.1705930934078;
        Mon, 22 Jan 2024 05:42:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id r21-20020a635155000000b005c1ce3c960bsm8100952pgl.50.2024.01.22.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:42:13 -0800 (PST)
Message-ID: <65ae70b5.630a0220.b2dbe.abac@mx.google.com>
Date: Mon, 22 Jan 2024 05:42:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2024-01-22-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 22 runs,
 2 regressions (renesas-next-2024-01-22-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 22 runs, 2 regressions (renesas-next-2024-01-22-=
v6.8-rc1)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-01-22-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-01-22-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6251f25da3c72088c750c8f5ce28c3a23d69c1a7 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ae40637a65150ff052a45b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ae40637a65150ff=
052a45c
        failing since 55 days (last pass: renesas-next-2023-06-06-v6.4-rc1,=
 first fail: renesas-next-2023-11-27-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65ae3e8e4e62aa6a4652a47c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ae3e8e4e62aa6a4=
652a47d
        new failure (last pass: renesas-next-2023-11-28-v6.7-rc1) =

 =20

