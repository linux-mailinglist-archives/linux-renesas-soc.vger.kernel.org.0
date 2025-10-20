Return-Path: <linux-renesas-soc+bounces-23344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E8BF3E0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 00:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 473D54876E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 22:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B6D2ECD37;
	Mon, 20 Oct 2025 22:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aT2TzYf8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124BC2853F7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 22:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760998926; cv=none; b=sN5heehXGvPiLT6W0bNQmJGzGKFU/9Pvb5hOudpW9sH7LUnaK93RJ576LinRKgZtkqAi0nE3K3u+3hVbvbQKp0B0dQoJr+rGwwL9WjRgYBVB/K3KCw1DlCJ9+BXRY4rLY3IXTKFNnd0/9Sm0CnzHEVSLbOAn259YHGTBSPuKZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760998926; c=relaxed/simple;
	bh=VexDz+pA05PUr1BMJ1Je8MKjT5yEi+RUagQMfddqfeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BwXveunvjNjQZoMnOPBIgM/7ZnXLXonWgtUjjmvrItMt8tWCwsTLPaM7f2+ULxSQ/ewrm9YLhr04z1kf2dpRWUqHDE3QqlwzLyhYFA85KF0E8yHoHCOJjipK0eDP45u7qBDAKRHEGbo9+8uNGsvj3HdawxVxZsW+fCD+J7lznkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aT2TzYf8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760998924; x=1792534924;
  h=date:from:to:cc:subject:message-id;
  bh=VexDz+pA05PUr1BMJ1Je8MKjT5yEi+RUagQMfddqfeA=;
  b=aT2TzYf8o1bCiXR5f0C8rDExT1yt3+4LK2ykbWgdR9lqaGGPcEIc9XjW
   W1cdam5Zd4hxsjdoahikg5vQVOak6RPGSoexemh6Mz00SlnGBlvZS1+jm
   u1As5wP/QUurnRk1YqxfkL+3kTPdww8zFmI7bhht7RiEQr1jzI/SFRSLk
   QfhQkysznEuw8IgDtyZUqnYCbEcYcGC2IU7JRANJ0C1j7S6Tv9RjRYnAI
   0+klcLTlDq/sq18eALwAH8exEKipWmpuaxMQCmpcUmLMpD4HqvreLxihX
   w0EUW4ItgCpCdrxQIvGgDoPKKr/tFj7aKjUj2ttWKatXuCSsDys7vpupT
   A==;
X-CSE-ConnectionGUID: vmvLNuDmRjinioK6OLhHpQ==
X-CSE-MsgGUID: NTlUyLR7SXyh5XHeLR+hfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62824210"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62824210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 15:22:02 -0700
X-CSE-ConnectionGUID: zTs71Va/RyKXmmGrVvnvMQ==
X-CSE-MsgGUID: sHE1vSnoQaC0KeULPyweNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="188539723"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Oct 2025 15:22:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAyFb-000ADB-13;
	Mon, 20 Oct 2025 22:21:38 +0000
Date: Tue, 21 Oct 2025 06:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 7d972bce3ef4bbaaa5249f37af968c0d44551a86
Message-ID: <202510210617.scMfp3Vb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 7d972bce3ef4bbaaa5249f37af968c0d44551a86  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v6.18-rc2' into renesas-devel

elapsed time: 752m

configs tested: 109
configs skipped: 3

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
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
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

