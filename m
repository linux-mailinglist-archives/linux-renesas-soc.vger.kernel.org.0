Return-Path: <linux-renesas-soc+bounces-25236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D62C8D8A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 10:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A34734563D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 09:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED5A315D29;
	Thu, 27 Nov 2025 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1uyKYHB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D9226F2AD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235694; cv=none; b=D/1b3BBdil9vHMocZAst6S6ot2GhDg+NE4Nku8YdgcxOSXVV8Di7XHKSXrEQDEl1t7CyrF9DCM1cs11hJiwzjkgEYx/Dh8P7IUOBz1EBTE/49ZA36eaeXxnbPBZJni5KkYNHBKOeI/LFnO6NJsJod7Jny8IwVMXMH7MgPMlHvr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235694; c=relaxed/simple;
	bh=dlipXnwSmao6mgJyo8iBt80QIZ5FVjAPG8eHsR41BpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WAlssNYEZvAo19Cb8NZNPPpU92/tvkoKGh2UiY2p4sUHTF+uuyXzx6WhkvYlGOAn2VLrPzT2qo8JvqQjWGb+XWSjXh6R7DCtMDADzrqiLy5MKNj7wfd6fmJxDgrlVNE+tSC+mUjuL3SyX0/Jq3lVlQ3eItqz45hO5VUkOoq+Rwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1uyKYHB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764235693; x=1795771693;
  h=date:from:to:cc:subject:message-id;
  bh=dlipXnwSmao6mgJyo8iBt80QIZ5FVjAPG8eHsR41BpA=;
  b=M1uyKYHBJBYB9jTHXm/+FDbuFrMoaNDLytMUvRjVumGpVLU98iydl45A
   lHoDN+0oXOsTK4LnFxT+q+YIKKlK4Fnckl8rKTT5etxooV/zD5QPo5UIe
   qvr4OKpIcuLZS5ytgUyj+GkcGqPSyhwzGVDipqcb3yl0gGM0/BDalUv+C
   FqZl9DSI0cGFLjHDRB6bmR/X25EivONVj76S+lgcDSsOUambHDWiKRjFb
   pjJ/n2eu9A0irTeqn/986W40JGHTFuvK0pWvPo19NXnlEpUylHCgPWEI9
   zokDvZ6jHRfQk/V7iihvNGPAWRWiYzNjBSJICXBvIYecDJFuG/RYakzwO
   Q==;
X-CSE-ConnectionGUID: RbfM0uTMRqiaDypYV7yPJA==
X-CSE-MsgGUID: ifKEhuJGRGWQUC7SPazbzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76969518"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="76969518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:28:12 -0800
X-CSE-ConnectionGUID: DPe12osHS8KMzdELGDGqSg==
X-CSE-MsgGUID: PIs/kAU2QayqHBrQd+v4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="197341649"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2025 01:28:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOYIK-000000004Ds-2zWO;
	Thu, 27 Nov 2025 09:28:08 +0000
Date: Thu, 27 Nov 2025 17:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 e9c6d77845beb6a40f8475fc6af39e6ef702f415
Message-ID: <202511271713.34dq0igr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: e9c6d77845beb6a40f8475fc6af39e6ef702f415  riscv: rzfive: defconfig: Refresh for v6.18-rc6

elapsed time: 3830m

configs tested: 149
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20251125    gcc-9.5.0
arc                   randconfig-001-20251127    clang-22
arc                   randconfig-002-20251125    gcc-8.5.0
arc                   randconfig-002-20251127    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-22
arm                   randconfig-001-20251125    clang-22
arm                   randconfig-001-20251127    clang-22
arm                   randconfig-002-20251125    gcc-10.5.0
arm                   randconfig-002-20251127    clang-22
arm                   randconfig-003-20251125    gcc-10.5.0
arm                   randconfig-003-20251127    clang-22
arm                   randconfig-004-20251125    gcc-8.5.0
arm                   randconfig-004-20251127    clang-22
arm                         s3c6400_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251127    gcc-15.1.0
arm64                 randconfig-002-20251127    gcc-15.1.0
arm64                 randconfig-003-20251127    gcc-15.1.0
arm64                 randconfig-004-20251127    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251127    gcc-15.1.0
csky                  randconfig-002-20251127    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon               randconfig-001-20251125    clang-19
hexagon               randconfig-002-20251125    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251125    gcc-15.1.0
loongarch             randconfig-002-20251125    gcc-12.5.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251125    gcc-8.5.0
nios2                 randconfig-002-20251125    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251125    gcc-13.4.0
parisc                randconfig-001-20251127    gcc-13.4.0
parisc                randconfig-002-20251125    gcc-10.5.0
parisc                randconfig-002-20251127    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc                   bluestone_defconfig    clang-22
powerpc                 linkstation_defconfig    clang-22
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20251125    clang-19
powerpc               randconfig-001-20251127    gcc-13.4.0
powerpc               randconfig-002-20251125    gcc-8.5.0
powerpc               randconfig-002-20251127    gcc-13.4.0
powerpc64             randconfig-001-20251125    clang-16
powerpc64             randconfig-001-20251127    gcc-13.4.0
powerpc64             randconfig-002-20251125    gcc-15.1.0
powerpc64             randconfig-002-20251127    gcc-13.4.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251125    gcc-8.5.0
riscv                 randconfig-001-20251127    gcc-12.5.0
riscv                 randconfig-002-20251125    gcc-13.4.0
riscv                 randconfig-002-20251127    gcc-12.5.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251125    gcc-8.5.0
s390                  randconfig-001-20251127    gcc-12.5.0
s390                  randconfig-002-20251125    gcc-14.3.0
s390                  randconfig-002-20251127    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    clang-22
sh                    randconfig-001-20251125    gcc-15.1.0
sh                    randconfig-001-20251127    gcc-12.5.0
sh                    randconfig-002-20251125    gcc-15.1.0
sh                    randconfig-002-20251127    gcc-12.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251125    gcc-14.3.0
sparc                 randconfig-001-20251127    clang-22
sparc                 randconfig-002-20251125    gcc-13.4.0
sparc                 randconfig-002-20251127    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251125    clang-22
sparc64               randconfig-001-20251127    clang-22
sparc64               randconfig-002-20251125    gcc-8.5.0
sparc64               randconfig-002-20251127    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251125    clang-22
um                    randconfig-001-20251127    clang-22
um                    randconfig-002-20251125    clang-22
um                    randconfig-002-20251127    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20251127    clang-20
x86_64      buildonly-randconfig-002-20251127    clang-20
x86_64      buildonly-randconfig-003-20251127    clang-20
x86_64      buildonly-randconfig-004-20251127    clang-20
x86_64      buildonly-randconfig-005-20251127    clang-20
x86_64      buildonly-randconfig-006-20251127    clang-20
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251125    gcc-8.5.0
xtensa                randconfig-001-20251127    clang-22
xtensa                randconfig-002-20251125    gcc-8.5.0
xtensa                randconfig-002-20251127    clang-22
xtensa                    xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

