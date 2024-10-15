Return-Path: <linux-renesas-soc+bounces-9735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBF99E340
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 11:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3411F2210F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76321AB534;
	Tue, 15 Oct 2024 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHXImgeW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4C17DFEC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986385; cv=none; b=R0sWmjaqiwjaj2AvfQUUP2yo8e8rvZxptRqhzHe6Z4zmuzauDmTcTLJ1fn6adPP/7GAcoT6ofW1pYx7AWW7KdKNsZZtSiUwKkx/Ng8h2v2uV1/ob5QzX8OEQCNoWiv1p93a7P30qJL8GjOVBNx4JyAMTZrqr8mdVLnhOuia2wc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986385; c=relaxed/simple;
	bh=pCbNbio9Det/JdKXzJqA4Y4MXCGf23eUM2eQuIC8KHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OEadXfjx0jPS2bfTO82NF1HjKaHQbBSpv2xcvKezupOBZPr9hhNDpDyReEwzPAyYfEmi4BnyUbg4C+ZJAjSyGw3nJscJ4wiO0fZMe9l3M0UA2PZ3Z73i4a/g1MrNH6XOLfVDqfnqeNZLvi/lwTHPzQEYM3xDytON93u7QkuZ/fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHXImgeW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728986384; x=1760522384;
  h=date:from:to:cc:subject:message-id;
  bh=pCbNbio9Det/JdKXzJqA4Y4MXCGf23eUM2eQuIC8KHQ=;
  b=YHXImgeW15acHjhCdxVwbb+Jykw6xuJgJylli7DXE9t0kU5LxJb9gk9k
   peKdV/oZu89M7y0DwOsoajNjTLf+kRukfdt7lg30oIFSz+ZCN5Vb1o0h1
   1WXF1YmXnHxjuYPjYIvzpGWlST/uRcYVlVFyTiFOL0puWr75U6Bbp3Ld/
   FxSrWf9LX7KVjA+pjH84uNfhCbGsGKhe+9P9ps5u0lYei0zmuccO55Z8w
   4J4WmwPWj6cM86g1/zDTXYjip1xEgOSE/q4BabcpwKgvQ/xlVZZXNwSE0
   Xagfc46BwwxXP8fMLV4GeQG0Wq7n3+Mwbc2ZcL3U/BoN06WVfub6Rh4aK
   g==;
X-CSE-ConnectionGUID: yryYPfkuTjCw1bfx2IaDFw==
X-CSE-MsgGUID: MG1S23UiS7y8N+/BLc0NdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38922124"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38922124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 02:59:44 -0700
X-CSE-ConnectionGUID: ButqWaMGQk24aQ1iOtBewA==
X-CSE-MsgGUID: 2PoKgMYuSUuLzm72Rfph3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="115296314"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2024 02:59:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0eL6-000HuQ-1e;
	Tue, 15 Oct 2024 09:59:40 +0000
Date: Tue, 15 Oct 2024 17:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 92850bed9d4d334ee502a035ed5750285faccbea
Message-ID: <202410151710.GiT3PSQm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 92850bed9d4d334ee502a035ed5750285faccbea  clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks

elapsed time: 1449m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241015    clang-18
i386        buildonly-randconfig-002-20241015    clang-18
i386        buildonly-randconfig-003-20241015    clang-18
i386        buildonly-randconfig-004-20241015    clang-18
i386        buildonly-randconfig-005-20241015    clang-18
i386        buildonly-randconfig-006-20241015    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241015    clang-18
i386                  randconfig-002-20241015    clang-18
i386                  randconfig-003-20241015    clang-18
i386                  randconfig-004-20241015    clang-18
i386                  randconfig-005-20241015    clang-18
i386                  randconfig-006-20241015    clang-18
i386                  randconfig-011-20241015    clang-18
i386                  randconfig-012-20241015    clang-18
i386                  randconfig-013-20241015    clang-18
i386                  randconfig-014-20241015    clang-18
i386                  randconfig-015-20241015    clang-18
i386                  randconfig-016-20241015    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                   lite5200b_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc64                        alldefconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          sdk7780_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241015    clang-18
x86_64      buildonly-randconfig-002-20241015    clang-18
x86_64      buildonly-randconfig-003-20241015    clang-18
x86_64      buildonly-randconfig-004-20241015    clang-18
x86_64      buildonly-randconfig-005-20241015    clang-18
x86_64      buildonly-randconfig-006-20241015    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241015    clang-18
x86_64                randconfig-002-20241015    clang-18
x86_64                randconfig-003-20241015    clang-18
x86_64                randconfig-004-20241015    clang-18
x86_64                randconfig-005-20241015    clang-18
x86_64                randconfig-006-20241015    clang-18
x86_64                randconfig-011-20241015    clang-18
x86_64                randconfig-012-20241015    clang-18
x86_64                randconfig-013-20241015    clang-18
x86_64                randconfig-014-20241015    clang-18
x86_64                randconfig-015-20241015    clang-18
x86_64                randconfig-016-20241015    clang-18
x86_64                randconfig-071-20241015    clang-18
x86_64                randconfig-072-20241015    clang-18
x86_64                randconfig-073-20241015    clang-18
x86_64                randconfig-074-20241015    clang-18
x86_64                randconfig-075-20241015    clang-18
x86_64                randconfig-076-20241015    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

