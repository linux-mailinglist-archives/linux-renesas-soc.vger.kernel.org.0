Return-Path: <linux-renesas-soc+bounces-3139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327F3861C4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 20:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84643B22C7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 19:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5094128831;
	Fri, 23 Feb 2024 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rDGNRjp1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E69646B8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708715529; cv=none; b=Dhlju7Uyx/fz64irFBaL2HdDSkeAhg0ZJMpxudPQl3EbY+QTr7MhLbgH9EzDMm7hwbBcT1VIo1MZ8fSujCpPtlNB8CBGqL8yh5jfoer79i1c5UNJ6NnjS4wIfc/Bmefo7EgU6hsRpIgyMxoL7NELM+zUBpCfb14BEeeWJPU/208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708715529; c=relaxed/simple;
	bh=rFtPS+em2c/9dj8qoTpIMEJQ9qp9PhynZNXqbsh3BgY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=iHuTydt5LDC8A/d3slZKjH/9ndgz/6ziJEviywK1A+IJ4r1rjBhJMKRvj/LzFKbdXmYWH2aVc1s8bG9GgnA21SnR1qNaTzhE0N8/H8RjUV4e0jZXklm5dBLbAOPR28nc3yPPlDJJeANGHhy8XQHJkY4enQp9HMh+syfT6WubB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rDGNRjp1; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so875872a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 11:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708715527; x=1709320327; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sjO6dDt+FjEfk0V7zuV+EfvZ+BB1JH7vb0BGN4JQIOk=;
        b=rDGNRjp1lt7NDnQssAfXxx+1L2b0vpClQn8w4gimtrFFnqEE3l+rzDcupw90MWTaRQ
         oZVW3iAA0/aoy9j5ShnE8Mpjv6u6Mqs99RpIjjL5eOXpwKT+37j3U4ZlmZGhzZP9SBZY
         3ylHEGmdSk5bZ18lfif59HDikuvBw0idHXYK6QZVr8qWeEykWIMRJWEaZv5Lp6GguPEk
         7shT7lae7yOsPsuTLb1cdsWuTFjnj1C+UHPfD0wVs5oxJLikqMEx3i8faxbFZI/J2ucQ
         CivggnWXJSA4Qi/o8h/YsNb2hKYfI+NIhbBqtCztVMxzpdJ3nO2tSRUfyMtXgkOTRl8w
         OZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708715527; x=1709320327;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjO6dDt+FjEfk0V7zuV+EfvZ+BB1JH7vb0BGN4JQIOk=;
        b=KbKWOctQZ4NHBZtE7alTwb2fZBqCgimp/ztry4mqZZg5FobAJRUPDAbqZh5+Ly+wz3
         KALXyNFCJSCOOl2EuoSi5BAhGAJVlF0p+SbmJci2DbEFsjGwBqqIIqScTdFlYB0zGEVC
         GnSB709oVkCKBq+riyaowGxNzbnyJp9syxY3KuZXgzKiQQN498BkhUM0I7QvQkwpsKNs
         iOGPtuP1D4ypGFAZml8l88IsIFdpbGekTelzPFNMW7eQTZoXAjXGDyCeoa/rivdfvmX/
         KPf1dzetLpL06jESehSHAMw218zGQyKmcmIPIrYatQMK+6WXyvZAV4mwy2Pw0LGM2vKO
         KnBw==
X-Gm-Message-State: AOJu0YxxKFE1n3xYI7VX0nuBu+5i9kV/p9joG2xAWBzDukBRwzTubPB7
	iy30tsS/6h901Jzd4OM90ZyFNdY6libkqLLsmtu3wor4/UPJYR66vnJZYKQAM4zlE9IGqekynwE
	GIXE=
X-Google-Smtp-Source: AGHT+IH5TFVarwgsxY0uJeUF4Zf6fZjDsytPX0KqHJdG3BA9gblosU9plJhvSTEokzLT1V+WJaQF7A==
X-Received: by 2002:a17:90a:6d61:b0:299:e898:ed30 with SMTP id z88-20020a17090a6d6100b00299e898ed30mr700278pjj.37.1708715526775;
        Fri, 23 Feb 2024 11:12:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id nr5-20020a17090b240500b00299fe9c395asm1872596pjb.4.2024.02.23.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 11:12:06 -0800 (PST)
Message-ID: <65d8ee06.170a0220.910e1.8bf9@mx.google.com>
Date: Fri, 23 Feb 2024 11:12:06 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-23-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 27 runs,
 4 regressions (renesas-devel-2024-02-23-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 27 runs, 4 regressions (renesas-devel-2024-02-=
23-v6.8-rc5)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

imx53-qsrb            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

imx6dl-riotboard      | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-23-v6.8-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-23-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      74deefee78fc74bf27b23a5c00267a5e697f72e9 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8bd83ea6ef6b4c1637052

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d8bd83ea6ef6b4c=
1637053
        failing since 101 days (last pass: renesas-devel-2023-06-26-v6.4, f=
irst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx53-qsrb            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8bd828745bb470763705a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65d8bd828745bb470763705f
        failing since 353 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2024-02-23T15:44:43.295970  + set +x
    2024-02-23T15:44:43.296121  [   29.685511] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1027994_1.6.2.3.1>
    2024-02-23T15:44:43.405229  #
    2024-02-23T15:44:43.506863  / # #export SHELL=3D/bin/sh
    2024-02-23T15:44:43.507362  =

    2024-02-23T15:44:43.608232  / # export SHELL=3D/bin/sh. /lava-1027994/e=
nvironment
    2024-02-23T15:44:43.608758  =

    2024-02-23T15:44:43.709651  / # . /lava-1027994/environment/lava-102799=
4/bin/lava-test-runner /lava-1027994/1
    2024-02-23T15:44:43.710357  =

    2024-02-23T15:44:43.713850  / # /lava-1027994/bin/lava-test-runner /lav=
a-1027994/1 =

    ... (13 line(s) more)  =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx6dl-riotboard      | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8bd6e8745bb4707637042

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65d8bd6e8745bb4707637047
        new failure (last pass: renesas-devel-2024-02-22-v6.8-rc5)

    2024-02-23T15:44:37.813277  + set[   27.662639] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1027996_1.6.2.3.1>
    2024-02-23T15:44:37.813428   +x
    2024-02-23T15:44:37.920343  / # #
    2024-02-23T15:44:38.021451  export SHELL=3D/bin/sh
    2024-02-23T15:44:38.021928  #
    2024-02-23T15:44:38.122688  / # export SHELL=3D/bin/sh. /lava-1027996/e=
nvironment
    2024-02-23T15:44:38.123111  =

    2024-02-23T15:44:38.223833  / # . /lava-1027996/environment/lava-102799=
6/bin/lava-test-runner /lava-1027996/1
    2024-02-23T15:44:38.224378  =

    2024-02-23T15:44:38.227284  / # /lava-1027996/bin/lava-test-runner /lav=
a-1027996/1 =

    ... (12 line(s) more)  =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8be6a7ea82436ad63701e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-23-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d8be6a7ea82436a=
d63701f
        failing since 32 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

