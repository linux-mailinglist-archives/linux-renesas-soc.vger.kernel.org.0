Return-Path: <linux-renesas-soc+bounces-4627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 716508A58E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 19:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB9228209A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 17:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B2282C88;
	Mon, 15 Apr 2024 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="M3DpRa5D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411482D91
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2024 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713201292; cv=none; b=XjVX+bQGB+NCNl/h3/nIgJnXY7NjBlcq3z9ha3eqd45TeJx7AlZgS6krcDnN36MU/BKVysQXKVLA1hZPoauGdRl3BpYlMBBbXQtAu4tuQbRpQ9waullVq+l5Vl54rMbqYGiSTjyTRy8wGInwOg6wiHQVvW0FfmSuA7n6lVY+jXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713201292; c=relaxed/simple;
	bh=gtg3x30+tHl/nkc9PMZM9xQuwQEyj+XW6WOIGpcGl+E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=EHJoSCozGdZMmi4emnLjnWSXVwhX/EBko+eg6rrgYLq0V4h+46kgtUoagO86rGb0qwgYCPjg2JHrZVDcmhA+WJF66TjMF5XPV2tOck1B6GU9fcgrWsJtGDGJ72XI0BsUOJKayKbBg49Ok3MBzzmmmi4dOMT83ucZKv+EdXwBMkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=M3DpRa5D; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6eff2be3b33so1214456b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2024 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713201289; x=1713806089; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xTL9uZVhYt3W8AuRU5XgN/1p7vQIIuk6WXg9IETm+Po=;
        b=M3DpRa5DFwDT7wYxTB/3OY45JDaY2rZ6e8I9FWeJzgRbRVWfeD4TvSDfmSY/JXwEgY
         hbfmr6QVxKhuFkER9r62pQs9v34ZPboz/ADPCI7xoY1VJCaNiOmR/7ZhbWOFwcLuJjG9
         MOsxQ/ZwvGjCB3UobtrwpvFiN1t/hNRlZGF5k33xClO8fDmfkq2e5Nu2EeJoVMcR21n7
         LX4ap+nlUhzk/+LPgA6D4dF7+lLVfqKw6d/iGLMVSZH05plcG10CExxc10edUD4Hkfhz
         O7fjiOz9fgzGeUpwb/otYFBDriPvVMeSysKhPTZhO/6ZYBl30KtvEW1JsKlyL+cwKoFT
         aPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713201289; x=1713806089;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTL9uZVhYt3W8AuRU5XgN/1p7vQIIuk6WXg9IETm+Po=;
        b=V4hYIZS/Eq4aHhyzIkCq5YHU2OGIzsX6LzCmlZpF233/SZC3zYQz0yDI6Wk1bDA5vQ
         gWTjnpT3v6wcd+6Z3/AEKXzYjm2OBTRB0zaaQ59yacYaS45QwuLIFihlJ2E6LnEnpQhH
         ddsNX3Gy+6qZPcq/NhGpAwrQrtibtN+dN6xhtmsIyeV6Tww3QX1b9XvVXtPSDPIsU5uV
         w/FPKeOZa4ZKkKb3ZIRwZWghi/yf3ZVm/K4KkwUS4q49hxQ6rsiIFcHBM9aRcjBxut3i
         RvQTNQKXYP2pGqsp6TUypeDDymvjtF1Y/x3mUMNNZ4eH6/WNIT4dxW2AJHCQUjw1NU0J
         Rrew==
X-Gm-Message-State: AOJu0YyeXcGG5sQsRSfYY8EWyIbfgpc7jXlgpDFlouIecjSuWTx72Num
	Ozs5+LzNu+lwtibI2oBYjxQmnUkuJM/06yN0jBfbFF7aw0sYTJxV396QSxC93cR0noiwHWflFBm
	CkU4=
X-Google-Smtp-Source: AGHT+IGKWh9tp4JKB1pEwfeOHINlyfea15HQ0zg1Ly0N4+eN1Q8xS9tLyOwOIjbIbOZZdiHAGa+FJw==
X-Received: by 2002:a17:902:cf41:b0:1e2:7916:6b7a with SMTP id e1-20020a170902cf4100b001e279166b7amr9664305plg.6.1713201289134;
        Mon, 15 Apr 2024 10:14:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jb12-20020a170903258c00b001e2a3014541sm8200634plb.190.2024.04.15.10.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:14:48 -0700 (PDT)
Message-ID: <661d6088.170a0220.8962b.6b85@mx.google.com>
Date: Mon, 15 Apr 2024 10:14:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2024-04-15-v6.9-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 22 runs,
 1 regressions (renesas-next-2024-04-15-v6.9-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 22 runs, 1 regressions (renesas-next-2024-04-15-=
v6.9-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-04-15-v6.9-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-04-15-v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f4a6540ae2c417ba0b1173cb30f20b6aa3ff113f =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/661d31738b947878684c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-15-v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-15-v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/661d31738b9478786=
84c42db
        failing since 84 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

