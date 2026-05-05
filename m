Return-Path: <linux-renesas-soc+bounces-31997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EBqDIZ2+WmT8wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 06:48:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5A4C6939
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 06:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E01A03007B15
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 04:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90E83B38BD;
	Tue,  5 May 2026 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HE1P5Emb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8703A3E6D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 04:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777956479; cv=none; b=UmIx/nqd92VGW0Mo89Wdt8FXGC1Orf55xZtNUiMS6z0HQMPRjDkSTtoDiSsCpLfVc3dAbofFhh1oRZdWCrQ/P2CgPC3CI59zVB4NglJsCwq+I7omM/Fa5GnYmT5t53HkbWmoSL6XmwPuPuKFbYQalaD34H7idRAP45AK1WPIuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777956479; c=relaxed/simple;
	bh=E94+plCDL62cLwrTmRLUvXjvG9IgGc7j+TcO+ZaMwe4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kw8zRNwdRr8C3kfJY72UT+Lb5VemnzOjYBIHlYQFthbuStu0N/R3U9EYADxAeYzlt3PbZGRiarv6JohpEzf7aKPYxUylMKjDxoHIry1hxBbOQ/XnUT24S63zRe0YVasV/xkO8fuE37WtM7eSwOZkMjDW4VAPhbIRSCxGD9jARZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HE1P5Emb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777956478; x=1809492478;
  h=date:from:to:cc:subject:message-id;
  bh=E94+plCDL62cLwrTmRLUvXjvG9IgGc7j+TcO+ZaMwe4=;
  b=HE1P5Embke+Mr7g4MgwocuqfWALq4U1eUprNoX+q2TG7wLJgMmWu1qS/
   Wf8mx5tdv5cchc3+x0fA55/ngwQa547ruEtp3A8P4ZoXVEPOsbBvWlHhE
   x/o3IJOZLAYFSqXbs9okkFgACZ/kVafHFKs15s/WuhwD0g7uBXEtXJ8SW
   xb88+8G/D97oqgktZo/JQppt3Fea7RjQppuh1RER8RfnettqaQSqCEDRV
   USLlct5hUMm6OUjsrqwXMNNq4D5yeJ7f+DPMMQX9zVYM0ToYN88UPAqLb
   bUrRLcuxh5/ketQ/KaXbo7sSl+nPIFZs+aBroPjFPhGLIij/YUrXin/bL
   A==;
X-CSE-ConnectionGUID: slLQAinLTGaCNUbKzxZHNQ==
X-CSE-MsgGUID: C+LzzD+0T9mzuX+b8Y0jzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89514977"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89514977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 21:47:57 -0700
X-CSE-ConnectionGUID: l5dqRQVJRjCMhRx//QlUDg==
X-CSE-MsgGUID: XAyswZ++QB+5WEN27rFjUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="240694445"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2026 21:47:56 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK7hE-000000004GH-2jJO;
	Tue, 05 May 2026 04:47:50 +0000
Date: Tue, 05 May 2026 12:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.2] BUILD SUCCESS
 39abbc2f7a7036af4a59d00e7748961683845c6f
Message-ID: <202605051240.fBw2vhCZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 2CD5A4C6939
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-31997-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.2
branch HEAD: 39abbc2f7a7036af4a59d00e7748961683845c6f  soc: renesas: Add R-Car X5H PRR support

elapsed time: 1098m

configs tested: 351
configs skipped: 68

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260504    gcc-13.4.0
arc                   randconfig-001-20260505    gcc-8.5.0
arc                   randconfig-002-20260504    gcc-13.4.0
arc                   randconfig-002-20260505    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260504    gcc-13.4.0
arm                   randconfig-001-20260505    gcc-8.5.0
arm                   randconfig-002-20260504    gcc-13.4.0
arm                   randconfig-002-20260505    gcc-8.5.0
arm                   randconfig-003-20260504    gcc-13.4.0
arm                   randconfig-003-20260505    gcc-8.5.0
arm                   randconfig-004-20260504    gcc-13.4.0
arm                   randconfig-004-20260505    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260504    gcc-15.2.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                 randconfig-002-20260504    gcc-15.2.0
arm64                 randconfig-002-20260505    gcc-14.3.0
arm64                 randconfig-003-20260504    gcc-15.2.0
arm64                 randconfig-003-20260505    gcc-14.3.0
arm64                 randconfig-004-20260504    gcc-15.2.0
arm64                 randconfig-004-20260505    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260504    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                  randconfig-002-20260504    gcc-15.2.0
csky                  randconfig-002-20260505    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260504    clang-23
hexagon               randconfig-001-20260505    clang-23
hexagon               randconfig-001-20260505    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260504    clang-23
hexagon               randconfig-002-20260505    clang-23
hexagon               randconfig-002-20260505    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260504    gcc-14
i386        buildonly-randconfig-001-20260505    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260504    gcc-14
i386        buildonly-randconfig-002-20260505    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260504    gcc-14
i386        buildonly-randconfig-003-20260505    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260504    gcc-14
i386        buildonly-randconfig-004-20260505    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260504    gcc-14
i386        buildonly-randconfig-005-20260505    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260504    gcc-14
i386        buildonly-randconfig-006-20260505    gcc-14
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260504    clang-20
i386                  randconfig-001-20260505    clang-20
i386                           randconfig-002    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260504    clang-20
i386                  randconfig-002-20260504    gcc-14
i386                  randconfig-002-20260505    clang-20
i386                           randconfig-003    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260504    clang-20
i386                  randconfig-003-20260504    gcc-14
i386                  randconfig-003-20260505    clang-20
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260504    clang-20
i386                  randconfig-004-20260504    gcc-14
i386                  randconfig-004-20260505    clang-20
i386                           randconfig-005    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260504    clang-20
i386                  randconfig-005-20260504    gcc-14
i386                  randconfig-005-20260505    clang-20
i386                           randconfig-006    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260504    clang-20
i386                  randconfig-006-20260505    clang-20
i386                           randconfig-007    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260504    clang-20
i386                  randconfig-007-20260505    clang-20
i386                  randconfig-011-20260504    clang-20
i386                  randconfig-011-20260505    clang-20
i386                  randconfig-011-20260505    gcc-14
i386                  randconfig-012-20260504    clang-20
i386                  randconfig-012-20260505    clang-20
i386                  randconfig-013-20260504    clang-20
i386                  randconfig-013-20260505    clang-20
i386                  randconfig-014-20260504    clang-20
i386                  randconfig-014-20260505    clang-20
i386                  randconfig-015-20260504    clang-20
i386                  randconfig-015-20260505    clang-20
i386                  randconfig-015-20260505    gcc-14
i386                  randconfig-016-20260504    clang-20
i386                  randconfig-016-20260505    clang-20
i386                  randconfig-017-20260504    clang-20
i386                  randconfig-017-20260505    clang-20
i386                  randconfig-017-20260505    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260504    clang-23
loongarch             randconfig-001-20260505    clang-23
loongarch             randconfig-001-20260505    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260504    clang-23
loongarch             randconfig-002-20260505    clang-18
loongarch             randconfig-002-20260505    clang-23
loongarch             randconfig-002-20260505    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                          hp300_defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                           rs90_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-15.2.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-15.2.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260504    clang-23
nios2                 randconfig-001-20260505    clang-18
nios2                 randconfig-001-20260505    clang-23
nios2                 randconfig-001-20260505    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260504    clang-23
nios2                 randconfig-002-20260505    clang-18
nios2                 randconfig-002-20260505    clang-23
nios2                 randconfig-002-20260505    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-14.3.0
parisc                randconfig-001-20260504    gcc-13.4.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                         randconfig-002    gcc-14.3.0
parisc                randconfig-002-20260504    gcc-13.4.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-14.3.0
powerpc               randconfig-001-20260504    gcc-13.4.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc                        randconfig-002    gcc-14.3.0
powerpc               randconfig-002-20260504    gcc-13.4.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
powerpc64                      randconfig-001    gcc-14.3.0
powerpc64             randconfig-001-20260504    gcc-13.4.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64                      randconfig-002    gcc-14.3.0
powerpc64             randconfig-002-20260504    gcc-13.4.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260504    gcc-8.5.0
riscv                 randconfig-001-20260505    gcc-10.5.0
riscv                 randconfig-002-20260504    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260504    gcc-8.5.0
s390                  randconfig-002-20260504    gcc-8.5.0
s390                  randconfig-002-20260505    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260504    gcc-8.5.0
sh                    randconfig-001-20260505    gcc-10.5.0
sh                    randconfig-002-20260504    gcc-8.5.0
sh                    randconfig-002-20260505    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260504    gcc-8.5.0
sparc                 randconfig-001-20260505    gcc-15.2.0
sparc                 randconfig-002-20260504    gcc-8.5.0
sparc                 randconfig-002-20260505    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260504    gcc-8.5.0
sparc64               randconfig-001-20260505    gcc-15.2.0
sparc64               randconfig-002-20260504    gcc-8.5.0
sparc64               randconfig-002-20260505    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260504    gcc-8.5.0
um                    randconfig-001-20260505    gcc-15.2.0
um                    randconfig-002-20260504    gcc-8.5.0
um                    randconfig-002-20260505    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                            allnoconfig    gcc-15.2.0
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260504    gcc-12
x86_64      buildonly-randconfig-001-20260505    clang-20
x86_64      buildonly-randconfig-002-20260504    clang-20
x86_64      buildonly-randconfig-002-20260504    gcc-12
x86_64      buildonly-randconfig-002-20260505    clang-20
x86_64      buildonly-randconfig-003-20260504    clang-20
x86_64      buildonly-randconfig-003-20260504    gcc-12
x86_64      buildonly-randconfig-003-20260505    clang-20
x86_64      buildonly-randconfig-004-20260504    gcc-12
x86_64      buildonly-randconfig-004-20260504    gcc-14
x86_64      buildonly-randconfig-004-20260505    clang-20
x86_64      buildonly-randconfig-005-20260504    clang-20
x86_64      buildonly-randconfig-005-20260504    gcc-12
x86_64      buildonly-randconfig-005-20260505    clang-20
x86_64      buildonly-randconfig-006-20260504    gcc-12
x86_64      buildonly-randconfig-006-20260504    gcc-14
x86_64      buildonly-randconfig-006-20260505    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260504    gcc-14
x86_64                randconfig-001-20260505    clang-20
x86_64                randconfig-002-20260504    gcc-14
x86_64                randconfig-002-20260505    clang-20
x86_64                randconfig-002-20260505    gcc-14
x86_64                randconfig-003-20260504    gcc-14
x86_64                randconfig-003-20260505    clang-20
x86_64                randconfig-004-20260504    gcc-14
x86_64                randconfig-004-20260505    clang-20
x86_64                randconfig-005-20260504    gcc-14
x86_64                randconfig-005-20260505    clang-20
x86_64                randconfig-006-20260504    gcc-14
x86_64                randconfig-006-20260505    clang-20
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260504    gcc-14
x86_64                randconfig-011-20260505    clang-20
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260504    gcc-14
x86_64                randconfig-012-20260505    clang-20
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260504    gcc-14
x86_64                randconfig-013-20260505    clang-20
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260504    gcc-14
x86_64                randconfig-014-20260505    clang-20
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260504    gcc-14
x86_64                randconfig-015-20260505    clang-20
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260504    gcc-14
x86_64                randconfig-016-20260505    clang-20
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260504    clang-20
x86_64                randconfig-071-20260505    clang-20
x86_64                randconfig-071-20260505    gcc-14
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260504    clang-20
x86_64                randconfig-072-20260505    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260504    clang-20
x86_64                randconfig-073-20260505    clang-20
x86_64                randconfig-073-20260505    gcc-14
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260504    clang-20
x86_64                randconfig-074-20260505    clang-20
x86_64                randconfig-074-20260505    gcc-14
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260504    clang-20
x86_64                randconfig-075-20260505    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260504    clang-20
x86_64                randconfig-076-20260505    clang-20
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
xtensa                           allyesconfig    gcc-11.5.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260504    gcc-8.5.0
xtensa                randconfig-001-20260505    gcc-15.2.0
xtensa                randconfig-002-20260504    gcc-8.5.0
xtensa                randconfig-002-20260505    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

