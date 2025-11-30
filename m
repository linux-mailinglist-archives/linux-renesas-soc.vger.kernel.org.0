Return-Path: <linux-renesas-soc+bounces-25408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE24DC94FA3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36FAD3A3763
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 12:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FD41BCA1C;
	Sun, 30 Nov 2025 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5hCeUhn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D719A288
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Nov 2025 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764507177; cv=none; b=pxHZIsoUQFHvbxjyY0NHTHH1VcA6lqDJ8J2iAgt3yAfksyjHv5LPYac1HqPiFzOIuOHyYO1a09TjN7wIfJbhHWHcCJNOMFwGeMDqln0p0zomxDl1DfxVDqt6JSfc6gJNYuwuhmXZmc3csxXPG4y5d6kqb8xnB/Td+jW2a4gfA00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764507177; c=relaxed/simple;
	bh=ViLNcbEiw3IO9x04iiiEiqzjvAFgPA5OaQ+s4JAS+qI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SrN4QHrorQG1qrxPFKhv60EGqDCbbuzTAYOKtoJX71y3VYjUnlRSj1h8d10Nw2Q0nFln4D+ljO8LPhgx2eIVKj1L2fENC9Z5Qa0/hayUId02Jxb6ol6m4Lyws+tyKK5wnp6jJc+EJ7bHPucOGYzvE1dJdJ9yYiMOqYuoLmMQdIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5hCeUhn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764507176; x=1796043176;
  h=date:from:to:cc:subject:message-id;
  bh=ViLNcbEiw3IO9x04iiiEiqzjvAFgPA5OaQ+s4JAS+qI=;
  b=h5hCeUhns5VPSTKoN1NG7UHsEc+sCrodE39zY01skUa1gn8Ud6PXvb0r
   dnh/UDAJy8gtwxtoq4E9xgC6sOthGgra9eHyIwSkjfUANkeRxkqgD+9OG
   cRZhXOWpxYnxn6KJh5qpzI0Y2la92IYXNIdK7hlzEsnzMMfihyUYfKAZ/
   31DzIxPJsS5+wmPRyL9nAXgGr9Qtpp5pBetxq9swOjV7f6jemP+AH7SG/
   9D/+yp5boE3BiPES9eVUDxBV8GrTohcJYEdu49w5KauMv1WdYGYgLCx2y
   fxB2zGYQel9JDyojf62X+SDTxvkrL+2D5Hoy/tIlOno1PwsbhrEPs/T0c
   A==;
X-CSE-ConnectionGUID: QPh+GopDRvKMohENXbLG0A==
X-CSE-MsgGUID: cm4kTDZbRZ6amkmqqImQdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66487340"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66487340"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 04:52:55 -0800
X-CSE-ConnectionGUID: QNhVghy1RGOyPgmOc3qmjg==
X-CSE-MsgGUID: AqJ41DAoQP6GzFEspaJ5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193839446"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Nov 2025 04:52:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPgv5-000000007xt-3nvz;
	Sun, 30 Nov 2025 12:52:51 +0000
Date: Sun, 30 Nov 2025 20:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 babdbada8f6c28eda432610c958496ebd9d96711
Message-ID: <202511302014.oTMR9LH8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: babdbada8f6c28eda432610c958496ebd9d96711  Merge branches 'renesas-arm-defconfig-for-v6.20' and 'renesas-dts-for-v6.20' into renesas-devel

elapsed time: 2897m

configs tested: 72
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                     defconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                       defconfig    gcc-15.1.0
arc         randconfig-001-20251129    gcc-8.5.0
arc         randconfig-002-20251129    gcc-8.5.0
arm                     allnoconfig    clang-22
arm                       defconfig    clang-22
arm         randconfig-001-20251129    clang-20
arm         randconfig-002-20251129    gcc-10.5.0
arm         randconfig-003-20251129    gcc-13.4.0
arm         randconfig-004-20251129    gcc-8.5.0
arm64                   allnoconfig    gcc-15.1.0
arm64                     defconfig    gcc-15.1.0
arm64                randconfig-003    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                      defconfig    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon                   defconfig    clang-22
i386                    allnoconfig    gcc-14
i386                      defconfig    clang-20
loongarch               allnoconfig    clang-22
m68k                    allnoconfig    gcc-15.1.0
m68k              stmark2_defconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               alldefconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      randconfig-001-20251129    gcc-10.5.0
parisc      randconfig-002-20251129    gcc-13.4.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc            ep88xc_defconfig    gcc-15.1.0
powerpc              icon_defconfig    gcc-15.1.0
powerpc       mpc8315_rdb_defconfig    clang-22
powerpc       mpc837x_rdb_defconfig    gcc-15.1.0
powerpc           ppa8548_defconfig    gcc-15.1.0
powerpc     randconfig-001-20251129    gcc-8.5.0
powerpc     randconfig-002-20251129    clang-22
powerpc64   randconfig-001-20251129    gcc-8.5.0
powerpc64   randconfig-002-20251129    gcc-13.4.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251129    gcc-8.5.0
riscv       randconfig-002-20251129    gcc-11.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-002-20251129    gcc-8.5.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh                  hp6xx_defconfig    gcc-15.1.0
sh          randconfig-001-20251129    gcc-12.5.0
sh          randconfig-002-20251129    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc       randconfig-001-20251129    gcc-8.5.0
sparc       randconfig-002-20251129    gcc-8.5.0
sparc64     randconfig-001-20251129    gcc-8.5.0
sparc64     randconfig-002-20251129    gcc-14.3.0
um                      allnoconfig    clang-22
um          randconfig-001-20251129    clang-22
x86_64                  allnoconfig    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

