Return-Path: <linux-renesas-soc+bounces-3137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B8861BD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 19:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36A6FB202F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 18:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D40D179A8;
	Fri, 23 Feb 2024 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qJWahtpZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACBD125D1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 18:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708713394; cv=none; b=HSqGab+ghWjZ1kR2E1uQ20OZVaQ+cfY2aXAUNg/5FWXfLv+J5/yg7mA0XhoGMGAuqOth4C3P6KzSlsJ6x+lDlZBTmnaAXUxg76s92WENE4C/lT1B0hdD4abhPJ9//pEerfNAEl2xFuGOXF7NiiDlTqHscE2IDJiVb7hCF3aZxz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708713394; c=relaxed/simple;
	bh=bkVJKKrTTPv3M2iG6c0hi35t4fN1DsUHmI+StB/w7rg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=fDhF3LjDyS3svrjGsUQpXqfnGlTDjv2mzcjoR8bkLSbnS3HGAH5yl+qgAc2M1vNHHgB14IPWBdgeeDmpnxPA3/b1Zq702UmEEXNAz6dPHRcHCF01tyjM4NcvXG+l56j8NLqAXBdY6Wf8gabZp9j45N4n/09FQ/TNqgv1XUSkGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qJWahtpZ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d3907ff128so585448a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 10:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708713391; x=1709318191; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=riyG8Rg/keQqOpYH+uAZjkw1lHWejg3YPJBHNeja7WI=;
        b=qJWahtpZFh91icUtF5T1Y57gVLDQjHHKaIk2fC9fvXDQScADyNDpAnGzWylT7YlV00
         EnE47TcEZHzGEGDj0Z1/D77gl4M5QTyy4qErzMYS8eFP0lOt5NMS4iKVhhim/bEAPhht
         7yD0d08oiA6pS8LFKU3+7g52DwTbyxGvA8wS0HpSxuw9OIzFzvdVznE/+Tk8wdK99kZl
         xY2VF/5w/sUYoSs6IFCowy1nr0oDzJLzqjCJMVxTdaWmhpKF5FSgphNx0FGJ3/CmAlRS
         PKnXGjSOlOf+J23AhWW4ZdyuaIvbKnDoMOUV5Ri5DqZ5cIfqKIYysAqUSNEhG6cLaL8d
         5TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708713391; x=1709318191;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=riyG8Rg/keQqOpYH+uAZjkw1lHWejg3YPJBHNeja7WI=;
        b=a8n+kLU8K2W6wEZQFzF3eHLtpb+m8o/Fd2+Sq1sv4DOa/qOXXxSjZfBuzaZs3H7hWf
         MTEumkmuWGm3Bp+Gk9rUfd7/7C/1hePSR28SgSKXazc/paow9/+BMhLuByxnn6DNyo0A
         2XoVKd3z3WtgEEFALygmwhwqcyR+1u+s/rdeTEHwV8Bc2fawZuGa2j4GitS/BTXKmsZF
         uKnQ1BOHsMoHOk5zHdo/ObzodXyxNmCru1lYXXc2tAoGFgLGPJowhBMeQZRinWu3EExs
         UP3sjy4bSqgNq2a0CySGsxl1CUttw9KvtqYiak9BcDMM/CoUTEqIw4UFehox3CBKKy9Q
         dIrw==
X-Gm-Message-State: AOJu0YxNH4Tm/r0BDwBroXndpKY20+RKB7WdCgMUX9wu+S6U3dxv/9Ys
	Z7C5/KyS2snuOKkk2dvz72tFpV4fhmcVpmo1imLOxbLNzNmXlnQFiF+VXqrUPbFgbDK9uHma085
	FuIU=
X-Google-Smtp-Source: AGHT+IEVd+b8oKVKJArAkCX6cNAwgfx9aEhaf/p9jbQfVPrg+DkzTM8o0CDB4X3KfS3p7EtFJUJc3w==
X-Received: by 2002:a05:6a20:d805:b0:1a0:e849:98e6 with SMTP id iv5-20020a056a20d80500b001a0e84998e6mr514634pzb.43.1708713391423;
        Fri, 23 Feb 2024 10:36:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 18-20020a631052000000b005d553239b16sm12620768pgq.20.2024.02.23.10.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 10:36:30 -0800 (PST)
Message-ID: <65d8e5ae.630a0220.e9a19.db3f@mx.google.com>
Date: Fri, 23 Feb 2024 10:36:30 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-02-23-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 25 runs,
 3 regressions (renesas-next-2024-02-23-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 25 runs, 3 regressions (renesas-next-2024-02-23-=
v6.8-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig          | 1          =

meson-g12b-a3...libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-23-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-23-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      06a019816e5194bbabfe2df324371f6c962ff7f1 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8b26ad4d8c5b68363703f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d8b26ad4d8c5b68=
3637040
        failing since 87 days (last pass: renesas-next-2023-06-06-v6.4-rc1,=
 first fail: renesas-next-2023-11-27-v6.7-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8b51a64c4b0a2d663701e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d8b51a64c4b0a2d=
663701f
        failing since 32 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
meson-g12b-a3...libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8b9e1b22080c6a0637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g12b-=
a311d-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g12b-=
a311d-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d8b9e1b22080c6a=
0637015
        new failure (last pass: renesas-next-2024-02-21-v6.8-rc1) =

 =20

