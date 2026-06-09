Return-Path: <linux-renesas-soc+bounces-33780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ThXsIOZxKGpyEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 22:04:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3000664034
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 22:04:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kjD2XpCn;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92B23304224C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 20:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA45233FE1F;
	Tue,  9 Jun 2026 20:00:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69233C18B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 20:00:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035243; cv=none; b=YKSs3S7bqrV5P4PFhRvdI7GvSyB7+OaWgIim4Y5gCb1ppooLPFtbzAm8TXESvYFJdVdTDKnYJ87bOwlfnBLtX8LCL+7PPbDSZ7qa37Bv/f8ljiAFuUOHly91L8FnsJicjQBqXBY9fDJp5f0uh3KfbBMTY+KI+cZi9Q7eK7s9k70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035243; c=relaxed/simple;
	bh=MEYQfsVDKg2CcJD4HUsDcMQWAZAX3ki4I+WJRwFcBug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bHl/sy9XeO7udm+ZVzJGSB+wNQ8Jv9/rs3p6CAaiF+PQ0zphDy0/F6L4XO2gHTfVqHGbsgf6OjDkkR8fmCj9+wL6SgA8buL7Vy6GmKZGOICxQYTDKgnnVCn+d0v+NZbdo7z8OhUsqFK/lTtsiJdujOcC+9RY43Ne4+l1pHxU17Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjD2XpCn; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781035242; x=1812571242;
  h=date:from:to:cc:subject:message-id;
  bh=MEYQfsVDKg2CcJD4HUsDcMQWAZAX3ki4I+WJRwFcBug=;
  b=kjD2XpCndTtBUWjdp5aor94j2x8n9xd3pDemLbMGa9j4EEGy/DndJpc7
   xHbbZRSnF07NFxrS20R69N0DvbQeJ0JVZzD2RmHyXNOOEc+aCLRwq23Ho
   yMsme26po3a/vdfOmPs9cQvow65EDqlIOSA6dAMDHMpNZhxhsWfe+Rb8O
   5lipVKrl+UthMSYIztw5OV7qzSZVjcqR4HgO+fjwZyPUqNNcYEZLi0dQy
   CPlqCF5TokKzM+Ps4kZGtMfffbvHvLvkPkKR7Hy2xQA0MflghKFGJTsd6
   +Cm//DvSy7UuK3/J0M/P6FDBpY4FV2M9e6kf/ik5WZeueIVXu3DNWFG4Y
   w==;
X-CSE-ConnectionGUID: lgUfld90TCekFwSHV2PtFQ==
X-CSE-MsgGUID: M4ZB85HoTryQJQWePdt29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92133981"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92133981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 13:00:42 -0700
X-CSE-ConnectionGUID: 4OGbQafVSxe6dlm/X7CcbQ==
X-CSE-MsgGUID: Itoad6ZlQrGPf5Y7Q64W7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="249881874"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2026 13:00:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX2cn-00000000KUY-0yNm;
	Tue, 09 Jun 2026 20:00:37 +0000
Date: Wed, 10 Jun 2026 04:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 cf0823e05ce9ef860f5694d503fa7094331b81aa
Message-ID: <202606100408.vaEDG0GC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33780-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3000664034

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: cf0823e05ce9ef860f5694d503fa7094331b81aa  Merge tag 'v7.1-rc7' into renesas-devel

elapsed time: 2094m

configs tested: 286
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260608    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260608    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260608    gcc-8.5.0
arm                            randconfig-002    gcc-15.2.0
arm                   randconfig-002-20260608    gcc-8.5.0
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260608    clang-23
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260608    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260608    gcc-8.5.0
arm64                          randconfig-002    gcc-8.5.0
arm64                 randconfig-002-20260608    gcc-12.5.0
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20260608    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260608    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-13.4.0
csky                  randconfig-001-20260608    gcc-12.5.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260608    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                        randconfig-001    clang-23
hexagon               randconfig-001-20260610    clang-22
hexagon               randconfig-002-20260608    clang-17
hexagon               randconfig-002-20260610    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260608    gcc-14
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260608    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260608    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260608    clang-22
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260608    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260608    clang-22
i386                                defconfig    clang-22
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260608    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260608    clang-22
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260608    gcc-13
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260608    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260608    clang-22
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260608    clang-22
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260608    gcc-14
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260608    clang-22
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260608    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260608    gcc-14
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260608    clang-22
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260608    gcc-12
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260608    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260608    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260610    clang-22
loongarch             randconfig-002-20260608    clang-18
loongarch             randconfig-002-20260610    clang-22
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                           ip28_defconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260608    gcc-11.5.0
nios2                 randconfig-001-20260610    clang-22
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260608    gcc-11.5.0
nios2                 randconfig-002-20260610    clang-22
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260608    gcc-8.5.0
parisc                randconfig-001-20260610    gcc-8.5.0
parisc                         randconfig-002    gcc-12.5.0
parisc                randconfig-002-20260608    gcc-8.5.0
parisc                randconfig-002-20260610    gcc-8.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260608    clang-17
powerpc               randconfig-001-20260610    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260608    clang-16
powerpc               randconfig-002-20260610    gcc-8.5.0
powerpc                     tqm8548_defconfig    clang-23
powerpc64                      randconfig-001    clang-16
powerpc64             randconfig-001-20260608    gcc-14.3.0
powerpc64             randconfig-001-20260610    gcc-8.5.0
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260608    gcc-8.5.0
powerpc64             randconfig-002-20260610    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                          randconfig-001    gcc-13.4.0
riscv                 randconfig-001-20260608    clang-23
riscv                 randconfig-001-20260610    gcc-16.1.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260610    gcc-16.1.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260608    gcc-15.2.0
s390                  randconfig-001-20260610    gcc-16.1.0
s390                           randconfig-002    clang-18
s390                  randconfig-002-20260608    clang-20
s390                  randconfig-002-20260610    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-14.3.0
sh                    randconfig-001-20260608    gcc-12.5.0
sh                    randconfig-001-20260610    gcc-16.1.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260608    gcc-10.5.0
sh                    randconfig-002-20260610    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260608    gcc-13.4.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260608    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260608    clang-20
sparc64                        randconfig-002    clang-20
sparc64               randconfig-002-20260608    gcc-15.2.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260608    gcc-14
um                             randconfig-002    clang-23
um                    randconfig-002-20260608    clang-23
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260608    gcc-14
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260608    clang-22
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260608    gcc-13
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260608    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260608    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260608    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260608    clang-22
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260608    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260608    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260608    gcc-14
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260608    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260608    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260608    gcc-14
x86_64                randconfig-011-20260610    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260608    clang-22
x86_64                randconfig-012-20260610    gcc-14
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260608    clang-22
x86_64                randconfig-013-20260610    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260608    gcc-14
x86_64                randconfig-014-20260610    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260608    gcc-14
x86_64                randconfig-015-20260610    gcc-14
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260608    gcc-14
x86_64                randconfig-016-20260610    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260608    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260608    gcc-14
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260608    clang-22
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260608    clang-22
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260608    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260608    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260608    gcc-9.5.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260608    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

