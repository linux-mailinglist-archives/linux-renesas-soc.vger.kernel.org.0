Return-Path: <linux-renesas-soc+bounces-7710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6999466CB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 03:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C70DD282415
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 01:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EF35695;
	Sat,  3 Aug 2024 01:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrLnwN0+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF3B5C99
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Aug 2024 01:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722648588; cv=none; b=fnEwNs+Mv4vXEoLakrQg0iuIH91TUEHlAM/UN+7xIFKJ/dCZ/3Vp1odphas01rImOA+0Y26dPmpCChArX+1zwJbcUnZBWJEN3P9yT6wKMTH+J+U/B/NhY95FvBg2qAqftrRh61u2ZAx8MGkRF439DRY4joZCE2gg8YVbmcWKOf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722648588; c=relaxed/simple;
	bh=2dUDxz1Wfj6UOt/rqy4ShJHGQJhDIWK/W5qSa0qDbGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H+ULXQBKpBewkB8cDGk+OGphJXtWq66mt5Izfu8ce/VGlBIDkKVpj/1NNYDBuZwkZZstlCnImDIdk8ETyIBUh/cw/cHsMqEAF+lRRThOdbKQRYLl5zO6FvOsTJBxWctFhLiI4GpMfzYR0s4Z2HtfdeV8zDXQ4DDRV4mFv5V+F9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrLnwN0+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722648587; x=1754184587;
  h=date:from:to:cc:subject:message-id;
  bh=2dUDxz1Wfj6UOt/rqy4ShJHGQJhDIWK/W5qSa0qDbGw=;
  b=UrLnwN0+l6/9LNYA5cZ8RKCbHPaLTdNv+3aomXtIPEjJc+rsKOQZRPk5
   G4ept8z9W2t7/voffqQUbohw78/+3n4jEZjFpUSeFX9hW0Wi5YZmb+Z0x
   4oUHokR8rEbZxT2MIXJmP1pHmZutXqyKHzTpMcK6PGvYcQUILXUzNTE9G
   5gj4O/t6DYX/oBVfYO224NIba5h/o+pQOfPMN28SInpw3854nm6ihT6aG
   DlRaJl2FB76TsBoGy2wVfy2HcruiDjHcFQFTvPefA6ZBfxJ2bWzwkowy8
   lZtXnirFz7Yq+b08958SfEMT+SiqqIkKIhECqEOAhwl3P579nDZAPpmGk
   w==;
X-CSE-ConnectionGUID: Kcnf0piiQq+mPIpMn29CYQ==
X-CSE-MsgGUID: IxxTH4puRnqJRof3V321WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="32085932"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="32085932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 18:29:45 -0700
X-CSE-ConnectionGUID: tmtnPO8pRp6nPqVpWhZ6Xw==
X-CSE-MsgGUID: Ve59X5U9Tk68enicRpIpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="86537211"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Aug 2024 18:29:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa3aX-000xgO-1g;
	Sat, 03 Aug 2024 01:29:41 +0000
Date: Sat, 03 Aug 2024 09:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.12] BUILD
 SUCCESS 84542dfad12252887bc14402f2bdc6286262cbae
Message-ID: <202408030935.dWM7VUlG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.12
branch HEAD: 84542dfad12252887bc14402f2bdc6286262cbae  arm64: defconfig: Enable R-Car Ethernet-TSN support

elapsed time: 889m

configs tested: 62
configs skipped: 103

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

