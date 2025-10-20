Return-Path: <linux-renesas-soc+bounces-23343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA711BF3CA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 23:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 210C34E6B13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 21:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE181E51FA;
	Mon, 20 Oct 2025 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHY4qd6a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA491EF39E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760997281; cv=none; b=p0PelW5d0sqPk4APnMteFZu3rZjArbhMMi42thYFD/Dvr3WlTlOfXWSD1t1d3uU5fEO3hXHQDcmqTdRFMNnf73ImFFNbR6sB6Sn/feBINZ5tzcz/VqhSKQi9xAtTf7YCkhpAeubL7/D0jXuEufKKUU2PoNGcp2PoWVVN4JVSqQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760997281; c=relaxed/simple;
	bh=9qfKTWwoM/RhwCY7Mq2w1Mm2qJ2cj4vUs0PR4WKH3wE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UnCzeKWIhJTDVwZYBej+BhWCN1uqg1nwpcQUX2hABcMXcbqQrQpDTaQhUZQeC7tmRwAmXHwnLdNXxmkjeFIN19R/AHfCVLG9dRztAf3Ii4yL6AumbMq+sounCPplRJNa2FwZ/DP+X9C59/nBR5Q59CbtU5cP5JJSbvdKkOl3GP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHY4qd6a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760997279; x=1792533279;
  h=date:from:to:cc:subject:message-id;
  bh=9qfKTWwoM/RhwCY7Mq2w1Mm2qJ2cj4vUs0PR4WKH3wE=;
  b=aHY4qd6auWsgYo1fQMxVkFFLvzdA8VCdOR5FQO8iJwdYsk3RWjbAtIHQ
   8lIdTWWvXgfprmd1lvqoOcTxIFni7dPpMeEK8atdEYDNrPNJn0mBDZNYh
   j11f/tl0aet1VJl/Rge3iOeqcv9Qrs2h0o4p7u0t+JL60R0lW1U3w5ze2
   gt9lh6aijFKgMEEempN1eymXsM/IoI0ZZ7okd9ivz/wUVgp0jVNa8SoH9
   VX/qcGzdoUI7HevB3DsEulnaoQf0BRHdN1HNQfe2xeqwChkrKBHcnZjS3
   YI6lAmTog+HVX7+xrDRp6Wodtw8V0L8HK8EluiWLrrN2C6oRVmaqFkAFh
   g==;
X-CSE-ConnectionGUID: MlS8P3t5RyC7f2mtHoOBbQ==
X-CSE-MsgGUID: N75j2FPoR3O76FpcCaIr9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63160671"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63160671"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 14:54:39 -0700
X-CSE-ConnectionGUID: EF7sKBcrTDyFqJ0qJMEiyQ==
X-CSE-MsgGUID: Br9d3Nr9St2xho9CR3xCkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="214396887"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2025 14:54:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAxpr-000ABc-1Q;
	Mon, 20 Oct 2025 21:54:35 +0000
Date: Tue, 21 Oct 2025 05:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 036eee574e2e25a96f916e06087a4c2feade2d87
Message-ID: <202510210512.wmwd8lop-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 036eee574e2e25a96f916e06087a4c2feade2d87  riscv: rzfive: defconfig: Refresh for v6.18-rc1

elapsed time: 727m

configs tested: 107
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251020    gcc-14.3.0
arc                   randconfig-002-20251020    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20251020    gcc-14.3.0
arm                   randconfig-002-20251020    clang-22
arm                   randconfig-003-20251020    clang-22
arm                   randconfig-004-20251020    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251020    clang-22
arm64                 randconfig-002-20251020    gcc-12.5.0
arm64                 randconfig-003-20251020    gcc-8.5.0
arm64                 randconfig-004-20251020    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251020    gcc-15.1.0
csky                  randconfig-002-20251020    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251020    clang-22
hexagon               randconfig-002-20251020    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251020    gcc-14
i386        buildonly-randconfig-002-20251020    clang-20
i386        buildonly-randconfig-003-20251020    gcc-14
i386        buildonly-randconfig-004-20251020    gcc-14
i386        buildonly-randconfig-005-20251020    clang-20
i386        buildonly-randconfig-006-20251020    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251020    gcc-15.1.0
loongarch             randconfig-002-20251020    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251020    gcc-10.5.0
nios2                 randconfig-002-20251020    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20251020    gcc-13.4.0
parisc                randconfig-002-20251020    gcc-10.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251020    clang-22
powerpc               randconfig-002-20251020    gcc-8.5.0
powerpc               randconfig-003-20251020    clang-22
powerpc64             randconfig-001-20251020    clang-19
powerpc64             randconfig-002-20251020    gcc-11.5.0
powerpc64             randconfig-003-20251020    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251020    gcc-13.4.0
riscv                 randconfig-002-20251020    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251020    gcc-11.5.0
s390                  randconfig-002-20251020    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251020    gcc-15.1.0
sh                    randconfig-002-20251020    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251020    gcc-8.5.0
sparc                 randconfig-002-20251020    gcc-8.5.0
sparc64               randconfig-001-20251020    gcc-10.5.0
sparc64               randconfig-002-20251020    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251020    clang-22
um                    randconfig-002-20251020    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251020    gcc-14
x86_64      buildonly-randconfig-002-20251020    clang-20
x86_64      buildonly-randconfig-003-20251020    gcc-14
x86_64      buildonly-randconfig-004-20251020    gcc-14
x86_64      buildonly-randconfig-005-20251020    gcc-14
x86_64      buildonly-randconfig-006-20251020    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251020    gcc-8.5.0
xtensa                randconfig-002-20251020    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

