Return-Path: <linux-renesas-soc+bounces-28415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAv7A9rcnGl/LwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 00:03:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAE17EB8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 00:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BFA0302B452
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 23:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDAC3793D5;
	Mon, 23 Feb 2026 23:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmZJsE4u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC304322B9F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 23:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887829; cv=none; b=U9IMI6ap9lYh7SspNEyjIU1f/T1jdHwdDrdU4zYPS7suK+QAAQV+5hLK3MESVjFXlUDDzCQF1NrP1WzVyp1YFNMNETzVpJduP9mfX33At7VdIBYuXWShYQ4loEhqfT1Oc+Q4pFQfaot0YAuba4MEqOkY3x4EqWgzQIFlyPN+iN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887829; c=relaxed/simple;
	bh=EZVCVcHE6XXMFYeOCjfy9WbkuvinRkYi4/zL2FMtovc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZfZOLuZmvDuDxcogAH11Yqq+VIbY9f65J5IeE8tK37UvH7z40gIqgQL/B0FA0DWdi9Slw0oREfIaLlLpZ6L5b+jC3pPZxkMe+9TGGCynmkTTX7RZDP0SYQmG3yvhiSxGoFnxPObxh+OZwSZLVBtGReG3A7sLrf7io9/p7fSNUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmZJsE4u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771887828; x=1803423828;
  h=date:from:to:cc:subject:message-id;
  bh=EZVCVcHE6XXMFYeOCjfy9WbkuvinRkYi4/zL2FMtovc=;
  b=VmZJsE4u2ulwVlVCYoIbV87qfxMGS72/BqqCMGj7UtLTe3QneVDUVy5P
   RN0ExZpxmjrczT0LwJiZ1jzNcOe9gJpjkJin7NcMFx+dJoGltBFvH2rVj
   yPx+KxJJsX0j1Q11m4IIvrpFJhFXWwA1UIac+5XGSfl2iaY1J+PQdKGS5
   p18wjyF2ACVvT91fvWogYDf3ynXtKs06b/H++e2k8dZVjhnKEAQWLNddO
   5tSjjpGl2zCtdyvvZ//1RiZldezBp4N/Bw3X5wgGkgysquNygI4RGNACq
   Z/zHvdLks0KjQRvm7pFkXtjVGry8lhKO810+49IS+6T+jBJqHwZpCGu2V
   w==;
X-CSE-ConnectionGUID: d798wYKXR1qeO1Tb+hpJ0A==
X-CSE-MsgGUID: JxnnnwUiTwmCqqSppVWa7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72799725"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72799725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:03:48 -0800
X-CSE-ConnectionGUID: bCV/32X0SYqS8RwjaF8aTg==
X-CSE-MsgGUID: 0qzhm0ygQiCneg8VPyIZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="219231684"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2026 15:03:46 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuexr-000000000sh-3e9Z;
	Mon, 23 Feb 2026 23:03:43 +0000
Date: Tue, 24 Feb 2026 07:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 927d8d109186af0a85ec2a6e7d6fecd322c61fc8
Message-ID: <202602240748.DMWct8Bo-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28415-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1CCAE17EB8C
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 927d8d109186af0a85ec2a6e7d6fecd322c61fc8  Merge branch 'renesas-dts-for-v7.1' into renesas-next

elapsed time: 722m

configs tested: 146
configs skipped: 138

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                          axs101_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260224    gcc-14.3.0
arc                   randconfig-002-20260224    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         assabet_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    gcc-15.2.0
arm                   randconfig-001-20260224    gcc-14.3.0
arm                   randconfig-002-20260224    gcc-14.3.0
arm                   randconfig-003-20260224    gcc-14.3.0
arm                   randconfig-004-20260224    gcc-14.3.0
arm                           spitz_defconfig    gcc-15.2.0
arm                           tegra_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260223    gcc-14.3.0
arm64                 randconfig-002-20260223    gcc-14.3.0
arm64                 randconfig-003-20260223    gcc-14.3.0
arm64                 randconfig-004-20260223    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260223    gcc-14.3.0
csky                  randconfig-002-20260223    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260223    clang-23
hexagon               randconfig-001-20260224    clang-16
hexagon               randconfig-002-20260223    clang-23
hexagon               randconfig-002-20260224    clang-16
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260223    gcc-14
i386        buildonly-randconfig-002-20260223    gcc-14
i386        buildonly-randconfig-003-20260223    gcc-14
i386        buildonly-randconfig-004-20260223    gcc-14
i386        buildonly-randconfig-005-20260223    gcc-14
i386        buildonly-randconfig-006-20260223    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260223    gcc-14
i386                  randconfig-002-20260223    gcc-14
i386                  randconfig-003-20260223    gcc-14
i386                  randconfig-004-20260223    gcc-14
i386                  randconfig-005-20260223    gcc-14
i386                  randconfig-006-20260223    gcc-14
i386                  randconfig-007-20260223    gcc-14
i386                  randconfig-011-20260223    clang-20
i386                  randconfig-012-20260223    clang-20
i386                  randconfig-013-20260223    clang-20
i386                  randconfig-014-20260223    clang-20
i386                  randconfig-015-20260223    clang-20
i386                  randconfig-016-20260223    clang-20
i386                  randconfig-017-20260223    clang-20
loongarch                        alldefconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch             randconfig-001-20260223    clang-23
loongarch             randconfig-001-20260224    clang-16
loongarch             randconfig-002-20260223    clang-23
loongarch             randconfig-002-20260224    clang-16
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip32_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
nios2                             allnoconfig    clang-23
nios2                 randconfig-001-20260223    clang-23
nios2                 randconfig-001-20260224    clang-16
nios2                 randconfig-002-20260223    clang-23
nios2                 randconfig-002-20260224    clang-16
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260223    gcc-8.5.0
parisc                randconfig-002-20260223    gcc-8.5.0
powerpc                           allnoconfig    clang-23
powerpc                      cm5200_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260223    gcc-8.5.0
powerpc               randconfig-002-20260223    gcc-8.5.0
powerpc64             randconfig-001-20260223    gcc-8.5.0
powerpc64             randconfig-002-20260223    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                        dreamcast_defconfig    gcc-15.2.0
sh                               j2_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    gcc-15.2.0
sh                             sh03_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260223    clang-23
sparc                 randconfig-002-20260223    clang-23
sparc64               randconfig-001-20260223    clang-23
sparc64               randconfig-002-20260223    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                    randconfig-001-20260223    clang-23
um                    randconfig-002-20260223    clang-23
x86_64                            allnoconfig    clang-23
x86_64      buildonly-randconfig-001-20260223    gcc-14
x86_64      buildonly-randconfig-001-20260224    gcc-14
x86_64      buildonly-randconfig-002-20260223    gcc-14
x86_64      buildonly-randconfig-002-20260224    gcc-14
x86_64      buildonly-randconfig-003-20260223    gcc-14
x86_64      buildonly-randconfig-003-20260224    gcc-14
x86_64      buildonly-randconfig-004-20260223    gcc-14
x86_64      buildonly-randconfig-004-20260224    gcc-14
x86_64      buildonly-randconfig-005-20260223    gcc-14
x86_64      buildonly-randconfig-005-20260224    gcc-14
x86_64      buildonly-randconfig-006-20260223    gcc-14
x86_64      buildonly-randconfig-006-20260224    gcc-14
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-23
xtensa                randconfig-001-20260223    clang-23
xtensa                randconfig-002-20260223    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

