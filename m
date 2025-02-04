Return-Path: <linux-renesas-soc+bounces-12830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BBA26827
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 01:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66EB3188638E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 00:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390CC800;
	Tue,  4 Feb 2025 00:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/Ss/F00"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BC11CAF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Feb 2025 00:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627487; cv=none; b=ghX7dtzVcwMrsMW1rENv5VL9ZzifIQYPuMXw0x5ZY/TNWsKvlh7l6bPBY/BoIcalWNMn4ujcgpCdvsm1hRCjmNID2sY77ANH+FvRvoLJZIG7HqTAv20f0FJEv1bFZHC54jxLYgzm9ip9+Y4fLuG9qnOJU0BWGwV+1gUUG1YM/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627487; c=relaxed/simple;
	bh=Gn2D/InOZ5akH7uKZCpV/5blQPhIZJUSkPyhfjifr9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Te+FWxJ69ZPyk7wCCZDpQUzxG+zzzDL/vt8rzj1xfMizTabxWpLBBVkAbsJoLrQefAqF4WyJO3J/PwXXY5B3mjX9gwFjvya5JJDivcleCD9aSekpKZkRKJqCA1mAYX9thBtUhyhV6whytx9nbZsc7WnWs6+fESW/KkSrQcaO4iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/Ss/F00; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738627485; x=1770163485;
  h=date:from:to:cc:subject:message-id;
  bh=Gn2D/InOZ5akH7uKZCpV/5blQPhIZJUSkPyhfjifr9o=;
  b=G/Ss/F00WpZ15wRBZevK+YiYt6Rx0ZwGHtrziasZIfsYZ1lg++WvRCxE
   JlnQXIlLlpoTpah3/inmVRUimOcDnaXqucKwZBTL/WUKpV4tq324EqoRi
   RiwKSV6z4bUc8y2++yq5hr0pgvadyRiWKB+Ve562SczSCseyuMoMR77EM
   zopDXGg0pMPWGFVTN0X1pmh7j7kLZPIR4uvp3ssG1Q1LhsE3dpbLHbNdX
   ESbcNMFNXceumH550Y7SyTvI4wWvHXWOpTZtJZOCTosskrO4pj1t6akhD
   RcWZRiKGFwR11Fea2SDtIsAQFGhC5bbKpiZHqdk1FO5KTZBCOTAk9hrU1
   A==;
X-CSE-ConnectionGUID: xUnrZulFQ4akdJCpejd88w==
X-CSE-MsgGUID: GjyJg+bTRTyNOkUfSUKR2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56675518"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="56675518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 16:04:43 -0800
X-CSE-ConnectionGUID: 1GM6T7mJTDuJvEflkeQeKg==
X-CSE-MsgGUID: hUosQmbmRBC5jn1REp9Cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141278617"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 16:04:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf6Qi-000rid-0q;
	Tue, 04 Feb 2025 00:04:40 +0000
Date: Tue, 04 Feb 2025 08:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 0e065dffc84cdf90c3dbf2ed04a7448983bf4d29
Message-ID: <202502040803.xLva4ZKq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: 0e065dffc84cdf90c3dbf2ed04a7448983bf4d29  arm64: dts: renesas: r9a09g057: Enable SYS node

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250204
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
|-- arm64-randconfig-052-20250204
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
|-- arm64-randconfig-053-20250204
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
|-- arm64-randconfig-054-20250204
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
`-- arm64-randconfig-055-20250204
    |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
    |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
    `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057

elapsed time: 729m

configs tested: 73
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                           allnoconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250204    gcc-12
i386        buildonly-randconfig-003-20250204    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250204    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250204    clang-19
i386                  randconfig-012-20250204    clang-19
i386                  randconfig-013-20250204    clang-19
i386                  randconfig-014-20250204    clang-19
i386                  randconfig-015-20250204    clang-19
i386                  randconfig-016-20250204    clang-19
i386                  randconfig-017-20250204    clang-19
loongarch                         allnoconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
powerpc                           allnoconfig    clang-21
powerpc                      pasemi_defconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                                defconfig    gcc-12
sh                                allnoconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                                allnoconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250204    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

