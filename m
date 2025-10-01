Return-Path: <linux-renesas-soc+bounces-22498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21206BAF840
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 09:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A7A1C17FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 07:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27425275AF5;
	Wed,  1 Oct 2025 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAeC/uea"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727FB22B594
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759305397; cv=none; b=ncuJ0/2g5fL/IC8/f9rlVPeOCZVcMHGqzALT6JxPJ7sauY5pSKJ0EHKU82F9pUl6aHTIkDs5Yn3LJA2+MGQIF6QT9+JOWAvj5+tb8fzLxMED7WIV3clAl3ktodLt7S64qKD8UM1L60kbIWF9a5qiGHr4O4wk4IKcK9haF0kQ3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759305397; c=relaxed/simple;
	bh=L84YqXDPKDZXC54HdulD7ytBkcIFcjaXs2XJIyZcrkI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d9Utv6zxFK6tr5tZiHYuoZiHQQppG3F+/Jm6a2n98xWvNIBdJl0eorltpMPJ1oNSOYDzyCOWj1NKzah8h2rN5XiYb9pOPbKUmr7eoorOATe2NlHcUtMgZpkVnGV++5cOk99TvgMp94UznQZb66P9by5ITkFFeKlJd141S0Zjcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAeC/uea; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759305395; x=1790841395;
  h=date:from:to:cc:subject:message-id;
  bh=L84YqXDPKDZXC54HdulD7ytBkcIFcjaXs2XJIyZcrkI=;
  b=NAeC/ueaIUwoH+afMJ3Ik5dzOlLrCOf5DqzSR70Sgc6i38fAWMwpXywa
   paFBlCOa72/fSrG/VgNQzqQ98VBjtPTEyTYoMu0z62z+4K3BSazOfMCeI
   yNk9rT6TXbACds+jHi7GRjSW5UpZLh9RWK1DMYY6HS0Ll8UJ6fR8fUnFd
   s/pbVmkAQ1Bq2GJIkFD81yzY8hMju9OneGHwFFC8hte72cK0V053E3cOD
   stvKSEj5jK9mp039Dtl4O8u7jwfkk4xAVGlZxGGghQ0KQJvAo3VugkvMr
   rHaCHwHp3rs1Niz92lQumRDMx3LeGKNr8hfmC2MtrSsakS80DasqhZznn
   A==;
X-CSE-ConnectionGUID: hdkZlzZPRYOCyEu+SiBZEA==
X-CSE-MsgGUID: 2DSAoQD9Q+KnTlfeBntHSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79222933"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="79222933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 00:56:34 -0700
X-CSE-ConnectionGUID: ViXyjZ3oQz+dyn7ird8ISA==
X-CSE-MsgGUID: vDyBf/p0QVqtrSpnyCuu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="183912642"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Oct 2025 00:56:34 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3rhO-0002nn-0r;
	Wed, 01 Oct 2025 07:56:30 +0000
Date: Wed, 01 Oct 2025 15:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a78000-v6] BUILD SUCCESS
 05ae8d94ee7454f26a256d75d82fd9f35f3ec987
Message-ID: <202510011525.W6Y2XEla-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a78000-v6
branch HEAD: 05ae8d94ee7454f26a256d75d82fd9f35f3ec987  arm64: dts: renesas: R8A78000: Add initial Ironhide support

elapsed time: 883m

configs tested: 29
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251001    clang-22
arm64                 randconfig-002-20251001    gcc-9.5.0
arm64                 randconfig-003-20251001    gcc-8.5.0
arm64                 randconfig-004-20251001    gcc-8.5.0
i386        buildonly-randconfig-001-20251001    clang-20
i386        buildonly-randconfig-002-20251001    clang-20
i386        buildonly-randconfig-003-20251001    clang-20
i386        buildonly-randconfig-004-20251001    clang-20
i386        buildonly-randconfig-005-20251001    clang-20
i386        buildonly-randconfig-006-20251001    clang-20
microblaze                          defconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
riscv                             allnoconfig    clang-22
s390                              allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
um                                allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20251001    clang-20
x86_64      buildonly-randconfig-002-20251001    clang-20
x86_64      buildonly-randconfig-003-20251001    clang-20
x86_64      buildonly-randconfig-004-20251001    clang-20
x86_64      buildonly-randconfig-005-20251001    clang-20
x86_64      buildonly-randconfig-006-20251001    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

