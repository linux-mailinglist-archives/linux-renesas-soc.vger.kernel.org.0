Return-Path: <linux-renesas-soc+bounces-358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C061C7FC02D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 18:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0E691C20BA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 17:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DB65C064;
	Tue, 28 Nov 2023 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDYlhJwF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A86119B2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701192070; x=1732728070;
  h=date:from:to:cc:subject:message-id;
  bh=zsJTg9e4nifkXNdDsVBgBZ3y4+fjweJp26HOHFktFnU=;
  b=SDYlhJwFilez5ymul8TUdEDN6bQZFVCFODpc488kyDP872sI5rnBe4+6
   puHaNaD/cao6hCJRyXsbWPvDz0K4cm65c9CvSgr/C9Ut2uT4SK+FR5xsy
   MmnkELd2/X6V70oBIk5oFm9FkYJo7kIzp48rIGcNjrhSoiaYJkzUJRFsa
   hPOENKu2D02NGrTTojwgQeoA2l0HUcJgs+R3FMbIO07RX8S7uj/dtmiYH
   DN6JI5P7FCcwwMPD9AqWsXH5yDta0g2d4XHtI32AL3R1yt3KA/ng4GNVW
   djTyHMQ5QAP4yAthyh7oTRBeP9mglRXsAlZGBhSAHQHWDrGWuLHfod3Al
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373144313"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="373144313"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768587416"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="768587416"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Nov 2023 09:13:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r81eT-0007oV-3A;
	Tue, 28 Nov 2023 17:13:37 +0000
Date: Wed, 29 Nov 2023 01:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.8] BUILD
 SUCCESS 7c77368b6c42ec87aed9976288a9b50bccb272a6
Message-ID: <202311290133.bCNjBXYw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.8
branch HEAD: 7c77368b6c42ec87aed9976288a9b50bccb272a6  ARM: shmobile: defconfig: Refresh for v6.7-rc1

elapsed time: 1556m

configs tested: 44
configs skipped: 120

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

