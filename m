Return-Path: <linux-renesas-soc+bounces-6885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65891BF19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 14:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1E33B234F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 12:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEF04C3BE;
	Fri, 28 Jun 2024 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="najefihT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263A1946BC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719579534; cv=none; b=iyQ82dvpZr4pgqmN14DT58jPWeCKKgH96htkyo5kcS2HUF/vyHZP05MjpBLuhRj3KrvtOJFPsK9e2v/zZPsDk6gTcClcbkyt7pYeRPR4JZvVIfCLJlI8Q39701kOpQs7zAqJK61//IJOKMWrcvjh0omHOEPkW6DpxARTFlKjrQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719579534; c=relaxed/simple;
	bh=/iifbaiSnyNP/mB/JJYjnKZP3fLtTgAgMulxAcpJ164=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ssoE4ogpoR3KM5OpkZHNBKk87j4oXF0cMBUXSKjnk18Kofm7hs2zTKbcayDJ7/emjzK5Kv85FI7n7EBOxWUT3EdJ1CZZq0yOIpGKbKqnKx9ZuPabUe99h4JzvkNPQ9UgtiLMCmAyr6n8TPMT5JwRSIGezWE/b+P9KeUa4Obg4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=najefihT; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c9cc681e4fso310608b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719579532; x=1720184332; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lnIVqcDaY7JZA4NbdHworC1cXJMVk2ot2YQsejDqXws=;
        b=najefihTIillPg+5McXmcDysdF/uSx11i++qS19rPfuIXaE0JcABp6R+EGbnGrH8lQ
         TY/+fMs3xhIVjSi/ZoXs0D/5zK8Wr5EdeZlNvtVinhyaG3VmX7xXfD1GyctgBS2g/IfC
         59PD3SEtq3h5sV7etkwSHNg4V70dCcAkfuw00E/4sxz9T2HSxv9v3QIQMW2LK5Sr4QyE
         3n4U+Exa69wy+lHRKYw7MbDGGe5Xszo83dqAjYc7i5xVMmnLOfUGH2GUYkzD+/TUo2nn
         MyqTSmCaheld1jt6EFFvNu3zP7QQlDgu5rXNZzgJ5unCn2AjzpZBg5GjUAc8pnHN33qb
         zZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719579532; x=1720184332;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnIVqcDaY7JZA4NbdHworC1cXJMVk2ot2YQsejDqXws=;
        b=Ej4idrwGiB2kfdnU0gEmC9Ng2+Q6/gwbMFOlGb3yAME1ZohGLzouTfDhPe28xhFMb0
         1hJb1NfSUwwxFmDVu4YkhP8HWqRbcqpcW2MO/Mv7ykPYGQPfqTA8YGGFhiUxHcxOOidH
         QQIK79w4y8kHkglQ6DG9KdYBNd5npd7vrUcFKAOnkm0jE+zHQA5P1QfHEk5tgSXcAnRI
         bh8DxsmnBcAy3sqO9up57s8Kcwg8jzcAH4pneU6/4r/8e896b1Gam34ZratTUhoGuOy1
         cIz/2Rky2jPEXJstaRlYNvVq+DPoydQY+XFhpzGp1yvtIT3ugU1rcqauI5kSOKbffjPw
         BRTQ==
X-Gm-Message-State: AOJu0Yz3ZDLd7LkOlj277cKJLUcXfxfnSXTY63lVANavrHWsGaWpliK4
	8UVe+niG3kenHEFK3CjzUU091/RTPGgo2T44upgeZ2JV7gqDU8aGoq0Kv6bP2arN11agSKDJ10W
	M
X-Google-Smtp-Source: AGHT+IF+yyWD/ZV7/DbcpX8yAfcOZbIlHmLBT5C0SW8720mmvweTSGii6fwl6sLbyEB8h/oYgTVotg==
X-Received: by 2002:a05:6808:1282:b0:3d2:4fe3:50ef with SMTP id 5614622812f47-3d545a52d32mr23462894b6e.41.1719579531769;
        Fri, 28 Jun 2024 05:58:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080246c8edsm1517027b3a.58.2024.06.28.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:58:50 -0700 (PDT)
Message-ID: <667eb38a.050a0220.eda44.4ad6@mx.google.com>
Date: Fri, 28 Jun 2024 05:58:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-28-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 22 runs,
 3 regressions (renesas-next-2024-06-28-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 22 runs, 3 regressions (renesas-next-2024-06-28-=
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
s-next-2024-06-28-v6.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-28-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ae035db289ffbf97e32db0e86571507f9b79ee31 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667e824c121936ba627e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667e824c121936ba6=
27e7070
        failing since 30 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667e95c6adec1c823e7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667e95c6adec1c823=
e7e7070
        failing since 30 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667e819cb932ba05c57e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667e819cb932ba05c=
57e706e
        failing since 157 days (last pass: renesas-next-2023-11-28-v6.7-rc1=
, first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

