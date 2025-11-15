Return-Path: <linux-renesas-soc+bounces-24671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716AC6033B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 11:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59583B9FD9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 10:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7114F25F79A;
	Sat, 15 Nov 2025 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCoR09zj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638B625A2C9
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Nov 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763202412; cv=none; b=t50qLhiOCmtBQ+Ycql09JXfavWDsymyexZayn+elcA8+aQ0l5zmhkWER/uu+iPa8OqD0BHwJEfUKUcKSFfQ7mKzIp113ryriSGXL5vzRtZQ+nAzQ6Eqp2Xfh9x0cvpjwqoJx9qZNW4/iAukLvby9n9qumhF4UUS99Dv1tPnLiik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763202412; c=relaxed/simple;
	bh=GwUxMKhbpDcwHYn1MBU4BLHE2BGP9XHobpmzVluLbU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OG3kUuBtlm1+fKO9mkb0DFmRQtm581CI74J1zP6vbi8ISUVUCnDV7xhUUvdgfgltjSIGW22+KGPUgvQXlJ/jQVyFmtzZbeXPbT4h9BUr8D1+ldkBkf2CLQWG2YjWjH+mqeCAs3k0TjmqUDKhAxFK0gJqcy4a1Tpqoq3k3nqawyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCoR09zj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763202410; x=1794738410;
  h=date:from:to:cc:subject:message-id;
  bh=GwUxMKhbpDcwHYn1MBU4BLHE2BGP9XHobpmzVluLbU4=;
  b=iCoR09zjpzlbdPtCCNE/MOnWX6xGO7YnjOVpD0/uPw+cSx8XSPATpydD
   O1cz3mqpVzTRPvznewAsk9J702lhVFql7k12Djx8gdTYEpPkZZZ/TBhvp
   gp8Oe/AfNEth/h50PfX06HXwJgzf0wpE45OAUmNEnw1VY/i4FuZp3Dctb
   X6yjAJbeLTuJkqFhi9GyszhJdMb3bfO82q+zgT8uH4jcEwns/HF3JJb1j
   KQiiqzyThnXOCoHXp2w1T/jkh79OvMXgkCGeUPcUtEx+qsXyKd0EyJQ21
   086ooYUPVyG9jjS8AFSJywkc2syP+GWh9maCQr1LwrmWMiQyqT+ZMjZU+
   Q==;
X-CSE-ConnectionGUID: r4y0gwV1RA2t8w3p0nX+XA==
X-CSE-MsgGUID: DORtoXj3QSClIBk6qAYyQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="69146788"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="69146788"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 02:26:49 -0800
X-CSE-ConnectionGUID: kAARdbAFQtS9ZPJHEt/FRQ==
X-CSE-MsgGUID: IGI135X6SlesYisaIuvQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190456648"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2025 02:26:49 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKDUU-0007sx-2F;
	Sat, 15 Nov 2025 10:26:46 +0000
Date: Sat, 15 Nov 2025 18:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c4f1861899bbe4a147904c1606a614c22f4881cd
Message-ID: <202511151845.BwO6ajKI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c4f1861899bbe4a147904c1606a614c22f4881cd  Merge branch 'renesas-next' into renesas-devel

elapsed time: 2206m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251114    gcc-8.5.0
arc                   randconfig-002-20251114    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                       imx_v4_v5_defconfig    clang-22
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20251114    gcc-15.1.0
arm                   randconfig-002-20251114    gcc-14.3.0
arm                   randconfig-003-20251114    clang-22
arm                   randconfig-004-20251114    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251115    gcc-8.5.0
arm64                 randconfig-002-20251115    clang-18
arm64                 randconfig-003-20251115    gcc-13.4.0
arm64                 randconfig-004-20251115    gcc-8.5.0
csky                             alldefconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251115    gcc-15.1.0
csky                  randconfig-002-20251115    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251115    clang-16
hexagon               randconfig-002-20251115    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251115    gcc-14
i386        buildonly-randconfig-002-20251115    gcc-14
i386        buildonly-randconfig-003-20251115    clang-20
i386        buildonly-randconfig-004-20251115    clang-20
i386        buildonly-randconfig-005-20251115    clang-20
i386        buildonly-randconfig-006-20251115    clang-20
i386                  randconfig-001-20251115    gcc-14
i386                  randconfig-002-20251115    clang-20
i386                  randconfig-003-20251115    clang-20
i386                  randconfig-004-20251115    clang-20
i386                  randconfig-005-20251115    gcc-14
i386                  randconfig-006-20251115    gcc-14
i386                  randconfig-007-20251115    gcc-14
i386                  randconfig-011-20251115    clang-20
i386                  randconfig-012-20251115    gcc-14
i386                  randconfig-013-20251115    gcc-14
i386                  randconfig-014-20251115    clang-20
i386                  randconfig-015-20251115    clang-20
i386                  randconfig-016-20251115    clang-20
i386                  randconfig-017-20251115    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251115    clang-18
loongarch             randconfig-002-20251115    gcc-13.4.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251115    gcc-8.5.0
nios2                 randconfig-002-20251115    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251114    gcc-12.5.0
parisc                randconfig-002-20251114    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-22
powerpc                 linkstation_defconfig    clang-20
powerpc               randconfig-001-20251114    clang-17
powerpc               randconfig-002-20251114    clang-22
powerpc64             randconfig-001-20251114    gcc-8.5.0
powerpc64             randconfig-002-20251114    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-002-20251114    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-002-20251114    gcc-11.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                           se7712_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251115    gcc-13.4.0
sparc                 randconfig-002-20251115    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251115    gcc-9.5.0
sparc64               randconfig-002-20251115    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251115    gcc-14
um                    randconfig-002-20251115    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251115    gcc-14
x86_64      buildonly-randconfig-002-20251115    gcc-12
x86_64      buildonly-randconfig-003-20251115    gcc-14
x86_64      buildonly-randconfig-004-20251115    gcc-14
x86_64      buildonly-randconfig-005-20251115    gcc-12
x86_64      buildonly-randconfig-006-20251115    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251115    gcc-14
x86_64                randconfig-072-20251115    clang-20
x86_64                randconfig-073-20251115    gcc-14
x86_64                randconfig-074-20251115    clang-20
x86_64                randconfig-075-20251115    clang-20
x86_64                randconfig-076-20251115    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251115    gcc-8.5.0
xtensa                randconfig-002-20251115    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

