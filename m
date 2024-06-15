Return-Path: <linux-renesas-soc+bounces-6273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B39A90977F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 11:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992B41F2236C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BFE25777;
	Sat, 15 Jun 2024 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="16JHC9Dz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9238FB9
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718444921; cv=none; b=JHhTMZXUby8o0MOjJNDan0QIv5kVcvlZ3rzUvkbdg3J9uK3tNUDQky9lRb8KGREi+73HS8DRYO0JZi4gND1Y2zT2wuaLMSw5kFL7ZTr21E4qdmE3NSlRBOuh23hAECc3TH8atzujEHOHjqWGBPIpB93R06/UpQovtiY4PEAsq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718444921; c=relaxed/simple;
	bh=qS0Prk98FvHCapS13NVdcYk7PZgvAZz4fZsQsFOzi+I=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Z1oOH/Zx7UP5B3kOaKzLRAJlyqFQR0E5+FcIEMhbj17i6mxgJZOKTLBQQ9XGfy8W/NZXgKkVletyovSyn/UjtlYDHy/UyjbRbdkFLuRgC5X3NiG5gL4jQ7alW63vmTXhU1YNtgZriRjv51vXUj10IUhjobvOTQnn67VIRyRX5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=16JHC9Dz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f47f07acd3so26164735ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718444918; x=1719049718; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8e4Ep3xUlMWBmdTtRkSrd7gwhOvzKlu5j/hk/dg2dMc=;
        b=16JHC9Dz21ztPMitjriqm75lDrYIFIcKdDsmZozEMoWhqcV6P8Fm7yu9Exypa70T6R
         OBGGmZ8hO+65zWXizrzq6kx4lgqWpEWLt0VtMZ9CAe2RLFjAIaF5D2CucncFI8ZveKJx
         OYWN8d0RGWdMOyjSlrwbvjeu507izxxVtqW4X1GIUmygRzThh0lgO8hh9z39k5g4YyZq
         DqFCnXyPGjx+wQhJrRt1jV/nHz0hpvz2suAOvSH2rZe22Ae0goADxHECk3i5q3QeYftH
         TVqqR1RwbfcXEEe7S9qx3CrivmExktcB0jturVT2NsCg9ngpe5fdNTp3BByjh6j8Y+q1
         koXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718444918; x=1719049718;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8e4Ep3xUlMWBmdTtRkSrd7gwhOvzKlu5j/hk/dg2dMc=;
        b=lj9b0EYRO00nu8po+h3fXbphZnttAfmy3JUaIOYZcJqQNzB3UCebkFVtmy0iLa3b1U
         6y3Mx8tAZ3gX0RnEQubJh0G3RgszTmUC+/UvFPodm59jW8rSxO7vPW86CHK/JqlRUjOk
         7N24HNGG/7LfzaXp/81GfQlHR/+F4RJ2eMeXEUn8FD5cA6MATJv/FxSO2Hy/iRSv94UL
         JN5Fs5MV4Xe5Pyh8GFqPeQWWZpuFvdIA0H8b/t19XMsgVU8wAZwWWP06CEcN0BzK8j3n
         4ZGp7vwP5UkpK/9Mq+NhEVPav5VpRfi6E29K0uKbjq63uMSPBye5lWWPidWG1rGL7eNk
         HXPw==
X-Gm-Message-State: AOJu0YyAW6viZzWMnrlRIpT5dGtRWcuU3lYefr6vvBOCuYE9BIlOU9NF
	Z5FFzdjLNAmVmNRxHyMmBDN+QOee6XOGPCVVs9RqAaC2rVtzKUVA+oBVQ1onzfeJNInCRWBUUwU
	s
X-Google-Smtp-Source: AGHT+IEBEiYeQonzzupqDidSO0nV4zuSPanuvUNrXinYLyJuYJNjoP37OprxyJe40hJkhefqRGvDTw==
X-Received: by 2002:a17:903:1250:b0:1f7:2050:9a76 with SMTP id d9443c01a7336-1f8625c0d68mr59204445ad.8.1718444918278;
        Sat, 15 Jun 2024 02:48:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e56133sm46412915ad.8.2024.06.15.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 02:48:37 -0700 (PDT)
Message-ID: <666d6375.170a0220.42677.dcec@mx.google.com>
Date: Sat, 15 Jun 2024 02:48:37 -0700 (PDT)
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
Subject: renesas/next igt-gpu-panfrost: 3 runs,
 1 regressions (renesas-next-2024-06-07-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next igt-gpu-panfrost: 3 runs, 1 regressions (renesas-next-2024-06-=
07-v6.10-rc1)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-07-v6.10-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-07-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d1ef2e3bcb03040dfe57f59896a00a69a5eb4b54

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  c8f327ce9cb504a6c2185487d576be3d5254556a
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  a44ebfe43edc96acab22a19b6a8850eef9202eea =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/666d5820ba037494c47e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240313.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/666d5820ba037=
494c47e7073
        failing since 129 days (last pass: renesas-next-2024-01-31-v6.8-rc1=
, first fail: renesas-next-2024-02-06-v6.8-rc1) =

 =20

