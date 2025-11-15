Return-Path: <linux-renesas-soc+bounces-24672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE2C60490
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 13:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3578E4E1118
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 12:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7337027B50C;
	Sat, 15 Nov 2025 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kggpQMRB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625C209F43
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Nov 2025 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763208602; cv=none; b=jmJPL0pCDisFbfyI6zDscUsO2MAINOxs8bWISXcnbIqdHCQu/mm7EHxOeMLrmtv1EKk7hv7mi8/lk2vDcsQDaju5aO+YVBUfhz2LSWui/lg63e/nhoLRcE4E5MqJL/KZK9EHONQvkKrPpABTPD0KzQbVwlXUFNVNAA2GdlRhg5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763208602; c=relaxed/simple;
	bh=l+NF7UpzxJX/m1gJsImgYKCDwhm1lMf1+jAZAGM4D0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DqEPd1pd5Xi7mOO5MXRpee4czU+peIP9PLxOQ2FpK0AGkuf+RIHvfkjHgkzIIi+X2C+MMsEe6BecB43GbhCi8PnvDd58aa3TkdXqWxHEgFEakQN1idGzr8v/dJeAiMb8dqYqF2dCKswFlRJ2xTSe0zy9PWKdbfKPV5qNysn0KVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kggpQMRB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763208601; x=1794744601;
  h=date:from:to:cc:subject:message-id;
  bh=l+NF7UpzxJX/m1gJsImgYKCDwhm1lMf1+jAZAGM4D0M=;
  b=kggpQMRBXpaNkUpbaPDzJMXN9+9bWO7S1/qjxqNeOgNesxvYtFw4YF3S
   kxoyyvwAwYI8pRax5Y7TQOtF0Y6RS7TWoL9c/QlHv5fVf7DVAOWcTQAQX
   5gi67XrfrNvHsEUWmGcYYn4cyoaBLOOUSO43AoYEEZiVXwaNJIvYFBDdK
   Dh6yhZVd4VSQSINWVlyaXNC5SeE9S87VnkjkAnAbGxwDq3kEBSLlllUZn
   U8a1KA/ok5CEDSzRpnKSgA28RNs0EmkOCOo5bxHH846+wZPJjfFmVTr3t
   beE+R9LhUETYVLLzO5YSdYNeROHwWui2m12o/xnU1Ax0RtR9nI2oS8fK0
   A==;
X-CSE-ConnectionGUID: XKtSiDN8S8+SPECNgufzcQ==
X-CSE-MsgGUID: DfF6eDC0S8OOjLTJWlFilg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75883944"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="75883944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 04:10:00 -0800
X-CSE-ConnectionGUID: BXFKtM9gTtWR94GQJNDbLA==
X-CSE-MsgGUID: Wd3fKQNzSWycrsb15/36iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="190469082"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2025 04:09:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKF6K-0007wm-2U;
	Sat, 15 Nov 2025 12:09:56 +0000
Date: Sat, 15 Nov 2025 20:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r8a779a0-dt-binding-defs]
 BUILD SUCCESS 1de3d9e2cd3a3c6f503cd31ec1f552c9dd8cf8ca
Message-ID: <202511152030.Vc861zJn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r8a779a0-dt-binding-defs
branch HEAD: 1de3d9e2cd3a3c6f503cd31ec1f552c9dd8cf8ca  dt-bindings: clock: r8a779a0: Add ZG core clock

elapsed time: 7282m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251111    gcc-11.5.0
arm                    allmodconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                   allyesconfig    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251110    clang-22
hexagon     randconfig-002-20251110    clang-22
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251110    clang-22
loongarch   randconfig-002-20251110    clang-22
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                  allyesconfig    gcc-11.5.0
nios2       randconfig-001-20251110    gcc-11.5.0
nios2       randconfig-002-20251110    gcc-10.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251111    gcc-9.5.0
parisc      randconfig-002-20251111    gcc-8.5.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251111    gcc-8.5.0
powerpc     randconfig-002-20251111    clang-22
powerpc64   randconfig-002-20251111    gcc-12.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251110    clang-22
riscv       randconfig-002-20251110    gcc-8.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251110    gcc-8.5.0
s390        randconfig-002-20251110    gcc-8.5.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251110    gcc-15.1.0
sh          randconfig-002-20251110    gcc-15.1.0
sparc                  allmodconfig    gcc-15.1.0
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
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

