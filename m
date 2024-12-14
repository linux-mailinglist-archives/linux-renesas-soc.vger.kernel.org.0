Return-Path: <linux-renesas-soc+bounces-11338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46819F1E40
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 12:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBBF516160F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 11:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F0B16F0E8;
	Sat, 14 Dec 2024 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKMmECZO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270626AC3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734175945; cv=none; b=pFHJogW6ZL9ukgiFo/Y8PGBaorq1kNnWD0Bs6ZW38BTW7w9MLCFWYspR9H45kHqQcrL0sng61U22YwHZ963f5RvmQv/4asU6oAuSb+a/2rR1KiE61nbA57CZte/1vPdsaZRE/Vk2YDT9rDDHWsHCND1IMDwNexsFAkb80+r6PgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734175945; c=relaxed/simple;
	bh=UldVGhCMuV6hUJ1tYSsEDZXsK26lLkDe8JMe21+qgfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rlZllVbDgVaxPm2mfnML/RDlCDRZaxwOBPPyauUFK+I1RBSYoD/E6UBxw9go35FIcreatESh1ERK7+7GRNXHoYeY8AsrLt/OOr118ftw3/ToYtHm5H5SzfJ3cb9twu+P2pxVSToPNiOPIEvLXUsfUTODo8F4rhwhknUKOXeqhok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKMmECZO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734175944; x=1765711944;
  h=date:from:to:cc:subject:message-id;
  bh=UldVGhCMuV6hUJ1tYSsEDZXsK26lLkDe8JMe21+qgfc=;
  b=FKMmECZO3jFXcCBwtp9DaXidahRMR2UElJZJHnZC3Nr2OnowGlVTtMuN
   Rqm/TFVxS3fD5dF2lFjXAQbQuV0mwOhsN/m6z5MtN0h8t2BvF+s/FzL7r
   v4HOJwh3g5gS//ZYbzQ+XJf07xAuhmTRD2H5YsmncLM/Mo1llsYYh+wOF
   N0+HMVUAW30jtCfzMyWtTBNRL0vnl15b1NTwQ9Et53CxEnlLDpPoGht7Y
   ZtsBbLbY/aD4C6iDpAkZ/GBv6xVAujp0mgImkKILh3oSmnT5mh7xLmFzb
   6kFf1Cw0M9ckPWMqyiSZV0YdrOCdo4ONwHfnsMT356D1DcChYo6f8ck83
   g==;
X-CSE-ConnectionGUID: Vyy+edoUS3ms+76zJZQOZQ==
X-CSE-MsgGUID: +x88TffxQnq6CGjCTSeUJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34769454"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34769454"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 03:32:23 -0800
X-CSE-ConnectionGUID: 2Lj9Ol0+QcORgV6x9UNk1g==
X-CSE-MsgGUID: 95W1CihPQwSfk7BzKnTq/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="127583534"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2024 03:32:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMQNg-000CsR-1k;
	Sat, 14 Dec 2024 11:32:20 +0000
Date: Sat, 14 Dec 2024 19:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 845de9b5beaa41d9a3ce336ba1d5f098267cde3d
Message-ID: <202412141957.W9y7Jt7T-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 845de9b5beaa41d9a3ce336ba1d5f098267cde3d  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1448m

configs tested: 56
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241214    gcc-14.2.0
csky                 randconfig-002-20241214    gcc-14.2.0
hexagon              randconfig-001-20241214    clang-20
hexagon              randconfig-002-20241214    clang-14
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241214    gcc-14.2.0
loongarch            randconfig-002-20241214    gcc-14.2.0
nios2                randconfig-001-20241214    gcc-14.2.0
nios2                randconfig-002-20241214    gcc-14.2.0
parisc               randconfig-001-20241214    gcc-14.2.0
parisc               randconfig-002-20241214    gcc-14.2.0
powerpc              randconfig-001-20241214    clang-20
powerpc              randconfig-002-20241214    clang-15
powerpc              randconfig-003-20241214    clang-20
powerpc64            randconfig-001-20241214    gcc-14.2.0
powerpc64            randconfig-003-20241214    clang-20
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64     buildonly-randconfig-001-20241214    gcc-11
x86_64     buildonly-randconfig-002-20241214    clang-19
x86_64     buildonly-randconfig-003-20241214    gcc-12
x86_64     buildonly-randconfig-004-20241214    gcc-12
x86_64     buildonly-randconfig-005-20241214    gcc-12
x86_64     buildonly-randconfig-006-20241214    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

