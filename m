Return-Path: <linux-renesas-soc+bounces-7214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9C92C831
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 04:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 794CFB21082
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 02:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFDEA32;
	Wed, 10 Jul 2024 02:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ftivqmwb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606BF320C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720576867; cv=none; b=RTLxYAa0DaYlNm2oCDPmUJvMGsNOV5yR2rkYwdsIdPMroBCTPwk4hk6yF5oLsnvzA2Cad+JL798fcGYqZwivFRJ88mCLpRB7AMI3DrT+ALMyFk5GkfMd+5SW7HD7gBiAeARDznwd1/Mfa3ZNcBbAnKDHa9M2jvsrYBEBUCO1y70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720576867; c=relaxed/simple;
	bh=a6AEfhQEi+pFuk2UcSc7SM79AtREJL3XKAXhF4ZY3sk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cUt6FdlMHWQjeH58WclL6JWTVJIfmwZM7+WYTDB2OiTHRTMFXDkNz0ScZBc4njkR3+PQZLMKZE9osGo9srtr8bKkCLegr9L7CuyAWRJpbnGoM4LtdiL4ZTC+848/fJ/J0h1jb8LKNYpX62sdpMUHUE7nJ+rn78xy9BHYDa1FhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ftivqmwb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720576865; x=1752112865;
  h=date:from:to:cc:subject:message-id;
  bh=a6AEfhQEi+pFuk2UcSc7SM79AtREJL3XKAXhF4ZY3sk=;
  b=FtivqmwbZXCncOfGjIV3HIRGLKOIf3lw5i5RziOXyyOOi20LLr74GmBd
   9k8FBpX/GLivFeKFlFQnkCpoJpmwfs++QFlJXlfiuj/RIAI2C2Yxmlk4y
   sM5FMcKkUIzRunqQMppvZ+95yywCKb8WbW9X4j2EB8WANJiqKzm1s65pp
   pAqe/w9/8bBULk0oBM6IDGjRUql7ScDUqRPfX3iZIwcJmCQWjOz/GnwxS
   ENOob5yAbuP14z7hL/ZMl68saX+uKyxWsMZ+gig0kGvXv4GNfWOo5DQUP
   u7btm0DfkQnpvb9zpoqLRafFccsUs3cU01sNZE7/8OsC4PLhSPk8xOks8
   Q==;
X-CSE-ConnectionGUID: TyX2gLXeSzCza0YLlqDYfA==
X-CSE-MsgGUID: oHvzT4MGQJChEz1msxJ0Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="20778064"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="20778064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 19:01:01 -0700
X-CSE-ConnectionGUID: WtL0THiXTAuiEKLS6jhUKA==
X-CSE-MsgGUID: wbJhOuXwRPmNPFF4eaRfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="71275087"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2024 19:01:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRMde-000XLu-0H;
	Wed, 10 Jul 2024 02:00:58 +0000
Date: Wed, 10 Jul 2024 10:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar3-iommus-v1] BUILD SUCCESS
 f788d9b14a791bc9ab012d48ded2739fee5afb77
Message-ID: <202407101031.7dwOUWYu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar3-iommus-v1
branch HEAD: f788d9b14a791bc9ab012d48ded2739fee5afb77  arm64: dts: renesas: r8a779h0: Add missing iommus properties

elapsed time: 735m

configs tested: 72
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                          pxa910_defconfig   gcc-13.2.0
arm                        realview_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                    nommu_virt_defconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                                defconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                        dreamcast_defconfig   gcc-13.2.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                           se7780_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

