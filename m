Return-Path: <linux-renesas-soc+bounces-3693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344A9878A0B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 22:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A83DB213B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 21:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B675057305;
	Mon, 11 Mar 2024 21:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbmnPwPQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6457307
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710192484; cv=none; b=sFSwj7bl8TIwncbcLVNLEVelY/ryi5ndqq2qCPoRWcvalpSSnnpbrsaK7y+djbf1RNN1wVPQUCb+lcJVyGOFAX2EGWxNRCPf+5x753WXCNCpKapSG7mZDd2o4K4Owjgx2KR3zLVPEs1UxIfXQrOTCl2QJS2RCM95/Zl8OW9oCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710192484; c=relaxed/simple;
	bh=SZkloHtf9c8HnMEmyMIcgI4y6VCA8LoxQ/vY9aIjcTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kid1UGAtAeh/VDbiJ0CjwrrBQi0ZhOw/al/bzUN6OCmlMCEY1yT1jPltDwihyAM5bMruXJwe7Dbel7uFdfmazIZw4L7aKp7RoJP5ObLm/htNpXDvK0HLfTkV8OtsTHDW8YKzQDbpK7lg7f7aKiiVaDSgSV9chJwnjqxjL5KFQRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbmnPwPQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710192482; x=1741728482;
  h=date:from:to:cc:subject:message-id;
  bh=SZkloHtf9c8HnMEmyMIcgI4y6VCA8LoxQ/vY9aIjcTk=;
  b=QbmnPwPQZqhI7sX6bzQtclRU8NJ0GPxKQVcDfwEAtZjM8MyvhfqWck0z
   ae1on+LbqQpouGR44t4sIDaOBt5OrzvDdHccrJ/i7AIhQ/Kx/ipRgxOKe
   qSfQeDX6hHlymI9SlbOXHj2ZyBYKpIlPb1T3hJJrcPBI+4BvWcrP8c3NI
   0+CmdEfrWhyJ3rKbrAooFuKUMeEfXiJNcQ4RZaS0LXlg7snUWIhLOvI9p
   20vocdoe9imgC3mBcfqJjxrLXY7q/0Ig2N6V263ekNFjyT5eItoVu36GC
   s8M33XlyfmDgRa0KQCUX77xB9hYVYh4X63FF5puma7kmf7wgyd8leeF3N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15517597"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15517597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 14:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="48755090"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2024 14:28:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjnBd-0009Sj-1x;
	Mon, 11 Mar 2024 21:27:57 +0000
Date: Tue, 12 Mar 2024 05:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6e60eab20a8f0eebadd576a31d449c6b503c4013
Message-ID: <202403120511.zB6qDNAN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6e60eab20a8f0eebadd576a31d449c6b503c4013  Merge tag 'v6.8' into renesas-devel

elapsed time: 724m

configs tested: 192
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
arc                   randconfig-001-20240311   gcc  
arc                   randconfig-002-20240311   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ixp4xx_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240311   clang
arm                   randconfig-002-20240311   gcc  
arm                   randconfig-003-20240311   clang
arm                   randconfig-004-20240311   clang
arm                       versatile_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240311   clang
arm64                 randconfig-002-20240311   clang
arm64                 randconfig-003-20240311   clang
arm64                 randconfig-004-20240311   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240311   gcc  
csky                  randconfig-002-20240311   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240311   clang
hexagon               randconfig-002-20240311   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240311   clang
i386         buildonly-randconfig-002-20240311   clang
i386         buildonly-randconfig-003-20240311   clang
i386         buildonly-randconfig-004-20240311   gcc  
i386         buildonly-randconfig-005-20240311   clang
i386         buildonly-randconfig-005-20240312   clang
i386         buildonly-randconfig-006-20240311   clang
i386                                defconfig   clang
i386                  randconfig-001-20240311   gcc  
i386                  randconfig-002-20240311   gcc  
i386                  randconfig-002-20240312   clang
i386                  randconfig-003-20240311   clang
i386                  randconfig-004-20240311   clang
i386                  randconfig-005-20240311   gcc  
i386                  randconfig-006-20240311   clang
i386                  randconfig-011-20240311   gcc  
i386                  randconfig-012-20240311   gcc  
i386                  randconfig-013-20240311   clang
i386                  randconfig-013-20240312   clang
i386                  randconfig-014-20240311   gcc  
i386                  randconfig-014-20240312   clang
i386                  randconfig-015-20240311   clang
i386                  randconfig-016-20240311   clang
i386                  randconfig-016-20240312   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240311   gcc  
loongarch             randconfig-002-20240311   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
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
nios2                 randconfig-001-20240311   gcc  
nios2                 randconfig-002-20240311   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240311   gcc  
parisc                randconfig-002-20240311   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240311   gcc  
powerpc               randconfig-002-20240311   clang
powerpc               randconfig-003-20240311   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240311   clang
powerpc64             randconfig-002-20240311   clang
powerpc64             randconfig-003-20240311   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240311   clang
riscv                 randconfig-002-20240311   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240311   clang
s390                  randconfig-002-20240311   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240311   gcc  
sh                    randconfig-002-20240311   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240311   gcc  
sparc64               randconfig-002-20240311   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240311   gcc  
um                    randconfig-002-20240311   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240311   clang
x86_64       buildonly-randconfig-002-20240311   clang
x86_64       buildonly-randconfig-003-20240311   clang
x86_64       buildonly-randconfig-004-20240311   gcc  
x86_64       buildonly-randconfig-005-20240311   clang
x86_64       buildonly-randconfig-006-20240311   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240311   clang
x86_64                randconfig-002-20240311   clang
x86_64                randconfig-003-20240311   gcc  
x86_64                randconfig-004-20240311   gcc  
x86_64                randconfig-005-20240311   gcc  
x86_64                randconfig-006-20240311   clang
x86_64                randconfig-011-20240311   clang
x86_64                randconfig-012-20240311   clang
x86_64                randconfig-013-20240311   clang
x86_64                randconfig-014-20240311   gcc  
x86_64                randconfig-015-20240311   clang
x86_64                randconfig-016-20240311   gcc  
x86_64                randconfig-071-20240311   gcc  
x86_64                randconfig-072-20240311   clang
x86_64                randconfig-073-20240311   clang
x86_64                randconfig-074-20240311   gcc  
x86_64                randconfig-075-20240311   clang
x86_64                randconfig-076-20240311   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240311   gcc  
xtensa                randconfig-002-20240311   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

