Return-Path: <linux-renesas-soc+bounces-434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD27FDDB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 17:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7677FB20DA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 16:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6946C3AC0B;
	Wed, 29 Nov 2023 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOmYpUQl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFC3B6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Nov 2023 08:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701276988; x=1732812988;
  h=date:from:to:cc:subject:message-id;
  bh=TDj4AXpYMDTk/BeKYVinjvmske2Hnd0FjyW8tVhKmF0=;
  b=hOmYpUQlTu3LOZ2cdRTJr03Ioe8VBzvz5MXDDSNqLc2gDd1qmITmaD0d
   ZyfuJ+mbOnWIFOsmIHTUbOcVzvE1Bs+8Jte9bOiFtJXPbwgXd1N/iw8/r
   n++ApI1yjQM8nrpK+ewUzVGZOhVwswCykrXuzuIlpkR+D1LckhMtaKf3i
   m8UDOMBD5ppVKhxO4teHhVzuhHgs8v1sP9J3c+AhjvYyJBgogKFZo/xZB
   qJvdglliJct/RWhgMseWyt9EIdDu8yNIojgGPclU4zRlUd8J+FFfVEjGP
   GRucHz0tabnFjqaa+GwEOYfhEPpNep6g78xiQa3j3jWUczvJamNYgxlfl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397088610"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="397088610"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718804737"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="718804737"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Nov 2023 08:56:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8NrL-0000YI-1L;
	Wed, 29 Nov 2023 16:56:23 +0000
Date: Thu, 30 Nov 2023 00:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 23cf697036aab5a6ba8ed130d10fee1d2dd257fc
Message-ID: <202311300018.C9kJ0Wja-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 23cf697036aab5a6ba8ed130d10fee1d2dd257fc  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- arm64-defconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- arm64-randconfig-001-20231129
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- i386-buildonly-randconfig-002-20231129
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- i386-defconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- i386-randconfig-001-20231129
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- i386-randconfig-006-20231129
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- loongarch-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- loongarch-allnoconfig
|   `-- drivers-acpi-acpica-tbfind.c:warning:strncpy-specified-bound-equals-destination-size
|-- loongarch-defconfig
|   |-- drivers-acpi-acpica-tbfind.c:warning:strncpy-specified-bound-equals-destination-size
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- mips-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- riscv-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- riscv-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- sparc-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- sparc64-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- sparc64-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
`-- x86_64-defconfig
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
    `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
clang_recent_errors
|-- i386-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- i386-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- i386-randconfig-015-20231129
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- powerpc-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- powerpc-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- x86_64-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
`-- x86_64-rhel-8.3-rust
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
    |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
    `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit

elapsed time: 1460m

configs tested: 138
configs skipped: 2

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
arc                   randconfig-001-20231129   gcc  
arc                   randconfig-002-20231129   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231129   gcc  
arm                   randconfig-002-20231129   gcc  
arm                   randconfig-003-20231129   gcc  
arm                   randconfig-004-20231129   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231129   gcc  
arm64                 randconfig-002-20231129   gcc  
arm64                 randconfig-003-20231129   gcc  
arm64                 randconfig-004-20231129   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231129   gcc  
csky                  randconfig-002-20231129   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231129   clang
hexagon               randconfig-002-20231129   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231129   gcc  
i386         buildonly-randconfig-002-20231129   gcc  
i386         buildonly-randconfig-003-20231129   gcc  
i386         buildonly-randconfig-004-20231129   gcc  
i386         buildonly-randconfig-005-20231129   gcc  
i386         buildonly-randconfig-006-20231129   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231129   gcc  
i386                  randconfig-002-20231129   gcc  
i386                  randconfig-003-20231129   gcc  
i386                  randconfig-004-20231129   gcc  
i386                  randconfig-005-20231129   gcc  
i386                  randconfig-006-20231129   gcc  
i386                  randconfig-011-20231129   clang
i386                  randconfig-012-20231129   clang
i386                  randconfig-013-20231129   clang
i386                  randconfig-014-20231129   clang
i386                  randconfig-015-20231129   clang
i386                  randconfig-016-20231129   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231129   gcc  
loongarch             randconfig-002-20231129   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231129   gcc  
nios2                 randconfig-002-20231129   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231129   gcc  
parisc                randconfig-002-20231129   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20231129   gcc  
powerpc               randconfig-002-20231129   gcc  
powerpc               randconfig-003-20231129   gcc  
powerpc64             randconfig-001-20231129   gcc  
powerpc64             randconfig-002-20231129   gcc  
powerpc64             randconfig-003-20231129   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231129   gcc  
riscv                 randconfig-002-20231129   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231129   clang
s390                  randconfig-002-20231129   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231129   gcc  
sh                    randconfig-002-20231129   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231129   gcc  
sparc64               randconfig-002-20231129   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231129   gcc  
um                    randconfig-002-20231129   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231129   gcc  
xtensa                randconfig-002-20231129   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

