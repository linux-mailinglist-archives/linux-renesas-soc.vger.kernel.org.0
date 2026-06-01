Return-Path: <linux-renesas-soc+bounces-33389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD3EL4onHWq6VwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 08:32:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA2061A36F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 08:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0337A3015A62
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 06:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FF735DA7B;
	Mon,  1 Jun 2026 06:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+R8474b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192535DA78
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295543; cv=none; b=nK8vgQ9ID33IX9t6XjQmhJmfI8ygivl6dqSd38OPqMF97W8H8ZCYKaGomx0gGaF97O32nhJ1JCgvRtYelFEbWdl4qkWcvNnUgkjriJiz7Hx7M1N7GLrnrii39RorNls0D+MdLMWKInCxPdRSk02PFVltDni4fQ/25JMx3V7GN38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295543; c=relaxed/simple;
	bh=2KOSp+qdskQVRct8zsIm3IjzSepIVICB/C5KQ6G78wE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iA2pJAv0jW3czh83XJWeaRlDHy5epObfadbxRc+h6Lz+V179JbAsdAIXoHxTLDB7mD0d7OtuGXq4GU09mrAyTWdqCbrie0kr7xgGD6RIE+N46uq7E9vJUfZHB58JXpBEROqrH5NwWaJU7KJV85vdAuRzPBBTbK7Z1Qptnx3AQD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+R8474b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780295538; x=1811831538;
  h=date:from:to:cc:subject:message-id;
  bh=2KOSp+qdskQVRct8zsIm3IjzSepIVICB/C5KQ6G78wE=;
  b=d+R8474bMokYmtb4mFwXPoojam4+9QRQ7nf/N6GuMrjDhjjDwtqu7fcp
   MiOD3qwDgqzS7lkbS6dTv3sj4jpwdjlWl0vkWP+Rsxs7FbX19IXG3rVvv
   EsFjJ4tRgX21CCnt7IlXIBzggiBaUtAFBkbOVKxmtnS5Wsh1MfkBlJmYm
   V39uJrPUj7KvBAyKCzsM9ZlTd3xqvJom+FyMveZ5UPR7uomksrW+gdTJd
   n+E3Tl9k6aW76WooyWT0wwhut+gd32k2XkEK++bc/K3yTE5KbpG2MQzy9
   BmfJbcnkmx6Cl9XWcGYuth+uUpTWxreOOYH6Z/znbiXLSF7B8fm9ZMptf
   A==;
X-CSE-ConnectionGUID: 7Jc9/RvSS4y0HY0xi6BXQQ==
X-CSE-MsgGUID: X1I1bt8gTXijPLVOVjI6Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80185252"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="80185252"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 23:32:17 -0700
X-CSE-ConnectionGUID: GGBmR+kKRG2d6d5eKNoZAw==
X-CSE-MsgGUID: U6aauNv1QwKJPvYaDfD2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="248572156"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 May 2026 23:32:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTwC7-00000000AGU-1Dnp;
	Mon, 01 Jun 2026 06:32:15 +0000
Date: Mon, 01 Jun 2026 14:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 82fcca5f06a468bff003e3310cc733409761a6f4
Message-ID: <202606011410.v0L4gw9c-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33389-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 3BA2061A36F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 82fcca5f06a468bff003e3310cc733409761a6f4  Merge branch 'renesas-next' into renesas-devel

elapsed time: 733m

configs tested: 211
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

