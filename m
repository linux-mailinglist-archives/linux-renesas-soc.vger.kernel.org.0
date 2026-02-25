Return-Path: <linux-renesas-soc+bounces-28445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGUOKnVsnmkGVQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 04:28:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D24D191328
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 04:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8818F3017DCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 03:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB712AE68;
	Wed, 25 Feb 2026 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DR74/5YZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC722AD37
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 03:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771990129; cv=none; b=N03xPbS1ZJx+L2r2r/XoNZHL2jUVJE0i7H5+ySxHFKi/OSA6y4rCIl0Z9GazBs9s+fy8tXThk9h0ViCua9F6yxyutsmdy1I3oGvdFl2l8ssJXD7zjxkY1AHfrF70kpCq1DBGltuZzf4YIt8PrZP3ncNjBdTi48rbconxAT3ltWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771990129; c=relaxed/simple;
	bh=jn7dRYzsFQC1tIF7ugVU7C+7LPd1lXTL2XsgNsZA0BU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ARJ4wTb1pn50gTh+veZCqQsA6wrzA4jR35686T684PRmPB2eix+m1ilFpJabHOEhGXfxrJnOvWU5sRQAAMd53AlTnU4BDGscHZruLxpskRn6UNK4+elRRkJlvEcYb5ocdaYdDiyvympJITZUrRncjRqIC1mvD17F695M64aV0vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DR74/5YZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771990128; x=1803526128;
  h=date:from:to:cc:subject:message-id;
  bh=jn7dRYzsFQC1tIF7ugVU7C+7LPd1lXTL2XsgNsZA0BU=;
  b=DR74/5YZ2A/0iXTjrufK8EU9YQUH5hlr2uxmirY+yBwC/w2csEoJLBJ5
   YRC8C2sDauCxubml/XTXQmrlnC8Mps9mfaQ+2kdb+n2S78jnfjyK5cKNM
   aGGVwp07L619KJNuWajLZzrq2F5LR0e/CEghdfX9bw5YbB3BbRvNid5A2
   AzrVSLCrvmsbByiJcZ11KBe9eHWsHEx6W1GsydPQf7keaT++o+oLIfw3L
   bxe0sqITS+Q9NrMsiG0Gy7ok9D6H8/Qqn6F6m//bBVSp4PPmhwcl39awm
   3dx6CZBilMZru9i3vhIVnukIonXh5t1/1CHcoe0AMv+QKEpcUm6/Q3UbQ
   A==;
X-CSE-ConnectionGUID: rKn+L/hlRmab5YgrZ6uwEQ==
X-CSE-MsgGUID: AIEmWnI/QzyZ0lctRVVVGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72230915"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72230915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 19:28:47 -0800
X-CSE-ConnectionGUID: j5zDWnG0Q8meRVa5oCcZvg==
X-CSE-MsgGUID: Qdxwyp/PQzaB4bY/TpQR1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="220702848"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 19:28:46 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv5Zr-000000003sK-39gy;
	Wed, 25 Feb 2026 03:28:43 +0000
Date: Wed, 25 Feb 2026 11:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 84eca77af2ad61cdd45dce940fc175349147b5cd
Message-ID: <202602251106.wjnxa2UV-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28445-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D24D191328
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 84eca77af2ad61cdd45dce940fc175349147b5cd  clk: renesas: r9a09g056: Add clock and reset entries for RTC

elapsed time: 750m

configs tested: 312
configs skipped: 6

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
arc                   randconfig-001-20260225    gcc-8.5.0
arc                   randconfig-002-20260225    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    clang-23
arm                           h3600_defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    gcc-15.2.0
arm                       omap2plus_defconfig    clang-23
arm                   randconfig-001-20260225    gcc-8.5.0
arm                   randconfig-002-20260225    gcc-8.5.0
arm                   randconfig-003-20260225    gcc-8.5.0
arm                   randconfig-004-20260225    gcc-8.5.0
arm                        spear6xx_defconfig    clang-23
arm                           spitz_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260224    gcc-14.3.0
arm64                 randconfig-001-20260225    gcc-9.5.0
arm64                 randconfig-002-20260224    gcc-14.3.0
arm64                 randconfig-002-20260225    gcc-9.5.0
arm64                 randconfig-003-20260224    gcc-14.3.0
arm64                 randconfig-003-20260225    gcc-9.5.0
arm64                 randconfig-004-20260224    gcc-14.3.0
arm64                 randconfig-004-20260225    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260224    gcc-14.3.0
csky                  randconfig-001-20260225    gcc-9.5.0
csky                  randconfig-002-20260224    gcc-14.3.0
csky                  randconfig-002-20260225    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260224    clang-16
hexagon               randconfig-001-20260225    clang-23
hexagon               randconfig-002-20260224    clang-16
hexagon               randconfig-002-20260225    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260224    clang-20
i386        buildonly-randconfig-001-20260225    clang-20
i386        buildonly-randconfig-002-20260224    clang-20
i386        buildonly-randconfig-002-20260225    clang-20
i386        buildonly-randconfig-003-20260224    clang-20
i386        buildonly-randconfig-003-20260225    clang-20
i386        buildonly-randconfig-004-20260224    clang-20
i386        buildonly-randconfig-004-20260225    clang-20
i386        buildonly-randconfig-005-20260224    clang-20
i386        buildonly-randconfig-005-20260225    clang-20
i386        buildonly-randconfig-006-20260224    clang-20
i386        buildonly-randconfig-006-20260225    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260224    gcc-14
i386                  randconfig-001-20260225    gcc-14
i386                  randconfig-002-20260224    gcc-14
i386                  randconfig-002-20260225    gcc-14
i386                  randconfig-003-20260224    gcc-14
i386                  randconfig-003-20260225    gcc-14
i386                  randconfig-004-20260224    gcc-14
i386                  randconfig-004-20260225    gcc-14
i386                  randconfig-005-20260224    gcc-14
i386                  randconfig-005-20260225    gcc-14
i386                  randconfig-006-20260224    gcc-14
i386                  randconfig-006-20260225    gcc-14
i386                  randconfig-007-20260224    gcc-14
i386                  randconfig-007-20260225    gcc-14
i386                  randconfig-011-20260224    gcc-14
i386                  randconfig-011-20260225    gcc-13
i386                  randconfig-012-20260224    gcc-14
i386                  randconfig-012-20260225    gcc-13
i386                  randconfig-013-20260224    gcc-14
i386                  randconfig-013-20260225    gcc-13
i386                  randconfig-014-20260224    gcc-14
i386                  randconfig-014-20260225    gcc-13
i386                  randconfig-015-20260224    gcc-14
i386                  randconfig-015-20260225    gcc-13
i386                  randconfig-016-20260224    gcc-14
i386                  randconfig-016-20260225    gcc-13
i386                  randconfig-017-20260224    gcc-14
i386                  randconfig-017-20260225    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260224    clang-16
loongarch             randconfig-001-20260225    clang-23
loongarch             randconfig-002-20260224    clang-16
loongarch             randconfig-002-20260225    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    gcc-15.2.0
mips                           ci20_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                     decstation_defconfig    gcc-15.2.0
mips                       lemote2f_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-23
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260224    clang-16
nios2                 randconfig-001-20260225    clang-23
nios2                 randconfig-002-20260224    clang-16
nios2                 randconfig-002-20260225    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                       virt_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260224    clang-23
parisc                randconfig-001-20260225    clang-19
parisc                randconfig-002-20260224    clang-23
parisc                randconfig-002-20260225    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                    amigaone_defconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    gcc-15.2.0
powerpc                      cm5200_defconfig    gcc-15.2.0
powerpc                       ebony_defconfig    clang-23
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc                 mpc8315_rdb_defconfig    clang-23
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc                      pasemi_defconfig    clang-23
powerpc               randconfig-001-20260224    clang-23
powerpc               randconfig-001-20260225    clang-19
powerpc               randconfig-002-20260224    clang-23
powerpc               randconfig-002-20260225    clang-19
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260224    clang-23
powerpc64             randconfig-001-20260225    clang-19
powerpc64             randconfig-002-20260224    clang-23
powerpc64             randconfig-002-20260225    clang-19
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260224    gcc-10.5.0
riscv                 randconfig-001-20260225    gcc-12.5.0
riscv                 randconfig-002-20260224    gcc-10.5.0
riscv                 randconfig-002-20260225    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260224    gcc-10.5.0
s390                  randconfig-001-20260225    gcc-12.5.0
s390                  randconfig-002-20260224    gcc-10.5.0
s390                  randconfig-002-20260225    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                         ecovec24_defconfig    clang-23
sh                         ecovec24_defconfig    gcc-15.2.0
sh                    randconfig-001-20260224    gcc-10.5.0
sh                    randconfig-001-20260225    gcc-12.5.0
sh                    randconfig-002-20260224    gcc-10.5.0
sh                    randconfig-002-20260225    gcc-12.5.0
sh                      rts7751r2d1_defconfig    clang-23
sh                   rts7751r2dplus_defconfig    gcc-15.2.0
sh                           se7619_defconfig    clang-23
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sh                  sh7785lcr_32bit_defconfig    clang-23
sh                            titan_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260224    gcc-12.5.0
sparc                 randconfig-001-20260224    gcc-15.2.0
sparc                 randconfig-001-20260225    gcc-11.5.0
sparc                 randconfig-002-20260224    gcc-11.5.0
sparc                 randconfig-002-20260224    gcc-12.5.0
sparc                 randconfig-002-20260225    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260224    clang-23
sparc64               randconfig-001-20260224    gcc-12.5.0
sparc64               randconfig-001-20260225    gcc-11.5.0
sparc64               randconfig-002-20260224    gcc-12.5.0
sparc64               randconfig-002-20260225    gcc-11.5.0
um                               alldefconfig    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260224    gcc-12.5.0
um                    randconfig-001-20260224    gcc-14
um                    randconfig-001-20260225    gcc-11.5.0
um                    randconfig-002-20260224    clang-23
um                    randconfig-002-20260224    gcc-12.5.0
um                    randconfig-002-20260225    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260224    gcc-14
x86_64      buildonly-randconfig-001-20260225    clang-20
x86_64      buildonly-randconfig-002-20260224    gcc-14
x86_64      buildonly-randconfig-002-20260225    clang-20
x86_64      buildonly-randconfig-003-20260224    gcc-14
x86_64      buildonly-randconfig-003-20260225    clang-20
x86_64      buildonly-randconfig-004-20260224    gcc-14
x86_64      buildonly-randconfig-004-20260225    clang-20
x86_64      buildonly-randconfig-005-20260224    gcc-14
x86_64      buildonly-randconfig-005-20260225    clang-20
x86_64      buildonly-randconfig-006-20260224    gcc-14
x86_64      buildonly-randconfig-006-20260225    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260224    gcc-14
x86_64                randconfig-001-20260225    gcc-14
x86_64                randconfig-002-20260224    gcc-14
x86_64                randconfig-002-20260225    gcc-14
x86_64                randconfig-003-20260224    gcc-14
x86_64                randconfig-003-20260225    gcc-14
x86_64                randconfig-004-20260224    gcc-14
x86_64                randconfig-004-20260225    gcc-14
x86_64                randconfig-005-20260224    gcc-14
x86_64                randconfig-005-20260225    gcc-14
x86_64                randconfig-006-20260224    gcc-14
x86_64                randconfig-006-20260225    gcc-14
x86_64                randconfig-011-20260224    clang-20
x86_64                randconfig-011-20260224    gcc-14
x86_64                randconfig-011-20260225    gcc-14
x86_64                randconfig-012-20260224    clang-20
x86_64                randconfig-012-20260225    gcc-14
x86_64                randconfig-013-20260224    clang-20
x86_64                randconfig-013-20260225    gcc-14
x86_64                randconfig-014-20260224    clang-20
x86_64                randconfig-014-20260225    gcc-14
x86_64                randconfig-015-20260224    clang-20
x86_64                randconfig-015-20260225    gcc-14
x86_64                randconfig-016-20260224    clang-20
x86_64                randconfig-016-20260225    gcc-14
x86_64                randconfig-071-20260224    clang-20
x86_64                randconfig-071-20260225    clang-20
x86_64                randconfig-072-20260224    clang-20
x86_64                randconfig-072-20260225    clang-20
x86_64                randconfig-073-20260224    clang-20
x86_64                randconfig-073-20260225    clang-20
x86_64                randconfig-074-20260224    clang-20
x86_64                randconfig-074-20260225    clang-20
x86_64                randconfig-075-20260224    clang-20
x86_64                randconfig-075-20260225    clang-20
x86_64                randconfig-076-20260224    clang-20
x86_64                randconfig-076-20260225    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    clang-23
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260224    gcc-10.5.0
xtensa                randconfig-001-20260224    gcc-12.5.0
xtensa                randconfig-001-20260225    gcc-11.5.0
xtensa                randconfig-002-20260224    gcc-12.5.0
xtensa                randconfig-002-20260224    gcc-14.3.0
xtensa                randconfig-002-20260225    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

