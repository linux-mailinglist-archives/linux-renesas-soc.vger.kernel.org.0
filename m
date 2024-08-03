Return-Path: <linux-renesas-soc+bounces-7709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0E9466C6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 03:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB1AE1F21A9E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 01:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E804C7C;
	Sat,  3 Aug 2024 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJYgOgD6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9F26AB9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Aug 2024 01:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722648527; cv=none; b=SGAIkZ4ERipHRRlGQgofwZZbGV4skKT17vzxGi4wjhHwsLtkS097JosRt/NVlAs+P004kkcUvRhWP5ybgG9BygmTcamJ9Xf4YZ1HvI5kysfMIOxisUra99+i7j425HK+cJKoZ1PDXWBD7tUMwaF58vzqelC8nuEO8ca45FQ2wfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722648527; c=relaxed/simple;
	bh=Yn3uhw+pWP6OvCgP4CR2G5sp6ZyOmbdDljIDiXRhbzI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nE7+hQnEzurtajfBWbJ2olPxES+rpr2ZjurOOCjtpD2PitxZKa0nXfmx9oyK1RdHXeWmlilWsvJrEw0A38C6+AUxTAJenqgt8XaOEmzD951bin32eBv1bF27ixQWmMHn7M7klPrcl223fgnAgbplUTzq3XI2rLeaRqqqZqhlAd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJYgOgD6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722648525; x=1754184525;
  h=date:from:to:cc:subject:message-id;
  bh=Yn3uhw+pWP6OvCgP4CR2G5sp6ZyOmbdDljIDiXRhbzI=;
  b=GJYgOgD69cW3SYuMjgyOAGIme95Pea3fhbrtXM4OhDvKVpQnzr8HTPkQ
   b36Fpwg2eWoaHI9mj3E7sKGyUiFVieleRUVSgTbZdhMmiDj1H9pZM26ch
   /aOUgcjltbhCmZp1akFoZzvVuXxjAZjPCNKlZFNNhlA0YAH2JFWrhPV4c
   jv7TjM6u/NMEsbk7KmS7KKXpu8N5XD6GPSdzqX56+Ek2MeK9tygAXbXcA
   FTb28Zo37gdS7tPqaR3w6BPvrrLyOvZeD/pUOOJS+50fgF2QAyOahnClf
   6Pi77+M2M32U89wnfeMuDJYTYo/f8nTQQWOuDXKmnWytSGBn8qilv0PyP
   w==;
X-CSE-ConnectionGUID: 0wFk1OzFRdiK6BKxa51YRQ==
X-CSE-MsgGUID: rpld0nUoTXK3DL4ft1JDeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24553938"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="24553938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 18:28:44 -0700
X-CSE-ConnectionGUID: O8f7Suj+RE2AAGb/If7GTg==
X-CSE-MsgGUID: q61qrqEWT02ZOCUEM0a9Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55234623"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Aug 2024 18:28:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa3ZZ-000xgK-1S;
	Sat, 03 Aug 2024 01:28:41 +0000
Date: Sat, 03 Aug 2024 09:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 054a83a1548ce30eeebcf95c86951d3ef56e6f7d
Message-ID: <202408030939.AvYb6WJs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: 054a83a1548ce30eeebcf95c86951d3ef56e6f7d  arm64: dts: renesas: r9a08g045: Add DMAC node

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20240802
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e30000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e31000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e32000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e33000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    `-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e34000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren

elapsed time: 887m

configs tested: 60
configs skipped: 109

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

