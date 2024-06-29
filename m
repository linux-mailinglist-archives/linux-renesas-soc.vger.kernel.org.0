Return-Path: <linux-renesas-soc+bounces-6911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE591CE22
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 18:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF5EDB20EFC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 16:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B59A481B9;
	Sat, 29 Jun 2024 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCl/b+9J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F801EB2C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719678759; cv=none; b=JK/IqpwYLGtU+8p9elPYQk9PHZtUKdrFlirewv39/1+tal1jmzhNiwEEuJvjelkhe4+xsM6HO6uuQ7Kl9Vi8zCn8R6RkZRLEASlJ9y0MG1LKLoCJOnLLthb1OCT9UqcSIGHfjjsO2JmKMXXvCzx1jWOwzBng70do1HAk4/OXgHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719678759; c=relaxed/simple;
	bh=wVOLhksMoXQqtZajRdO8VHFxUWFxHlHaAQa5FJYkVOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OM7W9p4E7i24bX8dZ7/Csb5P96EegUMfrH10gZsQzNBhTmhrhjLnXWbmXPt0X24w2cVEejPwujioLX+pBm6T3v/tFsUsB5e+GMkgLK1Gg4pW4BNKFaoAQMUgFjn1m20UJ6e5+mHlZ90R3Xxw7WWx8rMatuVZBuduw1GHdajiusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCl/b+9J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719678758; x=1751214758;
  h=date:from:to:cc:subject:message-id;
  bh=wVOLhksMoXQqtZajRdO8VHFxUWFxHlHaAQa5FJYkVOA=;
  b=GCl/b+9JBNySLO8Kw0qUhVZdYPmtRUpIQ4ThXi/+yrlaupV3Z0aXvDid
   Dh5mzdMaWddR+zcNmKDuBJkZhethLMPkQB+7VZSdCeUHOG6geOBGIDbi3
   bP0hJomrp21aRuanWdyjJUKBl5AqUwJQCcr8FjsBoPtyg2rk6h9TuVcZG
   syB8NmiKgLyDsrD3iclpjlNkl0gPq1cdNtlRttmodaZp5lxuWXOSPHFPz
   EwXswiY1wQMNjRs+9i/TpstnGTBZQ++DV7qJEPt7YHzF8X+sgjhhgM4U7
   XiE2N5WT+2NEsICk/wIpzKQhLqipbKVPZVeVLxtnXyjjUikHJh+4SWZGd
   w==;
X-CSE-ConnectionGUID: axihfjQhSzWyqwMfkG4yLQ==
X-CSE-MsgGUID: Vz+AFVVjTQ+TYyDD7o8+Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27435464"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="27435464"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 09:32:38 -0700
X-CSE-ConnectionGUID: SFwzXWTaSIOCrzz4pOOItw==
X-CSE-MsgGUID: YHdCdahGREiFvvQ8yfo1+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="50003085"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2024 09:32:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNb05-000JlU-34;
	Sat, 29 Jun 2024 16:32:33 +0000
Date: Sun, 30 Jun 2024 00:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 cd9fc3476ba24e7c89a5541bd75de6d43e3f9e75
Message-ID: <202406300012.66UjNMzD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: cd9fc3476ba24e7c89a5541bd75de6d43e3f9e75  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 5998m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240627   gcc-13.2.0
arc                   randconfig-002-20240627   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                                 defconfig   clang-14
arm                            dove_defconfig   gcc-13.2.0
arm                         lpc18xx_defconfig   clang-19
arm                   randconfig-001-20240627   gcc-13.2.0
arm                   randconfig-002-20240627   clang-19
arm                   randconfig-003-20240627   gcc-13.2.0
arm                   randconfig-004-20240627   clang-19
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240627   gcc-13.2.0
arm64                 randconfig-002-20240627   clang-19
arm64                 randconfig-003-20240627   clang-17
arm64                 randconfig-004-20240627   clang-19
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240627   gcc-13.2.0
csky                  randconfig-002-20240627   gcc-13.2.0
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240627   clang-17
hexagon               randconfig-002-20240627   clang-19
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240627   gcc-13.2.0
loongarch             randconfig-002-20240627   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                         cobalt_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   clang-19
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240627   gcc-13.2.0
nios2                 randconfig-002-20240627   gcc-13.2.0
parisc                randconfig-001-20240627   gcc-13.2.0
parisc                randconfig-002-20240627   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                  iss476-smp_defconfig   gcc-13.2.0
powerpc                     kmeter1_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   clang-14
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                      obs600_defconfig   clang-14
powerpc                      ppc6xx_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240627   gcc-13.2.0
powerpc               randconfig-002-20240627   clang-19
powerpc               randconfig-003-20240627   gcc-13.2.0
powerpc64             randconfig-001-20240627   gcc-13.2.0
powerpc64             randconfig-002-20240627   gcc-13.2.0
powerpc64             randconfig-003-20240627   gcc-13.2.0
riscv                            alldefconfig   gcc-13.2.0
riscv                 randconfig-001-20240627   gcc-13.2.0
riscv                 randconfig-002-20240627   clang-19
s390                  randconfig-001-20240627   clang-16
s390                  randconfig-002-20240627   clang-15
sh                    randconfig-001-20240627   gcc-13.2.0
sh                    randconfig-002-20240627   gcc-13.2.0
sparc64               randconfig-001-20240627   gcc-13.2.0
sparc64               randconfig-002-20240627   gcc-13.2.0
um                    randconfig-001-20240627   clang-19
um                    randconfig-002-20240627   clang-19
xtensa                randconfig-001-20240627   gcc-13.2.0
xtensa                randconfig-002-20240627   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

