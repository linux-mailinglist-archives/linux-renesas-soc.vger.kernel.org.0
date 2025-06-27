Return-Path: <linux-renesas-soc+bounces-18851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E463DAEBB87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 17:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9A6216BDDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 15:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A59927F00F;
	Fri, 27 Jun 2025 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGwYIE4M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFF9443
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037619; cv=none; b=TDqQaWJP4MxnbZtLxY3VTodjsipifujWTRbzSTeQ5/f8U4Xu+wn/njnsZmhGBgxou2N34TwENiR1MD5i0Dbi2Vc06PxNokiBjqS5jzwun+eaZ3L3mH6gkHu80QZu3l8ACyYEUoTdsRHpb4MrsVDSeq4FGmzroQDk8QO+DxOEjF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037619; c=relaxed/simple;
	bh=FNFMX7v/gQQGp1fgKsylWu7th3pgtXS7ijiG9ZI5rQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EWg17GMV/c6+TqRNEnqd1o36dGkZ/LR7FrLpSeMJ09gMNjQzGm9oOwjvnWouYOO4fhVVdjsoKk7seQZeQSj8QqIAmnLssFmK0HyGS3xUUPt0Ds0iSghpCcR8pS9vOpH10Xp88hGZU7NUzejXMJcLAU0LE2cd/NhskRtcSKOaQJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGwYIE4M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751037617; x=1782573617;
  h=date:from:to:cc:subject:message-id;
  bh=FNFMX7v/gQQGp1fgKsylWu7th3pgtXS7ijiG9ZI5rQU=;
  b=WGwYIE4Mhogdm1WzVX/RrWXer3AF4LVNBxgXR9s59bWWufbzYqP4092e
   EztsSp1XUVNMkL9/tjtZk1zkYnIVXXZ1BWnoKyvuw00VsStZYAk25+UY1
   EE7q1fry+etalCAX2JvW3FzExUfZ2fxNl0Z3BK1VQynnRYP0fQNj2bs7b
   zASYxmo+MpM1Qoc5SINifoulaFOkXXdaP0UtJjdYRyIcxtyMQiZfLlqWf
   RUc5VsiX/QpOpFbfsVcyownF697OivuuQGu7wOory7UFkfHlFT0Y1+Uww
   7ROO1MXnrfWHtJv64jqPVpcNhScgBIZHlbrq1Ey1VxIBnGnDyKpCSA/kS
   w==;
X-CSE-ConnectionGUID: fbO2NyAyT2qcDxUE1GHT7g==
X-CSE-MsgGUID: 8f6KKcMsSQu5t5/xlpuegw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53215657"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53215657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:20:17 -0700
X-CSE-ConnectionGUID: pRnF4v67QzuBeZU8GOd1iA==
X-CSE-MsgGUID: /FGuELQgSwy1dl5ZmwxSBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157373213"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jun 2025 08:20:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVAs9-000WJW-1O;
	Fri, 27 Jun 2025 15:20:13 +0000
Date: Fri, 27 Jun 2025 23:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.17] BUILD SUCCESS
 41ffbb1c42d30a173cc43e931bbaf7bf29e92d1f
Message-ID: <202506272347.WU6F1roV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.17
branch HEAD: 41ffbb1c42d30a173cc43e931bbaf7bf29e92d1f  arm64: dts: renesas: r9a09g047: Add GBETH nodes

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250627
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-052-20250627
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-053-20250627
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-054-20250627
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
`-- arm64-randconfig-055-20250627
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
    `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected

elapsed time: 1451m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250627    gcc-8.5.0
arc                   randconfig-002-20250627    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-21
arm                   randconfig-001-20250627    gcc-15.1.0
arm                   randconfig-002-20250627    gcc-10.5.0
arm                   randconfig-003-20250627    clang-21
arm                   randconfig-004-20250627    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250627    clang-17
arm64                 randconfig-002-20250627    gcc-10.5.0
arm64                 randconfig-003-20250627    gcc-12.3.0
arm64                 randconfig-004-20250627    clang-19
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250627    gcc-15.1.0
csky                  randconfig-002-20250627    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250627    clang-21
hexagon               randconfig-002-20250627    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250627    gcc-12
i386        buildonly-randconfig-002-20250627    gcc-12
i386        buildonly-randconfig-003-20250627    gcc-12
i386        buildonly-randconfig-004-20250627    gcc-12
i386        buildonly-randconfig-005-20250627    clang-20
i386        buildonly-randconfig-006-20250627    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250627    gcc-15.1.0
loongarch             randconfig-002-20250627    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-21
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250627    gcc-8.5.0
nios2                 randconfig-002-20250627    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250627    gcc-9.3.0
parisc                randconfig-002-20250627    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc               randconfig-001-20250627    gcc-15.1.0
powerpc               randconfig-002-20250627    clang-21
powerpc               randconfig-003-20250627    gcc-15.1.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250627    gcc-12.4.0
powerpc64             randconfig-002-20250627    gcc-10.5.0
powerpc64             randconfig-003-20250627    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250627    gcc-9.3.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc64                          alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250627    clang-20
x86_64      buildonly-randconfig-002-20250627    clang-20
x86_64      buildonly-randconfig-003-20250627    clang-20
x86_64      buildonly-randconfig-004-20250627    clang-20
x86_64      buildonly-randconfig-005-20250627    gcc-12
x86_64      buildonly-randconfig-006-20250627    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

