Return-Path: <linux-renesas-soc+bounces-10190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 381299B4395
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 08:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8661C21165
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 07:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DC92010F4;
	Tue, 29 Oct 2024 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSI575Dm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA011DE3C5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Oct 2024 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730188492; cv=none; b=tyaWfK/+xJJOnb3PcWtL+mFcOWdlpijZbKlCr1k8SHPy9E5utbIGtN6yWxbP6ukqPRR64t8LO7emNqu4ex3BhAdeADTzepMvYzywzvuqtVAwPnXcIr81ulY6PUm8p9Bru70Vv15dig2vl6gSc8j+Or/FL8mKaPibDIW7P3TfqaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730188492; c=relaxed/simple;
	bh=5Ff/ZKNv1cQkDeB8sfuwDLv72TNTZf/EVuDIey0LCdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kbGoK57iq4yQvycscf4xIfyhltWDpDQ4JlSveGQzEYelR7gAKuFXppnjbCNUxICbXPXIUWufVkMZxgDRE7wtSQJQNoDQVzwBoccZdK0easn/75JR5z62DQyY+n/ClXz+ap6EGPhlPiH02LuOeG3sKhewTUttjbQ2UqtMADswTB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSI575Dm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730188490; x=1761724490;
  h=date:from:to:cc:subject:message-id;
  bh=5Ff/ZKNv1cQkDeB8sfuwDLv72TNTZf/EVuDIey0LCdg=;
  b=eSI575DmvtBJGdfIXJeVdgTkUKoKJQYwmFLqojVlhSGog4I2YV9VCeVP
   JbG0TnPFh+7NRoBtsFXx3PINfz1Jcdk2d/YzX4OPEpGy0BNpU2CuNISeu
   0/yaMQODta7sGa2MP3qjp8um+p0OIc8GtCJjAkmcHdthYu4e3ffH6dFq2
   rZpZok7YaTDVqY7EoBj2xRIRGTsS2KV8m+dkoqRfZbZjepvFAxATGGH3H
   HquL5TIXH1tNATZ9X34+4q6l3/ilYGwk0p/g0hBtYtZMysHPWQod8EBBy
   mdi7jPk0Yqsf7AClbjjp/Pj75Kuen/PC2NYHP1Pr0E9sXE+ql74toYgm/
   Q==;
X-CSE-ConnectionGUID: Z0z/+CNNT+SciVuu9BTX5g==
X-CSE-MsgGUID: hhfs6mGbSMunzQGwaXURVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47276215"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47276215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 00:54:50 -0700
X-CSE-ConnectionGUID: l5GejUusRF6ToyOItuO0DQ==
X-CSE-MsgGUID: 9dL6LKsmQQay0hNNxE5vnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86435111"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2024 00:54:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5h3u-000dP2-1a;
	Tue, 29 Oct 2024 07:54:46 +0000
Date: Tue, 29 Oct 2024 15:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.12-rc1]
 BUILD SUCCESS b80ab9d159d4e6362d4beb7720e0e43e8661409e
Message-ID: <202410291557.sqlcA5Tv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.12-rc1
branch HEAD: b80ab9d159d4e6362d4beb7720e0e43e8661409e  arm64: dts: renesas: white-hawk-cpu: Add overlay for CP97/98

elapsed time: 864m

configs tested: 131
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                         haps_hs_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            hisi_defconfig    gcc-14.1.0
arm                          moxart_defconfig    clang-14
arm                       netwinder_defconfig    gcc-14.1.0
arm                           omap1_defconfig    clang-14
arm                         vf610m4_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      maltaaprp_defconfig    clang-14
mips                        omega2p_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                       holly_defconfig    clang-14
powerpc                       maple_defconfig    clang-14
powerpc                  mpc866_ads_defconfig    gcc-14.1.0
powerpc                  mpc885_ads_defconfig    clang-14
powerpc                       ppc64_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-14
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.1.0
s390                       zfcpdump_defconfig    clang-14
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    clang-14
sh                             sh03_defconfig    clang-14
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-14
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241029    clang-19
x86_64      buildonly-randconfig-002-20241029    clang-19
x86_64      buildonly-randconfig-003-20241029    clang-19
x86_64      buildonly-randconfig-004-20241029    clang-19
x86_64      buildonly-randconfig-005-20241029    clang-19
x86_64      buildonly-randconfig-006-20241029    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241029    clang-19
x86_64                randconfig-002-20241029    clang-19
x86_64                randconfig-003-20241029    clang-19
x86_64                randconfig-004-20241029    clang-19
x86_64                randconfig-005-20241029    clang-19
x86_64                randconfig-006-20241029    clang-19
x86_64                randconfig-011-20241029    clang-19
x86_64                randconfig-012-20241029    clang-19
x86_64                randconfig-013-20241029    clang-19
x86_64                randconfig-014-20241029    clang-19
x86_64                randconfig-015-20241029    clang-19
x86_64                randconfig-016-20241029    clang-19
x86_64                randconfig-071-20241029    clang-19
x86_64                randconfig-072-20241029    clang-19
x86_64                randconfig-073-20241029    clang-19
x86_64                randconfig-074-20241029    clang-19
x86_64                randconfig-075-20241029    clang-19
x86_64                randconfig-076-20241029    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-14
xtensa                    xip_kc705_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

