Return-Path: <linux-renesas-soc+bounces-6846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12891AFE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 21:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7741C2207A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 19:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ACD19A28C;
	Thu, 27 Jun 2024 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wZ2PsEy8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3DF33C9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719518128; cv=none; b=rDBiJdUUf5kuXSvfIyHgIAoMUs1Wn80JQQ7UlAc2QQDRTxmaae50Cb7jD/i0KuRhPICoOfbvYNRxSO2yifmY+TB5EPBYf2UQQwspINOdMx71S18B56yzxqBTzYfAmww2yN+HYX/eIkQzlSQaLI/qW195RCmuECtqJ2DmRSC2KE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719518128; c=relaxed/simple;
	bh=X3o0RA7nb99R9CfFLkz+KK5XkO+HUQ8LwZfaha3/6Gs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uRRDmLOS7iUtTtYQN/H0eRSJ9k6S54RYhcbERCh4zo96xuw9AK3+pV68rh4sp4ii8EDqIo1Cpsx3Zw4lgtdPD1rKQxFZQ36F/0DZ/fRIK40k5rm7FsBatEYjQ1FLMYFt6+qNXdxk79+RcXDKRsCyOmK/WsYnjyvd5Vj6s5+93ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wZ2PsEy8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f9de13d6baso60995065ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719518126; x=1720122926; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dTbLFu0wsTeRWQghM3Bo+3mY7UR/cZvWoGDcwtU37SE=;
        b=wZ2PsEy8hudFjeaI1N3iq+Nvla1Xj8Dmnm/qHaEyVL/oriJx+HtVmBG09nQOqjzbXg
         vtOYPMh6AI71MpHz10PgA0BQUI6DbwwPqQoKHCDsJPHe2xYFwa9yxujNDfT1yPdL6an3
         kNdAPe8Nj9ERKmGaVCn2HHi3qRcumRwsbgYqMR+Li8i1DpT4N8F+qMPg11vGozBhnoad
         U20uchqsOS3EjvcPKFFeSHttU6GbwrGQ3DOwSFZ7oxDz1fK0B1x20MLwlR4YRbRUEy7q
         zVUyna96sRyjfbNmG/7An8nI4UP1KXB5zMJycDhuPE9kyZ7Haeh8jEnBOQ7QDnIU4Df8
         0bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719518126; x=1720122926;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTbLFu0wsTeRWQghM3Bo+3mY7UR/cZvWoGDcwtU37SE=;
        b=C7yI5WrzD8Q/dHDg8cIi0irvf7AmXaeUSxyGjb4A48Ym9WmjDNd1XXETjhtN87QD5g
         IvH4GJWaCYaYOpl9jBK5gb2SOW9a/c6f65s7MYNwITd2hxlntEiWZ9XzhZR/jUquf0Qc
         mOXD2GsueEgREftf6i1DsoQW40T0+9hM+A4y7C5mZy8SFtgEldfyGkdco3YRDruB1giq
         Z7yWtc6og89mrbKGmEeNBD7AI8Ot4iEpITv9RNeMhbg0nA42HER2ndDOdsBnm2pdkvz7
         h3DxjKe96n14dySBNEv8tiQvy5/7AXXpajm6syF2k2Yo3AOHD+JS4cMifSQDq6YODRmk
         FCqg==
X-Gm-Message-State: AOJu0Yw9I89IFS4UZmAUxt4G+nDLZNGjJSikvBLYyeJ/jzSsGFnvBeF1
	5u0bOKbuvoBYzfzUbWQ49tumchaj9cxNJGts36kdjB/RTsOyDEbO62KXB7fhf97aSq+K/t6npGq
	w
X-Google-Smtp-Source: AGHT+IEdET9e9OXnNLVMd5iAf24haykuqaGwHhrvzLRbugeemQJmIgnRGX2pvxpQXECSHmSAEke2dQ==
X-Received: by 2002:a17:903:41cd:b0:1fa:1274:946c with SMTP id d9443c01a7336-1fa23f2283emr162911805ad.2.1719518125870;
        Thu, 27 Jun 2024 12:55:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1535cb2sm1432825ad.128.2024.06.27.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 12:55:25 -0700 (PDT)
Message-ID: <667dc3ad.170a0220.64d63.0f03@mx.google.com>
Date: Thu, 27 Jun 2024 12:55:25 -0700 (PDT)
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
Subject: renesas/next ltp-ipc: 4 runs,
 1 regressions (renesas-next-2024-06-27-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next ltp-ipc: 4 runs, 1 regressions (renesas-next-2024-06-27-v6.10-=
rc1)

Regressions Summary
-------------------

platform          | arch  | lab         | compiler | defconfig | regressions
------------------+-------+-------------+----------+-----------+------------
qemu_smp8_riscv64 | riscv | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-27-v6.10-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-27-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      91aa9e4e18c70bc2160b63e403932a83226dfc67

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3f0b2176930cf15a26597e28abf4356050136bbe =



Test Regressions
---------------- =



platform          | arch  | lab         | compiler | defconfig | regressions
------------------+-------+-------------+----------+-----------+------------
qemu_smp8_riscv64 | riscv | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/667db71362adc88e8a7e7091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/riscv/defconfig/gcc-10/lab-broonie/ltp-ipc-qemu_smp8_riscv=
64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/riscv/defconfig/gcc-10/lab-broonie/ltp-ipc-qemu_smp8_riscv=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/sid-ltp/202=
30623.0/riscv64/rootfs.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/667db71362adc88e8a7e70=
92
        new failure (last pass: renesas-next-2024-06-25-v6.10-rc1) =

 =20

