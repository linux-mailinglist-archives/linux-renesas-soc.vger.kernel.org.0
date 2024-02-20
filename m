Return-Path: <linux-renesas-soc+bounces-3007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F385C43D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 20:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A669F2834E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 19:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236D012838D;
	Tue, 20 Feb 2024 19:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aj/mRncn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5920676C9C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708455917; cv=none; b=kAw8vXKdYjA25E44HV9Ejm2OTMxs/2KbaH21HRNaCHLv1IUcTMTfSEKo/o1vtpBdpTxOrLb+EfDyW/SqmZ1pDnbwMUlzuSuHmAyIcf1nNdzgOv7h2AnBvKHQ2iglABKLj7rgU/cXD64+GDAMtnzEbFrnz2371nUPSwOzMuFgn3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708455917; c=relaxed/simple;
	bh=c/SaVgZH6oGMperXq3NwHIKQkShEXjb+xOS4OpxkuBw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=C3aqeP7VgMAGXS6/2UgmIuRLiA5rceXhmVWNry6peSUN3Zf69Jn69dDtA92jRCTymfV3KnXsb5IOGQYwy3/hEZg5S8JtcLfIABPjtbjfHUc/NNrfgemdFoZORvoIxm3BC7/tCxQjcz3hKwsZX4BxjLMyQXl14VY+eG6IWwek5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=aj/mRncn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e486abf3a5so374694b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 11:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708455914; x=1709060714; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tGjpG7aL9eusN16ULcFYgZVef9WuvoJ6pLg137awunM=;
        b=aj/mRncnVGVvf+SXTwR/simic6D9jdmk5+aPt3rwW85oobjm8CPqQrg+T+WLBW3IjV
         FCbr+JcZkV4QQO9mQ90Tn227s1Y743VbdxUt/T2qwkc30E4627swtNvcCkOQF1SqUchG
         H+BueHAhyOD9IR1lSDoY/kn6L5jDRDtqPjKY/5UFo74qQxPeXYxOvt0vx3dSFJ5Fc7vT
         1NfbHv1gKOActwT9ZMA0IXMqSJCazSGQMIOaRRo3wFznB/aTjF3C2bddMcOkTuSOO0gi
         lLkTi4XyGrcwWcPyBkArZ6tZc8Ki3f/jgyOP16r7RKVZXwZJqBVXFW/LsUk7O/p7T1dU
         n6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708455914; x=1709060714;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGjpG7aL9eusN16ULcFYgZVef9WuvoJ6pLg137awunM=;
        b=tMj/Qn270Ew/AHwj2Q20R86ON/MiS6SRDWIQnuuSvjN2D5FtcgW10OH9UjmD0esAxF
         QCj0VYwR30y+HEChMjVgE3WVeOOV8km2oCnLh7WHGGNncoawPKOtlDx2z2d3vsC27Ftj
         9SSk+RfSLl1amguAzuUCka0jSNmnATQCSR7jzlto/S8LK18uyaPaOVGQjbCjscppWXOp
         IsVjfSAALtE2QRwmbnY7YltcEbLqV5FgdwMnkY6ebMkokFGrJerHb3OnNGD7J/eLtK0e
         vFdNIiZiWEABzpDby8Y/jZdwDY9tvfIyoC8DY2ibET4wzSkFAh7IVLhEfmPq269+cLQq
         2ubQ==
X-Gm-Message-State: AOJu0Yzd+jmpWLFD+OSHsViWv6vmsljnlePkrTelh2teYFgl4dYesbMb
	/TdzmFAeJFxkyrjtU7zOmPrQ/9lnNtSl4ZQwl2tiSW9E5PZx1LJAYUa8mdojaBX9YcGgaLHh5EX
	AM2c=
X-Google-Smtp-Source: AGHT+IGxrBxBH1yTshjqvc6EOhF40hlfBQxF7iJs6TvB0BK8k36uQtLvkdoiUyGGkc5Gqkwx+CrBjQ==
X-Received: by 2002:aa7:9f0b:0:b0:6e4:68fa:f1fa with SMTP id g11-20020aa79f0b000000b006e468faf1famr4568971pfr.34.1708455914097;
        Tue, 20 Feb 2024 11:05:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t5-20020a625f05000000b006e25d43630asm7230799pfb.108.2024.02.20.11.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 11:05:13 -0800 (PST)
Message-ID: <65d4f7e9.620a0220.0fc4.5319@mx.google.com>
Date: Tue, 20 Feb 2024 11:05:13 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-20-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 25 runs,
 2 regressions (renesas-devel-2024-02-20-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 25 runs, 2 regressions (renesas-devel-2024-02-=
20-v6.8-rc5)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx53-qsrb            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-20-v6.8-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-20-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b69e73e919f617121d1fc0703b270e999ac5f559 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx53-qsrb            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4c7602ddcacf91c6370c0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65d4c7602ddcacf91c6370c9
        failing since 350 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2024-02-20T15:37:57.265676  + set +x
    2024-02-20T15:37:57.265849  [   29.710836] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026107_1.6.2.3.1>
    2024-02-20T15:37:57.375368  #
    2024-02-20T15:37:57.476762  / # #export SHELL=3D/bin/sh
    2024-02-20T15:37:57.477243  =

    2024-02-20T15:37:57.578095  / # export SHELL=3D/bin/sh. /lava-1026107/e=
nvironment
    2024-02-20T15:37:57.578586  =

    2024-02-20T15:37:57.679413  / # . /lava-1026107/environment/lava-102610=
7/bin/lava-test-runner /lava-1026107/1
    2024-02-20T15:37:57.679997  =

    2024-02-20T15:37:57.683153  / # /lava-1026107/bin/lava-test-runner /lav=
a-1026107/1 =

    ... (13 line(s) more)  =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4c59bd8c7402ee56370b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-20-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d4c59bd8c7402ee=
56370ba
        failing since 29 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

