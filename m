Return-Path: <linux-renesas-soc+bounces-6998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 720AD92434F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 18:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27E861F233FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 16:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562FB1BA095;
	Tue,  2 Jul 2024 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9k/L/Tc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FCA1BD027
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719936574; cv=none; b=nHZNs7/SMBqcRu7RsQMFkD3f0qtJ/Z6XjWxTLyWBNJ16DA4Jec/UiLlZgg6syy2CVfIZLHNjGerXSd8OOnQBVkIRjrgjbvNpQ1yS934qlx9F6/f54D4E2/0nr8NSQqn6fOyvWySa9LrnOyuRDeE3uwebAn2F9klTiAJlywlkxc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719936574; c=relaxed/simple;
	bh=svhawvuj180Gy2Z64CpicgqOaOvWsqCaG6SU5/mBLTo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PR/qgJIlkm0Xme5EpHSH1PnbmBzs8YZnNC7O6TRCFGi2N79GD60fCHBdJxsrV+yfW4XCX+iljRjIWonvQ3ArsiFTUW4Xx+OYN1oy+UzxQFPyjL5t9rwLLAXKvE/jnQK+j7xLiuTv86Wi7lPH9tm2fRWn5Fe0bVLpCzijaH2ozOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9k/L/Tc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719936572; x=1751472572;
  h=date:from:to:cc:subject:message-id;
  bh=svhawvuj180Gy2Z64CpicgqOaOvWsqCaG6SU5/mBLTo=;
  b=i9k/L/Tc+lZA0lvff683ADvQJ9yEDgvfRmHwl6L6X28eQzWv0+aUQssi
   stJ6roWyPYXhYJWfYvIyGICGr58R+N58867IAjriRbMM3s8qnz/h0c+Ny
   joEfNdXrdTXwvlTkZYny1e84pcxYHvrsAD7iV5AnhMO9JsUBjyZcQeA5f
   69dN0LI08D8hseYE4mOyW42mKrcv47X/62b+w+6185XeWdhI20r+v3ti9
   4lYc+z6xHm/rf7CNrFLP6QA38EQBSVEoOnxI8fq8gz1pZRKzUP/aIWarX
   OllEUkFkw3sFSqXlwpV9ODaqZJOXwa66wI+cERh/TO+TsrrXceNr0JDS7
   Q==;
X-CSE-ConnectionGUID: nEMu5/X2ThKoojJ+zWhVIg==
X-CSE-MsgGUID: +eU1+bqGRO2aWQDaxdrHoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20889817"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="20889817"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 09:08:59 -0700
X-CSE-ConnectionGUID: zZekbqkoSXO0A2pR57CL5g==
X-CSE-MsgGUID: wvWJBZo6ToWScgFbMSO/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50559230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2024 09:08:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOg3s-000OO6-0M;
	Tue, 02 Jul 2024 16:08:56 +0000
Date: Wed, 03 Jul 2024 00:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 e47c6e1c7dd0a1725e3b908b45ca8da73ee9bff5
Message-ID: <202407030009.cmZAn4N3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: e47c6e1c7dd0a1725e3b908b45ca8da73ee9bff5  Merge branch 'renesas-next', tag 'v6.10-rc6' into renesas-devel

elapsed time: 1778m

configs tested: 108
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240702   gcc-13.2.0
arc                   randconfig-002-20240702   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                   randconfig-001-20240702   gcc-13.2.0
arm                   randconfig-002-20240702   gcc-13.2.0
arm                   randconfig-003-20240702   gcc-13.2.0
arm                   randconfig-004-20240702   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240702   gcc-13.2.0
arm64                 randconfig-002-20240702   clang-19
arm64                 randconfig-002-20240702   gcc-13.2.0
arm64                 randconfig-003-20240702   gcc-13.2.0
arm64                 randconfig-004-20240702   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240702   gcc-13.2.0
csky                  randconfig-002-20240702   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon               randconfig-001-20240702   clang-19
hexagon               randconfig-002-20240702   clang-19
i386         buildonly-randconfig-001-20240701   clang-18
i386         buildonly-randconfig-001-20240702   gcc-13
i386         buildonly-randconfig-002-20240701   clang-18
i386         buildonly-randconfig-002-20240702   gcc-13
i386         buildonly-randconfig-003-20240701   clang-18
i386         buildonly-randconfig-003-20240702   gcc-13
i386         buildonly-randconfig-004-20240701   clang-18
i386         buildonly-randconfig-004-20240702   gcc-13
i386         buildonly-randconfig-005-20240701   gcc-13
i386         buildonly-randconfig-005-20240702   gcc-13
i386         buildonly-randconfig-006-20240701   gcc-9
i386         buildonly-randconfig-006-20240702   gcc-13
i386                  randconfig-001-20240701   clang-18
i386                  randconfig-001-20240702   gcc-13
i386                  randconfig-002-20240701   clang-18
i386                  randconfig-002-20240702   gcc-13
i386                  randconfig-003-20240701   clang-18
i386                  randconfig-003-20240702   gcc-13
i386                  randconfig-004-20240701   gcc-7
i386                  randconfig-004-20240702   gcc-13
i386                  randconfig-005-20240701   clang-18
i386                  randconfig-005-20240702   gcc-13
i386                  randconfig-006-20240701   gcc-13
i386                  randconfig-006-20240702   gcc-13
i386                  randconfig-011-20240701   gcc-13
i386                  randconfig-011-20240702   gcc-13
i386                  randconfig-012-20240701   clang-18
i386                  randconfig-012-20240702   gcc-13
i386                  randconfig-013-20240701   clang-18
i386                  randconfig-013-20240702   gcc-13
i386                  randconfig-014-20240701   gcc-8
i386                  randconfig-014-20240702   gcc-13
i386                  randconfig-015-20240701   gcc-10
i386                  randconfig-015-20240702   gcc-13
i386                  randconfig-016-20240701   clang-18
i386                  randconfig-016-20240702   gcc-13
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240702   gcc-13.2.0
loongarch             randconfig-002-20240702   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240702   gcc-13.2.0
nios2                 randconfig-002-20240702   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240702   gcc-13.2.0
parisc                randconfig-002-20240702   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240702   gcc-13.2.0
powerpc               randconfig-002-20240702   clang-16
powerpc               randconfig-002-20240702   gcc-13.2.0
powerpc               randconfig-003-20240702   gcc-13.2.0
powerpc64             randconfig-001-20240702   clang-19
powerpc64             randconfig-001-20240702   gcc-13.2.0
powerpc64             randconfig-002-20240702   gcc-13.2.0
powerpc64             randconfig-003-20240702   clang-19
powerpc64             randconfig-003-20240702   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240702   gcc-13.2.0
riscv                 randconfig-002-20240702   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240702   clang-19
s390                  randconfig-001-20240702   gcc-13.2.0
s390                  randconfig-002-20240702   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240702   gcc-13.2.0
sh                    randconfig-002-20240702   gcc-13.2.0
sparc64               randconfig-001-20240702   gcc-13.2.0
sparc64               randconfig-002-20240702   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240702   gcc-13.2.0
um                    randconfig-002-20240702   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240702   gcc-8
x86_64       buildonly-randconfig-002-20240702   clang-18
x86_64       buildonly-randconfig-003-20240702   clang-18
x86_64       buildonly-randconfig-004-20240702   clang-18
x86_64       buildonly-randconfig-005-20240702   gcc-13
x86_64       buildonly-randconfig-006-20240702   clang-18
x86_64                randconfig-001-20240702   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240702   gcc-13.2.0
xtensa                randconfig-002-20240702   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

