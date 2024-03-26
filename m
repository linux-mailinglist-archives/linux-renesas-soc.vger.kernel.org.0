Return-Path: <linux-renesas-soc+bounces-4075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6926888D185
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 23:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A49E1C2B857
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 22:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7766FE16;
	Tue, 26 Mar 2024 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OODaOfls"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0123DAC0D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 22:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711493288; cv=none; b=YB30xE07QtsiHcUH+Yd9m4T1xYMaVtvLmxg9q07Q3MFPhL7e6qj+Ykp5RISpIrWB72hwa8rU5yBtJqVs1xO8+yZxA9wcTmFix9Z3bQ9IZaVSPz2ezPUbl3esHZTiEiRDfr0L7b74cCO514mtD/CXWPWYQ+3udk01tD/B77l5bJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711493288; c=relaxed/simple;
	bh=EAYLHME3+Sza4iGwjMaCVuwcb9yrqFb49Os4nyvSJ3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hf+emiXT9clqHIY0bULKvxFaLvCQWLjSMaXavFQs7uqlX191oP17537p+kKNn7ZjUgLIPV2Z9h0AiyPdKmS3LYJqjizSQBx0+2B0nBEFa9E7wTKD+2iXyFIidvE/YZFkc1gLpRybGQGSoNGTS8C2m7GZ1NL7wDPz449+D2tHYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OODaOfls; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711493286; x=1743029286;
  h=date:from:to:cc:subject:message-id;
  bh=EAYLHME3+Sza4iGwjMaCVuwcb9yrqFb49Os4nyvSJ3U=;
  b=OODaOflsrczIHXrgJxcQdhsZiB0Ymrd3hHnbqXZZcmBnLx1iWbJgpNd9
   ozbmEZ4JsNScXQRDFudsWvUT9tuuX+ckQzoPj1SyPlseE/XjF6w9C4WFm
   3QwrxQPRknDWB+GHTHWA8V5Mek8yJZ8pOgPukw85mUp2IBqfeugM90YkI
   QnxaNbLc/oZUTQqtkx84fnoNHaYtHTWs9ux+Sw118z9JafO0/sSYfq0WT
   Cci28EbykSCuBycqa463YgL7Miyrdr5gWLjs7NyJ4gZB/ih7YyCQ12zXG
   J22zTHMb8fvdNTnyErR9L2NDqJt617b3BF47pVYJY1qZV2u9vEnc6ngsm
   w==;
X-CSE-ConnectionGUID: 7e1x4UM8RkSbPKe56EOImA==
X-CSE-MsgGUID: YUYHPumaRXW1wwv6WceKsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6434975"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6434975"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16493164"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2024 15:48:04 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpFaL-0000VM-2d;
	Tue, 26 Mar 2024 22:48:01 +0000
Date: Wed, 27 Mar 2024 06:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 7683cf29bec6134fd90330e19db59f3465c7ac7c
Message-ID: <202403270614.ijofGzsn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 7683cf29bec6134fd90330e19db59f3465c7ac7c  Merge branch 'renesas-next' into renesas-devel

elapsed time: 828m

configs tested: 162
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20240326   gcc  
arc                   randconfig-002-20240326   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240326   gcc  
arm                   randconfig-002-20240326   gcc  
arm                   randconfig-003-20240326   gcc  
arm                   randconfig-004-20240326   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240326   clang
arm64                 randconfig-002-20240326   clang
arm64                 randconfig-003-20240326   gcc  
arm64                 randconfig-004-20240326   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240326   gcc  
csky                  randconfig-002-20240326   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240326   clang
hexagon               randconfig-002-20240326   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240326   gcc  
i386         buildonly-randconfig-002-20240326   clang
i386         buildonly-randconfig-003-20240326   clang
i386         buildonly-randconfig-004-20240326   gcc  
i386         buildonly-randconfig-005-20240326   gcc  
i386         buildonly-randconfig-006-20240326   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240326   gcc  
i386                  randconfig-002-20240326   gcc  
i386                  randconfig-003-20240326   gcc  
i386                  randconfig-004-20240326   clang
i386                  randconfig-005-20240326   gcc  
i386                  randconfig-006-20240326   clang
i386                  randconfig-011-20240326   clang
i386                  randconfig-012-20240326   gcc  
i386                  randconfig-013-20240326   clang
i386                  randconfig-014-20240326   clang
i386                  randconfig-015-20240326   clang
i386                  randconfig-016-20240326   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240326   gcc  
loongarch             randconfig-002-20240326   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240326   gcc  
nios2                 randconfig-002-20240326   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240326   gcc  
parisc                randconfig-002-20240326   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240326   clang
powerpc               randconfig-002-20240326   gcc  
powerpc               randconfig-003-20240326   clang
powerpc64             randconfig-001-20240326   gcc  
powerpc64             randconfig-002-20240326   gcc  
powerpc64             randconfig-003-20240326   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240326   gcc  
riscv                 randconfig-002-20240326   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240326   clang
s390                  randconfig-002-20240326   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240326   gcc  
sh                    randconfig-002-20240326   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240326   gcc  
sparc64               randconfig-002-20240326   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240326   gcc  
um                    randconfig-002-20240326   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240326   clang
x86_64       buildonly-randconfig-002-20240326   gcc  
x86_64       buildonly-randconfig-003-20240326   clang
x86_64       buildonly-randconfig-004-20240326   gcc  
x86_64       buildonly-randconfig-005-20240326   gcc  
x86_64       buildonly-randconfig-006-20240326   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240326   gcc  
x86_64                randconfig-002-20240326   gcc  
x86_64                randconfig-003-20240326   gcc  
x86_64                randconfig-004-20240326   clang
x86_64                randconfig-005-20240326   gcc  
x86_64                randconfig-006-20240326   clang
x86_64                randconfig-011-20240326   gcc  
x86_64                randconfig-012-20240326   clang
x86_64                randconfig-013-20240326   gcc  
x86_64                randconfig-014-20240326   gcc  
x86_64                randconfig-015-20240326   clang
x86_64                randconfig-016-20240326   clang
x86_64                randconfig-071-20240326   clang
x86_64                randconfig-072-20240326   gcc  
x86_64                randconfig-073-20240326   gcc  
x86_64                randconfig-074-20240326   gcc  
x86_64                randconfig-075-20240326   gcc  
x86_64                randconfig-076-20240326   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240326   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

