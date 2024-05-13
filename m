Return-Path: <linux-renesas-soc+bounces-5351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8A8C4889
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 22:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1B2C1F20EFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 20:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7126F067;
	Mon, 13 May 2024 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoIrPz+X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A99629D02
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 May 2024 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715633758; cv=none; b=HOXWttXPxoQytySqaKGShc60T3wxNMJJJE+8ABS6p/JoThoQbNiQy6vBniTbW7TuvcrjRfyH5Y7BvK9nk71XUCmZvianatCBuF6gVoBHX82p7JMYSDfXtN81CDk5bQTomUa0+hK6WzIGsaR/1CfHRpbjrbWVYKGnTHo1VP5e0R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715633758; c=relaxed/simple;
	bh=bXWcxSw9oBlaeQEXpjd+XyjLtQgxl59a//EjlYB8r8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=me44NVXWDW73nSuBoTK9m3M5VY1mZfW5T8zMMGkNvCZukvARNC+QEVH2kgZ/g/mn6QfXL+dvY9wX8oVC/oExlUpqpbcSjtOyY6ri1kxwGgiWWDh3k0ykADZL78c4e3MW58OCxcaJK0AcKfAUX/Lk7c+J1nx4HQnm/xDtnARe6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoIrPz+X; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715633756; x=1747169756;
  h=date:from:to:cc:subject:message-id;
  bh=bXWcxSw9oBlaeQEXpjd+XyjLtQgxl59a//EjlYB8r8Y=;
  b=YoIrPz+XA0QX0zlnYJwHC+gFEM6ZbQXcGsGg82rW37UpsHDdu715/AN0
   KSy/tQJ8rIzSVUmAs0OAkNn1kxKYgvW6GUhwMmKxCrOapZS7ZRMoiMnAk
   mIxSI9pJYrDxiraiTYgDslWj2K083PdW9nXVqvHaBBbJ3Zaw7056b4IZH
   pBV6krxQr1VnetYsjqB11u5608EAE2Nj++SC2gYfndXl7Hb6rGhyEhiWr
   qfYoOaAZliPNQYagl9MmLBB0mJgdW3hHlDRaydwwqJ7a2h0ET5/JpHnzs
   1LwkFZqtWKdLvp1GsIvgqRLKfNqB4Wdfs6py7lE4iYirURD4fwuq+84lc
   A==;
X-CSE-ConnectionGUID: L8J64ly9S/mo20X/UUZa+Q==
X-CSE-MsgGUID: J9vUtsQeQHaFQe4huwxtJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22259897"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="22259897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:55:56 -0700
X-CSE-ConnectionGUID: yPjh4HiKQW+Zo9lmcby6jg==
X-CSE-MsgGUID: iWx9dmyOQOa1Bqx4tM0xlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30492076"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2024 13:55:54 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6ci8-000Ahe-26;
	Mon, 13 May 2024 20:55:52 +0000
Date: Tue, 14 May 2024 04:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 e6bc5a03785928d2da81ba779676e044da5217d7
Message-ID: <202405140409.WFipNfvX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: e6bc5a03785928d2da81ba779676e044da5217d7  Merge tag 'v6.9' into renesas-devel

elapsed time: 733m

configs tested: 179
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240513   gcc  
arc                   randconfig-002-20240513   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20240513   clang
arm                   randconfig-002-20240513   gcc  
arm                   randconfig-003-20240513   clang
arm                   randconfig-004-20240513   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240513   gcc  
arm64                 randconfig-002-20240513   gcc  
arm64                 randconfig-003-20240513   clang
arm64                 randconfig-004-20240513   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240513   gcc  
csky                  randconfig-002-20240513   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240513   clang
hexagon               randconfig-002-20240513   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240513   clang
i386         buildonly-randconfig-002-20240513   clang
i386         buildonly-randconfig-003-20240513   gcc  
i386         buildonly-randconfig-004-20240513   clang
i386         buildonly-randconfig-005-20240513   gcc  
i386         buildonly-randconfig-006-20240513   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240513   gcc  
i386                  randconfig-002-20240513   clang
i386                  randconfig-003-20240513   gcc  
i386                  randconfig-004-20240513   clang
i386                  randconfig-005-20240513   gcc  
i386                  randconfig-006-20240513   gcc  
i386                  randconfig-011-20240513   gcc  
i386                  randconfig-012-20240513   clang
i386                  randconfig-013-20240513   clang
i386                  randconfig-014-20240513   gcc  
i386                  randconfig-015-20240513   gcc  
i386                  randconfig-016-20240513   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240513   gcc  
loongarch             randconfig-002-20240513   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                           ci20_defconfig   clang
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240513   gcc  
nios2                 randconfig-002-20240513   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240513   gcc  
parisc                randconfig-002-20240513   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 linkstation_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc               randconfig-001-20240513   gcc  
powerpc               randconfig-002-20240513   gcc  
powerpc               randconfig-003-20240513   gcc  
powerpc64             randconfig-001-20240513   gcc  
powerpc64             randconfig-002-20240513   clang
powerpc64             randconfig-003-20240513   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240513   gcc  
riscv                 randconfig-002-20240513   clang
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240513   gcc  
s390                  randconfig-002-20240513   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240513   gcc  
sh                    randconfig-002-20240513   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240513   gcc  
sparc64               randconfig-002-20240513   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240513   clang
um                    randconfig-002-20240513   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240513   gcc  
x86_64       buildonly-randconfig-002-20240513   gcc  
x86_64       buildonly-randconfig-003-20240513   gcc  
x86_64       buildonly-randconfig-004-20240513   clang
x86_64       buildonly-randconfig-005-20240513   clang
x86_64       buildonly-randconfig-006-20240513   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240513   clang
x86_64                randconfig-002-20240513   clang
x86_64                randconfig-003-20240513   clang
x86_64                randconfig-004-20240513   gcc  
x86_64                randconfig-005-20240513   clang
x86_64                randconfig-006-20240513   clang
x86_64                randconfig-011-20240513   clang
x86_64                randconfig-012-20240513   gcc  
x86_64                randconfig-014-20240513   clang
x86_64                randconfig-015-20240513   gcc  
x86_64                randconfig-016-20240513   clang
x86_64                randconfig-071-20240513   clang
x86_64                randconfig-072-20240513   clang
x86_64                randconfig-073-20240513   clang
x86_64                randconfig-074-20240513   gcc  
x86_64                randconfig-075-20240513   gcc  
x86_64                randconfig-076-20240513   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240513   gcc  
xtensa                randconfig-002-20240513   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

