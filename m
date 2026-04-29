Return-Path: <linux-renesas-soc+bounces-31766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE/HKuBa8mlYqAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 21:24:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09717499BC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 21:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810FB306B88C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA80B37D131;
	Wed, 29 Apr 2026 19:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMlLhWaf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88B31F990
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 19:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490386; cv=none; b=J3yYdtpvbPJ0bhS/cG/obasy7kwmnKBwLGg1VCwqnI2gkqiXqxRLKyxVJ62QtxZeE7SjPLskMfjnGwivwnryFEkcofInFGG2n1VIAPI5UIo04uvcXMt5lOtqGgFN7MG7n1PycRUAuONPh452jaSDYul6jSmUBPHOBoYf+IU/mGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490386; c=relaxed/simple;
	bh=bj63JSqbRrkWaCPwSv+QK3cDB7Q6zz133AhjRdti4MY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YPZCOq2MajwS7YTe+5xsWHM8krqleaBifRYYwbZNCwueAqmqOdBgzEeoKyzoxrp0+WKkgWlJJnw0zAWc4lHPNyPQzYDlTezNXxc1sppPrBXdD2frZUXOApQAxNc53ZDx/TuQAXfHxoWb7pFN0VAnhUTU+d6uBip/d4ksJjt46eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMlLhWaf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777490383; x=1809026383;
  h=date:from:to:cc:subject:message-id;
  bh=bj63JSqbRrkWaCPwSv+QK3cDB7Q6zz133AhjRdti4MY=;
  b=KMlLhWafcNPajVWsN3fRooxJNHRUrLSlDrdi7ZgDs2xgfQ60robNlnf/
   qNsVJMoSjPcwgMrso8ZH60kjA6FTgGOsT76nIJ/VbxXaSEFgfm7nndWhN
   MyTkL4MPAy8Uryoh8WkDOTkLZuq/ix84qcPJLVNLKtTh00IKxwYZDw6uX
   UODWwX3Sjl4id43gGpuGraoanKUhvguNxr2x3kOhe3czqimmKRyDcGYno
   ntgPmX5613jmVlsa7dOk6ptW6awYOInBxaZCCi5clqnYz3alXO960HNqa
   pNIAhivnWRSuI0PpEfUx0065S7gjZevJZYkRLg458Go6kCfHTdtd3rZ9e
   g==;
X-CSE-ConnectionGUID: Q9xPQ97QSkWAXkuD9JAzfQ==
X-CSE-MsgGUID: LzjrV834TNSQiZc1Pp/UNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65960953"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="65960953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:19:42 -0700
X-CSE-ConnectionGUID: rWi91/UmQSKlX8WP1+zZUA==
X-CSE-MsgGUID: r2UUoW6uQkykbkVr3V3wwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="264744665"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2026 12:19:42 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIARe-00000000BS2-3xM9;
	Wed, 29 Apr 2026 19:19:38 +0000
Date: Thu, 30 Apr 2026 03:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.2] BUILD SUCCESS
 269337466db3649abea4c294b4154a916e0e3a99
Message-ID: <202604300341.xUJmcnp4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 09717499BC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31766-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.2
branch HEAD: 269337466db3649abea4c294b4154a916e0e3a99  soc: renesas: r9a09g057-sys: Move common code to a helper

elapsed time: 2971m

configs tested: 75
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc         randconfig-001-20260430    gcc-8.5.0
arc         randconfig-002-20260430    gcc-8.5.0
arm                     allnoconfig    gcc-15.2.0
arm         randconfig-001-20260430    gcc-8.5.0
arm         randconfig-002-20260430    gcc-8.5.0
arm         randconfig-003-20260430    gcc-8.5.0
arm         randconfig-004-20260430    gcc-8.5.0
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260430    clang-23
arm64       randconfig-002-20260430    clang-23
arm64       randconfig-003-20260430    clang-23
arm64       randconfig-004-20260430    clang-23
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260430    clang-23
csky        randconfig-002-20260430    clang-23
hexagon                allmodconfig    gcc-15.2.0
hexagon                 allnoconfig    gcc-15.2.0
hexagon     randconfig-001-20260430    gcc-14.3.0
hexagon     randconfig-002-20260430    gcc-14.3.0
i386                   allmodconfig    clang-20
i386                    allnoconfig    gcc-15.2.0
i386                   allyesconfig    clang-20
loongarch               allnoconfig    gcc-15.2.0
loongarch   randconfig-001-20260430    gcc-14.3.0
loongarch   randconfig-002-20260430    gcc-14.3.0
m68k                    allnoconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
nios2                  allmodconfig    clang-23
nios2                   allnoconfig    clang-23
nios2       randconfig-001-20260430    gcc-14.3.0
nios2       randconfig-002-20260430    gcc-14.3.0
openrisc               allmodconfig    clang-23
openrisc                allnoconfig    clang-23
openrisc                  defconfig    gcc-15.2.0
parisc                  allnoconfig    clang-23
parisc                 allyesconfig    clang-19
parisc                    defconfig    gcc-15.2.0
parisc      randconfig-001-20260430    gcc-13.4.0
parisc      randconfig-002-20260430    gcc-13.4.0
powerpc                 allnoconfig    clang-23
powerpc     randconfig-001-20260430    gcc-13.4.0
powerpc     randconfig-002-20260430    gcc-13.4.0
powerpc64   randconfig-001-20260430    gcc-13.4.0
powerpc64   randconfig-002-20260430    gcc-13.4.0
riscv                   allnoconfig    clang-23
riscv                     defconfig    gcc-15.2.0
s390                   allmodconfig    clang-19
s390                    allnoconfig    clang-23
s390                      defconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    clang-23
sh                     allyesconfig    clang-19
sparc                   allnoconfig    clang-23
sparc                     defconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-15.2.0
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-23
x86_64                 allyesconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    clang-23
xtensa                 allyesconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

