Return-Path: <linux-renesas-soc+bounces-6925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D991D3FB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 22:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E13F91C208B7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 20:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDD4152534;
	Sun, 30 Jun 2024 20:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS8vsMqW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C7414532C
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Jun 2024 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719780019; cv=none; b=q+HhPNXfnCd2SqoSeSCLKWtFyHDOydEVv2rDoDSFGgZbPutRv81UUNRhoQdNaW///nTjdq18ZlkEJUs3teRNO9dtL3v/BeDZyePC0CcfBeguBzY0HuTneZxbXDYvpNFeKsjiLVo1tvoFl4wAsUaUJibjLuz+7Byu2s4ASo4eU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719780019; c=relaxed/simple;
	bh=ikpyXwK8KrD7wpQ/B2sRkbRrSnbIapKSs9GQQSwJumQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dfOOZVR0bdakBwfyt6Mnp9ItZ+rhnKd+N9MfQf2AoxxHyembCNMn5S2XsyjFZKIg8qvCO8Z8D07825ZzDdOnHqupdghzZfji50+Vywv+cSXvRWFSFB5TgIV9jHxhV48TOakjIbFFS+/iD0xD98gTkJwSxdCDky/KPVnkszfn6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS8vsMqW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719780018; x=1751316018;
  h=date:from:to:cc:subject:message-id;
  bh=ikpyXwK8KrD7wpQ/B2sRkbRrSnbIapKSs9GQQSwJumQ=;
  b=bS8vsMqWwCcx7AXdK/8eDgZarWFZFvaEMO6g/2zfVyhLu/xqxR3Uglca
   dR8MV85uZRLg8Fw3tl3GyygetHwqGSFv5eJZkYxd8sLofQFhg+ZgYI1cb
   DcKbfa3tG2q0lttC8eSghLZpuROVOk5D/gz79oyic+AVHoqIXsjnH+oin
   qCDDUScScmswEmEjp45Za9EivcZkiiFv9kEkCIg/LzJdDqCaRuVoa5yZZ
   pgC72I8Yq/1Q5YNB5dTlhM3igZDp8LsNtVxMyzE6S2YgWd4Mk9VkPkGOm
   ujOu/ozu24jJNOtD+tj2kphFjIab3bK0B51kl2vQ4+Z8AQBcqMmOmXqQz
   g==;
X-CSE-ConnectionGUID: u+RZwGgsSq6+r9NsyJln+A==
X-CSE-MsgGUID: qAkrmuEqQBy7InWYRMaXLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="16763986"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="16763986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 13:40:17 -0700
X-CSE-ConnectionGUID: mhcHqZ//SVuKnnz1WSCNVw==
X-CSE-MsgGUID: okKan+vDTFOoom24jV6b5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="49899752"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2024 13:40:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sO1LK-000LuZ-16;
	Sun, 30 Jun 2024 20:40:14 +0000
Date: Mon, 01 Jul 2024 04:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 b697d5470d57cfd6ff3e1388699cd905334a9220
Message-ID: <202407010403.aghclXnq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: b697d5470d57cfd6ff3e1388699cd905334a9220  Merge branch 'renesas-next' into renesas-devel

elapsed time: 3633m

configs tested: 86
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240701   gcc-13.2.0
arc                   randconfig-002-20240701   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                            hisi_defconfig   gcc-13.2.0
arm                   randconfig-001-20240701   gcc-13.2.0
arm                   randconfig-002-20240701   gcc-13.2.0
arm                   randconfig-003-20240701   clang-19
arm                   randconfig-004-20240701   clang-15
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240701   gcc-13.2.0
arm64                 randconfig-003-20240701   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
hexagon                           allnoconfig   clang-19
i386         buildonly-randconfig-001-20240629   gcc-7
i386         buildonly-randconfig-001-20240630   clang-18
i386         buildonly-randconfig-002-20240629   clang-18
i386         buildonly-randconfig-002-20240629   gcc-7
i386         buildonly-randconfig-002-20240630   clang-18
i386         buildonly-randconfig-003-20240629   clang-18
i386         buildonly-randconfig-003-20240629   gcc-7
i386         buildonly-randconfig-003-20240630   clang-18
i386         buildonly-randconfig-004-20240629   gcc-13
i386         buildonly-randconfig-004-20240629   gcc-7
i386         buildonly-randconfig-004-20240630   clang-18
i386         buildonly-randconfig-005-20240629   gcc-13
i386         buildonly-randconfig-005-20240629   gcc-7
i386         buildonly-randconfig-005-20240630   clang-18
i386         buildonly-randconfig-006-20240629   clang-18
i386         buildonly-randconfig-006-20240629   gcc-7
i386         buildonly-randconfig-006-20240630   clang-18
i386                  randconfig-001-20240629   clang-18
i386                  randconfig-001-20240629   gcc-7
i386                  randconfig-001-20240630   clang-18
i386                  randconfig-002-20240629   gcc-7
i386                  randconfig-002-20240629   gcc-9
i386                  randconfig-002-20240630   clang-18
i386                  randconfig-003-20240629   clang-18
i386                  randconfig-003-20240629   gcc-7
i386                  randconfig-003-20240630   clang-18
i386                  randconfig-004-20240629   gcc-7
i386                  randconfig-004-20240629   gcc-9
i386                  randconfig-004-20240630   clang-18
i386                  randconfig-005-20240629   gcc-13
i386                  randconfig-005-20240629   gcc-7
i386                  randconfig-005-20240630   clang-18
i386                  randconfig-006-20240629   clang-18
i386                  randconfig-006-20240629   gcc-7
i386                  randconfig-006-20240630   clang-18
i386                  randconfig-011-20240629   gcc-13
i386                  randconfig-011-20240629   gcc-7
i386                  randconfig-011-20240630   clang-18
i386                  randconfig-012-20240629   clang-18
i386                  randconfig-012-20240629   gcc-7
i386                  randconfig-012-20240630   clang-18
i386                  randconfig-013-20240629   gcc-12
i386                  randconfig-013-20240629   gcc-7
i386                  randconfig-013-20240630   clang-18
i386                  randconfig-014-20240629   gcc-13
i386                  randconfig-014-20240629   gcc-7
i386                  randconfig-014-20240630   clang-18
i386                  randconfig-015-20240629   gcc-12
i386                  randconfig-015-20240629   gcc-7
i386                  randconfig-015-20240630   clang-18
i386                  randconfig-016-20240629   gcc-13
i386                  randconfig-016-20240629   gcc-7
i386                  randconfig-016-20240630   clang-18
loongarch                         allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240701   gcc-11
x86_64       buildonly-randconfig-002-20240701   gcc-13
x86_64       buildonly-randconfig-003-20240701   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

