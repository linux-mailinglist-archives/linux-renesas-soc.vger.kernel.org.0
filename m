Return-Path: <linux-renesas-soc+bounces-5783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E298D840C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 15:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F56D28E485
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 13:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A51215C3;
	Mon,  3 Jun 2024 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="OcsuRUAf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F712D766
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421725; cv=none; b=EDKQkhEbfLgE0J3P/HEtobsqUt8jf0nZEIALEqvr1sJbyZlByiKJqkg1mG/UM794hMvUE+MCYrV17/+L9nREHQk5OmE+TdGFN9U3vwo0qHg7vWISPFS+/zwdfyJfHzt3rKCgt1rk7uRM+/U6X6Th2pSc4ksFKKa76q1QuPo/bQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421725; c=relaxed/simple;
	bh=R7DZ2t36KkuleGaKVajSA6JqZRAZV5B3ofdgn+MnbUE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Uh24a4GGrpJy5132/xSnbdMeriDQBBf5QDd7iVKauvEzQZhyZDFxOHVtbHgO91RiqtWLHpI01/lDyZmiKniAM4ecMo5i9RmMl2RUFjtfxCA2Ez09E6+/iRmMhUDTlmb6tEZfPeKxk0dhAjFmYpUBGiJxO96KlO8XSWkUj4fChLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=OcsuRUAf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f68834bfdfso3234775ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717421723; x=1718026523; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rwrYlk7IKrnEuzTKhKmqj/UVLA9xO3oUQZlRK0xiiQs=;
        b=OcsuRUAfWXIBAUHZYerMqJW+ML/YFpqZITukJ+QYS3r5fPgoziM7Gx3FnWf0ZG/M4s
         ICl6hxOhxN1c5R9OxCsY+O9wsjH4T4UwIvMvzRLPUC2K9HvIOU/7zsyRgK6RC9gbxl//
         xMubdT48TU3bXeplYJVa23u+aI1ataakPPSEAM9LILl9HOTzVLwnNmabSjJuMI4TDC1h
         5LXinVZsG6BIeUgKC+oe0xPrzylVfwDvrCqvs/6w288Iil+INNvJFMIrR9rYiBo/Y/kt
         1Ll3zU70yPFhHIuahHi74JVijGwJbxVLYlXwYZugiZ9FYyXfmOiiMw3XPkVZW2H1i/MW
         ovrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421723; x=1718026523;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwrYlk7IKrnEuzTKhKmqj/UVLA9xO3oUQZlRK0xiiQs=;
        b=a9ZC1lxYvenj5B9/QbredAAVuJXLeZP0F77EltTMOmA32GPRqWQoo1ZAT06jlS75v8
         xUmhZd6lw8ektva8kKVkQZM2FFKIF3TZHlo2W8JxT95Bou7zHgPr1wuKAk9bs369Sw05
         quMt4PP44hdQDhsYGC2tneR8PiSlRjGK5F1Eg3ZWD6hB/6+wPjbIacKxVNBqHKXJTBQF
         y95FVNDdAbJLLp1+YAzKN7ItXwImeVcv+Ck5htTmEfsY2Z4cluorAmbVH62yj9wVx2CA
         QV1dd0DRMu81QyVPIGWXSYqlSZr7ukS6tmg1SCAKcSCbccI6Xelv8pm9p+41iGsVAQ2W
         DnRQ==
X-Gm-Message-State: AOJu0YwWvJKx5Oa0m7JAHGFGnt5MI/c115JR7HoUmrbaTn99zKppr+d4
	2/v7L4QCfDJOph0oTc7HG+9X8xxBnUEsiBw5AlBZmLyh7rbAkhWlR9ePYUyNhr5ZNpQU+/Tv1Vx
	Y
X-Google-Smtp-Source: AGHT+IE95bRyjxEFvXDhPF4bcR7QNgRLgILZMrLo3a67cD1XPqqWyUr3YSqVjSuD4gAbnLJs16g+KQ==
X-Received: by 2002:a17:902:db08:b0:1f6:326b:cde0 with SMTP id d9443c01a7336-1f63701ec3amr100640535ad.31.1717421722580;
        Mon, 03 Jun 2024 06:35:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f66ae5495fsm28361655ad.18.2024.06.03.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:35:22 -0700 (PDT)
Message-ID: <665dc69a.170a0220.21aa6d.5ec4@mx.google.com>
Date: Mon, 03 Jun 2024 06:35:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-03-v6.10-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2024-06-03-v6.10-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2024-06-=
03-v6.10-rc2)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-03-v6.10-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-03-v6.10-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      20cdf993456075f40d0b9dc1ed78a669f7635037 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/665da213eb21b5d0eb7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/665da213eb21b5d0e=
b7e7070
        new failure (last pass: renesas-devel-2024-05-13-v6.9) =

 =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/665d9828879d934a0d7e7071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/665d9828879d934a0=
d7e7072
        failing since 133 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

