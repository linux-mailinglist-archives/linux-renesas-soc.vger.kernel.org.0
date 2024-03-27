Return-Path: <linux-renesas-soc+bounces-4081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3578788D5C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 06:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3DCC29F8B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 05:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D69163B3;
	Wed, 27 Mar 2024 05:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWPbte4f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9AB36F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 05:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711516579; cv=none; b=ONEUna79o22WN1jwYLfrn/B+05Z+ADCMA96aX6V5RWmqy6+ioYyO3cpTgyore4uJSv1XS3K3lcoE/XFlQ3VBuGe6Dtabfx/nqK7uaZXTM2FNiI/bAPY3/6QH0cY9W4aaf61orHjXKmt/nxVi0YgG5w+WM8U6459voDj9CNH/XPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711516579; c=relaxed/simple;
	bh=2PmbGcyCBjch6NsT7r0KsgBbB2SqJIaGusJ9tCVcNQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o8ODHgeF6dV1bNHhqOTNt/uJ2DBy8bymf9TLwC/6Mon34aBd2c1zFpFGXUtWz1hsOiLvoe9Ikdubx8bIzDbgUxf/rvbOG1H/6wgnEMPcEiPbf3NU0E37cz2AA1L7RGRqtao3IXyqf+eVW3UqszCFItf1rVqoQGufik6ysBbCPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWPbte4f; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711516577; x=1743052577;
  h=date:from:to:cc:subject:message-id;
  bh=2PmbGcyCBjch6NsT7r0KsgBbB2SqJIaGusJ9tCVcNQU=;
  b=fWPbte4flbiwRTtZVNFTrrRpE0t1aIMFGWL8OTAvX1VXmKEMkvOMrvgN
   5W9ENuaFCxpKqbZBJ/Kbkx5rx1BbCxSVLEeY8QDMXwFGg/DON5drUoJD/
   PAjjAmafh2XfQyKWGCMlJK5oonR+67my3ZpspEPUsA+KbAPSxtXvpCjGd
   nOzArmIQyymWTU+ZtzPyPinRO7+grSVOy+aoh3hgldVg4xghuC1Zz1aAa
   tdCOU9ZXfWyHmgxXS+8tzX5mDzMSsjvRP5RQAukBQ4iWDVKaR8JltiIyQ
   uvTos3KCOxUpvnU9109gUyBmKmdF/Ov4gTitg5mGQ5hGZffbfsleAqQ5H
   w==;
X-CSE-ConnectionGUID: x3Lbz7qySK2PUMeWEPYVJg==
X-CSE-MsgGUID: itf2QtvyQ9S6DECOCi5gYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17982983"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17982983"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 22:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16198464"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2024 22:16:14 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpLe0-0000m8-0C;
	Wed, 27 Mar 2024 05:16:12 +0000
Date: Wed, 27 Mar 2024 13:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 fbcb719ebd178a8356851dac407385cc4979da37
Message-ID: <202403271337.UTjO9lMs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: fbcb719ebd178a8356851dac407385cc4979da37  Merge branches 'renesas-arm-defconfig-for-v6.10', 'renesas-drivers-for-v6.10', 'renesas-dt-bindings-for-v6.10' and 'renesas-dts-for-v6.10' into renesas-next

elapsed time: 1217m

configs tested: 196
configs skipped: 7

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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240327   gcc  
arc                   randconfig-002-20240327   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-004-20240327   gcc  
arm                          sp7021_defconfig   gcc  
arm                       spear13xx_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240327   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240327   gcc  
csky                  randconfig-002-20240327   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240326   gcc  
i386         buildonly-randconfig-002-20240326   clang
i386         buildonly-randconfig-003-20240326   clang
i386         buildonly-randconfig-003-20240327   clang
i386         buildonly-randconfig-004-20240326   gcc  
i386         buildonly-randconfig-004-20240327   clang
i386         buildonly-randconfig-005-20240326   gcc  
i386         buildonly-randconfig-005-20240327   clang
i386         buildonly-randconfig-006-20240326   gcc  
i386         buildonly-randconfig-006-20240327   clang
i386                                defconfig   clang
i386                  randconfig-001-20240326   gcc  
i386                  randconfig-002-20240326   gcc  
i386                  randconfig-003-20240326   gcc  
i386                  randconfig-003-20240327   clang
i386                  randconfig-004-20240326   clang
i386                  randconfig-005-20240326   gcc  
i386                  randconfig-005-20240327   clang
i386                  randconfig-006-20240326   clang
i386                  randconfig-011-20240326   clang
i386                  randconfig-012-20240326   gcc  
i386                  randconfig-012-20240327   clang
i386                  randconfig-013-20240326   clang
i386                  randconfig-014-20240326   clang
i386                  randconfig-014-20240327   clang
i386                  randconfig-015-20240326   clang
i386                  randconfig-016-20240326   clang
i386                  randconfig-016-20240327   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240327   gcc  
loongarch             randconfig-002-20240327   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240327   gcc  
nios2                 randconfig-002-20240327   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240327   gcc  
parisc                randconfig-002-20240327   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc               randconfig-002-20240327   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-002-20240327   gcc  
powerpc64             randconfig-003-20240327   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240327   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240327   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240327   gcc  
sh                    randconfig-002-20240327   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240327   gcc  
sparc64               randconfig-002-20240327   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240326   clang
x86_64       buildonly-randconfig-002-20240326   gcc  
x86_64       buildonly-randconfig-003-20240326   clang
x86_64       buildonly-randconfig-004-20240326   gcc  
x86_64       buildonly-randconfig-004-20240327   clang
x86_64       buildonly-randconfig-005-20240326   gcc  
x86_64       buildonly-randconfig-006-20240326   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240326   gcc  
x86_64                randconfig-001-20240327   clang
x86_64                randconfig-002-20240326   gcc  
x86_64                randconfig-003-20240326   gcc  
x86_64                randconfig-004-20240326   clang
x86_64                randconfig-005-20240326   gcc  
x86_64                randconfig-005-20240327   clang
x86_64                randconfig-006-20240326   clang
x86_64                randconfig-006-20240327   clang
x86_64                randconfig-011-20240326   gcc  
x86_64                randconfig-012-20240326   clang
x86_64                randconfig-012-20240327   clang
x86_64                randconfig-013-20240326   gcc  
x86_64                randconfig-013-20240327   clang
x86_64                randconfig-014-20240326   gcc  
x86_64                randconfig-014-20240327   clang
x86_64                randconfig-015-20240326   clang
x86_64                randconfig-015-20240327   clang
x86_64                randconfig-016-20240327   clang
x86_64                randconfig-072-20240327   clang
x86_64                randconfig-073-20240327   clang
x86_64                randconfig-074-20240327   clang
x86_64                randconfig-075-20240327   clang
x86_64                randconfig-076-20240327   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240327   gcc  
xtensa                randconfig-002-20240327   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

