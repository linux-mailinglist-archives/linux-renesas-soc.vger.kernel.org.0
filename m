Return-Path: <linux-renesas-soc+bounces-24590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A0C597CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AFC03B9001
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6167F30FF36;
	Thu, 13 Nov 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLVk4bvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C5730F931
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763058775; cv=none; b=s8bY5/1u4AixGrFAt3DY1RWdobPltldb3PLoyPhVARfpSLEzCHgF5Oa+WWeuNR98oLlcnKAFqWfK0JNACx3NkzTrz0/elUcuDhhUngudpP9QeUas3ZQe6RlWzJiYUAha+qmrcqqNo9kgW6jJytwvelyNVmY2KsxtOPR5HIMieiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763058775; c=relaxed/simple;
	bh=4/NVi5RMonaXnxy2sBUkR/7mUNDBYOaP8KCivdM/k/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DkY0zAG6mGzveMVRWqfJO0clktucNAfsk1iynJmW3n/MdKyT8UTkPSQTWKaBVQWViOQoN7gisGMHD7u56O8pWacgJwCiS2FBI2VPN4OQCXjyTM/mMhG/7NXzxLhwuUX/gfGKfWqRjvNgSiPd4WH4RxzB4RoXdR9Hp9VKTtkKsio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLVk4bvm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763058774; x=1794594774;
  h=date:from:to:cc:subject:message-id;
  bh=4/NVi5RMonaXnxy2sBUkR/7mUNDBYOaP8KCivdM/k/Q=;
  b=BLVk4bvmjKjvaJ1zyfP3yvy5HZmP+tmwB0KQmDyrRA+qLbk0l3W4PAY9
   gMzkfo3I05FkyGTpU8s/EIXjWHdqSUrYiWQFWXaIQwQpsDC6j+W85peEI
   Zz/0nFZqXe+jEGS/tV2Zpvqc1Pmg5F70Ig+dB1f+HNsmoUh7KwVxMwliV
   wnbothH8xRfAOlLnJHNdUwDux6vFDyLWzWS9mGARTx3Q+Ip4LDxHuZpD8
   1YE7s/gI8KzVXlbPDCXhkul7QCU6Xh13m28Vc/Aj9wbrPdFzmaatl9NXL
   fhrZePbxknRBX28HzFBYKwdaFQBpEBbJbBPsqOkgviohywExwog58jPKH
   g==;
X-CSE-ConnectionGUID: r+jwg9UTTQG6bW1UE0MsbA==
X-CSE-MsgGUID: G07EotRpSAKINZtge9bv1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65181098"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65181098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 10:32:53 -0800
X-CSE-ConnectionGUID: 12SdqoKoQvCDZr+4PbQlOg==
X-CSE-MsgGUID: U+uiHXaWR2migCUL7D0yKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="212969509"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 10:32:51 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJc7l-0005kF-0T;
	Thu, 13 Nov 2025 18:32:49 +0000
Date: Fri, 14 Nov 2025 02:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 57dc6a91148b6b50bebe454028ce2488d74422df
Message-ID: <202511140231.8bV9BWYW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 57dc6a91148b6b50bebe454028ce2488d74422df  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202511131819.eF8B67cM-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202511131932.czkz3HtQ-lkp@intel.com

    drivers/gpu/drm/xe/xe_device.c:997:14: error: 'gt' undeclared (first use in this function)
    drivers/gpu/drm/xe/xe_device.c:997:14: error: use of undeclared identifier 'gt'
    drivers/gpu/drm/xe/xe_device.c:997:21: error: 'gt' undeclared (first use in this function)
    drivers/gpu/drm/xe/xe_device.c:997:22: error: 'id' undeclared (first use in this function); did you mean 'fd'?
    drivers/gpu/drm/xe/xe_device.c:997:22: error: use of undeclared identifier 'id'
    drivers/gpu/drm/xe/xe_device.c:997:29: error: 'id' undeclared (first use in this function); did you mean 'fd'?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-randconfig-002-20251113
|   |-- drivers-gpu-drm-xe-xe_device.c:error:gt-undeclared-(first-use-in-this-function)
|   `-- drivers-gpu-drm-xe-xe_device.c:error:id-undeclared-(first-use-in-this-function)
|-- arm-randconfig-004-20251113
|   |-- drivers-gpu-drm-xe-xe_device.c:error:use-of-undeclared-identifier-gt
|   `-- drivers-gpu-drm-xe-xe_device.c:error:use-of-undeclared-identifier-id
`-- riscv-randconfig-002-20251113
    |-- drivers-gpu-drm-xe-xe_device.c:error:gt-undeclared-(first-use-in-this-function)
    `-- drivers-gpu-drm-xe-xe_device.c:error:id-undeclared-(first-use-in-this-function)

elapsed time: 1563m

configs tested: 54
configs skipped: 0

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251113    gcc-8.5.0
arc         randconfig-002-20251113    gcc-8.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251113    gcc-10.5.0
arm         randconfig-002-20251113    clang-22
arm         randconfig-003-20251113    clang-22
arm         randconfig-004-20251113    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251113    gcc-9.5.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251113    clang-22
hexagon     randconfig-002-20251113    clang-22
i386                    allnoconfig    gcc-14
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251113    gcc-15.1.0
loongarch   randconfig-002-20251113    clang-22
m68k                    allnoconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251113    gcc-8.5.0
nios2       randconfig-002-20251113    gcc-11.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251113    gcc-8.5.0
parisc      randconfig-002-20251113    gcc-14.3.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251113    clang-22
powerpc     randconfig-002-20251113    clang-22
powerpc64   randconfig-001-20251113    clang-22
powerpc64   randconfig-002-20251113    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251113    gcc-8.5.0
riscv       randconfig-002-20251113    gcc-11.5.0
s390                    allnoconfig    clang-22
s390        randconfig-001-20251113    clang-22
s390        randconfig-002-20251113    clang-17
sh                      allnoconfig    gcc-15.1.0
sh          randconfig-001-20251113    gcc-15.1.0
sh          randconfig-002-20251113    gcc-11.5.0
sparc                   allnoconfig    gcc-15.1.0
um                      allnoconfig    clang-22
x86_64                  allnoconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

