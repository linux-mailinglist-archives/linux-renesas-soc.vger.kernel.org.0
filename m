Return-Path: <linux-renesas-soc+bounces-12831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12880A2688C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 01:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B870A7A2357
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 00:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108885684;
	Tue,  4 Feb 2025 00:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5qHhBBX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A61862A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Feb 2025 00:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738628929; cv=none; b=p/MxlX+KAwupkjQEDBC2+JfbjybBLxiJIGX1cz8/0+bpVgmJhgR1zIXmVWHRc3ObS8TvF4RDhyHiO0p31Xx3hEGnOde3nDCIl6qNLAjkCE1aez+5tvW1CqHQvjofEKD72aOq9OCx8CAQK7WadhCBdMoz7FbQhpflCNIrCy+QLYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738628929; c=relaxed/simple;
	bh=FsRrdQ6v2VTyb0TezN415IXBiVtNtgpyjDgodQrdhjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bJDhL010A8CIUKS87GeuWVWF4ZSmjzj6lB6nKOvi3sKh50etvVbNfIIJDw4wc9/O92V9KNG/qu8zUUsXjsZkGJmJMRDeh+gnYTmSwxl21YK7YaGZx14x+srizZj6cyUaMWGnrVvn51fa0df2ZdAkPWUcklsdQOm53iSZ/P7lwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5qHhBBX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738628927; x=1770164927;
  h=date:from:to:cc:subject:message-id;
  bh=FsRrdQ6v2VTyb0TezN415IXBiVtNtgpyjDgodQrdhjQ=;
  b=f5qHhBBXTtC9xJ57gulvQ0w2LyAMDHhU7xr5cJqPVHSuLibKgT8V4jt2
   0ZeL1F9Sl8bevuD3QplpAfXs3PyIjwpIgCLMN7iVr7P2LduEJPsmc7D7K
   ox51sx51OK4M/dr448NJ6p5hiGz2N7MQ8YVkA/qbLTROARm4phs/UQPFQ
   1cc29E/LgjHNQ3Lx5iGxKe8hTwtf+c3o86MlJwc+oSn4Mp3NRHUOG0U1W
   cSzp7RykHrMnlouH4lK6TSR6viweYZ7MwtgV4EWCPplQfIhJtcgXg7ylM
   3GfulfsvYe18uFsE08GL40YdwVEDAprfAR37QXhP4YXhtCj+AwgjCXwVn
   Q==;
X-CSE-ConnectionGUID: aSRVEFAvR4mvg5mxPakieQ==
X-CSE-MsgGUID: rxC+6T+gSCmaNDF+1WQS4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39399430"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39399430"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 16:28:46 -0800
X-CSE-ConnectionGUID: OuMWhYGRSMqv6xGktkoLAQ==
X-CSE-MsgGUID: pwG0eeopQLuqC9zqMdnOqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110981014"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 16:28:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf6nz-000rkJ-1V;
	Tue, 04 Feb 2025 00:28:43 +0000
Date: Tue, 04 Feb 2025 08:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.15] BUILD
 SUCCESS ff5a81e0178e5c032ac9700093f4877632d28c0a
Message-ID: <202502040858.LbN1HWxY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.15
branch HEAD: ff5a81e0178e5c032ac9700093f4877632d28c0a  ARM: shmobile: defconfig: Supplement DTB with ATAG information

elapsed time: 754m

configs tested: 96
configs skipped: 121

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-004-20250203    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                           allnoconfig    gcc-14.2.0
hexagon               randconfig-001-20250204    gcc-14.2.0
hexagon               randconfig-002-20250204    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250204    gcc-12
i386        buildonly-randconfig-003-20250204    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250204    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250204    clang-19
i386                  randconfig-012-20250204    clang-19
i386                  randconfig-013-20250204    clang-19
i386                  randconfig-014-20250204    clang-19
i386                  randconfig-015-20250204    clang-19
i386                  randconfig-016-20250204    clang-19
i386                  randconfig-017-20250204    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                      pasemi_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250204    gcc-14.2.0
powerpc64             randconfig-002-20250204    gcc-14.2.0
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                                allnoconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250204    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

