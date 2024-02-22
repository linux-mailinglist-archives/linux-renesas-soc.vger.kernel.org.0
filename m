Return-Path: <linux-renesas-soc+bounces-3108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8885FC61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 16:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 994961F21EF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 15:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC891474D4;
	Thu, 22 Feb 2024 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="j/BY/5zk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9078134CDC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708615869; cv=none; b=HvczAwh49f2W43JeGA0qjQdlMgxKluyGnKtLZyoMTqZbdjQbkDQbXpaD4pTKCJRWHp8pkauE0RLqRQDPt42vNns7cbFHNocFndOdUoZXHK5AkSvimljYYJKsUC6SemE6OoTTIRP0ix5YuoGETU2fREh+0pdwp9dO1SIILc/TKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708615869; c=relaxed/simple;
	bh=ogOJb+G9y9dA6etESx2Dwk2pQo1LQBGMw3xj3vhgPXQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=YL3Nt3RGhXUzmnMtY7iYOYr7Kap2RVQ+Xx6GP+hIW9oQJDZU+xaiqg+ljRiH+m88bJYKkAkq8WSb3y7/6bW+pa2rvMFbBoVVtpEzpNY6ZNhXr5wd+unNFs5/KuqZV9K5FFqITCNgeBzVCfWb+oxRU+f+n8JHPg4OEePcuRPjT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=j/BY/5zk; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e45bd5014dso2197986b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 07:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708615865; x=1709220665; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6/Fe2w5LUlunGPEIOU4UezACYUk2+YC0jLNtAiffr0M=;
        b=j/BY/5zkecqnmZ13d4gRcZJHT2CR6Ct/HK8xa+lk1YAcCEt7NkSTofb+/OBfi+VMZZ
         RTK14mkoTsSkn4lIgcI+0X2WOyTnMWkMtv7C3hBYLOEeTY2c8aJRIANZGd35Vd5OHBUZ
         kKx/bORWvYx1AoAnr64PzGpmQOaYdNBBOi/SQodcgr3f/smafABCxrt/iipM4aQhj9J1
         EBD5F0EtW83YjhSn5PKRvpWSF28/hYAaCH/I3/ve8j1CNVAW/VIQBN1brXYabX36y4Tw
         10e3RBdahQ+erEb1bt83V2s3F5+wkYfciaLWZLNYecuDIrk1UlqUcBUmBQIpfGxqCoVg
         KOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708615865; x=1709220665;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/Fe2w5LUlunGPEIOU4UezACYUk2+YC0jLNtAiffr0M=;
        b=cv6eGDZeaF2Qk3uQBxvrNfuKZR5M/wBikfz0YHcAaky6+tWtO3UEN+KUMVW9NCnebp
         mcw98u8mTcWY90zr8rxu5ko+3kgo946oTIjNREpasDlbmA7AMIyIpvJXFTVzX5Neg2DD
         m3An8whcO/jv3GYwAuq7qcI5//oTJZlfKW+V3BfRv1mDrXQEZEjZi/oyiJjwvOTfeynb
         553G4xskmvpWW3WuEdW+o68t4dz0hdzV+ErsT64PXU24FM5XG2vziiz6W3P9l7mI/dXz
         pH3auEqU8WEk+CKBTrAEBjOPom/8DFNMzGa6FwFD6hHPrfPva0qvb6Q5ikV2p/8dV0+i
         1QTQ==
X-Gm-Message-State: AOJu0YzHlA0EGLQfFjUfYD7PKifVT6KH6ZqPU/Px7H78v8bP5ZpNnQEd
	6bJ+JTL2boNvQJ3lg706F17WHCHEDT8tV0g/KSvCl5jI6HwMzpaMJ5AcIGxZju1K6JJQAbDcgPP
	T
X-Google-Smtp-Source: AGHT+IHjwfoYyA5GNF1o4Z9axoLduZn+1ztScEHsxdo4/O4asGDdwPGkABSi4OnuqaXFkng1i8ZtDg==
X-Received: by 2002:a05:6a00:1c8a:b0:6e4:69ac:4c94 with SMTP id y10-20020a056a001c8a00b006e469ac4c94mr11647574pfw.34.1708615865589;
        Thu, 22 Feb 2024 07:31:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t33-20020a056a0013a100b006e3635c5641sm10347337pfg.25.2024.02.22.07.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 07:31:05 -0800 (PST)
Message-ID: <65d768b9.050a0220.1b769.0f55@mx.google.com>
Date: Thu, 22 Feb 2024 07:31:05 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-22-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 11 runs,
 2 regressions (renesas-devel-2024-02-22-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 11 runs, 2 regressions (renesas-devel-2024-02-=
22-v6.8-rc5)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =

imx53-qsrb | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-22-v6.8-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-22-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d93b156af0b8c2afc4cad503eb2be252797d5e42 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65d73613a7eed6a8846370ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-22-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-22-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d73613a7eed6a88=
46370ac
        failing since 100 days (last pass: renesas-devel-2023-06-26-v6.4, f=
irst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
imx53-qsrb | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65d73600cfdbfdd7a363701f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-22-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-22-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65d73600cfdbfdd7a3637024
        failing since 352 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2024-02-22T11:54:28.150422  + set +x
    2024-02-22T11:54:28.150575  [   29.708773] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1027370_1.6.2.3.1>
    2024-02-22T11:54:28.260024  #
    2024-02-22T11:54:28.361344  / # #export SHELL=3D/bin/sh
    2024-02-22T11:54:28.361765  =

    2024-02-22T11:54:28.462500  / # export SHELL=3D/bin/sh. /lava-1027370/e=
nvironment
    2024-02-22T11:54:28.462966  =

    2024-02-22T11:54:28.563746  / # . /lava-1027370/environment/lava-102737=
0/bin/lava-test-runner /lava-1027370/1
    2024-02-22T11:54:28.564353  =

    2024-02-22T11:54:28.567465  / # /lava-1027370/bin/lava-test-runner /lav=
a-1027370/1 =

    ... (13 line(s) more)  =

 =20

