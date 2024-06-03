Return-Path: <linux-renesas-soc+bounces-5772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D868D8089
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 13:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CE71C218F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 11:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F9680039;
	Mon,  3 Jun 2024 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1cROprAR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4AA7E0FC
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412724; cv=none; b=B3ks+A5/shnk7WnJBJG/LEHCIGaiIxfkz6gB6c4rSbQa8ymwk5vBKAx7VamyLvUOA/evmN/CNgx4HJlzjEbbucbHWUY48AdjBblHBcXT7NjSwNFCQGecRV6O6FowAFpb+KziSW5fYQ3r5bj2bAlInOJSKA36yKcwA/0cP1nIh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412724; c=relaxed/simple;
	bh=64y7rSAjsBh43+P6SBEknf2F7V/P6EY8+pNnzCheytk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ewQ4Lq+KTOaA2kj9SnRZMPHuQDaDCkHce7sUfAsF6Cn7AvfasUMHOsvV9+jHO7+OAlCs7H5VkDT8FUCVWEbQ2zXf5gJ95lppTMnce8tFYB1Z9zvWJ9T+tV6kXOF57T/haHppRuET94beC9O5Ew4A506EQA0OFvJTuK1wQxWh5Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1cROprAR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c1fccb7557so1351547a91.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717412722; x=1718017522; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ccbe3XTcyKtY/NYPHPd1FoVtdCSqeDAXHoKXsLHOt4k=;
        b=1cROprARdlHkZYxEEtMJIZR8bvNLTJtfPL3fdPrDQUAzTkzrornvKdZiaHNHK9IcKR
         9aNZcIOQQUiBLKAypoMjRzi2dYTBV4FpRMiQCOIeTqdvcKhsXTFQY3GgIqiDY3q8vpLk
         xsW3J1zim6Bb1hBwnFryevSUZ0BfmGtHuR2mgztMWKs5vL70Jnx2oZbnvGZiDhEtCG4s
         EBZHMlRJBDk2doV+6df4trlTHXd9ioEClQ6e7rLNDKPBGo3v6cLge586WfYH9lS9mRai
         9fRdp8WSH/wG7Rmi/edq7FtQ8sarzLpmdkFapJlU3fIKt0CVoG5G21ta4SWcxmi4ldnL
         MRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717412722; x=1718017522;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccbe3XTcyKtY/NYPHPd1FoVtdCSqeDAXHoKXsLHOt4k=;
        b=lzvHa6QDLRlaz5DxtRSvFo2WxYu9n6rsGhnB0bq0dHwVLjyHkktESwR13vKrckLMgw
         DpG5d2waBcHAVhjNNJc4MS7nND7wuADyNhXQy2Uri9qWEZSZcyifxwK62frdRq8F9VeG
         53h3b+7QcIBgy0epAmd09LEeSwUGNEhxou1l4f/6AViAjo0XtxiM+eeuIxbkEN18ZEWi
         xWn7gjhXO06+dQ3UuM1+a4tb/VbLS/ouVBUXQZP0XK0oG2I5Y2+H3/aY7W2QJh2mvN6s
         Wo5dpL74ycfZbbmApokzX5P2IZgV8vlj7ziXfJeS6J0k+U3bb+u0n/5kcD3Tv97YeRql
         4TgA==
X-Gm-Message-State: AOJu0YzjcWOJ6ezR2xUjgFbiWkQ40p041NhZ56t7XoHLdb0YoIU5W/rv
	nJrVsrOdu/JU+zyRjk0XiTKvWWQfpMcDfNSIwjei09HwQhJz4ZV70wMUquFiZzL0gvyFxxqHcrW
	2
X-Google-Smtp-Source: AGHT+IHxAS/UB/t5Tskr1EGWdj58P41I5jPSLYqm9k40t6anefEyL6RyrXos/3RLFzZHyLZwHSv67w==
X-Received: by 2002:a17:90b:2c8e:b0:2bf:8ce5:dc51 with SMTP id 98e67ed59e1d1-2c1dc5bf29cmr8512369a91.35.1717412722445;
        Mon, 03 Jun 2024 04:05:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c27cb3cbsm5984914a91.17.2024.06.03.04.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:05:22 -0700 (PDT)
Message-ID: <665da372.170a0220.170c9a.e1b7@mx.google.com>
Date: Mon, 03 Jun 2024 04:05:22 -0700 (PDT)
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
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2024-06-03-v6.10-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2024-=
06-03-v6.10-rc2)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-03-v6.10-rc2/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-03-v6.10-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      20cdf993456075f40d0b9dc1ed78a669f7635037

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


  Details:     https://kernelci.org/test/plan/id/665d99b1f8607c1baf7e7089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3=
399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3=
399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240313.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/665d99b1f8607=
c1baf7e708a
        failing since 119 days (last pass: renesas-devel-2024-01-31-v6.8-rc=
2, first fail: renesas-devel-2024-02-05-v6.8-rc3) =

 =20

