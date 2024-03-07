Return-Path: <linux-renesas-soc+bounces-3549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F08D874F4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 13:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 355382844F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 12:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1CC3717F;
	Thu,  7 Mar 2024 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7w9MAB4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516E512A175
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709815261; cv=none; b=g2wrmIqzzcLaf8xZOLXXLvdD9K2NTxx3p+Uhj0kvCjo9TPadAsm9lk46yb8epiZXqXLAcjQ/z9LyPUgGQJgrPvrBevJJTRiKZFrZNY0Z4KEExBtOENcysoPR7ERu11aqloxD7yzRaLOyaPdfdBfFC3yg7rwR4Lt5nOelCj3VIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709815261; c=relaxed/simple;
	bh=uJtL4FerHmIZm+ynksjfJOqqs+vznz7pfOoLKgBzKTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HLJa25cUGX+G5nI9rz3aOsfIhNK05YxYkk097qiqYP2Jpki0b20AOhwuIO5Mg5zMjaJxQ4WHboPquZGTQoIJbvLiRCWH04JIeIeTgMd6PfZAR3GUDXdkMgAz+dp7c9iWx+xZGQ77HR0yg9oH2/WrBtx5go6YNtD457mCn1t4NGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7w9MAB4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709815259; x=1741351259;
  h=date:from:to:cc:subject:message-id;
  bh=uJtL4FerHmIZm+ynksjfJOqqs+vznz7pfOoLKgBzKTI=;
  b=W7w9MAB4PXclKGS+/U7Du4mW7kql7gWMnq6/ysudhsRio3QCkVyAc8Ii
   9EFXmackDo1aXOJqDawfXUBv286d8W/1e0DWpIoh8uaoNOwgcxnDbodjt
   5Rtge+HUQp1sW8oJlq2pGE9rlXctEsUHk1LoTTrqwWvafSfMdcLPfGmaE
   rrRsMxrpCidePG8omE7Qt4OaR/D4Znnp8oBQsbM2SeOq00yKtuIW89J8l
   ibaj5ZftPdBnc2pN09BPYUTSlyJVzcRqHsTKl3Qd2RogHusE1B2OzaBvX
   T3XRX23wUYNaHywyMRwumSoASWTeJVQ45An/tSVGj7OijNq6L3wSpyTrq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="22002744"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22002744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 04:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="14588532"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2024 04:40:57 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riD3P-0005BV-18;
	Thu, 07 Mar 2024 12:40:55 +0000
Date: Thu, 07 Mar 2024 20:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/v4m-gray-hawk-single-v2] BUILD
 SUCCESS 0e57fc35e4693eea7f90f42ab0043e12e98ff176
Message-ID: <202403072029.dykCpWjp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/v4m-gray-hawk-single-v2
branch HEAD: 0e57fc35e4693eea7f90f42ab0043e12e98ff176  arm64: dts: renesas: gray-hawk-single: Add second debug serial port

elapsed time: 1200m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240307   gcc  
arc                   randconfig-002-20240307   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        neponset_defconfig   gcc  
arm                   randconfig-002-20240307   gcc  
arm                   randconfig-003-20240307   gcc  
arm                          sp7021_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240307   gcc  
arm64                 randconfig-002-20240307   gcc  
arm64                 randconfig-003-20240307   gcc  
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240307   gcc  
csky                  randconfig-002-20240307   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240307   clang
i386         buildonly-randconfig-002-20240307   gcc  
i386         buildonly-randconfig-003-20240307   clang
i386         buildonly-randconfig-004-20240307   gcc  
i386         buildonly-randconfig-005-20240307   gcc  
i386         buildonly-randconfig-006-20240307   clang
i386                                defconfig   clang
i386                  randconfig-001-20240307   gcc  
i386                  randconfig-002-20240307   gcc  
i386                  randconfig-003-20240307   clang
i386                  randconfig-004-20240307   gcc  
i386                  randconfig-005-20240307   gcc  
i386                  randconfig-006-20240307   clang
i386                  randconfig-011-20240307   clang
i386                  randconfig-012-20240307   gcc  
i386                  randconfig-013-20240307   clang
i386                  randconfig-014-20240307   clang
i386                  randconfig-015-20240307   clang
i386                  randconfig-016-20240307   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240307   gcc  
loongarch             randconfig-002-20240307   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240307   gcc  
nios2                 randconfig-002-20240307   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240307   gcc  
parisc                randconfig-002-20240307   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240307   gcc  
powerpc               randconfig-002-20240307   gcc  
powerpc               randconfig-003-20240307   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc64             randconfig-001-20240307   gcc  
powerpc64             randconfig-002-20240307   gcc  
powerpc64             randconfig-003-20240307   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240307   gcc  
sh                    randconfig-002-20240307   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240307   gcc  
sparc64               randconfig-002-20240307   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240307   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-004-20240307   clang
x86_64       buildonly-randconfig-006-20240307   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240307   clang
x86_64                randconfig-006-20240307   clang
x86_64                randconfig-014-20240307   clang
x86_64                randconfig-015-20240307   clang
x86_64                randconfig-016-20240307   clang
x86_64                randconfig-073-20240307   clang
x86_64                randconfig-075-20240307   clang
x86_64                randconfig-076-20240307   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240307   gcc  
xtensa                randconfig-002-20240307   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

