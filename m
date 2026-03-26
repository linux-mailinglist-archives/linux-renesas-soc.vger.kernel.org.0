Return-Path: <linux-renesas-soc+bounces-30306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIiLKGTjxGnz4gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 08:42:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C23308D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 08:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5097F3006798
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 07:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC0B346E78;
	Thu, 26 Mar 2026 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSqk24ZC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6834E74B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510600; cv=none; b=Q7Hqo+Ra/q/hP9PfF2xYpNh353h9E3q/ebqkUklIbqE/KQVt0yY6Z/wze6d/KPcLm+lZBcXGekhob0kk/oB1vRKXpzG7RTSdqdDnJ8qVbvoPt+jMKrdhPoofYDf+M9gJGj2nbk2W7xG6CzhIA8mPYH7Afquk/0odjKf2FKwQJho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510600; c=relaxed/simple;
	bh=yIwCN6cjgAv9d1W0Rcf2Es4iMNJ5NUc54pjyHO2vMZM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZpEdhfdJ7kbZZDuo0zfKyiabrGBCQ0OJl2ZOrhAl/8nS6ALvRDIFMRdor9riyBPxJQa8lINGngAEFC7FXfUo7TIlNWC+hrL87eWsJm6O+GYw4KGuSKW6SHSk14RWmR2r/cGEU+4iJ2IgOK5TXa2XksdSg7gUb+CMng7M9j2Vn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSqk24ZC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774510599; x=1806046599;
  h=date:from:to:cc:subject:message-id;
  bh=yIwCN6cjgAv9d1W0Rcf2Es4iMNJ5NUc54pjyHO2vMZM=;
  b=YSqk24ZCcr1EqvKDogHodwOtixFd121zr/oV26tRC3T/FOG3AetNX/2Y
   oKFl4rFtzExU4rzmiWKiZJqk7kO4EoAkOdZuis/6Ojaccr20ZMQ3meNt1
   tXzSSaiG/8+7uvjog6KJnmcHH1KaX/sQah5BC6nCLv4aGXsaH9n4ux4rY
   en1cnA+KC/p6TLR4NmrPWiyOys/8uo1J9NaVZt3FshMbFZ2vuAt9KJ2dy
   QbX618+Ya/af7S1ugF5gzhXsk/eMXgrw6Vu8QcU0EPk1ljQK7thNdvLvv
   xVvlFW06leMFqLxm8sFr0IjU6j5w9jz3CWzTTv0d2n22p6vII0gjorjYf
   A==;
X-CSE-ConnectionGUID: AppL7NblROuB0rLgfaqgOw==
X-CSE-MsgGUID: Ze1YeDoBTjSs/9JpAVwBng==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75445443"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75445443"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:36:38 -0700
X-CSE-ConnectionGUID: mR6ishOeSEK0zcH02AoOfQ==
X-CSE-MsgGUID: A/57Q2ZTSkaoSUDeQWAYow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229694520"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 00:36:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fGb-000000008ZR-2vDn;
	Thu, 26 Mar 2026 07:36:33 +0000
Date: Thu, 26 Mar 2026 15:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 44ed098c6ef354dcd56367512f73a8f1e29846fb
Message-ID: <202603261503.WFheBM1w-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-30306-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: E90C23308D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 44ed098c6ef354dcd56367512f73a8f1e29846fb  clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}

elapsed time: 753m

configs tested: 161
configs skipped: 2

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
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260326    gcc-8.5.0
arc                   randconfig-002-20260326    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                   randconfig-001-20260326    gcc-8.5.0
arm                   randconfig-002-20260326    gcc-8.5.0
arm                   randconfig-003-20260326    gcc-8.5.0
arm                   randconfig-004-20260326    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260326    clang-19
arm64                 randconfig-002-20260326    clang-19
arm64                 randconfig-003-20260326    clang-19
arm64                 randconfig-004-20260326    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260326    clang-19
csky                  randconfig-002-20260326    clang-19
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260326    gcc-8.5.0
hexagon               randconfig-002-20260326    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260326    gcc-14
i386        buildonly-randconfig-002-20260326    gcc-14
i386        buildonly-randconfig-003-20260326    gcc-14
i386        buildonly-randconfig-004-20260326    gcc-14
i386        buildonly-randconfig-005-20260326    gcc-14
i386        buildonly-randconfig-006-20260326    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-011-20260326    clang-20
i386                  randconfig-012-20260326    clang-20
i386                  randconfig-013-20260326    clang-20
i386                  randconfig-014-20260326    clang-20
i386                  randconfig-015-20260326    clang-20
i386                  randconfig-016-20260326    clang-20
i386                  randconfig-017-20260326    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260326    gcc-8.5.0
loongarch             randconfig-002-20260326    gcc-8.5.0
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
mips                           ip30_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260326    gcc-8.5.0
nios2                 randconfig-002-20260326    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260326    clang-19
parisc                randconfig-002-20260326    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260326    clang-19
powerpc               randconfig-002-20260326    clang-19
powerpc64             randconfig-001-20260326    clang-19
powerpc64             randconfig-002-20260326    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260326    clang-23
riscv                 randconfig-002-20260326    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260326    clang-23
s390                  randconfig-002-20260326    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260326    clang-23
sh                    randconfig-002-20260326    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260326    gcc-14
sparc                 randconfig-002-20260326    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260326    gcc-14
sparc64               randconfig-002-20260326    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260326    gcc-14
um                    randconfig-002-20260326    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260326    clang-20
x86_64      buildonly-randconfig-002-20260326    clang-20
x86_64      buildonly-randconfig-003-20260326    clang-20
x86_64      buildonly-randconfig-004-20260326    clang-20
x86_64      buildonly-randconfig-005-20260326    clang-20
x86_64      buildonly-randconfig-006-20260326    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260326    clang-20
x86_64                randconfig-002-20260326    clang-20
x86_64                randconfig-003-20260326    clang-20
x86_64                randconfig-004-20260326    clang-20
x86_64                randconfig-005-20260326    clang-20
x86_64                randconfig-006-20260326    clang-20
x86_64                randconfig-011-20260326    gcc-14
x86_64                randconfig-012-20260326    gcc-14
x86_64                randconfig-013-20260326    gcc-14
x86_64                randconfig-014-20260326    gcc-14
x86_64                randconfig-015-20260326    gcc-14
x86_64                randconfig-016-20260326    gcc-14
x86_64                randconfig-071-20260326    gcc-14
x86_64                randconfig-072-20260326    gcc-14
x86_64                randconfig-073-20260326    gcc-14
x86_64                randconfig-074-20260326    gcc-14
x86_64                randconfig-075-20260326    gcc-14
x86_64                randconfig-076-20260326    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260326    gcc-14
xtensa                randconfig-002-20260326    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

