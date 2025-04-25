Return-Path: <linux-renesas-soc+bounces-16372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFDA9C64D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8B1A17B8AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 10:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F2C1FC7E7;
	Fri, 25 Apr 2025 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJA/byaW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9192D20C00D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578448; cv=none; b=qxC16mSISYciLG0wtHZFoadzOrvoVvuH6hrE7eV5URiorvZnC4j3Vc7imucFpCCjN0tUmpRpY6bCxT730YFWv8Zody/bKbzZBCQZqO7yMdxrOvygpZPtcr/NWFqmU9L0wBiT5HhHzGRtU1zd0IZzgC4gpqw809Wx7n4InyDbvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578448; c=relaxed/simple;
	bh=IZWLyt8kPE0ojCYvX/vP9KdFECA5GFB8VD4dJZvoEvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U5UNUzNDTRgBxAJqfyqfR7t8jSou8DXAfc0DSSQwAY+bjQjEycNwkOCFltUY9VOY+UyIkVaVtDMFmfzP760fHMmZKLHn1LsZ/F/csOlPKORNGSGqFSwAaItDOYrHir+9L+iH0h89in+gKyqtAym2TXaUljBZjtjY5ngbBNU0P2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJA/byaW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745578447; x=1777114447;
  h=date:from:to:cc:subject:message-id;
  bh=IZWLyt8kPE0ojCYvX/vP9KdFECA5GFB8VD4dJZvoEvo=;
  b=aJA/byaW6KR3g5s5YeWH6OCs9c1S1rCfidbD7ec75cFiRTjCPBxoL4Ec
   mr4v5YlH+a7bDNy7X8TNt8VoWecjJotz1XdGnv3TNux3okv15fCZKD1sf
   Vsqii6g8MZhQyifpeBLlPI64VQvok1dDhNiqY20fFN4Sc/82080wKyxWN
   xJ91agOkJ1aIB7+uHn/aq8mPyzEtVHpfxjBCB4K4cHT4IrVc9bux5W8yN
   n/O+UOdLYW+HB9rUUpIxQLmNXqUusUX+P5wMOK/JMS3zX3T07y5CbE7VF
   Dx8sswfZfbnTjRoGtQklyUGDcxM+G0DdjZxz8bhdGXQwZ+dQvoeQRI1Q5
   Q==;
X-CSE-ConnectionGUID: GeVoIHnoRt2h0HLRFW4AAg==
X-CSE-MsgGUID: SFlbkyGxRkuC87pIskCvEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47254311"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47254311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:54:06 -0700
X-CSE-ConnectionGUID: Y6N7/c/MRzaMrJ4Ob45vZA==
X-CSE-MsgGUID: ScTjIHf6RduqoLvmUMpj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="138040013"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Apr 2025 03:54:05 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Gh0-00055X-0S;
	Fri, 25 Apr 2025 10:54:02 +0000
Date: Fri, 25 Apr 2025 18:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.16] BUILD SUCCESS
 9f78a29caacef6df5d6a43e85d1112e39cfa3b34
Message-ID: <202504251819.vNoKMZVN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.16
branch HEAD: 9f78a29caacef6df5d6a43e85d1112e39cfa3b34  arm64: dts: renesas: r8a779h0: Add ISP core function block

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: /: failed to match any schema with compatible: ['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0']
    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: /: failed to match any schema with compatible: ['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0']

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-052-20250425
    |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-fan-pwm.dtb::failed-to-match-any-schema-with-compatible:retronix-sparrow-hawk-renesas-r8a779g3-renesas-r8a779g0
    `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk.dtb::failed-to-match-any-schema-with-compatible:retronix-sparrow-hawk-renesas-r8a779g3-renesas-r8a779g0

elapsed time: 1459m

configs tested: 117
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250424    gcc-8.5.0
arc                   randconfig-002-20250424    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-19
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250424    gcc-7.5.0
arm                   randconfig-002-20250424    gcc-7.5.0
arm                   randconfig-003-20250424    clang-21
arm                   randconfig-004-20250424    clang-21
arm                           sama7_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250424    clang-21
arm64                 randconfig-002-20250424    gcc-8.5.0
arm64                 randconfig-003-20250424    clang-21
arm64                 randconfig-004-20250424    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250424    gcc-12.4.0
csky                  randconfig-002-20250424    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250424    clang-21
hexagon               randconfig-002-20250424    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250424    gcc-12
i386        buildonly-randconfig-002-20250424    clang-20
i386        buildonly-randconfig-003-20250424    clang-20
i386        buildonly-randconfig-004-20250424    clang-20
i386        buildonly-randconfig-005-20250424    gcc-12
i386        buildonly-randconfig-006-20250424    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250424    gcc-14.2.0
loongarch             randconfig-002-20250424    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250424    gcc-10.5.0
nios2                 randconfig-002-20250424    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250424    gcc-9.3.0
parisc                randconfig-002-20250424    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250424    clang-21
powerpc               randconfig-002-20250424    clang-17
powerpc               randconfig-003-20250424    clang-21
powerpc64             randconfig-001-20250424    clang-21
powerpc64             randconfig-002-20250424    clang-21
powerpc64             randconfig-003-20250424    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250424    clang-21
riscv                 randconfig-002-20250424    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250424    gcc-9.3.0
s390                  randconfig-002-20250424    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250424    gcc-12.4.0
sh                    randconfig-002-20250424    gcc-6.5.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250424    gcc-10.3.0
sparc                 randconfig-002-20250424    gcc-11.5.0
sparc64               randconfig-001-20250424    gcc-9.3.0
sparc64               randconfig-002-20250424    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250424    clang-21
um                    randconfig-002-20250424    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250424    gcc-12
x86_64      buildonly-randconfig-002-20250424    clang-20
x86_64      buildonly-randconfig-003-20250424    gcc-12
x86_64      buildonly-randconfig-004-20250424    clang-20
x86_64      buildonly-randconfig-005-20250424    clang-20
x86_64      buildonly-randconfig-006-20250424    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250424    gcc-14.2.0
xtensa                randconfig-002-20250424    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

