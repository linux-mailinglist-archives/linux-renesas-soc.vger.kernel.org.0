Return-Path: <linux-renesas-soc+bounces-4933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 839888B54AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 12:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4350F282B94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 10:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45540F9C3;
	Mon, 29 Apr 2024 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MECCOxHM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66828376
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714384878; cv=none; b=u3zBNXijLQiktt9nNQwYmfJ91Ujr6Olmr4dm3wAiM4niQ12wVMV1JFDCuR6RbEzVytMkXa/jm1dAo/QRVNIisiAmnHTf2WrMyQyiB8LsOolV1JJBqDjR280AqKE40lw5wKg5goKhMgu644t8w1MXyElwYreyB18gTws7G0poHnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714384878; c=relaxed/simple;
	bh=uRfF9KBQZY2K6unk+ynLRkxjn8CfKpR8M3o841HvqE8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=gAA9Kz1tDGqSr/R+PjYThQDaOTmHKvasC7VRbMWqYbVk2WXHbZvEVuPgawdM/KAOqYlfD0OJdssZc65cd7u5oyer4FJr8x8ABqPQ5Qdp9XBg77G609DCyui+wYcewM5/BXhY0/ASvXLhwPEYXFcztDeTcwkAEAPStZZBKb4Tljc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=MECCOxHM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a87bd53dc3so3475282a91.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714384875; x=1714989675; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+VU7ekAUSxpbrsxnBsgIm53zCVS3h3WhPR/NGmn+j7Q=;
        b=MECCOxHM4t0ReyY4P/xwlejViOzkh+XAPwSB5/Ajri+U25HETkmzTtCPYPiBhWuNrN
         z5jtNvpHiikSdXbfj4RvaQPGkAxwQF2jNeez62p3+7VQu7K16RX93tTsnVqLZR6Vw3A5
         blPaZ1inYYjaw463Fn/kJsI49tF6HNSFO8HeeEiU1+UK9+N55zqiBxunbALlh7Gf3ukD
         vDEWsdc2TZh8GkWaztJdgmpCwkRgmXZns6hw5SBc9lOjB9GZgBziXK0WDDPMo6vrqsK5
         rp/Z55KPbYkXq+wRg8Fh30ivR+Wny/f4b4y+VDqaecviGlwLJhEYherEbtBtGLIOfTIe
         6NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714384875; x=1714989675;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VU7ekAUSxpbrsxnBsgIm53zCVS3h3WhPR/NGmn+j7Q=;
        b=rmllQpDbMpAtzEbEWNqDh4nW/faoJqzQFyU2ELVxK4lk/KtOd/JlVIdrXYQJWysySv
         G70IXP1JFEX3UvG6jLpEddgVGuK0IhNlMPrpzgfXqo2CosnRCfH8cxZwc8tozhl6R9GN
         N5fkGClng+syn3nYdamwrZ3l8Kmt9wpXN1a6Lb+aA0czCVi7pGXZcR+Yo19JXGf5rlFG
         yfXrFknwLZEAgmlcZG+5PUWm/st0z20znIpRnnlS2vyVb3h+uxjsAJphy5sqtytyw9Ej
         FhIRkYp+AsjYxXGLHFdVwnnhKvaL1aT9FMBTIXlJiZ/00F1QtAed9zErZR54bsK0sMsf
         SJ5A==
X-Gm-Message-State: AOJu0YxMlz51BdC2OnjAfijBKAuVbflDbAt7Q+BOoN7W4t7mgCrCuLRO
	TXw3Ea07fIpJwSvbDL+nAstrCExFL/z05KtaVWVyGRThmECVLXpF55WnvoGOKNIx679kjbAX3Up
	HNzs=
X-Google-Smtp-Source: AGHT+IFdqyMBlE7ij5uMpwy2xhc6x0fFRn2SI3cGJjXCEqxwlujSr2Bc9OhBKEmJHPo2LHJqqXHg6Q==
X-Received: by 2002:a17:90b:3d86:b0:2ad:e74a:f4e9 with SMTP id pq6-20020a17090b3d8600b002ade74af4e9mr8125069pjb.2.1714384875262;
        Mon, 29 Apr 2024 03:01:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090a070900b002a4736f3566sm3892660pjl.0.2024.04.29.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 03:01:14 -0700 (PDT)
Message-ID: <662f6fea.170a0220.62cf7.7b0a@mx.google.com>
Date: Mon, 29 Apr 2024 03:01:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2024-04-29-v6.9-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 7 runs,
 1 regressions (renesas-devel-2024-04-29-v6.9-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 7 runs, 1 regressions (renesas-devel-2024-04-29-v6.=
9-rc6)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-04-29-v6.9-rc6/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-04-29-v6.9-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d55c1249af5add856fe96d2f7d3dea96fa61e285 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/662f67e7c9e03c4b5d4c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-lt=
p/20240313.0/armhf/initrd.cpio.gz =


  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  cbc2d05684ad86b779252500498d17f718b84915 =



  * ltp-ipc.login: https://kernelci.org/test/case/id/662f67e7c9e03c4b5d4c42=
ed
        new failure (last pass: renesas-devel-2024-04-22-v6.9-rc5) =

 =20

