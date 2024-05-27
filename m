Return-Path: <linux-renesas-soc+bounces-5538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF78D0E93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 22:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCCEC1C20FD1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 20:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128F3383BD;
	Mon, 27 May 2024 20:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCgINp4s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2705617E91C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716841619; cv=none; b=aNf5bvfgb7jIihvvI9CyOVoxf2JMNTCVgpw3mta2i4Lat8f5OSmXG5tzpSrY0VeN68isXyWvD+f6I3Xvm4cTu+vNESfOByWmgZaG1JObYarxG2yn0Kk1vVkkjRgsIyV1rp+LXqdNwOVrnIhoJfvMiSozC+ydecmn51xBV9Us4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716841619; c=relaxed/simple;
	bh=qPLhEYUcsXIlxgCmSdMA7/K484D3YUhSbXPdUqIW3S4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o9zNnfLWC42iM7Z+inanAKTfRguB6vPnloC0NlgQGmgRw7bQ60CJ/PPVXbTG9Tg/76AWmWTuoQdMyq5neV87U1jZL0l2M0ibFmRq5bE/5uCYF3Er3a6qLmJXosNNMp2gblSvnhcfmUQigk/0uJSX5eizmfTPIW2FP37YaZjtsaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCgINp4s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716841617; x=1748377617;
  h=date:from:to:cc:subject:message-id;
  bh=qPLhEYUcsXIlxgCmSdMA7/K484D3YUhSbXPdUqIW3S4=;
  b=GCgINp4s24stbA3WTNJTjHcJSWJ2vGv2sCT4MqGZRSGinXnJFexf90zt
   W5GCRsgssBJzsDV3sV5dTdWq5PtCJKYzc/Zwra1cFehb+b4ROoQGXeboR
   F/qnqB+SSBSz09y8ujEMmLvQ2ZSE3hG1155t7WJS54umy/J2Y0F0RilfY
   8+RP1X+HGhLrpVzloBaNGHQAX0y7PSczPXAhVCxdH9BZ/L1tzifdHzVB6
   goexRJa+xANhr2fyQ8unzlSvAQsQaHFYoJIkoHUgeOBtEBZOLaUqrVgtU
   EXbWO6g2nX4XK9paVieFr90Js2FJOF06RcD3F4SZuvO8UBpEKErGg8aaM
   g==;
X-CSE-ConnectionGUID: 4bEutkxLQDqPKTViP/RhNw==
X-CSE-MsgGUID: FglAPlzaRTiE3MJ2TrnQLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11717856"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="11717856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 13:26:56 -0700
X-CSE-ConnectionGUID: vPvWLZf/TQ+iu7sBYOb4Fw==
X-CSE-MsgGUID: 7L7QvlfYS4mLqiou+3G89g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34921876"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2024 13:26:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBgvl-000B4f-0M;
	Mon, 27 May 2024 20:26:53 +0000
Date: Tue, 28 May 2024 04:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 76c31fb816a7366cb6de2add5b416d827a204712
Message-ID: <202405280403.J13qu0rI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 76c31fb816a7366cb6de2add5b416d827a204712  Merge tag 'v6.10-rc1' into renesas-devel

elapsed time: 735m

configs tested: 180
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
arc                   randconfig-001-20240527   gcc  
arc                   randconfig-002-20240527   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240527   clang
arm                   randconfig-002-20240527   gcc  
arm                   randconfig-003-20240527   gcc  
arm                   randconfig-004-20240527   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240527   gcc  
arm64                 randconfig-002-20240527   gcc  
arm64                 randconfig-003-20240527   clang
arm64                 randconfig-004-20240527   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240527   gcc  
csky                  randconfig-002-20240527   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240527   clang
hexagon               randconfig-002-20240527   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240527   gcc  
i386         buildonly-randconfig-002-20240527   gcc  
i386         buildonly-randconfig-003-20240527   gcc  
i386         buildonly-randconfig-004-20240527   clang
i386         buildonly-randconfig-005-20240527   gcc  
i386         buildonly-randconfig-006-20240527   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240527   gcc  
i386                  randconfig-002-20240527   clang
i386                  randconfig-003-20240527   gcc  
i386                  randconfig-004-20240527   gcc  
i386                  randconfig-005-20240527   gcc  
i386                  randconfig-006-20240527   gcc  
i386                  randconfig-011-20240527   gcc  
i386                  randconfig-012-20240527   clang
i386                  randconfig-013-20240527   gcc  
i386                  randconfig-014-20240527   clang
i386                  randconfig-015-20240527   gcc  
i386                  randconfig-016-20240527   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240527   gcc  
loongarch             randconfig-002-20240527   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                     cu1000-neo_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                     loongson1b_defconfig   clang
mips                      maltaaprp_defconfig   clang
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240527   gcc  
nios2                 randconfig-002-20240527   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240527   gcc  
parisc                randconfig-002-20240527   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      pasemi_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20240527   gcc  
powerpc               randconfig-002-20240527   gcc  
powerpc               randconfig-003-20240527   clang
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240527   clang
powerpc64             randconfig-002-20240527   gcc  
powerpc64             randconfig-003-20240527   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240527   clang
riscv                 randconfig-002-20240527   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240527   clang
s390                  randconfig-002-20240527   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                    randconfig-001-20240527   gcc  
sh                    randconfig-002-20240527   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240527   gcc  
sparc64               randconfig-002-20240527   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240527   gcc  
um                    randconfig-002-20240527   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240527   clang
x86_64       buildonly-randconfig-002-20240527   gcc  
x86_64       buildonly-randconfig-003-20240527   gcc  
x86_64       buildonly-randconfig-004-20240527   gcc  
x86_64       buildonly-randconfig-005-20240527   gcc  
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240527   gcc  
xtensa                randconfig-002-20240527   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

