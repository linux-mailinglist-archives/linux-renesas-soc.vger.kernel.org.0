Return-Path: <linux-renesas-soc+bounces-27457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HlSKRUTeGkYnwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 02:21:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E00108EAA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 02:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 512A43000B0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 01:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9B023AB90;
	Tue, 27 Jan 2026 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6pOEZVK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E47239099
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476881; cv=none; b=GN99x14kgfLqkypWmTbue+ATZ5LX0v/MDrtmipe8PnSpIbuvnMhlDOFN/FSKFs74si+s+CjDNN1Chno/kTI4CmishB3BDC5irKZxL9uF/0lUsE1rXplUq9QwST57gZSgD6v3/jqrot5QYz+QXRUSHlTax1q5EFXtA0YvJc8DCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476881; c=relaxed/simple;
	bh=e9qGQMvtId1rORwlNUw6kM/8SuxTdqpznEBwHAVC9Qc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pvq9/FdYk5SXm9dJy7R+vd80qN0MhAvBHo8SCFZydVFS4hMuUArig20FNKaBxGSzZWFmUNA7jpJK/W4tBl4hJo7ISZOszVz+VbdOz9DnXndDJ8z7zcvLxPO89giHnsuwbGqZ/qTe9XhZQkf+vbDHGxaTrGwhYR3Z4SiD9GQOn6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6pOEZVK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769476880; x=1801012880;
  h=date:from:to:cc:subject:message-id;
  bh=e9qGQMvtId1rORwlNUw6kM/8SuxTdqpznEBwHAVC9Qc=;
  b=O6pOEZVK5srWqkiXLG/JGg5T8ndiePwVmKv6wu70uqgsDpaiTNfa3A9N
   E/KkULOez2u0d9xlRDIU/KWPWV9ZD9h8vkTk6m2s4VrsD78P7uw17bw7j
   2sj5GeSBZ3J/WqqRXCO8sLmPR7R4geY0cl7TotgO0nZvQ0OBvJOwZGgWs
   nQ3MLqrl9CyGQLDy61KVcoWJtLP/SYv0K+VwYEq5nQuKg7paeAqM8K67/
   x6zQqu9iUtuJlgcWdAnJFDo5kG1Ct3ZWDS0HP2a7vpAHSFH2vbjhXDMVK
   DRdAxJ5Mq/1W8mPCU4qnHcwf5GqqmL/5Uu2mNMRTzMswAI5qK9KeuLHUj
   w==;
X-CSE-ConnectionGUID: i5Evj5wrQNiUpEjkU6QJFA==
X-CSE-MsgGUID: nBVDcoZ2QQqC7ptv8rnAxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70633398"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70633398"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:21:19 -0800
X-CSE-ConnectionGUID: ZRKuK/DqTv6uCFxtyoTW/A==
X-CSE-MsgGUID: rqEQN3N9QA6iPfw9bf2Xyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212692235"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jan 2026 17:21:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkXla-00000000Xpy-48L4;
	Tue, 27 Jan 2026 01:21:14 +0000
Date: Tue, 27 Jan 2026 09:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 b320f761d05e2002083d2a78b5103618088b5d31
Message-ID: <202601270939.qjpxbyXY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27457-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E00108EAA3
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: b320f761d05e2002083d2a78b5103618088b5d31  Merge tag 'v6.19-rc7' into renesas-devel

elapsed time: 853m

configs tested: 241
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260126    gcc-10.5.0
arc                   randconfig-001-20260126    gcc-13.4.0
arc                   randconfig-001-20260127    gcc-14.3.0
arc                   randconfig-002-20260126    gcc-10.5.0
arc                   randconfig-002-20260126    gcc-8.5.0
arc                   randconfig-002-20260127    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260126    gcc-10.5.0
arm                   randconfig-001-20260126    gcc-11.5.0
arm                   randconfig-001-20260127    gcc-14.3.0
arm                   randconfig-002-20260126    gcc-10.5.0
arm                   randconfig-002-20260126    gcc-13.4.0
arm                   randconfig-002-20260127    gcc-14.3.0
arm                   randconfig-003-20260126    gcc-10.5.0
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-004-20260126    gcc-10.5.0
arm                   randconfig-004-20260126    gcc-8.5.0
arm                   randconfig-004-20260127    gcc-14.3.0
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260126    gcc-15.2.0
arm64                 randconfig-001-20260127    gcc-15.2.0
arm64                 randconfig-002-20260126    gcc-15.2.0
arm64                 randconfig-002-20260127    gcc-15.2.0
arm64                 randconfig-003-20260126    gcc-15.2.0
arm64                 randconfig-003-20260127    gcc-15.2.0
arm64                 randconfig-004-20260126    gcc-15.2.0
arm64                 randconfig-004-20260127    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260126    gcc-15.2.0
csky                  randconfig-001-20260127    gcc-15.2.0
csky                  randconfig-002-20260126    gcc-15.2.0
csky                  randconfig-002-20260127    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260126    clang-20
i386        buildonly-randconfig-001-20260127    gcc-14
i386        buildonly-randconfig-002-20260126    clang-20
i386        buildonly-randconfig-002-20260127    gcc-14
i386        buildonly-randconfig-003-20260126    clang-20
i386        buildonly-randconfig-003-20260127    gcc-14
i386        buildonly-randconfig-004-20260126    clang-20
i386        buildonly-randconfig-004-20260127    gcc-14
i386        buildonly-randconfig-005-20260126    clang-20
i386        buildonly-randconfig-005-20260127    gcc-14
i386        buildonly-randconfig-006-20260126    clang-20
i386        buildonly-randconfig-006-20260127    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260126    clang-20
i386                  randconfig-001-20260126    gcc-14
i386                  randconfig-002-20260126    clang-20
i386                  randconfig-002-20260126    gcc-14
i386                  randconfig-003-20260126    clang-20
i386                  randconfig-003-20260126    gcc-14
i386                  randconfig-004-20260126    gcc-12
i386                  randconfig-004-20260126    gcc-14
i386                  randconfig-005-20260126    gcc-14
i386                  randconfig-006-20260126    clang-20
i386                  randconfig-007-20260126    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip22_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260126    gcc-8.5.0
parisc                randconfig-001-20260127    gcc-11.5.0
parisc                randconfig-002-20260126    gcc-8.5.0
parisc                randconfig-002-20260127    gcc-11.5.0
parisc64                         alldefconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-22
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20260126    gcc-14.3.0
powerpc               randconfig-001-20260127    gcc-11.5.0
powerpc               randconfig-002-20260126    clang-22
powerpc               randconfig-002-20260127    gcc-11.5.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260126    gcc-8.5.0
powerpc64             randconfig-001-20260127    gcc-11.5.0
powerpc64             randconfig-002-20260126    clang-22
powerpc64             randconfig-002-20260127    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260126    gcc-9.5.0
riscv                 randconfig-002-20260126    gcc-9.5.0
riscv                 randconfig-002-20260127    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260126    gcc-9.5.0
s390                  randconfig-001-20260127    gcc-13.4.0
s390                  randconfig-002-20260126    gcc-9.5.0
s390                  randconfig-002-20260127    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                            migor_defconfig    gcc-15.2.0
sh                    randconfig-001-20260126    gcc-9.5.0
sh                    randconfig-001-20260127    gcc-13.4.0
sh                    randconfig-002-20260126    gcc-9.5.0
sh                    randconfig-002-20260127    gcc-13.4.0
sh                   rts7751r2dplus_defconfig    clang-22
sh                           se7724_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260127    gcc-14
x86_64      buildonly-randconfig-002-20260127    gcc-14
x86_64      buildonly-randconfig-003-20260127    gcc-14
x86_64      buildonly-randconfig-004-20260127    gcc-14
x86_64      buildonly-randconfig-005-20260127    gcc-14
x86_64      buildonly-randconfig-006-20260127    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260126    gcc-14
x86_64                randconfig-001-20260127    clang-20
x86_64                randconfig-002-20260126    clang-20
x86_64                randconfig-002-20260126    gcc-14
x86_64                randconfig-002-20260127    clang-20
x86_64                randconfig-003-20260126    clang-20
x86_64                randconfig-003-20260126    gcc-14
x86_64                randconfig-004-20260126    clang-20
x86_64                randconfig-004-20260126    gcc-14
x86_64                randconfig-004-20260127    clang-20
x86_64                randconfig-005-20260126    gcc-14
x86_64                randconfig-005-20260127    clang-20
x86_64                randconfig-006-20260126    clang-20
x86_64                randconfig-006-20260126    gcc-14
x86_64                randconfig-006-20260127    clang-20
x86_64                randconfig-011-20260126    gcc-14
x86_64                randconfig-011-20260127    clang-20
x86_64                randconfig-012-20260126    gcc-14
x86_64                randconfig-012-20260127    clang-20
x86_64                randconfig-013-20260126    gcc-14
x86_64                randconfig-013-20260127    clang-20
x86_64                randconfig-014-20260126    gcc-14
x86_64                randconfig-014-20260127    clang-20
x86_64                randconfig-015-20260126    gcc-14
x86_64                randconfig-015-20260127    clang-20
x86_64                randconfig-016-20260126    gcc-14
x86_64                randconfig-016-20260127    clang-20
x86_64                randconfig-071-20260126    gcc-14
x86_64                randconfig-071-20260127    gcc-14
x86_64                randconfig-072-20260126    gcc-14
x86_64                randconfig-072-20260127    gcc-14
x86_64                randconfig-073-20260126    gcc-14
x86_64                randconfig-073-20260127    gcc-14
x86_64                randconfig-074-20260126    gcc-14
x86_64                randconfig-074-20260127    gcc-14
x86_64                randconfig-075-20260126    gcc-14
x86_64                randconfig-075-20260127    gcc-14
x86_64                randconfig-076-20260127    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

