Return-Path: <linux-renesas-soc+bounces-6110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB79056DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 17:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 633BBB23D7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 15:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224DE17F4EB;
	Wed, 12 Jun 2024 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B04ld/B5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859217E442
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206079; cv=none; b=dqrn5i7IzWp9uzrHa9Ai2gxie1qQnoj5pfIGp8PaZdHCbZo4bQzcQOETUDHR/Y/WgMaFavyWcmqDklWQo3AX09eZTX8qtIDzyLESrSvDZ6mAa3hbnX1RoO7frLGMOq1oUhfXQfkPWC6wsdTYCslv2l81VM9iqx70od42Iy+dIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206079; c=relaxed/simple;
	bh=KoHspqTT+QXYhiHqZPyDqkeMUerGIgOLwqIBC1XOCSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QLZZ7JJaLcLtdvVPx9tGoRGMHTRyAbDVPoUTN9gRmPp3Ks3/Jd1cXktSsVFN4rT/0vSZs4xoDu0nFx/n51UH9OiN1xs/5CHcBorTfqlEfxL8r46jGPkdJyw8O751/iTt0SeoYpwDOWCtFdnytlXeFZYSjTRNrQTA+W7ZNLfR2gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B04ld/B5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718206078; x=1749742078;
  h=date:from:to:cc:subject:message-id;
  bh=KoHspqTT+QXYhiHqZPyDqkeMUerGIgOLwqIBC1XOCSA=;
  b=B04ld/B5f62Bq4Yuye1kzXibm9uYvlvUcy8YZLp9DJGk149ogo92hAiY
   ylJSSTac2WwMWp/xEvwln8cxsoHuygfcKR5QwSDIIMc/Sht7rV0+JEyu1
   OD8DmnBSsd18y8vL+EokL9HLy8HtU+T3fW8mtFF0oOpIB4kV1bziRBJgd
   h+2a0MuUmhg6NaIO3MYA7d9x7Auhg+44pZujzDDZL//lu4kPRVOw9J58v
   NjyHFR5DgjJSuG5VMdn/OlSnIJpL/wR+pM2J0Wjzvo0OOo1levnz1ER+f
   YBFRRtNtEiEUiikq6DjfyEWEg1TI7NIGjLKSeeDYWcE3goYkLEaCb/vvr
   Q==;
X-CSE-ConnectionGUID: mBZ1U2llRvqaZFqvvYNjVg==
X-CSE-MsgGUID: /QtIRvTFRV+T2S/vvJX31Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25557065"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="25557065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 08:27:57 -0700
X-CSE-ConnectionGUID: Q531NLBLSkO8xW9VB1M+aA==
X-CSE-MsgGUID: J+TGVI5uQ5SLCQQQoPGXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44385630"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2024 08:27:56 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHPtB-0001eW-0l;
	Wed, 12 Jun 2024 15:27:53 +0000
Date: Wed, 12 Jun 2024 23:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.11] BUILD SUCCESS
 f92d44a00bd559f411b2c70b677afbc7c4723019
Message-ID: <202406122331.ex0i9xtR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.11
branch HEAD: f92d44a00bd559f411b2c70b677afbc7c4723019  clk: renesas: r8a779h0: Add VIN clocks

elapsed time: 1487m

configs tested: 86
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240612   gcc-13.2.0
arc                   randconfig-002-20240612   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                   randconfig-001-20240612   gcc-13.2.0
arm                   randconfig-002-20240612   gcc-13.2.0
arm                   randconfig-003-20240612   clang-19
arm                   randconfig-004-20240612   clang-14
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240612   gcc-13.2.0
arm64                 randconfig-002-20240612   gcc-13.2.0
arm64                 randconfig-003-20240612   gcc-13.2.0
arm64                 randconfig-004-20240612   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240612   gcc-13.2.0
csky                  randconfig-002-20240612   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240612   clang-19
hexagon               randconfig-002-20240612   clang-19
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240612   gcc-13.2.0
loongarch             randconfig-002-20240612   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240612   gcc-13.2.0
nios2                 randconfig-002-20240612   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240612   gcc-13.2.0
parisc                randconfig-002-20240612   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240612   gcc-13.2.0
powerpc               randconfig-002-20240612   gcc-13.2.0
powerpc               randconfig-003-20240612   clang-19
powerpc64             randconfig-001-20240612   gcc-13.2.0
powerpc64             randconfig-002-20240612   gcc-13.2.0
powerpc64             randconfig-003-20240612   clang-14
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240612   gcc-13.2.0
riscv                 randconfig-002-20240612   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240612   clang-19
s390                  randconfig-002-20240612   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240612   gcc-13.2.0
sh                    randconfig-002-20240612   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240612   gcc-13.2.0
sparc64               randconfig-002-20240612   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240612   gcc-13
um                    randconfig-002-20240612   clang-16
um                           x86_64_defconfig   clang-15
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-002-20240612   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

