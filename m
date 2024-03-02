Return-Path: <linux-renesas-soc+bounces-3393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0E86ED76
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 01:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11BF21C20D73
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 00:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1464180C;
	Sat,  2 Mar 2024 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TsM5Ce5X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFD3801
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Mar 2024 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709339584; cv=none; b=b43JigIaRTVCYJB4RZhB4BVWfhO1e45KNco8S/z5jhndaHhJ1bdj+tguyhZyd3+4VXYkotdTVVfb+jagJOEGkmwrT4VusF3tYDPDHLP+Fnbk+W70xO6zA1lUmFYtklNVLswQjPQ1eXSEfDkjn75/7TMPmddXgWb3OQhY4+OX/lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709339584; c=relaxed/simple;
	bh=QI0+EXyhjFndworJVKA0oXdEnRGtxU+AjFvGJ7Z0FoE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DDX3BbxLPBKRlKTAtREuqkgt1iQw6AELrSacKCqsEcYafpeRSUvPOS/U4oO7xkIcsqMuRwEDTQklTuQ25fBkY76qvHHJXMHcCeVskuXjLKmv+rn0ZL5f1daRgHQBkv00nOS/OYrND0Uz/FNyboKyLgFeUn9jPjTrKYTdduolZqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TsM5Ce5X; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-365aff1fa8dso9118635ab.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Mar 2024 16:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709339581; x=1709944381; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0xq585bDWwtE/lxx5BjQoTemrVz5lRPfBYPCfInxry4=;
        b=TsM5Ce5XiYDm2+wEh3Ja0xDqWjrYYpWkK4CWnRJXIFBfWAlujEnixV+8FOeLb2zDwN
         36JElazaG4QbpL0jB4KGPuhmBh0KpGSzp/gFseCBSLq3byj94bcEeurscGwqy6NeSEC4
         zHnvCw91P+tsHtLDrv2Gz3TjjDzA33cQCq3GvH+kkYGG9Tp9Q6EyAd/6/RISrp/NW5vz
         DlUVPzUZPlfjR7rqg+Vz0nYgT6aswBXa2+5nvSg5x2vOKb+kEXWIjWSR8yIB1t/5li/o
         pintv2s5LQqa1tsG2MOcage3jbsis59Pr5QsQULVjscj15mJQS2OtxcWYTzqCQQGLybT
         VHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709339581; x=1709944381;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xq585bDWwtE/lxx5BjQoTemrVz5lRPfBYPCfInxry4=;
        b=jt4S5dKye/BeDEl34cmF6TUGQMdY71SiDI/y+0iRl1mRb805WB4tSXvEXPcvflmgTB
         2K6Hq9CQ4fzYIY7URTKluLJv/5KuO98w5DJBZPmotfnjOHEjZmQFURUJJIBtFwquYK1o
         Aqg38IEOj0rHyrD2hV3IQ6zD/BNgmhWRwqDHbOqPtedKy9/x8kF7J2fMGn6ymXqVYAfl
         vIf+ZgbCnWnOv5OECh28Y6IQBgArHEVeoVPhyWEZzGVSA69LMMkfmBqJ941aqDCKTdHW
         L2COTaDiT+2o/niaQd30DligeB3f8G34ooLxCNPZBmBi/2lU9pcscq+/tcF8WnKrkj13
         /Baw==
X-Gm-Message-State: AOJu0YwxSF1cmmztvmo3vNSkb1EcQt9Pua3h6fQfXQ3e7cC2T6gQnodL
	PpCSy+lujBHELJKjAmZXBar4Flw/1+uK/ZG/Na1Q/ii30+yHDpNzwd6dcDs0xlgdG4h2UldUif1
	Xnkg=
X-Google-Smtp-Source: AGHT+IFFzy5xVVKrXyDHZ3JRNVt53IbXWmdsxJdMJPyFQU80mYIM6vfPUWOtl95z0G6PFsJFNAYbmQ==
X-Received: by 2002:a05:6e02:194d:b0:365:b482:1b67 with SMTP id x13-20020a056e02194d00b00365b4821b67mr3553142ilu.31.1709339581076;
        Fri, 01 Mar 2024 16:33:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w30-20020aa79a1e000000b006dde0724247sm3639005pfj.149.2024.03.01.16.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 16:33:00 -0800 (PST)
Message-ID: <65e273bc.a70a0220.2db49.25b4@mx.google.com>
Date: Fri, 01 Mar 2024 16:33:00 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-03-01-v6.8-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 8 runs,
 1 regressions (renesas-devel-2024-03-01-v6.8-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 8 runs, 1 regressions (renesas-devel-2024-03-0=
1-v6.8-rc6)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-03-01-v6.8-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-01-v6.8-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ba210b1d3de4232504c76a99fefdd457854d83f9 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65e23fadcab236d17a637013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-01-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-01-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65e23fadcab236d17=
a637014
        failing since 108 days (last pass: renesas-devel-2023-06-26-v6.4, f=
irst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =20

