Return-Path: <linux-renesas-soc+bounces-31651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOBKF+Vk7GmjYQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 08:53:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 527BF4653B1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 08:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10D5D3005159
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 06:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0E042048;
	Sat, 25 Apr 2026 06:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqSLsyJ3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916D51B6D1A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Apr 2026 06:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100000; cv=none; b=mHz/k0YEDILGiC78wWaBVLX6fDZuJ82m1j+tcw+4jlAiII0speDXFXL/MM7lfSnx3dl1nSRLUJMo33SciSY/JR8+QO5uL+TsJcFymRzReaJ+2ep5By9GJcmkll1TwqbrPsNsz0C08Bd3R7C6ptZsIWbopDy7szcqseLXmFMCI8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100000; c=relaxed/simple;
	bh=okiY73dt7o66EHWCAEXncn4yaF6LYclfN3PitI99O2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r16jaPQ0zjr8pF6YBhgMHkjB08Q54DxRfYgIeGS3wbKKUPPzH2vHtkkgXQ4dE/Rqn/lcydRBDK1D/tey14OowgFim/cz64prZDg8d+gx452+swsb4MPZ/BYRUu3mftLtL26L4nDCjKnIAqhZL0NAlaimq2C0XJCKfrXCqH+yGuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqSLsyJ3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777099999; x=1808635999;
  h=date:from:to:cc:subject:message-id;
  bh=okiY73dt7o66EHWCAEXncn4yaF6LYclfN3PitI99O2M=;
  b=IqSLsyJ3+AiiZEmlXz/mhhJu1T9j+9ZR47lb02VGuLktT78KsaCWkCy1
   eBTegA8NKclae3nYNaCoU6LmKltjE8pQK9DmY6aEqPpLspWcMtEcMUeSZ
   R+jjuzE36WNdo4xYdm7FgoJrGL4f4Z2jkk44cUawuper8g5dLV3ILQxlf
   h6HgofNJy395kj/tEnQFMkmu3JkBGU/RPzcHNqFu8DvKmnB1gD4JZSI5X
   8DHIniNiEBR0dJCoOFZMkFS8lATO6K8Koj7H18sA66wOkDMO6sJiBxo/O
   fCF4OvwnHrHOTIEWbqLPY14RMGpdWAOIcW2KJe47oeit6xzaAyYYtDIn/
   Q==;
X-CSE-ConnectionGUID: EBXqU5tNTGKB+J6gMx7q4g==
X-CSE-MsgGUID: Z64ymTVmQyKOlqLjmsUoIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="81930558"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="81930558"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 23:53:18 -0700
X-CSE-ConnectionGUID: g57N2h0HSt6hNQtifmndwA==
X-CSE-MsgGUID: 9Gjsouo+TsiX7npkxZivTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="229953295"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2026 23:53:16 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGWt8-000000006Wf-2val;
	Sat, 25 Apr 2026 06:53:14 +0000
Date: Sat, 25 Apr 2026 14:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 f13e3ccc3b008cddadb246fb32469c7b7cce03c3
Message-ID: <202604251402.d7inGAqI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 527BF4653B1
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-31651-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: f13e3ccc3b008cddadb246fb32469c7b7cce03c3  Merge branch 'renesas-dts-for-v7.2' into renesas-devel

elapsed time: 854m

configs tested: 58
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
i386        randconfig-001-20260425    gcc-13
i386        randconfig-003-20260425    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
openrisc                  defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc                    defconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

