Return-Path: <linux-renesas-soc+bounces-24776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B84EBC6E028
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 11:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 358714E046B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCEF328B7F;
	Wed, 19 Nov 2025 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4PNyzSX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564542E3397
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548175; cv=none; b=a9Ix7EjzT0Q3g87UFxi1Das1aNh93XbSjJZjXabE7S/93byi2gVocenkXOYHWreCZeakCuUVuHWc+nVbF7pu0+UBmbFia8Nua8k9el9JmbqSDqwF84OGr7G+10Vto6ujxFXPjPK6RYOLCIxuFPs9+oU63IiFSlFF9qe4Aai/uCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548175; c=relaxed/simple;
	bh=J72Vgm7whYau5GeRHZtNd2SMbahNKRYnKMpwv6AV87E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LQSpYIQY0etKwFbfdv2DoMd4SWrIZuQJjp1gAs7WZvayQmWoetbh9hW6bZa1vK+hglMZcfE2AJFMxTAxrXyzazr2pKOqSidhPhz8thwX5NtwTJeN9U1Je4e9egh2VS9hnnod+k2Xa6o4SYHoVEmitfhpyI/Wh8zUd4g7PJKbIgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4PNyzSX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763548174; x=1795084174;
  h=date:from:to:cc:subject:message-id;
  bh=J72Vgm7whYau5GeRHZtNd2SMbahNKRYnKMpwv6AV87E=;
  b=m4PNyzSXqf2n42nHImDa24AH0ptdg1Z7kQwCrRJIB++2v69DzqCahMQv
   tmy/XBIHOWcpmJ6H91toqoPO4yDQb2D310Lqz7WyLDHSuFw6rbuBdBdFF
   aNDcsrEcp8pE0Nz7TOlcYtL4+cRPsiKLIOTmAJ2lr1PZDKJkdLQJJ+dKN
   9LxgkcXP6P9F1jNbe1KDVhmgV6u2ZRpm0OdSG2kF4TgHvkr/52tfrA5BU
   Ub/tleUhGnLhl6l3/Isx1UNKzAsGbbiJOJfJiGgKb4TW6NMtf7KElM2fR
   qqVnsotBdAr7gCc7UVUYuTPn/CNgvNTSIpNc6zY1/Q1xR+6UOOH6oCOdy
   A==;
X-CSE-ConnectionGUID: myQ1hbJYSiy4uNaa42yeGA==
X-CSE-MsgGUID: sBmQBl9PSZyxcChGGx8rhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76264862"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76264862"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:29:34 -0800
X-CSE-ConnectionGUID: lvdSJBZ+Q66EBdmOlsnCkA==
X-CSE-MsgGUID: 4+B9XSHlRXKUJjkjGlaQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191151378"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2025 02:29:33 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLfRK-0002lN-1L;
	Wed, 19 Nov 2025 10:29:30 +0000
Date: Wed, 19 Nov 2025 18:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 fbec5d4783d5f16684bdc3ad84876cdcc75ed231
Message-ID: <202511191847.s9P29rGz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: fbec5d4783d5f16684bdc3ad84876cdcc75ed231  Merge branches 'renesas-drivers-for-v6.19' and 'renesas-dts-for-v6.19' into renesas-next

elapsed time: 7969m

configs tested: 72
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                allmodconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arc                allyesconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm                allyesconfig    gcc-15.1.0
arm64              allmodconfig    clang-19
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
s390               allmodconfig    clang-18
s390                allnoconfig    clang-22
s390               allyesconfig    gcc-15.1.0
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sparc              allmodconfig    gcc-15.1.0
sparc               allnoconfig    gcc-15.1.0
sparc              allyesconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
sparc64            allyesconfig    gcc-15.1.0
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

