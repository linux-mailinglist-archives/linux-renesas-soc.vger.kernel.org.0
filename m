Return-Path: <linux-renesas-soc+bounces-18401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B51AADBDA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 01:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A09B3A9547
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 23:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7F31A262D;
	Mon, 16 Jun 2025 23:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtEPvM9f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F52BF01B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 23:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750116736; cv=none; b=m498ZrNJnjuTDRrgemRWWDMw0/zVMYuihoiKQC/kvYGvAZvi+U/iVIBJ0+FQiafAg8Evguv3aAb3qT7c6+4zgyHF3lTY63cJfqJsbwHolTewaXe7tL9B8Uyeal+TpPvBFTgOBdygarF55gZ06HQUu+DZpysAXY4FaZP/E8fncic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750116736; c=relaxed/simple;
	bh=n2EpaQfbh8zqyIrfDJxweuQtb2vBXjj+e9cgjtN2AX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uTU08z6maXvXK26dMatqkMoAStEAh7ep0ZUYAsxZWqiHI4SAfb2t7wRKKFTED6IK2A7yEdEWUU4UOuGT6HRKpQyWuSrfnuq4ve6hCT7teeNfCwnnsAeGxhTQs/q+MUBZFqUQZ1SLqqjAX0ZF+07XuFCSeaQUZQUVL+9kdqwqat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtEPvM9f; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750116735; x=1781652735;
  h=date:from:to:cc:subject:message-id;
  bh=n2EpaQfbh8zqyIrfDJxweuQtb2vBXjj+e9cgjtN2AX4=;
  b=AtEPvM9fcTkN7ScXgcinSr9w1KqyulB9ZUqJlcmI7JIxGpPii5rqrBr6
   xiXOX01f2OiyZrBJu//jzQ887t2yEKjdstxXprsjgHdbPEreKi+aQsDbw
   HgK9SEQT6kPZSXLQozN50KWwiy2gSYm5nRUmgPwtbF8mjaelAgMr57rxb
   CqkjeYKVnaSIIYBeGUo9X48yXsiA7ZL2S864+yAY6mVpbM4EObE0unRrS
   9Ox8i6Z+s3OCUUDJdk1QKkn/Mkp4p+JQybg/OVq9bfYpm3XuEDPPr8O9v
   DccvIvmvhvFWY9X5IHcctSbHcIne7hoy0OQl0G0o27r6U/tHejN0PUtk0
   Q==;
X-CSE-ConnectionGUID: IDFKbNT4SPybWzyb2MO/jA==
X-CSE-MsgGUID: a+f7GvUxQI+24aVyJykj1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63625212"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="63625212"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 16:32:14 -0700
X-CSE-ConnectionGUID: I9UKwQjyQUmpzhR9EZVCYg==
X-CSE-MsgGUID: r+IfNpArQaO9T22pMNpKkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148500442"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jun 2025 16:32:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRJJD-000FQC-1z;
	Mon, 16 Jun 2025 23:32:11 +0000
Date: Tue, 17 Jun 2025 07:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 0fac5a55b63ea5dae641130d0fd32edae3f22de4
Message-ID: <202506170744.BR8IKF6x-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 0fac5a55b63ea5dae641130d0fd32edae3f22de4  Merge tag 'v6.16-rc2' into renesas-devel

elapsed time: 762m

configs tested: 121
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250616    gcc-15.1.0
arc                   randconfig-002-20250616    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250616    gcc-12.4.0
arm                   randconfig-002-20250616    gcc-15.1.0
arm                   randconfig-003-20250616    clang-21
arm                   randconfig-004-20250616    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250616    gcc-8.5.0
arm64                 randconfig-002-20250616    gcc-15.1.0
arm64                 randconfig-003-20250616    clang-19
arm64                 randconfig-004-20250616    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250616    gcc-13.3.0
csky                  randconfig-002-20250616    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250616    clang-21
hexagon               randconfig-002-20250616    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250616    gcc-12
i386        buildonly-randconfig-002-20250616    gcc-11
i386        buildonly-randconfig-003-20250616    clang-20
i386        buildonly-randconfig-004-20250616    gcc-12
i386        buildonly-randconfig-005-20250616    gcc-12
i386        buildonly-randconfig-006-20250616    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250616    gcc-15.1.0
loongarch             randconfig-002-20250616    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250616    gcc-8.5.0
nios2                 randconfig-002-20250616    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250616    gcc-8.5.0
parisc                randconfig-002-20250616    gcc-9.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                 linkstation_defconfig    clang-20
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250616    clang-21
powerpc               randconfig-002-20250616    clang-21
powerpc               randconfig-003-20250616    clang-21
powerpc64             randconfig-001-20250616    gcc-8.5.0
powerpc64             randconfig-002-20250616    clang-21
powerpc64             randconfig-003-20250616    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250616    clang-19
riscv                 randconfig-002-20250616    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250616    gcc-11.5.0
s390                  randconfig-002-20250616    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250616    gcc-12.4.0
sh                    randconfig-002-20250616    gcc-12.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250616    gcc-13.3.0
sparc                 randconfig-002-20250616    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250616    gcc-13.3.0
sparc64               randconfig-002-20250616    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250616    clang-20
um                    randconfig-002-20250616    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250616    clang-20
x86_64      buildonly-randconfig-002-20250616    clang-20
x86_64      buildonly-randconfig-003-20250616    clang-20
x86_64      buildonly-randconfig-004-20250616    clang-20
x86_64      buildonly-randconfig-005-20250616    gcc-12
x86_64      buildonly-randconfig-006-20250616    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250616    gcc-13.3.0
xtensa                randconfig-002-20250616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

