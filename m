Return-Path: <linux-renesas-soc+bounces-30267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL+kCnMcxGnlwQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 18:33:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4E329E0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 18:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2112E315D42C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124892F83B7;
	Wed, 25 Mar 2026 17:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guSRalNJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBAA3D524D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459218; cv=none; b=JimD7BV7GOjRF+IOwDX1BybM4CoI9bJpFVnwjDsqo44r2u+keyvyTU56pJI+uGr6ilDrPq/ZtPyyFl/ep6jdNXh8m5tH9XpjePFXE87C4zV27Qgk57WTdWxpvJWT5x3CiUL03A3fqDeTbyYhwZotovvF9UWIj2Eu6YJKASn+v+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459218; c=relaxed/simple;
	bh=NrvHJW8t2gYKbv3EZQDKm3hhoM5moPm2jcfjEEADjY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ctWA7nyex4C6bq8kxBkB3exRPBphWFmI12ZADJYhnZhVh86oqg5x3RZEfFT6OU2SsELDeEF3QulcOW6RxvwooDHG9aXD7WNcsNSU+Mk5fu2l2FwO0cW/eXatfF1i4V35rnvXzIef8VUgr3lKxOu1o0Z7MwuJwlfwShEsqG1Mntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guSRalNJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774459216; x=1805995216;
  h=date:from:to:cc:subject:message-id;
  bh=NrvHJW8t2gYKbv3EZQDKm3hhoM5moPm2jcfjEEADjY4=;
  b=guSRalNJNRh+tAoKnly8kVGLi1jVXGgns+AvmzH7lIOroH/IDHeK5nDP
   JBh9d1M6a8qR/vrDmk2PoR6FaUYyzLMmHUrLs6uUD9Xa5eojwyN7nhpxb
   I7q140a3jaW2lOIPidzuJG/jyvY1wLo4qUi+1chTwnohROGDTbkf0yVts
   y9WG864rf+BT/cuzpvPMNd4/vzjwmpclj3iKaKqsGpSOu9pJEjN97H3j2
   er4hkEGF7OgYVw+sM2HflSZqAW1an7zmMnuhpVy9mOhw1SYi8Rt/6i8d/
   QhlwETRteVxzIV5Y3uPleIyC3dryK153jQxAYfBiIOevmiLjCb8EJfwIq
   A==;
X-CSE-ConnectionGUID: rq+jkqTBS0+EjYjkTWjXnQ==
X-CSE-MsgGUID: ylwEgop3Toqk9rAQ8xuDGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74532756"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74532756"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:20:16 -0700
X-CSE-ConnectionGUID: SlFMJ4yjTzCrejI9vJlLWQ==
X-CSE-MsgGUID: P3KuYh4kSyKomoDXQNR42g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221855250"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Mar 2026 10:20:15 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Rts-000000007O5-3u1n;
	Wed, 25 Mar 2026 17:20:12 +0000
Date: Thu, 26 Mar 2026 01:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 f84a8bed8d7889b1e3be111ebe9a17056a7a2546
Message-ID: <202603260151.XxaJdpOG-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30267-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 96D4E329E0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: f84a8bed8d7889b1e3be111ebe9a17056a7a2546  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1365m

configs tested: 149
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260325    gcc-15.2.0
arc                   randconfig-002-20260325    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                             pxa_defconfig    gcc-15.2.0
arm                   randconfig-001-20260325    gcc-8.5.0
arm                   randconfig-002-20260325    clang-23
arm                   randconfig-003-20260325    clang-23
arm                   randconfig-004-20260325    clang-17
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260325    clang-23
arm64                 randconfig-002-20260325    gcc-11.5.0
arm64                 randconfig-003-20260325    gcc-8.5.0
arm64                 randconfig-004-20260325    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260325    gcc-10.5.0
csky                  randconfig-002-20260325    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260325    clang-19
hexagon               randconfig-002-20260325    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260325    gcc-14
i386        buildonly-randconfig-002-20260325    gcc-14
i386        buildonly-randconfig-003-20260325    clang-20
i386        buildonly-randconfig-004-20260325    clang-20
i386        buildonly-randconfig-005-20260325    clang-20
i386        buildonly-randconfig-006-20260325    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20260325    gcc-14
i386                  randconfig-012-20260325    gcc-14
i386                  randconfig-013-20260325    gcc-14
i386                  randconfig-014-20260325    gcc-14
i386                  randconfig-015-20260325    clang-20
i386                  randconfig-016-20260325    clang-20
i386                  randconfig-017-20260325    gcc-14
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260325    clang-23
loongarch             randconfig-002-20260325    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260325    gcc-8.5.0
nios2                 randconfig-002-20260325    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260325    gcc-8.5.0
parisc                randconfig-002-20260325    gcc-14.3.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260325    clang-23
powerpc               randconfig-002-20260325    clang-23
powerpc64             randconfig-001-20260325    clang-23
powerpc64             randconfig-002-20260325    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260325    clang-20
riscv                 randconfig-002-20260325    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260325    clang-23
s390                  randconfig-002-20260325    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260325    gcc-15.2.0
sh                    randconfig-002-20260325    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260325    gcc-8.5.0
sparc                 randconfig-002-20260325    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260325    clang-23
sparc64               randconfig-002-20260325    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260325    gcc-13
um                    randconfig-002-20260325    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260325    gcc-14
x86_64      buildonly-randconfig-002-20260325    gcc-14
x86_64      buildonly-randconfig-003-20260325    gcc-14
x86_64      buildonly-randconfig-004-20260325    gcc-14
x86_64      buildonly-randconfig-005-20260325    gcc-14
x86_64      buildonly-randconfig-006-20260325    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260325    gcc-14
x86_64                randconfig-002-20260325    gcc-14
x86_64                randconfig-003-20260325    clang-20
x86_64                randconfig-004-20260325    clang-20
x86_64                randconfig-005-20260325    gcc-14
x86_64                randconfig-006-20260325    gcc-12
x86_64                randconfig-011-20260325    clang-20
x86_64                randconfig-012-20260325    gcc-13
x86_64                randconfig-013-20260325    gcc-14
x86_64                randconfig-014-20260325    gcc-14
x86_64                randconfig-015-20260325    clang-20
x86_64                randconfig-016-20260325    gcc-13
x86_64                randconfig-071-20260325    clang-20
x86_64                randconfig-072-20260325    gcc-14
x86_64                randconfig-073-20260325    clang-20
x86_64                randconfig-074-20260325    gcc-14
x86_64                randconfig-075-20260325    gcc-14
x86_64                randconfig-076-20260325    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260325    gcc-13.4.0
xtensa                randconfig-002-20260325    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

