Return-Path: <linux-renesas-soc+bounces-32422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJbiC5dTAmpvrQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 00:09:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD75169BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 00:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 486693007A4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 22:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560EF4D8D96;
	Mon, 11 May 2026 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHhgIFCb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F08847CC6B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 22:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537362; cv=none; b=Zd9ZZDVGKdVQeemWjc+9WN5+QIhs7dXUgbDsKzmVi9Va5FbfPePsvWqjiIGrkbsM1k6DziT7jaz5PA4bmLVhfiEDxLMBnDRQ1kjcr5XHqI9EdurJiXy1bQAuQaWJ3m0ycT8uhK2H1FUAhCGH+H0SmMn2Av7n73NEq6OF8s6MX8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537362; c=relaxed/simple;
	bh=vSZnq44ml1wPPHZ48y2FxsngxwNN3UEQe/LswKRij3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gwu5y5hjwhRA8AXmfQBIacuG359nJlbDWk48CLX3GGVccGSt2RPkm9+fj8YLY90wOCHr19h4kVnsS1Zgs19atF7BXvIe9K+LOpZHT/zwxf8TDtIlF1U4ZlGhYW9lLGbPUo+2eEs5EScE4BjLR4GLpl8ADUyGYqilnw2OorLIBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHhgIFCb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778537359; x=1810073359;
  h=date:from:to:cc:subject:message-id;
  bh=vSZnq44ml1wPPHZ48y2FxsngxwNN3UEQe/LswKRij3c=;
  b=XHhgIFCbWu/9/NFMtzpuDJwTRhN49tG0lNsGBPpKCGlORT0jjQodgw7/
   Zup862d+Yvx+iq2dqFVuOSYonIsMu2wiHRTc3DokBDu//4jDA4BghT8g2
   4pRTdgFBPeWm/qQAsk19f7K29x28C9E9C7xrxDVDwSjA0jVem8jKOGg3e
   I8XcqqkBAUOOvYYI3EGd/NfBuPVt0SwlI+gzu/uwTdGd9aB8AN0KdkVhU
   +T34MMAFO/qnue0udBAE9HRJAimNK7MvVhvfe3BBCAUHv6Y/o/Yt6sP3K
   Ld6eH5f8vGusd8Bv6cXBamWMHKKD1PNBg4TpR1i+DamzYATrnWaC4i5hh
   Q==;
X-CSE-ConnectionGUID: tultwxHgTbq3sTBPkAh4sg==
X-CSE-MsgGUID: UBRbws9+RFKGwlE0EU11jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="97004171"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="97004171"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 15:09:19 -0700
X-CSE-ConnectionGUID: WCAewQ0CSYCEOk6fbTa0Xg==
X-CSE-MsgGUID: dqJ8SdMqSVWfNMcp1+jg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237807770"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 May 2026 15:09:17 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMYoM-000000001Dd-3tWE;
	Mon, 11 May 2026 22:09:14 +0000
Date: Tue, 12 May 2026 06:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v7.2] BUILD SUCCESS
 5fcbbc1fcc4fa78bb5a184caa2c32db423676577
Message-ID: <202605120647.q42MmwLL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 35AD75169BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32422-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.2
branch HEAD: 5fcbbc1fcc4fa78bb5a184caa2c32db423676577  clk: renesas: r9a08g046: Add RSPI clocks and resets

elapsed time: 731m

configs tested: 324
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260511    gcc-10.5.0
arc                   randconfig-001-20260512    gcc-11.5.0
arc                   randconfig-002-20260511    gcc-10.5.0
arc                   randconfig-002-20260512    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    clang-23
arm                   randconfig-001-20260511    gcc-10.5.0
arm                   randconfig-001-20260512    gcc-11.5.0
arm                   randconfig-002-20260511    gcc-10.5.0
arm                   randconfig-002-20260512    gcc-11.5.0
arm                   randconfig-003-20260511    gcc-10.5.0
arm                   randconfig-003-20260512    gcc-11.5.0
arm                   randconfig-004-20260511    gcc-10.5.0
arm                   randconfig-004-20260512    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260511    clang-17
arm64                 randconfig-001-20260511    clang-23
arm64                 randconfig-001-20260512    gcc-14.3.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260511    clang-17
arm64                 randconfig-002-20260511    clang-23
arm64                 randconfig-002-20260512    gcc-14.3.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260511    clang-17
arm64                 randconfig-003-20260511    clang-23
arm64                 randconfig-003-20260512    gcc-14.3.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260511    clang-17
arm64                 randconfig-004-20260511    clang-23
arm64                 randconfig-004-20260512    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260511    clang-17
csky                  randconfig-001-20260511    clang-23
csky                  randconfig-001-20260512    gcc-14.3.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260511    clang-17
csky                  randconfig-002-20260511    clang-23
csky                  randconfig-002-20260512    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260511    gcc-8.5.0
hexagon               randconfig-001-20260512    gcc-10.5.0
hexagon               randconfig-002-20260511    gcc-8.5.0
hexagon               randconfig-002-20260512    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260511    gcc-14
i386        buildonly-randconfig-001-20260512    gcc-14
i386        buildonly-randconfig-002-20260511    clang-20
i386        buildonly-randconfig-002-20260511    gcc-14
i386        buildonly-randconfig-002-20260512    gcc-14
i386        buildonly-randconfig-003-20260511    gcc-12
i386        buildonly-randconfig-003-20260511    gcc-14
i386        buildonly-randconfig-003-20260512    gcc-14
i386        buildonly-randconfig-004-20260511    clang-20
i386        buildonly-randconfig-004-20260511    gcc-14
i386        buildonly-randconfig-004-20260512    gcc-14
i386        buildonly-randconfig-005-20260511    clang-20
i386        buildonly-randconfig-005-20260511    gcc-14
i386        buildonly-randconfig-005-20260512    gcc-14
i386        buildonly-randconfig-006-20260511    gcc-14
i386        buildonly-randconfig-006-20260512    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260511    gcc-12
i386                  randconfig-002-20260511    gcc-12
i386                  randconfig-003-20260511    gcc-12
i386                  randconfig-004-20260511    gcc-12
i386                  randconfig-005-20260511    gcc-12
i386                  randconfig-006-20260511    gcc-12
i386                  randconfig-007-20260511    gcc-12
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260511    clang-20
i386                  randconfig-011-20260512    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260511    clang-20
i386                  randconfig-012-20260512    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260511    clang-20
i386                  randconfig-013-20260512    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260511    clang-20
i386                  randconfig-014-20260512    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260511    clang-20
i386                  randconfig-015-20260512    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260511    clang-20
i386                  randconfig-016-20260512    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260511    clang-20
i386                  randconfig-017-20260512    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260511    gcc-8.5.0
loongarch             randconfig-001-20260512    gcc-10.5.0
loongarch             randconfig-002-20260511    gcc-8.5.0
loongarch             randconfig-002-20260512    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-17
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260511    gcc-8.5.0
nios2                 randconfig-001-20260512    gcc-10.5.0
nios2                 randconfig-002-20260511    gcc-8.5.0
nios2                 randconfig-002-20260512    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-20
parisc                randconfig-001-20260511    clang-20
parisc                randconfig-001-20260512    gcc-12.5.0
parisc                         randconfig-002    clang-20
parisc                randconfig-002-20260511    clang-20
parisc                randconfig-002-20260512    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                        randconfig-001    clang-20
powerpc               randconfig-001-20260511    clang-20
powerpc               randconfig-001-20260512    gcc-12.5.0
powerpc                        randconfig-002    clang-20
powerpc               randconfig-002-20260511    clang-20
powerpc               randconfig-002-20260512    gcc-12.5.0
powerpc64                      randconfig-001    clang-20
powerpc64             randconfig-001-20260511    clang-20
powerpc64             randconfig-001-20260512    gcc-12.5.0
powerpc64                      randconfig-002    clang-20
powerpc64             randconfig-002-20260511    clang-20
powerpc64             randconfig-002-20260512    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-12.5.0
riscv                 randconfig-001-20260511    gcc-12.5.0
riscv                 randconfig-001-20260512    gcc-15.2.0
riscv                          randconfig-002    gcc-12.5.0
riscv                 randconfig-002-20260511    gcc-12.5.0
riscv                 randconfig-002-20260512    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-12.5.0
s390                  randconfig-001-20260511    gcc-12.5.0
s390                  randconfig-001-20260512    gcc-15.2.0
s390                           randconfig-002    gcc-12.5.0
s390                  randconfig-002-20260511    gcc-12.5.0
s390                  randconfig-002-20260512    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-12.5.0
sh                    randconfig-001-20260511    gcc-12.5.0
sh                    randconfig-001-20260512    gcc-15.2.0
sh                             randconfig-002    gcc-12.5.0
sh                    randconfig-002-20260511    gcc-12.5.0
sh                    randconfig-002-20260512    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260511    gcc-8.5.0
sparc                 randconfig-001-20260512    gcc-13.4.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260511    gcc-8.5.0
sparc                 randconfig-002-20260512    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260511    gcc-8.5.0
sparc64               randconfig-001-20260512    gcc-13.4.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260511    gcc-8.5.0
sparc64               randconfig-002-20260512    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260511    gcc-8.5.0
um                    randconfig-001-20260512    gcc-13.4.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260511    gcc-8.5.0
um                    randconfig-002-20260512    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260511    gcc-14
x86_64      buildonly-randconfig-001-20260512    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260511    gcc-14
x86_64      buildonly-randconfig-002-20260512    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260511    gcc-14
x86_64      buildonly-randconfig-003-20260512    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260511    gcc-14
x86_64      buildonly-randconfig-004-20260512    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260511    gcc-14
x86_64      buildonly-randconfig-005-20260512    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260511    gcc-14
x86_64      buildonly-randconfig-006-20260512    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260511    clang-20
x86_64                randconfig-001-20260512    gcc-14
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260511    clang-20
x86_64                randconfig-002-20260512    gcc-14
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260511    clang-20
x86_64                randconfig-003-20260512    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260511    clang-20
x86_64                randconfig-004-20260512    gcc-14
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260511    clang-20
x86_64                randconfig-005-20260512    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260511    clang-20
x86_64                randconfig-006-20260512    gcc-14
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260511    clang-20
x86_64                randconfig-011-20260512    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260511    clang-20
x86_64                randconfig-012-20260512    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260511    clang-20
x86_64                randconfig-013-20260512    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260511    clang-20
x86_64                randconfig-014-20260512    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260511    clang-20
x86_64                randconfig-015-20260512    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260511    clang-20
x86_64                randconfig-016-20260512    clang-20
x86_64                randconfig-071-20260511    clang-20
x86_64                randconfig-071-20260512    clang-20
x86_64                randconfig-072-20260511    clang-20
x86_64                randconfig-072-20260512    clang-20
x86_64                randconfig-073-20260511    clang-20
x86_64                randconfig-073-20260512    clang-20
x86_64                randconfig-074-20260511    clang-20
x86_64                randconfig-074-20260512    clang-20
x86_64                randconfig-075-20260511    clang-20
x86_64                randconfig-075-20260512    clang-20
x86_64                randconfig-076-20260511    clang-20
x86_64                randconfig-076-20260512    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260511    gcc-8.5.0
xtensa                randconfig-001-20260512    gcc-13.4.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260511    gcc-8.5.0
xtensa                randconfig-002-20260512    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

