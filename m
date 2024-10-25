Return-Path: <linux-renesas-soc+bounces-10166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E589B134D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 01:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3161B20F79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 23:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC4B157E99;
	Fri, 25 Oct 2024 23:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjpiD881"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089941EC011
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Oct 2024 23:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899280; cv=none; b=g0zivaPDY0eIMFfOV3Fx1ombXaNHHFaSW1eGLDGrPaC9gOw8+HjDwY9IpXwkGVlVwx9PGYW85s6j01/1zBMCoJ3zQHG4NLtPxT8c5P88KeFgEfuKlUiV9EIBasOYjrD6/fx0c78r7R5B5TlLM+lQf8rHc6hiiqFokfOqLC3l/aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899280; c=relaxed/simple;
	bh=84kMwZ7lRT4nBRNmMnZFQU3BRYpPh7sUcpphIwgRdlE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I/IQCl3ugcUeO5Q7Ib1/P8Rfp9Oz+eenrnSf3UFvdnMdUKYFt/2k6pngMErRkcaCORXvI/jSQ0ElIzy/+58cYZi5lgL7dQZUK5MjKYMrhj7THcmZ69KFV3HnOw4g1WnAMw8u2UEcPIwjy93OKhgIwvcPa/URD5kXJAa1lKax/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjpiD881; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729899278; x=1761435278;
  h=date:from:to:cc:subject:message-id;
  bh=84kMwZ7lRT4nBRNmMnZFQU3BRYpPh7sUcpphIwgRdlE=;
  b=IjpiD881nS07ENFiw7xH/PKLGoATO7jmJ9UOyBHkdGzmU/OpqStl3LSH
   a2SSHitgkG1HeAwSfZU4b19tJQ0Pky4T0+t740wJ5W8LQQNfTpkdzHMDy
   BwNbPM9ewByNC3l/rcVdk7ACyDBh7BKtZOOkT6nQ4J9X8rwis8Sz2Ja6o
   3TbfaR5VYR1W8NG1itj1jUxxxBtn5EgR89FZ+JpEbfPu6qm1Vybtqi0F1
   TGBN1V4NQRzvRl2Ncgyot5V1OMLDOYjm+Y5QTUPyIljn/1gvCv453uMNR
   owC1z6bg3Ksp/PkpnjtsMfvRihleeFp5rEn1CZoYELhsidlUKXow7W/9+
   Q==;
X-CSE-ConnectionGUID: UoLzO/lJQSSV9Xyi7pfNwQ==
X-CSE-MsgGUID: lP6l47cPRz65JfQvuRK+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29356055"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29356055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 16:34:37 -0700
X-CSE-ConnectionGUID: LHAZc6FRRkiT4xqDXbUIQA==
X-CSE-MsgGUID: FYsMYG/iR8iQY0D6iNJF0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="81207146"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Oct 2024 16:34:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4TpC-000Z1w-12;
	Fri, 25 Oct 2024 23:34:34 +0000
Date: Sat, 26 Oct 2024 07:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 f407af78c8d3b6035f81152b15ad67063f42514e
Message-ID: <202410260747.RiZ0gcSO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: f407af78c8d3b6035f81152b15ad67063f42514e  pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell helper

elapsed time: 789m

configs tested: 95
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                 allnoconfig    gcc-14.1.0
alpha                allyesconfig    clang-20
alpha                   defconfig    gcc-14.1.0
arc                  allmodconfig    clang-20
arc                   allnoconfig    gcc-14.1.0
arc                  allyesconfig    clang-20
arc                     defconfig    gcc-14.1.0
arm                  allmodconfig    clang-20
arm                   allnoconfig    gcc-14.1.0
arm                  allyesconfig    clang-20
arm                     defconfig    gcc-14.1.0
arm              sp7021_defconfig    gcc-14.1.0
arm64                allmodconfig    clang-20
arm64                 allnoconfig    gcc-14.1.0
arm64                   defconfig    gcc-14.1.0
csky                  allnoconfig    gcc-14.1.0
csky                    defconfig    gcc-14.1.0
hexagon              allmodconfig    clang-20
hexagon               allnoconfig    gcc-14.1.0
hexagon              allyesconfig    clang-20
hexagon                 defconfig    gcc-14.1.0
i386                 allmodconfig    clang-19
i386                  allnoconfig    clang-19
i386                 allyesconfig    clang-19
i386                    defconfig    clang-19
loongarch            allmodconfig    gcc-14.1.0
loongarch             allnoconfig    gcc-14.1.0
loongarch               defconfig    gcc-14.1.0
m68k                 allmodconfig    gcc-14.1.0
m68k                  allnoconfig    gcc-14.1.0
m68k                 allyesconfig    gcc-14.1.0
m68k                    defconfig    gcc-14.1.0
microblaze           allmodconfig    gcc-14.1.0
microblaze            allnoconfig    gcc-14.1.0
microblaze           allyesconfig    gcc-14.1.0
microblaze              defconfig    gcc-14.1.0
mips                  allnoconfig    gcc-14.1.0
mips              eyeq6_defconfig    gcc-14.1.0
mips               ip28_defconfig    gcc-14.1.0
nios2                 allnoconfig    gcc-14.1.0
nios2                   defconfig    gcc-14.1.0
openrisc              allnoconfig    clang-20
openrisc              allnoconfig    gcc-14.1.0
openrisc             allyesconfig    gcc-14.1.0
openrisc                defconfig    gcc-12
parisc               allmodconfig    gcc-14.1.0
parisc                allnoconfig    clang-20
parisc                allnoconfig    gcc-14.1.0
parisc               allyesconfig    gcc-14.1.0
parisc                  defconfig    gcc-12
parisc64                defconfig    gcc-14.1.0
powerpc              allmodconfig    gcc-14.1.0
powerpc               allnoconfig    clang-20
powerpc               allnoconfig    gcc-14.1.0
powerpc              allyesconfig    gcc-14.1.0
powerpc       bluestone_defconfig    gcc-14.1.0
powerpc            fsp2_defconfig    gcc-14.1.0
powerpc         ksi8560_defconfig    gcc-14.1.0
powerpc         ppa8548_defconfig    gcc-14.1.0
powerpc          ppc44x_defconfig    gcc-14.1.0
powerpc     xes_mpc85xx_defconfig    gcc-14.1.0
riscv                allmodconfig    gcc-14.1.0
riscv                 allnoconfig    clang-20
riscv                 allnoconfig    gcc-14.1.0
riscv                allyesconfig    gcc-14.1.0
riscv                   defconfig    gcc-12
s390                 allmodconfig    gcc-14.1.0
s390                  allnoconfig    clang-20
s390                 allyesconfig    gcc-14.1.0
s390                    defconfig    gcc-12
sh                   alldefconfig    gcc-14.1.0
sh                   allmodconfig    gcc-14.1.0
sh                    allnoconfig    gcc-14.1.0
sh                   allyesconfig    gcc-14.1.0
sh             apsh4a3a_defconfig    gcc-14.1.0
sh                      defconfig    gcc-12
sh                hp6xx_defconfig    gcc-14.1.0
sh              r7785rp_defconfig    gcc-14.1.0
sh              rsk7264_defconfig    gcc-14.1.0
sparc                allmodconfig    gcc-14.1.0
sparc64                 defconfig    gcc-12
um                   allmodconfig    clang-20
um                    allnoconfig    clang-17
um                    allnoconfig    clang-20
um                   allyesconfig    clang-20
um                      defconfig    gcc-12
um                 i386_defconfig    gcc-12
um               x86_64_defconfig    gcc-12
x86_64                allnoconfig    clang-19
x86_64               allyesconfig    clang-19
x86_64                  defconfig    clang-19
x86_64                      kexec    clang-19
x86_64                      kexec    gcc-12
x86_64                   rhel-8.3    gcc-12
xtensa                allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

