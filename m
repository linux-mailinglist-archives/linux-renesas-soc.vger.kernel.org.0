Return-Path: <linux-renesas-soc+bounces-31652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nGtaKS1s7GmtYgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 09:24:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8661C4656BB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 09:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE9E3007AF8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 07:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F0A392C31;
	Sat, 25 Apr 2026 07:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBcSeH9+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1659B39283C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Apr 2026 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777101865; cv=none; b=ub4hBIezhcptbBO8zMSYuI2A0j0sOOjblWsz/lQ9OMgB5hxMg59VK8NWtRazvZJ4SjC8AzijBOD68GD8zW/tjdbo6VAEHqW1eD/o2q4VA/vAt3rQi85f/1BoyeqYbnZobQTww8SZ8J2TIBB2F2FhNRcUerY8fW10AkpQCK8+gsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777101865; c=relaxed/simple;
	bh=GxP66qj+pF0ooErGrzxH2XUB13/66R58xk9lQaXPp3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LTwE6AbB3465GNh8NIQp71Biit54Zkgt5uHVS1N2v6r9UQWuTPVbFmAz515a1YGQDKVDs9uxR16NpLFU6j5KL3gYoN1KhWGDIHkYqobZEog2ax0QX2LX5v1yoCKqLgZ82taW6IG94skXTg5UWlamMvF0NmCPS2WLCZIXboSMbs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBcSeH9+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777101861; x=1808637861;
  h=date:from:to:cc:subject:message-id;
  bh=GxP66qj+pF0ooErGrzxH2XUB13/66R58xk9lQaXPp3c=;
  b=hBcSeH9+OSy+AtcHjTGpeAW8pmVE9ZO9tBNB8a0nr+VDomz8tUbacIhL
   WjUX3tAf4Uh93Ek57FJGh0RnDeaeRrjO+wgEfMqo6DQzLFpmoqOXXnqs1
   xjkW8N07WX0UWXeZ6yPxjYcoRzhRbP3tAELowzkA/jS7vbufSNvZgBpYy
   t557awBsP5uDNXOluy1iW74GudE3+oV7QAqUuNPNH59LZt6ixoiQGlW16
   ohuwqmvTWkFsEcfcKJ2vZ8NzIdWlXPMKHnqn0MxzXMZi8YBbDqOVjPnXU
   9HIS8iYR/4ozhvQnzn5wZfz7/zXbrOwf4mX3JSJIwYWy8Y6X+H/SEbGTr
   A==;
X-CSE-ConnectionGUID: kl2BVVpdTZ2ZsXeEiDWsKg==
X-CSE-MsgGUID: JGDRnuWbS5C0gTsV8FYm6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="100728109"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="100728109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 00:24:20 -0700
X-CSE-ConnectionGUID: S025gzWpQeqsFvqemDOGVQ==
X-CSE-MsgGUID: Tus/R5x0TDGR2ksp95Maiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="238153029"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2026 00:24:18 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGXNA-000000006XV-0sh9;
	Sat, 25 Apr 2026 07:24:16 +0000
Date: Sat, 25 Apr 2026 15:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v7.2] BUILD SUCCESS
 50013fd0440d295726fc34ce284592ea876de5c8
Message-ID: <202604251552.KHhoAP1q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 8661C4656BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31652-lists,linux-renesas-soc=lfdr.de];
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.2
branch HEAD: 50013fd0440d295726fc34ce284592ea876de5c8  clk: renesas: r9a08g046: Add clock and resets for GBETH

elapsed time: 885m

configs tested: 71
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                  randconfig-001-20260425    gcc-13
i386                  randconfig-002-20260425    clang-20
i386                  randconfig-003-20260425    gcc-14
i386                  randconfig-004-20260425    gcc-14
i386                  randconfig-011-20260425    clang-20
i386                  randconfig-012-20260425    gcc-12
i386                  randconfig-013-20260425    gcc-14
i386                  randconfig-014-20260425    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260425    gcc-15.2.0
sparc                 randconfig-002-20260425    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64               randconfig-001-20260425    clang-23
sparc64               randconfig-002-20260425    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260425    gcc-13
x86_64      buildonly-randconfig-002-20260425    clang-20
x86_64      buildonly-randconfig-003-20260425    gcc-14
x86_64      buildonly-randconfig-004-20260425    clang-20
x86_64                randconfig-012-20260425    gcc-14
x86_64                randconfig-013-20260425    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

