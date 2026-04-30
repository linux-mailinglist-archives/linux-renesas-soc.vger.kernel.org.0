Return-Path: <linux-renesas-soc+bounces-31771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LtUN6Hk8ml8vQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 07:12:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D349D8C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 07:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A99E33003E90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 05:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2EF273F9;
	Thu, 30 Apr 2026 05:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W59R/y3S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785530E85C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777525607; cv=none; b=OxW/6tzWquanxcQ5vpz+b9J9YjZFhLmg5FNUAlk97pLT1JW7Hszo9xMFcClh4vNilTkrIIAOFqaO5Nng5uBLS2qnhHDR0HXZbwMG28falVDSn7d9EURBhYsOF8vlJp1Fa80/7OVLzZoD6YLSy+3nkQhUUhWfuDdS5+mp0bHo9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777525607; c=relaxed/simple;
	bh=qXqAnA6WBA1HOJBMZ23jz8qjT+mP8K06DkTwzES5Vg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ag794qdE7d555JteF6NFdgSJyNS7eps+TOcIVQa5Vnss4hA9KGN1e7hgXIUIbp/zckF8mcoo0OjNzo7QxtpC7Mw4mf0IVjHxqhkHBWT0b8AEBJIjQMY7oLK276/9D9iwBMelORor0GtSU6+94GkWjfx7MgHJ2UBDvu1bUxgBFWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W59R/y3S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777525605; x=1809061605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXqAnA6WBA1HOJBMZ23jz8qjT+mP8K06DkTwzES5Vg8=;
  b=W59R/y3SSYC0zlYomSRWr18YusVF2i2ixVXRmCe2yEmdOCGerEbGVJ4N
   mGbnCxbVVPTGKbi52NBzq73ubc9JhLv9jGoEho/XCFk7uFca7yyhiVcUP
   fwNMSeMPTt+sjzTVMlmGrqbG+m/G5wEDBRC9so/CoQtX8C8iwSYfAqW2h
   p/hfNPtast2WHxL8lXueQ3xQcYct9LYCWz+p81mUzaSGGS6jfFsaVZtQD
   UAAvd0LVR3+Ivaaz14QvbK17EHE28OZ2Xz1XCRIAG8uT7ncajXzqik8Tj
   WRqzN9i+XvGMc2zZ/M5mbgYL2cESxrffGseHHvbO5ZKOzuXbOXfwuheN3
   A==;
X-CSE-ConnectionGUID: layVT1BGSPCjAxHgWjCNGA==
X-CSE-MsgGUID: 6UCAmF0+RCeC10uem31r+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78359760"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78359760"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 22:06:45 -0700
X-CSE-ConnectionGUID: GtNt7It9T5CwJNoaUVOL8w==
X-CSE-MsgGUID: SnS5Vw9aQ4S5H1C6EZ1DXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="229868051"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2026 22:06:43 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIJbk-00000000By8-2S4i;
	Thu, 30 Apr 2026 05:06:40 +0000
Date: Thu, 30 Apr 2026 13:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 =?us-ascii?Q?[geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-md?=
 =?us-ascii?Q?lc-remapping-v1-rebased]?= BUILD SUCCESS
 5c4deefabafb7d5c158f1ce2b74ef816adc6fc91
Message-ID: <202604301330.Eta1JUIE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Rspamd-Queue-Id: 464D349D8C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31771-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v1-rebased
branch HEAD: 5c4deefabafb7d5c158f1ce2b74ef816adc6fc91  arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties

elapsed time: 2101m

configs tested: 174
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260430    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260430    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260430    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260430    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260430    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260430    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260430    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260430    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260430    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260430    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260430    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260430    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260430    gcc-14.3.0
hexagon               randconfig-002-20260430    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260430    gcc-14
i386        buildonly-randconfig-002-20260430    gcc-14
i386        buildonly-randconfig-003-20260430    gcc-14
i386        buildonly-randconfig-004-20260430    gcc-14
i386        buildonly-randconfig-005-20260430    gcc-14
i386        buildonly-randconfig-006-20260430    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260430    clang-20
i386                  randconfig-002-20260430    clang-20
i386                  randconfig-003-20260430    clang-20
i386                  randconfig-004-20260430    clang-20
i386                  randconfig-005-20260430    clang-20
i386                  randconfig-006-20260430    clang-20
i386                  randconfig-007-20260430    clang-20
i386                  randconfig-011-20260430    clang-20
i386                  randconfig-012-20260430    clang-20
i386                  randconfig-013-20260430    clang-20
i386                  randconfig-014-20260430    clang-20
i386                  randconfig-015-20260430    clang-20
i386                  randconfig-016-20260430    clang-20
i386                  randconfig-017-20260430    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260430    gcc-14.3.0
loongarch             randconfig-002-20260430    gcc-14.3.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           xway_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260430    gcc-14.3.0
nios2                 randconfig-002-20260430    gcc-14.3.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260430    gcc-13.4.0
parisc                randconfig-002-20260430    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      pasemi_defconfig    clang-23
powerpc               randconfig-001-20260430    gcc-13.4.0
powerpc               randconfig-002-20260430    gcc-13.4.0
powerpc64             randconfig-001-20260430    gcc-13.4.0
powerpc64             randconfig-002-20260430    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260430    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260430    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260430    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260430    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260430    clang-23
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260430    clang-23
sh                           se7206_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260430    gcc-14
x86_64      buildonly-randconfig-002-20260430    gcc-14
x86_64      buildonly-randconfig-003-20260430    gcc-14
x86_64      buildonly-randconfig-004-20260430    gcc-14
x86_64      buildonly-randconfig-005-20260430    gcc-14
x86_64      buildonly-randconfig-006-20260430    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20260430    clang-20
x86_64                randconfig-012-20260430    clang-20
x86_64                randconfig-013-20260430    clang-20
x86_64                randconfig-014-20260430    clang-20
x86_64                randconfig-015-20260430    clang-20
x86_64                randconfig-016-20260430    clang-20
x86_64                randconfig-071-20260430    gcc-14
x86_64                randconfig-072-20260430    gcc-14
x86_64                randconfig-073-20260430    gcc-14
x86_64                randconfig-074-20260430    gcc-14
x86_64                randconfig-075-20260430    gcc-14
x86_64                randconfig-076-20260430    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

