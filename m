Return-Path: <linux-renesas-soc+bounces-11556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33E9F6B94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 17:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8833416BC11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 16:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724FB1F541A;
	Wed, 18 Dec 2024 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL/IesNX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264241FA174
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734540913; cv=none; b=NranRP/2rkWcQ12g4+yQCGRsnhE3kIcWEHDZZ1jbS5IuzIziA8p/LMdPw4VC65Kkv0KIgNYaPtbyNZa04bIxWF88uZME3GFUqgVPAOC2JukdZgy+ZSPRcDpDHAor3yHRnTfRwHjEi6e5VZI+RJXqWSqj49mx7QXBN8+ide0uQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734540913; c=relaxed/simple;
	bh=Llon/qDurXqZ4FJ/lw9uRPzzx8nlmhgOqkavlnj76kI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jd2IxLUSyF6h+n8wyWK1CtuuSyqf0q1PfiU9J+I6qktujx4xsE1jKsNnz2t+PzlTxjos6jacnJqbuQBV+fQoNjXVdamQhNpATKlC9PoLPYVyPIevZW3FfvkMTz0BFzeCFliaAjfJ3+GzWpXefwtmHYKadxi3JLV1z4oN+GJ0kJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QL/IesNX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734540911; x=1766076911;
  h=date:from:to:cc:subject:message-id;
  bh=Llon/qDurXqZ4FJ/lw9uRPzzx8nlmhgOqkavlnj76kI=;
  b=QL/IesNXh5hVflgF5KKFS7RDhfbzzCm+uF2fwnQ7rXYSVWjcFwMNdj1O
   864m4cVNvdidvdoxu1bZolxQttuOcqy1pDYVK+T9NdoAKHWWaWbYbXvwb
   +1sNrZDY1hOtaQ9sPdOQRVUs6VRBlgZTMIslMJYplTHquTFkLyplxQtsH
   FRgKkaW3iNBA1CmrmC6m+X/ZZ6T0O42E8dHeYgCIOosXhDa/eJqkAJNxT
   AdC79/TSVDoq0ll73nSiI+1ifZRCJixHT6odYgjV/oD6mTwRGVAU0BXwN
   /4or6AFb3mDT52opobuZyFAEa8N2GjwqKRUuozWGS26eQUEXAq1zC3cvE
   w==;
X-CSE-ConnectionGUID: Xf5eE2JFSgC3jKUPuR0CsA==
X-CSE-MsgGUID: NPOHLhwvQfCvEfAV61R4sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34746846"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="34746846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 08:55:09 -0800
X-CSE-ConnectionGUID: vv2hZ1jDSfG+AmTCMeES4Q==
X-CSE-MsgGUID: jHgQ2smJSBGymo6LX6lmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="102923114"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2024 08:55:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNxKD-000GVM-1G;
	Wed, 18 Dec 2024 16:55:05 +0000
Date: Thu, 19 Dec 2024 00:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.13-rc1]
 BUILD SUCCESS ad9fb352eb8570f4f56918c7f332fefe7c09d429
Message-ID: <202412190006.hcLbYbwD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.13-rc1
branch HEAD: ad9fb352eb8570f4f56918c7f332fefe7c09d429  arm64: dts: renesas: white-hawk-cpu: Add overlay for CP97/98

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20241218
|   |-- arch-arm64-boot-dts-rockchip-rk3399-gru-kevin.dtb:thermal-zones:bigcpu-reg-thermal:trips:phandle:is-not-of-type-object
|   |-- arch-arm64-boot-dts-rockchip-rk3399-gru-kevin.dtb:thermal-zones:litcpu-reg-thermal:trips:phandle:is-not-of-type-object
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:i3c1:i3c1m1-xfer:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:i3c1_sda:i3c1_sdam1-pu:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm0:pwm0m1-ch1:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm1:pwm1m1-ch5:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m0-ch2:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m0-ch3:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m0-ch4:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch0:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch1:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch2:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch3:rockchip-pins:is-greater-than-the-maximum-of
|   |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch5:rockchip-pins:is-greater-than-the-maximum-of
|   `-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch6:rockchip-pins:is-greater-than-the-maximum-of
`-- arm64-randconfig-052-20241218
    |-- arch-arm64-boot-dts-rockchip-rk3399-gru-kevin.dtb:thermal-zones:bigcpu-reg-thermal:trips:phandle:is-not-of-type-object
    |-- arch-arm64-boot-dts-rockchip-rk3399-gru-kevin.dtb:thermal-zones:litcpu-reg-thermal:trips:phandle:is-not-of-type-object
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:i3c1:i3c1m1-xfer:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:i3c1_sda:i3c1_sdam1-pu:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm0:pwm0m1-ch1:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm1:pwm1m1-ch5:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m0-ch2:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m0-ch3:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m0-ch4:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch0:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch1:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch2:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch3:rockchip-pins:is-greater-than-the-maximum-of
    |-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch5:rockchip-pins:is-greater-than-the-maximum-of
    `-- arch-arm64-boot-dts-rockchip-rk3576-armsom-sige5.dtb:pinctrl:pwm2:pwm2m1-ch6:rockchip-pins:is-greater-than-the-maximum-of

elapsed time: 1444m

configs tested: 97
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241218    gcc-13.2.0
arc                   randconfig-002-20241218    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241218    clang-20
arm                   randconfig-002-20241218    clang-19
arm                   randconfig-003-20241218    clang-17
arm                   randconfig-004-20241218    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241218    clang-20
arm64                 randconfig-002-20241218    clang-20
arm64                 randconfig-003-20241218    gcc-14.2.0
arm64                 randconfig-004-20241218    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241218    gcc-14.2.0
csky                  randconfig-002-20241218    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241218    clang-20
hexagon               randconfig-002-20241218    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241218    clang-19
i386        buildonly-randconfig-002-20241218    clang-19
i386        buildonly-randconfig-003-20241218    gcc-12
i386        buildonly-randconfig-004-20241218    gcc-12
i386        buildonly-randconfig-005-20241218    clang-19
i386        buildonly-randconfig-006-20241218    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241218    gcc-14.2.0
loongarch             randconfig-002-20241218    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241218    gcc-14.2.0
nios2                 randconfig-002-20241218    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241218    gcc-14.2.0
parisc                randconfig-002-20241218    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20241218    gcc-14.2.0
powerpc               randconfig-002-20241218    clang-15
powerpc               randconfig-003-20241218    clang-17
powerpc64             randconfig-002-20241218    clang-20
powerpc64             randconfig-003-20241218    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241218    gcc-14.2.0
riscv                 randconfig-002-20241218    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241218    gcc-14.2.0
s390                  randconfig-002-20241218    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241218    gcc-14.2.0
sh                    randconfig-002-20241218    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241218    gcc-14.2.0
sparc                 randconfig-002-20241218    gcc-14.2.0
sparc64               randconfig-001-20241218    gcc-14.2.0
sparc64               randconfig-002-20241218    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241218    gcc-12
um                    randconfig-002-20241218    clang-17
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241218    clang-19
x86_64      buildonly-randconfig-002-20241218    clang-19
x86_64      buildonly-randconfig-003-20241218    gcc-12
x86_64      buildonly-randconfig-004-20241218    gcc-12
x86_64      buildonly-randconfig-005-20241218    gcc-12
x86_64      buildonly-randconfig-006-20241218    gcc-11
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241218    gcc-14.2.0
xtensa                randconfig-002-20241218    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

