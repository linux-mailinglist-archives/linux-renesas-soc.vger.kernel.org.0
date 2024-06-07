Return-Path: <linux-renesas-soc+bounces-5966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2155F900B47
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 19:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C30FB1F23943
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 17:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F4419B3CC;
	Fri,  7 Jun 2024 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HXJrUf2m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BBF195808
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717781430; cv=none; b=F9vIQQMQt3s1YqzLy6RAjhewlclNNO8nCKBZFUhZcB8RF8QbwYQHjXYzPyS/X8ct/03htaRw1McPAMzix4HgAfIiIS5K/F9AxLSLe8W7epzsYDy6Xq4McWgibjuRu3WMFKKBDfsqnYqp3PtcEzOewtHXWM3OV7D5+vPQLOFdsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717781430; c=relaxed/simple;
	bh=UpZB4VNzDEW9KZm2fi2fMyrbDOFhNEijDJxzXMUCX6E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=k32J+KcurSrbX1LJ8c6FDsNLkTPU0pKmZsg2zcueTgj9Ql6zbdUU1wPPxUf4r5v+ubnb5HvUjzbAt4WZ0b/0lIxvwQMrI8CwSjHJTDlsgzZnpSxdMCK9SVjOuBx5o6N9zBIqiE+M00ENiwxPzNN2FHCkT0ZT6RZkHeDlbUT4Brs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HXJrUf2m; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-704090c11easo1312963b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jun 2024 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717781428; x=1718386228; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6kam2LcxwvUcKZ97vygfnWkNZniXPWC5Vf/d3RpUCfY=;
        b=HXJrUf2mgSBg9dlUa/PNERSreiPpRUghVGDtMcdAr8FLvfbW+ZJ45Zdp6rrEiyVHGI
         lpYAXJdeZSUTD7AQ7DxD+ZdgSFdHWvANhi/3rZ7qJPHLxOCbM4EKmHWpMgPswslJBNMK
         CrvDwwORX0wzLdNMgktn667V+x3NaA8LsPm6vJ6UB3l962dhTExLwi9O3Wx0WteY0aiR
         H0ruBlN3hjfDVLCpNXIKTMPfkV6iFUTRF7OAoWCRDEnW9uOR5dv+F5q3HnJqCvqACG2s
         hiEBLcPRNHFSXdhk/VRSWrMt8cajbyLiEMJt8/nzy+5z8DOWJfmIisxm6AJgZkPdzLjE
         Q4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717781428; x=1718386228;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kam2LcxwvUcKZ97vygfnWkNZniXPWC5Vf/d3RpUCfY=;
        b=Phr7cLXdszUU8owbadOzu3gog/1Bbnxf8j7YQNv9khKwPZl6360dMClvP4SI05mtim
         3AfbClBnpdwDgA0TTNgVmCOvONh3FGkFqxI5cwkmYc4LVA+/2hJD3G6/1aI3Xsz0C9Wv
         mj3J1HKpZBqCUn8TlqJqCE2dODc1Z26RuI9jP8pHGmEICx2xeBkF17JU/jyODOoC5AKN
         BbbEsq5euSUZR8YmoeM4T9jN29kgdeCxRyROwyuUjbV4xP6nmJaHnA406cwV80AQAfc4
         XVEN+W1VdiB3sY1K51zLfW8J5z+Y7YNho9coBiVw90wfi4NW4TmLR8c/VDns/P+r6sSx
         F86Q==
X-Gm-Message-State: AOJu0Yx60sH+BBwmxrB1Ii8LgMPOIZoqYJSjUhQeEIZtORhLCan/pWlJ
	BHGzno9fbTZfpheHI9nSGezgMfxSPm1D4RUeVMZiecZz+41XfEoV9KOFQzO78FpCGAq3hjsnjuU
	9
X-Google-Smtp-Source: AGHT+IEqry5GVZ+V6Rax9BiVxeh9IRe5oSKV1FOIevzeQPavBKHNNhK3/dcm3xJbzqy+FyUgUw0EyA==
X-Received: by 2002:a05:6a20:9151:b0:1b2:2893:4c2a with SMTP id adf61e73a8af0-1b2f96b370fmr3696320637.5.1717781427686;
        Fri, 07 Jun 2024 10:30:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e0438sm36707395ad.185.2024.06.07.10.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:30:27 -0700 (PDT)
Message-ID: <666343b3.170a0220.10a696.9fef@mx.google.com>
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
Subject: renesas/next baseline: 59 runs,
 1 regressions (renesas-next-2024-06-07-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 59 runs, 1 regressions (renesas-next-2024-06-07-v6.1=
0-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


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



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


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

