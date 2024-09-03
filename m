Return-Path: <linux-renesas-soc+bounces-8625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D37C09693AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 08:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1C24B20DCF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 06:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615131C62AF;
	Tue,  3 Sep 2024 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTElaaD1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5E2E3EB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725345047; cv=none; b=Cq47hYqu6AiMUZqRx4dBVvz0hqZEO/cNpgEx6OH5hhPdEdmNWosH6zEQHyAceTTNtAWNX/aTF7NsE6w/mMVTBq+KQ3dkTpcxzLgVi1AfUO5FCdRPXtZvT2NlNIItIK+Od48Tc0VBQOnKZqV6VGrt7jh24EQBQs3bUrPVo6VAVI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725345047; c=relaxed/simple;
	bh=Xl+Nx+yw0DRErJ+u5Jl8lKVMoC8uXjh2xEcEU5j2XCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HK0whV5rvCvODcdB9q4wWaEh9rZ5Ibe4L+8ZmA3CfX9W4Olsfnmn4S53Fb/JLx78bDGpPONq69q38jaC7IbZpvn0C/Hmp63pZO/LAno7qy/eJdG0K4EsbA+2d8iw6z103+tQSSHJ5jeXuShbsAdxppL9BS51SEfZxVGSHTfFBvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTElaaD1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725345045; x=1756881045;
  h=date:from:to:cc:subject:message-id;
  bh=Xl+Nx+yw0DRErJ+u5Jl8lKVMoC8uXjh2xEcEU5j2XCY=;
  b=DTElaaD1Fz1WlkqCuJGs8pQeOIXWA81ujIYJYhX19CCN1wLiRiW8KPye
   1L45LZouBM14+0f8g71/Th4rE408gdzvUiWYfE+NMZUm467uDCndnPG5h
   Ee6QGqGbDu1iMNwhrMzVyePc0FTaOgHEFMLAzLtFcqxYMeMWOjJ0S/P1R
   X8iLQH/jNolFoH5sz6hb093hp7f06KmJOfd4yVOD9i/f4in2CTD6BpPn3
   kwRuT/qIftAfEKUPKPaR/nuzr2zj1gJ4uybMr1dmhDDyTDO5ytyoB1kJj
   mO78jb+Mr5vF5iiwoMhs0ddYtLF7VCtZrhAo0Cyh4b+OfTlDG7NsfAwDq
   w==;
X-CSE-ConnectionGUID: EuwPS/tXRKGC/S/V7KnG3Q==
X-CSE-MsgGUID: vy7TsKchQNqlLv0g6IglEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24077722"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="24077722"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 23:30:45 -0700
X-CSE-ConnectionGUID: M2IU70P/SNuOI65g6YiYmg==
X-CSE-MsgGUID: F01JfM3URwmY4lnia0JDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="64841236"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2024 23:30:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slN3p-0006JP-3B;
	Tue, 03 Sep 2024 06:30:41 +0000
Date: Tue, 03 Sep 2024 14:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 284f4e0d3f0ba80fe5eb5563807d39c6eec0432f
Message-ID: <202409031456.HDWdYyPB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 284f4e0d3f0ba80fe5eb5563807d39c6eec0432f  Merge branch 'renesas-next', tag 'v6.11-rc6' into renesas-devel

elapsed time: 1198m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240903   gcc-12
i386         buildonly-randconfig-002-20240903   gcc-12
i386         buildonly-randconfig-003-20240903   gcc-12
i386         buildonly-randconfig-004-20240903   gcc-12
i386         buildonly-randconfig-005-20240903   gcc-12
i386         buildonly-randconfig-006-20240903   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240903   gcc-12
i386                  randconfig-002-20240903   gcc-12
i386                  randconfig-003-20240903   gcc-12
i386                  randconfig-004-20240903   gcc-12
i386                  randconfig-005-20240903   gcc-12
i386                  randconfig-006-20240903   gcc-12
i386                  randconfig-011-20240903   gcc-12
i386                  randconfig-012-20240903   gcc-12
i386                  randconfig-013-20240903   gcc-12
i386                  randconfig-014-20240903   gcc-12
i386                  randconfig-015-20240903   gcc-12
i386                  randconfig-016-20240903   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

