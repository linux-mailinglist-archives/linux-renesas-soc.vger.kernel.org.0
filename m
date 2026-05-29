Return-Path: <linux-renesas-soc+bounces-33318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEPjL7MbGWrwqQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 06:53:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020E5FD2BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 06:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 158743009507
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 04:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DD538B154;
	Fri, 29 May 2026 04:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBrmVKbf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8EC377EA9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780030126; cv=none; b=usVqonmcZFsZbA3a8W2Qla70g7vwUrLvx+9oAll4p90Y8X5saPQRlppQ/kIfXV9kfjLu6+Z3mS3chr5azmjkgR6gQdZVEriK3tBRWnsLMvZXx7ESHCW7ocXNMbgR6usBm/EXM98YTPsrs0aAptlYHWRdgFkxfaMwfrRsvCgBteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780030126; c=relaxed/simple;
	bh=grxkH9BJP5YmdDTyAcVkGo+svKJiY+bqOhQXcjmWuek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mfn8sqeDupJL459hfYZyS7yk/rtZ8Dio7pWkaJuI5qjtvkpvJv1lvPxhzrDZHsRXvAunBPNkMi88w6gEs6y3I9Bogsv/yl5MEJwXoabTFHygYjxL7xF3NhLRCubJLvo9dC9pCJU5igp0E5JSDqWthNjcgX6jp5xL/KdLk1MhK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBrmVKbf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780030122; x=1811566122;
  h=date:from:to:cc:subject:message-id;
  bh=grxkH9BJP5YmdDTyAcVkGo+svKJiY+bqOhQXcjmWuek=;
  b=kBrmVKbfVmSIhGRDHHn7G/4DJh28oVx2VJoc3pcoM7d5OMVa4eXKzrek
   dhF5UVGAzFeiSfYkxxMirZQKciVhrjrTmBUxcLRPG9GGm2ZCodrgqui8Y
   GW6Qsj6cSH5SmYwIBTfhbDcThNOrK3aGJyfKHIS88ZXJJ0NTnZPRAsrGU
   OnXZ/YSUEy1t5To7nWCvfGJpx0Rq+WVd+IieDIDu+qoWWPkUw2tAikaFh
   V9CGJh+SEUf/T26PthyzgVbKAxWgLBqSirVVUoJwuBnu3XBqQUjHX1NpU
   uxVN/G0QitpLUcKyyng0ugmNGZsPhYT8WNC8PkCVUXmRYKB0YqiBynSqZ
   g==;
X-CSE-ConnectionGUID: BSBJumbFQ4KjzWUuUYa/MQ==
X-CSE-MsgGUID: 3o7Drkp9ThinmaOxYFCnzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92355320"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="92355320"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 21:48:42 -0700
X-CSE-ConnectionGUID: nFQ7HObjRXaFm07UNgvseA==
X-CSE-MsgGUID: lwxUy4q2QY6DgDnE1Vp1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242850175"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2026 21:48:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSp9B-000000006mI-3GaM;
	Fri, 29 May 2026 04:48:37 +0000
Date: Fri, 29 May 2026 12:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2-wip]
 BUILD SUCCESS 2ae96ff0d766272a299be17d71e4bf702682440a
Message-ID: <202605291223.RDP7Ffv4-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33318-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 2020E5FD2BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2-wip
branch HEAD: 2ae96ff0d766272a299be17d71e4bf702682440a  arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties

elapsed time: 3642m

configs tested: 277
configs skipped: 8

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
arc                   randconfig-001-20260529    clang-23
arc                   randconfig-002-20260529    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20260529    clang-23
arm                   randconfig-002-20260529    clang-23
arm                   randconfig-003-20260529    clang-23
arm                   randconfig-004-20260529    clang-23
arm                           stm32_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260528    clang-23
arm64                 randconfig-001-20260529    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260528    gcc-15.2.0
arm64                 randconfig-002-20260529    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260528    gcc-11.5.0
arm64                 randconfig-003-20260529    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260528    clang-23
arm64                 randconfig-004-20260529    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260528    gcc-15.2.0
csky                  randconfig-001-20260529    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260528    gcc-13.4.0
csky                  randconfig-002-20260529    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260527    clang-23
hexagon               randconfig-001-20260529    gcc-8.5.0
hexagon               randconfig-002-20260527    clang-23
hexagon               randconfig-002-20260529    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260528    clang-20
i386        buildonly-randconfig-001-20260529    gcc-12
i386        buildonly-randconfig-002-20260528    clang-20
i386        buildonly-randconfig-002-20260529    gcc-12
i386        buildonly-randconfig-003-20260528    clang-20
i386        buildonly-randconfig-003-20260529    gcc-12
i386        buildonly-randconfig-004-20260528    clang-20
i386        buildonly-randconfig-004-20260529    gcc-12
i386        buildonly-randconfig-005-20260528    clang-20
i386        buildonly-randconfig-005-20260529    gcc-12
i386        buildonly-randconfig-006-20260528    gcc-14
i386        buildonly-randconfig-006-20260529    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20260528    gcc-14
i386                  randconfig-001-20260529    gcc-14
i386                  randconfig-002-20260528    clang-20
i386                  randconfig-002-20260529    gcc-14
i386                  randconfig-003-20260528    clang-20
i386                  randconfig-003-20260529    gcc-14
i386                  randconfig-004-20260528    gcc-14
i386                  randconfig-004-20260529    gcc-14
i386                  randconfig-005-20260528    clang-20
i386                  randconfig-005-20260529    gcc-14
i386                  randconfig-006-20260528    clang-20
i386                  randconfig-006-20260529    gcc-14
i386                  randconfig-007-20260528    clang-20
i386                  randconfig-007-20260529    gcc-14
i386                  randconfig-011-20260528    gcc-12
i386                  randconfig-011-20260529    gcc-14
i386                  randconfig-012-20260528    gcc-14
i386                  randconfig-012-20260529    gcc-14
i386                  randconfig-013-20260528    gcc-14
i386                  randconfig-013-20260529    gcc-14
i386                  randconfig-014-20260528    gcc-14
i386                  randconfig-014-20260529    gcc-14
i386                  randconfig-015-20260528    clang-20
i386                  randconfig-015-20260529    gcc-14
i386                  randconfig-016-20260528    gcc-14
i386                  randconfig-016-20260529    gcc-14
i386                  randconfig-017-20260528    gcc-14
i386                  randconfig-017-20260529    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260527    clang-19
loongarch             randconfig-001-20260529    gcc-8.5.0
loongarch             randconfig-002-20260527    gcc-13.4.0
loongarch             randconfig-002-20260529    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260527    gcc-11.5.0
nios2                 randconfig-001-20260529    gcc-8.5.0
nios2                 randconfig-002-20260527    gcc-10.5.0
nios2                 randconfig-002-20260529    gcc-8.5.0
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
parisc                randconfig-001-20260528    gcc-8.5.0
parisc                randconfig-001-20260529    clang-19
parisc                randconfig-002-20260528    gcc-8.5.0
parisc                randconfig-002-20260529    clang-19
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260528    clang-23
powerpc               randconfig-001-20260529    clang-19
powerpc               randconfig-002-20260528    gcc-12.5.0
powerpc               randconfig-002-20260529    clang-19
powerpc64             randconfig-001-20260528    gcc-12.5.0
powerpc64             randconfig-001-20260529    clang-19
powerpc64             randconfig-002-20260528    clang-23
powerpc64             randconfig-002-20260529    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260528    clang-18
riscv                 randconfig-001-20260529    gcc-15.2.0
riscv                 randconfig-002-20260528    gcc-8.5.0
riscv                 randconfig-002-20260529    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260528    clang-23
s390                  randconfig-001-20260529    gcc-15.2.0
s390                  randconfig-002-20260528    gcc-12.5.0
s390                  randconfig-002-20260529    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260528    gcc-13.4.0
sh                    randconfig-001-20260529    gcc-15.2.0
sh                    randconfig-002-20260528    gcc-15.2.0
sh                    randconfig-002-20260529    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260528    gcc-11.5.0
sparc                 randconfig-001-20260529    gcc-11.5.0
sparc                 randconfig-002-20260528    gcc-15.2.0
sparc                 randconfig-002-20260529    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260528    gcc-8.5.0
sparc64               randconfig-001-20260529    gcc-11.5.0
sparc64               randconfig-002-20260528    gcc-8.5.0
sparc64               randconfig-002-20260529    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260528    clang-23
um                    randconfig-001-20260529    gcc-11.5.0
um                    randconfig-002-20260528    gcc-14
um                    randconfig-002-20260529    gcc-11.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260529    gcc-14
x86_64      buildonly-randconfig-002-20260529    gcc-14
x86_64      buildonly-randconfig-003-20260529    gcc-14
x86_64      buildonly-randconfig-004-20260529    gcc-14
x86_64      buildonly-randconfig-005-20260529    gcc-14
x86_64      buildonly-randconfig-006-20260529    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260527    gcc-14
x86_64                randconfig-001-20260529    clang-20
x86_64                randconfig-002-20260527    clang-20
x86_64                randconfig-002-20260529    clang-20
x86_64                randconfig-003-20260527    clang-20
x86_64                randconfig-003-20260529    clang-20
x86_64                randconfig-004-20260527    clang-20
x86_64                randconfig-004-20260529    clang-20
x86_64                randconfig-005-20260527    clang-20
x86_64                randconfig-005-20260529    clang-20
x86_64                randconfig-006-20260527    gcc-14
x86_64                randconfig-006-20260529    clang-20
x86_64                randconfig-011-20260527    gcc-14
x86_64                randconfig-011-20260529    clang-20
x86_64                randconfig-012-20260529    clang-20
x86_64                randconfig-013-20260529    clang-20
x86_64                randconfig-014-20260529    clang-20
x86_64                randconfig-015-20260529    clang-20
x86_64                randconfig-016-20260529    clang-20
x86_64                randconfig-071-20260528    clang-20
x86_64                randconfig-071-20260529    clang-20
x86_64                randconfig-072-20260528    clang-20
x86_64                randconfig-072-20260529    clang-20
x86_64                randconfig-073-20260528    gcc-14
x86_64                randconfig-073-20260529    clang-20
x86_64                randconfig-074-20260528    clang-20
x86_64                randconfig-074-20260529    clang-20
x86_64                randconfig-075-20260528    gcc-14
x86_64                randconfig-075-20260529    clang-20
x86_64                randconfig-076-20260528    clang-20
x86_64                randconfig-076-20260529    clang-20
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260528    gcc-15.2.0
xtensa                randconfig-001-20260529    gcc-11.5.0
xtensa                randconfig-002-20260528    gcc-8.5.0
xtensa                randconfig-002-20260529    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

