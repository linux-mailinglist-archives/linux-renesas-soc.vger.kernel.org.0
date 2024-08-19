Return-Path: <linux-renesas-soc+bounces-7933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA49577F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 00:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6869282FDF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 22:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895F91DC46C;
	Mon, 19 Aug 2024 22:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8v3F8vF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1DAEEA5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724107209; cv=none; b=Kf9qo234Qfo7sGt+HirawWQ7G2aQi77Z7tHKUI2+PsxpYln+hjfmvFqlAXukdQnBIe8i6CvXQ/a1WcUVSpNplVEa7dZd+7BWiiBWjfwFKzJyJj0zwHgLsGkqm/xesHI3QvzLJ7aXsLcEHbJHpD8MJlKLqCorrg/PvURsMW+RFAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724107209; c=relaxed/simple;
	bh=8MArPg7fGWcgnDSJPreHuqcrBoTdWz+jYs4wUD8EqFk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fOBXPcsoR4g/WKSuiqHhFM/bdDU/EMXtfAGP4yF+5xLeCj36CboEKgg93/pSPjO4C4Yj97EEQgnlh5//VCHKtTZo8oMOK/5zkHbWvtSRZtWQGYbgvnWsdyvgLU7KGCrOH8MWqWHGFkQAwGp9YTUcKL3oWFpKmCsNqQcWNHDibks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8v3F8vF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724107208; x=1755643208;
  h=date:from:to:cc:subject:message-id;
  bh=8MArPg7fGWcgnDSJPreHuqcrBoTdWz+jYs4wUD8EqFk=;
  b=T8v3F8vFvoJ2TQLlK66KCwObwZHX/dY/CaKSirOd1vqww7b/uByUmp+W
   CYxLV0g1yiK0vvqrUowvf9N29izJDv6iksQcbZ873PhNjZ6RA2/L0XOKO
   A2ycG3mm2rUS+bj4MADZxHCe6kI7nKFmZ1cj26ZhgnFPnWTmrA5IWiNLk
   zmrWF7QLrRuwsBFKYvaq1Wkv0XTopoKh/t5XCFi2tiObeeTx7gCViwPp2
   ZHfOJBhLBzb765BWldC3HMoT5ZANipYfRjcA2Z2v7IG5TNoKxczofIXdZ
   ZBpqw8+/3Zh9bdp2OXZMQAF0u/ftXij328PwQ57W+HTV/n5qm/XvGWnYS
   A==;
X-CSE-ConnectionGUID: GmXIh1bBTnSJi4aF/DBwxg==
X-CSE-MsgGUID: 1QCRa3NkQZ6/ZULQFwJqxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26176732"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="26176732"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 15:40:07 -0700
X-CSE-ConnectionGUID: yJmJThXlRSaVvSu/xzUcpA==
X-CSE-MsgGUID: OMqV5w3uSYKMtnCww5Q2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="60215504"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2024 15:40:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgB2h-0009VC-23;
	Mon, 19 Aug 2024 22:40:03 +0000
Date: Tue, 20 Aug 2024 06:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 38e4de785652ecdbe0500d59f0e25c78feb0bc19
Message-ID: <202408200602.Cu83viJR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 38e4de785652ecdbe0500d59f0e25c78feb0bc19  Merge tag 'v6.11-rc4' into renesas-devel

elapsed time: 728m

configs tested: 203
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                   randconfig-001-20240819   gcc-13.2.0
arc                   randconfig-002-20240819   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         assabet_defconfig   gcc-12.4.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                          pxa3xx_defconfig   gcc-12.4.0
arm                            qcom_defconfig   gcc-12.4.0
arm                   randconfig-001-20240819   gcc-13.2.0
arm                   randconfig-002-20240819   gcc-13.2.0
arm                   randconfig-003-20240819   gcc-13.2.0
arm                   randconfig-004-20240819   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-12.4.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                        spear6xx_defconfig   gcc-12.4.0
arm                           u8500_defconfig   gcc-12.4.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240819   gcc-13.2.0
arm64                 randconfig-002-20240819   gcc-13.2.0
arm64                 randconfig-003-20240819   gcc-13.2.0
arm64                 randconfig-004-20240819   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240819   gcc-13.2.0
csky                  randconfig-002-20240819   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240819   clang-18
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-002-20240819   clang-18
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-003-20240819   clang-18
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-004-20240819   clang-18
i386         buildonly-randconfig-004-20240820   clang-18
i386         buildonly-randconfig-005-20240819   clang-18
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-006-20240819   clang-18
i386         buildonly-randconfig-006-20240820   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240819   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-002-20240819   clang-18
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-003-20240819   clang-18
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-004-20240819   clang-18
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-005-20240819   clang-18
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-006-20240819   clang-18
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-011-20240819   clang-18
i386                  randconfig-011-20240820   clang-18
i386                  randconfig-012-20240819   clang-18
i386                  randconfig-012-20240820   clang-18
i386                  randconfig-013-20240819   clang-18
i386                  randconfig-013-20240820   clang-18
i386                  randconfig-014-20240819   clang-18
i386                  randconfig-014-20240820   clang-18
i386                  randconfig-015-20240819   clang-18
i386                  randconfig-015-20240820   clang-18
i386                  randconfig-016-20240819   clang-18
i386                  randconfig-016-20240820   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240819   gcc-13.2.0
loongarch             randconfig-002-20240819   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-12.4.0
m68k                        stmark2_defconfig   gcc-12.4.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ip22_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240819   gcc-13.2.0
nios2                 randconfig-002-20240819   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240819   gcc-13.2.0
parisc                randconfig-002-20240819   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     kmeter1_defconfig   gcc-12.4.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig   gcc-12.4.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240819   gcc-13.2.0
powerpc               randconfig-002-20240819   gcc-13.2.0
powerpc64             randconfig-001-20240819   gcc-13.2.0
powerpc64             randconfig-002-20240819   gcc-13.2.0
powerpc64             randconfig-003-20240819   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-12.4.0
riscv                 randconfig-001-20240819   gcc-13.2.0
riscv                 randconfig-002-20240819   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240819   gcc-13.2.0
s390                  randconfig-002-20240819   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-12.4.0
sh                                  defconfig   gcc-14.1.0
sh                             espt_defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-12.4.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                          r7785rp_defconfig   gcc-12.4.0
sh                    randconfig-001-20240819   gcc-13.2.0
sh                    randconfig-002-20240819   gcc-13.2.0
sh                           se7206_defconfig   gcc-12.4.0
sh                           se7724_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240819   gcc-13.2.0
sparc64               randconfig-002-20240819   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240819   gcc-13.2.0
um                    randconfig-002-20240819   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-12.4.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240819   gcc-12
x86_64       buildonly-randconfig-002-20240819   gcc-12
x86_64       buildonly-randconfig-003-20240819   gcc-12
x86_64       buildonly-randconfig-004-20240819   gcc-12
x86_64       buildonly-randconfig-005-20240819   gcc-12
x86_64       buildonly-randconfig-006-20240819   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240819   gcc-12
x86_64                randconfig-002-20240819   gcc-12
x86_64                randconfig-003-20240819   gcc-12
x86_64                randconfig-004-20240819   gcc-12
x86_64                randconfig-005-20240819   gcc-12
x86_64                randconfig-006-20240819   gcc-12
x86_64                randconfig-011-20240819   gcc-12
x86_64                randconfig-012-20240819   gcc-12
x86_64                randconfig-013-20240819   gcc-12
x86_64                randconfig-014-20240819   gcc-12
x86_64                randconfig-015-20240819   gcc-12
x86_64                randconfig-016-20240819   gcc-12
x86_64                randconfig-071-20240819   gcc-12
x86_64                randconfig-072-20240819   gcc-12
x86_64                randconfig-073-20240819   gcc-12
x86_64                randconfig-074-20240819   gcc-12
x86_64                randconfig-075-20240819   gcc-12
x86_64                randconfig-076-20240819   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240819   gcc-13.2.0
xtensa                randconfig-002-20240819   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

