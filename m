Return-Path: <linux-renesas-soc+bounces-3402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13786EEFD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 07:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F66DB2225E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 06:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECFF7490;
	Sat,  2 Mar 2024 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6UsIiFI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D7F63CB
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Mar 2024 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709362262; cv=none; b=NHw2Aa5CYnl9180N+exUqpEKD0SY0Gmu3BPNEU9ccFGhi6JHqg1/7/3/Tf9s8olecmB69sanjjEr0R3s112bdSM8mmehTfM9qg8GAMA6VFIs3vHhQuFtY+RYr3L2Vxd6c10rLHpK19J6WUG1SN4nZZcn64fCJjDjGcmXLviFkpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709362262; c=relaxed/simple;
	bh=3ZeWMFWFHopMptFDXD9XXfabZ5lbQy97Y8QF7HJPTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Feq9h72CGQfPaBwmriYF2eqzthIzic5dVQTTaDqP65OPigMVARqaYYK8WlYwCr1lV30K1U8BSW95KufhjTRMJ48MEa6Fwjh+anu+Sd1Y5DJsEUS6QuHtJ45/u6w3Xop1quIJI1Z3i8EYD0XZKtwvEbC6+A2cqynKeLnfF3+qMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6UsIiFI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709362260; x=1740898260;
  h=date:from:to:cc:subject:message-id;
  bh=3ZeWMFWFHopMptFDXD9XXfabZ5lbQy97Y8QF7HJPTbQ=;
  b=F6UsIiFIBaFcONOYRgV/wNGOS+f0olLZt3r31bLGclIcxU4MmLog1UJL
   ureanUVsUxwHi5VanEvoY83MZKEMBV6gVanUqEqY/YkelTqgjy5or9bWV
   m+lWqKuwwtIpDUd4NI4l59nArshMnvLjxH8UKjZWwYSZXkjyM2pt7pwYg
   wjbbNA+K8xRc8AJUUFKyn1JLdOyijkhjfFi8fUjdE5M/ofc51grrr2dug
   5BvdNY/K8qdFQ86C7QNujPYS9eXZbAvUBT9PDRcSiqcLZw1Sxo9ZjjhxN
   tnF92uWYOhu60Jb1Lq1jCxpmDZQ2l1tln503t45Fk7dBOT2NJaCZqDctt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4083185"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="4083185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 22:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="13082546"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Mar 2024 22:50:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgJCy-000EPL-0x;
	Sat, 02 Mar 2024 06:50:56 +0000
Date: Sat, 02 Mar 2024 14:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.9] BUILD
 SUCCESS 0d5a9b5d5d2fe6a138a8a9ff2513f446d69f2672
Message-ID: <202403021405.rCoUYV5X-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.9
branch HEAD: 0d5a9b5d5d2fe6a138a8a9ff2513f446d69f2672  dt-bindings: soc: renesas: renesas-soc: Add pattern for gray-hawk

elapsed time: 870m

configs tested: 172
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240302   gcc  
arc                   randconfig-002-20240302   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240302   gcc  
arm                   randconfig-002-20240302   gcc  
arm                   randconfig-003-20240302   gcc  
arm                   randconfig-004-20240302   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240302   gcc  
arm64                 randconfig-002-20240302   gcc  
arm64                 randconfig-003-20240302   clang
arm64                 randconfig-004-20240302   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240302   gcc  
csky                  randconfig-002-20240302   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240302   clang
hexagon               randconfig-002-20240302   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240302   clang
i386         buildonly-randconfig-002-20240302   gcc  
i386         buildonly-randconfig-003-20240302   gcc  
i386         buildonly-randconfig-004-20240302   clang
i386         buildonly-randconfig-005-20240302   gcc  
i386         buildonly-randconfig-006-20240302   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240302   clang
i386                  randconfig-002-20240302   gcc  
i386                  randconfig-003-20240302   clang
i386                  randconfig-004-20240302   gcc  
i386                  randconfig-005-20240302   gcc  
i386                  randconfig-006-20240302   clang
i386                  randconfig-011-20240302   gcc  
i386                  randconfig-012-20240302   gcc  
i386                  randconfig-013-20240302   gcc  
i386                  randconfig-014-20240302   gcc  
i386                  randconfig-015-20240302   clang
i386                  randconfig-016-20240302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240302   gcc  
loongarch             randconfig-002-20240302   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          malta_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240302   gcc  
nios2                 randconfig-002-20240302   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240302   gcc  
parisc                randconfig-002-20240302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240302   clang
powerpc               randconfig-002-20240302   clang
powerpc               randconfig-003-20240302   gcc  
powerpc64             randconfig-001-20240302   clang
powerpc64             randconfig-002-20240302   gcc  
powerpc64             randconfig-003-20240302   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240302   gcc  
riscv                 randconfig-002-20240302   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240302   gcc  
s390                  randconfig-002-20240302   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240302   gcc  
sh                    randconfig-002-20240302   gcc  
sh                          rsk7203_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240302   gcc  
sparc64               randconfig-002-20240302   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240302   gcc  
um                    randconfig-002-20240302   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240302   clang
x86_64       buildonly-randconfig-002-20240302   clang
x86_64       buildonly-randconfig-003-20240302   gcc  
x86_64       buildonly-randconfig-004-20240302   gcc  
x86_64       buildonly-randconfig-005-20240302   gcc  
x86_64       buildonly-randconfig-006-20240302   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240302   clang
x86_64                randconfig-002-20240302   gcc  
x86_64                randconfig-003-20240302   gcc  
x86_64                randconfig-004-20240302   clang
x86_64                randconfig-005-20240302   gcc  
x86_64                randconfig-006-20240302   clang
x86_64                randconfig-011-20240302   clang
x86_64                randconfig-012-20240302   clang
x86_64                randconfig-013-20240302   gcc  
x86_64                randconfig-014-20240302   gcc  
x86_64                randconfig-015-20240302   clang
x86_64                randconfig-016-20240302   gcc  
x86_64                randconfig-071-20240302   clang
x86_64                randconfig-072-20240302   clang
x86_64                randconfig-073-20240302   clang
x86_64                randconfig-074-20240302   gcc  
x86_64                randconfig-075-20240302   clang
x86_64                randconfig-076-20240302   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240302   gcc  
xtensa                randconfig-002-20240302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

