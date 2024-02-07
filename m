Return-Path: <linux-renesas-soc+bounces-2413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76984C300
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 04:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2701C217DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 03:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C9AFC0E;
	Wed,  7 Feb 2024 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="XKz2plV5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D5FC0B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 03:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707275959; cv=none; b=aGIuTU6lsjHQrPkhweagp0ZByeP0SGmwEIKFi9ilplV5wvfQMyWRZmqYCTjcqnPpCylBytftho+1/bHUMHtw886wismW8gZ72I1cVFEDif//hqqN4EAKMjf6q92b5AbqYDj5qaZuO7f23UetFtBWLJSScjYJTDkyZuGUvagbKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707275959; c=relaxed/simple;
	bh=X0eJtkJNTx5FOZyjg2j6mmYDbqwiwGdbCE08zqSL3kA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=E7/r+3ZmKZN1CNICRXAPrEMWr4WszQ2k51VXLU980iDO7MBLVO43l0hf+h1WhiDdWVxfbfCRWsf+UnfbN6HzVTETklUm1Mba1+cSals18pgAVWENxsehoaZEnyxYM4GgpwkYYFJV2tZxSizU4tTPuGeStoLlp43QOoyY80PtWtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=XKz2plV5; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bfcbfbfd92so102896b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 19:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707275956; x=1707880756; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bSPoW8hernelAfi+Lt2ZO6VPZRM6QLEZcjEDM3KbeZU=;
        b=XKz2plV5eDf8+SPci9Fml6B0yXC+6Z7ZHq8u0uuKslIN9eUS0XDgmUa+y6Gfd18w+a
         Ckpg3HKlc88oDyTh0c8ttBsq6KZL0bAPAmJ8GZGpLtM9dUx7kBU9HYURkPjQ7hcQfwrt
         oLl+b7mSukxEh5Dnr/uYKW1K3MzGIGoT600/7vrrKde/7y/rUbT9/jKklQNmKWTbpyA1
         QsjclvBTjjyFh50D1FEwk/kPqKqsndyK/c54k37Q3n0NiSyXoGnP/0sn6jggM78sYaKV
         8EReWhwiRFawvr1QsP/V9gmEeOmMt730UsrEABAAPXflu/tYYO3/HJtxKgOWPcOgp/sm
         mv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707275956; x=1707880756;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSPoW8hernelAfi+Lt2ZO6VPZRM6QLEZcjEDM3KbeZU=;
        b=CU0O8QrKYa1LATevk6E650+9XRkw0lDKvvoOKFdWfUn6a2Ps54rllFAtF1XKe+537I
         u5Y0iL7hJ6cP9uQlsLdQznyOFNXhoDZmUwMNGR00hmJjgJDxgFTJbMUggJC80+jO3YhA
         McOs6HOMvMZGaaf0Na9RHjlKqeqnCgiaP30OyFZIaQUo4Y26g6mbt0iMfn/TRQU8Fqrs
         TjWtjN7txmB42LQ0HmkrbktCvhfpwsjexfaw1iuedM7QK7cyOaA6USHEmC21sgpGWslq
         Saqkhjn5yivp808wLt+Aku/bKW5Vj7ypfuT2t/riGD9k9u1m4CCKjgZw7sLkYnh5r8VX
         aBbA==
X-Gm-Message-State: AOJu0YxFCfbUkfNQ6CMz7k6b2CIa4j2TpYMIomCISen7+nYs6OL4XfNl
	Q4zVBGcoxzcm6LR+Kf+SIyavE71pCfLw5Ua2feK1ubjrTioAvPCPvEBCoduRCsQCyqkdkMf6kp2
	a
X-Google-Smtp-Source: AGHT+IEA4vNxfhfZyO6NrkjURqrmSrIU1xpJ24mj0oX1DjJT3I8n6E+QjgJ2EEi8tnQUrEouRabueA==
X-Received: by 2002:a05:6808:3205:b0:3bf:e956:173f with SMTP id cb5-20020a056808320500b003bfe956173fmr1363532oib.50.1707275956607;
        Tue, 06 Feb 2024 19:19:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRKcU/wof/93AoPR5zeNvQH6Nt+Fa6hilSlMZ1iPom9TOoovfSC6t8sfv6JnKsAnIpdcJ+GkrwhJYWnC052EkodXQNwW/rkP+jSg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f34-20020a056a000b2200b006e04490fa73sm264879pfu.206.2024.02.06.19.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 19:19:16 -0800 (PST)
Message-ID: <65c2f6b4.050a0220.bb993.0f72@mx.google.com>
Date: Tue, 06 Feb 2024 19:19:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2024-02-06-v6.8-rc1
Subject: renesas/next baseline-nfs: 21 runs,
 1 regressions (renesas-next-2024-02-06-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 21 runs, 1 regressions (renesas-next-2024-02-06-=
v6.8-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-06-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-06-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      91487349a9c3f75c983229f900978df1d14e7ff2 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65c2c67b15ab961f028e21ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65c2c67b15ab961f0=
28e21cf
        failing since 15 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

