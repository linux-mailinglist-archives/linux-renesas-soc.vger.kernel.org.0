Return-Path: <linux-renesas-soc+bounces-3400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9383086EE94
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 05:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D74284E41
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 04:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B2964B;
	Sat,  2 Mar 2024 04:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMN/+xkF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD018E
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Mar 2024 04:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709353822; cv=none; b=W6jZNXqShzF2L3dRjqHfYEGWesomc7s5ChXo9JyMwMlopf9oGjBQ8vZTPIDkJYXc4V2QvYhrF+qBhdfdXX2Xnn9XiOgj+WEpe3jEDbW+cZlzMhTJYLYkpD6oXahS3EpCXvwlEO9C+xq/cFk1M+mQ3IykHaci8tqQ4zsFVv4ruCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709353822; c=relaxed/simple;
	bh=qN+YiIR0F9uQ2OqridtFA+ZYOOWwrONY6iNEoKpiWmk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mEZYOxfZDPgZntVwq8wjfk177PyNiD3NHvB0eRjcbX4RqdzimgLDXx/FwuwkdxuDNKhyGrVbW3vF29+y1UFo3bnXD8YYhNry8xE8AAL3kxFDPnuvJPri36Y58tyklIuU5Bs+8vOMj/pHIPcJNvWg1zvq73lov48GgrQHD+e5Rj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMN/+xkF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709353820; x=1740889820;
  h=date:from:to:cc:subject:message-id;
  bh=qN+YiIR0F9uQ2OqridtFA+ZYOOWwrONY6iNEoKpiWmk=;
  b=SMN/+xkFSyMgajDKZEVWFITuT56SJycTGO2Z1cQAm3FW2YL4VooXnecv
   FW2cB269GFWI9sib25DLEMSPvnnUY+ouwh8pXu1Z7MLzerF+gU6ZRJd6E
   XwfsXWf0AaimxQkdF9mp8SQtLb964hN7zcHnrh7+76zXze88aWO0dfybX
   kS0xjBalUsxhKlECtqtGtCybNGFCtcV4Lm3FSmpZHILwsrRm+5QQ50gej
   nUFPNgfvAYhn7y9GmEy7c57HwTW5UFxyMpXOWB7LkdT8PKGvgEsI0canJ
   nQVojkhfWXlDMpaRTRQPy67NeA6quPXn//1GfSrKR4RfTMidi/b76DYN1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3772451"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="3772451"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 20:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8461731"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2024 20:30:19 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgH0q-000EJd-11;
	Sat, 02 Mar 2024 04:30:16 +0000
Date: Sat, 02 Mar 2024 12:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.10] BUILD
 SUCCESS 4ca3df389bd0fc6235749a78f8dec18925b5ec48
Message-ID: <202403021228.NEAWfQRR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.10
branch HEAD: 4ca3df389bd0fc6235749a78f8dec18925b5ec48  arm64: defconfig: Enable R9A09G057 SoC

elapsed time: 730m

configs tested: 106
configs skipped: 152

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240302   gcc  
arc                   randconfig-002-20240302   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240302   gcc  
arm                   randconfig-002-20240302   gcc  
arm                   randconfig-003-20240302   gcc  
arm                   randconfig-004-20240302   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240302   gcc  
arm64                 randconfig-002-20240302   gcc  
arm64                 randconfig-003-20240302   clang
arm64                 randconfig-004-20240302   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240302   gcc  
csky                  randconfig-002-20240302   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240302   gcc  
i386         buildonly-randconfig-003-20240302   gcc  
i386         buildonly-randconfig-005-20240302   gcc  
i386         buildonly-randconfig-006-20240302   gcc  
i386                  randconfig-002-20240302   gcc  
i386                  randconfig-004-20240302   gcc  
i386                  randconfig-005-20240302   gcc  
i386                  randconfig-011-20240302   gcc  
i386                  randconfig-012-20240302   gcc  
i386                  randconfig-013-20240302   gcc  
i386                  randconfig-014-20240302   gcc  
i386                  randconfig-016-20240302   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240302   gcc  
loongarch             randconfig-002-20240302   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240302   gcc  
nios2                 randconfig-002-20240302   gcc  
parisc                randconfig-001-20240302   gcc  
parisc                randconfig-002-20240302   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-003-20240302   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-002-20240302   gcc  
powerpc64             randconfig-003-20240302   gcc  
riscv                            allmodconfig   clang
riscv                            allyesconfig   clang
riscv                 randconfig-001-20240302   gcc  
riscv                 randconfig-002-20240302   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240302   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240302   gcc  
sh                    randconfig-002-20240302   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240302   gcc  
sparc64               randconfig-002-20240302   gcc  
um                               allyesconfig   gcc  
um                    randconfig-001-20240302   gcc  
x86_64       buildonly-randconfig-001-20240302   clang
x86_64       buildonly-randconfig-002-20240302   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240302   clang
x86_64                randconfig-004-20240302   clang
x86_64                randconfig-006-20240302   clang
x86_64                randconfig-011-20240302   clang
x86_64                randconfig-012-20240302   clang
x86_64                randconfig-015-20240302   clang
x86_64                randconfig-071-20240302   clang
x86_64                randconfig-072-20240302   clang
x86_64                randconfig-073-20240302   clang
x86_64                randconfig-075-20240302   clang
x86_64                randconfig-076-20240302   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20240302   gcc  
xtensa                randconfig-002-20240302   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

