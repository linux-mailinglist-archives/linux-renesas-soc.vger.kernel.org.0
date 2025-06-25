Return-Path: <linux-renesas-soc+bounces-18702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0863AE7DA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 11:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CBE3AF4ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 09:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206B629ACD4;
	Wed, 25 Jun 2025 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1T9Ja2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D35D29E106
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843943; cv=none; b=nuMeI8Ggu0+KQQKUerpL42yh0dg++oDtZaYvISlH7xyRoJthFT1sVzG62LfjrbHwDLBWUesovyuH82jYvGAB5fE1gc9mVEmfrrzuMPDw+2J0VddtvBhbUOfDnzIZSH3TE4H+r6gwOWLiLTxK9UJ5x73nNR8Fv5LDMHpaqYovvwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843943; c=relaxed/simple;
	bh=r+1RSOeCKwK27juRpiQIfxKK1WQcjsKMI8R3En4j4DM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GTRbFzgwOLOCXS+HMWam1Thujcgv0UNL9WeL6RsllN/XOE2CFbwSE1ewSGDwq+CeWET/0DocHyRxCuCys1p9/EeoFuXDEBYsyngThGBnUjleIQjQhnGh8U8OmVTMy9liv1ILZOhi/fNMnU7Q2mvmb830Cken1Y206+HrnjHpjNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1T9Ja2j; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750843941; x=1782379941;
  h=date:from:to:cc:subject:message-id;
  bh=r+1RSOeCKwK27juRpiQIfxKK1WQcjsKMI8R3En4j4DM=;
  b=e1T9Ja2jOBieTuAcGftSQFEs4TK7gJ80W8QOtYXNcAhrP+icbAyd1LHB
   ZTpKRXLB4kfUZfAOXZbv/fRgoYiCzm1G330a/ebYfW4RGiNlQYtiHQfLJ
   7w6ZbgMdebl23EYXQbtes5c7pqgp/OSivRNPcZgH5O4PEJw7qmncBbwwu
   b1kimHIPZzsEa2CBMY0L1V223eWmpCUL0nVJQOYMga1V2ft/25U34w8dA
   ffMCpDBw39RWQUqDeQyQkybV9+v/dcsdl5MnA3pHVQ0D5O9uF2arAx6ji
   4xEqdxwoiI5wzaZRMN+3506c+y1E03FG4HKNb+RoospRsR7bLjBa9ezN4
   w==;
X-CSE-ConnectionGUID: PwYTx6tRRmSGiGN6DDb/ug==
X-CSE-MsgGUID: 2DszS0WcQQCKVkfc3obifA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70538572"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="70538572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:32:18 -0700
X-CSE-ConnectionGUID: PpSU/E0hRA6sYlfFLNsoYA==
X-CSE-MsgGUID: 5kysnq3sQAiNmQ55BV7+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="189341866"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2025 02:32:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUMUI-000SxM-3A;
	Wed, 25 Jun 2025 09:32:14 +0000
Date: Wed, 25 Jun 2025 17:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a09g077-dt-binding-defs]
 BUILD SUCCESS 62ab7ac5be90392a9ac0955febab778ebf51bc0a
Message-ID: <202506251727.Ds6PSQ4h-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a09g077-dt-binding-defs
branch HEAD: 62ab7ac5be90392a9ac0955febab778ebf51bc0a  dt-bindings: clock: renesas,r9a09g077: Add PCLKL core clock ID

elapsed time: 1449m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-002-20250624    gcc-15.1.0
arc                   randconfig-002-20250625    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-001-20250625    gcc-11.5.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-003-20250625    gcc-11.5.0
arm                   randconfig-004-20250624    clang-17
arm                   randconfig-004-20250625    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-002-20250625    gcc-11.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-003-20250625    gcc-11.5.0
arm64                 randconfig-004-20250624    clang-21
arm64                 randconfig-004-20250625    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-001-20250625    gcc-12
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-005-20250625    gcc-12
i386        buildonly-randconfig-006-20250624    gcc-12
i386        buildonly-randconfig-006-20250625    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-001-20250625    gcc-12
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-002-20250625    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-003-20250625    gcc-12
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-004-20250625    gcc-12
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-005-20250625    gcc-12
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64      buildonly-randconfig-006-20250625    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

