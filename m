Return-Path: <linux-renesas-soc+bounces-6272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF5190977E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 11:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DF21282AFE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 09:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BBA10A11;
	Sat, 15 Jun 2024 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eJutepRU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABA38F9A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718444920; cv=none; b=U0OP83NwGrLTHcKfJo0D5xhwga1AX1Wqp9ZuCYsDDrgXuFNF5nwsZVeYJRjRPpoorKsISg4pPQCW2lv8LQCRI9iC3oxDexTGuywUoSK6fiPM8HhtXPc629Pt9s57GO0puqcCEZjL6RyWT1DE5yjgtG4nKHSevjDo5fw+TGnawdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718444920; c=relaxed/simple;
	bh=fepVa8rDahNRNv0Cw39Vw/wntQNDu/s3Qjp1DuAFOi4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IFIHeOMqB6MNYNN8CeThhwrsPHivG+LzrXFA0n2LFEeDvtPKKn9Y6oNq8CddUlYAFZ9RKZCMVBWj6aGiNBiSUU9Rtc1+EzVSJm4CDQ6w6hC3gFuTp/PohwMEl9y/OrasYWgySAP/8yP0QJzsCtebAsgG98+PvGj5SBJ3o2YRKcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eJutepRU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7041053c0fdso2197338b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718444918; x=1719049718; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BMoW5YTVJBedLn3zpSXcBpCVBv65ySqdiwB9QJIuJ9o=;
        b=eJutepRUJHuBVo39HaF0CX0P+rNnRZkqoI3Lhk3hylG9n/PPyJeTjay/39/QHcM/9a
         09rpCJeC0qTKSxGbhe5RZ49JEMKaOQr59mMaJ8ho06YI3mQNiwmdW3/Qx1xWnuoVeaCK
         aVhngFcDK7BGZ3vJ7XPknJfqudA1+nTyIscPrUPXpWjEMDK0fBMiLt+Qvza2y1Q1JhZr
         WdTitb25yOU046s9lwf6Zqj/Ei6vQXrIwi4tvEOS6mfliil8x6fEhiQMAzM7n4KTPQDr
         KYvWDnULR+Xu8iefwSutk3qv9GGyAYeJ9op/ekvwPjofj2bDosKC5OUg7J7GP6PXp7I/
         frIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718444918; x=1719049718;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMoW5YTVJBedLn3zpSXcBpCVBv65ySqdiwB9QJIuJ9o=;
        b=oyoFtbIJWzE2qNPl2sqe8Wo/yiVB4FQGC14Pqthq7CRP0tYt9e5XcLawYK63nL9AIo
         r0cSpDcp5ex+zBtudyf7KbZKqKz0g5N7wJ1sbGKfsKj6o7S3Z8pjT16/8YeHOPvn8tEG
         9dG7LItrD9KryxJqHyn8xfCod7OYor9EitnPs2TlGVrBitIYE+R6ewWRBaTdYiuzI2nd
         ++nUweKvzG2WbPm8tOLbqNVyIMTfRYutbvw3Mci96p9+oN89aIXoA6TAyAUVD3vs7Jvp
         ZCVjFoTyiTCZHX+lj/LpVcLKNSZTsI8TjJIgYSUrdmYiZymStkRgB1eOqrr1QxFz3rwX
         KmKA==
X-Gm-Message-State: AOJu0Yyrh/I+dVGr4vJqBqpzjFP1JvAxlwhIRCu1R+q4xsmqZeqkrd07
	rszISUwQw3z8YnXaxhvTD0R5rZLJ8/HvQIgyEMvj99XbT9KffWFsJgly6bWukJeGjzVOB7AZmAx
	Q
X-Google-Smtp-Source: AGHT+IFYQc6sK9yE0XffEHaBe4eGn0j5g8rdLcWHpR715+wxNrLTsu30vBM4Jr+OtHeNMlRVgw87sA==
X-Received: by 2002:a05:6a00:1d87:b0:704:1ee4:3138 with SMTP id d2e1a72fcca58-705d70f1cc1mr5892921b3a.8.1718444917912;
        Sat, 15 Jun 2024 02:48:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc91dd11sm4355067b3a.43.2024.06.15.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 02:48:37 -0700 (PDT)
Message-ID: <666d6375.050a0220.67cc9.d024@mx.google.com>
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
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2024-06-07-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2024-06-=
07-v6.10-rc1)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-07-v6.10-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
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


  Details:     https://kernelci.org/test/plan/id/6663481d40720514567e710b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-07-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240313.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/6663481d40720=
514567e710c
        failing since 129 days (last pass: renesas-next-2024-01-31-v6.8-rc1=
, first fail: renesas-next-2024-02-06-v6.8-rc1) =

 =20

