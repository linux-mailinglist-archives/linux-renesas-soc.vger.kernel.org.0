Return-Path: <linux-renesas-soc+bounces-32696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI4SINu9B2rIFgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 02:44:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E430455995D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 02:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EC513006698
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 00:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B73246768;
	Sat, 16 May 2026 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuXVBHp8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251431448E0
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892247; cv=none; b=JeeNB1smPJAmZBbRU9uI4gLruE5CW8fBdbeOOjszcUusxBU6k7tw3ZsmMGdcUY8EQI6b1gO6E9DJSQdTnZj04T5tPSDip5QZOaRWOmixqCvP+5fK+ooeG78tjZSzbbRu3rqxaufimZ27vtkY9xG47fOLS6mmGXr7GcYcfvc4Cak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892247; c=relaxed/simple;
	bh=jFMP11l25pQrOG4fnxQlhBHxccwedHecGdUNlLi9jYY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CxV90we1fiwD1pRPjnqql3T7iszhBcfSobdAPaVcm0wEZtplj+i9P12ttB1T/kytgHy7vg15YQkjKlUmZ92azTvvzDidDFxRDUJefniBdtYqxVYzu8I7lV1xuK5C9kQPXAHb3fr2DOz/reUbiX1Tsv74h470/0vp4hNzxutkC3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuXVBHp8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778892245; x=1810428245;
  h=date:from:to:cc:subject:message-id;
  bh=jFMP11l25pQrOG4fnxQlhBHxccwedHecGdUNlLi9jYY=;
  b=GuXVBHp8EIOTUwetAM+tCizk9Mg4iA/8SrLkeT6tFBCoDw6aLB/+Uf/Z
   HQshZGqzsHGDwwJ4x/UCJBEsq/VHqwVEOXQIpCvQHyUO9jkPWx5otWXlQ
   UIoos+PGPmAOdOTa6YOwWhURe6bzACY0AZxFaFC3sRCEdshH+GpnEwJh+
   1dwmX7tGz4WHr1vfzbsxn/SpuTPPF6UlT12oOhZIoWngNo3/QHHTgRO3W
   0oUkfagchntaqp5nvecTG3YxUi3ae5CW2PWixRaZckIWL0HGA6MPFJlbl
   wdmngmzQ/YswfcbNz7G1X/FEznLRjvf3N2ofTOuJCNVQEN5+evM7M8zCJ
   A==;
X-CSE-ConnectionGUID: 0PJBjnlgSoSQaGoL8IDc1A==
X-CSE-MsgGUID: l5kK9JfQRn+OvAdJKy4v0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83720260"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="83720260"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 17:44:05 -0700
X-CSE-ConnectionGUID: PoZRshpsR6GecGMLn+YyGg==
X-CSE-MsgGUID: ria7iz6IQ8qF6zwmOYOMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="238725168"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2026 17:44:03 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO38K-000000000Iv-2kp3;
	Sat, 16 May 2026 00:44:00 +0000
Date: Sat, 16 May 2026 08:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.2] BUILD SUCCESS
 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7
Message-ID: <202605160810.oBjhfKuw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: E430455995D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-32696-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.2
branch HEAD: 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7  ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6

elapsed time: 869m

configs tested: 266
configs skipped: 5

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
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260515    gcc-13.4.0
arc                   randconfig-001-20260516    gcc-8.5.0
arc                   randconfig-002-20260515    gcc-8.5.0
arc                   randconfig-002-20260516    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260515    clang-23
arm                   randconfig-001-20260516    gcc-8.5.0
arm                   randconfig-002-20260515    clang-23
arm                   randconfig-002-20260516    gcc-8.5.0
arm                   randconfig-003-20260515    clang-23
arm                   randconfig-003-20260516    gcc-8.5.0
arm                   randconfig-004-20260515    gcc-14.3.0
arm                   randconfig-004-20260516    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-8.5.0
arm64                 randconfig-001-20260515    clang-16
arm64                 randconfig-001-20260516    gcc-9.5.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260515    gcc-10.5.0
arm64                 randconfig-002-20260516    gcc-9.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260515    gcc-11.5.0
arm64                 randconfig-003-20260516    gcc-9.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260515    gcc-11.5.0
arm64                 randconfig-004-20260516    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260515    gcc-10.5.0
csky                  randconfig-001-20260516    gcc-9.5.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260515    gcc-15.2.0
csky                  randconfig-002-20260516    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260515    clang-23
hexagon               randconfig-001-20260516    gcc-11.5.0
hexagon               randconfig-002-20260515    clang-23
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
i386        buildonly-randconfig-004-20260516    gcc-14
i386        buildonly-randconfig-005-20260516    clang-20
i386        buildonly-randconfig-006-20260516    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260515    clang-20
i386                  randconfig-002-20260515    clang-20
i386                  randconfig-003-20260515    clang-20
i386                  randconfig-004-20260515    clang-20
i386                  randconfig-005-20260515    clang-20
i386                  randconfig-006-20260515    gcc-14
i386                  randconfig-007-20260515    clang-20
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
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260515    gcc-15.2.0
loongarch             randconfig-001-20260516    gcc-11.5.0
loongarch             randconfig-002-20260515    clang-23
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
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260515    gcc-11.5.0
nios2                 randconfig-001-20260516    gcc-11.5.0
nios2                 randconfig-002-20260515    gcc-8.5.0
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
riscv                 randconfig-001-20260515    clang-23
riscv                 randconfig-001-20260516    gcc-15.2.0
riscv                 randconfig-002-20260515    clang-23
riscv                 randconfig-002-20260516    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260515    clang-18
s390                  randconfig-001-20260516    gcc-15.2.0
s390                  randconfig-002-20260515    clang-23
s390                  randconfig-002-20260516    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260515    gcc-13.4.0
sh                    randconfig-001-20260516    gcc-15.2.0
sh                    randconfig-002-20260515    gcc-15.2.0
sh                    randconfig-002-20260516    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260515    gcc-8.5.0
sparc                 randconfig-001-20260516    gcc-8.5.0
sparc                 randconfig-002-20260515    gcc-15.2.0
sparc                 randconfig-002-20260516    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260516    gcc-8.5.0
sparc64               randconfig-002-20260515    clang-20
sparc64               randconfig-002-20260516    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260515    gcc-14
um                    randconfig-001-20260516    gcc-8.5.0
um                    randconfig-002-20260515    gcc-14
um                    randconfig-002-20260516    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260516    gcc-14
x86_64      buildonly-randconfig-002-20260516    gcc-14
x86_64      buildonly-randconfig-003-20260516    gcc-14
x86_64      buildonly-randconfig-004-20260516    gcc-14
x86_64      buildonly-randconfig-005-20260516    gcc-14
x86_64      buildonly-randconfig-006-20260516    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260515    clang-20
x86_64                randconfig-001-20260516    gcc-14
x86_64                randconfig-002-20260515    clang-20
x86_64                randconfig-002-20260516    gcc-14
x86_64                randconfig-003-20260515    gcc-13
x86_64                randconfig-003-20260516    gcc-14
x86_64                randconfig-004-20260515    clang-20
x86_64                randconfig-004-20260516    gcc-14
x86_64                randconfig-005-20260515    clang-20
x86_64                randconfig-005-20260516    gcc-14
x86_64                randconfig-006-20260515    clang-20
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
xtensa                randconfig-001-20260515    gcc-9.5.0
xtensa                randconfig-001-20260516    gcc-8.5.0
xtensa                randconfig-002-20260515    gcc-11.5.0
xtensa                randconfig-002-20260516    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

