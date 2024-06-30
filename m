Return-Path: <linux-renesas-soc+bounces-6921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7691D197
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 14:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CA81B211ED
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 12:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E587912E1F1;
	Sun, 30 Jun 2024 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9GQVW/E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE04A2B9A2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Jun 2024 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719750061; cv=none; b=outqzpMsYkm2sod0GeshG4URgWSDVvPAvVMuLLwSYmgsjG3LniNLe44Bv3qFiRsZc306iUpJQLVMSLM7uZOKLZdmC6MO1uwHtXzRp59S4D9rxwbfARCm5XGsqPjH0URpnO3pMWrbFAbhK1LwiAuxV109OtGdtB5oJLcgthIP/fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719750061; c=relaxed/simple;
	bh=fpq7ylC2U+In1rpzGg4eS1pmy3CZweV6a6wQia2VZuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VTXTj9aq8aYM5tz//yV4Mv+chbhcdJnu87nEhjVuzAeJzIgs4ipbnFo5tY4s3DOrmUMeTKCraDmk6/CRdm+Sd5vvmC9Zp9n7cphK5MVX4uHXSH8+a1KTw+oz7izuFa7Lg6HjklNWX9Yu1FSSr8k0zILEoJhFJdpB+xwRgjCMLXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9GQVW/E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719750060; x=1751286060;
  h=date:from:to:cc:subject:message-id;
  bh=fpq7ylC2U+In1rpzGg4eS1pmy3CZweV6a6wQia2VZuY=;
  b=V9GQVW/EAezvM6sqKYPkx5zXz+azbqREYwZvcrF2+4Bkz1KbnHxlbTdu
   T4kl1AqTjTXx960Se8HswBzc2gwvH76esKwGYkkQyqRrl0q4ER1txtfR4
   9FgA+ElGigYt9FW8FllydXMZvFiG3iO0JJcjPO4J91OKN5M76brYqsTGl
   RiIfdWAnRUwZfrYFPmwjDv2CY0h8Jz/fw3Gln7hgmCy2CovHqmtrl8dBG
   ejNRBM72VX/XkWY081R7/pCNoB+5LKHbkXr3Gm2JvjbLgRbxsK+r6uLwz
   G6fv1FIDUIvINm8D+e4pIGkSa2KCkSXW0q1mTGVgbtM/vV3rxaS1Z33NE
   w==;
X-CSE-ConnectionGUID: pUYbopCzRDuVQVO4XnLuaQ==
X-CSE-MsgGUID: xyLiCAYqQ5Or/ntQIk6hoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="34317016"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="34317016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 05:21:00 -0700
X-CSE-ConnectionGUID: X1lD0IT2SJuKoqQ0JwOMkg==
X-CSE-MsgGUID: 3IexCrV6QiyPSpv1SrImTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="68440475"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jun 2024 05:20:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNtY8-000LXr-0T;
	Sun, 30 Jun 2024 12:20:56 +0000
Date: Sun, 30 Jun 2024 20:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.11] BUILD SUCCESS
 c7e58843d1e49a6b54d528a8ea34933cafb713f2
Message-ID: <202406302025.k5YmcpPy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.11
branch HEAD: c7e58843d1e49a6b54d528a8ea34933cafb713f2  clk: renesas: r9a08g045: Add clock, reset and power domain support for I2C

elapsed time: 4012m

configs tested: 89
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240630   gcc-13.2.0
arc                   randconfig-002-20240630   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                   randconfig-001-20240630   gcc-13.2.0
arm                   randconfig-002-20240630   clang-17
arm                   randconfig-002-20240630   gcc-13.2.0
arm                   randconfig-003-20240630   clang-19
arm                   randconfig-003-20240630   gcc-13.2.0
arm                   randconfig-004-20240630   clang-19
arm                   randconfig-004-20240630   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240630   clang-15
arm64                 randconfig-001-20240630   gcc-13.2.0
arm64                 randconfig-002-20240630   clang-19
arm64                 randconfig-002-20240630   gcc-13.2.0
arm64                 randconfig-003-20240630   clang-19
arm64                 randconfig-003-20240630   gcc-13.2.0
arm64                 randconfig-004-20240630   clang-19
arm64                 randconfig-004-20240630   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240630   gcc-13.2.0
csky                  randconfig-002-20240630   gcc-13.2.0
hexagon               randconfig-001-20240630   clang-15
hexagon               randconfig-002-20240630   clang-16
i386         buildonly-randconfig-001-20240628   gcc-10
i386         buildonly-randconfig-002-20240628   gcc-10
i386         buildonly-randconfig-003-20240628   gcc-10
i386         buildonly-randconfig-004-20240628   gcc-10
i386         buildonly-randconfig-005-20240628   gcc-10
i386         buildonly-randconfig-006-20240628   gcc-10
i386                  randconfig-001-20240628   gcc-10
i386                  randconfig-002-20240628   gcc-10
i386                  randconfig-003-20240628   gcc-10
i386                  randconfig-004-20240628   gcc-10
i386                  randconfig-005-20240628   gcc-10
i386                  randconfig-006-20240628   gcc-10
i386                  randconfig-011-20240628   gcc-10
i386                  randconfig-012-20240628   gcc-10
i386                  randconfig-013-20240628   gcc-10
i386                  randconfig-014-20240628   gcc-10
i386                  randconfig-015-20240628   gcc-10
i386                  randconfig-016-20240628   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240630   gcc-13.2.0
loongarch             randconfig-002-20240630   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240630   gcc-13.2.0
nios2                 randconfig-002-20240630   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240630   gcc-13.2.0
parisc                randconfig-002-20240630   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240630   clang-19
powerpc               randconfig-001-20240630   gcc-13.2.0
powerpc               randconfig-002-20240630   clang-17
powerpc               randconfig-002-20240630   gcc-13.2.0
powerpc               randconfig-003-20240630   clang-19
powerpc               randconfig-003-20240630   gcc-13.2.0
powerpc64             randconfig-001-20240630   clang-19
powerpc64             randconfig-001-20240630   gcc-13.2.0
powerpc64             randconfig-002-20240630   gcc-13.2.0
powerpc64             randconfig-003-20240630   clang-15
powerpc64             randconfig-003-20240630   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240630   clang-19
riscv                 randconfig-001-20240630   gcc-13.2.0
riscv                 randconfig-002-20240630   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240630   gcc-13.2.0
s390                  randconfig-002-20240630   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240630   gcc-13.2.0
sh                    randconfig-002-20240630   gcc-13.2.0
sparc64               randconfig-001-20240630   gcc-13.2.0
sparc64               randconfig-002-20240630   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240630   gcc-13
um                    randconfig-001-20240630   gcc-13.2.0
um                    randconfig-002-20240630   gcc-13
um                    randconfig-002-20240630   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240630   gcc-13.2.0
xtensa                randconfig-002-20240630   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

