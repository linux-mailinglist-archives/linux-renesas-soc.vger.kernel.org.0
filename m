Return-Path: <linux-renesas-soc+bounces-33241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOO+NyfOF2rsRQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:09:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9C5ECA7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0540930888B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 05:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9822DB780;
	Thu, 28 May 2026 05:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdzvHTel"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA92343888;
	Thu, 28 May 2026 05:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779944997; cv=none; b=aC8Fjn1u2f1xrNMFExU702DIVGKsUtbxtxmkcKbVU6gN2XWNJ8AZruwnBujnWOc8euH0d8dvjft46jVzmKi3X/DiglQqOenY+wFeOXJSWsVclsdrGgQkBezi4LmTsg8qyhEXl+6SLjpyMyY6m0kaKpAZ35l51DO4CwSLsaz+RY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779944997; c=relaxed/simple;
	bh=nQo2IzY0UlFf8tCUPnT/P5Gd5KBr5ac8QxT5To5kt+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=esCzqxjaIUBtC/149rqHU/78CX+qEgPlesDT4qCb1RIuBFzZr6F/aQqQVTwSJcD0e41s4wAvF674LOBCVh9oiqALUkU1gn/wBTSMA08je9s472j66+KqVTCqGIffioilYiTVqhkTyaXLbzE7qRXYVEmX4XO8/Mn4aDcZx8e2Dpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdzvHTel; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779944995; x=1811480995;
  h=date:from:to:cc:subject:message-id;
  bh=nQo2IzY0UlFf8tCUPnT/P5Gd5KBr5ac8QxT5To5kt+8=;
  b=OdzvHTel30mMKiUJmkfbmRNfMH9DND37CAPjmOxKqBHMSKfWlCdYydAE
   0Ek8oVY1jtzkKqW+Ntf8loTRNKLsEQhbBsrAyhdXN4Bo51HUbPd3nJVR8
   dzMFH4+JdX+eLFPnzsGC+hU3MF/ugWxry9r7D4Al9FvDMsIrMpU3PYaLF
   dsmDjMp3BDZCkN0Gd9hmgAkkncNYDXQaElxucwcYcvP5/DH4nBj6bT8rL
   LrjVg9zsMZ8LgiTCg1shukdlfMhcE8+akoLid5G+VdbvEE99fLhwV/uDW
   iIEspBkoVwKfqzHl9S2kUf/0wRO++MC7SpNbaMcSKwQ48lFMy3CcrmydF
   Q==;
X-CSE-ConnectionGUID: reslZjmYRyymRMnYY2uWlw==
X-CSE-MsgGUID: RQJ/FQgHTX2eY8a1RTts6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80773701"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="80773701"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 22:09:54 -0700
X-CSE-ConnectionGUID: F+SVkDKHRwWqJojPL3xybg==
X-CSE-MsgGUID: yq65eNt+R3+pSelFKVBWqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="266341877"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2026 22:09:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wST0A-000000005Yg-2fh1;
	Thu, 28 May 2026 05:09:50 +0000
Date: Thu, 28 May 2026 13:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 audit@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master] BUILD REGRESSION
 e7d700e14934e68f86338c5610cf2ae76798b663
Message-ID: <202605281316.GwqEa9Tn-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33241-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 4CA9C5ECA7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: e7d700e14934e68f86338c5610cf2ae76798b663  Add linux-next specific files for 20260527

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202605280441.YSawqHBc-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202605280456.3Hhpgxl0-lkp@intel.com

    kernel/auditfilter.c:592:15: error: incompatible pointer types assigning to 'struct audit_fsnotify_mark *' from 'int (struct task_struct *)' [-Wincompatible-pointer-types]
    kernel/auditfilter.c:592:17: error: use of undeclared identifier 'audit_alloc_mark'; did you mean 'audit_alloc'?
    kernel/auditfilter.c:592:38: error: 'audit_alloc_mark' undeclared (first use in this function); did you mean 'audit_alloc'?
    kernel/auditfilter.c:592:60: error: too many arguments provided to function-like macro invocation
    kernel/auditfilter.c:592:85: error: macro 'audit_alloc_mark' passed 4 arguments, but takes just 3
    kernel/auditfilter.c:879:10: error: use of undeclared identifier 'audit_dupe_exe'; did you mean 'audit_dupe_rule'?
    kernel/auditfilter.c:879:31: error: 'audit_dupe_exe' undeclared (first use in this function); did you mean 'audit_dupe_rule'?
    kernel/auditfilter.c:879:59: error: macro 'audit_dupe_exe' passed 3 arguments, but takes just 2
    kernel/auditfilter.c:879:8: error: incompatible pointer to integer conversion assigning to 'int' from 'struct audit_entry *(struct audit_krule *, struct audit_watch_ctx *)' [-Wint-conversion]

Unverified Error/Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202605280927.Yv6FGE1L-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202605281126.3E7Ggbfe-lkp@intel.com

    drivers/pinctrl/renesas/pinctrl-rzt2h.c:197 rzt2h_pinctrl_set_pfc_mode() warn: subtract is higher precedence than shift
    lib/raid/raid6/arm/recov_neon_inner.c:32 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
    lib/raid/raid6/arm/recov_neon_inner.c:81 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-003-20260528
|   |-- kernel-auditfilter.c:error:incompatible-pointer-to-integer-conversion-assigning-to-int-from-struct-audit_entry-(struct-audit_krule-struct-audit_watch_ctx-)
|   |-- kernel-auditfilter.c:error:incompatible-pointer-types-assigning-to-struct-audit_fsnotify_mark-from-int-(struct-task_struct-)
|   |-- kernel-auditfilter.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- kernel-auditfilter.c:error:use-of-undeclared-identifier-audit_alloc_mark
|   `-- kernel-auditfilter.c:error:use-of-undeclared-identifier-audit_dupe_exe
|-- arm64-randconfig-r071-20260528
|   |-- drivers-pinctrl-renesas-pinctrl-rzt2h.c-rzt2h_pinctrl_set_pfc_mode()-warn:subtract-is-higher-precedence-than-shift
|   |-- lib-raid-raid6-arm-recov_neon_inner.c-__raid6_2data_recov_neon()-warn:statement-has-no-effect-uint8x16_t
|   `-- lib-raid-raid6-arm-recov_neon_inner.c-__raid6_datap_recov_neon()-warn:statement-has-no-effect-uint8x16_t
`-- microblaze-defconfig
    |-- kernel-auditfilter.c:error:audit_alloc_mark-undeclared-(first-use-in-this-function)
    |-- kernel-auditfilter.c:error:audit_dupe_exe-undeclared-(first-use-in-this-function)
    |-- kernel-auditfilter.c:error:macro-audit_alloc_mark-passed-arguments-but-takes-just
    `-- kernel-auditfilter.c:error:macro-audit_dupe_exe-passed-arguments-but-takes-just

elapsed time: 762m

configs tested: 165
configs skipped: 6

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260528    gcc-8.5.0
arc                   randconfig-002-20260528    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260528    gcc-8.5.0
arm                   randconfig-002-20260528    gcc-8.5.0
arm                   randconfig-003-20260528    clang-23
arm                   randconfig-004-20260528    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260528    clang-23
arm64                 randconfig-002-20260528    gcc-15.2.0
arm64                 randconfig-003-20260528    gcc-11.5.0
arm64                 randconfig-004-20260528    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260528    gcc-15.2.0
csky                  randconfig-002-20260528    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260528    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260528    clang-20
i386        buildonly-randconfig-002-20260528    clang-20
i386        buildonly-randconfig-003-20260528    clang-20
i386        buildonly-randconfig-004-20260528    clang-20
i386        buildonly-randconfig-005-20260528    clang-20
i386        buildonly-randconfig-006-20260528    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260528    gcc-14
i386                  randconfig-002-20260528    clang-20
i386                  randconfig-003-20260528    clang-20
i386                  randconfig-004-20260528    gcc-14
i386                  randconfig-005-20260528    clang-20
i386                  randconfig-006-20260528    clang-20
i386                  randconfig-007-20260528    clang-20
i386                  randconfig-011-20260528    gcc-12
i386                  randconfig-012-20260528    gcc-14
i386                  randconfig-013-20260528    gcc-14
i386                  randconfig-014-20260528    gcc-14
i386                  randconfig-015-20260528    clang-20
i386                  randconfig-016-20260528    gcc-14
i386                  randconfig-017-20260528    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-002-20260528    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260528    gcc-11.5.0
nios2                 randconfig-002-20260528    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260528    gcc-8.5.0
parisc                randconfig-002-20260528    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-002-20260528    gcc-12.5.0
powerpc64             randconfig-001-20260528    gcc-12.5.0
powerpc64             randconfig-002-20260528    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260528    clang-18
riscv                 randconfig-002-20260528    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260528    clang-23
s390                  randconfig-002-20260528    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260528    gcc-13.4.0
sh                    randconfig-002-20260528    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260528    gcc-11.5.0
sparc                 randconfig-002-20260528    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260528    gcc-8.5.0
sparc64               randconfig-002-20260528    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260528    clang-23
um                    randconfig-002-20260528    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260528    clang-20
x86_64      buildonly-randconfig-002-20260528    clang-20
x86_64      buildonly-randconfig-003-20260528    gcc-14
x86_64      buildonly-randconfig-004-20260528    gcc-14
x86_64      buildonly-randconfig-005-20260528    clang-20
x86_64      buildonly-randconfig-006-20260528    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260528    clang-20
x86_64                randconfig-002-20260528    clang-20
x86_64                randconfig-003-20260528    gcc-14
x86_64                randconfig-004-20260528    gcc-14
x86_64                randconfig-005-20260528    gcc-14
x86_64                randconfig-006-20260528    clang-20
x86_64                randconfig-011-20260528    clang-20
x86_64                randconfig-012-20260528    gcc-14
x86_64                randconfig-013-20260528    clang-20
x86_64                randconfig-014-20260528    clang-20
x86_64                randconfig-015-20260528    clang-20
x86_64                randconfig-016-20260528    gcc-14
x86_64                randconfig-071-20260528    clang-20
x86_64                randconfig-072-20260528    clang-20
x86_64                randconfig-073-20260528    gcc-14
x86_64                randconfig-074-20260528    clang-20
x86_64                randconfig-075-20260528    gcc-14
x86_64                randconfig-076-20260528    clang-20
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260528    gcc-15.2.0
xtensa                randconfig-002-20260528    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

