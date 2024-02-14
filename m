Return-Path: <linux-renesas-soc+bounces-2737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C648541A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 03:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 570C21F230F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 02:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246B6127;
	Wed, 14 Feb 2024 02:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FQ5PozjM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49CE4C9F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707879379; cv=none; b=LwDgQpNeI9ecZNNWk5XBb7c4UYbfLNgOQlShA4DyKAUDb3BvA0/VNSvJ0s8ENkOIkx+H0tuJwVvQtKqFTwQ0wl+ZkWeC8eu6QGFuiM9EhwxFIlmDKV0CiOBlYeyn8/+cjOfdOPgP/JRfrveQONu9wJMj6WJZgEL+EjMI3WDyJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707879379; c=relaxed/simple;
	bh=oawCNjCkLl33WbFY7MUzSCooaAwpg+W90Sy9ERHZrM4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=rnN4+CiKXSAP7a3K0dQT6HIYalDKs5pGzGUTgdFmpDFy3XZulXahI0Ay/sV34q+jxoML9OHu33hVmfJRm2C8edkNV6rhFEQpWf9iyi81JOSt1seKdUPjDOsx1sinzZsZBfY9YOiPEmZQ994f+XB8apVvaB9+6sjobU8gzLepedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FQ5PozjM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d8aadc624dso38018835ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 18:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707879376; x=1708484176; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+iYN6y8CPpNGAm5MpCFHrI73aEM7KnWJ7DRwOiV0/i8=;
        b=FQ5PozjM9kznj8zLD9Nxf8fM0VSultOoMI1XWyJLJF8GDnmiF+JhduYs0UnxNO0u8T
         JKqPH2jFUXlCT4E/dI/CXe25sVJbB+KYiVJNDjsj/gIC0fNkzRuniuoPFlQFIViZT+uU
         KISpZes2J8JcO4v7sH0iC26OjdODH7lmDCSgyZl78uzl22VN9Nn3oe7AeSgOSqfXd+w7
         3S+3wf1vS7npvZXBkvKSHfDodvLncSUXoABnKITD/s23ra1NVWkmaAba7UC8OYZ9Amd0
         46tA4n9LqbiJXAA7KN2MnjKD5GGFGJbpZ5vkP87dAYj8cfICahE8xp0I5JTfDmkjG6WD
         QvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707879376; x=1708484176;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iYN6y8CPpNGAm5MpCFHrI73aEM7KnWJ7DRwOiV0/i8=;
        b=dttI23QNv4/d+BqhrafSh7ejFmsBBgxi7leojP7w2Tux+ufQ+8HSAtzBI8xsgj2KEk
         g+4U+oydZhc2CADfwmjOQc3Q5cGo6dY4O8F9j4kiRyjm4MQcrCs8gWy4tU6Ykv4bhErE
         csOqtI/jXDqTE3+IXEuqzHhfA27c2Jm96S66c3AZRnNkZRqrHvvbTujlFeHwQEUFRJXw
         788BSOOA3ox3oBvaTz7tEwu8Yav1VHHWfJ/Sv99SS5i5P7uWBAqsxrsryJoF3NeruyxZ
         NlSutIZgC0r3UibGkJ6JAK8ve/6mPynvWDW/IoQw1rJZnLKC9JXJR7CD8oPO4wqLmMgJ
         oUrQ==
X-Gm-Message-State: AOJu0Yx+5ekBGX2u+MW9WpMXgvNwVSquPXrszTFc4bQ4YunBAYHSbjbd
	edBipOILUqg4qaqyXA+XxQsMRo/pMJrEHb5egRuTXE39X4F+3FuoDgQ+CADkbfGxWpJqCb+2itg
	+ooI=
X-Google-Smtp-Source: AGHT+IEuX/65JGSD553XAF1fsGIPtldsr8INKo02qGDLEjx6YK/jWwCM8HT6qqsb+qkBPviQSiTasw==
X-Received: by 2002:a17:902:cecf:b0:1d9:c20b:1d54 with SMTP id d15-20020a170902cecf00b001d9c20b1d54mr1892465plg.19.1707879376649;
        Tue, 13 Feb 2024 18:56:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXz+OXzVZlrZii1mQEO4VPIvT2VqRupaD71Wzwj7JjnzPpbQfmEG+CEDVONpMon/Ctj08aqnv4+shnZzGo8J5Hl/mTONhT9bRPqDA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s15-20020a170903320f00b001da105d6a83sm2727578plh.224.2024.02.13.18.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 18:56:16 -0800 (PST)
Message-ID: <65cc2bd0.170a0220.2b58f.a022@mx.google.com>
Date: Tue, 13 Feb 2024 18:56:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2024-02-13-v6.8-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 19 runs,
 1 regressions (renesas-devel-2024-02-13-v6.8-rc4)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 19 runs, 1 regressions (renesas-devel-2024-02-=
13-v6.8-rc4)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-13-v6.8-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-13-v6.8-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f06417c37fba23ac48fa23f2d7383c6336788333 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65cbfb863d347ea87763710c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-13-v6.8-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-13-v6.8-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65cbfb863d347ea87=
763710d
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

