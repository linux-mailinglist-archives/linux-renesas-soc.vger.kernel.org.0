Return-Path: <linux-renesas-soc+bounces-31251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGXSOs523WngeQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 01:05:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579F3F42B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 01:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B06C33016932
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 23:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9BC4A0C;
	Mon, 13 Apr 2026 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M58FFZHC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3B181334
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776121423; cv=none; b=OiocIqDNEKMwQCor8Qhd/l6RXkjOEra8gGXdxzXjK79OdDnSTmzLxc4XXLOo0AI0/7P/M/NwuVXL9e6GYicRN1MbkYrcwv9WWmrHqH3FdBfnQsQJrSGgcK/UncX5KOhy0t01/cgKRZ4Yo6H0OEHzjeoHy8WH3js1m5xpaoZKvCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776121423; c=relaxed/simple;
	bh=Bet7p41i6cN39BvVVC5Q2sfEaLXcvT4n69EJOF8veug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HJW4ms1Iha5HJk18ASwxZDk7HpPQXYvUFbR62m0tgsmxlsupXRJJWV0EYUnJwWjiKd8LzwdFjQZWHRdbgkSTaUOsrTnJwJkt4FDb4IheBkWa7Rb8xsLRgOdXPNQpsCf/HHoIrKU+nftyQePzAnkAXXZne2wGRZJRDUA/d0aTWZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M58FFZHC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776121422; x=1807657422;
  h=date:from:to:cc:subject:message-id;
  bh=Bet7p41i6cN39BvVVC5Q2sfEaLXcvT4n69EJOF8veug=;
  b=M58FFZHCRBwCiO2bpV9MMoe8nJhNgz5PEyAYMIIgIo1P7F00aB9iSgG6
   2A8Y5uuuucrIUBSwxtweyPeaGDVaDbFnQ7f9RX4hxBmQFlM0Y/7CpF4v1
   JD7U/eJPfacd9n+GSSGdCdNAEqqM0ByCeDIvG+yEqrqYHm27hCF7GzFEk
   f3qIkH5zgkMr0CCPxKBFaMlpcnHKSDNgaqwG7qmrETM0OWZ6+mfZ1uthF
   xsk1xj+/loCF0nn3jBnQskdl9kFGJBSVJC6s0u5S3O9oqbI7h1zkqFsoX
   Cc/YW1vshk1ia2+GxaPG7tr11H7w4S7i+bIrWPnXTqC/h3vXjhT4+6Hw8
   Q==;
X-CSE-ConnectionGUID: an//g84mRRifkRie/uxaEg==
X-CSE-MsgGUID: RqO3gKNYTNCNHTrpFIHnSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77249556"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="77249556"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 16:03:42 -0700
X-CSE-ConnectionGUID: KBAwG4vYRC62ue08xkwNfg==
X-CSE-MsgGUID: dTG6kwGTTYqbyXrz/1Ke9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="231645547"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Apr 2026 16:03:40 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCQJd-000000000wL-2IUv;
	Mon, 13 Apr 2026 23:03:37 +0000
Date: Tue, 14 Apr 2026 07:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 5d879cac3a3c2b0a935e3d8910151ea8433fa70e
Message-ID: <202604140712.tmZzk1hU-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31251-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5579F3F42B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 5d879cac3a3c2b0a935e3d8910151ea8433fa70e  Merge tag 'v7.0' into topic/renesas-defconfig

elapsed time: 808m

configs tested: 182
configs skipped: 3

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
arc                   randconfig-001-20260413    gcc-11.5.0
arc                   randconfig-002-20260413    gcc-11.5.0
arc                   randconfig-002-20260413    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260413    clang-23
arm                   randconfig-001-20260413    gcc-11.5.0
arm                   randconfig-002-20260413    clang-23
arm                   randconfig-002-20260413    gcc-11.5.0
arm                   randconfig-003-20260413    clang-17
arm                   randconfig-003-20260413    gcc-11.5.0
arm                   randconfig-004-20260413    clang-23
arm                   randconfig-004-20260413    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260414    gcc-12.5.0
arm64                 randconfig-002-20260414    gcc-12.5.0
arm64                 randconfig-003-20260414    gcc-12.5.0
arm64                 randconfig-004-20260414    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260414    gcc-12.5.0
csky                  randconfig-002-20260414    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260413    clang-18
hexagon               randconfig-002-20260413    clang-18
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260414    gcc-14
i386        buildonly-randconfig-002-20260414    gcc-14
i386        buildonly-randconfig-003-20260414    gcc-14
i386        buildonly-randconfig-004-20260414    gcc-14
i386        buildonly-randconfig-005-20260414    gcc-14
i386        buildonly-randconfig-006-20260414    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260413    gcc-14
i386                  randconfig-002-20260413    gcc-14
i386                  randconfig-003-20260413    gcc-14
i386                  randconfig-004-20260413    gcc-14
i386                  randconfig-005-20260413    gcc-14
i386                  randconfig-006-20260413    gcc-14
i386                  randconfig-007-20260413    gcc-14
i386                  randconfig-011-20260413    clang-20
i386                  randconfig-012-20260413    clang-20
i386                  randconfig-013-20260413    clang-20
i386                  randconfig-014-20260413    clang-20
i386                  randconfig-015-20260413    clang-20
i386                  randconfig-016-20260413    clang-20
i386                  randconfig-017-20260413    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260413    clang-18
loongarch             randconfig-002-20260413    clang-18
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260413    clang-18
nios2                 randconfig-002-20260413    clang-18
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260413    gcc-9.5.0
parisc                randconfig-002-20260413    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    clang-23
powerpc               randconfig-001-20260413    gcc-9.5.0
powerpc               randconfig-002-20260413    gcc-9.5.0
powerpc64             randconfig-001-20260413    gcc-9.5.0
powerpc64             randconfig-002-20260413    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260413    gcc-8.5.0
riscv                 randconfig-002-20260413    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260413    gcc-8.5.0
s390                  randconfig-002-20260413    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260413    gcc-8.5.0
sh                    randconfig-002-20260413    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260414    gcc-12
sparc                 randconfig-002-20260414    gcc-12
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260414    gcc-12
sparc64               randconfig-002-20260414    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260414    gcc-12
um                    randconfig-002-20260414    gcc-12
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260414    gcc-14
x86_64      buildonly-randconfig-002-20260414    gcc-14
x86_64      buildonly-randconfig-003-20260414    gcc-14
x86_64      buildonly-randconfig-004-20260414    gcc-14
x86_64      buildonly-randconfig-005-20260414    gcc-14
x86_64      buildonly-randconfig-006-20260414    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260413    clang-20
x86_64                randconfig-002-20260413    clang-20
x86_64                randconfig-003-20260413    clang-20
x86_64                randconfig-004-20260413    clang-20
x86_64                randconfig-005-20260413    clang-20
x86_64                randconfig-006-20260413    clang-20
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
xtensa                randconfig-001-20260414    gcc-12
xtensa                randconfig-002-20260414    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

