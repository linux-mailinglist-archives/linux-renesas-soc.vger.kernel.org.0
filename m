Return-Path: <linux-renesas-soc+bounces-24766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A25C6D770
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 09:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 9CCF22CD49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89BD32B995;
	Wed, 19 Nov 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwXYRhz4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C232AACA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541505; cv=none; b=sdgoKurTYutFIxAf3Y7DuDgzfu3Z6HFkWdgLe7nHrlwTXnoleOqJkl6onNNlg6LHjKtYQEkJOQ1YdySfC4+pJHzXdtB6XERbFOXlOvX3fIKuvAfgztXhhE5pGG1XQ82pIv8boAGE/uWioDZ6jTqXjKgPUFan1QW3mvWBS9meTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541505; c=relaxed/simple;
	bh=0x8SiKqCH7PFzt9rjCgAYxglzpAhBE4gr9Hp5kXyCGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LsQkidTgs33QKLAdZWtgSBX60bkx5f/KnjG+7/R5B1Yk1DtWQOzflj8XcMTq1NBHLRbz7rM31f1RNiP4/ic60BbpdQ5hXYRmZ3h5nHV3JOb7BNu0o+u7GtSLdg/wohAx0Qt4TeUY3LSabo+K7ygTKVub/iGqAqUONKEUjtjvSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwXYRhz4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763541503; x=1795077503;
  h=date:from:to:cc:subject:message-id;
  bh=0x8SiKqCH7PFzt9rjCgAYxglzpAhBE4gr9Hp5kXyCGA=;
  b=kwXYRhz4u+V0dG6tl265qXW+uL2NeZQZk1h0MCeB+jaw/kByqrJdx4RM
   d40Y9HcbX3Arxq+QE/RiAf1gi0QBGWVRns1PBnglN2p7cZaFGQrglREvj
   4Lef9kPEPoyqdX1aCPMfEVCQbc4tz4PfFIcDnD2egFqMY0PBthltEjN24
   NvxRE9b5Tb+x/xRzJOJUNIW4nu+OjN/UdaLsLG1LqYW3mvGL2qJ0H2oiA
   afgYMuVFHkSYFHM7nURXWEOXL0+dnuxk1GsTU9vmBGFslgp2xsdEHIVkK
   pny0IWIpaOMbT2rMZgAesXRnwF93zLB4+PAD0f9HoYiV3Ejjc0FY0YQ80
   Q==;
X-CSE-ConnectionGUID: N5IKkMYpSL6TaLea3SmbRA==
X-CSE-MsgGUID: 6ftG7NYIQ2eIxu/AFtWUvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76930713"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76930713"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 00:38:22 -0800
X-CSE-ConnectionGUID: M3E5t7HWQQaJVLoIWQ0s3Q==
X-CSE-MsgGUID: 822pxVELTXGxpNwFp7wP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191129998"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2025 00:38:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLdhh-0002cd-2X;
	Wed, 19 Nov 2025 08:38:17 +0000
Date: Wed, 19 Nov 2025 16:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.19] BUILD
 SUCCESS c432180a7d95081353a96fd6d5bd75b0fc8a27c3
Message-ID: <202511191641.kLjfLleR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.19
branch HEAD: c432180a7d95081353a96fd6d5bd75b0fc8a27c3  soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config

elapsed time: 7858m

configs tested: 71
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                allmodconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arc                allyesconfig    gcc-15.1.0
arm                allmodconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm                allyesconfig    gcc-15.1.0
arm64               allnoconfig    gcc-15.1.0
arm64              allyesconfig    clang-22
csky               allmodconfig    gcc-15.1.0
csky                allnoconfig    gcc-15.1.0
csky               allyesconfig    gcc-15.1.0
hexagon            allmodconfig    clang-17
hexagon             allnoconfig    clang-22
hexagon            allyesconfig    clang-22
i386               allmodconfig    gcc-14
i386                allnoconfig    gcc-14
i386               allyesconfig    gcc-14
loongarch          allmodconfig    clang-19
loongarch           allnoconfig    clang-22
loongarch          allyesconfig    clang-22
m68k               allmodconfig    gcc-15.1.0
m68k                allnoconfig    gcc-15.1.0
m68k               allyesconfig    gcc-15.1.0
microblaze         allmodconfig    gcc-15.1.0
microblaze          allnoconfig    gcc-15.1.0
microblaze         allyesconfig    gcc-15.1.0
mips               allmodconfig    gcc-15.1.0
mips                allnoconfig    gcc-15.1.0
mips               allyesconfig    gcc-15.1.0
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
nios2              allyesconfig    gcc-11.5.0
openrisc           allmodconfig    gcc-15.1.0
openrisc            allnoconfig    gcc-15.1.0
openrisc           allyesconfig    gcc-15.1.0
parisc             allmodconfig    gcc-15.1.0
parisc              allnoconfig    gcc-15.1.0
parisc             allyesconfig    gcc-15.1.0
powerpc            allmodconfig    gcc-15.1.0
powerpc             allnoconfig    gcc-15.1.0
powerpc            allyesconfig    clang-22
riscv              allmodconfig    clang-22
riscv               allnoconfig    gcc-15.1.0
riscv              allyesconfig    clang-16
s390                allnoconfig    clang-22
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sparc              allmodconfig    gcc-15.1.0
sparc               allnoconfig    gcc-15.1.0
sparc              allyesconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
sparc64            allyesconfig    gcc-15.1.0
um                 allmodconfig    clang-19
um                  allnoconfig    clang-22
um                 allyesconfig    gcc-14
x86_64             allmodconfig    clang-20
x86_64              allnoconfig    clang-20
x86_64             allyesconfig    clang-20
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-20
x86_64      rhel-9.4-kselftests    clang-20
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-20
xtensa              allnoconfig    gcc-15.1.0
xtensa             allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

