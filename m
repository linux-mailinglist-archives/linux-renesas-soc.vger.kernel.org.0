Return-Path: <linux-renesas-soc+bounces-31646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J2fbLHxQ7GlTXQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 07:26:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2C465084
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 07:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BFE430078FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 05:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0328018DB1F;
	Sat, 25 Apr 2026 05:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fg47+7FI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BAF3597B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Apr 2026 05:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094776; cv=none; b=VpMpughqe9ShG/+m1dJBZfsU9ld0Np3EuJSfrGAGt1XQfn6iS/YINyRbzIsCq04YjU4fOqOGBm7+dfIIUPtxBcCkn/2wGfzv4IJ6jzWEkUD5Yj5hnRICKfoX3T1d+mBkq6P48Q6yFkRSOx0ZQUHtOyAfRvE8DrOycDrs5frqVG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094776; c=relaxed/simple;
	bh=duBQdJZLI9mrT04fZKxqQSCJuqMhhscqt7oBNwKjPyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ppVIrgexsvPfpi0WutKCcYOg02TFxhfeyDPMVXn+mrfZydaijRMnh309xzyvpKzSfoT2ihAtkXQH5BEaVJI5aVk2kMGZPL6lP43z0p5uMb2jCNh9E4WE+Juh644jEEZJd+8hwXppeUFwPqQNF7/cCgHAfKcWt0DX/13eaCZItqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fg47+7FI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777094775; x=1808630775;
  h=date:from:to:cc:subject:message-id;
  bh=duBQdJZLI9mrT04fZKxqQSCJuqMhhscqt7oBNwKjPyU=;
  b=fg47+7FIVTRtX/2Hs0t/z51PxImHnERSvUIezUlSN7v3jO2Y5+JtE24A
   0eTAWqnJ9aO78ltmyO3m+FyqSHfe6NLdEu+c4TyUEFc3waR7Ys866/48Y
   LuESTfg/v+0/2wsboZtXqmIb96fRb8dInqeHRtxds1LQMo0Orjw19DGLG
   VUW88psPXm7KYamNGwuZQx4EbaAZlumeL8MW0ESSAvgJXG8KPN+g5H/F4
   jUp1ztwRU1O2vDAWhuTDf6tbGwVrSZAtaJrj83jXdVEtarerz8I4pgQ2m
   5FHBXVkyXmRU4YbrlyYphWfE+REiOsE0GBXAOl+nBnQMBTqEEm0/7TUv4
   g==;
X-CSE-ConnectionGUID: MEfp3kjlRV6jd0G5n4n7CQ==
X-CSE-MsgGUID: j+NXr/B5Tyu4bH75+z8x/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="95635205"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="95635205"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 22:26:15 -0700
X-CSE-ConnectionGUID: qQM182OrTMupgbWPF+0lgA==
X-CSE-MsgGUID: RKfdHQMfRui7i8urBmjhxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="234924569"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2026 22:26:13 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGVWt-000000006TN-0rR7;
	Sat, 25 Apr 2026 05:26:11 +0000
Date: Sat, 25 Apr 2026 13:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.2] BUILD SUCCESS
 6a03eacc951a572fdc480d485801fce2e9db3776
Message-ID: <202604251332.2tHKaPLZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6CC2C465084
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31646-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.2
branch HEAD: 6a03eacc951a572fdc480d485801fce2e9db3776  arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

elapsed time: 766m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
i386        randconfig-001-20260425    gcc-13
i386        randconfig-002-20260425    clang-20
i386        randconfig-003-20260425    gcc-14
i386        randconfig-004-20260425    gcc-14
i386        randconfig-005-20260425    clang-20
i386        randconfig-011-20260425    clang-20
i386        randconfig-012-20260425    gcc-12
i386        randconfig-013-20260425    gcc-14
i386        randconfig-014-20260425    gcc-14
i386        randconfig-015-20260425    clang-20
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
mips               db1xxx_defconfig    clang-23
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260425    gcc-14.3.0
parisc      randconfig-002-20260425    gcc-8.5.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260425    gcc-10.5.0
powerpc     randconfig-002-20260425    gcc-9.5.0
powerpc64   randconfig-001-20260425    clang-23
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64      randconfig-011-20260425    clang-20
x86_64      randconfig-012-20260425    gcc-14
x86_64      randconfig-013-20260425    gcc-14
x86_64      randconfig-014-20260425    gcc-14
x86_64      randconfig-015-20260425    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

