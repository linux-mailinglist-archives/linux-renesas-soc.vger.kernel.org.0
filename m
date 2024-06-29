Return-Path: <linux-renesas-soc+bounces-6910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB091CD0E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 15:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 654D528344B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B2F1E4A0;
	Sat, 29 Jun 2024 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqdxwIL/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DAE1DA5F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719667260; cv=none; b=WRTOBsLCe8gpbAeGO+s/fVnPxclcgL8YB4EqmNMfZNkIg6Gzp6zH1zFBqh4t5fH6hvALMnsvPSOvp0JppPtbfLbLvoY9iG0Hmh8urRkWC1RF3mpXXNMB4P/qwaqbkLrSOi6d6cgCVywKTOrLwjltykBYqorQgmY0bCwaD7qqFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719667260; c=relaxed/simple;
	bh=00jsQ39/olpw7WujFc14aH2Wz5UtA0yYzsDjXPAO1/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JuWchHMN+yfyE2f4rxWIzYF8LyJLQWQS5sG08gHs6dqIoMTDc1b4/Isrob+sfsXRQDIrdd3VKUDOA89J+2AuxsWvv2dQYlu5cPww3c63TnS8r2UaFKrfNeB71lzc8uFS7lp86sZjgmr4I9kOiwXadtQmOT6qP1Y9EHvHR1ECdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqdxwIL/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719667259; x=1751203259;
  h=date:from:to:cc:subject:message-id;
  bh=00jsQ39/olpw7WujFc14aH2Wz5UtA0yYzsDjXPAO1/w=;
  b=lqdxwIL/qlh133pv115u2B0eAb2DCtXjQwgrQ/Er50hw8IPuL5E7tODZ
   ry6117p1B+EoWK/Mv3K3W01EV31y3jPATpc8CbnCx4RMbTaxpK2SEllLB
   NAriLa7TW2Ay8L5nPW14UChnp1B9+XInVtKsmXumCCXNCRKGbq+jAzrTb
   7zXSLurFeXe8gcofYdq2Ku4kiybU5K1+IGErLvcp05FZy37Bs6FAlkmod
   XzZqaoMQMtwdP3i76WUrV7jIjP9fEhYhnMlzfw1/kVDeD2tfdjHnt7tz/
   RhUeyHL96RBQRxHAfve4bznxw1FyDcUk7JXE44P8wZGq61N+jztwJcDUm
   w==;
X-CSE-ConnectionGUID: 6wqhZ/zQTTKRkV/9V9Mi6g==
X-CSE-MsgGUID: YPMctug5QFeyDHa2HKHsgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27463058"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="27463058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 06:20:58 -0700
X-CSE-ConnectionGUID: unq2MzOfSs2zC2vykYbsYw==
X-CSE-MsgGUID: syA4XqEbQDCq7EW+bgs4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="44906609"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2024 06:20:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNY0c-000JNF-2n;
	Sat, 29 Jun 2024 13:20:54 +0000
Date: Sat, 29 Jun 2024 21:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.11] BUILD
 SUCCESS 0aea2e4bbc584dd92e0483a6d249f11054a8923c
Message-ID: <202406292137.xRivoux0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.11
branch HEAD: 0aea2e4bbc584dd92e0483a6d249f11054a8923c  soc: renesas: rcar-fuse: Remove unneeded semicolon

elapsed time: 1753m

configs tested: 43
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
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

