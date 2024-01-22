Return-Path: <linux-renesas-soc+bounces-1637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D8836484
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02BB61C226DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 13:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DAD3CF75;
	Mon, 22 Jan 2024 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yVlhHWRl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110FA3986C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705930606; cv=none; b=khCO7Vd9Lw5UE1CWBmehSWmxw7cStbo4B2O0Fhzc+Tn0AI3Pb1K39gFG1LbvMSfUe5UqwMj6IDaP20OVDkwWD7eCxcSTvkBXLr/H7Z0d4rl7E9+0aNYhpCCTRhhDmldFAkbDRiZnIpxATurHyCyULnZ+nUrJAuh5EA+yMVB0yNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705930606; c=relaxed/simple;
	bh=iEDOZ6Ol6v/Pef5nx9tOdm4/mxAqILstRQLy0+8CWxk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=qM0U4SlSo21PEdWbAl7Kw6rviCG1PWYVdx29+sVc39WS0Mxny0bTP5Z6XkveY+ty4gEiqB2BViPVDU/5BpDDob4yARrtXeb7TA2VjLF4YolhzSa6vSGHxqgldtTgRpTWS/D/VWVuelMJtcklqYBMHrGMIoJPREjverrEEZq5yVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=yVlhHWRl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d5f252411aso14732315ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 05:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705930604; x=1706535404; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J2IrHLKb9HLnsrrcZPh8fO23dVYgf6UZK7BcK6H40I0=;
        b=yVlhHWRl+XUfg2oEeUGQoFyjO3ZIgqglrsK4xJfndtUoxYUFZrRWzRBIApilOXIEyh
         88kp6gsgy0RQ9kWVK+KeBcJr+0AEvZhTO5eW7n8gzYX0Qj8w0suOHQK6gAI7ssvQquV3
         9fLIO3RvuB8t1/H0+5wyerA5tD5VQCLb98y9tm9ngm6PcrEJxzpcw3BNO78f9TtxTfWV
         Fym22yT/Q6n2RWMkYiOJWfChWE6RYxWNPOLrJ+VbAsLPG4Q1iVFge4M4GGKCZShgvJ8s
         c1ZE5U7zszEwRUKnrjkeBL9oKBOXnl8s9gZluNzpwbmLnIhLbnbCUA8dEmUoEgZEzJzE
         4uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705930604; x=1706535404;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2IrHLKb9HLnsrrcZPh8fO23dVYgf6UZK7BcK6H40I0=;
        b=JYHtSqjgSjiZu7iOPljYXNN5ShZNsP6lh8s6wcZhJBWKuB1B8/W+3Id7gR3EXE1V0y
         X1D2r9izJBTHF2oO2NgBgpcceQ3yZOddwkXa+OYNBYDe0JE+gyXglfqiLHPV9J1pwYQ3
         p5awXy2nXTSH0ZSGoPaK94dvlpK6ghO+MHWWWQUcIRdJcLJgdxXWEHRQT2vHFnfHN+Bm
         9kNNxN/rkI59PRU4c+ktuRzq0Wy3T975IpwxLOPqYESY0tKGbIFZGJSB0MJ718eEa5pM
         qQdE0uNf0xdkn2iY3MU4We5IhN0gmqPh3CgTFyQA9WXtF2bGLamzhhKyTq8Jn3R3WKld
         Gl9g==
X-Gm-Message-State: AOJu0YxjsozCVbYs+fpf4WRJHDnG81sgaTmr0KXbtmH05PQDscOT3zq8
	P9XcBQ1HkwlNxp46F52evwZlJdt0okV4cZ0sZTTMAL5dGImMxfnIJ1QcHieD/GvsmRrK48xKcck
	a0hE=
X-Google-Smtp-Source: AGHT+IEBxaM++xNaEnpu6z2SHDwO+f2uA49Ifjtg4WxUfQRmHNXHwOuhhgncaVHunf86m9AY5ajtEA==
X-Received: by 2002:a17:903:41cf:b0:1d7:5d88:f9a6 with SMTP id u15-20020a17090341cf00b001d75d88f9a6mr563340ple.50.1705930603844;
        Mon, 22 Jan 2024 05:36:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001d564115807sm7168907plx.46.2024.01.22.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:36:43 -0800 (PST)
Message-ID: <65ae6f6b.170a0220.76458.87bc@mx.google.com>
Date: Mon, 22 Jan 2024 05:36:43 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-01-22-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 24 runs,
 2 regressions (renesas-devel-2024-01-22-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 24 runs, 2 regressions (renesas-devel-2024-01-=
22-v6.8-rc1)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-01-22-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-22-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a70319e919d665138916eb65e32b00ffdae66671 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ae3dbb279c24f86a52a4b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ae3dbb279c24f86=
a52a4b6
        failing since 69 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65ae400b03db6056f752a3fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ae400b03db6056f=
752a3fd
        new failure (last pass: renesas-devel-2024-01-08-v6.7) =

 =20

