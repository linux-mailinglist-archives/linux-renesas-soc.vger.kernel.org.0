Return-Path: <linux-renesas-soc+bounces-17286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3153ABEE3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 10:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BDCA7A501F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 08:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7850422B59D;
	Wed, 21 May 2025 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lmlr7dZh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C142235049
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816960; cv=none; b=QK+NmatVJDrL6rGuaefBY6okpvYPogKmp02nYnch05hiJRDtcn/7A+pbYiro1lX2wnWr7BptkbLZBH/TNlr6cK/S9rGB1FVbD+Cl5t0Nq4tePAyicF2yT/WdMnuduhcgCGIFaLAr1JnVtPwfEXkr0kHs2BAMsBSulOPMVKjb6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816960; c=relaxed/simple;
	bh=quKgH7ktL7OHgFKPoYKjCgYrEmY90gVgw4dZONUWITg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FduaSgdKG5AUChP8/1+w7Olmy6H/ldbDelhUzbELzErEFvei1d+0re5lk9t/46XmRJNiOdNlGf2ZGOrVVJZwUGvtAVOq7ClFQMk5IEwvWLxh0QGHMtXPpEf+NMd8FJpoSm8lOMl6+dNN19lV1BFJRUcOjdE0bOrusZERT2mn0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lmlr7dZh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747816959; x=1779352959;
  h=date:from:to:cc:subject:message-id;
  bh=quKgH7ktL7OHgFKPoYKjCgYrEmY90gVgw4dZONUWITg=;
  b=Lmlr7dZhXzC2a7uLNw1MRV0IKCnc1540rXXMHexYiVGXrQHLzLx4VXgj
   c98h+PQZvY9evog0W8wWLFjZrlQpiZN+pMwpCM2dDAx9OtuoWwz9KfFbu
   yfkhYAGg89k7zqOEAVCrw8MDo9/YUpZw2CeCBTdFJxTOFdKDtELkoDekt
   mIGJnQXsioLNzxk19a3LCX8ZQB+s5xz6QUzsAAMJkzhbD268htTG7NCha
   HYggJ1qQ7c0L1M21bo/4utyaCOBEPLeFR3CIsxACWBe7uquQddad0ua+L
   w/06SVnvFEkTzKe76eAB4Ec0ssnMl/JDBB+3+t+UdjwiQWxLaHRFU3kfC
   A==;
X-CSE-ConnectionGUID: T4FX8vhKTi6/tm3eoDXAoA==
X-CSE-MsgGUID: rVCjq/J3R4+o8tFf9zVShg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67338786"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="67338786"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 01:42:38 -0700
X-CSE-ConnectionGUID: 5eilykz6SOS3NQzmugm0XA==
X-CSE-MsgGUID: AiYRO7knRWe/F7awtMalng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170970322"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2025 01:42:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHf22-000O3K-2B;
	Wed, 21 May 2025 08:42:34 +0000
Date: Wed, 21 May 2025 16:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 051b9eadcc17b76b87726d74d18d1b741837adcc
Message-ID: <202505211646.SgaY8OtG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 051b9eadcc17b76b87726d74d18d1b741837adcc  [LOCAL] riscv: rzfive: defconfig: Update rzfive_defconfig

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202505210600.iPS7fzOk-lkp@intel.com

    drivers/gpu/drm/xe/xe_svm.c:712:16: error: implicit declaration of function 'drm_gpusvm_find_vma_start'; did you mean 'xe_svm_find_vma_start'? [-Wimplicit-function-declaration]
    drivers/gpu/drm/xe/xe_svm.c:858:31: error: 'struct xe_device' has no member named 'atomic_svm_timeslice_ms'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-xe-xe_svm.c:error:implicit-declaration-of-function-drm_gpusvm_find_vma_start
|   `-- drivers-gpu-drm-xe-xe_svm.c:error:struct-xe_device-has-no-member-named-atomic_svm_timeslice_ms
|-- loongarch-allyesconfig
|   |-- drivers-gpu-drm-xe-xe_svm.c:error:implicit-declaration-of-function-drm_gpusvm_find_vma_start
|   `-- drivers-gpu-drm-xe-xe_svm.c:error:struct-xe_device-has-no-member-named-atomic_svm_timeslice_ms
`-- powerpc-allmodconfig
    |-- drivers-gpu-drm-xe-xe_svm.c:error:implicit-declaration-of-function-drm_gpusvm_find_vma_start
    `-- drivers-gpu-drm-xe-xe_svm.c:error:struct-xe_device-has-no-member-named-atomic_svm_timeslice_ms

elapsed time: 1081m

configs tested: 118
configs skipped: 1

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250521    gcc-10.5.0
arc                   randconfig-002-20250521    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-21
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250521    clang-16
arm                   randconfig-004-20250521    clang-21
arm                         socfpga_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250521    gcc-6.5.0
arm64                 randconfig-002-20250521    gcc-6.5.0
arm64                 randconfig-003-20250521    gcc-8.5.0
arm64                 randconfig-004-20250521    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250521    gcc-10.5.0
csky                  randconfig-002-20250521    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250521    clang-20
hexagon               randconfig-002-20250521    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250520    gcc-12
i386        buildonly-randconfig-002-20250520    gcc-12
i386        buildonly-randconfig-003-20250520    clang-20
i386        buildonly-randconfig-004-20250520    gcc-12
i386        buildonly-randconfig-005-20250520    clang-20
i386        buildonly-randconfig-006-20250520    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-15.1.0
loongarch             randconfig-002-20250521    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250521    gcc-14.2.0
nios2                 randconfig-002-20250521    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250521    gcc-13.3.0
parisc                randconfig-002-20250521    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    clang-21
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250521    clang-21
powerpc               randconfig-002-20250521    gcc-8.5.0
powerpc               randconfig-003-20250521    gcc-6.5.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250521    gcc-8.5.0
powerpc64             randconfig-002-20250521    gcc-6.5.0
powerpc64             randconfig-003-20250521    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250520    gcc-9.3.0
riscv                 randconfig-002-20250520    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250520    clang-21
s390                  randconfig-002-20250520    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250520    gcc-9.3.0
sh                    randconfig-002-20250520    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250520    gcc-8.5.0
sparc                 randconfig-002-20250520    gcc-12.4.0
sparc64               randconfig-001-20250520    gcc-8.5.0
sparc64               randconfig-002-20250520    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250520    clang-21
um                    randconfig-002-20250520    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250520    gcc-12
x86_64      buildonly-randconfig-002-20250520    gcc-12
x86_64      buildonly-randconfig-003-20250520    gcc-12
x86_64      buildonly-randconfig-004-20250520    gcc-12
x86_64      buildonly-randconfig-005-20250520    gcc-12
x86_64      buildonly-randconfig-006-20250520    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250520    gcc-6.5.0
xtensa                randconfig-002-20250520    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

