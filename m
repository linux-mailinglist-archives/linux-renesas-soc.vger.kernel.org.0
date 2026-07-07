Return-Path: <linux-renesas-soc+bounces-34784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3p1+EpdeTGq+jgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 04:04:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F33716B87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 04:04:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=SfvRdXTM;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E8143016D3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 02:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91821E5702;
	Tue,  7 Jul 2026 02:04:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9E17BCA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 02:04:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783389843; cv=none; b=evcfzN9pSq9DyRCuNNEiyoTBk2mbu2fUI30kricoGd21Fn3sLZQwzBM6UN3LeTU1x1efib9Wc//mAzmG02UfagnyeuGpygI4SKiENnAz87hrrN5heRsZVFFav/UCc0o8gCax7MYkJ5tNUHK9nkVAgw9BleiYpKVMAbyIq1FuXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783389843; c=relaxed/simple;
	bh=HKITScD+5CgwFhljn/iL4l4L5N2YyG0zk+4RQ/wX1zk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UTATJDyeXrI7+P+cAInvneP5sHPOFZFrKPKno8LrQaAU0QWxRcjcxlQdxxzSKKaaQFFQGKXYMds9nJdcXaI/FQg0kZFw0GLS1xhvMedni6u2RlbEBa/RkzV+27w0o3tv6u54O6C9WOHg8OP0DxCo9o7mkBGmPfcX7TZKiWB/fns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfvRdXTM; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783389840; x=1814925840;
  h=date:from:to:cc:subject:message-id;
  bh=HKITScD+5CgwFhljn/iL4l4L5N2YyG0zk+4RQ/wX1zk=;
  b=SfvRdXTMEmwdXdhAdHluoHjPHMEhkrH6qTIt4LtGPZajMVGJ6+BiUxAl
   EIVF2WHkaZreQXAvs92kyIhupZaghZmObD2l7C9zcdf9e3JR8U+MU6TkB
   mgveVwfYjMT82WZxZ+j9wBqKUvphevH7qql9FBjbK47e5GF9KnqKsDtKR
   wZI5yc5eEeFJr8H1eKWnNjfNSoO32xBnrdGAoNBkKAZxVBALAagkmRwd1
   v8rxf/fCUNthPyjoKP2c6IsIgvXFYcRoGkCJoaG5ak44pcIX7v3km0cHX
   B7Qez70sULsZrP7zT0uefjNZ4Rvd+LDfk1CIJa0qapPjYpaX0YTfcPW76
   g==;
X-CSE-ConnectionGUID: CuFJHUfkT/+USTwNLqHl/w==
X-CSE-MsgGUID: HO1qqjkTROC1kEGCOaqpPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="94636421"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="94636421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 19:04:00 -0700
X-CSE-ConnectionGUID: pihUxXYfRQ+hEQYyhA3O9A==
X-CSE-MsgGUID: cthMirlqT0iPyeDFnMx6eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="249871605"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jul 2026 19:03:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgvA4-00000000Ewd-2VC6;
	Tue, 07 Jul 2026 02:03:50 +0000
Date: Tue, 07 Jul 2026 10:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 282a9e60e772f2b3abf3d3fd0c201b89b9386a9a
Message-ID: <202607071028.S9xIpmRB-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34784-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,intel.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92F33716B87

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 282a9e60e772f2b3abf3d3fd0c201b89b9386a9a  riscv: rzfive: defconfig: Refresh for v7.2-rc1

elapsed time: 996m

configs tested: 274
configs skipped: 13

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
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260706    gcc-15.2.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260706    gcc-15.2.0
arc                   randconfig-002-20260706    gcc-9.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260706    clang-23
arm                   randconfig-001-20260706    gcc-15.2.0
arm                            randconfig-002    gcc-15.2.0
arm                   randconfig-002-20260706    gcc-15.2.0
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260706    gcc-13.4.0
arm                   randconfig-003-20260706    gcc-15.2.0
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260706    clang-23
arm                   randconfig-004-20260706    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260706    clang-17
arm64                 randconfig-001-20260706    gcc-11.5.0
arm64                 randconfig-002-20260706    clang-17
arm64                 randconfig-002-20260706    gcc-11.5.0
arm64                 randconfig-003-20260706    gcc-11.5.0
arm64                 randconfig-003-20260706    gcc-15.2.0
arm64                 randconfig-004-20260706    clang-17
arm64                 randconfig-004-20260706    gcc-11.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260706    gcc-11.5.0
csky                  randconfig-001-20260706    gcc-9.5.0
csky                  randconfig-002-20260706    gcc-11.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260706    clang-17
hexagon               randconfig-001-20260706    gcc-16.1.0
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260706    clang-23
hexagon               randconfig-002-20260706    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260706    gcc-12
i386        buildonly-randconfig-002-20260706    gcc-12
i386        buildonly-randconfig-003-20260706    gcc-12
i386        buildonly-randconfig-004-20260706    gcc-12
i386        buildonly-randconfig-005-20260706    gcc-12
i386        buildonly-randconfig-006-20260706    gcc-12
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260706    clang-22
i386                  randconfig-001-20260706    gcc-14
i386                  randconfig-002-20260706    gcc-14
i386                  randconfig-003-20260706    gcc-14
i386                  randconfig-004-20260706    gcc-14
i386                  randconfig-005-20260706    clang-22
i386                  randconfig-005-20260706    gcc-14
i386                  randconfig-006-20260706    gcc-14
i386                  randconfig-007-20260706    clang-22
i386                  randconfig-007-20260706    gcc-14
i386                  randconfig-011-20260706    clang-22
i386                  randconfig-012-20260706    clang-22
i386                  randconfig-013-20260706    clang-22
i386                  randconfig-014-20260706    clang-22
i386                  randconfig-015-20260706    clang-22
i386                  randconfig-016-20260706    clang-22
i386                  randconfig-017-20260706    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260706    gcc-16.1.0
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260706    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                       rbtx49xx_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260706    gcc-11.5.0
nios2                 randconfig-001-20260706    gcc-16.1.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260706    gcc-11.5.0
nios2                 randconfig-002-20260706    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260706    gcc-10.5.0
parisc                randconfig-001-20260706    gcc-14.3.0
parisc                         randconfig-002    gcc-12.5.0
parisc                randconfig-002-20260706    gcc-10.5.0
parisc                randconfig-002-20260706    gcc-16.1.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260706    gcc-10.5.0
powerpc               randconfig-001-20260706    gcc-9.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260706    gcc-10.5.0
powerpc               randconfig-002-20260706    gcc-15.2.0
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260706    gcc-10.5.0
powerpc64             randconfig-001-20260706    gcc-11.5.0
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260706    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260706    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260706    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260706    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260706    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260706    clang-23
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260706    clang-23
sh                           se7206_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260706    gcc-12.5.0
sparc                 randconfig-001-20260706    gcc-14.3.0
sparc                 randconfig-002-20260706    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260706    gcc-14.3.0
sparc64               randconfig-001-20260706    gcc-16.1.0
sparc64               randconfig-002-20260706    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260706    gcc-14
um                    randconfig-001-20260706    gcc-14.3.0
um                    randconfig-002-20260706    gcc-14
um                    randconfig-002-20260706    gcc-14.3.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260706    gcc-14
x86_64      buildonly-randconfig-002-20260706    gcc-14
x86_64      buildonly-randconfig-003-20260706    gcc-14
x86_64      buildonly-randconfig-004-20260706    gcc-14
x86_64      buildonly-randconfig-005-20260706    gcc-14
x86_64      buildonly-randconfig-006-20260706    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260706    clang-22
x86_64                randconfig-001-20260706    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260706    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260706    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260706    clang-22
x86_64                randconfig-004-20260706    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260706    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260706    clang-22
x86_64                randconfig-006-20260706    gcc-13
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260706    clang-22
x86_64                randconfig-011-20260706    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260706    clang-22
x86_64                randconfig-012-20260706    gcc-14
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260706    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260706    gcc-12
x86_64                randconfig-014-20260706    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260706    gcc-14
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260706    gcc-12
x86_64                randconfig-016-20260706    gcc-14
x86_64                randconfig-071-20260706    gcc-14
x86_64                randconfig-072-20260706    gcc-14
x86_64                randconfig-073-20260706    gcc-14
x86_64                randconfig-074-20260706    gcc-14
x86_64                randconfig-075-20260706    gcc-14
x86_64                randconfig-076-20260706    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260706    gcc-14.3.0
xtensa                randconfig-001-20260706    gcc-16.1.0
xtensa                randconfig-002-20260706    gcc-14.3.0
xtensa                randconfig-002-20260706    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

