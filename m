Return-Path: <linux-renesas-soc+bounces-8676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 768CE96AC7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 00:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03BCD1F25C42
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 22:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF1E1EC01F;
	Tue,  3 Sep 2024 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAZfuiS/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49BD1EC01E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403600; cv=none; b=Q95lfSGAMP0KAVVKdAdSE7NHkRFDqq1tMQo4lfKUb+1OBu8AGqDlXDvWPhHiVuJvu0+EsoiQjL/MTcRDPVUkitdwQehvh5vmNg7EqeNQfXMl8r7m6Ybljy37C4CBVKSyn2y0iyDgetqa1/LmxnSzV/YvKKFsgdxrop77cIXWHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403600; c=relaxed/simple;
	bh=RdNNzk4oxb1XriApyzDgc/qMsMIq4FjxYJ9IZ3ACsu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NDisqOxlk7Kr95eKpQhqy+BSBhqOWVmtD/V6XsbjCEa/K07f3mcBwOMslE1ESHRW3yuG0R3OY4b6KX5oaZ6aQER0jUQf19Own7M3rQrIjCbcMhAFuxnAR/09X2H6adgaSdzXHXvhvoxFJuEZ+fAHDra7tDdz2b2PfV4LlqbRuOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAZfuiS/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725403598; x=1756939598;
  h=date:from:to:cc:subject:message-id;
  bh=RdNNzk4oxb1XriApyzDgc/qMsMIq4FjxYJ9IZ3ACsu8=;
  b=TAZfuiS/QC5E7f0kzD0lFYSlgT4qOtiC3U/0OPEKW6fvjkVPa+2az4aD
   OOxA3fUaDBjPmiZyaa8cSAPvrsoeEGxmNNq5TDi+2mTa/s/B+46tdU4SO
   a43yGuadjmCgzGwAjSE2e4aywvnR6tqRnRLu9J/OhMk8YJouFLCJQgcYQ
   GZy060XUWbtrrqYxfDx7R+Ojpt3C/IV/uHWXCRY+kC6JnQyNCb/l59+O+
   pPdT/nnpn3A1e3CuI7fJuk8XVwkVzR8buBxiETz9AI/W154ZaWfZAxL89
   jZUiNOMALIZn1jsD76VadMAbkD455BMSwSwKjyIyBbWM10ZTYjMMKeuTS
   g==;
X-CSE-ConnectionGUID: tXVarWocQ+uzSrNFMwd+dg==
X-CSE-MsgGUID: iKdzg/VWS+m4D0HYZvGeXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34698315"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="34698315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 15:46:37 -0700
X-CSE-ConnectionGUID: 0H7F0Cb4RYGApQ/XOM3fTw==
X-CSE-MsgGUID: XXWxGtgARX+PgzSqIPBmsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="69927185"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2024 15:46:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slcIE-0007Iq-3B;
	Tue, 03 Sep 2024 22:46:34 +0000
Date: Wed, 04 Sep 2024 06:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 5379c9e0a6ad7d4690e7f496c48c0d44ebb30dd9
Message-ID: <202409040651.bNKt1Npz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 5379c9e0a6ad7d4690e7f496c48c0d44ebb30dd9  Merge branch 'renesas-dts-for-v6.12' into renesas-next

elapsed time: 790m

configs tested: 117
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                     am200epdkit_defconfig   clang-20
arm                         assabet_defconfig   clang-20
arm                         axm55xx_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                      jornada720_defconfig   clang-20
arm                        spear3xx_defconfig   clang-20
arm                        spear6xx_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                        m5407c3_defconfig   clang-20
m68k                       m5475evb_defconfig   clang-20
m68k                           virt_defconfig   clang-20
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           ip28_defconfig   clang-20
mips                     loongson2k_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                         rt305x_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        icon_defconfig   clang-20
powerpc                  mpc885_ads_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sparc                            allmodconfig   gcc-14.1.0
sparc64                          alldefconfig   clang-20
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240904   clang-18
x86_64       buildonly-randconfig-002-20240904   clang-18
x86_64       buildonly-randconfig-003-20240904   clang-18
x86_64       buildonly-randconfig-004-20240904   clang-18
x86_64       buildonly-randconfig-005-20240904   clang-18
x86_64       buildonly-randconfig-006-20240904   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240904   clang-18
x86_64                randconfig-002-20240904   clang-18
x86_64                randconfig-003-20240904   clang-18
x86_64                randconfig-004-20240904   clang-18
x86_64                randconfig-005-20240904   clang-18
x86_64                randconfig-006-20240904   clang-18
x86_64                randconfig-011-20240904   clang-18
x86_64                randconfig-012-20240904   clang-18
x86_64                randconfig-013-20240904   clang-18
x86_64                randconfig-014-20240904   clang-18
x86_64                randconfig-015-20240904   clang-18
x86_64                randconfig-016-20240904   clang-18
x86_64                randconfig-071-20240904   clang-18
x86_64                randconfig-072-20240904   clang-18
x86_64                randconfig-073-20240904   clang-18
x86_64                randconfig-074-20240904   clang-18
x86_64                randconfig-075-20240904   clang-18
x86_64                randconfig-076-20240904   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

