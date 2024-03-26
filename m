Return-Path: <linux-renesas-soc+bounces-4058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD788CFE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 22:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D17DB21090
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 21:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884EC13D528;
	Tue, 26 Mar 2024 21:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAl3z0AO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF0B13D539
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 21:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711488065; cv=none; b=OVnmIn52rSFInhfLZqHTPSadNpV96mmPvxRBTfOjI5PZ1nk9zoR6FEiSWkbSZg0ISaATBOgXwa18z7QMnq2so2o5uPTVV/HyfVnFVcN5jOZqRzIhtuwKGNcBwvp9tu1zIG7zb4D+3EN0i/nGmnKWVN6cX9rIAq8lBgNh91Iumxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711488065; c=relaxed/simple;
	bh=EkDF2N+xTYjr4OJbZiJS+Alhl4aWGXEMREJwGafTWz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LJ3lyxITK2C8mnGeHe+3nCpOl16CTdCkPyJGR+36+hUoWqMIVPJ4wr8YMjx72/w5KNocc2IjjA5l4FkYS3qDzdGAJz6hml0pTAkgSsLMQ/cE5nGkjYKaArrxMtxapxxftC17/ft+8Fwc11HDGD9HSlxSu1VMGykHq/P3QlZBCek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAl3z0AO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711488064; x=1743024064;
  h=date:from:to:cc:subject:message-id;
  bh=EkDF2N+xTYjr4OJbZiJS+Alhl4aWGXEMREJwGafTWz4=;
  b=HAl3z0AOpJ9E97B5W5HXdGfHyfcmstKE5cfkDpvDXnN63vWYHScGMlsv
   zV5hHiKxCdQ+tzpKmTxfJhwdJ5DnG0jn/4rHCZQgksePocXZ5D7nLj+fm
   rzReG2Ds2uUilzWlHcc0seiJICT3yG0kYEnua1mlWGmKz9Bb+2xUfNQJ6
   FiyX1jTZBNHbXvSGwWDEri2HE5cFZjxWxzpT7o50hSd0IktjUdO15kVY2
   mcIRZ4dkqxmJ4iPnitPO1OJ4Vyt+NlHLXAnHZxUPkUH7qxm7qppTTB7lS
   c+hFWZ9B60cK4IKRYY7Kq8DQJyaDmMKx6jezYJH3m737D2/iHF3Oks7Uy
   w==;
X-CSE-ConnectionGUID: yAUcBS9aQ6eVQimW043fIw==
X-CSE-MsgGUID: MiIJeY5TTRelF3d9DZNALQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6776907"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6776907"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 14:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20735159"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2024 14:21:01 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpEE7-0000QE-19;
	Tue, 26 Mar 2024 21:20:59 +0000
Date: Wed, 27 Mar 2024 05:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.10] BUILD
 SUCCESS 27e51e83891bb4b9c806bae1ffb17c44fd8ea459
Message-ID: <202403270555.YXVstm0a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.10
branch HEAD: 27e51e83891bb4b9c806bae1ffb17c44fd8ea459  arm64: defconfig: Enable R9A09G057 SoC

elapsed time: 741m

configs tested: 124
configs skipped: 142

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240327   gcc  
arc                   randconfig-002-20240327   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-004-20240327   gcc  
arm                          sp7021_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240327   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240327   gcc  
csky                  randconfig-002-20240327   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-003-20240327   clang
i386         buildonly-randconfig-004-20240327   clang
i386         buildonly-randconfig-005-20240327   clang
i386         buildonly-randconfig-006-20240327   clang
i386                                defconfig   clang
i386                  randconfig-003-20240327   clang
i386                  randconfig-005-20240327   clang
i386                  randconfig-012-20240327   clang
i386                  randconfig-014-20240327   clang
i386                  randconfig-016-20240327   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240327   gcc  
loongarch             randconfig-002-20240327   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240327   gcc  
nios2                 randconfig-002-20240327   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                randconfig-001-20240327   gcc  
parisc                randconfig-002-20240327   gcc  
powerpc                          allyesconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc               randconfig-002-20240327   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-002-20240327   gcc  
powerpc64             randconfig-003-20240327   gcc  
riscv                            allmodconfig   clang
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240327   gcc  
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240327   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                    randconfig-001-20240327   gcc  
sh                    randconfig-002-20240327   gcc  
sh                           se7712_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240327   gcc  
sparc64               randconfig-002-20240327   gcc  
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-004-20240327   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240327   clang
x86_64                randconfig-005-20240327   clang
x86_64                randconfig-006-20240327   clang
x86_64                randconfig-012-20240327   clang
x86_64                randconfig-013-20240327   clang
x86_64                randconfig-014-20240327   clang
x86_64                randconfig-015-20240327   clang
x86_64                randconfig-016-20240327   clang
x86_64                randconfig-072-20240327   clang
x86_64                randconfig-073-20240327   clang
x86_64                randconfig-074-20240327   clang
x86_64                randconfig-075-20240327   clang
x86_64                randconfig-076-20240327   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240327   gcc  
xtensa                randconfig-002-20240327   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

