Return-Path: <linux-renesas-soc+bounces-28100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8cBvA9Z/imkyLQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 01:46:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE6F115BBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 01:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38A4C3016252
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 00:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF94413D539;
	Tue, 10 Feb 2026 00:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vk1luzac"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1203186284
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 00:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770684370; cv=none; b=nvGo3t6jktQhNKD9RAMz5LWodFT41jA5UW+EIeJ8vngn1Db8LetIiys8Gdi2Aefgrk+UzSZDGGNHh1+zdwxkoqpWoxiGJyYVtqaszGBPUZiZ7gPaEX4SIiWCSdZwVzXxDOMq2KCxjG5v7flDg11gV36c41NGGRYeDtDIV/56b5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770684370; c=relaxed/simple;
	bh=umypo0Prw8eAujll3BF4yKPdsTSFarwybKXWIxT04I4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oPQ8w+suZFExMtFknWdlH3VKLufsizIdPcKK47RlucY/ZCni5PK5yIWTg4+aL9nPZHp1orZp/ePc05tAtthlBtboPRy54wZh7mABhCcsUkaYeqQA50hCChYm+gNU8OpQper8P51XIhJGrj2Kbc1uzuJn7MkEru58CTAVIDgleCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vk1luzac; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770684368; x=1802220368;
  h=date:from:to:cc:subject:message-id;
  bh=umypo0Prw8eAujll3BF4yKPdsTSFarwybKXWIxT04I4=;
  b=Vk1luzacZNQAMradkoDaZ9wbmIwbXb/cgAPEUmi90g7qJnx+Zxh4kkuv
   nDGP9nPi67SgSul2Q9ZbHgnkzbCSYTbwNhQmPIgWdtvW0XEn0lbjZ7Z/h
   3Yw8zvw1KpR379MsY0P8w1iW/4hbKttQFsiNZZ4YTcdlh/hVgKO7ODuvO
   Ka1MxYAv2kJM1LeyImFbtTGht4d3y2MRPKogXmAQCrqZ+ioP6kFRkcom3
   urPR3mpj52XixHrKXKzResO430gAwjoC5uDSqxBW3SNM3qudx7dZdydcK
   pxeXsktThrIqV7r59I0lFEJuGF2mF3rfL6gZlvyklDS8ZNd3Qhn16A5/h
   A==;
X-CSE-ConnectionGUID: 31rtBThzRvO4jeXgZaOx7Q==
X-CSE-MsgGUID: RV/3iKM2S/aFW3cHF63OGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71014772"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71014772"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 16:46:07 -0800
X-CSE-ConnectionGUID: dZ4JsAvzQzSbrlMPPBGnOQ==
X-CSE-MsgGUID: BHEq1QtYQyWxFD8AYfxRUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216271108"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 16:46:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpbtD-00000000oSW-0jgX;
	Tue, 10 Feb 2026 00:46:03 +0000
Date: Tue, 10 Feb 2026 08:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 e088fdb8a3706d87e6b78e5a0e41da77f01f9ce9
Message-ID: <202602100852.ovfDQOkx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-28100-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 6CE6F115BBE
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: e088fdb8a3706d87e6b78e5a0e41da77f01f9ce9  Merge tag 'v6.19' into renesas-devel

elapsed time: 933m

configs tested: 298
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    clang-16
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260209    gcc-10.5.0
arc                   randconfig-001-20260210    clang-20
arc                   randconfig-002-20260209    gcc-10.5.0
arc                   randconfig-002-20260210    clang-20
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    clang-16
arm                        clps711x_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20260209    gcc-10.5.0
arm                   randconfig-001-20260210    clang-20
arm                   randconfig-002-20260209    gcc-10.5.0
arm                   randconfig-002-20260210    clang-20
arm                   randconfig-003-20260209    gcc-10.5.0
arm                   randconfig-003-20260210    clang-20
arm                   randconfig-004-20260209    gcc-10.5.0
arm                   randconfig-004-20260210    clang-20
arm                           sama5_defconfig    clang-18
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260209    gcc-15.2.0
arm64                 randconfig-001-20260210    clang-22
arm64                 randconfig-002-20260209    gcc-15.2.0
arm64                 randconfig-002-20260210    clang-22
arm64                 randconfig-003-20260209    gcc-15.2.0
arm64                 randconfig-003-20260210    clang-22
arm64                 randconfig-004-20260209    gcc-15.2.0
arm64                 randconfig-004-20260210    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260209    gcc-15.2.0
csky                  randconfig-001-20260210    clang-22
csky                  randconfig-002-20260209    gcc-15.2.0
csky                  randconfig-002-20260210    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260209    clang-22
hexagon               randconfig-001-20260210    clang-22
hexagon               randconfig-002-20260209    clang-22
hexagon               randconfig-002-20260210    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260209    gcc-13
i386        buildonly-randconfig-001-20260210    clang-20
i386        buildonly-randconfig-002-20260209    gcc-13
i386        buildonly-randconfig-002-20260210    clang-20
i386        buildonly-randconfig-003-20260209    gcc-13
i386        buildonly-randconfig-003-20260210    clang-20
i386        buildonly-randconfig-004-20260209    gcc-13
i386        buildonly-randconfig-004-20260210    clang-20
i386        buildonly-randconfig-005-20260209    gcc-13
i386        buildonly-randconfig-005-20260210    clang-20
i386        buildonly-randconfig-006-20260209    gcc-13
i386        buildonly-randconfig-006-20260210    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260209    clang-20
i386                  randconfig-001-20260210    gcc-14
i386                  randconfig-002-20260209    clang-20
i386                  randconfig-002-20260210    gcc-14
i386                  randconfig-003-20260209    clang-20
i386                  randconfig-003-20260210    gcc-14
i386                  randconfig-004-20260209    clang-20
i386                  randconfig-004-20260210    gcc-14
i386                  randconfig-005-20260209    clang-20
i386                  randconfig-005-20260210    gcc-14
i386                  randconfig-006-20260209    clang-20
i386                  randconfig-006-20260210    gcc-14
i386                  randconfig-007-20260209    clang-20
i386                  randconfig-007-20260210    gcc-14
i386                  randconfig-011-20260209    clang-20
i386                  randconfig-011-20260209    gcc-14
i386                  randconfig-011-20260210    gcc-14
i386                  randconfig-012-20260209    gcc-14
i386                  randconfig-012-20260210    gcc-14
i386                  randconfig-013-20260209    clang-20
i386                  randconfig-013-20260209    gcc-14
i386                  randconfig-013-20260210    gcc-14
i386                  randconfig-014-20260209    gcc-14
i386                  randconfig-014-20260210    gcc-14
i386                  randconfig-015-20260209    gcc-14
i386                  randconfig-015-20260210    gcc-14
i386                  randconfig-016-20260209    gcc-14
i386                  randconfig-016-20260210    gcc-14
i386                  randconfig-017-20260209    gcc-14
i386                  randconfig-017-20260210    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260209    clang-22
loongarch             randconfig-001-20260210    clang-22
loongarch             randconfig-002-20260209    clang-22
loongarch             randconfig-002-20260210    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    clang-18
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                           ip27_defconfig    clang-18
mips                       lemote2f_defconfig    clang-16
mips                        qi_lb60_defconfig    clang-18
mips                          rb532_defconfig    clang-18
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260209    clang-22
nios2                 randconfig-001-20260210    clang-22
nios2                 randconfig-002-20260209    clang-22
nios2                 randconfig-002-20260210    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260209    gcc-12.5.0
parisc                randconfig-001-20260210    clang-19
parisc                randconfig-002-20260209    gcc-12.5.0
parisc                randconfig-002-20260210    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260209    gcc-12.5.0
powerpc               randconfig-001-20260210    clang-19
powerpc               randconfig-002-20260209    gcc-12.5.0
powerpc               randconfig-002-20260210    clang-19
powerpc                    socrates_defconfig    clang-18
powerpc                     stx_gp3_defconfig    clang-18
powerpc64             randconfig-001-20260209    gcc-12.5.0
powerpc64             randconfig-001-20260210    clang-19
powerpc64             randconfig-002-20260209    gcc-12.5.0
powerpc64             randconfig-002-20260210    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260209    gcc-12.5.0
riscv                 randconfig-001-20260210    gcc-11.5.0
riscv                 randconfig-002-20260209    gcc-12.5.0
riscv                 randconfig-002-20260210    gcc-11.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260209    gcc-12.5.0
s390                  randconfig-001-20260210    gcc-11.5.0
s390                  randconfig-002-20260209    gcc-12.5.0
s390                  randconfig-002-20260210    gcc-11.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          polaris_defconfig    gcc-15.2.0
sh                    randconfig-001-20260209    gcc-12.5.0
sh                    randconfig-001-20260210    gcc-11.5.0
sh                    randconfig-002-20260209    gcc-12.5.0
sh                    randconfig-002-20260210    gcc-11.5.0
sh                          sdk7786_defconfig    clang-16
sh                           se7343_defconfig    clang-18
sh                           se7750_defconfig    clang-16
sh                             sh03_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260209    gcc-11.5.0
sparc                 randconfig-001-20260209    gcc-8.5.0
sparc                 randconfig-001-20260210    gcc-14.3.0
sparc                 randconfig-002-20260209    gcc-11.5.0
sparc                 randconfig-002-20260210    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260209    clang-22
sparc64               randconfig-001-20260209    gcc-11.5.0
sparc64               randconfig-001-20260210    gcc-14.3.0
sparc64               randconfig-002-20260209    clang-22
sparc64               randconfig-002-20260209    gcc-11.5.0
sparc64               randconfig-002-20260210    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260209    gcc-11.5.0
um                    randconfig-001-20260209    gcc-14
um                    randconfig-001-20260210    gcc-14.3.0
um                    randconfig-002-20260209    clang-18
um                    randconfig-002-20260209    gcc-11.5.0
um                    randconfig-002-20260210    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260209    clang-20
x86_64      buildonly-randconfig-001-20260209    gcc-14
x86_64      buildonly-randconfig-001-20260210    gcc-14
x86_64      buildonly-randconfig-002-20260209    clang-20
x86_64      buildonly-randconfig-002-20260209    gcc-14
x86_64      buildonly-randconfig-002-20260210    gcc-14
x86_64      buildonly-randconfig-003-20260209    clang-20
x86_64      buildonly-randconfig-003-20260210    gcc-14
x86_64      buildonly-randconfig-004-20260209    clang-20
x86_64      buildonly-randconfig-004-20260210    gcc-14
x86_64      buildonly-randconfig-005-20260209    clang-20
x86_64      buildonly-randconfig-005-20260209    gcc-14
x86_64      buildonly-randconfig-005-20260210    gcc-14
x86_64      buildonly-randconfig-006-20260209    clang-20
x86_64      buildonly-randconfig-006-20260210    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260209    gcc-14
x86_64                randconfig-001-20260210    gcc-14
x86_64                randconfig-002-20260209    gcc-14
x86_64                randconfig-002-20260210    gcc-14
x86_64                randconfig-003-20260209    gcc-14
x86_64                randconfig-003-20260210    gcc-14
x86_64                randconfig-004-20260209    gcc-14
x86_64                randconfig-004-20260210    gcc-14
x86_64                randconfig-005-20260209    gcc-14
x86_64                randconfig-005-20260210    gcc-14
x86_64                randconfig-006-20260209    gcc-14
x86_64                randconfig-006-20260210    gcc-14
x86_64                randconfig-011-20260209    clang-20
x86_64                randconfig-012-20260209    clang-20
x86_64                randconfig-013-20260209    clang-20
x86_64                randconfig-013-20260209    gcc-14
x86_64                randconfig-014-20260209    clang-20
x86_64                randconfig-015-20260209    clang-20
x86_64                randconfig-015-20260209    gcc-14
x86_64                randconfig-016-20260209    clang-20
x86_64                randconfig-016-20260209    gcc-14
x86_64                randconfig-071-20260209    gcc-14
x86_64                randconfig-071-20260210    clang-20
x86_64                randconfig-072-20260209    gcc-14
x86_64                randconfig-072-20260210    clang-20
x86_64                randconfig-073-20260209    gcc-14
x86_64                randconfig-073-20260210    clang-20
x86_64                randconfig-074-20260209    gcc-14
x86_64                randconfig-074-20260210    clang-20
x86_64                randconfig-075-20260209    gcc-14
x86_64                randconfig-075-20260210    clang-20
x86_64                randconfig-076-20260209    gcc-14
x86_64                randconfig-076-20260210    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                  cadence_csp_defconfig    clang-16
xtensa                randconfig-001-20260209    gcc-11.5.0
xtensa                randconfig-001-20260209    gcc-8.5.0
xtensa                randconfig-001-20260210    gcc-14.3.0
xtensa                randconfig-002-20260209    gcc-11.5.0
xtensa                randconfig-002-20260209    gcc-8.5.0
xtensa                randconfig-002-20260210    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

