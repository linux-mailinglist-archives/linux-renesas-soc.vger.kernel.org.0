Return-Path: <linux-renesas-soc+bounces-12874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C91A29565
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 16:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A543A165BB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 15:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91620189BB3;
	Wed,  5 Feb 2025 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2H3mUi5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05B618C039
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770848; cv=none; b=GbCGcLYyFyLhyKKn0MU8nsHQpEYWRElCS84vlPzsIYKqZqw1dxWUzk6BsheX0txMkgag9aUCllUz+hApi3zNgYh1oINeQHaaI+ebnpKnU2DIk4WzpfwghiNXmrebW35jk8J78nrgq2ClAPEA/4hK3aPn1+NoN2LnoTMW/hizrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770848; c=relaxed/simple;
	bh=ObXV5SsB4rr89auYKFQpAfJZbGBeq7rzbGW5ObKAIRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ubvJLSmahRs5MqNPCzeuzVWKI8PnriEEA2TEV8WETL46vgjuCaH+0Sa8quGUDSYCRJyVd7i+CDmdFK7I8TFnF0p4WC8960xl3WzjzhNMcZCyaRTMQO3riwu/70Whgs7hfrbBfTJG7EztobwZAmvWC9WffZGUSHMaghG3Xtyf/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2H3mUi5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738770847; x=1770306847;
  h=date:from:to:cc:subject:message-id;
  bh=ObXV5SsB4rr89auYKFQpAfJZbGBeq7rzbGW5ObKAIRs=;
  b=S2H3mUi5S40LFGkYH+qHuIz08vAXc1392E6TNr+6uQ9KTyagMtjaVBv9
   +bTuiZYtgIOZeRqLRYYERX7M7XlO45yqMBpcZHU4677+XSAJjExpm8v85
   sojYQdhnpbMBvT/gP1KBfK9JM+WXA2B8FN3kwA35aXUlxQJ/pDY3OsND2
   S8L2OnvrDrZ9lTpkY+Tjh0QHr0z3XN9lUwm2b7cvVrbUhceTsHHx0odoD
   2G7R5/+gCYxJDipkY/5QRsOrNeZDH5J8ifGnphBWcy9nIJmWkrZBmtsFk
   HiPGh67sWD3Dqs42IVtIavEJfozbv7IoUuYqoerV7grepBHx2BhBjSA9v
   Q==;
X-CSE-ConnectionGUID: dC6xScOkQ8ypiEsH6DnATw==
X-CSE-MsgGUID: Pkd8DEE6TXeH/vcrOot9/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43260701"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="43260701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 07:54:06 -0800
X-CSE-ConnectionGUID: vHSdTnujR7CSYfhQNQdr6Q==
X-CSE-MsgGUID: WNJA2jVNSAyryU/5RqtXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111115229"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2025 07:54:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfhj0-000vjD-2P;
	Wed, 05 Feb 2025 15:54:02 +0000
Date: Wed, 05 Feb 2025 23:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays] BUILD SUCCESS
 fafabc942a7c420910bee7dddb8c6856efdd6fb2
Message-ID: <202502052306.wS77dIA6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays
branch HEAD: fafabc942a7c420910bee7dddb8c6856efdd6fb2  kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used

elapsed time: 1448m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-004-20250205    gcc-14.2.0
arm                       spear13xx_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250205    clang-17
hexagon               randconfig-002-20250205    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-11
i386        buildonly-randconfig-005-20250205    clang-19
i386        buildonly-randconfig-006-20250205    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250205    clang-16
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250205    clang-18
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-003-20250205    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-002-20250205    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-002-20250205    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-004-20250205    gcc-12
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

