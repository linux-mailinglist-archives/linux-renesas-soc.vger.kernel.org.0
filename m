Return-Path: <linux-renesas-soc+bounces-6742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0491692D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 15:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B3CD28312A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 13:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA7215FA7C;
	Tue, 25 Jun 2024 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Z7+jwPl8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C333158A00
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719322876; cv=none; b=MzYjcGmRrUdY/Ux+udu7kk6ZGQnC2WcixE420552MhHNP+T8S6bUGG8zFggImmRI01ptbpx1aXQQNz+HThYMgaYDwnDcuFFGCm1RnT6vefKyaGsAMhdco1HrtQK3u5NwksdS8cWUxV4pDyaTcFHKxrQez8+CfsmUQZES3kdtgkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719322876; c=relaxed/simple;
	bh=2Zx6Xl4w3RbWYBZZio1x2vvq9QMYT5lyyZX00YKJmwU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=G1nQ261CfoEGRLckzNQGJ+UZ1NZI1LRMARIkwBiuaDtmRMecyBFjRVk5ysJOp3SfzGITMtwnmHddFp4+1XJJzG+iEa177SJ+sO2SRFIEXdFE9SL6vtXbf+Rgv/8CEbJQrj0JdnkQI27/veaFhvzn09ja8Up4kmRK0JApDcW0uxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Z7+jwPl8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7067a2e9607so2118981b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719322874; x=1719927674; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z53sVRWzgQGcRCmycETe5xr4aZ8ZGwALtFxtuh42ndE=;
        b=Z7+jwPl8M+UPpWcJYnll8f432u1T+YSSHQTQrDwEkLtYsC6dSyds7zuEPBGCzGzA1C
         bhZVNswYS9/QrXrfpOKyFLEWmj3/uNybIeNn4ObEK3NdncKKkP7goVMSUJ+n6DiWYlZk
         uT5fKkeJLrJ8a0LX6I+q016PglQhnZbQNaMRhBwQuDZHRvRCaCciRGeBQh7l0NW9M84H
         o+vSDBpoKcS1+DqYmqzupTdvxxLt+lOb4xQOuCpymKskR1yDtqghzPTQdSg0vxd+mgur
         ZV6B0KQnfPXpgON6S28cnGvZjYieq5fGltl5NMfv7W2KzF+zT1zTxhE9fB+lF5NDOqsR
         5N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719322874; x=1719927674;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z53sVRWzgQGcRCmycETe5xr4aZ8ZGwALtFxtuh42ndE=;
        b=hR1Fkno2vU4p+CNJCsnjr749ZqM79IPMH4UWrORJSOT9yYhv6VCIQ74C1TFvsLvoMc
         ZrCilxF+3xBquia01wlkoqWmGKahMEbjPiDU5ZlzC1fIypeUGkU0uEJ1AdJDEfaGcEHv
         2y5I2YvW2GxbLg4uTlTQHhxpT/ZBy+MZIoPsCVnHvi7g3Gj/i2+Wdk+0Oggexl2nEaqo
         8vA2aTwnK5GyYO2lHHf96Y1oZf6/Yfwav8arPRTnP1gq4iMnCGkzYIT0hc5OedGpN0fj
         tAWFRVt9OF3ufg135pZsfEtA+K2HIst/kRzVmRQKBuD3Z/OgefJZUTgHqTzRW+0XZ/WF
         cYhw==
X-Gm-Message-State: AOJu0Yxj8FbuVpYdB6T5GtIElTQZIGthKFo2CfcFx1i1dlK4H2kgMlHv
	qpflh6ATiHFNpxaB0ABEkScdoK05h1JBtAQ6CWO+dJZf29O2EeHK37qvyIilSLvUmJECMPXkRzy
	Y
X-Google-Smtp-Source: AGHT+IGfJr3z9eGuvG5jF0vMXT9ifa1ue9Pb0yGDoHl3Mql8SbOHYUPmPIQropDXaT2qPVYFsH5xzg==
X-Received: by 2002:a05:6a20:da9d:b0:1bd:26fc:e310 with SMTP id adf61e73a8af0-1bd26fce390mr650238637.61.1719322874102;
        Tue, 25 Jun 2024 06:41:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dcf1f6sm8710489a91.52.2024.06.25.06.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 06:41:13 -0700 (PDT)
Message-ID: <667ac8f9.170a0220.52d9b.6234@mx.google.com>
Date: Tue, 25 Jun 2024 06:41:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-25-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 17 runs,
 1 regressions (renesas-next-2024-06-25-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 17 runs, 1 regressions (renesas-next-2024-06-25-=
v6.10-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-25-v6.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-25-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      185dd99f8f203a8cbaa177af37a9ebdbbdec46be =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/667a96fd61a272ecb37e706e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-25-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-25-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667a96fd61a272ecb=
37e706f
        failing since 154 days (last pass: renesas-next-2023-11-28-v6.7-rc1=
, first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

