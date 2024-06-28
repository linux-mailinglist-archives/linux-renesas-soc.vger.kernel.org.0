Return-Path: <linux-renesas-soc+bounces-6881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD191BE91
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 14:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2301028299F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 12:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BDD15749F;
	Fri, 28 Jun 2024 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="T1gqZibp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4890C155A23
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577703; cv=none; b=VXZ/nhm2GaHgE7IUyA1jULtftFZbdP+jX3b8W8w957h0w+qfX/rm9AeeEe9M3nAnFsnbDPEm+MNvpn3G9SZvcoGhhxKfV8221/IKWnJg01oPLZBypWen52G3jHDkAikji9dvEImZFhtaX/IH9E/zcfyEPqJOxMZ4DmeB775zH64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577703; c=relaxed/simple;
	bh=pFsAsXsc0s7KKcC74PtJjj0TPpbq8RqIKrFxz5+rAIs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Blo3eh3ko50vMrjM5mY/T4vXWvvGzEXqfT7BQ0vUjxIQGuIhYP7qjJNvysrY+szpmcvPqwBKtz0aVCTPztz36RQ11NIz7cQ6FnjI1rSAlzkF+absOeGRhvMV+o5LkbkXgpQW+EB7g0brSckVdS4zwm/EagmTAV2m8fwZodp396g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=T1gqZibp; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7f3d2d441e4so14666539f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719577701; x=1720182501; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EgoKvSdzd0zKZ+xe5C0AgPAc6A4w+g48Q9sjjX0gA0w=;
        b=T1gqZibpVK+rouLQcKzPqGHrFhiN3w2eWTFECi8ZX10MzQLsyKE+bxAuG+hO2lIEey
         AMixyT/3PM6700CJEik4pH+l1uo92mtVzQcwpaOO4iAU4EbSKn0DVQRkvNBXXq1tFD9o
         prmm9ez8cZ38sLMnN2W/xn4nXGQCr2kdQ/uwze6ALNF4bQM8kJzO1OVwO9bq/tj2afnd
         Mox3iaMNb2+6ncPritCuMNvaoG1Tc8jmvwKofQhV/lLsOXbOHhFHBtnWW+9OIOPF7tT5
         /Kao2v90BovcSCn+pv5ZqfCi0aG+FpzleVFm0um0FjzajFaAKPSXqT5/vhNNNshl2Owg
         CK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577701; x=1720182501;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgoKvSdzd0zKZ+xe5C0AgPAc6A4w+g48Q9sjjX0gA0w=;
        b=LYRW0iKbeSuJxA7qsyJdV4QZruwdfxViR2l2aqv84BUE7/znFHtAeiQjBVzzyd32VV
         YIWOdZwpeNbLa9P/RVYZ+k6V57HGg15SBb3d04E6g3Oxam+ZLMHb5nEm1GFkBzyOARkb
         oEeogtxwXZcSOIA99y8v7ooo5mGev6zkF9kq2trB9VuHvvC9NRHS5dCG8RLmziPr7yD3
         7K6Ac9a2O6gkQy8h+li6uPcUmLcIOJXy5JqTAYxasRZkfRTfhqNP+N6xjBa/+U/kaE+L
         vXTwxL8dLaSyrKLvv5nHDJMhYnBxNatgVaXPUe1h2mUWTUoWKdLBuNXH194AI6oAZQVq
         3Mxw==
X-Gm-Message-State: AOJu0YzfbQCS058pHhLE5XB5fLQbBfTQDVCvU4seq3gP0EP0EGXweMJq
	3uApARZCcHeRkB70yrqXjujynW19ED3G3Kg/GAS0v0FkYR3LPwHrLuNQMX+U/VJYcIGYhEoBu5C
	d
X-Google-Smtp-Source: AGHT+IF+eKKaXIACJE+m/GY5E52FFEsIFZnHhAxQKfsUHXk/fBC+PIH2qv1Gr+cAVznNTumOqx0FKA==
X-Received: by 2002:a05:6602:60cd:b0:7eb:8d08:e9ee with SMTP id ca18e2360f4ac-7f3a753482cmr2110584239f.10.1719577700926;
        Fri, 28 Jun 2024 05:28:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708043b704asm1452266b3a.152.2024.06.28.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:28:20 -0700 (PDT)
Message-ID: <667eac64.050a0220.a85c0.429d@mx.google.com>
Date: Fri, 28 Jun 2024 05:28:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-28-v6.10-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 61 runs,
 1 regressions (renesas-devel-2024-06-28-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 61 runs, 1 regressions (renesas-devel-2024-06-28-v=
6.10-rc5)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-28-v6.10-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-28-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b697d5470d57cfd6ff3e1388699cd905334a9220 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/667e7bac7bef8aa4e47e7078

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667e7bac7bef8aa4=
e47e707d
        failing since 0 day (last pass: renesas-devel-2024-06-25-v6.10-rc5,=
 first fail: renesas-devel-2024-06-27-v6.10-rc5)
        1 lines

    2024-06-28T09:00:09.333425  / # =

    2024-06-28T09:00:09.345046  =

    2024-06-28T09:00:09.446926  / # #
    2024-06-28T09:00:09.457065  #
    2024-06-28T09:00:09.557880  / # export SHELL=3D/bin/sh
    2024-06-28T09:00:09.568910  export SHELL=3D/bin/sh
    2024-06-28T09:00:09.669617  / # . /lava-1158168/environment
    2024-06-28T09:00:09.680785  . /lava-1158168/environment
    2024-06-28T09:00:09.781522  / # /lava-1158168/bin/lava-test-runner /lav=
a-1158168/0
    2024-06-28T09:00:09.792666  /lava-1158168/bin/lava-test-runner /lava-11=
58168/0 =

    ... (9 line(s) more)  =

 =20

