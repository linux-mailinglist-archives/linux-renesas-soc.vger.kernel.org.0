Return-Path: <linux-renesas-soc+bounces-10457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C549C49C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 00:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12606B282C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 23:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7D415887C;
	Mon, 11 Nov 2024 23:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjePMTmC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5426618A6BF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731368107; cv=none; b=EIQq7NGVnJKueZNd4is3omabw/OiT6EH/WotBBZjUzEd4s/Qo4a/4spWGJsCnWOvpfafOiVSBPH1GiwqIEH57uC1YZjuCw7HI2hTA2NZSTBvOyh+mlEbsABXimnDFAorrd6AFINx7rxwYdZf3sWwjClrcYE/V/j2YJPVURunWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731368107; c=relaxed/simple;
	bh=ZTG52/mRAap+BlnmjOlhz+U7o61SNcBPm0gGD+SlVm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XSkmLbtkK8hlABvIzUCAHJ4KdizLeJkVffsPBzXvzN4OGp9qW3JLrM3ouDf0Kf5OzJJoD6k8XoKXH9T++RFIdjNgMLbt+UAxlz7vNWV0PBh5HTydhMukhg1e3ry0W+rgKfg5EHZMAMz3zsMJvjwuFO9EMShNgYFC/5SSEf3vafk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjePMTmC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731368105; x=1762904105;
  h=date:from:to:cc:subject:message-id;
  bh=ZTG52/mRAap+BlnmjOlhz+U7o61SNcBPm0gGD+SlVm4=;
  b=RjePMTmCQNvnMM/AgQhTAGDnbQojHPbIFxidKTGD9ObIyFXboP1vY2Bk
   X1JgGw0omt+7kKJNZ14Z7pNyt0o234d6nojmwBob7UyKqsRULX6Oxz0vW
   rPWNz84WIJL87+YsNcbQTK7TSy8yO/wB7856zFzLcLkLuGu1ys0gYDxtB
   /stcmvLlPzqjhl6wDNY4r/xvWY9Q2M0feW48i5TIqIXXRfvKAG9+z6z6/
   i1eD7tF9NvizP3zlWPGyRL0+V1dnu4P+z6v066vjFFsNh1opFZqKEsc9L
   oeAX7QSFws1LW55cgz4zyAwVJY97GthOR5spDSHTJYs1kx5JrrOllI+mm
   w==;
X-CSE-ConnectionGUID: Whkk/wnNQXGSjnSPLdE/4w==
X-CSE-MsgGUID: N0MkD9CpTtySZI7v16MxWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31063608"
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="31063608"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 15:35:02 -0800
X-CSE-ConnectionGUID: u58+nZfXSmCwQIaSE3npOA==
X-CSE-MsgGUID: KkstnBDLQOSqi5/cUvEdiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="87064901"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2024 15:35:02 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAdvv-0000GD-1Z;
	Mon, 11 Nov 2024 23:34:59 +0000
Date: Tue, 12 Nov 2024 07:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:fixes] BUILD SUCCESS
 124f4f1a18696c4198f9f903fd74034ea8b7d352
Message-ID: <202411120756.XuPQza0o-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git fixes
branch HEAD: 124f4f1a18696c4198f9f903fd74034ea8b7d352  MAINTAINERS: Re-add cancelled Renesas driver sections

elapsed time: 722m

configs tested: 190
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241111    gcc-14.2.0
arc                   randconfig-002-20241111    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    gcc-14.2.0
arm                         at91_dt_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                            dove_defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    clang-15
arm                            qcom_defconfig    clang-15
arm                   randconfig-001-20241111    gcc-14.2.0
arm                   randconfig-002-20241111    gcc-14.2.0
arm                   randconfig-003-20241111    gcc-14.2.0
arm                   randconfig-004-20241111    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241111    gcc-14.2.0
arm64                 randconfig-002-20241111    gcc-14.2.0
arm64                 randconfig-003-20241111    gcc-14.2.0
arm64                 randconfig-004-20241111    gcc-14.2.0
csky                             alldefconfig    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241111    gcc-14.2.0
csky                  randconfig-002-20241111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241111    gcc-14.2.0
hexagon               randconfig-002-20241111    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241111    gcc-11
i386        buildonly-randconfig-002-20241111    gcc-11
i386        buildonly-randconfig-003-20241111    gcc-11
i386        buildonly-randconfig-004-20241111    gcc-11
i386        buildonly-randconfig-005-20241111    gcc-11
i386        buildonly-randconfig-006-20241111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241111    gcc-11
i386                  randconfig-002-20241111    gcc-11
i386                  randconfig-003-20241111    gcc-11
i386                  randconfig-004-20241111    gcc-11
i386                  randconfig-005-20241111    gcc-11
i386                  randconfig-006-20241111    gcc-11
i386                  randconfig-011-20241111    gcc-11
i386                  randconfig-012-20241111    gcc-11
i386                  randconfig-013-20241111    gcc-11
i386                  randconfig-014-20241111    gcc-11
i386                  randconfig-015-20241111    gcc-11
i386                  randconfig-016-20241111    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241111    gcc-14.2.0
loongarch             randconfig-002-20241111    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-20
m68k                                defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    clang-15
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    clang-20
mips                           jazz_defconfig    clang-15
mips                           mtx1_defconfig    clang-15
mips                        qi_lb60_defconfig    clang-20
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241111    gcc-14.2.0
nios2                 randconfig-002-20241111    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241111    gcc-14.2.0
parisc                randconfig-002-20241111    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-15
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    clang-20
powerpc                       holly_defconfig    clang-15
powerpc               mpc834x_itxgp_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-20
powerpc                     mpc83xx_defconfig    clang-20
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    clang-20
powerpc               randconfig-001-20241111    gcc-14.2.0
powerpc               randconfig-002-20241111    gcc-14.2.0
powerpc               randconfig-003-20241111    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-20
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    clang-15
powerpc64             randconfig-001-20241111    gcc-14.2.0
powerpc64             randconfig-002-20241111    gcc-14.2.0
powerpc64             randconfig-003-20241111    gcc-14.2.0
riscv                            alldefconfig    clang-15
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-15
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20241111    gcc-14.2.0
riscv                 randconfig-002-20241111    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241111    gcc-14.2.0
s390                  randconfig-002-20241111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-20
sh                            hp6xx_defconfig    clang-15
sh                          polaris_defconfig    clang-20
sh                    randconfig-001-20241111    gcc-14.2.0
sh                    randconfig-002-20241111    gcc-14.2.0
sh                           se7206_defconfig    clang-15
sh                           se7343_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.2.0
sh                             sh03_defconfig    clang-15
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241111    gcc-14.2.0
sparc64               randconfig-002-20241111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241111    gcc-14.2.0
um                    randconfig-002-20241111    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241111    gcc-14.2.0
xtensa                randconfig-002-20241111    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

