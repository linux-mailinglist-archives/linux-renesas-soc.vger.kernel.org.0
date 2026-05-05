Return-Path: <linux-renesas-soc+bounces-31984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN1IO49j+Wke8QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:27:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F74C6245
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D83F1301DE00
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 03:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A9A318B9D;
	Tue,  5 May 2026 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWMpekzL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7639A809
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777951600; cv=none; b=kYyitdGIG0d+ay0L1qfsDi0RgQPstVXmLubD4XdjMY+pdemvk7S0v72CDRab/Ne/YVM0NHhYArBm6FhTrv98Kpw9HmgYopn07CydzY9ZTOX7/2FMi4eb9x7293skwtP/gsORfGraNtG68x6/sqPI5LZd78UoMaWSeVqvHNUn3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777951600; c=relaxed/simple;
	bh=Gv/Sj6M7FBKM5N12OCBxTelJBoL1R1mEf851dpfMB+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eR+0fz2VU97ZTLenuMWPrJxcg2OoRtqS4+DTvRIZE4qEpxxufMzwyjxkRwqOrzf8b+2dXGxrhowoWVRMOixT2X+9KRPreSRJCC2MXTQ6VSsh/neFF3lIxtN9GykooIHaKpOWbByAjo4+jbkROb8CoMbGZux8iVUJrvfffVBTqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWMpekzL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777951598; x=1809487598;
  h=date:from:to:cc:subject:message-id;
  bh=Gv/Sj6M7FBKM5N12OCBxTelJBoL1R1mEf851dpfMB+U=;
  b=XWMpekzLXZJLxOvPk4/V7FMNDoGclkC6ft8BLWJDtzuW2v9tkB4sJSkA
   W3xElQCYayJD6lQcXLcCYfKAQ5LXi9jy3d+/rCM9DAkVVUJJSXI6rTuJh
   njb1/8QFmJ/XRtbxT/thODsip56d/dJciFo7sSxuxprH+5MFgsKaWvoCx
   dYkxPgLbf9t3R74y53vzuzrNUrjFoKG0DoyEOA2YE1iHyg7JFLg/770Yc
   J1//aqYVXe5YosXmym9Nolf6WuNEc0hM9DvrDx8n1O4fRvnVlEKRU5+XF
   xyWtyOUuq+MW5dcwuruMvRCA3Cn67IkIYfWR2nt3C0aH07W47KhP3XgeV
   g==;
X-CSE-ConnectionGUID: I99ONCZkRaWXApDSWGBakQ==
X-CSE-MsgGUID: TYx47As+QGaqT7cpO5CGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78751585"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78751585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 20:26:38 -0700
X-CSE-ConnectionGUID: UrYD3SOFQ5eFmvQwy9aWlg==
X-CSE-MsgGUID: DPcL/lC3RLGnrVKxyDNKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="239986012"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 May 2026 20:26:36 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK6QV-000000004DV-01tq;
	Tue, 05 May 2026 03:26:28 +0000
Date: Tue, 05 May 2026 11:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 51ae2c414f20ce4292297f03eeae72fb5f91009e
Message-ID: <202605051132.fYfWf2LZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 5B2F74C6245
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
	TAGGED_FROM(0.00)[bounces-31984-lists,linux-renesas-soc=lfdr.de];
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 51ae2c414f20ce4292297f03eeae72fb5f91009e  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v7.1-rc2' into renesas-devel

elapsed time: 1017m

configs tested: 344
configs skipped: 63

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260504    gcc-13.4.0
arc                   randconfig-001-20260505    gcc-8.5.0
arc                   randconfig-002-20260504    gcc-13.4.0
arc                   randconfig-002-20260505    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260504    gcc-13.4.0
arm                   randconfig-001-20260505    gcc-8.5.0
arm                   randconfig-002-20260504    gcc-13.4.0
arm                   randconfig-002-20260505    gcc-8.5.0
arm                   randconfig-003-20260504    gcc-13.4.0
arm                   randconfig-003-20260505    gcc-8.5.0
arm                   randconfig-004-20260504    gcc-13.4.0
arm                   randconfig-004-20260505    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260504    gcc-15.2.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                 randconfig-002-20260504    gcc-15.2.0
arm64                 randconfig-002-20260505    gcc-14.3.0
arm64                 randconfig-003-20260504    gcc-15.2.0
arm64                 randconfig-003-20260505    gcc-14.3.0
arm64                 randconfig-004-20260504    gcc-15.2.0
arm64                 randconfig-004-20260505    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260504    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                  randconfig-002-20260504    gcc-15.2.0
csky                  randconfig-002-20260505    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260504    clang-23
hexagon               randconfig-001-20260505    clang-23
hexagon               randconfig-001-20260505    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260504    clang-23
hexagon               randconfig-002-20260505    clang-23
hexagon               randconfig-002-20260505    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260504    gcc-14
i386        buildonly-randconfig-001-20260505    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260504    gcc-14
i386        buildonly-randconfig-002-20260505    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260504    gcc-14
i386        buildonly-randconfig-003-20260505    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260504    gcc-14
i386        buildonly-randconfig-004-20260505    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260504    gcc-14
i386        buildonly-randconfig-005-20260505    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260504    gcc-14
i386        buildonly-randconfig-006-20260505    gcc-14
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260504    clang-20
i386                  randconfig-001-20260505    clang-20
i386                           randconfig-002    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260504    clang-20
i386                  randconfig-002-20260504    gcc-14
i386                  randconfig-002-20260505    clang-20
i386                           randconfig-003    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260504    clang-20
i386                  randconfig-003-20260504    gcc-14
i386                  randconfig-003-20260505    clang-20
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260504    clang-20
i386                  randconfig-004-20260504    gcc-14
i386                  randconfig-004-20260505    clang-20
i386                           randconfig-005    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260504    clang-20
i386                  randconfig-005-20260504    gcc-14
i386                  randconfig-005-20260505    clang-20
i386                           randconfig-006    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260504    clang-20
i386                  randconfig-006-20260505    clang-20
i386                           randconfig-007    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260504    clang-20
i386                  randconfig-007-20260505    clang-20
i386                  randconfig-011-20260504    clang-20
i386                  randconfig-011-20260505    clang-20
i386                  randconfig-011-20260505    gcc-14
i386                  randconfig-012-20260504    clang-20
i386                  randconfig-012-20260505    clang-20
i386                  randconfig-013-20260504    clang-20
i386                  randconfig-013-20260505    clang-20
i386                  randconfig-014-20260504    clang-20
i386                  randconfig-014-20260505    clang-20
i386                  randconfig-015-20260504    clang-20
i386                  randconfig-015-20260505    clang-20
i386                  randconfig-015-20260505    gcc-14
i386                  randconfig-016-20260504    clang-20
i386                  randconfig-016-20260505    clang-20
i386                  randconfig-017-20260504    clang-20
i386                  randconfig-017-20260505    clang-20
i386                  randconfig-017-20260505    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260504    clang-23
loongarch             randconfig-001-20260505    clang-23
loongarch             randconfig-001-20260505    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260504    clang-23
loongarch             randconfig-002-20260505    clang-18
loongarch             randconfig-002-20260505    clang-23
loongarch             randconfig-002-20260505    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                          hp300_defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                           rs90_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-15.2.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-15.2.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260504    clang-23
nios2                 randconfig-001-20260505    clang-18
nios2                 randconfig-001-20260505    clang-23
nios2                 randconfig-001-20260505    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260504    clang-23
nios2                 randconfig-002-20260505    clang-18
nios2                 randconfig-002-20260505    clang-23
nios2                 randconfig-002-20260505    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-14.3.0
parisc                randconfig-001-20260504    gcc-13.4.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                         randconfig-002    gcc-14.3.0
parisc                randconfig-002-20260504    gcc-13.4.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-14.3.0
powerpc               randconfig-001-20260504    gcc-13.4.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc                        randconfig-002    gcc-14.3.0
powerpc               randconfig-002-20260504    gcc-13.4.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
powerpc64                      randconfig-001    gcc-14.3.0
powerpc64             randconfig-001-20260504    gcc-13.4.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64                      randconfig-002    gcc-14.3.0
powerpc64             randconfig-002-20260504    gcc-13.4.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260504    gcc-8.5.0
riscv                 randconfig-001-20260505    gcc-10.5.0
riscv                 randconfig-002-20260504    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260504    gcc-8.5.0
s390                  randconfig-002-20260504    gcc-8.5.0
s390                  randconfig-002-20260505    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260504    gcc-8.5.0
sh                    randconfig-001-20260505    gcc-10.5.0
sh                    randconfig-002-20260504    gcc-8.5.0
sh                    randconfig-002-20260505    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260504    gcc-8.5.0
sparc                 randconfig-001-20260505    gcc-15.2.0
sparc                 randconfig-002-20260504    gcc-8.5.0
sparc                 randconfig-002-20260505    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260504    gcc-8.5.0
sparc64               randconfig-001-20260505    gcc-15.2.0
sparc64               randconfig-002-20260504    gcc-8.5.0
sparc64               randconfig-002-20260505    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260504    gcc-8.5.0
um                    randconfig-001-20260505    gcc-15.2.0
um                    randconfig-002-20260504    gcc-8.5.0
um                    randconfig-002-20260505    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                            allnoconfig    gcc-15.2.0
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260504    gcc-12
x86_64      buildonly-randconfig-001-20260505    clang-20
x86_64      buildonly-randconfig-002-20260504    gcc-12
x86_64      buildonly-randconfig-002-20260505    clang-20
x86_64      buildonly-randconfig-003-20260504    gcc-12
x86_64      buildonly-randconfig-003-20260505    clang-20
x86_64      buildonly-randconfig-004-20260504    gcc-12
x86_64      buildonly-randconfig-004-20260505    clang-20
x86_64      buildonly-randconfig-005-20260504    gcc-12
x86_64      buildonly-randconfig-005-20260505    clang-20
x86_64      buildonly-randconfig-006-20260504    gcc-12
x86_64      buildonly-randconfig-006-20260505    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260504    gcc-14
x86_64                randconfig-001-20260505    clang-20
x86_64                randconfig-002-20260504    gcc-14
x86_64                randconfig-002-20260505    clang-20
x86_64                randconfig-003-20260504    gcc-14
x86_64                randconfig-003-20260505    clang-20
x86_64                randconfig-004-20260504    gcc-14
x86_64                randconfig-004-20260505    clang-20
x86_64                randconfig-005-20260504    gcc-14
x86_64                randconfig-005-20260505    clang-20
x86_64                randconfig-006-20260504    gcc-14
x86_64                randconfig-006-20260505    clang-20
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260504    gcc-14
x86_64                randconfig-011-20260505    clang-20
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260504    gcc-14
x86_64                randconfig-012-20260505    clang-20
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260504    gcc-14
x86_64                randconfig-013-20260505    clang-20
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260504    gcc-14
x86_64                randconfig-014-20260505    clang-20
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260504    gcc-14
x86_64                randconfig-015-20260505    clang-20
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260504    gcc-14
x86_64                randconfig-016-20260505    clang-20
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260504    clang-20
x86_64                randconfig-071-20260505    clang-20
x86_64                randconfig-071-20260505    gcc-14
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260504    clang-20
x86_64                randconfig-072-20260505    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260504    clang-20
x86_64                randconfig-073-20260505    clang-20
x86_64                randconfig-073-20260505    gcc-14
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260504    clang-20
x86_64                randconfig-074-20260505    clang-20
x86_64                randconfig-074-20260505    gcc-14
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260504    clang-20
x86_64                randconfig-075-20260505    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260504    clang-20
x86_64                randconfig-076-20260505    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-11.5.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260504    gcc-8.5.0
xtensa                randconfig-001-20260505    gcc-15.2.0
xtensa                randconfig-002-20260504    gcc-8.5.0
xtensa                randconfig-002-20260505    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

