Return-Path: <linux-renesas-soc+bounces-10187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3899B400C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 03:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72C922834C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 02:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C1B31A89;
	Tue, 29 Oct 2024 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gjg8NOcL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F5720DF4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Oct 2024 02:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730167241; cv=none; b=Ox3hrpbaZptQxbdqvaPEH0KWbJ8Akf6dEIAgS8Io+5o5R2WjfRPQgOD0kzEfN8pCSqAGLlZC7q4RUx74SCC6l6uEQ+ez44YRUjhmUNpTuEnx9goiPyM1tKYmsBKi9hugSoW4/HOHaE7FMb2nP0sMHcJXvLq8eb8iT3T7zkR8Z7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730167241; c=relaxed/simple;
	bh=+Lqh0x1kI/a9Bqed/Yq763vY9AOzjuo22xxdxEohXzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qbSFg5ETenZR9oWItyn1NHiLlYRERSHt+HUkWS6nce7A8KTcAWCVqqrsaKISC8gXOfv+8+sGFFsWUy4YH8KkOgsDpJwA36AB5DwdtNViXy481QJ+sNZPaC/iasTZ3dPsEgVuVHk8cqX7Vernx06oL/E8Q2Jol4t9009P2vqNMz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gjg8NOcL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730167239; x=1761703239;
  h=date:from:to:cc:subject:message-id;
  bh=+Lqh0x1kI/a9Bqed/Yq763vY9AOzjuo22xxdxEohXzw=;
  b=Gjg8NOcLuvrJhKQ42ZwcFrli1bU4QqUKY0tE7hE/DyFRqrAQ4XtsN24F
   EoYW8nQb5oqhJqaN+D04IFC3zf8yo/1HESl/UVA9+QkuVnCXxCUPhI1Bu
   gXk4b6djNrhmp16TZH9bXsCkzFjULtOrQ5FCS0tIUOQiOVbYh3kjRxNTF
   MdLVuK6IUMrDCDH5iZkLLei3Sa086/a9HaDeO9rtPBwjSd7rt3YaNRYRg
   Bmr6qrCCL82v7Qejj9q2wrcuy+JEHwMUyJQsxSUyFdRCAFcbrnYyW9bj1
   pJhCrckQpu3xjgPDFlHNagfcO84J+GxKxcc+5+pr16aGUjwt69xvxzBZj
   w==;
X-CSE-ConnectionGUID: 7Sx0dVNjQXuRnlGY4DwlPg==
X-CSE-MsgGUID: uMbK1YVcRVSIdUWr2y33EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29752394"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29752394"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 19:00:39 -0700
X-CSE-ConnectionGUID: vFjt9YZvRf67mfJr7/19bA==
X-CSE-MsgGUID: iw3JfCxpRiipue2EoE/WmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="119259987"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2024 19:00:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5bX9-000d8c-0e;
	Tue, 29 Oct 2024 02:00:35 +0000
Date: Tue, 29 Oct 2024 10:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 839b15a022b051d2c14df7c41b571dc68cecc74b
Message-ID: <202410290956.0tRfhQ8l-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 839b15a022b051d2c14df7c41b571dc68cecc74b  Merge branch 'renesas-dts-for-v6.13' into renesas-next

elapsed time: 884m

configs tested: 46
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.1.0
arc                     allnoconfig    gcc-14.1.0
arm                    allmodconfig    gcc-14.1.0
arm                     allnoconfig    clang-20
arm                     allnoconfig    gcc-14.1.0
arm                    allyesconfig    gcc-14.1.0
arm         randconfig-001-20241029    gcc-14.1.0
arm         randconfig-002-20241029    gcc-14.1.0
arm         randconfig-003-20241029    gcc-14.1.0
arm         randconfig-004-20241029    clang-16
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.1.0
arm64       randconfig-001-20241029    clang-17
arm64       randconfig-002-20241029    clang-20
arm64       randconfig-003-20241029    gcc-14.1.0
arm64       randconfig-004-20241029    clang-20
csky                    allnoconfig    gcc-14.1.0
hexagon                 allnoconfig    gcc-14.1.0
loongarch               allnoconfig    gcc-14.1.0
m68k                    allnoconfig    gcc-14.1.0
microblaze              allnoconfig    gcc-14.1.0
mips                    allnoconfig    gcc-14.1.0
nios2                   allnoconfig    gcc-14.1.0
openrisc                  defconfig    gcc-12
parisc                    defconfig    gcc-12
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.1.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    gcc-12
riscv       randconfig-001-20241029    clang-20
riscv       randconfig-002-20241029    gcc-14.1.0
s390                   allmodconfig    gcc-14.1.0
s390                   allyesconfig    gcc-14.1.0
s390                      defconfig    gcc-12
sh                     allmodconfig    gcc-14.1.0
sh                      allnoconfig    gcc-14.1.0
sh                     allyesconfig    gcc-14.1.0
sh                        defconfig    gcc-12
sparc                  allmodconfig    gcc-14.1.0
sparc64                   defconfig    gcc-12
um                        defconfig    gcc-12
um                   i386_defconfig    gcc-12
um                 x86_64_defconfig    gcc-12
x86_64                        kexec    gcc-12
x86_64                     rhel-8.3    gcc-12
xtensa                  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

