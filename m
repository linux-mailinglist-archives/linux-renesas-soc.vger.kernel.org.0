Return-Path: <linux-renesas-soc+bounces-32695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D8SJbC4B2o7EAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 02:22:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE9559878
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 02:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 792AF3006813
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 00:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809B92C859;
	Sat, 16 May 2026 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMSW3pjg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97315B998
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 00:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778890924; cv=none; b=qdRVc0opw4eIUhRIs73Md4vZJWm4Nfg04SrWFaE2OCm2uIktKjYLELndP+V0VhmM5D+cOqwh747aqqq9/dCrIHhplzon3T9RCGg+9lU2Mm4Wp7II+Q7P3VHmN3tn+TrRIspebsFlaFKylnpdjWUQbDc+rt5C3MNBdl+5j4Wlzn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778890924; c=relaxed/simple;
	bh=uxG7kMgsAphFKKntx7brqP5nbZks9uQACye7EXFKXt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YCgtuWVmbjV+SB5fVLoeEkKjuAha2zOJKd//qfnjGtSlHBM3iN86zRm0hJmxbgUqp07FhxWncPtL07evuuk8QlIQJLVVIUnKtA5xeh8OJ+fcj8+29f0iVAX7mNkMTTCPNWBbEcd42XgdROLN0LrJwz56oVFRDtKJyYLuQqLsx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMSW3pjg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778890921; x=1810426921;
  h=date:from:to:cc:subject:message-id;
  bh=uxG7kMgsAphFKKntx7brqP5nbZks9uQACye7EXFKXt4=;
  b=nMSW3pjggKkY/2vaK7CXdRVrsO0qBpvKv2BBoLINjxOMY6BPeG8BfYnQ
   fcyXdnfhJJ6oajUzbCBy+QuZ2eHxO3q5K+FARKfuP+FNJs9tmMGyh3WLn
   q0zo9Nv89xLRAQ5x5qxpvkGMCC7L+6Wtg98TMyGXohwfty51mQ+bjQvOW
   Ag8g+/WEvbQsFC5iZ3QkPLjFaLlXyJHCDGV7TmakfXDoVsVR3dfR76nXr
   rO/hbM3smQrFsnNi5/hQNp4p+960T5BLxnUTv3EoCamYVU0wywfy8tetE
   DG+AI8xBNmSjl61FkpxiZHNnYZd5EJgKjInkJlYorzzBWdndi8u+7a+6Z
   g==;
X-CSE-ConnectionGUID: 5GE0FO4yQuKIJhUsl3zy7Q==
X-CSE-MsgGUID: qC/ma9ooSjeAyJ26kMTZhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79891506"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79891506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 17:22:00 -0700
X-CSE-ConnectionGUID: OzpsyPFnTA2aSF/oCoBIag==
X-CSE-MsgGUID: FnswkfpyQu2r+8iYCUjsJw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2026 17:21:59 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO2mz-000000000I9-0Pxv;
	Sat, 16 May 2026 00:21:57 +0000
Date: Sat, 16 May 2026 08:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-r8a73a4-dt-binding-defs] BUILD
 SUCCESS 2abdc3dcf9780d070e55a99fdf8f93440c798b84
Message-ID: <202605160854.Cq67nKso-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: B7DE9559878
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32695-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-r8a73a4-dt-binding-defs
branch HEAD: 2abdc3dcf9780d070e55a99fdf8f93440c798b84  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6

elapsed time: 847m

configs tested: 324
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
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260515    gcc-13.4.0
arc                   randconfig-001-20260516    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260515    gcc-8.5.0
arc                   randconfig-002-20260516    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260515    clang-23
arm                   randconfig-001-20260516    gcc-8.5.0
arm                            randconfig-002    gcc-11.5.0
arm                   randconfig-002-20260515    clang-23
arm                   randconfig-002-20260516    gcc-8.5.0
arm                            randconfig-003    clang-20
arm                   randconfig-003-20260515    clang-23
arm                   randconfig-003-20260516    gcc-8.5.0
arm                            randconfig-004    gcc-14.3.0
arm                   randconfig-004-20260515    gcc-14.3.0
arm                   randconfig-004-20260516    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260515    clang-16
arm64                 randconfig-001-20260516    gcc-9.5.0
arm64                 randconfig-002-20260515    gcc-10.5.0
arm64                 randconfig-002-20260516    gcc-9.5.0
arm64                 randconfig-003-20260515    gcc-11.5.0
arm64                 randconfig-003-20260516    gcc-9.5.0
arm64                 randconfig-004-20260515    gcc-11.5.0
arm64                 randconfig-004-20260516    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260515    gcc-10.5.0
csky                  randconfig-001-20260516    gcc-9.5.0
csky                  randconfig-002-20260515    gcc-15.2.0
csky                  randconfig-002-20260516    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260515    clang-23
hexagon               randconfig-001-20260516    clang-23
hexagon               randconfig-001-20260516    gcc-11.5.0
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260515    clang-23
hexagon               randconfig-002-20260516    clang-16
hexagon               randconfig-002-20260516    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260515    gcc-14
i386        buildonly-randconfig-001-20260516    clang-20
i386        buildonly-randconfig-002-20260515    gcc-14
i386        buildonly-randconfig-002-20260516    clang-20
i386        buildonly-randconfig-003-20260515    gcc-12
i386        buildonly-randconfig-003-20260516    clang-20
i386        buildonly-randconfig-004-20260515    gcc-12
i386        buildonly-randconfig-004-20260516    clang-20
i386        buildonly-randconfig-005-20260515    gcc-14
i386        buildonly-randconfig-005-20260516    clang-20
i386        buildonly-randconfig-006-20260515    clang-20
i386        buildonly-randconfig-006-20260516    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260515    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260515    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260515    clang-20
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260515    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260515    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260515    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260515    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260515    clang-20
i386                  randconfig-011-20260516    gcc-14
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260515    gcc-14
i386                  randconfig-012-20260516    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260515    gcc-14
i386                  randconfig-013-20260516    gcc-14
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260515    clang-20
i386                  randconfig-014-20260516    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260515    clang-20
i386                  randconfig-015-20260516    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260515    clang-20
i386                  randconfig-016-20260516    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260515    clang-20
i386                  randconfig-017-20260516    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    clang-18
loongarch             randconfig-001-20260515    gcc-15.2.0
loongarch             randconfig-001-20260516    gcc-11.5.0
loongarch             randconfig-001-20260516    gcc-15.2.0
loongarch                      randconfig-002    gcc-13.4.0
loongarch             randconfig-002-20260515    clang-23
loongarch             randconfig-002-20260516    clang-18
loongarch             randconfig-002-20260516    gcc-11.5.0
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
mips                 decstation_r4k_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260515    gcc-11.5.0
nios2                 randconfig-001-20260516    gcc-10.5.0
nios2                 randconfig-001-20260516    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260515    gcc-8.5.0
nios2                 randconfig-002-20260516    gcc-11.5.0
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
parisc                randconfig-001-20260516    gcc-12.5.0
parisc                randconfig-002-20260516    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260516    gcc-12.5.0
powerpc               randconfig-002-20260516    gcc-12.5.0
powerpc64             randconfig-001-20260516    gcc-12.5.0
powerpc64             randconfig-002-20260516    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260515    clang-23
riscv                 randconfig-001-20260516    gcc-15.2.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260515    clang-23
riscv                 randconfig-002-20260516    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260515    clang-18
s390                  randconfig-001-20260516    gcc-15.2.0
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260515    clang-23
s390                  randconfig-002-20260516    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260515    gcc-13.4.0
sh                    randconfig-001-20260516    gcc-15.2.0
sh                             randconfig-002    gcc-14.3.0
sh                    randconfig-002-20260515    gcc-15.2.0
sh                    randconfig-002-20260516    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260515    gcc-8.5.0
sparc                 randconfig-001-20260516    gcc-8.5.0
sparc                 randconfig-002-20260515    gcc-15.2.0
sparc                 randconfig-002-20260516    gcc-15.2.0
sparc                 randconfig-002-20260516    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260515    clang-20
sparc64               randconfig-001-20260516    gcc-10.5.0
sparc64               randconfig-001-20260516    gcc-8.5.0
sparc64               randconfig-002-20260515    clang-20
sparc64               randconfig-002-20260516    clang-20
sparc64               randconfig-002-20260516    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260515    gcc-14
um                    randconfig-001-20260516    clang-16
um                    randconfig-001-20260516    gcc-8.5.0
um                    randconfig-002-20260515    gcc-14
um                    randconfig-002-20260516    clang-18
um                    randconfig-002-20260516    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260515    clang-20
x86_64      buildonly-randconfig-001-20260516    gcc-14
x86_64      buildonly-randconfig-002-20260515    gcc-14
x86_64      buildonly-randconfig-002-20260516    gcc-14
x86_64      buildonly-randconfig-003-20260515    gcc-14
x86_64      buildonly-randconfig-003-20260516    gcc-14
x86_64      buildonly-randconfig-004-20260515    gcc-12
x86_64      buildonly-randconfig-004-20260516    gcc-14
x86_64      buildonly-randconfig-005-20260515    gcc-14
x86_64      buildonly-randconfig-005-20260516    gcc-14
x86_64      buildonly-randconfig-006-20260515    clang-20
x86_64      buildonly-randconfig-006-20260516    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260515    clang-20
x86_64                randconfig-001-20260516    gcc-14
x86_64                randconfig-002-20260515    clang-20
x86_64                randconfig-002-20260516    gcc-14
x86_64                randconfig-003-20260515    gcc-13
x86_64                randconfig-003-20260516    gcc-14
x86_64                randconfig-004-20260515    clang-20
x86_64                randconfig-004-20260516    gcc-14
x86_64                randconfig-005-20260515    clang-20
x86_64                randconfig-005-20260516    gcc-14
x86_64                randconfig-006-20260515    clang-20
x86_64                randconfig-006-20260516    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260515    clang-20
x86_64                randconfig-011-20260516    clang-20
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260515    clang-20
x86_64                randconfig-012-20260516    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260515    clang-20
x86_64                randconfig-013-20260516    clang-20
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260515    clang-20
x86_64                randconfig-014-20260516    clang-20
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260515    gcc-14
x86_64                randconfig-015-20260516    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260515    gcc-14
x86_64                randconfig-016-20260516    clang-20
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260515    clang-20
x86_64                randconfig-071-20260516    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260515    gcc-14
x86_64                randconfig-072-20260516    gcc-14
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260515    gcc-14
x86_64                randconfig-073-20260516    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260515    clang-20
x86_64                randconfig-074-20260516    gcc-14
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260515    gcc-12
x86_64                randconfig-075-20260516    gcc-14
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260515    clang-20
x86_64                randconfig-076-20260516    gcc-14
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
xtensa                randconfig-001-20260515    gcc-9.5.0
xtensa                randconfig-001-20260516    gcc-13.4.0
xtensa                randconfig-001-20260516    gcc-8.5.0
xtensa                randconfig-002-20260515    gcc-11.5.0
xtensa                randconfig-002-20260516    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

