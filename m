Return-Path: <linux-renesas-soc+bounces-6005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE5902194
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBA081F22CB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 12:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454E77F48A;
	Mon, 10 Jun 2024 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Fu/vKa+g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AD762D2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718022284; cv=none; b=uy6r+0g3dgJ+zB3c0v2OKN5uXtQLsczSs3FE6EKVDO+JCJYQA0ZIe5UhITabHxt1pECTX3RWZ345YKBAo/Thh3bSzvnyEEjZa5GEUDfiyoPO+dnU25/FK83WvISpfe2nKREZuekeQnm2ApDhbLDHzA/df85TyiYYKzSuABRY8bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718022284; c=relaxed/simple;
	bh=qv2WeJf7d2wOXTARaCXimproLndIwe19cTWKpeY9Ows=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Rh/xYBWQJc8MCJBMHKKbfkm/qkF8mvb+uuZYTzzoBC9zkFdHG+CXsHSBkmGo5kqj/iHSGgR0zJ+mbvlk1NByhUoUE6Bqsjgx+AzeRel69PsCuXkEvhUYZzdekyGCwsYVs680K0CgVduHGc10YKgBJ8l8kwLl/90TcgHo8Ihvwv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Fu/vKa+g; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7046e87e9afso742507b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718022281; x=1718627081; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+WmWq50l2tSpLjtjdVY+itgCLBH+hEEOWl0tPmyifI=;
        b=Fu/vKa+gg4IGOeteDwYnWKAJRqclm028BkS25vgoX3pqoOnD1kul5J8X2+i4+xv2VL
         rmKQS3PgJ3nT7niV59AwGlhBG8Uy0DnxbreJzR+ZML4ovcyAwu9CQ04XeHEdyK1jr1EE
         FLFI/LxUgzsw4Cn0dduTdLtgiA6EQSGrfm62owTMIQL5aIdoAnJ/6uv8/L60zeoY6gpK
         eUZzKkYyZw0tlwp+BOiSUEIhhf7Yy8j783S1FqiaJo/wiZz6M4yElshNX+mZat5v13vV
         T63dcRGHgE7ZxrjEXqD/tnCr47UqkHggXujMYcV/iPF/8+V+Aw84EhXd9Q+QyaL+dyl0
         IIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718022281; x=1718627081;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+WmWq50l2tSpLjtjdVY+itgCLBH+hEEOWl0tPmyifI=;
        b=LJnOMYqPkyfQDltXV9FsH3O6ZqjXEpsL8nOECj0zzC+GQA6q13NdWtB7QMU4et1FRP
         oGqYH4i7Blj5KnKvHfzc7p7E4U1GcFOLqK3SPghIjm8W4E/TngE+K8dMBY+s59pE+y65
         G+4aT2yOkwCfja54Bj2dHo/6wqcu0qlQe1XNZ4j4KFBZlYdF/5WdGR6bLwhshWNWPoMX
         j5EwGs12NZCOWVC9HcynSCn+XFs/RgCmYIIIqLe+5PbQLbcSbtxmamQ0XX4F3K1L1QTY
         Le+LcJLEZ+SaUjbVmUAg+3FEMgzh5A+94iBjJd1GJ6GMDlEYMtYicmDlBrivV3awSDlt
         7sKg==
X-Gm-Message-State: AOJu0YxAd57364pSAtD6yI173ki1m6I5zt3D8Eobz432Rd3zuKcuaCqn
	IioyRWJf+I57KogF4yJnU6P8u8S2zfUTmS5K2w4uASjOQNM/OVCRCyCp2A+kT5JVd/FNsG0KZ+k
	0IpE=
X-Google-Smtp-Source: AGHT+IEg7JJLl1bTqleHwcxfUxjnMOgkPsuBuh/9QXoiafaREFot/nkIl7lIBVHhpZsr75ktEQHkow==
X-Received: by 2002:a05:6a00:14c3:b0:704:2d83:39ca with SMTP id d2e1a72fcca58-7042d833e91mr4662841b3a.12.1718022281145;
        Mon, 10 Jun 2024 05:24:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd3b32c4sm6605555b3a.89.2024.06.10.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 05:24:40 -0700 (PDT)
Message-ID: <6666f088.050a0220.f548b.08fc@mx.google.com>
Date: Mon, 10 Jun 2024 05:24:40 -0700 (PDT)
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
Subject: renesas/master baseline-nfs: 24 runs,
 2 regressions (renesas-devel-2024-06-10-v6.10-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 24 runs, 2 regressions (renesas-devel-2024-06-=
10-v6.10-rc3)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-10-v6.10-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-10-v6.10-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2487f042931b26238ef51e0f0c02cb59a2d57047 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6666c21c9b716409c97e70a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6666c21c9b716409c=
97e70a3
        new failure (last pass: renesas-devel-2024-06-07-v6.10-rc2) =

 =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6666c0ae0f84667f9c7e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6666c0ae0f84667f9=
c7e7079
        failing since 139 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

