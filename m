Return-Path: <linux-renesas-soc+bounces-23836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0772C197FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6ABC5021EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D462E22BE;
	Wed, 29 Oct 2025 09:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S66DRfNs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED92E172D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731249; cv=none; b=u+lbc/5nwW6V3hWPB2hd2lzNQ5ulPWc0N8f2/LultiUESwpsuCZtfSsBvVK/3zw873fUUpIb64shmeTmBPf3AOR9/zzS2Yvr5xpLpV4MQHt5Nvc7lHiGG5D/NUrBS/yz9Qoy9NUe9Lm5VLIejDqzE3898+rn9PMs+6SuFqyB1QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731249; c=relaxed/simple;
	bh=OSGo1xHdqzSWAd53shEn1BnMnSX8IfgrzkTWgUp6uKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fcMEWzAXDofUDLSFGZnutf71At7a3it51tqVRXRWHxIjQSZrSRy9d+fWcjKZwxEh4r2jPsjPu/XEBvyGlP0/t4ij1LfuIPxLBbhJBqNpujm/Z/JfQj+TAOXeDcK8EmZ7ghbz26+Znwsj63LeYjoYG/44ikasmNx3JIWUX75p06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S66DRfNs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761731248; x=1793267248;
  h=date:from:to:cc:subject:message-id;
  bh=OSGo1xHdqzSWAd53shEn1BnMnSX8IfgrzkTWgUp6uKE=;
  b=S66DRfNspBEcM4JdlgZ0sGdXWrUBLm4ydEYdyPDhyKV4cCcApXKSKw/K
   A0WZJux0qEJVWrBsc8L/Pxpm0PB2dXC1AdtMZLVbJypYThsDkxLyJ2s41
   9yCip79EMCXjX4/KRGQIMK/JqFVa7ArMztHdNglG55PyqvwXnShfDSfUx
   d8CVKzXc1IzdS0fzm40dENjbQV6V7wTtqCMQT85oXlYgu3aJfdYnXzVyv
   QhcmP/1PyUaiU9ngFJcE4325ogeInhyC8AIj1z4a20wG0TL75QdF8jmkV
   Ld8VBcc+fFlYb1rmjIxB0gTlv5Xnb9Kba6NbTH7c2SVaBSvQa6egj5mPZ
   g==;
X-CSE-ConnectionGUID: wYPdrkepSF6G26ZTKAErcA==
X-CSE-MsgGUID: ewMfjRPpQrWo+iTl4zuUbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74523777"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74523777"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 02:47:27 -0700
X-CSE-ConnectionGUID: MzhwwTBnTBu5gScRpqT1Aw==
X-CSE-MsgGUID: M368/OgsT3COD/P3wwup+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="190789484"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2025 02:47:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE2m4-000KTB-0X;
	Wed, 29 Oct 2025 09:47:24 +0000
Date: Wed, 29 Oct 2025 17:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 245f04b114473bce10a1fbc1850db901bdfe8ff5
Message-ID: <202510291713.ELujl4lo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 245f04b114473bce10a1fbc1850db901bdfe8ff5  Merge branches 'renesas-arm-defconfig-for-v6.19', 'renesas-drivers-for-v6.19' and 'renesas-dts-for-v6.19' into renesas-next

elapsed time: 1449m

configs tested: 148
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251028    gcc-8.5.0
arc                   randconfig-002-20251028    gcc-13.4.0
arm                               allnoconfig    clang-22
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20251028    clang-22
arm                   randconfig-002-20251028    clang-22
arm                   randconfig-003-20251028    clang-22
arm                   randconfig-004-20251028    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251028    clang-22
arm64                 randconfig-002-20251028    clang-22
arm64                 randconfig-003-20251028    gcc-11.5.0
arm64                 randconfig-004-20251028    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                  randconfig-001-20251028    gcc-15.1.0
csky                  randconfig-002-20251028    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251028    clang-22
hexagon               randconfig-002-20251028    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251028    gcc-14
i386        buildonly-randconfig-002-20251028    gcc-14
i386        buildonly-randconfig-003-20251028    gcc-14
i386        buildonly-randconfig-004-20251028    gcc-14
i386        buildonly-randconfig-005-20251028    gcc-14
i386        buildonly-randconfig-006-20251028    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251028    gcc-14
i386                  randconfig-002-20251028    clang-20
i386                  randconfig-003-20251028    clang-20
i386                  randconfig-004-20251028    clang-20
i386                  randconfig-005-20251028    clang-20
i386                  randconfig-006-20251028    clang-20
i386                  randconfig-007-20251028    gcc-14
i386                  randconfig-011-20251028    gcc-14
i386                  randconfig-012-20251028    clang-20
i386                  randconfig-013-20251028    clang-20
i386                  randconfig-014-20251028    clang-20
i386                  randconfig-015-20251028    clang-20
i386                  randconfig-016-20251028    gcc-14
i386                  randconfig-017-20251028    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251028    gcc-12.5.0
loongarch             randconfig-002-20251028    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251028    gcc-8.5.0
nios2                 randconfig-002-20251028    gcc-9.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251028    gcc-9.5.0
parisc                randconfig-002-20251028    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc                     mpc83xx_defconfig    clang-22
powerpc               randconfig-001-20251028    gcc-15.1.0
powerpc               randconfig-002-20251028    gcc-11.5.0
powerpc64             randconfig-001-20251028    clang-22
powerpc64             randconfig-002-20251028    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-002-20251028    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251028    clang-22
s390                  randconfig-002-20251028    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251028    gcc-15.1.0
sh                    randconfig-002-20251028    gcc-13.4.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251028    gcc-8.5.0
sparc                 randconfig-002-20251028    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251028    clang-22
sparc64               randconfig-002-20251028    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251028    gcc-14
um                    randconfig-002-20251028    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251028    gcc-14
x86_64      buildonly-randconfig-002-20251028    gcc-14
x86_64      buildonly-randconfig-003-20251028    clang-20
x86_64      buildonly-randconfig-004-20251028    clang-20
x86_64      buildonly-randconfig-005-20251028    clang-20
x86_64      buildonly-randconfig-006-20251028    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251028    gcc-14
x86_64                randconfig-012-20251028    gcc-14
x86_64                randconfig-013-20251028    gcc-12
x86_64                randconfig-014-20251028    clang-20
x86_64                randconfig-015-20251028    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251028    gcc-15.1.0
xtensa                randconfig-002-20251028    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

