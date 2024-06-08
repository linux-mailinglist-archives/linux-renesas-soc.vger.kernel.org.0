Return-Path: <linux-renesas-soc+bounces-5973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F19013E9
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 00:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2561C20AAE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2024 22:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE061CAAD;
	Sat,  8 Jun 2024 22:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8/VaTKf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295CD520
	for <linux-renesas-soc@vger.kernel.org>; Sat,  8 Jun 2024 22:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717886912; cv=none; b=ZEOsWDAueAgzfwH+umj/+2LjliXbjBpcQsm0RThWh37YDahmT4SfbHTcG1zeTD3c4q1DIRlpjRTWH2IVQY2G5ro6gNOlxY5+KUWP8E1EnbPM70FFuZKlhirQ+eE6Ad4Bu2AXdsxh7wSKx9pLQAiZo/4dlEoocpiR6DUr029wNzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717886912; c=relaxed/simple;
	bh=iBWuNycGesEmuhApSnQIlEegzxTuYiTclqrABoNV+IY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=proSZxcGNX+76KO85LyhMnWKTz0nHoPuUe9ourENL7ObqyBVsKncEF6pmzeUWptpIleDQZWuRXl+naUgyYulUqWzgwDcj87tnpy7ghYN0PPgfC83iKnzRAVr2kDioBBw0oUC7irNl/Zc9BwCBAJ31EpXAKUzKPujx7pR2E6Eg3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8/VaTKf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717886910; x=1749422910;
  h=date:from:to:cc:subject:message-id;
  bh=iBWuNycGesEmuhApSnQIlEegzxTuYiTclqrABoNV+IY=;
  b=T8/VaTKffmPvkhXkVIdg0yRjU6my+A5886oAE6QipFJ9Px3mBJVcCZpH
   GiWGt/DliLd+LS017tIGmNZRwUofZ4t+8muOIy7OsyfmoIlpFkOi2Kq21
   RWnx1IiNLjLbxybVOZFZD8Y++FF/a9g69RJIHyrZhRbpcuJMbKSHjBcjR
   yUnSsy3sLnf5EwYvFcoP5/dd3BhZMhoZeUCqtUivP0hmpbQHQt10zqMhA
   LtlvKcDYH0M1PkHybSSHSGjSF/65WrVpyOykngt2DXjagwculU4b1VvZm
   7Sw0fuemez9klIlRbb6CGgCRzAGjLrvIDogTPlnRiyKhQy6LDKWfwaAmw
   A==;
X-CSE-ConnectionGUID: 4H0n54xaT1iwGoAFMRz5hg==
X-CSE-MsgGUID: vJsH14QMS2+b1MkeByikxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="32126126"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="32126126"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 15:48:29 -0700
X-CSE-ConnectionGUID: 41NdeXXxSvmk4UXSanr9tQ==
X-CSE-MsgGUID: hR2DmWxXTDGKElApihkDNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="69458038"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jun 2024 15:48:28 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG4rK-0000aE-0C;
	Sat, 08 Jun 2024 22:48:26 +0000
Date: Sun, 09 Jun 2024 06:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 7699f2c204f1bcfb84958af300430f19282fda9e
Message-ID: <202406090650.elPNDDlC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 7699f2c204f1bcfb84958af300430f19282fda9e  Merge branch 'renesas-next' into renesas-devel

elapsed time: 2018m

configs tested: 51
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240608   gcc  
i386         buildonly-randconfig-002-20240608   clang
i386         buildonly-randconfig-003-20240608   gcc  
i386         buildonly-randconfig-004-20240608   gcc  
i386         buildonly-randconfig-005-20240608   clang
i386         buildonly-randconfig-006-20240608   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240608   clang
i386                  randconfig-002-20240608   gcc  
i386                  randconfig-003-20240608   gcc  
i386                  randconfig-004-20240608   clang
i386                  randconfig-005-20240608   gcc  
i386                  randconfig-006-20240608   gcc  
i386                  randconfig-011-20240608   clang
i386                  randconfig-012-20240608   clang
i386                  randconfig-013-20240608   clang
i386                  randconfig-014-20240608   gcc  
i386                  randconfig-015-20240608   clang
i386                  randconfig-016-20240608   clang
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

