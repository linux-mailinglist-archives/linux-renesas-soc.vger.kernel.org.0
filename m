Return-Path: <linux-renesas-soc+bounces-6281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49837909838
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 14:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C94D71F2111C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 12:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1AF3C062;
	Sat, 15 Jun 2024 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SdkTVcZg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646BD45023
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718453921; cv=none; b=bhCRziCQsBi1ckoPKUXlaFTXc0x2wa5dE5nKuaagIpKSzf57NyvrbMY7RtutNQIEsh+bX8fmjWykGW1HJPoQe+1Dv5tiB+/6oDaAlc+J+fXveRRGreVKiAX4KrQj1br5Fa3zzQoUqVXFg1suMW+UouLtP3fAONoRe3DvrRRudc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718453921; c=relaxed/simple;
	bh=OBFsQz+fugFyT4RChDZ4sBg6SqYiDCwC4pb8ApIAcek=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=bXOOp8KfxQqyaitqMxJoGSE74fgrtaC4OWg7OPV36uO4KJ4IBUmOqEffo7wolrA8iXGgKBwrGhH0W4ObwcmTbYGOxcUDFce9bKOgvngNRpK05SO1254wRLb7B574gSq1AyDLTu/BMgfAkxq0xoQYCR+5XgKE4gSFX7V9hROLQ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SdkTVcZg; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f4603237e0so2193675b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718453918; x=1719058718; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/JhE1J3Mui2Y1BrcHGxGeYalp5jL3H2aH6e5Rxfc/WY=;
        b=SdkTVcZg7+K8kUEIS7J2fbANGjkDcSxeFZJw5szriUR7mGivEyaYq5qr3Gio7ohqoi
         15KVM7bJ/N+qolrc73kDkrJtx3O79INT08oGacXFW4/DT43GXbsNeiSzgLZ1WhajFn0b
         8+mbXmpA0tRUlb9IanWxELTsouJhLaICnRQq6XWiD+FxuoI5kiJLyHMzczGzddebstxy
         EA0HkGetNzorkGBNSDaFseG+/+wZWcBwBBPT62eCGPnsHap81H2KyqEhnXx0xd+uV4PF
         6l9wfL/k2gHOavUz4VkWwDHvKMmUBEvfQlBFuMokidkbKQAlXMkYtQvJ9Q60v/GCQQsT
         fXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718453918; x=1719058718;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JhE1J3Mui2Y1BrcHGxGeYalp5jL3H2aH6e5Rxfc/WY=;
        b=csP8U+IZlknvgUEWtiqcMG41K725bCO07+uFWZnds0GHz/Fxto5a36oM+D2iUcnB+B
         Vpdq7r0mtb6bNSt4p7/kqumuol9X73Z/XdUxEhYBqIXuNrZpDd08o+HOFdHtsHZXd4Me
         F5Gpz/Ce56/JW2yod7He4Pa5v59R/OWEStUCu5P0y3MjRz+SMbmFbzosSRsMi/hJgVzQ
         d/CI5iES30pGFaT3Y/mg9LNO1O/oFJCCfO+p/jiem3LAAI1VVwTtv4wPAmDIf9dH93IO
         VJJb35lOYMT2SdrV5tcX2smZDHMd2mGbpoUaaoExqsJLkKOOuqU5maRbn4MQThFdwgYs
         9gWw==
X-Gm-Message-State: AOJu0YzNtYStOSLLB7EPbuxFZGn9Vcks/wfhrAy59IGiAuEoO+i5/EKr
	YgjyL+jHBW7nueRunra5+Sry4+/qBM0RN0/1XyvFLYPcV3I5CuT1UoxXvynal6YWRRweSHLrq4A
	f
X-Google-Smtp-Source: AGHT+IFFD9x7sB9nYi45SuatcK3nm3r/b/2mNiDyYmVz4CUEGskeJFCnmhPmxmt7IqmyMOGOy6aoZw==
X-Received: by 2002:a05:6a20:daa8:b0:1a9:d27c:3151 with SMTP id adf61e73a8af0-1b8bf0c4483mr12613523637.23.1718453917888;
        Sat, 15 Jun 2024 05:18:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee2d3673dsm4033641a12.69.2024.06.15.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 05:18:37 -0700 (PDT)
Message-ID: <666d869d.630a0220.5ae09.bdbe@mx.google.com>
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
Subject: renesas/next baseline: 62 runs,
 3 regressions (renesas-next-2024-06-07-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 62 runs, 3 regressions (renesas-next-2024-06-07-v6.1=
0-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig | 1          =

imx8mp-evk                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-07-v6.10-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-07-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d1ef2e3bcb03040dfe57f59896a00a69a5eb4b54 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/66631298303cb0447d7e7079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66631298303cb0447d7e7=
07a
        new failure (last pass: renesas-next-2024-06-03-v6.10-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
imx8mp-evk                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/6663487b865678ac577e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6663487b865678ac577e7=
06e
        failing since 9 days (last pass: renesas-next-2024-04-22-v6.9-rc1, =
first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/66633bd7a4e502d36a7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66633bd7a4e502d36a7e7=
06e
        failing since 9 days (last pass: renesas-next-2024-04-22-v6.9-rc1, =
first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =20

