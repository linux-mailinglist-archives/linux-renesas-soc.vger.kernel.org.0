Return-Path: <linux-renesas-soc+bounces-12502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B71A1C419
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 16:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C7E31889577
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 15:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F179412B93;
	Sat, 25 Jan 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPUDWkEW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C73A3232
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737820159; cv=none; b=UuijfHqp8EJTnxYnk3zXLlXb/6mcYuNBt3nEnFsWXcTST7o1hbtMwIDuwUw3RJvBQExfRrZTAuyOEMF0EybjA1swZAZa63+e4pjyKfinAR4h8uNtqHH88SGdzpeLFcgBrbtC7NRAqqlnJE/hhHBA2oeQg31bkqSRvSi+cI6uIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737820159; c=relaxed/simple;
	bh=deVPXSXwdWb5EPlAUnMp/UWc38EZ/k/7zn83CRtCEuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GifgTOTPJT0CBhA6DPZxj8ASDv4afoJzQthcHMrfs7PFQp1RWtKfPvTxn8HkEP7aP4TZtv4VTazkgDWDIRyYgJGs6sdl1NFFfnVzMCHBHmOluGz0nOD3fJiNGJOCr/8pbE1Qp0efXvVTt5baAIp2baUZ4D8iFkHKLTxsBxF8bN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPUDWkEW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737820158; x=1769356158;
  h=date:from:to:cc:subject:message-id;
  bh=deVPXSXwdWb5EPlAUnMp/UWc38EZ/k/7zn83CRtCEuk=;
  b=TPUDWkEWY9rh1ytJlZ2pJqwSriF9gd+hPgRLn+4JFlocCeki9BKkkHx7
   IoUcFH38QgDZSbiMXzh6Yf9+/8vpf8tho0WsdkFFzTSvO7lk/UE6y8K8i
   PrXo+8LrwIWTsoiNLjvhU1zfiJdK7U4ODEGo6xR1xZh51N3pd8pTcsX1U
   ECNbHpDsdTImiQ016p8zmK4kmIublA3wJbtTNtmrq+W/OrAviz3Fypemd
   85JwUmL7lM8nZSkL+KqW7pxNJ+b9w+EFy5D+wkEP6qb9/cydWRXGeWdht
   UTF84t1Zgmg3AgVQYO+pWaZvgQCqYpP18v09NWsJNMOesQ01HFuFY1gYo
   w==;
X-CSE-ConnectionGUID: m3l/djuaSxO2qp2d1m2nGg==
X-CSE-MsgGUID: W+hJD52sQeerDfbCTGY98g==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="37596015"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="37596015"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 07:49:17 -0800
X-CSE-ConnectionGUID: awhpN0nLQYa5HHrLINkiSg==
X-CSE-MsgGUID: I0+Tcbd/RFiOhPNWlbWe3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112655587"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2025 07:49:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbiPK-000dyf-1N;
	Sat, 25 Jan 2025 15:49:14 +0000
Date: Sat, 25 Jan 2025 23:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 d1be18bd0830e8e5c62e1eab570e890d70a4fafb
Message-ID: <202501252340.bzSndA0v-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: d1be18bd0830e8e5c62e1eab570e890d70a4fafb  arm64: dts: renesas: r9a09g057: Enable SYS node

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: /: failed to match any schema with compatible: ['yuridenki,kakip', 'renesas,r9a09g057h48', 'renesas,r9a09g057']

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20250125
    |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
    `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057

elapsed time: 1196m

configs tested: 192
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250125    gcc-13.2.0
arc                   randconfig-002-20250125    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                   randconfig-001-20250125    gcc-14.2.0
arm                   randconfig-002-20250125    gcc-14.2.0
arm                   randconfig-003-20250125    clang-18
arm                   randconfig-004-20250125    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250125    gcc-14.2.0
arm64                 randconfig-002-20250125    gcc-14.2.0
arm64                 randconfig-003-20250125    gcc-14.2.0
arm64                 randconfig-004-20250125    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250125    gcc-14.2.0
csky                  randconfig-002-20250125    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20250125    clang-20
hexagon               randconfig-001-20250125    gcc-14.2.0
hexagon               randconfig-002-20250125    clang-20
hexagon               randconfig-002-20250125    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250125    gcc-12
i386        buildonly-randconfig-002-20250125    clang-19
i386        buildonly-randconfig-003-20250125    gcc-12
i386        buildonly-randconfig-004-20250125    clang-19
i386        buildonly-randconfig-005-20250125    clang-19
i386        buildonly-randconfig-006-20250125    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250125    clang-19
i386                  randconfig-002-20250125    clang-19
i386                  randconfig-003-20250125    clang-19
i386                  randconfig-004-20250125    clang-19
i386                  randconfig-005-20250125    clang-19
i386                  randconfig-006-20250125    clang-19
i386                  randconfig-007-20250125    clang-19
i386                  randconfig-011-20250125    gcc-12
i386                  randconfig-012-20250125    gcc-12
i386                  randconfig-013-20250125    gcc-12
i386                  randconfig-014-20250125    gcc-12
i386                  randconfig-015-20250125    gcc-12
i386                  randconfig-016-20250125    gcc-12
i386                  randconfig-017-20250125    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250125    gcc-14.2.0
loongarch             randconfig-002-20250125    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250125    gcc-14.2.0
nios2                 randconfig-002-20250125    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250125    gcc-14.2.0
parisc                randconfig-002-20250125    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     mpc512x_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250125    clang-18
powerpc               randconfig-001-20250125    gcc-14.2.0
powerpc               randconfig-002-20250125    gcc-14.2.0
powerpc               randconfig-003-20250125    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.1.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250125    gcc-14.2.0
powerpc64             randconfig-002-20250125    clang-20
powerpc64             randconfig-002-20250125    gcc-14.2.0
powerpc64             randconfig-003-20250125    clang-16
powerpc64             randconfig-003-20250125    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250125    gcc-14.2.0
riscv                 randconfig-002-20250125    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20250125    clang-19
s390                  randconfig-001-20250125    gcc-14.2.0
s390                  randconfig-002-20250125    clang-20
s390                  randconfig-002-20250125    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                    randconfig-001-20250125    gcc-14.2.0
sh                    randconfig-002-20250125    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250125    gcc-14.2.0
sparc                 randconfig-002-20250125    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250125    gcc-14.2.0
sparc64               randconfig-002-20250125    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250125    clang-20
um                    randconfig-001-20250125    gcc-14.2.0
um                    randconfig-002-20250125    gcc-11
um                    randconfig-002-20250125    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250125    clang-19
x86_64      buildonly-randconfig-002-20250125    clang-19
x86_64      buildonly-randconfig-002-20250125    gcc-11
x86_64      buildonly-randconfig-003-20250125    clang-19
x86_64      buildonly-randconfig-004-20250125    clang-19
x86_64      buildonly-randconfig-004-20250125    gcc-12
x86_64      buildonly-randconfig-005-20250125    clang-19
x86_64      buildonly-randconfig-006-20250125    clang-19
x86_64      buildonly-randconfig-006-20250125    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250125    clang-19
x86_64                randconfig-002-20250125    clang-19
x86_64                randconfig-003-20250125    clang-19
x86_64                randconfig-004-20250125    clang-19
x86_64                randconfig-005-20250125    clang-19
x86_64                randconfig-006-20250125    clang-19
x86_64                randconfig-007-20250125    clang-19
x86_64                randconfig-008-20250125    clang-19
x86_64                randconfig-071-20250125    clang-19
x86_64                randconfig-072-20250125    clang-19
x86_64                randconfig-073-20250125    clang-19
x86_64                randconfig-074-20250125    clang-19
x86_64                randconfig-075-20250125    clang-19
x86_64                randconfig-076-20250125    clang-19
x86_64                randconfig-077-20250125    clang-19
x86_64                randconfig-078-20250125    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250125    gcc-14.2.0
xtensa                randconfig-002-20250125    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

