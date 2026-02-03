Return-Path: <linux-renesas-soc+bounces-27788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NBXEltEgWnNFAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:42:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8FD3194
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBB593019920
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 00:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAEC1B4F1F;
	Tue,  3 Feb 2026 00:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A00G/c5W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9C224F3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 00:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079114; cv=none; b=OjLMA/Y6ACwsqB3NvLBv4cA64Z9zZG+g0LDjKFywlyFYWhtmV/nFpQr7KbYMWlE/A7KfeESueMyaUCp8wz2pQkxTfkBU5KILnc9NOjsES/q+C+kGngM7PEDSZ+M/GBlEmUUdW5DvAzSAtTWjHHTiw2CLdbMw6Ei0PNbwXh2B6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079114; c=relaxed/simple;
	bh=01ywXsPjo/dgYYpXfY4tPzPCoI5Bn5nE3fvP2M7AsUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tt0P8L2ZwaG42IdQlGLHYRiD/tIy5TJuqXdB4un+ho5LQUlTd2ewLcdrkyVm/20j/Ts9eNnbR6QTk6h0Ihsj4j3ItYkoKIPjXuDJ7bK1nYByS1Q9Iu3plHxtdpT4J/pTpMkEFULVNDNGGJdXMi3ag4RbJU2oLCy0pRoe5HtuLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A00G/c5W; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770079112; x=1801615112;
  h=date:from:to:cc:subject:message-id;
  bh=01ywXsPjo/dgYYpXfY4tPzPCoI5Bn5nE3fvP2M7AsUk=;
  b=A00G/c5WzxLdQRxPrWPlLCvcy8KlZRMcAXJOjoSG1cP+4wgQBiV7fMhF
   z/eT+lZcL/9bZqgcOB2U4Sr3DzEgdmVNounNybJW58aV7Jb8jGA0z4Mby
   hgh8ETy3A0pybAOla0ZDHSmHJGzueUjoVJmWB0C0Qzl1TiX0CnFGLN4su
   5ZZSZEOlQP+kOq7SPNBNVN0ec+yrK3vNKxxrzB6Pie9T2UivDiWcGKYzx
   8jBe64KysdZQFSN4xfiXkHrkFvAHC98I1l7ZKAxfVJQwgu/c6I2Slzfql
   eargTueNXJM1e+K70REImf/KxVLv8L+xcGSoL7H3lRUm2pejX2GbOgAXs
   Q==;
X-CSE-ConnectionGUID: rX71xUJ+SueAxsdqMoaQ/g==
X-CSE-MsgGUID: lKrDXAacTdKKA/BmUl2SsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71146430"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71146430"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 16:38:32 -0800
X-CSE-ConnectionGUID: 1kwFPSGPRx6hWYID9MUirQ==
X-CSE-MsgGUID: Y3aaORdcSYS3vAV3Ypdn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209807359"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2026 16:38:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn4R2-00000000g4y-2KBK;
	Tue, 03 Feb 2026 00:38:28 +0000
Date: Tue, 03 Feb 2026 08:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 f18113f4154d40ef035ab9761a8f3904251fd51f
Message-ID: <202602030818.eVFbo82x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27788-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7F8FD3194
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: f18113f4154d40ef035ab9761a8f3904251fd51f  Merge tag 'v6.19-rc8' into renesas-devel

elapsed time: 879m

configs tested: 302
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                          axs101_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                        nsim_700_defconfig    clang-22
arc                   randconfig-001-20260202    gcc-14.3.0
arc                   randconfig-001-20260203    gcc-12.5.0
arc                   randconfig-002-20260202    gcc-14.3.0
arc                   randconfig-002-20260203    gcc-12.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     davinci_all_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-22
arm                         lpc32xx_defconfig    gcc-15.2.0
arm                            mps2_defconfig    clang-22
arm                       netwinder_defconfig    gcc-15.2.0
arm                         nhk8815_defconfig    clang-22
arm                             pxa_defconfig    clang-22
arm                   randconfig-001-20260202    gcc-14.3.0
arm                   randconfig-001-20260203    gcc-12.5.0
arm                   randconfig-002-20260202    gcc-14.3.0
arm                   randconfig-002-20260203    gcc-12.5.0
arm                   randconfig-003-20260202    gcc-14.3.0
arm                   randconfig-003-20260203    gcc-12.5.0
arm                   randconfig-004-20260202    gcc-14.3.0
arm                   randconfig-004-20260203    gcc-12.5.0
arm                           sama7_defconfig    clang-22
arm                           spitz_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260202    gcc-9.5.0
arm64                 randconfig-001-20260203    gcc-15.2.0
arm64                 randconfig-002-20260202    gcc-9.5.0
arm64                 randconfig-002-20260203    gcc-15.2.0
arm64                 randconfig-003-20260202    gcc-9.5.0
arm64                 randconfig-003-20260203    gcc-15.2.0
arm64                 randconfig-004-20260202    gcc-9.5.0
arm64                 randconfig-004-20260203    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260202    gcc-9.5.0
csky                  randconfig-001-20260203    gcc-15.2.0
csky                  randconfig-002-20260202    gcc-9.5.0
csky                  randconfig-002-20260203    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260202    clang-19
hexagon               randconfig-001-20260203    clang-22
hexagon               randconfig-002-20260202    clang-19
hexagon               randconfig-002-20260203    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260202    gcc-14
i386        buildonly-randconfig-001-20260203    clang-20
i386        buildonly-randconfig-002-20260202    gcc-14
i386        buildonly-randconfig-002-20260203    clang-20
i386        buildonly-randconfig-003-20260202    gcc-14
i386        buildonly-randconfig-003-20260203    clang-20
i386        buildonly-randconfig-004-20260202    gcc-14
i386        buildonly-randconfig-004-20260203    clang-20
i386        buildonly-randconfig-005-20260202    gcc-14
i386        buildonly-randconfig-005-20260203    clang-20
i386        buildonly-randconfig-006-20260202    gcc-14
i386        buildonly-randconfig-006-20260203    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260202    gcc-14
i386                  randconfig-001-20260203    clang-20
i386                  randconfig-002-20260202    gcc-14
i386                  randconfig-002-20260203    clang-20
i386                  randconfig-003-20260202    gcc-14
i386                  randconfig-003-20260203    clang-20
i386                  randconfig-004-20260202    gcc-14
i386                  randconfig-004-20260203    clang-20
i386                  randconfig-005-20260202    gcc-14
i386                  randconfig-005-20260203    clang-20
i386                  randconfig-006-20260202    gcc-14
i386                  randconfig-006-20260203    clang-20
i386                  randconfig-007-20260202    gcc-14
i386                  randconfig-007-20260203    clang-20
i386                  randconfig-011-20260202    clang-20
i386                  randconfig-011-20260203    gcc-14
i386                  randconfig-012-20260202    clang-20
i386                  randconfig-012-20260203    gcc-14
i386                  randconfig-013-20260202    clang-20
i386                  randconfig-013-20260203    gcc-14
i386                  randconfig-014-20260202    clang-20
i386                  randconfig-014-20260202    gcc-14
i386                  randconfig-014-20260203    gcc-14
i386                  randconfig-015-20260202    clang-20
i386                  randconfig-015-20260203    gcc-14
i386                  randconfig-016-20260202    clang-20
i386                  randconfig-016-20260203    gcc-14
i386                  randconfig-017-20260202    clang-20
i386                  randconfig-017-20260203    gcc-14
loongarch                        alldefconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    gcc-15.2.0
loongarch             randconfig-001-20260202    clang-19
loongarch             randconfig-001-20260203    clang-22
loongarch             randconfig-002-20260202    clang-19
loongarch             randconfig-002-20260203    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         apollo_defconfig    clang-22
m68k                          atari_defconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                            mac_defconfig    gcc-15.2.0
m68k                           sun3_defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    clang-22
mips                        bcm63xx_defconfig    clang-22
mips                        bcm63xx_defconfig    gcc-15.2.0
mips                       bmips_be_defconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    clang-22
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                          eyeq5_defconfig    gcc-15.2.0
mips                           gcw0_defconfig    clang-22
mips                           ip32_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                        vocore2_defconfig    clang-22
nios2                         10m50_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260202    clang-19
nios2                 randconfig-001-20260203    clang-22
nios2                 randconfig-002-20260202    clang-19
nios2                 randconfig-002-20260203    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    clang-22
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260202    gcc-8.5.0
parisc                randconfig-001-20260203    gcc-12.5.0
parisc                randconfig-002-20260202    gcc-8.5.0
parisc                randconfig-002-20260203    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                     mpc83xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260202    gcc-8.5.0
powerpc               randconfig-001-20260203    gcc-12.5.0
powerpc               randconfig-002-20260202    gcc-8.5.0
powerpc               randconfig-002-20260203    gcc-12.5.0
powerpc64             randconfig-001-20260202    gcc-8.5.0
powerpc64             randconfig-001-20260203    gcc-12.5.0
powerpc64             randconfig-002-20260202    gcc-8.5.0
powerpc64             randconfig-002-20260203    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260202    clang-22
riscv                 randconfig-001-20260203    gcc-8.5.0
riscv                 randconfig-002-20260202    clang-22
riscv                 randconfig-002-20260203    gcc-8.5.0
s390                             alldefconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260202    clang-22
s390                  randconfig-001-20260203    gcc-8.5.0
s390                  randconfig-002-20260203    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260202    clang-22
sh                    randconfig-001-20260203    gcc-8.5.0
sh                    randconfig-002-20260202    clang-22
sh                    randconfig-002-20260203    gcc-8.5.0
sh                          rsk7203_defconfig    clang-22
sh                          rsk7203_defconfig    gcc-15.2.0
sh                          sdk7780_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                        sh7757lcr_defconfig    clang-22
sh                        sh7763rdp_defconfig    clang-22
sh                            shmin_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260202    gcc-12.5.0
sparc                 randconfig-001-20260203    gcc-13.4.0
sparc                 randconfig-002-20260202    gcc-12.5.0
sparc                 randconfig-002-20260203    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260202    gcc-12.5.0
sparc64               randconfig-001-20260203    gcc-13.4.0
sparc64               randconfig-002-20260202    gcc-12.5.0
sparc64               randconfig-002-20260203    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260202    gcc-12.5.0
um                    randconfig-001-20260203    gcc-13.4.0
um                    randconfig-002-20260202    gcc-12.5.0
um                    randconfig-002-20260203    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260202    gcc-14
x86_64      buildonly-randconfig-001-20260203    clang-20
x86_64      buildonly-randconfig-002-20260202    gcc-14
x86_64      buildonly-randconfig-002-20260203    clang-20
x86_64      buildonly-randconfig-003-20260202    gcc-14
x86_64      buildonly-randconfig-003-20260203    clang-20
x86_64      buildonly-randconfig-004-20260202    gcc-14
x86_64      buildonly-randconfig-004-20260203    clang-20
x86_64      buildonly-randconfig-005-20260202    gcc-14
x86_64      buildonly-randconfig-005-20260203    clang-20
x86_64      buildonly-randconfig-006-20260202    gcc-14
x86_64      buildonly-randconfig-006-20260203    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260202    gcc-14
x86_64                randconfig-002-20260202    gcc-14
x86_64                randconfig-003-20260202    gcc-14
x86_64                randconfig-004-20260202    gcc-14
x86_64                randconfig-005-20260202    gcc-14
x86_64                randconfig-006-20260202    gcc-14
x86_64                randconfig-011-20260202    gcc-14
x86_64                randconfig-011-20260203    gcc-14
x86_64                randconfig-012-20260202    gcc-14
x86_64                randconfig-012-20260203    gcc-14
x86_64                randconfig-013-20260202    gcc-14
x86_64                randconfig-013-20260203    gcc-14
x86_64                randconfig-014-20260202    gcc-14
x86_64                randconfig-014-20260203    gcc-14
x86_64                randconfig-015-20260202    gcc-14
x86_64                randconfig-015-20260203    gcc-14
x86_64                randconfig-016-20260202    gcc-14
x86_64                randconfig-016-20260203    gcc-14
x86_64                randconfig-071-20260202    clang-20
x86_64                randconfig-071-20260203    gcc-14
x86_64                randconfig-072-20260202    clang-20
x86_64                randconfig-072-20260203    gcc-14
x86_64                randconfig-073-20260202    clang-20
x86_64                randconfig-073-20260203    gcc-14
x86_64                randconfig-074-20260202    clang-20
x86_64                randconfig-074-20260203    gcc-14
x86_64                randconfig-075-20260202    clang-20
x86_64                randconfig-075-20260203    gcc-14
x86_64                randconfig-076-20260202    clang-20
x86_64                randconfig-076-20260203    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                       common_defconfig    clang-22
xtensa                randconfig-001-20260202    gcc-12.5.0
xtensa                randconfig-001-20260203    gcc-13.4.0
xtensa                randconfig-002-20260202    gcc-12.5.0
xtensa                randconfig-002-20260203    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

