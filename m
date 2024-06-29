Return-Path: <linux-renesas-soc+bounces-6908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2C91CD00
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 15:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA30628330A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 13:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEFA7AE5D;
	Sat, 29 Jun 2024 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdJXSaey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993C29CFB
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666580; cv=none; b=cEiclwpcxkHVNMfkcJC5y1KxkP2ZfJa6WelGnGxp81PQHXAxPTp0zqBz0Afuc7FhwbsmeNoT/Wee+jkeZK+aztKZCc0cc/P2ymgogwOULmJ+qwheZd4Xyn8AQzMJRyjvKyG3Xy+Wim0a2rByrjpJHXIt0YwBkbgNnnJx+rCW3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666580; c=relaxed/simple;
	bh=bg45DufPvMF0bQndaJhGm5IDCJjq3la63uQY9rLcD4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=enmr89fLBKJbYsLxBmkhFsT8P0jeV4+TPwxNOgUwrxLaqyHL7hTBQff1W8iUr+0hEwUbPqMjVIcjzG+g9prGraZCUVwpUZZO01rieHElQJplSpza3V5V+HkjZEdr5EGj8kvWWIzYrU/dt/yCekf5SFEAOt29zjeuRwAm+9APRDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdJXSaey; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719666579; x=1751202579;
  h=date:from:to:cc:subject:message-id;
  bh=bg45DufPvMF0bQndaJhGm5IDCJjq3la63uQY9rLcD4I=;
  b=EdJXSaeyeUaZkinknKyOY45Vj8uiUCSy8f54pd9OgVaK59WeTgf9bb7F
   dZp3j0SdbTxWNLsWDANm6SLrpdJ8BrvIJbGX9CKCEawWVEulYa8uYI9pG
   BG2tBhCUV0SHMGIn1ZoSvXAUvriQKL2EwBUgMEF2GXpobA1Mkl2jYgm6o
   erBCLXiDVsFb3+vFaHOQVAFX62WxAKIo7irnlFHnCoKXyMZ6t9vQ7I8Px
   SPi7T7Wshi5fe+jjwHRqTKUOpd8j11Xh8H4tz7Bl0l+tvAgqE7u15MTqc
   J8HoMqXi74sXma8x4z6pDDVFc+HNX4gf7AY153n4GOQX4urBOTOy8TBhj
   Q==;
X-CSE-ConnectionGUID: uqlaynSZS22/fFxNOQC43g==
X-CSE-MsgGUID: wQMv6PiCSV6IluQ96Ai+Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16980802"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="16980802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 06:09:39 -0700
X-CSE-ConnectionGUID: Y8O7I3XbT+SM/2tGCbtwvg==
X-CSE-MsgGUID: sNwt7RriTU6HhyuuaRcAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="50197846"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jun 2024 06:09:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNXpf-000JM6-0z;
	Sat, 29 Jun 2024 13:09:35 +0000
Date: Sat, 29 Jun 2024 21:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.11] BUILD SUCCESS
 40382441cb3c4ff51882087bf53c6e933ce21e0d
Message-ID: <202406292129.nftOjrQa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.11
branch HEAD: 40382441cb3c4ff51882087bf53c6e933ce21e0d  arm64: dts: renesas: r8a779h0: Drop "opp-shared" from opp-table-0

elapsed time: 1741m

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

