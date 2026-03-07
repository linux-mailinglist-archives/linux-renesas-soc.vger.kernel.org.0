Return-Path: <linux-renesas-soc+bounces-29000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFwUI+W3q2n7fwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 06:30:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D978622A40E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 06:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 649B3301993F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Mar 2026 05:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2536355F34;
	Sat,  7 Mar 2026 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArjYYI6Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065230148C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Mar 2026 05:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861326; cv=none; b=h9F55aqwSzh8BEgLxRSEgKftGdSKoWQu0jhc10K46EBa67gZtozlcZToreWRwiMpwHyNiwjN1YDpiB/kRScxCpt/O14S07gU0Ir+lFaXDka89ZbYq3U5i1ErI+xR+9sUy10PfyiFaK3/S3OcS9xAIG//TS+KPAPh5fPFVWkymT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861326; c=relaxed/simple;
	bh=TdZ43WBnb7QBMGln1Xu113pqWy5KWbjz4iKs0JISFCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iaNgS9LOyDFhLFbAkrJQ8KIu6epBtYuubslbhkdIsw6aH/BzDkpbRG++Tbzg8kbNZ+ZPc86VmwPa6zMDSRhLo8ZIUzBAkShjXoVL35hIAUf0L45ut6UhJ6ZfvMVaaiKRal9hl8j142KE1Ka4Ai31DZnPBsvn7eR4GSin5L9JSYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArjYYI6Q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772861326; x=1804397326;
  h=date:from:to:cc:subject:message-id;
  bh=TdZ43WBnb7QBMGln1Xu113pqWy5KWbjz4iKs0JISFCg=;
  b=ArjYYI6Q8Hx+swwOskswLqWgWt0uBZxW6C/E3w0iJCcCmw2QiZQ9Ll3I
   IGhfulRX6OsjOH90biZurDRiP9rJUJh0PA1wNQog5BfHMWRwant1W6PtC
   cBfANeS2JaIxlC6n059wCVj50q17bPhohLm60GzhxPOqmg7JJIANxef2q
   tHaTjX5Owm4R3seNHg5WFynQ1s/Vr7Rku1/s3Akh1uUUrZOerpHkyfamS
   cGiFobPi/y5cRTC59zm1yBfhFLwuPgmbiCqPkhAjf0aZ9F/adLm0m/DHB
   PoFGOY0t2d5327/T9DFLwAhXR1GagOfABUJOogLpU+iIxL7xaZFQh69lC
   w==;
X-CSE-ConnectionGUID: xaD8DohbTVKS7y10cHYrFw==
X-CSE-MsgGUID: HwMbQVVSQLi8Li3P6nYXug==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73870417"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73870417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:28:46 -0800
X-CSE-ConnectionGUID: DJvV+uzrS2WDpn64sbadog==
X-CSE-MsgGUID: 5AtNJYTQRfq8dzOrLMIvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223690468"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 21:28:43 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykDR-000000001iT-0ikf;
	Sat, 07 Mar 2026 05:28:41 +0000
Date: Sat, 07 Mar 2026 13:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 ebe7561e9b9203611cea72a764bc321ff308f737
Message-ID: <202603071327.Wly5qsvT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: D978622A40E
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-29000-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: ebe7561e9b9203611cea72a764bc321ff308f737  pinctrl: renesas: rzt2h: Fix invalid wait context

elapsed time: 965m

configs tested: 178
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
arc                   randconfig-001-20260307    gcc-15.2.0
arc                   randconfig-002-20260307    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260307    gcc-15.2.0
arm                   randconfig-002-20260307    gcc-15.2.0
arm                   randconfig-003-20260307    gcc-15.2.0
arm                   randconfig-004-20260307    gcc-15.2.0
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260307    gcc-8.5.0
arm64                 randconfig-002-20260307    gcc-8.5.0
arm64                 randconfig-003-20260307    gcc-8.5.0
arm64                 randconfig-004-20260307    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260307    gcc-8.5.0
csky                  randconfig-002-20260307    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260307    gcc-15.2.0
hexagon               randconfig-002-20260307    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260307    gcc-14
i386        buildonly-randconfig-002-20260307    gcc-14
i386        buildonly-randconfig-003-20260307    gcc-14
i386        buildonly-randconfig-004-20260307    gcc-14
i386        buildonly-randconfig-005-20260307    gcc-14
i386        buildonly-randconfig-006-20260307    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260307    clang-20
i386                  randconfig-002-20260307    clang-20
i386                  randconfig-003-20260307    clang-20
i386                  randconfig-004-20260307    clang-20
i386                  randconfig-005-20260307    clang-20
i386                  randconfig-006-20260307    clang-20
i386                  randconfig-007-20260307    clang-20
i386                  randconfig-011-20260307    gcc-14
i386                  randconfig-012-20260307    gcc-14
i386                  randconfig-013-20260307    gcc-14
i386                  randconfig-014-20260307    gcc-14
i386                  randconfig-015-20260307    gcc-14
i386                  randconfig-016-20260307    gcc-14
i386                  randconfig-017-20260307    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260307    gcc-15.2.0
loongarch             randconfig-002-20260307    gcc-15.2.0
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
mips                  cavium_octeon_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260307    gcc-15.2.0
nios2                 randconfig-002-20260307    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260307    gcc-12.5.0
parisc                randconfig-002-20260307    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260307    gcc-12.5.0
powerpc               randconfig-002-20260307    gcc-12.5.0
powerpc64             randconfig-001-20260307    gcc-12.5.0
powerpc64             randconfig-002-20260307    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260307    clang-23
riscv                 randconfig-002-20260307    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260307    clang-23
s390                  randconfig-002-20260307    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260307    clang-23
sh                    randconfig-002-20260307    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260307    gcc-8.5.0
sparc                 randconfig-002-20260307    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260307    gcc-8.5.0
sparc64               randconfig-002-20260307    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260307    gcc-8.5.0
um                    randconfig-002-20260307    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260307    clang-20
x86_64      buildonly-randconfig-002-20260307    clang-20
x86_64      buildonly-randconfig-003-20260307    clang-20
x86_64      buildonly-randconfig-004-20260307    clang-20
x86_64      buildonly-randconfig-005-20260307    clang-20
x86_64      buildonly-randconfig-006-20260307    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260307    gcc-14
x86_64                randconfig-002-20260307    gcc-14
x86_64                randconfig-003-20260307    gcc-14
x86_64                randconfig-004-20260307    gcc-14
x86_64                randconfig-005-20260307    gcc-14
x86_64                randconfig-006-20260307    gcc-14
x86_64                randconfig-011-20260307    gcc-14
x86_64                randconfig-012-20260307    gcc-14
x86_64                randconfig-013-20260307    gcc-14
x86_64                randconfig-014-20260307    gcc-14
x86_64                randconfig-015-20260307    gcc-14
x86_64                randconfig-016-20260307    gcc-14
x86_64                randconfig-071-20260307    gcc-14
x86_64                randconfig-072-20260307    gcc-14
x86_64                randconfig-073-20260307    gcc-14
x86_64                randconfig-074-20260307    gcc-14
x86_64                randconfig-075-20260307    gcc-14
x86_64                randconfig-076-20260307    gcc-14
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
xtensa                randconfig-001-20260307    gcc-8.5.0
xtensa                randconfig-002-20260307    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

