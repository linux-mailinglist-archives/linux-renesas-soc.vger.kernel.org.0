Return-Path: <linux-renesas-soc+bounces-6038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE59036A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 10:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94C571F20D67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 08:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286F6174ED2;
	Tue, 11 Jun 2024 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCqQ0AwV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826BC171E64
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094970; cv=none; b=fs43bDDvkdQ9P/Dkxp5/VFkNyIRyctE/r7PqzX+TcTZ5eT8CkGolbT1nUtRcENHzIjxCwezhS5YkeMHLAojcYl3f5ZFjMufRTvLDz3sgGWkPzop08r9BabzfX/57S0fCXUpp9sxT5j/qzf0bUV9u7jl/iLD9Mhey5tW8HXoUjhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094970; c=relaxed/simple;
	bh=//FL4gzmXIW97naB5Rr9dypHxI7Uv0o/0pDrckopjRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZFZ32ubcMo8wgdLqBrS7Dsx8TxXNg5mSg+hdzQRlnIARCLLDW2Aw8UqzNUQ73tOyeseu1Qr3DSSjpfOq7/wcainzQS9/NpR+Y3rweWzrCrj+hIflx5P+TgJPqOuB5txaYHAw+5zvJzqP6gMBwfa/WfMsfp/pkI98Tk6vtEzqJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCqQ0AwV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718094969; x=1749630969;
  h=date:from:to:cc:subject:message-id;
  bh=//FL4gzmXIW97naB5Rr9dypHxI7Uv0o/0pDrckopjRo=;
  b=SCqQ0AwVCjTBvKeWnN2IBCyiJK2zZsNezCM/NymXk7mbLceCYQ9MUm9V
   bA9T8JB3nwvceEvh434LQI2rOhvs11RpcrQdr3Dmiqv0FRGWg7dFrhAr8
   biEvqVdTtapCBb8Z1HeXXfU1Uq+LOa38yc6zq4bBpz0Meq+fTu3QADlIX
   lqRL2OoLVsu53rtPjfIqGJ5C8GQja8ciBM8MNfow27tXlJp1Gx0u/pgR3
   bT8LIsD5DhrOyG5Nv8cxHhBV5J67V4MK5RqczP9QyQVgiKwb71j1T8BqG
   ulZaPnCcjUGnipUnIFGfDYMC7vfBqmSWYdXiW6muygwsjTYmMfwpyn3hP
   g==;
X-CSE-ConnectionGUID: zD4aTLgwS6eS6LDD3PrlBQ==
X-CSE-MsgGUID: KHOD9tkzSIm6UgpOM3rUBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="40192072"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="40192072"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:36:08 -0700
X-CSE-ConnectionGUID: D6cEUzvaQH+1LWhyjHqIrg==
X-CSE-MsgGUID: SOgDnp0XT6223mq+80mXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="39345342"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jun 2024 01:36:07 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGwz6-0000E2-2F;
	Tue, 11 Jun 2024 08:36:04 +0000
Date: Tue, 11 Jun 2024 16:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2487f042931b26238ef51e0f0c02cb59a2d57047
Message-ID: <202406111655.lkkppIEV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 2487f042931b26238ef51e0f0c02cb59a2d57047  Merge tag 'v6.10-rc3' into renesas-devel

elapsed time: 1467m

configs tested: 161
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   alpha
allyesconfig                            alpha   defconfig
arc                               allnoconfig   arc  
defconfig                                 arc   randconfig-001-20240611
arc                   randconfig-002-20240611   arm  
allnoconfig                               arm   defconfig
arm                   randconfig-001-20240611   arm  
randconfig-002-20240611                              arm   randconfig-003-20240611
arm                   randconfig-004-20240611   arm64
allnoconfig                             arm64   defconfig
arm64                 randconfig-001-20240611   arm64
randconfig-002-20240611                            arm64   randconfig-003-20240611
arm64                 randconfig-004-20240611   csky 
allnoconfig                              csky   defconfig
csky                  randconfig-001-20240611   csky 
randconfig-002-20240611                          hexagon   allmodconfig
hexagon                           allnoconfig   hexagon
allyesconfig                          hexagon   defconfig
hexagon               randconfig-001-20240611   hexagon
randconfig-002-20240611                             i386   allmodconfig
i386                              allnoconfig   i386 
allyesconfig                             i386   buildonly-randconfig-001-20240610
i386         buildonly-randconfig-002-20240610   i386 
buildonly-randconfig-003-20240610                             i386   buildonly-randconfig-004-20240610
i386         buildonly-randconfig-005-20240610   i386 
buildonly-randconfig-006-20240610                             i386   defconfig
i386                  randconfig-001-20240610   i386 
randconfig-002-20240610                             i386   randconfig-003-20240610
i386                  randconfig-004-20240610   i386 
randconfig-005-20240610                             i386   randconfig-006-20240610
i386                  randconfig-011-20240610   i386 
randconfig-012-20240610                             i386   randconfig-013-20240610
i386                  randconfig-014-20240610   i386 
randconfig-015-20240610                             i386   randconfig-016-20240610
loongarch                        allmodconfig   loongarch
allnoconfig                         loongarch   defconfig
loongarch             randconfig-001-20240611   loongarch
randconfig-002-20240611                             m68k   allmodconfig
m68k                              allnoconfig   m68k 
allyesconfig                             m68k   defconfig
microblaze                       allmodconfig   microblaze
allnoconfig                        microblaze   allyesconfig
microblaze                          defconfig   mips 
allnoconfig                              mips   allyesconfig
nios2                            allmodconfig   nios2
allnoconfig                             nios2   allyesconfig
nios2                               defconfig   nios2
randconfig-001-20240611                            nios2   randconfig-002-20240611
openrisc                          allnoconfig   openrisc
allyesconfig                         openrisc   allyesconfig
gcc-13.2.0                           openrisc   defconfig
parisc                           allmodconfig   parisc
allmodconfig                       gcc-13.2.0   parisc
allnoconfig                            parisc   allyesconfig
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   parisc
randconfig-001-20240611                           parisc   randconfig-002-20240611
parisc64                            defconfig   powerpc
allmodconfig                          powerpc   allmodconfig
gcc-13.2.0                            powerpc   allnoconfig
powerpc                          allyesconfig   powerpc
allyesconfig                         clang-19   powerpc
randconfig-001-20240611                          powerpc   randconfig-002-20240611
powerpc               randconfig-003-20240611   powerpc64
randconfig-001-20240611                        powerpc64   randconfig-002-20240611
powerpc64             randconfig-003-20240611   riscv
allmodconfig                            riscv   allmodconfig
clang-19                                riscv   allnoconfig
riscv                               defconfig   riscv
randconfig-001-20240611                            riscv   randconfig-002-20240611
s390                             allmodconfig   s390 
allnoconfig                              s390   allyesconfig
s390                                defconfig   s390 
randconfig-001-20240611                             s390   randconfig-002-20240611
sh                               allmodconfig   sh   
allnoconfig                                sh   allyesconfig
sh                                  defconfig   sh   
randconfig-001-20240611                               sh   randconfig-002-20240611
sparc                            allmodconfig   sparc
allnoconfig                             sparc   defconfig
sparc64                          allmodconfig   sparc64
allyesconfig                          sparc64   defconfig
sparc64               randconfig-001-20240611   sparc64
randconfig-002-20240611                               um   allmodconfig
um                                allnoconfig   um   
allyesconfig                               um   defconfig
um                             i386_defconfig   um   
randconfig-001-20240611                               um   randconfig-002-20240611
um                           x86_64_defconfig   x86_64
allnoconfig                            x86_64   allyesconfig
x86_64       buildonly-randconfig-001-20240611   x86_64
buildonly-randconfig-002-20240611                           x86_64   buildonly-randconfig-003-20240611
x86_64       buildonly-randconfig-004-20240611   x86_64
buildonly-randconfig-005-20240611                           x86_64   buildonly-randconfig-006-20240611
x86_64                              defconfig   x86_64
randconfig-001-20240611                           x86_64   randconfig-002-20240611
x86_64                randconfig-003-20240611   x86_64
randconfig-004-20240611                           x86_64   randconfig-005-20240611
x86_64                randconfig-006-20240611   x86_64
randconfig-011-20240611                           x86_64   randconfig-012-20240611
x86_64                randconfig-013-20240611   x86_64
randconfig-014-20240611                           x86_64   randconfig-015-20240611
x86_64                randconfig-016-20240611   x86_64
randconfig-071-20240611                           x86_64   randconfig-072-20240611
x86_64                randconfig-073-20240611   x86_64
randconfig-074-20240611                           x86_64   randconfig-075-20240611
x86_64                randconfig-076-20240611   x86_64
rhel-8.3-rust                           xtensa   allnoconfig
xtensa                randconfig-001-20240611   xtensa
randconfig-002-20240611                                         

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

