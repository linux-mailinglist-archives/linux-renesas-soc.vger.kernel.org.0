Return-Path: <linux-renesas-soc+bounces-18596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A7AE234F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 22:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 492027B1A96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 20:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FED21FBEA6;
	Fri, 20 Jun 2025 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkI+awry"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AED83A14
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jun 2025 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750450394; cv=none; b=mFoKRvm3B95W20XRvBP9x51gJ9PDjqIZ1wBGmN3ITzQnIw8p41wqQFvdecTVso+PghQ2jTER6hoX53uzhJys83VXDWGLpkTbWAIhYJRF4EMlSRCob5bxtoBaLMRmTOUvzAbagkkVBAca+RVvaPeV/9d2PyhiIoLxWHuAS62dBvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750450394; c=relaxed/simple;
	bh=iamvAbWs/QINeBLH/dJH7VzOfP848lWhr0QTFkhwNR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U5OOqs4FZyyPWwaaF9ShJC5ROJ+mY+YqbeFAC8YFoQ5/CdWqbCnAfHU3QoqrOreQYPNUnTTlNvgDVUe9pHFi4psH8TNo0WyNF+SszIbOywDVgodh4/d27spbPHCYI000cXxb2t5bOBU2EC4Qre0PjXrtjZiBqBAp52BBQiviJcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkI+awry; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750450392; x=1781986392;
  h=date:from:to:cc:subject:message-id;
  bh=iamvAbWs/QINeBLH/dJH7VzOfP848lWhr0QTFkhwNR8=;
  b=QkI+awryuXzydfZo0JN6cGR0IYaGJf63rvF4GBCnchV3Q910CsieMKtY
   eKqex5fX6zY6KetpS+RG2dAJ8AXATe6aqu4+NcmEzJFnyV3qKX2C258lF
   ApoFu3lyoWfT7CFSHUhmFZswPAST67g28aRJjSUxQxYc6UCd3hbVmnNze
   T5eUJp478mexyTtQXiR9XxrFL8U7WDy/1iO1t32UjbvkQvwNG1n4aG2nx
   Vfc7RDApJaSUxyP8sBoe+t4UleumSMcxOpCHVI/CkqeCVOpnyuRQwGv4M
   +4dA0HlbpSpwjonjttDQ5uV1TS1NhKGZlHIn9V2Rae3h3hbQhZJ+TVcPB
   w==;
X-CSE-ConnectionGUID: e1bc3FAHRFaDAN7EWp/K2A==
X-CSE-MsgGUID: HFfET9A0T4uxgQ8IQu9kwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52688622"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52688622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 13:13:10 -0700
X-CSE-ConnectionGUID: MOQsfUoXRMGIvKCsHDl3eg==
X-CSE-MsgGUID: oo+Jz2+SRSKsJU6m9zyZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="182033153"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jun 2025 13:13:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSi6k-000M7y-0Y;
	Fri, 20 Jun 2025 20:13:06 +0000
Date: Sat, 21 Jun 2025 04:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.17] BUILD SUCCESS
 d2d0b64f57341391b77b2f727af9db64df80549d
Message-ID: <202506210412.yPUK1P7U-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.17
branch HEAD: d2d0b64f57341391b77b2f727af9db64df80549d  arm64: dts: renesas: rcar-gen3: Add bootph-all to sysinfo EEPROMs

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250620
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-052-20250620
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-053-20250620
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
|-- arm64-randconfig-054-20250620
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
|   `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected
`-- arm64-randconfig-055-20250620
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
    `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected

elapsed time: 1459m

configs tested: 155
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250620    gcc-8.5.0
arc                   randconfig-002-20250620    gcc-11.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-21
arm                   randconfig-001-20250620    clang-21
arm                   randconfig-002-20250620    clang-21
arm                   randconfig-003-20250620    clang-21
arm                   randconfig-004-20250620    clang-21
arm                           sama7_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250620    gcc-9.5.0
arm64                 randconfig-002-20250620    gcc-8.5.0
arm64                 randconfig-003-20250620    gcc-11.5.0
arm64                 randconfig-004-20250620    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250620    gcc-13.3.0
csky                  randconfig-002-20250620    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250620    clang-21
hexagon               randconfig-002-20250620    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250620    clang-20
i386        buildonly-randconfig-002-20250620    clang-20
i386        buildonly-randconfig-003-20250620    clang-20
i386        buildonly-randconfig-004-20250620    clang-20
i386        buildonly-randconfig-005-20250620    clang-20
i386        buildonly-randconfig-006-20250620    clang-20
i386        buildonly-randconfig-006-20250620    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250620    gcc-12
i386                  randconfig-002-20250620    gcc-12
i386                  randconfig-003-20250620    gcc-12
i386                  randconfig-004-20250620    gcc-12
i386                  randconfig-005-20250620    gcc-12
i386                  randconfig-006-20250620    gcc-12
i386                  randconfig-007-20250620    gcc-12
i386                  randconfig-011-20250620    gcc-12
i386                  randconfig-012-20250620    gcc-12
i386                  randconfig-013-20250620    gcc-12
i386                  randconfig-014-20250620    gcc-12
i386                  randconfig-015-20250620    gcc-12
i386                  randconfig-016-20250620    gcc-12
i386                  randconfig-017-20250620    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250620    gcc-14.3.0
loongarch             randconfig-002-20250620    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250620    gcc-8.5.0
nios2                 randconfig-002-20250620    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250620    gcc-10.5.0
parisc                randconfig-002-20250620    gcc-12.4.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       eiger_defconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250620    clang-21
powerpc               randconfig-002-20250620    gcc-11.5.0
powerpc               randconfig-003-20250620    clang-21
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250620    gcc-14.3.0
powerpc64             randconfig-002-20250620    clang-21
powerpc64             randconfig-003-20250620    clang-19
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250620    gcc-14.3.0
riscv                 randconfig-002-20250620    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250620    gcc-9.3.0
s390                  randconfig-002-20250620    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20250620    gcc-15.1.0
sh                    randconfig-002-20250620    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250620    gcc-8.5.0
sparc                 randconfig-002-20250620    gcc-10.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250620    gcc-13.3.0
sparc64               randconfig-002-20250620    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250620    clang-21
um                    randconfig-002-20250620    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250620    gcc-12
x86_64      buildonly-randconfig-002-20250620    gcc-12
x86_64      buildonly-randconfig-003-20250620    clang-20
x86_64      buildonly-randconfig-004-20250620    gcc-12
x86_64      buildonly-randconfig-005-20250620    gcc-12
x86_64      buildonly-randconfig-006-20250620    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250620    clang-20
x86_64                randconfig-072-20250620    clang-20
x86_64                randconfig-073-20250620    clang-20
x86_64                randconfig-074-20250620    clang-20
x86_64                randconfig-075-20250620    clang-20
x86_64                randconfig-076-20250620    clang-20
x86_64                randconfig-077-20250620    clang-20
x86_64                randconfig-078-20250620    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250620    gcc-8.5.0
xtensa                randconfig-002-20250620    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

