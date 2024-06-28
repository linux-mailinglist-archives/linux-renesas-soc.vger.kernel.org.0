Return-Path: <linux-renesas-soc+bounces-6882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789D91BE92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 14:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82601C234E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 12:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C481586C1;
	Fri, 28 Jun 2024 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dTluKV7n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CC015689A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577703; cv=none; b=aqHEeOqVb5FnOP+zM+b7GsQYQtipGsJUsfugDCB7vn5Tq5dQv5I9ToNsJKmR9Zkl7epfE/jKBePSqCZKHznCIRExYg9HEXFsrDcocT+UuQYvmOSmMwFod7uOiFBWyPNo20hvl7Suhl+kcZcyPZnd8w2OvHtkgMOz8XqdzdtCY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577703; c=relaxed/simple;
	bh=sLaMv8lB/mZqRX3vgkW2qTyRJv04OPyWtWuhdvmmTfg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=mVRyp40YMaftftIGDgfGs72fRX4LCa37nXZxMUguHu4+vyoN0r1LZBzsBqn8Fx6zIzX42NK5iQjvltnbC1iJ88drIJ4jm+IqlGn7M0LPZ7MD4GuexGax4J+fH4P60CciSjGay29EeJg6i03tB+o9Te9IipYz9xCLnKNZZ0YOYWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dTluKV7n; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-707040e3017so375548a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719577701; x=1720182501; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfFZ2X14FxIHye9hJin6GKkJtDjVLhiF3iizaZRgyCQ=;
        b=dTluKV7nRZdsFAruMLu+Onw4kuxep2RBkCtwGDlUFUh/allX4PlXxF0N9TJhAehgqX
         hi2B73uFo4PIlxza9Sdid20iMDooo2g1rOpphHa4bUqvXNRnUNmHGD7OKgDVQBbu1adB
         pPpDuV0C3efxxOYPHqeb2wGY0A6EhZqdqOObt2nqedUXgeilnbVk2xZUMbs1xHpgfwui
         V9RH6701k2Xzgi1C95wKF7UWL2zYCZHI1CIMgFpW65DptNRPNQF5n5K/TVb1gLrINjD6
         +T/9OmB69tdhvlNbI20GOLXgZPZZDpU0j0qHo2RqyTsX/f/4DVSsIYlDVtRrXvMGGqJU
         rfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577701; x=1720182501;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfFZ2X14FxIHye9hJin6GKkJtDjVLhiF3iizaZRgyCQ=;
        b=GV/N7AngGAisZKZeo+5RZNaEbPChFPq4xsuOntP3pT6N+eAXKhOxJzmItUAzk+EfNC
         JGq4C51wZp2B01nnqBvKfHgadbfqLDfuW//PUcvRrxF/dQoohlewhazxgNcg4bQJl0Ye
         jp6cn93ogZEywOlkJBQbGUqdQfRqcQcUouXoAhG89ZKBYLutX8y6G0fSw9Kn22E3egpB
         z3DLckSepoW0F3FvQDyMYET8pxS0/VunyM/jiD3aYWon15sLfZU/SmmuFs+2JXj8Zy6s
         1b28HllTChF7cgEuY3ryZ76Oq874DM3ojydY1/RA/gOfh291t9xh0InMWDCE1/zstn2z
         cwbw==
X-Gm-Message-State: AOJu0YyM8JezE/OXxrVlLW3QKzU9aWFPZH8uRy2nhsuBDgFVyDYfaHo6
	qhLd4/G4UM+WmI9TuspBpSTyvvpwsOUxw5mbOHwy0XEAT98UOpLyTAikFrWls+x2IyBm4u9gfzz
	6
X-Google-Smtp-Source: AGHT+IGiuLhZh0imxS0YD2a72LQamkk/qe16Zd0mjy4FXlgsl6YXbut7kC94Uf8OHFw1Y/cvsqcW6w==
X-Received: by 2002:a05:6a20:2d98:b0:1be:c2df:3ecf with SMTP id adf61e73a8af0-1bec2df4073mr6686632637.48.1719577701200;
        Fri, 28 Jun 2024 05:28:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802667c59sm1461429b3a.86.2024.06.28.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:28:20 -0700 (PDT)
Message-ID: <667eac64.050a0220.cd4e3.42a8@mx.google.com>
Date: Fri, 28 Jun 2024 05:28:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-28-v6.10-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 24 runs,
 2 regressions (renesas-devel-2024-06-28-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 24 runs, 2 regressions (renesas-devel-2024-06-=
28-v6.10-rc5)

Regressions Summary
-------------------

platform                    | arch  | lab         | compiler | defconfig   =
       | regressions
----------------------------+-------+-------------+----------+-------------=
-------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron | gcc-10   | defconfig   =
       | 1          =

stm32mp157a-dhcor-avenger96 | arm   | lab-broonie | gcc-10   | multi_v7_def=
config | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-28-v6.10-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-28-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b697d5470d57cfd6ff3e1388699cd905334a9220 =



Test Regressions
---------------- =



platform                    | arch  | lab         | compiler | defconfig   =
       | regressions
----------------------------+-------+-------------+----------+-------------=
-------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron | gcc-10   | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/667e7cd85609d994437e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667e7cd85609d9944=
37e708b
        failing since 157 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform                    | arch  | lab         | compiler | defconfig   =
       | regressions
----------------------------+-------+-------------+----------+-------------=
-------+------------
stm32mp157a-dhcor-avenger96 | arm   | lab-broonie | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/667e7bf81caa1006f67e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
stm32mp157a-dhcor-avenger96.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
stm32mp157a-dhcor-avenger96.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667e7bf81caa1006f=
67e7073
        new failure (last pass: renesas-devel-2024-06-27-v6.10-rc5) =

 =20

