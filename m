Return-Path: <linux-renesas-soc+bounces-9309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C2B98D10F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 12:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8490B21936
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 10:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60793234;
	Wed,  2 Oct 2024 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4mT8P1Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8712F56
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Oct 2024 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727864474; cv=none; b=BG1y8YPNHdPga9iBWMaNtOLSgeKUhXI1Wo1723xVgq+I8SgEgwceYipgncM4SWSZMiQ6+80tn1tqgs57KWGYYBMz+lQfNxormrEmGyMU/ojqiLEaVityCXpVPY7v48HFs0K2ryRQROoJedTf7j9C4xSE2cG/lN15m2ql8Qwa9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727864474; c=relaxed/simple;
	bh=Pd82H9r915AjLLd8TdTUJ9L6CxiBe9CVYVOJ0T8WXOU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iu72LA7scLigAKPUn435NmJHYIn7B68EHeQZjP5TFFK1OXknRvZ3afOW5sahrqsNq4b9bqdCW8HMyFQtjv8P6egZnJQurggI8ORWX4GRGX4J9wYTmJ2nGXAzKTAlVlM2xjNcmwEb1C9dzW+fjOkHMAy/yvP/m6wbKMmKsSRvpic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4mT8P1Y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727864474; x=1759400474;
  h=date:from:to:cc:subject:message-id;
  bh=Pd82H9r915AjLLd8TdTUJ9L6CxiBe9CVYVOJ0T8WXOU=;
  b=h4mT8P1Y+SP/NUW0vPRteXbysnuThxL71q8AB39A3qJMiRG2uGn3mjX/
   /Jk0iDZNMLhyWN8KtAijvwXipPQL8Mfmr76PKA93HiXtJPcpdxoxW1BD8
   NJZhEKfUj6/qK1PJ3AfV5NF1tkB5ZLA12RRI6kXS3nJTP7FXUNLXhpFs5
   BcQngAUyiNwwNy98QRt+csYEV3KJwWQceW56mxHMjp/tYNZBfCzhUIQgx
   EMzWUPw0XcpgLTTiR7ufzhFCRsxrpgy+mUd5m71xPWTkDZOoSjgRF5dhZ
   HFXQbSLXwS6GyML+bS5R+XODvooduCeUPlmGym9v6tFPyG0qi54H0FVEP
   A==;
X-CSE-ConnectionGUID: ArQ90TBAQ7GLuQqheIBfMQ==
X-CSE-MsgGUID: JSTW8zrXTpKVOTGUAJvA8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49544720"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="49544720"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:21:13 -0700
X-CSE-ConnectionGUID: i/UnknZQTOuhv6RXY2tbYw==
X-CSE-MsgGUID: JZjFLrO/Svui7mLkkWqfDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74196738"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 03:21:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svwTl-000Rv1-0c;
	Wed, 02 Oct 2024 10:21:09 +0000
Date: Wed, 02 Oct 2024 18:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 b5819d09a365e7c33a6d0198323bee7332c6cd76
Message-ID: <202410021837.OIA4calt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: b5819d09a365e7c33a6d0198323bee7332c6cd76  Merge branch 'renesas-dts-for-v6.13' into renesas-next

elapsed time: 1268m

configs tested: 48
configs skipped: 137

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.1.0
arc                     allnoconfig    gcc-14.1.0
arm                    allmodconfig    gcc-14.1.0
arm                     allnoconfig    clang-20
arm                     allnoconfig    gcc-14.1.0
arm                    allyesconfig    gcc-14.1.0
arm         randconfig-001-20241002    gcc-14.1.0
arm         randconfig-002-20241002    clang-20
arm         randconfig-003-20241002    clang-14
arm         randconfig-004-20241002    gcc-14.1.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.1.0
arm64       randconfig-001-20241002    clang-20
arm64       randconfig-002-20241002    clang-20
arm64       randconfig-003-20241002    gcc-14.1.0
arm64       randconfig-004-20241002    gcc-14.1.0
csky                    allnoconfig    gcc-14.1.0
hexagon                 allnoconfig    gcc-14.1.0
i386                   allmodconfig    clang-18
i386                    allnoconfig    clang-18
i386                   allyesconfig    clang-18
i386                      defconfig    clang-18
loongarch               allnoconfig    gcc-14.1.0
m68k                    allnoconfig    gcc-14.1.0
microblaze              allnoconfig    gcc-14.1.0
mips                    allnoconfig    gcc-14.1.0
nios2                   allnoconfig    gcc-14.1.0
openrisc                allnoconfig    clang-20
openrisc                  defconfig    gcc-12
parisc                  allnoconfig    clang-20
parisc                    defconfig    gcc-12
powerpc                 allnoconfig    clang-20
riscv                   allnoconfig    clang-20
riscv                     defconfig    gcc-12
s390                    allnoconfig    clang-20
s390                      defconfig    gcc-12
sh                      allnoconfig    gcc-14.1.0
sh                        defconfig    gcc-12
sparc64                   defconfig    gcc-12
um                      allnoconfig    clang-20
um                        defconfig    gcc-12
um                   i386_defconfig    gcc-12
um                 x86_64_defconfig    gcc-12
x86_64                  allnoconfig    clang-18
x86_64                 allyesconfig    clang-18
x86_64                    defconfig    clang-18
x86_64                rhel-8.3-rust    clang-18
xtensa                  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

