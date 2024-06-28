Return-Path: <linux-renesas-soc+bounces-6883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C785991BEDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 14:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAECC1C224CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 12:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CE315886A;
	Fri, 28 Jun 2024 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DF92/FMp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BC8158A12
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719578674; cv=none; b=EloUAByY0ST7ihRNgibpe8dat6Web57LkAzrSxQYDAWb1/mVbrBiAnxuZl4/VpmJ1asjeLUVUQDY5CWhKBCI4yQjA1NWcUVIGhTIBJKn8T9oR3U9gu/EM1hBAbp+VUiYxkryLddnRQ8tRYr/+bzRAfw4aghu5XPDmnDw683TFnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719578674; c=relaxed/simple;
	bh=eV4Vh1JEQcda64MBnz15P3lyexmWbbu1LhpKJ/Kg/Hk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hkvy+6kx3EwnWa7qa9v8Aqt4c9kQCTW/8Il3GE3DFS8VRj6Y23/KE6FZW5Xq3maoOTAO+J6ixAEpV4cU7QvX08tHiYHtjesh4Ejoqu3AFMvNPe4AoQ55LwJfi84Xa+27X4SDFKXQOI8Qhy7K9Vjetrj46y4uBClUvME3nSUWVlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DF92/FMp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719578672; x=1751114672;
  h=date:from:to:cc:subject:message-id;
  bh=eV4Vh1JEQcda64MBnz15P3lyexmWbbu1LhpKJ/Kg/Hk=;
  b=DF92/FMpDpQQG5mxz5Rps8/T+WWwnkmaSAOEoCkzlhf3u1mxu2txkToE
   1VhPhj/KCM1hSLuqUEn+SM9V0npM7z9j/fRtWR77NJaRp8JKtaVAiUdKD
   sUJW3bocg2XQCYLyNSsf0rtzB7aUdPHpFxfffDS9SM+DTG0LqlvvwrpmX
   MoGALK9BdYx+4wBGgjoMlRV6JEWcgvf8SWbvQb9jSVWEDg0xW9W2vcibH
   mUjCPsbbCkEwCPDaOdbqfA9gvEUTihQNDLkGP8lOuCcsylxEfqrNcjfsQ
   1jiokDKIoH8sayMCPXWI41BY0vgrxs6/YqBZItYrpgmlxNrkGJQOGurNf
   g==;
X-CSE-ConnectionGUID: n/Ol9wkqRGKUTkED2pjGKA==
X-CSE-MsgGUID: 9e63BCBSSGa/k0DZxutWaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="42180206"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="42180206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 05:44:32 -0700
X-CSE-ConnectionGUID: xkXU5lcvQGuJ5RRjj31NFg==
X-CSE-MsgGUID: KFwRqlUISCugPSCFJpN1Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44787599"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 05:44:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNAxo-000H5a-2c;
	Fri, 28 Jun 2024 12:44:28 +0000
Date: Fri, 28 Jun 2024 20:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.11] BUILD
 SUCCESS 8a3d2ad6129c1c43b683550802a93a9ca7f9645b
Message-ID: <202406282027.gKQPF3ql-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.11
branch HEAD: 8a3d2ad6129c1c43b683550802a93a9ca7f9645b  dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM

elapsed time: 5648m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240625   gcc-13.2.0
arc                   randconfig-002-20240625   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                   randconfig-003-20240625   gcc-13.2.0
arm                   randconfig-004-20240625   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                            allyesconfig   clang-19
arm64                 randconfig-001-20240625   gcc-13.2.0
arm64                 randconfig-002-20240625   gcc-13.2.0
arm64                 randconfig-004-20240625   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240625   gcc-13.2.0
csky                  randconfig-002-20240625   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-004-20240625   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240625   gcc-13
i386                  randconfig-003-20240625   gcc-7
i386                  randconfig-006-20240625   gcc-13
i386                  randconfig-012-20240625   gcc-13
i386                  randconfig-015-20240625   gcc-12
i386                  randconfig-016-20240625   gcc-10
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240625   gcc-13.2.0
loongarch             randconfig-002-20240625   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                             allmodconfig   clang-19
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   clang-19
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                 randconfig-001-20240625   gcc-13.2.0
nios2                 randconfig-002-20240625   gcc-13.2.0
openrisc                         allmodconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240625   gcc-13.2.0
parisc                randconfig-002-20240625   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc               randconfig-002-20240625   gcc-13.2.0
powerpc               randconfig-003-20240625   gcc-13.2.0
powerpc64             randconfig-001-20240625   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240625   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240625   gcc-13.2.0
sh                    randconfig-002-20240625   gcc-13.2.0
sparc                            allyesconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240625   gcc-13.2.0
sparc64               randconfig-002-20240625   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240625   gcc-13
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-002-20240625   gcc-13
x86_64                randconfig-003-20240625   gcc-13
x86_64                randconfig-006-20240625   gcc-13
x86_64                randconfig-012-20240625   gcc-13
x86_64                randconfig-015-20240625   gcc-13
x86_64                randconfig-016-20240625   gcc-11
x86_64                randconfig-071-20240625   gcc-13
x86_64                randconfig-074-20240625   gcc-13
x86_64                          rhel-8.3-func   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                           allyesconfig   gcc-13.2.0
xtensa                randconfig-001-20240625   gcc-13.2.0
xtensa                randconfig-002-20240625   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

