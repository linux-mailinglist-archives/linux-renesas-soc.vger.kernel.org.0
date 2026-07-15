Return-Path: <linux-renesas-soc+bounces-35234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wNV6Dcn7VmrjDwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 05:17:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391F75A3EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 05:17:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GV6i5teE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BD68304A937
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 03:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E591B36C0CE;
	Wed, 15 Jul 2026 03:17:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F02931D0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 03:17:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784085446; cv=none; b=UkkhV5s3TQRIB4tQbPyDTCWH3gST3hVlTHLamUDZvOyJ7EzkOBPr9iMbEOdUa5Fy1fErNogeUKdxBh7RAd3itMGXmz6F5Ik4P1toqkKc8wBhOjMYnLm9/k8poVUvIUGM1FNfXiz58imkE/DTry5S0aYB/xpzEc3xjaIMpEnRLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784085446; c=relaxed/simple;
	bh=iA2+LDhZBH4NLlgrOyoNUsxLdTeoPcfounZqLGR9ttc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a6gslyRsD1dLGEnEomwMhDfUhWMZfr7FSJg52KcdWlEvp/bjnvgpMMNDiqczhTsv91+Fq6cGFiLLttkv0AtC56uhRIN936882Q6+l1oRDWubOe1ddB2Bd+6M31uvPjgJNNFRry+YbXiJYxPyQb7cnCh4vWZuZT2z2QyztvGEwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GV6i5teE; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784085444; x=1815621444;
  h=date:from:to:cc:subject:message-id;
  bh=iA2+LDhZBH4NLlgrOyoNUsxLdTeoPcfounZqLGR9ttc=;
  b=GV6i5teE+1V4B0C01t5/hiIzLLXs8F4DvzlsudaV2EuwV0ll0zStp7sr
   7FmSHdJeQK5epKmbWLxKVbidybsI4vezBr0GHgKWovkNCRfsuoOMHT+/r
   EVSCbqpV+kf6rgRRboVVvlAYUe8zaBOq48kjegBDXvkC54jf7I0ys14og
   iCc++7PHz0yOszEXsPrmu5Udf0y3yNEJhszqAhzx91WY6888WnjANhcIR
   luj+vTqa7dTvgLwwkE/E9kJzYVKIPUU0p42jUoR1ehs+U+Fn1mzaJd5FT
   3rgZ/gFJ/pcLHVS78bJ1rwLYjhPGqI/ptPz6mRUKeJceqrgUusEtj9brA
   Q==;
X-CSE-ConnectionGUID: 9KXnJuFYR0WwXYaYxMoJow==
X-CSE-MsgGUID: uEYWddI1ReumsuB1/blj4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88538551"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="88538551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 20:17:20 -0700
X-CSE-ConnectionGUID: c3PJBkAoQ/CBpC1Hrd3/wA==
X-CSE-MsgGUID: 5GJDyI3JSzC6i/0U5404XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="253421168"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jul 2026 20:17:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjq7X-00000000NFL-26nm;
	Wed, 15 Jul 2026 03:17:15 +0000
Date: Wed, 15 Jul 2026 11:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:fixes] BUILD SUCCESS
 6fa6ee724d8dadf392139e242ac936b5da730c4b
Message-ID: <202607151105.0gbs3XGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35234-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8391F75A3EC

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git fixes
branch HEAD: 6fa6ee724d8dadf392139e242ac936b5da730c4b  arm64: dts: renesas: ironhide: Describe inline ECC carveouts

elapsed time: 758m

configs tested: 193
configs skipped: 220

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260715    gcc-10.5.0
arc                   randconfig-002-20260715    gcc-10.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260715    gcc-10.5.0
arm                   randconfig-002-20260715    gcc-10.5.0
arm                   randconfig-003-20260715    gcc-10.5.0
arm                   randconfig-004-20260715    gcc-10.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260715    gcc-16.1.0
arm64                 randconfig-002-20260715    gcc-16.1.0
arm64                 randconfig-003-20260715    gcc-16.1.0
arm64                 randconfig-004-20260715    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260715    gcc-16.1.0
csky                  randconfig-002-20260715    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260714    gcc-16.1.0
hexagon               randconfig-002-20260714    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260715    clang-22
i386        buildonly-randconfig-002-20260715    clang-22
i386        buildonly-randconfig-003-20260715    clang-22
i386        buildonly-randconfig-004-20260715    clang-22
i386        buildonly-randconfig-005-20260715    clang-22
i386        buildonly-randconfig-006-20260715    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260715    clang-22
i386                  randconfig-002-20260715    clang-22
i386                  randconfig-003-20260715    clang-22
i386                  randconfig-004-20260715    clang-22
i386                  randconfig-005-20260715    clang-22
i386                  randconfig-006-20260715    clang-22
i386                  randconfig-007-20260715    clang-22
i386                  randconfig-011-20260715    gcc-14
i386                  randconfig-012-20260715    gcc-14
i386                  randconfig-013-20260715    gcc-14
i386                  randconfig-014-20260715    gcc-14
i386                  randconfig-015-20260715    gcc-14
i386                  randconfig-016-20260715    gcc-14
i386                  randconfig-017-20260715    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260714    gcc-16.1.0
loongarch             randconfig-001-20260715    gcc-16.1.0
loongarch             randconfig-002-20260714    gcc-16.1.0
loongarch             randconfig-002-20260715    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                            mac_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        bcm63xx_defconfig    clang-23
mips                      maltaaprp_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260714    gcc-16.1.0
nios2                 randconfig-001-20260715    gcc-16.1.0
nios2                 randconfig-002-20260714    gcc-16.1.0
nios2                 randconfig-002-20260715    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260714    clang-17
parisc                randconfig-001-20260715    clang-23
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260714    clang-17
parisc                randconfig-002-20260715    clang-23
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260714    clang-17
powerpc               randconfig-001-20260715    clang-23
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260714    clang-17
powerpc               randconfig-002-20260715    clang-23
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260714    clang-17
powerpc64             randconfig-001-20260715    clang-23
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260714    clang-17
powerpc64             randconfig-002-20260715    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260715    gcc-15.2.0
riscv                 randconfig-002-20260715    gcc-15.2.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260715    gcc-15.2.0
s390                  randconfig-002-20260715    gcc-15.2.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260715    gcc-15.2.0
sh                    randconfig-002-20260715    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260715    gcc-16.1.0
sparc                 randconfig-002-20260715    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260715    gcc-16.1.0
sparc64               randconfig-002-20260715    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260715    gcc-16.1.0
um                    randconfig-002-20260715    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260715    gcc-14
x86_64      buildonly-randconfig-002-20260715    gcc-14
x86_64      buildonly-randconfig-003-20260715    gcc-14
x86_64      buildonly-randconfig-004-20260715    gcc-14
x86_64      buildonly-randconfig-005-20260715    gcc-14
x86_64      buildonly-randconfig-006-20260715    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260715    clang-22
x86_64                randconfig-002-20260715    clang-22
x86_64                randconfig-003-20260715    clang-22
x86_64                randconfig-004-20260715    clang-22
x86_64                randconfig-005-20260715    clang-22
x86_64                randconfig-006-20260715    clang-22
x86_64                randconfig-011-20260715    clang-22
x86_64                randconfig-012-20260715    clang-22
x86_64                randconfig-013-20260715    clang-22
x86_64                randconfig-014-20260715    clang-22
x86_64                randconfig-015-20260715    clang-22
x86_64                randconfig-016-20260715    clang-22
x86_64                randconfig-071-20260715    gcc-14
x86_64                randconfig-072-20260715    gcc-14
x86_64                randconfig-073-20260715    gcc-14
x86_64                randconfig-074-20260715    gcc-14
x86_64                randconfig-075-20260715    gcc-14
x86_64                randconfig-076-20260715    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-11.5.0
xtensa                randconfig-001-20260715    gcc-16.1.0
xtensa                randconfig-002-20260715    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

