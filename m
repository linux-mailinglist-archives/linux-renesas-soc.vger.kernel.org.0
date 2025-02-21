Return-Path: <linux-renesas-soc+bounces-13461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E39A3F29A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 12:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA66719C65A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 11:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E44220101E;
	Fri, 21 Feb 2025 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idQl79fJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D601EB1A6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135637; cv=none; b=gbTHA3UqOxzfjJAxuRSZkQnIXFQAvaUcvuBdQGZvBn21TdZeT1zEnp2XCln70o3KzeFQS7dgt+UIMIBW8c+nGwzgP+V2fN0NRMIEtrA26EnPS/27mmzLiHJf8+QByqLUPMtsKaLo5lLpKmEbJ42HQnF8Z2uxSIkauzLVEVe5OAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135637; c=relaxed/simple;
	bh=aenKedH85j8/mqoN/PizRlZ4rDpYs6C6ss/Ef77im0Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MxuyzvzRDcO5Xe6yYjq2u8cQV+egVSJ2I1isd0AJV9/L9D8G49eZOHHS4sBVAxM+N8teJq2ISUFfPPt4fsWIBrT325iUbHkKUwCjjOwLLvcDgoDLpj0vi/7TWPDNe+0ZoFIde6nJXdQSnO+ayuYhCrSw/2MOeKAiJh0Wyi5uEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idQl79fJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740135636; x=1771671636;
  h=date:from:to:cc:subject:message-id;
  bh=aenKedH85j8/mqoN/PizRlZ4rDpYs6C6ss/Ef77im0Y=;
  b=idQl79fJeEUUvlAVDdiJ9F2Sl5CYm39df/SeFo8OPtmsGZzmPcZDNr5X
   opjhzDz2g5alV6NmFnaPXLFauAjPIGloPLiwm9UYm871P1AmYkXmh/rK5
   9BzCgaq4lgNFN0AYmw2miB7ACKQ0SNcFQTGyvUv6u7chmnmyXEHnMn6ct
   8OyV7YnlczRJtriInEfRHQwFjbQLxwn/jUfPfVlLmVnhEGU5qKNg1hl3t
   lcCrEaA639zOjeDHeMPjWd1TMr7kT93EPAM+rHc27LqXlx0IYMV8z9QU2
   qkkXXAN8tn11akQ5o7OSAoAYvPyvAge8WSqrA1TPwla1vOsj5csUGORLO
   Q==;
X-CSE-ConnectionGUID: XNX3chT4TmSzlVpltKJBzA==
X-CSE-MsgGUID: /lLf8nMITX6DueAOmpPdHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44867143"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="44867143"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:00:35 -0800
X-CSE-ConnectionGUID: bLMLjcPUSbad+dWFR+Fjdw==
X-CSE-MsgGUID: Zy1EupiTRPOfpNdUtBtl5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146230157"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Feb 2025 03:00:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlQlk-0005Q4-0r;
	Fri, 21 Feb 2025 11:00:32 +0000
Date: Fri, 21 Feb 2025 19:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.14-rc3]
 BUILD SUCCESS ed39ecbc13c842783f9e56b6a4d992cdf8f4600a
Message-ID: <202502211902.FGpjDajK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.14-rc3
branch HEAD: ed39ecbc13c842783f9e56b6a4d992cdf8f4600a  arm64: dts: renesas: white-hawk-cpu: Add overlay for CP97/98

elapsed time: 1458m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250220    gcc-13.2.0
arc                   randconfig-002-20250220    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250220    gcc-14.2.0
arm                   randconfig-002-20250220    gcc-14.2.0
arm                   randconfig-003-20250220    gcc-14.2.0
arm                   randconfig-004-20250220    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250220    gcc-14.2.0
arm64                 randconfig-002-20250220    gcc-14.2.0
arm64                 randconfig-003-20250220    clang-21
arm64                 randconfig-004-20250220    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250220    gcc-14.2.0
csky                  randconfig-002-20250220    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250220    clang-21
hexagon               randconfig-002-20250220    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250220    gcc-12
i386        buildonly-randconfig-002-20250220    gcc-12
i386        buildonly-randconfig-003-20250220    gcc-12
i386        buildonly-randconfig-004-20250220    clang-19
i386        buildonly-randconfig-005-20250220    clang-19
i386        buildonly-randconfig-006-20250220    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250220    gcc-14.2.0
loongarch             randconfig-002-20250220    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250220    gcc-14.2.0
nios2                 randconfig-002-20250220    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250220    gcc-14.2.0
parisc                randconfig-002-20250220    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250220    gcc-14.2.0
powerpc               randconfig-002-20250220    clang-16
powerpc               randconfig-003-20250220    clang-21
powerpc64             randconfig-001-20250220    clang-16
powerpc64             randconfig-002-20250220    clang-18
powerpc64             randconfig-003-20250220    gcc-14.2.0
riscv                 randconfig-001-20250220    gcc-14.2.0
riscv                 randconfig-002-20250220    clang-21
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250220    clang-19
s390                  randconfig-002-20250220    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250220    gcc-14.2.0
sh                    randconfig-002-20250220    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250220    gcc-14.2.0
sparc                 randconfig-002-20250220    gcc-14.2.0
sparc64               randconfig-001-20250220    gcc-14.2.0
sparc64               randconfig-002-20250220    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250220    gcc-12
um                    randconfig-002-20250220    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250220    gcc-12
x86_64      buildonly-randconfig-002-20250220    gcc-12
x86_64      buildonly-randconfig-003-20250220    gcc-12
x86_64      buildonly-randconfig-004-20250220    gcc-12
x86_64      buildonly-randconfig-005-20250220    gcc-12
x86_64      buildonly-randconfig-006-20250220    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250220    gcc-14.2.0
xtensa                randconfig-002-20250220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

