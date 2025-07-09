Return-Path: <linux-renesas-soc+bounces-19436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C560AFEEAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 18:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC1A543FD7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 16:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF802E763D;
	Wed,  9 Jul 2025 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8RX+5dQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506BC2E54A7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Jul 2025 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077331; cv=none; b=jh5/5MhEiVvj8VNsrGIpDGx9lfLRbAUcttqgeC1TFq8oDps/1dWoMDI7+if3HHX275vwVFCQl1Qz06Z4GysXqMu64JHNdaUROBdcA/n4rnFhU1cEITPVkpO7HiLOGEHjE0QJ52sJqoM6LjSXNLfTkjQ+NH/gHK3Vp/J0XJIrS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077331; c=relaxed/simple;
	bh=xxBDt1G0OIJHtYZ9p3lnhL9Z7BcnVm1K/HC9sDZRY3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WpZFSG3QPlAqhKt6TNjHPvZFqbb2uqlEO+PxeJqWbtMv4QlOccXKsGso5/f8krjht+/i1WeqeeR7eTWX0Ig0nsZq95knavPY3Rthi8wGlyxaJBJc+sAlUwLCo3ZbSJ3jYH+Fs71wvs67yTMyFldIBq8RFBMPuEa/yBMtmmGG7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8RX+5dQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752077329; x=1783613329;
  h=date:from:to:cc:subject:message-id;
  bh=xxBDt1G0OIJHtYZ9p3lnhL9Z7BcnVm1K/HC9sDZRY3A=;
  b=A8RX+5dQHN3f0uxBQnpHiN/OVHA6t0h5CfG/VJjisz+s8bOrDoeb/5rz
   zUaKKZ/jnoCzzeHCpnmWkLwTcVJtzL6Dpk5WUhjmK6lW4Iqc8ZdUqe/RR
   o40s3RCAMxC8DSHniDMvGKjd2tAriEQZXOZkU8mQMcso6L0wTAe7HNRze
   FLdErqhyEBQXEVeERVNxd8+vrD9UbNOMqZgVosXWKot6QhLI+u79L47bi
   ePigofpXilAg1s2Zm7/qz/TlLFr/V1QIXRX7bhGxGsd6NlWQm5wW35bI2
   IwVn/fwwIqrOIUQ40U/TJimYcQqXyf1NBZ2l5D8tMwKi0rfYOlMvtim+a
   Q==;
X-CSE-ConnectionGUID: iFDuuewjSlqqgAuR4qeAWg==
X-CSE-MsgGUID: 2y2OvoDVQnO4+vIIbQbNwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54474010"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54474010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:08:49 -0700
X-CSE-ConnectionGUID: tfFSIXWsTA2sI2U2+3wquw==
X-CSE-MsgGUID: GsyLULQJS7a7J5wIFIMgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="160350358"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2025 09:08:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZXLh-0003jL-1I;
	Wed, 09 Jul 2025 16:08:45 +0000
Date: Thu, 10 Jul 2025 00:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 a762dd13768a5f6c0fb81a07b9ab0fec112aaf72
Message-ID: <202507100049.wX8MXWMf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: a762dd13768a5f6c0fb81a07b9ab0fec112aaf72  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

Unverified Warning (likely false positive, kindly check if interested):

    drivers/gpu/drm/xe/xe_lrc.c:916:15: warning: 'wa_bb_offset' defined but not used [-Wunused-function]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- i386-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- loongarch-randconfig-001-20250709
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- microblaze-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
|-- um-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used
`-- xtensa-allyesconfig
    `-- drivers-gpu-drm-xe-xe_lrc.c:warning:wa_bb_offset-defined-but-not-used

elapsed time: 1451m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250709    gcc-8.5.0
arc                   randconfig-002-20250709    gcc-11.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-21
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250709    gcc-12.4.0
arm                   randconfig-002-20250709    gcc-10.5.0
arm                   randconfig-003-20250709    clang-21
arm                   randconfig-004-20250709    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250709    clang-21
arm64                 randconfig-002-20250709    gcc-15.1.0
arm64                 randconfig-003-20250709    clang-21
arm64                 randconfig-004-20250709    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250709    gcc-15.1.0
csky                  randconfig-002-20250709    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250709    clang-19
hexagon               randconfig-002-20250709    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250709    gcc-12
i386        buildonly-randconfig-002-20250709    clang-20
i386        buildonly-randconfig-003-20250709    clang-20
i386        buildonly-randconfig-004-20250709    clang-20
i386        buildonly-randconfig-005-20250709    gcc-12
i386        buildonly-randconfig-006-20250709    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250709    gcc-15.1.0
loongarch             randconfig-002-20250709    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250709    gcc-14.2.0
nios2                 randconfig-002-20250709    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250709    gcc-15.1.0
parisc                randconfig-002-20250709    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250709    gcc-8.5.0
powerpc               randconfig-002-20250709    clang-21
powerpc               randconfig-003-20250709    clang-21
powerpc64             randconfig-001-20250709    gcc-10.5.0
powerpc64             randconfig-002-20250709    gcc-10.5.0
powerpc64             randconfig-003-20250709    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250709    gcc-10.5.0
riscv                 randconfig-002-20250709    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250709    clang-17
s390                  randconfig-002-20250709    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250709    gcc-10.5.0
sh                    randconfig-002-20250709    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250709    gcc-15.1.0
sparc                 randconfig-002-20250709    gcc-10.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250709    clang-21
sparc64               randconfig-002-20250709    clang-21
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250709    clang-17
um                    randconfig-002-20250709    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250709    gcc-12
x86_64      buildonly-randconfig-002-20250709    clang-20
x86_64      buildonly-randconfig-003-20250709    gcc-12
x86_64      buildonly-randconfig-004-20250709    gcc-12
x86_64      buildonly-randconfig-005-20250709    clang-20
x86_64      buildonly-randconfig-006-20250709    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250709    gcc-8.5.0
xtensa                randconfig-002-20250709    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

