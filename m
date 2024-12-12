Return-Path: <linux-renesas-soc+bounces-11257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDA9EE66B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 13:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C8C91613F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 12:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B3020B7FA;
	Thu, 12 Dec 2024 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeY5UxM0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C551E9B27
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005665; cv=none; b=EWiNA9CVlpD4lGENWCxVDQ6kfDNOj5Z7rXMq8y3hNcQ5DL6OECtor9CMM23yZmgGlQqYi1zDuABEABBKwfpWufqQ4vmsS7v2lqVWQlBHwlNpoiRYwR6C3QOEDMLVh1QJ8VJzxoTQX8WkZ+0gukV9K2Cv+YU/HQzfD+q/fnfGSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005665; c=relaxed/simple;
	bh=bj98u6wF2PcfNMNf75NP7TW/gwYq9tLeyyM07GlPYyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rQrYKOHvUVWQInRZ8WI3DcUPWSYl7I1MlT+JmnX7RZ+LoFUVCRSMQOzhBcvafYtCY7/Xpa28axwS9ppl+Gipr0j9zb0G1+yXR7XylnDRA5Tl49RvPV+4auoM4Vnl9uDhxOKdSQ2mumYnwG+hdvUv16+F+zBoK7NjtMUrgalhACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeY5UxM0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734005662; x=1765541662;
  h=date:from:to:cc:subject:message-id;
  bh=bj98u6wF2PcfNMNf75NP7TW/gwYq9tLeyyM07GlPYyc=;
  b=CeY5UxM0V0vkXf2qS/nAmK36SpkOH6F9ZaZFtt2Aali7bbZuteSbuTRo
   pE6ZE8k17EM2MJ81TPVBytEQ7AO6BtksNNiUs495ZTKHnxOQ3/Tv1JxRE
   eTrVIl+FmbMi8Hu+yZSUi+jrgIJyXFdMjCX/7t2wf1PBs8s1j+Vq4k0Sb
   MGJMqWmI5DGkYn1jLi1WkmiT4RxFy7qwvAnWOipoBkxipZYYA5PCXGp/4
   yeWPdpa7cvJ7l8e/eO+bNvzWJ71d2AGnWibZJi29+0pvH38TamA4s/TPf
   JIe0LIe2z2pj/ZgYc3ERDoJ4Hs+Mwyh72Fzc0F2cBjew+V1NeiiJtiwFF
   w==;
X-CSE-ConnectionGUID: tsCqbDfwS922AVw/xLuRtA==
X-CSE-MsgGUID: PIEuO4E/TN2CzliJSl2iKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34465095"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34465095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 04:14:22 -0800
X-CSE-ConnectionGUID: pBeGiJYYQ1uwPj73SHRzCA==
X-CSE-MsgGUID: dsWAEe/YTPKH9DXitFrQjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100764511"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2024 04:14:21 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLi5D-0007oa-02;
	Thu, 12 Dec 2024 12:14:19 +0000
Date: Thu, 12 Dec 2024 20:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6f6e22df6eae4434f8fcb75419ac5481b31336db
Message-ID: <202412122025.3XiJMwfr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6f6e22df6eae4434f8fcb75419ac5481b31336db  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1452m

configs tested: 79
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241212    gcc-13.2.0
arc                   randconfig-002-20241212    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241212    gcc-14.2.0
arm                   randconfig-002-20241212    clang-20
arm                   randconfig-003-20241212    clang-19
arm                   randconfig-004-20241212    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241212    clang-20
arm64                 randconfig-002-20241212    clang-15
arm64                 randconfig-003-20241212    clang-20
arm64                 randconfig-004-20241212    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241212    gcc-14.2.0
csky                  randconfig-002-20241212    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241212    clang-14
hexagon               randconfig-002-20241212    clang-16
i386        buildonly-randconfig-001-20241212    clang-19
i386        buildonly-randconfig-002-20241212    clang-19
i386        buildonly-randconfig-003-20241212    clang-19
i386        buildonly-randconfig-004-20241212    clang-19
i386        buildonly-randconfig-005-20241212    clang-19
i386        buildonly-randconfig-006-20241212    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241212    gcc-14.2.0
loongarch             randconfig-002-20241212    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241212    gcc-14.2.0
nios2                 randconfig-002-20241212    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20241212    gcc-14.2.0
parisc                randconfig-002-20241212    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20241212    gcc-14.2.0
powerpc               randconfig-002-20241212    clang-20
powerpc               randconfig-003-20241212    clang-15
powerpc64             randconfig-001-20241212    clang-20
powerpc64             randconfig-002-20241212    gcc-14.2.0
powerpc64             randconfig-003-20241212    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241212    clang-17
riscv                 randconfig-002-20241212    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241212    clang-18
s390                  randconfig-002-20241212    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241212    gcc-14.2.0
sh                    randconfig-002-20241212    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241212    gcc-14.2.0
sparc                 randconfig-002-20241212    gcc-14.2.0
sparc64               randconfig-001-20241212    gcc-14.2.0
sparc64               randconfig-002-20241212    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241212    gcc-12
um                    randconfig-002-20241212    clang-20
x86_64      buildonly-randconfig-001-20241212    clang-19
x86_64      buildonly-randconfig-002-20241212    gcc-12
x86_64      buildonly-randconfig-004-20241212    clang-19
x86_64      buildonly-randconfig-005-20241212    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241212    gcc-14.2.0
xtensa                randconfig-002-20241212    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

