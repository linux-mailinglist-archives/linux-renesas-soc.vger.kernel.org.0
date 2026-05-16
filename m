Return-Path: <linux-renesas-soc+bounces-32697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ArXnJ/fSB2qDKQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 04:14:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A26559DC5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 04:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA09C3018D71
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 02:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BF226ED37;
	Sat, 16 May 2026 02:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/d2Nk1w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205731A3154
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 02:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897652; cv=none; b=LaZBQgYkvOn/0MrsGGmEqmwUm5z1uZjcH9CsS1ZYY4IOsxp4ZXl/DM+ufqm7lxjKKkwfZrsmuRoG9bI2TtwkMitvxFTi+RtnrPPTdMRkaXhyluFk2/Xh6bCV5Vag9UFwQMtpLU2R6Oz/QjIdCIwXKEAn6OepnX2Fxd7oMS9Thz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897652; c=relaxed/simple;
	bh=8EJ1JtX/2fA77duLLcX6a1IprrSj2phgmcw92tnY91g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iaLTGFuVpvIKmriqShvlH946bNaXBnc2qZSgygoPQvtPl1TNuu8LiaWOSQ3elyD9qe5sjOBOTf4c18VqUhmueMQmpfrDN5wI73Gcubx8yzc5c7ncwjbPINDhurIRLchB4JVrpBUJXQyNcL2fIqInJfcQp3snUqgGNxNZrE017D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/d2Nk1w; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778897651; x=1810433651;
  h=date:from:to:cc:subject:message-id;
  bh=8EJ1JtX/2fA77duLLcX6a1IprrSj2phgmcw92tnY91g=;
  b=b/d2Nk1w+e4g+4Q9+g4ZwqxqrWcUKvttIlsOoV0qgz4MPXUb43GgiKs4
   86w9DRZC3CxNKWV0n47VXKeOFfmDWmGl4cniHGtSJ66kmomiAM1WkTg0h
   HB0Xa1mMvZWpDOdmtARVcAfPR1K/fhANA/v9QaUlQkypC+lN8AWruNTIy
   /yjO6QS2Itt9BzbMiGmhZKJB3nV62b24AuKJm/oKV3HHFkJ4xNr1ZYnWa
   KJlMEHBn5Pqncyi5ag+YuivLps0ULn2V5KZoEyxpXoSF0IepYi2j4Yfc/
   2W8Z03bOLHL7MCQy7ayLdyTj1SySb9XiVa+IertPMcRgwVmD6zJwKZUCH
   Q==;
X-CSE-ConnectionGUID: kQg4IQoqTniyIoAvpPpNyQ==
X-CSE-MsgGUID: 6K4QL5njS6iJsoCnDzm8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79895422"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79895422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 19:14:10 -0700
X-CSE-ConnectionGUID: qYh3y5xuQ+K9KP509NCgPw==
X-CSE-MsgGUID: ed9wM+XfQTSZPFX5CSv9aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="237990595"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 May 2026 19:14:09 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO4XW-000000000NB-38Pf;
	Sat, 16 May 2026 02:14:06 +0000
Date: Sat, 16 May 2026 10:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 1dbfc4ee3e4825c650f3bd4d54063546ee059d5b
Message-ID: <202605161055.5GIqYZD2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 80A26559DC5
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
	TAGGED_FROM(0.00)[bounces-32697-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 1dbfc4ee3e4825c650f3bd4d54063546ee059d5b  Merge branch 'renesas-dts-for-v7.2' into renesas-next

elapsed time: 961m

configs tested: 267
configs skipped: 9

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
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260515    gcc-13.4.0
arc                   randconfig-001-20260516    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260515    gcc-8.5.0
arc                   randconfig-002-20260516    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260515    clang-23
arm                   randconfig-001-20260516    gcc-8.5.0
arm                            randconfig-002    gcc-11.5.0
arm                   randconfig-002-20260515    clang-23
arm                   randconfig-002-20260516    gcc-8.5.0
arm                            randconfig-003    clang-20
arm                   randconfig-003-20260515    clang-23
arm                   randconfig-003-20260516    gcc-8.5.0
arm                            randconfig-004    gcc-14.3.0
arm                   randconfig-004-20260515    gcc-14.3.0
arm                   randconfig-004-20260516    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260516    gcc-9.5.0
arm64                 randconfig-002-20260516    gcc-9.5.0
arm64                 randconfig-003-20260516    gcc-9.5.0
arm64                 randconfig-004-20260516    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260516    gcc-9.5.0
csky                  randconfig-002-20260516    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260516    clang-23
hexagon               randconfig-001-20260516    gcc-11.5.0
hexagon               randconfig-002-20260516    clang-16
hexagon               randconfig-002-20260516    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260516    clang-20
i386        buildonly-randconfig-002-20260516    clang-20
i386        buildonly-randconfig-003-20260516    clang-20
i386        buildonly-randconfig-004-20260516    clang-20
i386        buildonly-randconfig-005-20260516    clang-20
i386        buildonly-randconfig-006-20260516    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260515    clang-20
i386                  randconfig-001-20260516    clang-20
i386                  randconfig-002-20260515    clang-20
i386                  randconfig-002-20260516    clang-20
i386                  randconfig-003-20260515    clang-20
i386                  randconfig-003-20260516    clang-20
i386                  randconfig-004-20260515    clang-20
i386                  randconfig-004-20260516    clang-20
i386                  randconfig-005-20260515    clang-20
i386                  randconfig-005-20260516    clang-20
i386                  randconfig-006-20260515    gcc-14
i386                  randconfig-006-20260516    clang-20
i386                  randconfig-007-20260515    clang-20
i386                  randconfig-007-20260516    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260515    clang-20
i386                  randconfig-011-20260516    gcc-14
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260515    gcc-14
i386                  randconfig-012-20260516    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260515    gcc-14
i386                  randconfig-013-20260516    gcc-14
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260515    clang-20
i386                  randconfig-014-20260516    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260515    clang-20
i386                  randconfig-015-20260516    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260515    clang-20
i386                  randconfig-016-20260516    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260515    clang-20
i386                  randconfig-017-20260516    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260516    gcc-11.5.0
loongarch             randconfig-001-20260516    gcc-15.2.0
loongarch             randconfig-002-20260516    clang-18
loongarch             randconfig-002-20260516    gcc-11.5.0
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
mips                 decstation_r4k_defconfig    gcc-15.2.0
mips                           ip32_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260516    gcc-10.5.0
nios2                 randconfig-001-20260516    gcc-11.5.0
nios2                 randconfig-002-20260516    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260516    gcc-12.5.0
parisc                randconfig-002-20260516    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260516    gcc-12.5.0
powerpc               randconfig-002-20260516    gcc-12.5.0
powerpc64             randconfig-001-20260516    gcc-12.5.0
powerpc64             randconfig-002-20260516    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260515    clang-23
riscv                 randconfig-001-20260516    gcc-15.2.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260515    clang-23
riscv                 randconfig-002-20260516    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260515    clang-18
s390                  randconfig-001-20260516    gcc-15.2.0
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260515    clang-23
s390                  randconfig-002-20260516    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260515    gcc-13.4.0
sh                    randconfig-001-20260516    gcc-15.2.0
sh                             randconfig-002    gcc-14.3.0
sh                    randconfig-002-20260515    gcc-15.2.0
sh                    randconfig-002-20260516    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260516    gcc-8.5.0
sparc                 randconfig-002-20260516    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260516    gcc-8.5.0
sparc64               randconfig-002-20260516    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260516    gcc-8.5.0
um                    randconfig-002-20260516    gcc-8.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260516    clang-20
x86_64      buildonly-randconfig-001-20260516    gcc-14
x86_64      buildonly-randconfig-002-20260516    gcc-14
x86_64      buildonly-randconfig-003-20260516    gcc-13
x86_64      buildonly-randconfig-003-20260516    gcc-14
x86_64      buildonly-randconfig-004-20260516    gcc-14
x86_64      buildonly-randconfig-005-20260516    gcc-14
x86_64      buildonly-randconfig-006-20260516    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260516    clang-20
x86_64                randconfig-001-20260516    gcc-14
x86_64                randconfig-002-20260516    clang-20
x86_64                randconfig-002-20260516    gcc-14
x86_64                randconfig-003-20260516    gcc-14
x86_64                randconfig-004-20260516    gcc-14
x86_64                randconfig-005-20260516    gcc-14
x86_64                randconfig-006-20260516    gcc-14
x86_64                randconfig-011-20260515    clang-20
x86_64                randconfig-011-20260516    clang-20
x86_64                randconfig-012-20260515    clang-20
x86_64                randconfig-012-20260516    clang-20
x86_64                randconfig-013-20260515    clang-20
x86_64                randconfig-013-20260516    clang-20
x86_64                randconfig-014-20260515    clang-20
x86_64                randconfig-014-20260516    clang-20
x86_64                randconfig-015-20260515    gcc-14
x86_64                randconfig-015-20260516    clang-20
x86_64                randconfig-016-20260515    gcc-14
x86_64                randconfig-016-20260516    clang-20
x86_64                randconfig-071-20260515    clang-20
x86_64                randconfig-071-20260516    gcc-14
x86_64                randconfig-072-20260515    gcc-14
x86_64                randconfig-072-20260516    gcc-14
x86_64                randconfig-073-20260515    gcc-14
x86_64                randconfig-073-20260516    gcc-14
x86_64                randconfig-074-20260515    clang-20
x86_64                randconfig-074-20260516    gcc-14
x86_64                randconfig-075-20260515    gcc-12
x86_64                randconfig-075-20260516    gcc-14
x86_64                randconfig-076-20260515    clang-20
x86_64                randconfig-076-20260516    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260516    gcc-8.5.0
xtensa                randconfig-002-20260516    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

