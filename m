Return-Path: <linux-renesas-soc+bounces-34369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id noR5EQ1fOmqD7QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 12:25:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C63EE6B6417
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 12:25:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZBB0ILSU;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7065300C244
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F5D36C0AB;
	Tue, 23 Jun 2026 10:19:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F273375AB2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:19:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209993; cv=none; b=lmVeH+qJJzgjLNY8CWdDES0drYTzt03fFyVdqVOnA/Dwo7chggeaiMhneS7jIKWFSdalJDKbG9kpK4ia8pv8Byh+HOOUtQkCKuriarBLy3MPPNFXxT3F4SRkp9SGIKUyTO+ZC3m06/NSbqW85qc6hE/89WEAVa2SBr4J0CUmqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209993; c=relaxed/simple;
	bh=FHBG7YqURgbEmfslD4JgDwie6muObyiRgC00f4Lpcdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L6ughbLfY3KRblJbaU+LRhSTFN59yR/YwmVgKGEZ/zvUOnyKaE6Lk/UGxzzBhnbdhkfM8KsTn0zq+FvQgfboNTHD6pOvYHIoaIPwRTSzaGjhkO5rb6OLlBIbnpZAlC7E2HNzzF6dgaoLzp9aWNVRM2zXR906jY3NxS8XCrDn5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBB0ILSU; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782209992; x=1813745992;
  h=date:from:to:cc:subject:message-id;
  bh=FHBG7YqURgbEmfslD4JgDwie6muObyiRgC00f4Lpcdw=;
  b=ZBB0ILSUD5vHOwjdzwsFBEKy5itdfCQo3/Fb0YYMtxTCB9GxwM4QvSpI
   4r0n2Um8GYo2DyqAdshgB0e5J4XR37rnjFAVXFHjcL1yD0J2mr1bCRRYe
   psAWuGYuQIGOUmBvU1ZYotqu7gU/oJcOGEv1XomRQ6Aoil9dQek//y2B0
   cBfKKoHfw7yjpcqaFu+2MB+Mmw+MuQEvo2V1nMSCTnWU/Kr3TzF9QWY5W
   U81UpBNrw6KMBBRrrMZosVDRDcTOw3jzrThpH59WBdDSo6nQy54RKBzS3
   Hiej0+Vx6WtBHJKTz2SBg6a5X+97ZoM3Ij32eRFEo85HExOvB8ZdtJeZv
   A==;
X-CSE-ConnectionGUID: zukLvkOCTnyiY+Hekj3FjA==
X-CSE-MsgGUID: YY8xF8CsTJOW4ocewXr9Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83137036"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="83137036"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:19:51 -0700
X-CSE-ConnectionGUID: nWiQzgh7QCKfqmVe3wU3uw==
X-CSE-MsgGUID: PHqqmrP4RSCtJMCTElhZJg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2026 03:19:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbyEN-000000002QP-3Pvz;
	Tue, 23 Jun 2026 10:19:47 +0000
Date: Tue, 23 Jun 2026 18:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v7.3] BUILD SUCCESS
 61021a23a33f143cd147160fbe585ded13626888
Message-ID: <202606231802.PcdHPouL-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34369-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C63EE6B6417

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.3
branch HEAD: 61021a23a33f143cd147160fbe585ded13626888  clk: renesas: r9a08g046: Add USB2.0 clock and reset entries

elapsed time: 873m

configs tested: 219
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260623    clang-23
arc                   randconfig-002-20260623    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260623    clang-23
arm                   randconfig-002-20260623    clang-23
arm                   randconfig-003-20260623    clang-23
arm                   randconfig-004-20260623    clang-23
arm                           spitz_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260623    clang-23
arm64                 randconfig-001-20260623    gcc-14.3.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260623    clang-23
arm64                 randconfig-002-20260623    gcc-14.3.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260623    clang-23
arm64                 randconfig-003-20260623    gcc-14.3.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260623    clang-23
arm64                 randconfig-004-20260623    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260623    clang-23
csky                  randconfig-001-20260623    gcc-14.3.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260623    clang-23
csky                  randconfig-002-20260623    gcc-14.3.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260623    gcc-11.5.0
hexagon               randconfig-001-20260623    gcc-8.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260623    gcc-11.5.0
hexagon               randconfig-002-20260623    gcc-8.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260623    gcc-14
i386        buildonly-randconfig-002-20260623    gcc-14
i386        buildonly-randconfig-003-20260623    gcc-14
i386        buildonly-randconfig-004-20260623    gcc-14
i386        buildonly-randconfig-005-20260623    gcc-14
i386        buildonly-randconfig-006-20260623    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260623    clang-22
i386                  randconfig-002-20260623    clang-22
i386                  randconfig-003-20260623    clang-22
i386                  randconfig-004-20260623    clang-22
i386                  randconfig-005-20260623    clang-22
i386                  randconfig-006-20260623    clang-22
i386                  randconfig-007-20260623    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260623    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260623    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260623    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260623    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260623    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260623    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260623    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260623    gcc-11.5.0
loongarch             randconfig-001-20260623    gcc-8.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260623    gcc-11.5.0
loongarch             randconfig-002-20260623    gcc-8.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                       m5249evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260623    gcc-11.5.0
nios2                 randconfig-001-20260623    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260623    gcc-11.5.0
nios2                 randconfig-002-20260623    gcc-8.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-11.5.0
parisc                randconfig-001-20260623    gcc-11.5.0
parisc                         randconfig-002    gcc-11.5.0
parisc                randconfig-002-20260623    gcc-11.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                      ppc44x_defconfig    clang-17
powerpc                        randconfig-001    gcc-11.5.0
powerpc               randconfig-001-20260623    gcc-11.5.0
powerpc                        randconfig-002    gcc-11.5.0
powerpc               randconfig-002-20260623    gcc-11.5.0
powerpc64                      randconfig-001    gcc-11.5.0
powerpc64             randconfig-001-20260623    gcc-11.5.0
powerpc64                      randconfig-002    gcc-11.5.0
powerpc64             randconfig-002-20260623    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260623    gcc-8.5.0
riscv                 randconfig-002-20260623    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260623    gcc-8.5.0
s390                  randconfig-002-20260623    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260623    gcc-8.5.0
sh                    randconfig-002-20260623    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260623    gcc-8.5.0
sparc                 randconfig-002-20260623    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260623    gcc-8.5.0
sparc64               randconfig-002-20260623    gcc-8.5.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260623    gcc-8.5.0
um                    randconfig-002-20260623    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260623    clang-22
x86_64      buildonly-randconfig-002-20260623    clang-22
x86_64      buildonly-randconfig-003-20260623    clang-22
x86_64      buildonly-randconfig-004-20260623    clang-22
x86_64      buildonly-randconfig-005-20260623    clang-22
x86_64      buildonly-randconfig-006-20260623    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260623    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260623    gcc-14
x86_64                         randconfig-003    gcc-14
x86_64                randconfig-003-20260623    gcc-14
x86_64                         randconfig-004    gcc-14
x86_64                randconfig-004-20260623    gcc-14
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260623    gcc-14
x86_64                         randconfig-006    gcc-14
x86_64                randconfig-006-20260623    gcc-14
x86_64                randconfig-011-20260623    gcc-14
x86_64                randconfig-012-20260623    gcc-14
x86_64                randconfig-013-20260623    gcc-14
x86_64                randconfig-014-20260623    gcc-14
x86_64                randconfig-015-20260623    gcc-14
x86_64                randconfig-016-20260623    gcc-14
x86_64                randconfig-071-20260623    gcc-14
x86_64                randconfig-072-20260623    gcc-14
x86_64                randconfig-073-20260623    gcc-14
x86_64                randconfig-074-20260623    gcc-14
x86_64                randconfig-075-20260623    gcc-14
x86_64                randconfig-076-20260623    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260623    gcc-8.5.0
xtensa                randconfig-002-20260623    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

