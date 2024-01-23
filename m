Return-Path: <linux-renesas-soc+bounces-1736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B98839973
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 20:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CB21F2ADC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 19:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9842823AC;
	Tue, 23 Jan 2024 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oBKfc6Hi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B68003A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706037905; cv=none; b=DGiK1tYYLaVPxpidW0sKxV7NMY7AHsGnOmb0e+6CWT+6b9/NXyvrmcMTvRc/Ax7itwazQA6hfSKE619sUnd0m+XTn2tuWta7XWlf2svuv1T/X6WdVofE9JILpjqLJirJj9p0N19siHsH10P/f0kcLH/8cRLL1vg2qVlzD/3/igc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706037905; c=relaxed/simple;
	bh=OTCipefPNOA4xG9OMnE5bRsYRkPsdBtxnF26g0fM9mM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ZIwQ2LR/3J7FD8mQwfu08ELa5/UoZvua+Cy1SiW5wT+4Sv9TEEF0SrbwA6NpcYalexxwB6EEInJTy5QuIYEfx4+LaK9CvB10nMW85yBxflGrWryq9rg5nQYfoo6mP6pIYElfQ3rBZwz+1jST5leBpuw8oHLOnrvgf0DXTJW3toQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oBKfc6Hi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d427518d52so33705275ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 11:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706037903; x=1706642703; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b+yhP4gt7HfJENH6kMBwOCETJ9l34rqEwwhddpofed4=;
        b=oBKfc6HiYNwtuGhk7mXsJ2SM/fGd8k/m1L8yWZWK9z6sFuCdhwyHrDAS03tEk8v1qj
         9xiG2xb8OKDbm8w/o2zeHyImKxaj87/8AbHKke8xL4qDj24g6rjmg60hBVjYgNZzAqTh
         XYMAknqWWCdZIqrFwE23WIa2X9r5L+bBzjuVipnx/ctYKxnMzJiiVpH5iNy9VIMevKhQ
         DeO7DL2AXA10az0xiyjtAW43hKek3fMp2hhstjwoqdihrT2xeUxP1SMQ3DU6dCCOkREj
         5k+zSmpEEasspAjOaFKTRB2fxEgC4unPwIWpQQF7kW8gKZjKerQF7n+hC7tfvUK1lz2W
         sF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706037903; x=1706642703;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+yhP4gt7HfJENH6kMBwOCETJ9l34rqEwwhddpofed4=;
        b=tzisWEBF1PTCHM/ycrY7WYwuv8I6sMsMxjA2NlzzpBS4h8sFOEd5PRf7NCAGs5N1dZ
         NJooKQOt++skgYDtgaUDDy+CVajXFNOqeBN1Y8HfaIT2wMpNziTmXn9Udz5vCtQBkzyE
         q5R13CiMcuujserDtnXnV3NNbXlBBAd+V1d6B0Gp730txeLJf2o8BGqn5/WcrSL+KB1F
         E0eT+DvjOxvYVQ2QRlqguFb9D5OtIED9H6DyTcdIAB8liBYRt27y2qmrtDVxaD2OrABL
         TsPQMWU75kLur/InaH52hbh5nOYzpbi0CmdrvsSJ6wjmII+WxxsuzoksWuaqnqcxwTCV
         lYLA==
X-Gm-Message-State: AOJu0YwaTZTwGSjnTz62D0cfFtdvmMQKIp2HuqGpY81231HvMDGpA9LS
	Teqk8/2mIntgxGrKYVVaBlpQ1Qt95VDgBEh0uBKKRkuFx037BIJzMvuSZsqETx4BMRF913ILPxA
	rgxg=
X-Google-Smtp-Source: AGHT+IFqm3MEDW0S1r/JaHNd5oWH9KzQs2rNSXhreio0cHR3a+86oyyi0AmZVKqPc5KdscLUjzoBkw==
X-Received: by 2002:a17:902:c1c5:b0:1d7:105c:b6b7 with SMTP id c5-20020a170902c1c500b001d7105cb6b7mr78653plc.39.1706037903007;
        Tue, 23 Jan 2024 11:25:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902b28500b001d7077f0421sm8854304plr.119.2024.01.23.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 11:25:02 -0800 (PST)
Message-ID: <65b0128e.170a0220.8d16e.de25@mx.google.com>
Date: Tue, 23 Jan 2024 11:25:02 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-01-23-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 24 runs,
 7 regressions (renesas-devel-2024-01-23-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 24 runs, 7 regressions (renesas-devel-2024-01-=
23-v6.8-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie     | gcc-10   | defconf=
ig          | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig | 1          =

dove-cubox                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig          | 1          =

meson-g12b-a3...libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig          | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig          | 1          =

stm32mp157a-dhcor-avenger96  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-01-23-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-23-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      05f5ab22e2ee3974e366c09d59419933c49f7a14 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie     | gcc-10   | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65afe307b991ed876d52a479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-bcm2711-=
rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-bcm2711-=
rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afe307b991ed876=
d52a47a
        new failure (last pass: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65afe88ea114df3ceb52a3f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afe88ea114df3ce=
b52a3f7
        new failure (last pass: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65afdfe251c056f98852a403

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afdfe251c056f98=
852a404
        failing since 70 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65afe300b991ed876d52a476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afe300b991ed876=
d52a477
        failing since 1 day (last pass: renesas-devel-2024-01-08-v6.7, firs=
t fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
meson-g12b-a3...libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65afe4595c40fa164452a3f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g1=
2b-a311d-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g1=
2b-a311d-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afe4595c40fa164=
452a3f5
        new failure (last pass: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65afe2a44fe9c53f4552a5eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afe2a44fe9c53f4=
552a5ec
        new failure (last pass: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
stm32mp157a-dhcor-avenger96  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65afe27bff349611f852a3f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-s=
tm32mp157a-dhcor-avenger96.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-23-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-s=
tm32mp157a-dhcor-avenger96.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afe27bff349611f=
852a3f7
        new failure (last pass: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

