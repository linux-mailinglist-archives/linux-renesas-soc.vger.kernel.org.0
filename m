Return-Path: <linux-renesas-soc+bounces-33387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YusgHAInHWoTWAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 08:30:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8561A2F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 08:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8333730067BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 06:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9BF3537F8;
	Mon,  1 Jun 2026 06:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNXxYKwK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED428355057
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295422; cv=none; b=TqjhYqSmJEymOy9HT+Wd7bBg0bTd8QxcKI3Y9k1d8MR7TsBq3t0m5T0hKTOJso4JfNmmj2rnczVMshiauFRK4PHx/E25p154+odnMdOokNaF/vk2graKtTLaa2/agxklHV2Logkit/w2zh9hn8Eu21CEicPMNz8ypm8iAWfiTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295422; c=relaxed/simple;
	bh=7uq6oxlDIkmBK0LmVwgADWtjikcFXJzEoP+PJ/mwzno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZOURWghmuXxKBF+8zZV61zrZ1EuXlBjcjyAnrEOJ37awBrwytllar4bXNhVLS3XZkykOiWRZZNVX5a4z5v0/4qi3f2PDohN3o/rcqQWEaDT9dJKmw0no9zUSTBPinCo8G7ee7QiemPIBLLU+Ei0XpcSWIoAar5ReXsmvJgcCKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNXxYKwK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780295419; x=1811831419;
  h=date:from:to:cc:subject:message-id;
  bh=7uq6oxlDIkmBK0LmVwgADWtjikcFXJzEoP+PJ/mwzno=;
  b=lNXxYKwKJOLezfDquaGxGOHS9CZvqaPXZTXkrQ6kEqOjWMLqNfrPb7RS
   7Eeg4eW1rcbiKs1CK1rjnb37SawGpiQuOJHSkMqaXyBuI2C0YEd60+Kf/
   cYL9eq2T2uLhqf917EmezIi+mBurPSw57dYVohqNJfQEfZUDEWcKrTuo0
   stqH9ZlLEhhSWX3w56jitiErYiiWbsI6pAr4VtBAV2uKQwZlvhjPT3qzg
   t+GBz1gwSPaTbecUDTluH3jsKN6rCatpphzeA7hHDdtpT4IPHp/sEIBop
   bHFnwJ9Mhy5n/zgkyTkebzHYe1/GZ5PEyDwmX6fUe27Z2I77fSNs63MI7
   Q==;
X-CSE-ConnectionGUID: WO4dwfpjRUWR0gXHfvekHw==
X-CSE-MsgGUID: 7LIfDUBwQ9Szyh+eGll8PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81232195"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="81232195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 23:30:18 -0700
X-CSE-ConnectionGUID: 0dvO/PYHRJufrVvTONpctQ==
X-CSE-MsgGUID: MwS+LRpVQeqcn0+9T/Urlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="239077173"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 May 2026 23:30:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTwAA-00000000AG6-41PO;
	Mon, 01 Jun 2026 06:30:14 +0000
Date: Mon, 01 Jun 2026 14:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 fac7341171187bf6c8c8b753a8bf12de38036e65
Message-ID: <202606011400.DJkWFClu-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33387-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 3DA8561A2F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: fac7341171187bf6c8c8b753a8bf12de38036e65  Merge branches 'renesas-drivers-for-v7.2' and 'renesas-dts-for-v7.2' into renesas-next

elapsed time: 732m

configs tested: 215
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260601    clang-23
arc                   randconfig-002-20260601    clang-23
arc                    vdk_hs38_smp_defconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260601    clang-23
arm                   randconfig-002-20260601    clang-23
arm                   randconfig-003-20260601    clang-23
arm                   randconfig-004-20260601    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260601    gcc-8.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260601    gcc-8.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260601    gcc-8.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260601    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260601    gcc-8.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260601    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260601    gcc-8.5.0
hexagon               randconfig-002-20260601    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20260601    gcc-12
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20260601    gcc-12
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20260601    gcc-12
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20260601    gcc-12
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20260601    gcc-12
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20260601    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260601    gcc-14
i386                  randconfig-002-20260601    gcc-14
i386                  randconfig-003-20260601    gcc-14
i386                  randconfig-004-20260601    gcc-14
i386                  randconfig-005-20260601    gcc-14
i386                  randconfig-006-20260601    gcc-14
i386                  randconfig-007-20260601    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260601    gcc-8.5.0
loongarch             randconfig-002-20260601    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260601    gcc-8.5.0
nios2                 randconfig-002-20260601    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-10.5.0
parisc                randconfig-001-20260601    gcc-10.5.0
parisc                         randconfig-002    gcc-10.5.0
parisc                randconfig-002-20260601    gcc-10.5.0
parisc64                         alldefconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                       ppc64_defconfig    clang-23
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260601    gcc-10.5.0
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260601    gcc-10.5.0
powerpc64                      randconfig-001    gcc-10.5.0
powerpc64             randconfig-001-20260601    gcc-10.5.0
powerpc64                      randconfig-002    gcc-10.5.0
powerpc64             randconfig-002-20260601    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260601    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260601    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260601    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260601    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.2.0
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260601    clang-23
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260601    clang-23
sh                           se7722_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260601    gcc-15.2.0
sparc                 randconfig-001-20260601    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260601    gcc-15.2.0
sparc                 randconfig-002-20260601    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260601    gcc-15.2.0
sparc64               randconfig-001-20260601    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260601    gcc-15.2.0
sparc64               randconfig-002-20260601    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260601    gcc-15.2.0
um                    randconfig-001-20260601    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260601    gcc-15.2.0
um                    randconfig-002-20260601    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260601    clang-20
x86_64      buildonly-randconfig-002-20260601    clang-20
x86_64      buildonly-randconfig-003-20260601    clang-20
x86_64      buildonly-randconfig-004-20260601    clang-20
x86_64      buildonly-randconfig-005-20260601    clang-20
x86_64      buildonly-randconfig-006-20260601    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260601    clang-20
x86_64                randconfig-002-20260601    clang-20
x86_64                randconfig-003-20260601    clang-20
x86_64                randconfig-004-20260601    clang-20
x86_64                randconfig-005-20260601    clang-20
x86_64                randconfig-006-20260601    clang-20
x86_64                randconfig-011-20260601    clang-20
x86_64                randconfig-012-20260601    clang-20
x86_64                randconfig-013-20260601    clang-20
x86_64                randconfig-014-20260601    clang-20
x86_64                randconfig-015-20260601    clang-20
x86_64                randconfig-016-20260601    clang-20
x86_64                randconfig-071-20260601    gcc-14
x86_64                randconfig-072-20260601    gcc-14
x86_64                randconfig-073-20260601    gcc-14
x86_64                randconfig-074-20260601    gcc-14
x86_64                randconfig-075-20260601    gcc-14
x86_64                randconfig-076-20260601    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260601    gcc-15.2.0
xtensa                randconfig-001-20260601    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260601    gcc-15.2.0
xtensa                randconfig-002-20260601    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

