Return-Path: <linux-renesas-soc+bounces-33247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDZBD4byF2q5WAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:45:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC55C5EDE09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0101F3006037
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2837F34D926;
	Thu, 28 May 2026 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH0YqHj0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DA0329367
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954305; cv=none; b=PSbLuyeMfaX4QxzTdNCJ0D0A5ij55kPlJaHOd7QBuQAkoeFL9v4vp9Ue4YEEWQZgOYulprNfkCveqzdEksSzFePnBpw7yBFUj8ok6t2ouL4Uo/aecFrOwr9ydHQUQOBsHaKbwbf6eVG4bhK5ZM1tLA5QOQ4M/ytPOLai+2MpM7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954305; c=relaxed/simple;
	bh=aXZX5hcQv3PZlpewTdO6Dwziv2lUwQEtJ9eZE8g4MNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GMCylwPebwrfdz5w8jpPpsgg/sm+IX+TazqbobF1tKpfawazw+4YfYOYPH6SOlfjYcpMBPvVW/Qi/2WsHD1i7XLT1e4Ib9+tZa4oIe48M5DfQ/CUvlclwaxKnMrFiqJPTEg365WyTXszElddY5EuBq4Hm448IengPbkHegLfbCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH0YqHj0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779954303; x=1811490303;
  h=date:from:to:cc:subject:message-id;
  bh=aXZX5hcQv3PZlpewTdO6Dwziv2lUwQEtJ9eZE8g4MNM=;
  b=NH0YqHj0TzGKFmKMAsywrvjFFXkplb15yZEwUbh2iB1lNDfO1u9AUutZ
   8XXSdNp7O0s4x66TTki0/LhtQ4+6ium0DKo7yYasd/QskkqZvrOg4Gkap
   bLtkmjrU+3Y0yWkxmrzIhnLFlUj5sVRxb0ERD9wtqZywn1PRmsmxNiVdY
   omDh6RRI4xsDt8nuaibqTYXnd8jrl4qhyVtUJRYUwwQetVfUjJmwYYn5e
   PgwDN7nbf6UcxAN5niSA3DQhM4rlIM1QruaCnYTV1THK3ryMjKkNHForw
   coBhR328GGmul33yT4WP83RssiGcm0ayKn98QptiBIhNfdVcQTt9sRDuR
   A==;
X-CSE-ConnectionGUID: KJnUn07mR+6Uos4sLOqdzw==
X-CSE-MsgGUID: wd+g3ahwTOiQYyTGGvkJ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91101626"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91101626"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 00:45:03 -0700
X-CSE-ConnectionGUID: RIwLCEmTR1iQjP9l6cFJ1Q==
X-CSE-MsgGUID: iEfVsgpZR5O16wloVtHJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266376291"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 00:45:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSVQJ-000000005h6-1pEU;
	Thu, 28 May 2026 07:44:59 +0000
Date: Thu, 28 May 2026 15:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.2] BUILD SUCCESS
 eaad5f2cb0e3bbbd62c08543fb93ebcfe87c1051
Message-ID: <202605281540.Zmx6Dvj5-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33247-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EC55C5EDE09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.2
branch HEAD: eaad5f2cb0e3bbbd62c08543fb93ebcfe87c1051  soc: renesas: Identify R-Car R8A779MD M3Le SoC

elapsed time: 3820m

configs tested: 180
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260526    gcc-8.5.0
arc                   randconfig-002-20260526    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260526    clang-23
arm                   randconfig-002-20260526    gcc-8.5.0
arm                   randconfig-003-20260526    clang-23
arm                   randconfig-004-20260526    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-8.5.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260526    gcc-8.5.0
arm64                 randconfig-003-20260526    gcc-13.4.0
arm64                 randconfig-004-20260526    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260526    gcc-15.2.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260526    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260526    clang-20
hexagon               randconfig-002-20260526    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260526    gcc-13
i386        buildonly-randconfig-002-20260526    clang-20
i386        buildonly-randconfig-003-20260526    clang-20
i386        buildonly-randconfig-004-20260526    clang-20
i386        buildonly-randconfig-005-20260526    gcc-14
i386        buildonly-randconfig-006-20260526    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260526    gcc-14
i386                  randconfig-002-20260526    gcc-13
i386                  randconfig-003-20260526    gcc-14
i386                  randconfig-004-20260526    clang-20
i386                  randconfig-005-20260526    clang-20
i386                  randconfig-006-20260526    clang-20
i386                  randconfig-007-20260526    clang-20
i386                  randconfig-011-20260526    gcc-14
i386                  randconfig-012-20260526    gcc-14
i386                  randconfig-015-20260526    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260526    gcc-15.2.0
loongarch             randconfig-002-20260526    clang-20
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
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260526    gcc-11.5.0
nios2                 randconfig-002-20260526    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260526    gcc-15.2.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260526    gcc-14.3.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260526    clang-23
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260526    clang-19
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260526    gcc-15.2.0
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260526    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260526    clang-23
riscv                 randconfig-002-20260526    gcc-8.5.0
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260526    clang-23
s390                  randconfig-002-20260526    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260526    gcc-10.5.0
sh                    randconfig-002-20260526    gcc-15.2.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260526    gcc-15.2.0
sparc                 randconfig-002-20260526    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260526    gcc-14.3.0
sparc64               randconfig-002-20260526    clang-20
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260526    clang-23
um                    randconfig-002-20260526    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260526    clang-20
x86_64      buildonly-randconfig-002-20260526    gcc-14
x86_64      buildonly-randconfig-003-20260526    gcc-14
x86_64      buildonly-randconfig-004-20260526    gcc-14
x86_64      buildonly-randconfig-005-20260526    clang-20
x86_64      buildonly-randconfig-006-20260526    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260526    gcc-14
x86_64                randconfig-002-20260526    clang-20
x86_64                randconfig-003-20260526    gcc-14
x86_64                randconfig-004-20260526    clang-20
x86_64                randconfig-005-20260526    gcc-14
x86_64                randconfig-006-20260526    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260526    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260526    gcc-14
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260526    clang-20
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260526    clang-20
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260526    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260526    clang-20
x86_64                randconfig-071-20260526    gcc-14
x86_64                randconfig-072-20260526    clang-20
x86_64                randconfig-073-20260526    clang-20
x86_64                randconfig-074-20260526    gcc-14
x86_64                randconfig-075-20260526    clang-20
x86_64                randconfig-076-20260526    gcc-13
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260526    gcc-8.5.0
xtensa                randconfig-002-20260526    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

