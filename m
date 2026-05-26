Return-Path: <linux-renesas-soc+bounces-33141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKuJCJ1YFWqmUQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 10:23:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 080745D2669
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 10:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E8B3015CBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 08:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F162EDD6B;
	Tue, 26 May 2026 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtRvsr6a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0596D3451A7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783833; cv=none; b=jzwwGOf5QE1D0ElOKkBc27kzNcankf+pURTnPOK+SMU3hzZ4aIO39WBBTOg7+2hUCVe2s67PZox/pYAI3iVz+Splt4m/R4NdfTGWDpXCCnT5//IgCVuByK1bmu8m2m0OQAbf+9XEj/HRaiFxMvB5+XChu2zsXoc4oQAq3kSPQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783833; c=relaxed/simple;
	bh=x5pQecdrtdYdtq0XhEo1AInY2i99A+0u+PtWht7eK7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g5hvlpPYLwVjF4HAiEUDGXkUk8m0qHDWm5srTVGleB9xC7brc0k6DnoHrZA4vNa1r/tkZ5bhsKui61wezBwNkmSILDJXaH/0dmI+TeNPazQ1NRKAnN5ahUVhzbQFSZIjps5VO+FlZ2ZYbZUvU6nYqGLq6SAhqO7Zdpo+uhD3Ym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtRvsr6a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779783831; x=1811319831;
  h=date:from:to:cc:subject:message-id;
  bh=x5pQecdrtdYdtq0XhEo1AInY2i99A+0u+PtWht7eK7k=;
  b=VtRvsr6aHV/SVJx6VJBhsCcOUAd9P83uOEJAoGEPlnopsdyJGu9+IN3/
   TEr0m9FQmTCunzQXPr+QJvE0UHlH2Vj7MlRU4KMjf8r5C0CuF2NsokAg5
   WuDYXFKHIY58iigNOjfp8q6h54vyEldokT/qSVBW4i0t2/tZ1hn9U60n0
   NWFWJxYPQKcc6C9RnjzMSY5iB6zgjC0ZAGsqYwtJ3OU9Q5Ut5DNfwx7p5
   Ca/lMrGgf3yHrWJmm6myYBUYWoaRmIYvUUsnhuAhUdz2LhHyffGnCqfFY
   J1YV9sYDCIkG2GXAk139KAncmCk1qe9xoCYJzx9gHnQhePYGdQItD5ax7
   g==;
X-CSE-ConnectionGUID: NeXMBtgRQROcnc1Q58oD+w==
X-CSE-MsgGUID: DGAHJWJ8RwWO8qfTLkm6SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92061400"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="92061400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:21:12 -0700
X-CSE-ConnectionGUID: gKlrdNp0TSSLxEs21OSpvA==
X-CSE-MsgGUID: d4BOHgtcS+C0ZfeBK7L5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="243678704"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2026 01:21:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRn2B-000000002G2-0kV4;
	Tue, 26 May 2026 08:21:07 +0000
Date: Tue, 26 May 2026 16:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.2] BUILD SUCCESS
 a3dcb0a3204f75f6841d8f7d0dc232f51706dfb9
Message-ID: <202605261633.T8qUdpIG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-33141-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 080745D2669
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.2
branch HEAD: a3dcb0a3204f75f6841d8f7d0dc232f51706dfb9  arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist

elapsed time: 976m

configs tested: 103
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc         randconfig-001-20260526    gcc-8.5.0
arc         randconfig-002-20260526    gcc-8.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260526    clang-23
arm         randconfig-002-20260526    gcc-8.5.0
arm         randconfig-003-20260526    clang-23
arm         randconfig-004-20260526    gcc-13.4.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260526    clang-23
arm64       randconfig-002-20260526    gcc-8.5.0
arm64       randconfig-003-20260526    gcc-13.4.0
arm64       randconfig-004-20260526    gcc-9.5.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260526    gcc-15.2.0
csky        randconfig-002-20260526    gcc-13.4.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon              randconfig-001    clang-17
hexagon     randconfig-001-20260526    clang-20
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
i386        randconfig-001-20260526    gcc-14
i386        randconfig-002-20260526    gcc-13
i386        randconfig-003-20260526    gcc-14
i386        randconfig-004-20260526    clang-20
i386        randconfig-005-20260526    clang-20
i386        randconfig-006-20260526    clang-20
i386        randconfig-007-20260526    clang-20
i386        randconfig-011-20260526    gcc-14
i386        randconfig-012-20260526    gcc-14
i386        randconfig-013-20260526    clang-20
i386        randconfig-014-20260526    clang-20
i386        randconfig-015-20260526    gcc-14
i386        randconfig-016-20260526    clang-20
i386        randconfig-017-20260526    clang-20
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch   randconfig-001-20260526    gcc-15.2.0
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                   allnoconfig    gcc-11.5.0
nios2                randconfig-001    gcc-11.5.0
nios2       randconfig-001-20260526    gcc-11.5.0
nios2                randconfig-002    gcc-11.5.0
nios2       randconfig-002-20260526    gcc-8.5.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260526    gcc-15.2.0
parisc      randconfig-002-20260526    gcc-14.3.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260526    clang-23
powerpc     randconfig-002-20260526    clang-19
powerpc64   randconfig-001-20260526    gcc-15.2.0
powerpc64   randconfig-002-20260526    gcc-10.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20260526    clang-23
riscv       randconfig-002-20260526    gcc-8.5.0
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390        randconfig-001-20260526    clang-23
s390        randconfig-002-20260526    clang-23
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh          randconfig-001-20260526    gcc-10.5.0
sh          randconfig-002-20260526    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260526    gcc-15.2.0
sparc       randconfig-002-20260526    gcc-15.2.0
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64      randconfig-071-20260526    gcc-14
x86_64      randconfig-072-20260526    clang-20
x86_64      randconfig-073-20260526    clang-20
x86_64      randconfig-074-20260526    gcc-14
x86_64      randconfig-075-20260526    clang-20
x86_64      randconfig-076-20260526    gcc-13
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa      randconfig-001-20260526    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

