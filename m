Return-Path: <linux-renesas-soc+bounces-19365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7442CAFC080
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 04:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00E2C4A3668
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 02:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419FF158538;
	Tue,  8 Jul 2025 02:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlnOtr/H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A33217719
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 02:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751940601; cv=none; b=hGJxymX0BPoBNNGVGrRk8h/+ByUmLgp0tdBTZnHmpo4KfF7j54amatOcpa6Zlxua++KU12haA/W8KFvMO5w+m6gkLqC71YShlaoQgqayPSQjr6URHPIp2Xk1NXJ07+dSpek2ow0rBKl0PAa+j53fqo2VymyiiLyhhO193ilueY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751940601; c=relaxed/simple;
	bh=RsVRr31ZrPIqbkyo/B+6CLNpmp5PCQpgFmz08ZZiCtE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iL5NKwuejl9fHtbBVvGSlqLatvfSFL7AiXOJg2c16xmxSOk7xMgkpHiTEA8+Yb3eZ00ppwnxppV5buZb7TcJZOaWvt4/CVqxjQOPO44YWkd316Tb+wX4+eRnlf4np48JjDQ6bD6T1sWtIYFJioXsGT8CPIg2B3IxkiKEXEL9Y8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlnOtr/H; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751940599; x=1783476599;
  h=date:from:to:cc:subject:message-id;
  bh=RsVRr31ZrPIqbkyo/B+6CLNpmp5PCQpgFmz08ZZiCtE=;
  b=jlnOtr/HnZkn+vxCxr1lZYdZB4oFqjQujL1oaF5eMQvcWZsuB6gb/ZEC
   WdaYiW9DHW0wTSDy5hgcyo8gkGnSaKNTv84w8LLM+P0E7kraCzmeMXe9T
   utxX25q42fYbYErhibf2degkK/tGMu8y2li+HKtpzSnIjchS6xcJF+ojr
   lYZbdxp4PxVCJNdpGMbO19nDI3qCN/pXqo8sKa5nmGyyzw4EGTmjq7dBl
   yK9y04tSzpIc9UXZ2Z6z3Mu/GTkjP3vCwWlWdATZxoTnGpV+MWMIH2W8+
   ckvlWevwL/lAHgyUqsI3VMVNmZmudgsWJQO1WKMbx8jnf3knJcpfVI9MV
   w==;
X-CSE-ConnectionGUID: z3Tkns0RRb+eJRgkihMR6g==
X-CSE-MsgGUID: 7h3xw0y4RiKOOVD/SWIpQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56780928"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="56780928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 19:09:59 -0700
X-CSE-ConnectionGUID: 5dCBjmCvRuSRtJAxpkJErA==
X-CSE-MsgGUID: vhOpCcF2Sa2Y8QfDe/qneg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="159640028"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jul 2025 19:09:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYxmN-0000uh-1Z;
	Tue, 08 Jul 2025 02:09:55 +0000
Date: Tue, 08 Jul 2025 10:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.17] BUILD SUCCESS
 05477def4ba90c3a637110eb371b9e342df546a8
Message-ID: <202507081047.u9djauPd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.17
branch HEAD: 05477def4ba90c3a637110eb371b9e342df546a8  arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing install target

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250707
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-052-20250707
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-053-20250707
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-054-20250707
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
`-- arm64-randconfig-055-20250707
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
    `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected

elapsed time: 975m

configs tested: 133
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250707    gcc-15.1.0
arc                   randconfig-002-20250707    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-21
arm                   randconfig-001-20250707    gcc-10.5.0
arm                   randconfig-002-20250707    gcc-11.5.0
arm                   randconfig-003-20250707    clang-21
arm                   randconfig-004-20250707    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250707    gcc-8.5.0
arm64                 randconfig-002-20250707    gcc-11.5.0
arm64                 randconfig-003-20250707    gcc-12.3.0
arm64                 randconfig-004-20250707    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250707    gcc-15.1.0
csky                  randconfig-002-20250707    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250707    clang-21
hexagon               randconfig-002-20250707    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250707    gcc-12
i386        buildonly-randconfig-002-20250707    clang-20
i386        buildonly-randconfig-003-20250707    gcc-12
i386        buildonly-randconfig-004-20250707    gcc-12
i386        buildonly-randconfig-005-20250707    gcc-12
i386        buildonly-randconfig-006-20250707    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250707    clang-21
loongarch             randconfig-002-20250707    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-21
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250707    gcc-10.5.0
nios2                 randconfig-002-20250707    gcc-12.4.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250707    gcc-8.5.0
parisc                randconfig-002-20250707    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc               randconfig-001-20250707    gcc-8.5.0
powerpc               randconfig-002-20250707    clang-21
powerpc               randconfig-003-20250707    gcc-8.5.0
powerpc64             randconfig-001-20250707    gcc-8.5.0
powerpc64             randconfig-002-20250707    gcc-10.5.0
powerpc64             randconfig-003-20250707    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250707    clang-21
riscv                 randconfig-002-20250707    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250707    clang-21
s390                  randconfig-002-20250707    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250707    gcc-15.1.0
sh                    randconfig-002-20250707    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250707    gcc-12.4.0
sparc                 randconfig-002-20250707    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250707    clang-20
sparc64               randconfig-002-20250707    gcc-15.1.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250707    gcc-12
um                    randconfig-002-20250707    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250707    gcc-12
x86_64      buildonly-randconfig-002-20250707    gcc-12
x86_64      buildonly-randconfig-003-20250707    gcc-12
x86_64      buildonly-randconfig-004-20250707    clang-20
x86_64      buildonly-randconfig-005-20250707    gcc-12
x86_64      buildonly-randconfig-006-20250707    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250707    gcc-12.4.0
xtensa                randconfig-002-20250707    gcc-8.5.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

