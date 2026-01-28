Return-Path: <linux-renesas-soc+bounces-27498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOB9DLR0eWkSxQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 03:30:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C80259C443
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 03:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38FD2300AB02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 02:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782A126CE1E;
	Wed, 28 Jan 2026 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnvfZ81S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A712BCF46
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567410; cv=none; b=K3ODFJMQ5H7qgvm1c+ZJzp4AtsT+UZfFndnW1n0MBRpE2006Khy7p2CGxoGSJGdIepWbFqT9Fdo7E0R7th0xEdalGBIXblNeeL7a5VYzluXfYK6689zcx1jd/QeDSatevKNrj1zM3jarpQQ9mnm71vOt9rMfvc/LTznHZehhJR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567410; c=relaxed/simple;
	bh=CeGHodb+en37tZKnjY4KRaqnVpcAIwIecqnVdZZRNAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/xXqb4UIf4zg7KJyz+Y7SKjqF4qjwqN7xcZrQJt6zdXu8dyA/NsbDU5NdfpdeYLlu8fT+JJj63xrwckShkhmctMWt5Bx8C4eg5YziNQRk3vDFcPIPJA5jf964PvzvurPqB96zOfFZj11mqfR+yBa679yp1h4PtRQ6K9HImr+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnvfZ81S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769567408; x=1801103408;
  h=date:from:to:cc:subject:message-id;
  bh=CeGHodb+en37tZKnjY4KRaqnVpcAIwIecqnVdZZRNAg=;
  b=YnvfZ81ScMaCSAAGU9HGKO6KwZbCQcEmgrVgG+2zts5pteVJw2/8pN3t
   rdoP6KhpQkJiXGTqnBZBVtM0DIiMKFEENAnKnO1Tlqjccx/3Au76njsSN
   N26xgYevlBgoQIaIdeBkeqq7XBIJE+2PvQc3YXYTV9Tleii7xDKbdwNIf
   I8qi7i9dWemUJtnWML5oe4yYhmRO+gg0J5HA7zxb2OysBBOvnjX4mQDqc
   i0XSWoq1x0cknTaxblq/M0AzKuY0iDxTWacLICNmneSWeDM9/ZYwcT1xR
   eQ3oqasNEQ2zHfBEnLX1xAe6sA+4mg2erMCmjygGkQlYG2F3WFKb3ZOAe
   A==;
X-CSE-ConnectionGUID: w5iISpgqSYm42ydWezOF8A==
X-CSE-MsgGUID: gZopT6LdSx2pWmfNP19QKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70829721"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70829721"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:30:08 -0800
X-CSE-ConnectionGUID: 08+ceaQYQEqxGt2R3a9bTw==
X-CSE-MsgGUID: VcWhg/VBR8iPMh5HcCLFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212997833"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 18:30:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvJk-00000000Z97-1yb4;
	Wed, 28 Jan 2026 02:30:04 +0000
Date: Wed, 28 Jan 2026 10:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.21] BUILD SUCCESS
 947fccc4cd4d3000c63532c35124c0c38e9a34c6
Message-ID: <202601281022.DbshAarc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27498-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C80259C443
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.21
branch HEAD: 947fccc4cd4d3000c63532c35124c0c38e9a34c6  arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

elapsed time: 948m

configs tested: 207
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260127    gcc-8.5.0
arc                   randconfig-001-20260128    gcc-8.5.0
arc                   randconfig-002-20260127    gcc-11.5.0
arc                   randconfig-002-20260128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        mvebu_v5_defconfig    gcc-15.2.0
arm                   randconfig-001-20260127    clang-22
arm                   randconfig-001-20260128    gcc-8.5.0
arm                   randconfig-002-20260127    clang-18
arm                   randconfig-002-20260128    gcc-8.5.0
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-003-20260128    gcc-8.5.0
arm                   randconfig-004-20260127    clang-18
arm                   randconfig-004-20260128    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260128    gcc-14.3.0
arm64                 randconfig-002-20260128    gcc-14.3.0
arm64                 randconfig-003-20260128    gcc-14.3.0
arm64                 randconfig-004-20260128    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260128    gcc-14.3.0
csky                  randconfig-002-20260128    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260128    clang-22
hexagon               randconfig-002-20260128    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260128    clang-20
i386        buildonly-randconfig-001-20260128    gcc-14
i386        buildonly-randconfig-002-20260128    clang-20
i386        buildonly-randconfig-003-20260128    clang-20
i386        buildonly-randconfig-003-20260128    gcc-14
i386        buildonly-randconfig-004-20260128    clang-20
i386        buildonly-randconfig-005-20260128    clang-20
i386        buildonly-randconfig-005-20260128    gcc-14
i386        buildonly-randconfig-006-20260128    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260128    gcc-14
i386                  randconfig-002-20260128    gcc-14
i386                  randconfig-003-20260128    gcc-14
i386                  randconfig-004-20260128    gcc-14
i386                  randconfig-005-20260128    gcc-14
i386                  randconfig-006-20260128    gcc-14
i386                  randconfig-007-20260128    gcc-14
i386                  randconfig-011-20260128    clang-20
i386                  randconfig-012-20260128    clang-20
i386                  randconfig-013-20260128    clang-20
i386                  randconfig-014-20260128    clang-20
i386                  randconfig-015-20260128    clang-20
i386                  randconfig-016-20260128    clang-20
i386                  randconfig-017-20260128    clang-20
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260128    clang-22
loongarch             randconfig-002-20260128    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260128    clang-22
nios2                 randconfig-002-20260128    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                       virt_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260128    gcc-11.5.0
parisc                randconfig-002-20260128    gcc-11.5.0
parisc                randconfig-002-20260128    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      chrp32_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260128    clang-22
powerpc               randconfig-001-20260128    gcc-11.5.0
powerpc               randconfig-002-20260128    gcc-11.5.0
powerpc               randconfig-002-20260128    gcc-8.5.0
powerpc64             randconfig-001-20260128    clang-22
powerpc64             randconfig-001-20260128    gcc-11.5.0
powerpc64             randconfig-002-20260128    clang-22
powerpc64             randconfig-002-20260128    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260128    gcc-13.4.0
riscv                 randconfig-002-20260128    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260128    gcc-13.4.0
s390                  randconfig-002-20260128    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260128    gcc-13.4.0
sh                    randconfig-002-20260128    gcc-13.4.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260128    gcc-11.5.0
sparc                 randconfig-002-20260128    gcc-11.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260128    gcc-11.5.0
sparc64               randconfig-002-20260128    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260128    gcc-11.5.0
um                    randconfig-002-20260128    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260128    gcc-14
x86_64      buildonly-randconfig-002-20260128    gcc-14
x86_64      buildonly-randconfig-003-20260128    gcc-14
x86_64      buildonly-randconfig-004-20260128    gcc-12
x86_64      buildonly-randconfig-004-20260128    gcc-14
x86_64      buildonly-randconfig-005-20260128    clang-20
x86_64      buildonly-randconfig-005-20260128    gcc-14
x86_64      buildonly-randconfig-006-20260128    clang-20
x86_64      buildonly-randconfig-006-20260128    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260128    gcc-13
x86_64                randconfig-002-20260128    gcc-13
x86_64                randconfig-003-20260128    gcc-13
x86_64                randconfig-004-20260128    gcc-13
x86_64                randconfig-005-20260128    gcc-13
x86_64                randconfig-006-20260128    gcc-13
x86_64                randconfig-011-20260128    clang-20
x86_64                randconfig-012-20260128    clang-20
x86_64                randconfig-012-20260128    gcc-14
x86_64                randconfig-013-20260128    clang-20
x86_64                randconfig-014-20260128    clang-20
x86_64                randconfig-015-20260128    clang-20
x86_64                randconfig-015-20260128    gcc-14
x86_64                randconfig-016-20260128    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260128    gcc-11.5.0
xtensa                randconfig-002-20260128    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

