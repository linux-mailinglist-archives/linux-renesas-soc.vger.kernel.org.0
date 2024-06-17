Return-Path: <linux-renesas-soc+bounces-6332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11790AA68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 11:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C8AB1C22D82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC86195818;
	Mon, 17 Jun 2024 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jOl5iSiK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6B53AD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618076; cv=none; b=MmC1OTUIASga+Qp7ggbdJrujSR/xS9uhrbrVdIN+2ej9JGXRqLjrivJmCwMYjsMAFZgXwPSTbIJGlKC7kEiMFAFqleJMKO/K3XSHLPEmgawff3E9520wDmL7R9+p1IK4un8MvXl1pr1w0gFBAxqzKv2f6ySN7AnXKkGda/a5CsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618076; c=relaxed/simple;
	bh=28pZlD9AR/hW+Jbx1zy/h7GuHsAmsR+Mo9atbJXtnXY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=GVlUox2GqsxtLTIOuGFsmfmnIIpZscT6fZZEWqbhLWTc6qBNkbQltr6pfaJ/RjJXy+g9zR6McoSkz5MB3d7vaIw6NrP9e88yrPT90njwW0OYjcw2ccnlkHiYg+9M7ZJYbi6yiYvR09r+umYw5dduRfqYsLe2uc87SA8QUn+tjYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jOl5iSiK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f717b3f2d8so36688815ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718618073; x=1719222873; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F65WluQdYasiAPGpi/RVMvZaU06JEm8yEV5ehQJkNso=;
        b=jOl5iSiKhl8dffAu2WPyWuwjz/okyUJWxbyqBlTyKD1m/5NTCRTcUSWlL8wUPvYBQU
         RymxRDoGnaKIgnc0jCGcoV3gTPXIRtKSkEG6ApHw8Ubv1QXm+i1138/PMU07/fmsPPlo
         l5rNUOyrQzV4Q1Ow9FYWdhM6K0h1zwWhh2qntadZ/kP5/75v5/52m9+vXwK5ubtAcf7a
         Y5867KNvZd1beMsZSKoobDGsNmqQ7NC7fPK8dxBXE/h9jrxNxmFmZhz7jiKaQE3XgAJL
         KasP2e7p1+ToI2exT0fJ2/gQHrIxUGIvnfjTg7OSYjfR2NvISIhf/23hUxxOyqTVi3nQ
         hz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618073; x=1719222873;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F65WluQdYasiAPGpi/RVMvZaU06JEm8yEV5ehQJkNso=;
        b=HQhYHVF4B3i40XE155z6s3VJuVUSDqnl558V77poGPXk9IVtzW/Dn0hs43kN0s+wbS
         aY6i3FET6mluhesciRKbznNvtPBCKitHz4hMKhpIAqkg+a1qdo/8HJR6wva0/0+YpxgK
         kfm69mfKAOfPYsscYv9V2kfthxWCgSqmkKiJox3AcBW5FUz0A3Bs7GgGrrOJdoUmvLC5
         yjRA83ZHXmeA+fZOHrqDT+0OIDVfaSztlMIs1IyvgNkEGMlkotoZcLrgnZxUlBO/E/wp
         a6awElXa1YwUHApyzKj/CXmMJKfjtf1bB5ZF9no+N35w2PGoYh5i5dmloe82cMK/FXnz
         hJig==
X-Gm-Message-State: AOJu0Yz0xKO8GxrHg3rV/vflvUb2ymsK7z9U86ytcp/usHrO7c3ZoD32
	VV3hSnwi1XuyYtD/TPF3Tfy7Uo9IxASv96RKu/7PJbQ3iBGlRQershmoMlZiN4RnA0WF+KsmmUC
	8Ljw=
X-Google-Smtp-Source: AGHT+IFDiFApmq0MeOb11fs/+PhicarV/9wLbnzlcrkvtYHjHWZriXrLQAZFoR51bkfMjEHIVmFSBw==
X-Received: by 2002:a17:902:ef50:b0:1f8:4a12:ed6e with SMTP id d9443c01a7336-1f84e42e34dmr204854565ad.25.1718618073323;
        Mon, 17 Jun 2024 02:54:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee8331sm75841125ad.141.2024.06.17.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:54:32 -0700 (PDT)
Message-ID: <667007d8.170a0220.cad27.46f2@mx.google.com>
Date: Mon, 17 Jun 2024 02:54:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-17-v6.10-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2024-06-17-v6.10-rc4)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2024-=
06-17-v6.10-rc4)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-17-v6.10-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-17-v6.10-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d94f2b83d8f763608dc1f5c5cdd5e4d262663292

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


  Details:     https://kernelci.org/test/plan/id/666ffca32a7a12bbfe7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-17-v6.10-rc4/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3=
399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-17-v6.10-rc4/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3=
399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240313.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/666ffca32a7a1=
2bbfe7e706e
        new failure (last pass: renesas-devel-2024-06-10-v6.10-rc3) =

 =20

