Return-Path: <linux-renesas-soc+bounces-6909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B778391CD0B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 15:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4971F22752
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 13:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA5C1E497;
	Sat, 29 Jun 2024 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzX8KwtG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E0B1DA5F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666951; cv=none; b=eld0e81eu9l1/yNX3ms9t6BGr/nuTSCDoHFm+ns7jphbBx9jB6iRvXwK1i948LluRpiaSaC21j1B5kMkYx+ODT8djn33W/y1SMIFwLioqoxlzKlzgXEtCZJ+F+vpt6FSfdiGe8x2ElWgAcImHjJWt+/B6WOrhike3OIZsvS9MBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666951; c=relaxed/simple;
	bh=ihcZGA3mZe8NAtVGWN2b6/hiYj3vXlGgmpMBySFMHQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sD+HMYpyxg49nXTmYDmrqKCXkL4RuGs24K58bVDyVhrsDfB70GgEUEP7I08iY7qqKHdNR6hM854n0CuUr+NT6a/5SPE8tTsSwJqcDaSG2ZP1CvKXmrIITgQCIDbVVJw3WHfq/lrQIkmGqK3CltwiRx/dCRewG14LXTcXWNibX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzX8KwtG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719666950; x=1751202950;
  h=date:from:to:cc:subject:message-id;
  bh=ihcZGA3mZe8NAtVGWN2b6/hiYj3vXlGgmpMBySFMHQE=;
  b=JzX8KwtGHpWdD+c6/Fl4y3lBS7BIcgbUBdDAvIA40tasSF8EpMzof9of
   a5EMj/AUX7U579BdFRqr2dYsKdkYndr2KO0V+GioB3Pe8wa4dijCLb9zF
   ofNOkQMzjbnPqOUkjUA7KXsURVOgSstC6HcNok1/JuEWqE3R2+vlsA0+y
   XcmNVigJN06X5C0kmn2th6TIulcmmvv0wlSg+dQWhQMH1sUWLQMhPTInl
   lseZKOeAw1E8jdOeRU+XK/c0TKo5wR0DauXvx5MQQ0poKKKNBH4FlDOza
   siI4XiZKsAqnIGtFBQxxgpnxKIiBBkhJ1/HuTuZ2I0gFZjqy0LqBmCmKj
   A==;
X-CSE-ConnectionGUID: RMeWaoQmRzio9yhSWYinVw==
X-CSE-MsgGUID: R5q7zdNoTuqJRdFEq0DXKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16664584"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="16664584"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 06:15:49 -0700
X-CSE-ConnectionGUID: Y3W24n7dTeavuSnrI9CIgQ==
X-CSE-MsgGUID: L0bnRBmaQOOdKgWA4NCrfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="49350706"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2024 06:15:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNXvd-000JMZ-1z;
	Sat, 29 Jun 2024 13:15:45 +0000
Date: Sat, 29 Jun 2024 21:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 ae035db289ffbf97e32db0e86571507f9b79ee31
Message-ID: <202406292104.XcxOPSIz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: ae035db289ffbf97e32db0e86571507f9b79ee31  Merge branches 'renesas-drivers-for-v6.11' and 'renesas-dts-for-v6.11' into renesas-next

elapsed time: 1748m

configs tested: 41
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386         buildonly-randconfig-001-20240629   gcc-7
i386         buildonly-randconfig-002-20240629   clang-18
i386         buildonly-randconfig-002-20240629   gcc-7
i386         buildonly-randconfig-003-20240629   clang-18
i386         buildonly-randconfig-003-20240629   gcc-7
i386         buildonly-randconfig-004-20240629   gcc-13
i386         buildonly-randconfig-004-20240629   gcc-7
i386         buildonly-randconfig-005-20240629   gcc-13
i386         buildonly-randconfig-005-20240629   gcc-7
i386         buildonly-randconfig-006-20240629   clang-18
i386         buildonly-randconfig-006-20240629   gcc-7
i386                  randconfig-001-20240629   clang-18
i386                  randconfig-001-20240629   gcc-7
i386                  randconfig-002-20240629   gcc-7
i386                  randconfig-002-20240629   gcc-9
i386                  randconfig-003-20240629   clang-18
i386                  randconfig-003-20240629   gcc-7
i386                  randconfig-004-20240629   gcc-7
i386                  randconfig-004-20240629   gcc-9
i386                  randconfig-005-20240629   gcc-13
i386                  randconfig-005-20240629   gcc-7
i386                  randconfig-006-20240629   clang-18
i386                  randconfig-006-20240629   gcc-7
i386                  randconfig-011-20240629   gcc-13
i386                  randconfig-011-20240629   gcc-7
i386                  randconfig-012-20240629   clang-18
i386                  randconfig-012-20240629   gcc-7
i386                  randconfig-013-20240629   gcc-12
i386                  randconfig-013-20240629   gcc-7
i386                  randconfig-014-20240629   gcc-13
i386                  randconfig-014-20240629   gcc-7
i386                  randconfig-015-20240629   gcc-12
i386                  randconfig-015-20240629   gcc-7
i386                  randconfig-016-20240629   gcc-13
i386                  randconfig-016-20240629   gcc-7
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

