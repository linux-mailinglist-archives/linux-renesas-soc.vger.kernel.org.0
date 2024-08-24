Return-Path: <linux-renesas-soc+bounces-8190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C799E95DAC0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Aug 2024 04:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E325B2101D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Aug 2024 02:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D1315E8B;
	Sat, 24 Aug 2024 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEsT5ZHH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A115EEB5
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Aug 2024 02:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724468096; cv=none; b=uU6kV4Y7TIw78br4Kod9aKtr7jVbtm8boLaJhj7kpxtgY1hUhCDeqKYFrY80HQCvn35mEtKLL+3l6c+/3NW3wpluH+Ew8qdEWaEfUs3G7Dom2ajWBtjeQYRac+fXfSH5nFWEd3dMR7+ERxhEaq8l8+OdEfDl+ZzsR3l/LbF3sds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724468096; c=relaxed/simple;
	bh=GWQitdj940ylYBPh6DrsRwB5QcW3JkhDet/f7e1ZoB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ci7RpfffPbJLMne9FAQ5Z1FlgP/My+mwIOHdM6ihKgCD4KRszFc48ImborVxWMqhsw1r+OFrYwOcTGXJr7Wfa3aHAsB918Z9Fgwly9TSRjBG5E5asQTXQM4X0RP62HEwIMb7QnliJG5b/NzkkqinUWIyzz5nRKslRiLPs93/13k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEsT5ZHH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724468095; x=1756004095;
  h=date:from:to:cc:subject:message-id;
  bh=GWQitdj940ylYBPh6DrsRwB5QcW3JkhDet/f7e1ZoB0=;
  b=KEsT5ZHHMt2X3GKTVmhrxZEAZnJ4CiP/lKjkjxMWadBHuQzNroA5to7V
   EnMgdE2X9yzWQZGjT/yTWM+LeNpI3W2OIPRF3XlorbYImy0Wm3+NFzaXs
   vVDj78XLVp9zD/5UHIaZcKNY4JYxPovZHzfeBPL/ynmzm5inDMEr/vLlS
   6nmhHwW3vrXXuOnRHAEScUUt1m0YHxspCXTQS7fXQPBShvn+vmpUtd/GM
   zEzNciPGnjQ7UHYgU6E5oIW/J+U5Gbxqt6eKZ6gP4RLf01L0h7AT+8xwA
   5vcosZpmEeqT0nMfM0RpO+nE85A/wXeXeebOURIYQ2UqepGwtElPPD9nx
   g==;
X-CSE-ConnectionGUID: v7mEgnoaTjmXf8n85Hg9vw==
X-CSE-MsgGUID: 0HCaG5VsS0CP7Ah/sZmr4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23118652"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="23118652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 19:54:54 -0700
X-CSE-ConnectionGUID: G4rNNcXwRauMh9RVRkFrTQ==
X-CSE-MsgGUID: 0uP6ms5UQk26/xKTpVRuSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="66171171"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Aug 2024 19:54:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shgvS-000EDo-1q;
	Sat, 24 Aug 2024 02:54:50 +0000
Date: Sat, 24 Aug 2024 10:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 e895a806608a1f95067d27ae3870c9b4c5a236ee
Message-ID: <202408241033.TSVn5WOn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: e895a806608a1f95067d27ae3870c9b4c5a236ee  arm64: dts: renesas: r9a07g043u: Add DU node

elapsed time: 754m

configs tested: 54
configs skipped: 130

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240824   clang-18
i386         buildonly-randconfig-002-20240824   clang-18
i386         buildonly-randconfig-003-20240824   clang-18
i386         buildonly-randconfig-004-20240824   clang-18
i386         buildonly-randconfig-005-20240824   clang-18
i386         buildonly-randconfig-006-20240824   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240824   clang-18
i386                  randconfig-002-20240824   clang-18
i386                  randconfig-003-20240824   clang-18
i386                  randconfig-004-20240824   clang-18
i386                  randconfig-005-20240824   clang-18
i386                  randconfig-006-20240824   clang-18
i386                  randconfig-011-20240824   clang-18
i386                  randconfig-012-20240824   clang-18
i386                  randconfig-013-20240824   clang-18
i386                  randconfig-014-20240824   clang-18
i386                  randconfig-015-20240824   clang-18
i386                  randconfig-016-20240824   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
s390                              allnoconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
um                                allnoconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

