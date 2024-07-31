Return-Path: <linux-renesas-soc+bounces-7657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A2942AA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 11:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDF0E1F238C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 09:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7071A4B47;
	Wed, 31 Jul 2024 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGIXucb0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB80943169
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418653; cv=none; b=AedSs57HOlMZc20pcosJApUd0SWLGBxGEo8jqsCF6KiKrx2QtJ2LfADrrS4/qJEObVMvhUTiHfMk6sv+jzilqjrd0UtEn+3TyS/k+0wdZ/J2rTW6kw2g2HU/F+E42YcGNlA271TOjKr94uXYASvKljlUpe9wN9F1R7/Gol22Ckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418653; c=relaxed/simple;
	bh=v3qjLrGuQpJCxDqFda5/QTV0m5w5P8Zr1BwmDUsUCbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tkn+PHzs0OssdDhWc9AveGwD16dSN4CCFkMDfCeKhF/SqqZrinHB+yDuq6rzFA17A2bBFL3NKgIAh597DhDf0eLwrOHPWaVQW0tq8JHqVq4mTx0xqDqwjghGQ9PV9X5iZfWIw8P5KPWsG12d0WAlfnijj5TMuJ9jBxJ8jSz9obY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGIXucb0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722418651; x=1753954651;
  h=date:from:to:cc:subject:message-id;
  bh=v3qjLrGuQpJCxDqFda5/QTV0m5w5P8Zr1BwmDUsUCbk=;
  b=aGIXucb0sT/Yii2reY5366yFy8o5/7QJPikHodXoAKERlkJJK5UIAqPU
   xQAMxVjBWxiI44Kx99hcsJp1Mja4+zXbnhEX+fDq8j2qwPgnGgUzdtmbX
   wi6Owt46+nsyU2Oi/tCWF9fgjSHyE1GeF+GqzAURVB1Fqu4dljfvJKWV3
   LlVRqivngc2mHl6tIOWMYjeuK3dpFVCs8HWSRn3wRKJlYPkdcM7feIJs6
   f1ohyPR0K8puOzUh4M8737RNXVJcR/oKunxnRnV0/4RFbP1Z5thtX9TLM
   knH7SG1xGvOCefa5UZaOTfMQ4nvUyImesS/ObUzURD4JYF0TkqUadmy/M
   A==;
X-CSE-ConnectionGUID: PPiTB/UwQ+Wc74KKsDbq4w==
X-CSE-MsgGUID: 7tCA0SERRu+Wa0im0/aAzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30911682"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="30911682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:37:30 -0700
X-CSE-ConnectionGUID: ApHGGVNXTBaRha/a+l5HCg==
X-CSE-MsgGUID: gHJd1b3JS5y2gvvMkt9dFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="85555988"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2024 02:37:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ5lv-000u67-1H;
	Wed, 31 Jul 2024 09:37:27 +0000
Date: Wed, 31 Jul 2024 17:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 a3cbbd94c24a8430313645e76deda425b673c9b6
Message-ID: <202407311731.sQaLP2ZV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: a3cbbd94c24a8430313645e76deda425b673c9b6  dt-bindings: pinctrl: renesas: Document RZ/G2M v3.0 (r8a774a3) PFC support

elapsed time: 1146m

configs tested: 213
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240731   gcc-13.2.0
arc                   randconfig-002-20240731   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-14.1.0
arm                         lpc18xx_defconfig   gcc-14.1.0
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240731   gcc-13.2.0
arm                   randconfig-001-20240731   gcc-14.1.0
arm                   randconfig-002-20240731   clang-20
arm                   randconfig-002-20240731   gcc-13.2.0
arm                   randconfig-003-20240731   clang-20
arm                   randconfig-003-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-14.1.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240731   clang-15
arm64                 randconfig-001-20240731   gcc-13.2.0
arm64                 randconfig-002-20240731   clang-20
arm64                 randconfig-002-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-14.1.0
arm64                 randconfig-004-20240731   clang-20
arm64                 randconfig-004-20240731   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240731   gcc-13.2.0
csky                  randconfig-001-20240731   gcc-14.1.0
csky                  randconfig-002-20240731   gcc-13.2.0
csky                  randconfig-002-20240731   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240731   clang-16
hexagon               randconfig-002-20240731   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-004-20240731   gcc-13
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-006-20240731   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-001-20240731   gcc-13
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-005-20240731   gcc-13
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-011-20240731   gcc-12
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-012-20240731   gcc-13
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-014-20240731   gcc-8
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-015-20240731   gcc-10
i386                  randconfig-016-20240731   clang-18
i386                  randconfig-016-20240731   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-14.1.0
loongarch             randconfig-002-20240731   gcc-13.2.0
loongarch             randconfig-002-20240731   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                          multi_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-14.1.0
nios2                            alldefconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-14.1.0
nios2                 randconfig-002-20240731   gcc-13.2.0
nios2                 randconfig-002-20240731   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240731   gcc-13.2.0
parisc                randconfig-001-20240731   gcc-14.1.0
parisc                randconfig-002-20240731   gcc-13.2.0
parisc                randconfig-002-20240731   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc               randconfig-001-20240731   clang-20
powerpc               randconfig-002-20240731   gcc-13.2.0
powerpc               randconfig-002-20240731   gcc-14.1.0
powerpc               randconfig-003-20240731   clang-20
powerpc               randconfig-003-20240731   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8541_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240731   clang-20
powerpc64             randconfig-001-20240731   gcc-13.2.0
powerpc64             randconfig-002-20240731   clang-15
powerpc64             randconfig-002-20240731   gcc-13.2.0
powerpc64             randconfig-003-20240731   clang-20
powerpc64             randconfig-003-20240731   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240731   clang-20
riscv                 randconfig-001-20240731   gcc-13.2.0
riscv                 randconfig-002-20240731   clang-15
riscv                 randconfig-002-20240731   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240731   gcc-13.2.0
s390                  randconfig-001-20240731   gcc-14.1.0
s390                  randconfig-002-20240731   gcc-13.2.0
s390                  randconfig-002-20240731   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-14.1.0
sh                    randconfig-001-20240731   gcc-13.2.0
sh                    randconfig-001-20240731   gcc-14.1.0
sh                    randconfig-002-20240731   gcc-13.2.0
sh                    randconfig-002-20240731   gcc-14.1.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240731   gcc-13.2.0
sparc64               randconfig-001-20240731   gcc-14.1.0
sparc64               randconfig-002-20240731   gcc-13.2.0
sparc64               randconfig-002-20240731   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240731   clang-20
um                    randconfig-001-20240731   gcc-13.2.0
um                    randconfig-002-20240731   clang-20
um                    randconfig-002-20240731   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240731   gcc-13
x86_64       buildonly-randconfig-002-20240731   gcc-13
x86_64       buildonly-randconfig-003-20240731   gcc-13
x86_64       buildonly-randconfig-004-20240731   gcc-13
x86_64       buildonly-randconfig-005-20240731   gcc-13
x86_64       buildonly-randconfig-006-20240731   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240731   gcc-13
x86_64                randconfig-002-20240731   gcc-13
x86_64                randconfig-003-20240731   gcc-13
x86_64                randconfig-004-20240731   gcc-13
x86_64                randconfig-005-20240731   gcc-13
x86_64                randconfig-006-20240731   gcc-13
x86_64                randconfig-011-20240731   gcc-13
x86_64                randconfig-012-20240731   gcc-13
x86_64                randconfig-013-20240731   gcc-13
x86_64                randconfig-014-20240731   gcc-13
x86_64                randconfig-015-20240731   gcc-13
x86_64                randconfig-016-20240731   gcc-13
x86_64                randconfig-071-20240731   gcc-13
x86_64                randconfig-072-20240731   gcc-13
x86_64                randconfig-073-20240731   gcc-13
x86_64                randconfig-074-20240731   gcc-13
x86_64                randconfig-075-20240731   gcc-13
x86_64                randconfig-076-20240731   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240731   gcc-13.2.0
xtensa                randconfig-001-20240731   gcc-14.1.0
xtensa                randconfig-002-20240731   gcc-13.2.0
xtensa                randconfig-002-20240731   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

