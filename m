Return-Path: <linux-renesas-soc+bounces-6991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD24924119
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 16:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C9A81C216B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 14:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26856BE7F;
	Tue,  2 Jul 2024 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGD9KjUi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481A1B582F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719931439; cv=none; b=alhYqUeH96ACNr1wm6llDRzP4iOM9XV7zZNKxB64hONi8FcGsxa4Y1Nx8No7Kl6iaB+zrTZZOARu8IX7yzme6ypkAmCZCnl2xREWv8+gwm417UBs2C//NbOtfRfyALZfyth0rTBbmzXVZmMXFGHAaGMQWsEV3vtVIzWvJLQ9fHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719931439; c=relaxed/simple;
	bh=dPoOLxNhsdEhSXkpSd6AvmDa4F3YCVK0Ecod0ru3ysI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eYaovbyQ2N1jiPRuCRTbyHGH5IaBw4mS6k0sCqXddRVulz9SrUparkDAAA8tfxhqXKrg+8li9pTrMX2H0+83ta+mD5kk0qoxHJM4r4bmMLydON/AFq6NLLbyJVph8T3hOLIGG7stEVQ0OXBG7f2iyU/Tu2Wc3eS/M9Cygw0ANkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGD9KjUi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719931437; x=1751467437;
  h=date:from:to:cc:subject:message-id;
  bh=dPoOLxNhsdEhSXkpSd6AvmDa4F3YCVK0Ecod0ru3ysI=;
  b=QGD9KjUicjo7lKlI3Q7zNp4tSDoYHevX/uzvwc+0hL2xWDC4+Cj99HhS
   +y9eT46QC8x76gIbFGHOMqJkL1MHBmYTWep+ldh0M2cjAM2gDLN1u+wNS
   D29jRuNYvnElPWsLV6InQ4xizma4ANPNwyM7XycTlSAPfH9JSivTtZWn4
   TAKRSRLH3QAw93NGf1tFQAB0784/sU0It3RdEChwtL5y+yj6De+XwK0Lw
   EWwOg+1K7JOEMwqF6X6cUIPZRsaoEAYo1Wwb3HuixihGdr0pLusYiy4V0
   lv5J7R8GNsUL2PBfYLM8CRgpV1uzT/ejEA5/mnKBP6xt4KTbVYRWKFa1L
   Q==;
X-CSE-ConnectionGUID: wpJec+PNQ46Yy+PBPcV6Zg==
X-CSE-MsgGUID: QCCM3+8nTMOMefOHCV01pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16833907"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="16833907"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 07:43:56 -0700
X-CSE-ConnectionGUID: GdoiIJJRRIWvrNLkJXnRPQ==
X-CSE-MsgGUID: dKVLlDNCT+Co0aCrJZuspA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50787042"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2024 07:43:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOejZ-000OIS-1F;
	Tue, 02 Jul 2024 14:43:53 +0000
Date: Tue, 02 Jul 2024 22:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 71062e52fc0aea0f3477aaaaa789226388a7eeaf
Message-ID: <202407022235.KgXypoiN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 71062e52fc0aea0f3477aaaaa789226388a7eeaf  pinctrl: renesas: r8a779h0: Remove unneeded separators

elapsed time: 1693m

configs tested: 104
configs skipped: 0

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
powerpc               randconfig-003-20240702   gcc-13.2.0
powerpc64             randconfig-001-20240702   clang-19
powerpc64             randconfig-002-20240702   gcc-13.2.0
powerpc64             randconfig-003-20240702   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240702   gcc-13.2.0
riscv                 randconfig-002-20240702   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240702   clang-19
s390                  randconfig-002-20240702   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240702   gcc-13.2.0
sh                    randconfig-002-20240702   gcc-13.2.0
sparc64               randconfig-001-20240702   gcc-13.2.0
sparc64               randconfig-002-20240702   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240702   gcc-8
um                    randconfig-002-20240702   gcc-13
x86_64       buildonly-randconfig-001-20240702   gcc-8
x86_64       buildonly-randconfig-002-20240702   clang-18
x86_64       buildonly-randconfig-003-20240702   clang-18
x86_64       buildonly-randconfig-004-20240702   clang-18
x86_64       buildonly-randconfig-005-20240702   gcc-13
x86_64       buildonly-randconfig-006-20240702   clang-18
x86_64                randconfig-001-20240702   clang-18
x86_64                randconfig-002-20240702   gcc-11
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240702   gcc-13.2.0
xtensa                randconfig-002-20240702   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

