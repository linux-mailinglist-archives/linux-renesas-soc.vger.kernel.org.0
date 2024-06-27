Return-Path: <linux-renesas-soc+bounces-6845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8091AF9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 21:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B8171F22B8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 19:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88964436C;
	Thu, 27 Jun 2024 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="r1D/BomP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83F200DE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516388; cv=none; b=s5A8qeDNhB+l/xPtbjessCnUYEqj5jRrEUHweGlr/Olujhn/gdouT2xYjHTcjyzen67Ad3ETVcsFXbvBKRD+af55rjECzn8aZlU31eefv3xWCjjisNL4ztw3qyLJlkMsREQQTT1OsQxTC3tgfbehf2nxAtqrRT4XGZsnUKinTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516388; c=relaxed/simple;
	bh=MgQJbiL+wDxItG1i4UgpIzqJMphXlbud3JRNpPB7dME=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=oN+h9oNpWP684yaupKAces4MOKSh5eT4/1QONkMTRIC5PILOgpquH+RwIxbACJwo2XcuKgx0M/zUcJi7lPISkjcLEm3gdbLxD+lF0gJzhedotcwO54Kmt6TE9JP/IL9iQ8NicOmdmnrxPrzusYAMSaRd4J8kR1quyIzJYFGoJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=r1D/BomP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f4c7b022f8so70374345ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719516386; x=1720121186; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+8o9pY18CgPhy3KkLyiqCzTGePrrQFdX2LUu3fmpJM=;
        b=r1D/BomPvDOrotCnWFEFIxuz0lkSPcLTJWfJPy8sLlBluwECNEktg2IdgXkB5ZDjqp
         moW8CCBgO5tJ4mxNHbRup6EL3OUhDKBfP5wFgI7G2I6o/6tMs2jGxIw+tCQK+DKGL01/
         kW1/iwz7vCrrrRAsImJKjNt579mMu2GUiJKmH5UJHWbs3g2xEuE0lXhtDv0BUg/Wvdvy
         6eW9ITBtLndBE/X6JVdHg5wwh2CtGyIEUxUH8DFgdTb+igaMwB60i060sVyErEB8dN5O
         dFaETFfSLXuW8Q4ChIG6ydBMp3FhjyW8efZTQBZIdggwbUWHIADLUICmefrXOBQkRAcX
         WoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719516386; x=1720121186;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+8o9pY18CgPhy3KkLyiqCzTGePrrQFdX2LUu3fmpJM=;
        b=aReDznvGM/VFs0VW93TDpt0uKNhPo9R3bIwJIXEAo7EZCQpxwm5mpkecCv6w0A2Lv6
         5hcpsDHLpRokTJ1Ojbebv3VbRvBp3XK7u/LYH6ZIIwXltTRlYfNVadAM/0ncpbs5MTBl
         3jlK4XC5lq8B1mqyRVao61P6qOcXPE0DjlnGW7Uq4zv43pcARY2hYWs7qUUvzPeb5cqM
         cXDrEko40flUsY6ukpCLkoApSfpRRhvlDJ+85wtaKtHXqAnOtKEmz2fxPYFXaC9BlEMO
         Hw0b76e9I0gCN1DLbEiXGs0QJj4O/T+fqPExDO1jKbfJgPPO2IY44642aK4yIGSEiIdV
         R86g==
X-Gm-Message-State: AOJu0YxcWOhH4rxzPJ4ZyU2pEcT5l9mlpRCglmWL0DTbYIvpk/1InLQB
	8zDZUO02A5oDrSAfWmJwFG1EmWFVnBAjorJ1uv+u8TIMGDkipLg5l+yQqHmv93NZ9U43AunQhnn
	Y
X-Google-Smtp-Source: AGHT+IGnHNJ2gCp4/tcrVeI4K7zrO1uHTRU9vXG/WwXffvpN1KXtvQjC0LrZmKxqxAFlY45nwSg6tA==
X-Received: by 2002:a17:902:c40e:b0:1fa:2568:5895 with SMTP id d9443c01a7336-1fa256858femr151602675ad.63.1719516385883;
        Thu, 27 Jun 2024 12:26:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1f9asm1293495ad.14.2024.06.27.12.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 12:26:25 -0700 (PDT)
Message-ID: <667dbce1.170a0220.2000f.0a76@mx.google.com>
Date: Thu, 27 Jun 2024 12:26:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-27-v6.10-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 6 runs,
 1 regressions (renesas-devel-2024-06-27-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 6 runs, 1 regressions (renesas-devel-2024-06-27-v6.=
10-rc5)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-27-v6.10-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-27-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0f5cb7e6e3f3042bdc6780d9a4fae9ed2d217834 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/667db3088595f890d67e70a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-lt=
p/20240313.0/armhf/initrd.cpio.gz =


  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  cbc2d05684ad86b779252500498d17f718b84915 =



  * ltp-ipc.login: https://kernelci.org/test/case/id/667db3088595f890d67e70=
a5
        new failure (last pass: renesas-devel-2024-06-25-v6.10-rc5) =

 =20

