Return-Path: <linux-renesas-soc+bounces-28508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMWiMVDWoGl0nQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 00:25:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E762E1B0E10
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 00:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BB40301075F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 23:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433E78287E;
	Thu, 26 Feb 2026 23:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+mQ0zVF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E531A7E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 23:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772148299; cv=none; b=S7g0MmYfpvAdW1VTU/CuLS6BoTMEUM3w30/Vcze9co5wdmrGbxTfSqjvOXx93zHvyTkq1kWJksc1OsSdipr7DUEWc8dvYxvuo9dHVVQSNWb2GU4peDcO/RF+lMy6E1b2R8yFcmlGOFiZoVrE0Wv1G9uxnbytyQv86Uj9wDNPMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772148299; c=relaxed/simple;
	bh=FuEta//oJKsa72VDEvgaXWfxRe2WxzqgYS6hfPe+HOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RFJ3vKtwwevSb+cNifZBVl9MuJKGKsdxFUgg8CbIaNqHf6vh2IfGCDLk7qgadxO4nI0FESpr3g0KOl9JZCJK5hcAenKVtzZW/HFahW+gmTcBj4SGn5qDSTAjhS9gQJnKPieGZYsntFlPld48e8Pw3x5Kb7SeFStcsR4ib2ErJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+mQ0zVF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772148298; x=1803684298;
  h=date:from:to:cc:subject:message-id;
  bh=FuEta//oJKsa72VDEvgaXWfxRe2WxzqgYS6hfPe+HOA=;
  b=i+mQ0zVF//ftiR9ppfEWz6q2uSoHTYBQGHgncXPoKAC6C2EgDUGkERhR
   DZ3N+i48sv9CH/J1ana2IJHRU/M1EhyBDYJbTNDq6A25glcxgWgttztwd
   MvwTlwb2P9c6vv3DBCC63khM2WYhHcX7tKJe1LzFwAcq+dDjk8+gab96O
   GNVdOsaiacN4Y9BHdN/qXm/Qv9p9C4+VCtcUsNOG6mhAd+s3Y2glxQ/2t
   E5W8O5EUMtYwuAmdiOYtpSIwSnhaUcmzbl2CVQJmlGqoa8HBlJJJ3kD2z
   dYK9fB+VpYDnHxWlwnW28ypHZSaWkghOsEy2zjZj5u4a1WXWId1hk7ym8
   w==;
X-CSE-ConnectionGUID: JoJEc+ZGTJOFc9A/Zs+Ktw==
X-CSE-MsgGUID: TkpVfgVgTFu0ipXDhh11rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84580423"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="84580423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 15:24:57 -0800
X-CSE-ConnectionGUID: 7BP46VvjRpG53rbvAivlgQ==
X-CSE-MsgGUID: sGxp43nrQRi6/fadEEK6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214631619"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 15:24:55 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvkiW-000000009zr-0BPL;
	Thu, 26 Feb 2026 23:24:29 +0000
Date: Fri, 27 Feb 2026 07:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v7.0-rc1]
 BUILD SUCCESS fe5e834c85108097561ede1966e38dcea231fb82
Message-ID: <202602270756.bbouCCx1-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28508-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E762E1B0E10
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v7.0-rc1
branch HEAD: fe5e834c85108097561ede1966e38dcea231fb82  arm64: dts: renesas: white-hawk-single: cn3006: Add overlay for MSIOF2

elapsed time: 762m

configs tested: 363
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260226    gcc-15.2.0
arc                   randconfig-001-20260227    gcc-8.5.0
arc                   randconfig-002-20260226    gcc-15.2.0
arc                   randconfig-002-20260226    gcc-8.5.0
arc                   randconfig-002-20260227    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    clang-18
arm                          ep93xx_defconfig    clang-23
arm                           imxrt_defconfig    clang-23
arm                           imxrt_defconfig    gcc-15.2.0
arm                          pxa910_defconfig    gcc-15.2.0
arm                   randconfig-001-20260226    gcc-10.5.0
arm                   randconfig-001-20260226    gcc-15.2.0
arm                   randconfig-001-20260227    gcc-8.5.0
arm                   randconfig-002-20260226    gcc-11.5.0
arm                   randconfig-002-20260226    gcc-15.2.0
arm                   randconfig-002-20260227    gcc-8.5.0
arm                   randconfig-003-20260226    gcc-10.5.0
arm                   randconfig-003-20260226    gcc-15.2.0
arm                   randconfig-003-20260227    gcc-8.5.0
arm                   randconfig-004-20260226    clang-16
arm                   randconfig-004-20260226    gcc-15.2.0
arm                   randconfig-004-20260227    gcc-8.5.0
arm                             rpc_defconfig    clang-18
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260226    gcc-14.3.0
arm64                 randconfig-001-20260227    clang-23
arm64                 randconfig-002-20260226    gcc-14.3.0
arm64                 randconfig-002-20260226    gcc-8.5.0
arm64                 randconfig-002-20260227    clang-23
arm64                 randconfig-003-20260226    clang-16
arm64                 randconfig-003-20260226    gcc-14.3.0
arm64                 randconfig-003-20260227    clang-23
arm64                 randconfig-004-20260226    clang-23
arm64                 randconfig-004-20260226    gcc-14.3.0
arm64                 randconfig-004-20260227    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260226    gcc-14.3.0
csky                  randconfig-001-20260226    gcc-9.5.0
csky                  randconfig-001-20260227    clang-23
csky                  randconfig-002-20260226    gcc-14.3.0
csky                  randconfig-002-20260227    clang-23
hexagon                          alldefconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260226    clang-23
hexagon               randconfig-001-20260227    clang-23
hexagon               randconfig-002-20260226    clang-23
hexagon               randconfig-002-20260227    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260226    clang-20
i386        buildonly-randconfig-001-20260226    gcc-14
i386        buildonly-randconfig-001-20260227    clang-20
i386        buildonly-randconfig-002-20260226    clang-20
i386        buildonly-randconfig-002-20260226    gcc-14
i386        buildonly-randconfig-002-20260227    clang-20
i386        buildonly-randconfig-003-20260226    clang-20
i386        buildonly-randconfig-003-20260226    gcc-14
i386        buildonly-randconfig-003-20260227    clang-20
i386        buildonly-randconfig-004-20260226    gcc-14
i386        buildonly-randconfig-004-20260227    clang-20
i386        buildonly-randconfig-005-20260226    gcc-14
i386        buildonly-randconfig-005-20260227    clang-20
i386        buildonly-randconfig-006-20260226    gcc-14
i386        buildonly-randconfig-006-20260227    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260226    clang-20
i386                  randconfig-001-20260226    gcc-14
i386                  randconfig-001-20260227    clang-20
i386                  randconfig-002-20260226    clang-20
i386                  randconfig-002-20260227    clang-20
i386                  randconfig-003-20260226    clang-20
i386                  randconfig-003-20260227    clang-20
i386                  randconfig-004-20260226    clang-20
i386                  randconfig-004-20260227    clang-20
i386                  randconfig-005-20260226    clang-20
i386                  randconfig-005-20260226    gcc-13
i386                  randconfig-005-20260227    clang-20
i386                  randconfig-006-20260226    clang-20
i386                  randconfig-006-20260227    clang-20
i386                  randconfig-007-20260226    clang-20
i386                  randconfig-007-20260227    clang-20
i386                  randconfig-011-20260226    clang-20
i386                  randconfig-011-20260226    gcc-14
i386                  randconfig-011-20260227    gcc-14
i386                  randconfig-012-20260226    clang-20
i386                  randconfig-012-20260226    gcc-14
i386                  randconfig-012-20260227    gcc-14
i386                  randconfig-013-20260226    gcc-12
i386                  randconfig-013-20260226    gcc-14
i386                  randconfig-013-20260227    gcc-14
i386                  randconfig-014-20260226    gcc-14
i386                  randconfig-014-20260227    gcc-14
i386                  randconfig-015-20260226    gcc-14
i386                  randconfig-015-20260227    gcc-14
i386                  randconfig-016-20260226    clang-20
i386                  randconfig-016-20260226    gcc-14
i386                  randconfig-016-20260227    gcc-14
i386                  randconfig-017-20260226    gcc-14
i386                  randconfig-017-20260227    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260226    clang-23
loongarch             randconfig-001-20260226    gcc-15.2.0
loongarch             randconfig-001-20260227    clang-23
loongarch             randconfig-002-20260226    clang-20
loongarch             randconfig-002-20260226    clang-23
loongarch             randconfig-002-20260227    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                          hp300_defconfig    gcc-15.2.0
m68k                       m5275evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    clang-18
m68k                          sun3x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           jazz_defconfig    gcc-15.2.0
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260226    clang-23
nios2                 randconfig-001-20260226    gcc-11.5.0
nios2                 randconfig-001-20260227    clang-23
nios2                 randconfig-002-20260226    clang-23
nios2                 randconfig-002-20260226    gcc-11.5.0
nios2                 randconfig-002-20260227    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                   de0_nano_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                    or1ksim_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260226    clang-16
parisc                randconfig-001-20260226    gcc-14.3.0
parisc                randconfig-001-20260227    clang-17
parisc                randconfig-002-20260226    clang-16
parisc                randconfig-002-20260226    gcc-12.5.0
parisc                randconfig-002-20260227    clang-17
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    clang-23
powerpc                 canyonlands_defconfig    gcc-15.2.0
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                 mpc834x_itx_defconfig    gcc-15.2.0
powerpc                  mpc866_ads_defconfig    clang-18
powerpc               randconfig-001-20260226    clang-16
powerpc               randconfig-001-20260226    gcc-11.5.0
powerpc               randconfig-001-20260227    clang-17
powerpc               randconfig-002-20260226    clang-16
powerpc               randconfig-002-20260227    clang-17
powerpc                  storcenter_defconfig    clang-18
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260226    clang-16
powerpc64             randconfig-001-20260226    gcc-8.5.0
powerpc64             randconfig-001-20260227    clang-17
powerpc64             randconfig-002-20260226    clang-16
powerpc64             randconfig-002-20260226    clang-23
powerpc64             randconfig-002-20260227    clang-17
riscv                            alldefconfig    clang-18
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_k210_defconfig    clang-23
riscv                 randconfig-001-20260227    gcc-12.5.0
riscv                 randconfig-002-20260227    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260227    gcc-12.5.0
s390                  randconfig-002-20260227    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    gcc-15.2.0
sh                             espt_defconfig    clang-18
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                            migor_defconfig    clang-18
sh                          r7780mp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260227    gcc-12.5.0
sh                    randconfig-002-20260227    gcc-12.5.0
sh                          rsk7203_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7750_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260226    gcc-8.5.0
sparc                 randconfig-001-20260227    clang-23
sparc                 randconfig-002-20260226    gcc-8.5.0
sparc                 randconfig-002-20260227    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260226    gcc-8.5.0
sparc64               randconfig-001-20260227    clang-23
sparc64               randconfig-002-20260226    gcc-8.5.0
sparc64               randconfig-002-20260227    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260226    gcc-8.5.0
um                    randconfig-001-20260227    clang-23
um                    randconfig-002-20260226    gcc-8.5.0
um                    randconfig-002-20260227    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260226    gcc-14
x86_64      buildonly-randconfig-001-20260227    gcc-14
x86_64      buildonly-randconfig-002-20260226    clang-20
x86_64      buildonly-randconfig-002-20260226    gcc-14
x86_64      buildonly-randconfig-002-20260227    gcc-14
x86_64      buildonly-randconfig-003-20260226    gcc-14
x86_64      buildonly-randconfig-003-20260227    gcc-14
x86_64      buildonly-randconfig-004-20260226    clang-20
x86_64      buildonly-randconfig-004-20260226    gcc-14
x86_64      buildonly-randconfig-004-20260227    gcc-14
x86_64      buildonly-randconfig-005-20260226    gcc-14
x86_64      buildonly-randconfig-005-20260227    gcc-14
x86_64      buildonly-randconfig-006-20260226    gcc-13
x86_64      buildonly-randconfig-006-20260226    gcc-14
x86_64      buildonly-randconfig-006-20260227    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260226    gcc-14
x86_64                randconfig-001-20260227    gcc-13
x86_64                randconfig-002-20260226    gcc-14
x86_64                randconfig-002-20260227    gcc-13
x86_64                randconfig-003-20260226    gcc-14
x86_64                randconfig-003-20260227    gcc-13
x86_64                randconfig-004-20260226    gcc-14
x86_64                randconfig-004-20260227    gcc-13
x86_64                randconfig-005-20260226    clang-20
x86_64                randconfig-005-20260227    gcc-13
x86_64                randconfig-006-20260226    gcc-14
x86_64                randconfig-006-20260227    gcc-13
x86_64                randconfig-011-20260226    clang-20
x86_64                randconfig-011-20260226    gcc-14
x86_64                randconfig-011-20260227    gcc-14
x86_64                randconfig-012-20260226    clang-20
x86_64                randconfig-012-20260226    gcc-14
x86_64                randconfig-012-20260227    gcc-14
x86_64                randconfig-013-20260226    clang-20
x86_64                randconfig-013-20260226    gcc-14
x86_64                randconfig-013-20260227    gcc-14
x86_64                randconfig-014-20260226    clang-20
x86_64                randconfig-014-20260226    gcc-14
x86_64                randconfig-014-20260227    gcc-14
x86_64                randconfig-015-20260226    clang-20
x86_64                randconfig-015-20260226    gcc-14
x86_64                randconfig-015-20260227    gcc-14
x86_64                randconfig-016-20260226    gcc-14
x86_64                randconfig-016-20260227    gcc-14
x86_64                randconfig-071-20260226    clang-20
x86_64                randconfig-071-20260226    gcc-14
x86_64                randconfig-071-20260227    gcc-14
x86_64                randconfig-072-20260226    clang-20
x86_64                randconfig-072-20260226    gcc-14
x86_64                randconfig-072-20260227    gcc-14
x86_64                randconfig-073-20260226    gcc-14
x86_64                randconfig-073-20260227    gcc-14
x86_64                randconfig-074-20260226    clang-20
x86_64                randconfig-074-20260226    gcc-14
x86_64                randconfig-074-20260227    gcc-14
x86_64                randconfig-075-20260226    gcc-13
x86_64                randconfig-075-20260226    gcc-14
x86_64                randconfig-075-20260227    gcc-14
x86_64                randconfig-076-20260226    clang-20
x86_64                randconfig-076-20260226    gcc-14
x86_64                randconfig-076-20260227    gcc-14
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
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                  cadence_csp_defconfig    gcc-15.2.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260226    gcc-8.5.0
xtensa                randconfig-001-20260227    clang-23
xtensa                randconfig-002-20260226    gcc-8.5.0
xtensa                randconfig-002-20260227    clang-23
xtensa                         virt_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

