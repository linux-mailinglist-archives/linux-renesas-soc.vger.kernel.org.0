Return-Path: <linux-renesas-soc+bounces-6289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189679098F2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 17:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B10CF28302E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 15:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8DC4963D;
	Sat, 15 Jun 2024 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="N4S/ONPw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BDA49639
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718466062; cv=none; b=T5h68vP9uFFrtPqNmLtE38yn1f4SJoSkKoC7Wk1XwlNRWj/QdZLyyRtwK3rpukjSFrFMyt7rXSr/ByM3vbnBTU8qBXpNhbXeZOCWwnigRmKzmNtd6EbEO0BLnuU9M6rFqG3rztF/5Q++K+WTtnIZgAr6+MULNUKZ/LA1kjnG/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718466062; c=relaxed/simple;
	bh=I8l/BKd9m1iJ0Sk2dEIMjG5FEEuZ8tYYr2v7pXPXwXY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=j/iIbGiUNagpyFEoznx4D72aEX6gd+c1RSZ1v/8FTEzXesTanG6nHG56haIWIbaEnVOZ5yHjZHLTPUpNIMNsh+3ih5fuhVEZE0JHPP9CoZ8UzAQLW0uCPqc74xgnIftuOGGwBk5vgp6Yz59Rt7JoZFgmryPK+9mmb8/nTIi8rlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=N4S/ONPw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c3050f4c50so2537442a91.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718466059; x=1719070859; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KIqumN3nhk0Kgabm0j/6nL2h/RYeaXQvInbFzQK6JJ8=;
        b=N4S/ONPw1tga3ytp0M6OFtSzpNF5rbfOaJr96xRxuur1apG30az3GEQsJ9Qcg3wyZV
         Uka6z8ELNigXKapPEUA+M2F41SnI8TwYCmDW654R71dFmdLYG+PB0BIT6Lr8vmBxmD1i
         ZdbgAvbSL4VOfCNydISu+HSS8Ro8v3gNekDu1rkKtcyFCz9Wa9DAQ9i9FZrR8T0vkAcY
         7OevX4NX3B2m7TLgu84FHyPa0F5X6HGygifKp8WKmg+9ugDTHNEl1d6XaGOK4f4pA1E0
         erYFMG2uPkliys2ImIxRqmXHGVuPejDMoQjJ+3enR66MxwLDa7KtUYJhLw5dW9O8a0Nz
         96Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718466059; x=1719070859;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIqumN3nhk0Kgabm0j/6nL2h/RYeaXQvInbFzQK6JJ8=;
        b=qdkeQl04+dJRml8U+m3MMO4PbvgmJDV5DDpcZZPEnNapHKtfQLGtWLC1Yx1Lw5/qFL
         w7mEIgvfUGnXcmAlHkoGJDz5JmMTjOXMtjbbfQMmX1WRMmXAXYW3tVgkJkIcE5jVFhd1
         We87wosAM+fHkIxBdelbXJwq3NnbJZWAwJmCKHTqwfzDO+k/Ly7jgxaMHGWDcmQLAjC7
         yUQriaFfos0aG+aWgjycyVpj+aTq9plCLAQsa6cyjE269laugjkKT3d29fS22X+A3VW7
         JLe2EzrhFVM0EFCyK7tpj9/B/aouSr5eW8HP5tlV4g66c8KeX+zubVm8I/e+6YJlnivX
         SgEg==
X-Gm-Message-State: AOJu0YxVnKyEP0u2xRZY7ulyZHip453QTitqXAN2yYl4YxwMrMXNE/7u
	nXkhjeyGR1s41Glv5oBoZiDcD5yuzBYSTsha3YiQ4SBkprge6zxPnFIOxbm5CaniCBtT24pBZi8
	1
X-Google-Smtp-Source: AGHT+IG5VjG3HBCQk6Gq5J9eJCcoq4ZqqoM0VLNp6X4swCIPQuekSAUoMslVkrVo1TYbZCypU32IdQ==
X-Received: by 2002:a17:902:da81:b0:1f6:e306:1786 with SMTP id d9443c01a7336-1f8629006e5mr68075585ad.54.1718466058706;
        Sat, 15 Jun 2024 08:40:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f16888sm51214785ad.226.2024.06.15.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 08:40:58 -0700 (PDT)
Message-ID: <666db60a.170a0220.88a99.eb29@mx.google.com>
Date: Sat, 15 Jun 2024 08:40:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-10-v6.10-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 65 runs,
 1 regressions (renesas-devel-2024-06-10-v6.10-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 65 runs, 1 regressions (renesas-devel-2024-06-10-v=
6.10-rc3)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-10-v6.10-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-10-v6.10-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2487f042931b26238ef51e0f0c02cb59a2d57047 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6666be21b3a8ae326a7e707f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6666be21b3a8ae32=
6a7e7084
        new failure (last pass: renesas-devel-2024-06-07-v6.10-rc2)
        1 lines

    2024-06-15T12:13:52.992899  / # =

    2024-06-15T12:13:53.001715  =

    2024-06-15T12:13:53.106807  / # #
    2024-06-15T12:13:53.113266  #
    2024-06-15T12:13:53.231301  / # export SHELL=3D/bin/sh
    2024-06-15T12:13:53.241601  export SHELL=3D/bin/sh
    2024-06-15T12:13:53.343332  / # . /lava-1150019/environment
    2024-06-15T12:13:53.353503  . /lava-1150019/environment
    2024-06-15T12:13:53.455182  / # /lava-1150019/bin/lava-test-runner /lav=
a-1150019/0
    2024-06-15T12:13:53.465102  /lava-1150019/bin/lava-test-runner /lava-11=
50019/0 =

    ... (9 line(s) more)  =

 =20

