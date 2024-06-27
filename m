Return-Path: <linux-renesas-soc+bounces-6847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A47791B1C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 23:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B63D4B20A29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 21:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875FB45BF0;
	Thu, 27 Jun 2024 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QQ7PCgGr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD7CA3D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 21:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719525388; cv=none; b=fCuv49kAnz5YsCPgIhy0hOVPIScM8zrbrKstpG4eTZtROx1BRL3X6qmK979ZGBYhEoRqEGPgdom7uKRk/rhi6RNdSU0TevVueKRgkaV6VZ1TP7FCELcrZ4gr8lco9IRnjBYfE4kwG8fQ87CxanuukSui3ulZBpifJb9AsCRDtgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719525388; c=relaxed/simple;
	bh=J6fMZj74B5hpXLIfAHJzdTnJog+o9RQvyAtErXGiXzg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=bFy9BU4iTU1sp4DgsiNZ98PFPY8csrjZXSa+LH+281/IUla874lOvAwjmsrZJYM40dUj39pPp39MqxLe3+8Z13jdBhlba+GUELtiVwXGgx3RpiHq/hCXya20tKQZoe+bTu6pXApkAGvExOye6myjt8qTXYtdWeUQkgLXfgVj4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QQ7PCgGr; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-718b714d362so4673392a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 14:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719525386; x=1720130186; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7sccxAlASS5dJmZ3r3wy++974d6USpi83nUnJoEIRJc=;
        b=QQ7PCgGrt+40v2l97z873gonwNwkWWyARbhDGjnIP/0UtAPPv6nPXDGJHYW4hQX03r
         pUSm7dKy+4XQOf4ZFmOi2l7jok8OzXH28aCqWVjqtWdSSS5YHtGozGzpl6ZBPnZxOryk
         Mp4MgzfwYaEA878yX+z8LIP2qopw5W1S//c2wwdmzJvEW275W7+Le9YKL6Jg1sAtVDLf
         WvoHu5wfVzilm+lUgKlPPDWoY2J0MlzWWRZjhzwO4XZDZ6yYMrkXAE9zX1f1EcegvBjG
         X1yE1Tgcdm3n1xONzbl4j1HDx7Bh16U3nvgmrOa+tGoX0VF5ag4Jz6DrOcPsP68yJtp+
         Ruqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719525386; x=1720130186;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sccxAlASS5dJmZ3r3wy++974d6USpi83nUnJoEIRJc=;
        b=oONQpQGaFontIwK62yPdtHG+jehA4KPVH8Zr2rEUa1TQRC7N4W8VCr8L3B280rhiSq
         fg+f0AxSLGMEV4YZ6kTKsnOdyOjMMrWUGCW3ImliRIZXVUA3gVrZn039FPDGNS9R9k0c
         wgh/FqeFAcbRhGRiF68039+yFoRadp2TMM3+JsId+Qr9+t28JjChOhQ0B1vN0ZJDQ68r
         LeK/OFOyoii84aia4yE+rIBXymcN7voi0OkL1TpaGiSJjF2K0hXiFYumcAl2FFArOaCH
         u2ZheIe3IHFBdCYYA6f9Q7b3nNokBOXEvjWFomF76fE3CpmS0Kpf8jEZr0W46YIIIkwJ
         2mDA==
X-Gm-Message-State: AOJu0YyO/jUhQNRJsb3I9f0O2TTgk3+Pyscr2nXM9EfeIWqmYLZNz0MO
	TNtYyZyK187CsYQkimaXrm0SgHz9VtpgGw/79kcpmFMB7BqjWk+pzmDmVDVyenL+Nh85rZlbgfz
	l
X-Google-Smtp-Source: AGHT+IHtxqRhdQcsBgAG10Zm+P/xdZ9zZ80GqzxpN5JRDuSMHB9Kbp+vnStj2GcwGhW9IUsIJ9xXNQ==
X-Received: by 2002:a05:6a20:baa1:b0:1be:c4b9:c222 with SMTP id adf61e73a8af0-1bec4b9c3famr5033042637.11.1719525385672;
        Thu, 27 Jun 2024 14:56:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708020555efsm210135b3a.34.2024.06.27.14.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 14:56:25 -0700 (PDT)
Message-ID: <667de009.050a0220.41f85.1156@mx.google.com>
Date: Thu, 27 Jun 2024 14:56:25 -0700 (PDT)
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
Subject: renesas/master baseline-nfs: 23 runs,
 2 regressions (renesas-devel-2024-06-27-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 23 runs, 2 regressions (renesas-devel-2024-06-=
27-v6.10-rc5)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 1    =
      =

sun50i-a64-pine64-plus | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-27-v6.10-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-27-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0f5cb7e6e3f3042bdc6780d9a4fae9ed2d217834 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/667db0a75e1e97a6807e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667db0a75e1e97a68=
07e7077
        failing since 157 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
sun50i-a64-pine64-plus | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/667db3da49551cd9457e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667db3da49551cd94=
57e707d
        new failure (last pass: renesas-devel-2024-06-25-v6.10-rc5) =

 =20

