Return-Path: <linux-renesas-soc+bounces-10189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE5A9B41B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 06:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3A67B224ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 05:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD8D2F56;
	Tue, 29 Oct 2024 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARdd7WtT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE34161
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Oct 2024 05:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730178166; cv=none; b=sqajm9Td/m71c47iKamJHDFL7dFujAYUarElnMysrR3kTajVND3aF8TsIaaQbmdLlom4njCsM2TTWPcUGZgP3kFOo/m97PGDWLjxs2rhZGoSmbiY8nE2Yb1cFjz6+RC4RtTHvNHYCyW0TYDacH55cKYsEddzXNXJTV9vTwirUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730178166; c=relaxed/simple;
	bh=vVE0PbhbT0LOzccsj2K4ZxyDCdVItPuxnzNtUq/Ynis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NlasM86QY/lTvDK/PNEb56AF6NKxp79vu09qTRFgwGG21tnQclAlVBIF+xgMbBEptLcIABASURFWDSiFfY1ebeHw1TSan4CP31FeDUTMB7umIH2YTpdKhfwlsZBOPd2PtVMGFjIIVbgOdFECtzIDTTXvfec7XBNwwdcVR6x7SmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARdd7WtT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730178164; x=1761714164;
  h=date:from:to:cc:subject:message-id;
  bh=vVE0PbhbT0LOzccsj2K4ZxyDCdVItPuxnzNtUq/Ynis=;
  b=ARdd7WtTQOUUip0r9a1tV6pw0V7q/9/nWQIexJeiOJQ9iagFZPgwkMgX
   CmeGyIX5KlB7Os8y8SJRhm17Zt7VEpCOBf3xiSFmjhtkvrKb9nEiM/nqD
   F+lhQYMresbFZhjlTEApcl3A0Y6ePzW6bRsQpx0nlCDTBnUaexxSvJnOE
   Jx8xtAaJYlhI6oyK4Uk4jSBCQeEPB72vfhJf7UsPq/g+y5n3pnZZK0XkY
   wklbz+lXNjDYY1x0sAcKJb+y2bJ4fS3J8K5Y+vme62WRpO5CDZ+cUbJDN
   p8nw7VvcoQRdVoN+FDkJjBQVuwiTP13eIufv405WPYyRZmll041YRl2UP
   A==;
X-CSE-ConnectionGUID: 4Z6CcBc4QxSt+rEYPwnpGQ==
X-CSE-MsgGUID: 45Z+MIRaSHChzzd5dcTrlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29917389"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="29917389"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 22:02:44 -0700
X-CSE-ConnectionGUID: sohGLeXTSwSOfbKJsomt4w==
X-CSE-MsgGUID: qm5SH4xARwSaYEYJuE44zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86395364"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 22:02:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5eNL-000dGW-2K;
	Tue, 29 Oct 2024 05:02:39 +0000
Date: Tue, 29 Oct 2024 13:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.13] BUILD SUCCESS
 1653416691d759984b2223aa246fa067eac35eae
Message-ID: <202410291309.DmacOI8r-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.13
branch HEAD: 1653416691d759984b2223aa246fa067eac35eae  arm64: dts: renesas: white-hawk-cpu-common: Add pin control for DSI-eDP IRQ

elapsed time: 1066m

configs tested: 66
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.1.0
alpha                  allyesconfig    clang-20
alpha                     defconfig    gcc-14.1.0
arc                    allmodconfig    clang-20
arc                     allnoconfig    gcc-14.1.0
arc                    allyesconfig    clang-20
arc                       defconfig    gcc-14.1.0
arm                    allmodconfig    clang-20
arm                    allmodconfig    gcc-14.1.0
arm                     allnoconfig    clang-20
arm                     allnoconfig    gcc-14.1.0
arm                    allyesconfig    clang-20
arm                    allyesconfig    gcc-14.1.0
arm                       defconfig    gcc-14.1.0
arm         randconfig-001-20241029    gcc-14.1.0
arm         randconfig-002-20241029    gcc-14.1.0
arm         randconfig-003-20241029    gcc-14.1.0
arm         randconfig-004-20241029    clang-16
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.1.0
arm64                     defconfig    gcc-14.1.0
arm64       randconfig-001-20241029    clang-17
arm64       randconfig-002-20241029    clang-20
arm64       randconfig-003-20241029    gcc-14.1.0
arm64       randconfig-004-20241029    clang-20
csky                    allnoconfig    gcc-14.1.0
csky                      defconfig    gcc-14.1.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    gcc-14.1.0
hexagon                allyesconfig    clang-20
hexagon                   defconfig    gcc-14.1.0
loongarch               allnoconfig    gcc-14.1.0
loongarch                 defconfig    gcc-14.1.0
m68k                    allnoconfig    gcc-14.1.0
m68k                      defconfig    gcc-14.1.0
microblaze              allnoconfig    gcc-14.1.0
microblaze                defconfig    gcc-14.1.0
mips                    allnoconfig    gcc-14.1.0
nios2                   allnoconfig    gcc-14.1.0
nios2                     defconfig    gcc-14.1.0
openrisc                  defconfig    gcc-12
parisc                    defconfig    gcc-12
parisc64                  defconfig    gcc-14.1.0
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.1.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    gcc-12
riscv       randconfig-001-20241029    clang-20
riscv       randconfig-002-20241029    gcc-14.1.0
s390                   allmodconfig    gcc-14.1.0
s390                   allyesconfig    gcc-14.1.0
s390                      defconfig    gcc-12
sh                     allmodconfig    gcc-14.1.0
sh                      allnoconfig    gcc-14.1.0
sh                     allyesconfig    gcc-14.1.0
sh                        defconfig    gcc-12
sparc                  allmodconfig    gcc-14.1.0
sparc64                   defconfig    gcc-12
um                     allmodconfig    clang-20
um                     allyesconfig    clang-20
um                        defconfig    gcc-12
um                   i386_defconfig    gcc-12
um                 x86_64_defconfig    gcc-12
x86_64                        kexec    gcc-12
x86_64                     rhel-8.3    gcc-12
xtensa                  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

