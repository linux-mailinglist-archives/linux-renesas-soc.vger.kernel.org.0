Return-Path: <linux-renesas-soc+bounces-20656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4116FB2B308
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 22:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64AD3521E41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 20:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C3E22759C;
	Mon, 18 Aug 2025 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzjiUJ0L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F47187346
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755550584; cv=none; b=T+EayXZegau4wKFt+KUCXvJUzGS1k8sSdmUtb+bqQcKXooAbL700VexDDivQeOHIAIESmaYlsPJpUob+230JNIyitYHlqXzv+TbLdXCGlGQ/UNuKkMnZzCKXp5wjjJNaOZZ/8HMdiew+WLHwbgIwSEn3KRAvwcwWsUciANP1AIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755550584; c=relaxed/simple;
	bh=8Y3o/YjNP1BXJBPNKg2jD9dgnEl2+YkmZDUpCcxAENg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fQj2aIQDfLtoWnqa8X+/F4FSUvPEgxWTE3RYtYTOM5VnUlbR5wD3o/E0oqEZq0hNdvtGmWGquOqoz5qunugWRrZvZdoL+HmHJW7pgSnr8lM+vgQH1fiGeO6dXcY3eix0f9Iyq+shGiv+B7ZD69URlGGdcsUAm7i7JoqUPR9wbDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzjiUJ0L; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755550583; x=1787086583;
  h=date:from:to:cc:subject:message-id;
  bh=8Y3o/YjNP1BXJBPNKg2jD9dgnEl2+YkmZDUpCcxAENg=;
  b=ZzjiUJ0L/+EPnJoBmRvl4kzX7cdojgV7capxxCvdhKCiuWo2DIH2bazP
   hS26Adq3MORNGVHNucPCj7rd/UfP1ILCTE6xCKY6S07/a3zrIAK2NiSFB
   jxNh8oAWlgVrK9Yp/lqQdI3YUgHTp1+S/h/GN1pV48u3dRE+Dwh4nTYwZ
   xPSxFIfdEk8bMvi2bJhrp+c09RsCY0O/FvHsVHMNrHCTh1sNsMVbHczoQ
   MmMbng9GbX0ki57U1MxnOD6eSRMp635ctx6J/lj8WgOAldL67mwuzXjF9
   qYsbZT+Np0Aoy3uP5ZN0dKErsUoa30srb0f3a+WF4k/lTj6uh366anz2j
   w==;
X-CSE-ConnectionGUID: +duycRCwQNSTmaXQcetBfA==
X-CSE-MsgGUID: S2OPAbBcT5GlHk8gtyqhgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="80373297"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="80373297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 13:56:22 -0700
X-CSE-ConnectionGUID: IbwPbmwBQ6O0kkVJqkiPIg==
X-CSE-MsgGUID: n3N8zRpdSgC8eLBqbYYMXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="173019059"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2025 13:56:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo6tm-000GCb-3B;
	Mon, 18 Aug 2025 20:56:12 +0000
Date: Tue, 19 Aug 2025 04:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 00ee70d132a72d6f2db16dfb9a5d4e8b85114992
Message-ID: <202508190440.I0b5Svci-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 00ee70d132a72d6f2db16dfb9a5d4e8b85114992  riscv: rzfive: defconfig: Refresh for v6.17-rc1

elapsed time: 729m

configs tested: 118
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250818    gcc-13.4.0
arc                   randconfig-002-20250818    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250818    gcc-12.5.0
arm                   randconfig-002-20250818    clang-22
arm                   randconfig-003-20250818    clang-18
arm                   randconfig-004-20250818    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250818    gcc-11.5.0
arm64                 randconfig-002-20250818    gcc-12.5.0
arm64                 randconfig-003-20250818    gcc-8.5.0
arm64                 randconfig-004-20250818    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250818    gcc-15.1.0
csky                  randconfig-002-20250818    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250818    clang-22
hexagon               randconfig-002-20250818    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250818    clang-20
i386        buildonly-randconfig-002-20250818    clang-20
i386        buildonly-randconfig-003-20250818    gcc-12
i386        buildonly-randconfig-004-20250818    clang-20
i386        buildonly-randconfig-005-20250818    gcc-12
i386        buildonly-randconfig-006-20250818    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250818    gcc-15.1.0
loongarch             randconfig-002-20250818    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250818    gcc-9.5.0
nios2                 randconfig-002-20250818    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250818    gcc-10.5.0
parisc                randconfig-002-20250818    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250818    gcc-8.5.0
powerpc               randconfig-002-20250818    gcc-9.5.0
powerpc               randconfig-003-20250818    clang-22
powerpc64             randconfig-001-20250818    gcc-8.5.0
powerpc64             randconfig-002-20250818    clang-17
powerpc64             randconfig-003-20250818    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250818    gcc-10.5.0
riscv                 randconfig-002-20250818    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250818    clang-22
s390                  randconfig-002-20250818    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250818    gcc-12.5.0
sh                    randconfig-002-20250818    gcc-13.4.0
sh                           sh2007_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250818    gcc-12.5.0
sparc                 randconfig-002-20250818    gcc-15.1.0
sparc64               randconfig-001-20250818    clang-22
sparc64               randconfig-002-20250818    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250818    gcc-11
um                    randconfig-002-20250818    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250818    gcc-12
x86_64      buildonly-randconfig-002-20250818    gcc-12
x86_64      buildonly-randconfig-003-20250818    gcc-12
x86_64      buildonly-randconfig-004-20250818    gcc-12
x86_64      buildonly-randconfig-005-20250818    gcc-12
x86_64      buildonly-randconfig-006-20250818    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250818    gcc-14.3.0
xtensa                randconfig-002-20250818    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

