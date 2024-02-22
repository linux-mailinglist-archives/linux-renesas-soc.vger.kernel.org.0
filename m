Return-Path: <linux-renesas-soc+bounces-3111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D5885FD9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 17:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74046B2879C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 16:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EDE14E2CB;
	Thu, 22 Feb 2024 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YEtcXEkg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9F60B99
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708618010; cv=none; b=aCuOH7yOxmvcBUJTztEPqEh8mo5XiDyaufgSBnfHdvskM6q7yzEP/hd6XWReb4H0ROjbk/vYM9lVMPLHjLRTU8ge5nKqFE7UP2O+ZaSUOgRljxSpBJE2DiNGn8MjTmHhJ4wiFBWPBvz2dctu1JJWnStK2q3s5JjikPgTj/cDBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708618010; c=relaxed/simple;
	bh=b2adzStjYkiTLs0UqUn/bpB3+m+r+ufMlBcmkpZ1Mxw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=eA6BxZTOFlX729uPd3DMNeln7ClsOy/LrTXe0ZpaT6abA4en0eSgBBfUf3C4Ep/rvOqPWepvqLPlb/Km3+xIlNLralYWHmp9gMnW85B0Qd/C9ljP7telxpZQ33Wgr3q7rvTr4xYbeuM9xQZj8pKKv4GhIJVZxfe/Lu+WMo459iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YEtcXEkg; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so4586612a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 08:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708618008; x=1709222808; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s6Qil9HGRJRs3IdofVY5vX+O62VyO5aL9BVSN80zjR0=;
        b=YEtcXEkgztL0dmK3MA15hqgM1/wYKMkEQTOeyd1x5uoatKM7xm/56kh01/VLlmQLDu
         LMUfLVMJsJTgYLwCpsndSHI4etU2IwJWF5vRxYsRCOX1iOc2G0sCa0FJlZyEft8OMaZF
         lhIN/0yLRKGy3ogtfFg2GZnojVnCeh3PSqAlTL7poAcVA82+C6mKKBw65/Kzh/s/q/O+
         QEkK3g7Y0fHf4yPUaSPBtWRzs0yd5/Gtn02IMReQcZSiK5aU5S9qtf0kR+1wDLHGSWiR
         qUtThnZNCxbYkz76XXxF3J68yZYVQ8N598UTYeJsK4Cwgej7K++JSQLlGvKn2DUi5Vbr
         dbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708618008; x=1709222808;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6Qil9HGRJRs3IdofVY5vX+O62VyO5aL9BVSN80zjR0=;
        b=kIUoh8S7zC8k9oSL3koOdBHmTCvEzkYyslOtjpdCw0AOWLvGE3XdpORbNCMIL3sSiZ
         /yBzKh7rqee1YRazIYjID2b5N2vG4HViw1ubC2nfhnDLDQjbULCWsK9dAhc0NbKF9fK4
         4yZVCf3S9jOxRG1bB3RgRDfdr2A0Po5cLLWbyi+Dm1mCZE4iM3SG4OAhdSAu3eMr3t4+
         HOfo2Wl2YtfHwPC3I9Z/6zqo70FmYHODKhzDb/q4oO8Ao5/XXr/NNykAMYPD5mOaNVXM
         4i3sAwOwrpSIRBEbdAwqSxcPfVrz6H57eL5EIhp9V/rU8uHCty5vPolHQV4yXlxJ5zfC
         z5Yw==
X-Gm-Message-State: AOJu0YxI4NGhRSkQjxsJn2W522N1ZI7Y1FzyIwiXDGQW1BcQDd9ng2aF
	UhxEHK7zpuF0HxEjfv7obnkNERd5/6XFmkWO0A9swdd/6n5hgoGlF+h0LHyeCzvNGOWr24/3KbM
	x
X-Google-Smtp-Source: AGHT+IH3kPhGCLAuau5JAQExGQZ8MBckUOiVa36900BWioIvmJJiVZMXaJYpRpd4OZC+xbb5i/yAeA==
X-Received: by 2002:a17:903:230f:b0:1dc:15f5:fddf with SMTP id d15-20020a170903230f00b001dc15f5fddfmr10701409plh.7.1708618008012;
        Thu, 22 Feb 2024 08:06:48 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090282c200b001dbcf653017sm9437451plz.289.2024.02.22.08.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 08:06:47 -0800 (PST)
Message-ID: <65d77117.170a0220.f2168.d780@mx.google.com>
Date: Thu, 22 Feb 2024 08:06:47 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-02-22-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 23 runs,
 3 regressions (renesas-next-2024-02-22-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 23 runs, 3 regressions (renesas-next-2024-02-22-=
v6.8-rc1)

Regressions Summary
-------------------

platform                    | arch  | lab             | compiler | defconfi=
g          | regressions
----------------------------+-------+-----------------+----------+---------=
-----------+------------
dove-cubox                  | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g          | 1          =

stm32mp157a-dhcor-avenger96 | arm   | lab-broonie     | gcc-10   | multi_v7=
_defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-22-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-22-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb8362db9d70ae053d6286cece6d60a339a9794c =



Test Regressions
---------------- =



platform                    | arch  | lab             | compiler | defconfi=
g          | regressions
----------------------------+-------+-----------------+----------+---------=
-----------+------------
dove-cubox                  | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d740130d4afaee7f63704a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d740130d4afaee7=
f63704b
        failing since 86 days (last pass: renesas-next-2023-06-06-v6.4-rc1,=
 first fail: renesas-next-2023-11-27-v6.7-rc1) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g          | regressions
----------------------------+-------+-----------------+----------+---------=
-----------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74122ac865c55f263707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d74122ac865c55f=
263707d
        failing since 31 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g          | regressions
----------------------------+-------+-----------------+----------+---------=
-----------+------------
stm32mp157a-dhcor-avenger96 | arm   | lab-broonie     | gcc-10   | multi_v7=
_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d7611ef33e6f1e88637035

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-stm3=
2mp157a-dhcor-avenger96.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-stm3=
2mp157a-dhcor-avenger96.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d7611ef33e6f1e8=
8637036
        new failure (last pass: renesas-next-2024-02-21-v6.8-rc1) =

 =20

