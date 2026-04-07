Return-Path: <linux-renesas-soc+bounces-30914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPIZHkrg1GmZyQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 12:45:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB713AD1D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 12:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9B2E3012BFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 10:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9D63019BA;
	Tue,  7 Apr 2026 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnHuLVqL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB3394481
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558726; cv=none; b=ZeNpNLdj9y0ttph3uc3R9emz2asKA9Mh84Ys7nxM9EsIGx2c3U21ZEtsqRHLZMIJKJnrZPjydMK7Jk93E3mNrZeyRfOefb2OtWwPT4Zk/Axfy/aW3Pwuolg1Ivm3KZVb/gRyBUyAR02hw5TNX0jN8RJI6+mtcaiZUepUu/zjDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558726; c=relaxed/simple;
	bh=zCpKagAwS/2J9UR0f9YbZ7ygZ7ZvCzoRrUCi/HGou1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cM1SqSAEJRlKs1KYPo2gptA+RVYKXDitirIHdJLMgxH69NgJXlpdoqKg2M7AAvHqoX73Y53e/fk9USLwZgZ66GmWLPAsPgssg0of3DGGGOc921xgVFShWFZAjC8xFhwodftOwOtpqy8uaRwiiBpfk/hXD1Il2HDowwhAx7Ock4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnHuLVqL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775558724; x=1807094724;
  h=date:from:to:cc:subject:message-id;
  bh=zCpKagAwS/2J9UR0f9YbZ7ygZ7ZvCzoRrUCi/HGou1A=;
  b=BnHuLVqLygFgH/2auDZ+OE+deY9WTVkmZL7+AulisPslK/J5kIcear4J
   84btT4P/d4OEMNN5VfNsHQvQcLqjXxDRmXEy366Zn+dtA9F8jSmmvrFxV
   mH6DW5Uf+ONVSky8a0vyTBOCUw8cqKFUh0UdMEiJZZbQKnrcTXNxN1SaG
   h3uV39PgGD8nPYkhSIpjau8Ezz/fqtQQ6aRoiOh0vqy+8+IO7FvVgrJef
   CdzqzAKjJFhOwIDsddQaDErFDhYR/SS4pY6KPdA5S4eO5ZoTCE7+JHR/K
   tMbmuf6V/08t/OhmoZsaC49aC4o6RG8GAruVMujxoc2n7Ih7i0VyKWotp
   g==;
X-CSE-ConnectionGUID: lG/J+D/0TO6+lIBY4EYV3w==
X-CSE-MsgGUID: HfzIwWPhRD6zeFGs/CmIfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86810460"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="86810460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:45:24 -0700
X-CSE-ConnectionGUID: zY7BW6LBQZet4xfqR+KZWQ==
X-CSE-MsgGUID: K4wotHbOS2ONoV21iNYfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="225380279"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2026 03:45:22 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA3vs-000000000UH-0udi;
	Tue, 07 Apr 2026 10:45:20 +0000
Date: Tue, 07 Apr 2026 18:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.2] BUILD SUCCESS
 e3b7f6ec749990c351354d09260ebe00a4edb028
Message-ID: <202604071837.9FQdm11J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30914-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBB713AD1D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.2
branch HEAD: e3b7f6ec749990c351354d09260ebe00a4edb028  ARM: dts: renesas: rskrza1: Drop superfluous cells

elapsed time: 735m

configs tested: 181
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260407    clang-23
arc                   randconfig-002-20260407    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    clang-19
arm                        mvebu_v7_defconfig    clang-23
arm                   randconfig-001-20260407    clang-23
arm                   randconfig-002-20260407    clang-23
arm                   randconfig-003-20260407    clang-23
arm                   randconfig-004-20260407    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260407    gcc-9.5.0
arm64                 randconfig-002-20260407    gcc-9.5.0
arm64                 randconfig-003-20260407    gcc-9.5.0
arm64                 randconfig-004-20260407    gcc-9.5.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260407    gcc-9.5.0
csky                  randconfig-002-20260407    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260407    clang-23
hexagon               randconfig-002-20260407    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260407    clang-20
i386        buildonly-randconfig-002-20260407    clang-20
i386        buildonly-randconfig-003-20260407    clang-20
i386        buildonly-randconfig-004-20260407    clang-20
i386        buildonly-randconfig-005-20260407    clang-20
i386        buildonly-randconfig-006-20260407    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260407    gcc-14
i386                  randconfig-002-20260407    gcc-14
i386                  randconfig-003-20260407    gcc-14
i386                  randconfig-004-20260407    gcc-14
i386                  randconfig-005-20260407    gcc-14
i386                  randconfig-006-20260407    gcc-14
i386                  randconfig-007-20260407    gcc-14
i386                  randconfig-011-20260407    clang-20
i386                  randconfig-012-20260407    clang-20
i386                  randconfig-013-20260407    clang-20
i386                  randconfig-014-20260407    clang-20
i386                  randconfig-015-20260407    clang-20
i386                  randconfig-016-20260407    clang-20
i386                  randconfig-017-20260407    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260407    clang-23
loongarch             randconfig-002-20260407    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-15.2.0
nios2                 randconfig-001-20260407    clang-23
nios2                 randconfig-002-20260407    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260407    gcc-10.5.0
parisc                randconfig-002-20260407    gcc-10.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      chrp32_defconfig    clang-19
powerpc               randconfig-001-20260407    gcc-10.5.0
powerpc               randconfig-002-20260407    gcc-10.5.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260407    gcc-10.5.0
powerpc64             randconfig-002-20260407    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260407    gcc-14.3.0
riscv                 randconfig-002-20260407    gcc-14.3.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260407    gcc-14.3.0
s390                  randconfig-002-20260407    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260407    gcc-14.3.0
sh                    randconfig-002-20260407    gcc-14.3.0
sh                           se7206_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260407    gcc-12
sparc                 randconfig-002-20260407    gcc-12
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260407    gcc-12
sparc64               randconfig-002-20260407    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260407    gcc-12
um                    randconfig-002-20260407    gcc-12
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260407    gcc-14
x86_64      buildonly-randconfig-002-20260407    gcc-14
x86_64      buildonly-randconfig-003-20260407    gcc-14
x86_64      buildonly-randconfig-004-20260407    gcc-14
x86_64      buildonly-randconfig-005-20260407    gcc-14
x86_64      buildonly-randconfig-006-20260407    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260407    gcc-14
x86_64                randconfig-002-20260407    gcc-14
x86_64                randconfig-003-20260407    gcc-14
x86_64                randconfig-004-20260407    gcc-14
x86_64                randconfig-005-20260407    gcc-14
x86_64                randconfig-006-20260407    gcc-14
x86_64                randconfig-011-20260407    clang-20
x86_64                randconfig-012-20260407    clang-20
x86_64                randconfig-013-20260407    clang-20
x86_64                randconfig-014-20260407    clang-20
x86_64                randconfig-015-20260407    clang-20
x86_64                randconfig-016-20260407    clang-20
x86_64                randconfig-071-20260407    clang-20
x86_64                randconfig-072-20260407    clang-20
x86_64                randconfig-073-20260407    clang-20
x86_64                randconfig-074-20260407    clang-20
x86_64                randconfig-075-20260407    clang-20
x86_64                randconfig-076-20260407    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260407    gcc-12
xtensa                randconfig-002-20260407    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

