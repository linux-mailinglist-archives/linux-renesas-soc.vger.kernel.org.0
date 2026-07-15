Return-Path: <linux-renesas-soc+bounces-35250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mcL9GZVdV2reKQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:14:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B975CD42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:14:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LdlhaMqZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F017830074D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEA63CCFAF;
	Wed, 15 Jul 2026 10:12:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E29F3EBF07
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 10:12:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110377; cv=none; b=a1RNW0DuhOXDMwUy9j7+I1ZeN/ncrk824lo75clwt+dEV9QjoAWIRSG82aLDEs4ggVOYWvzuZN0H3gq0Po+yKD8f9X2EwrF/+JGpFaJWGZyiU2ZNpdO4L/bvyxgwHmQjEhgtnC8PZv81giNdfUxH79UFuw54oXcpgiaYTYskfV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110377; c=relaxed/simple;
	bh=msD5SY+gh2t2ALlMSnkU5O559SCa+ZH7MJkVUNrkisA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QV4vSJNS5xq3qJgZeBljA3JPxeS5uENEsdgyQMoJlAQ9reDhex7yECeL59Ho1HC87KIFIkhvYDc4o2T6yyxH3ObZtnTY9bAjhISX4PgAnLbA84XeSWPj2a2urlzD8CXJmftv3hhNZWTuIcaqEb3cb2MX6k1nmmsWpZoMdj/5t4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdlhaMqZ; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784110376; x=1815646376;
  h=date:from:to:cc:subject:message-id;
  bh=msD5SY+gh2t2ALlMSnkU5O559SCa+ZH7MJkVUNrkisA=;
  b=LdlhaMqZG5Ltjq7MCwvma+aNWxpYpgTDebW1+SlQIj0mcbIKrmv06ZiS
   RxwkNAB5jW3RLU25An3qrZh6jHRCNv55xdW+EKzTPFoOQm5y0FwtVfvW4
   u9KO9MofPHtfncXb9wWmNGDKNqXpVHuj8eWwL4/8MDs75wwYiyCMx50Y7
   Rz9rDArQyp7RNNIozzUokO6k7OvlBDOt4tdwtQpWi4Fne4UQz5KQjBjP9
   plIPZXH7vDMLoAbNRC0cSkO3vCpxQJ0icLnWvpNvDUiAEzyvrCJwC20rT
   K1AqRAQ3kYo4d+zC3h5gJ5rCpNAO+M4gYJ8r33WUJrUnQNqx0j4NpSxtj
   w==;
X-CSE-ConnectionGUID: 3Ge+0ZZ7TKKTfzhV08fKAA==
X-CSE-MsgGUID: RChGqenOSXmidA5cEMnwUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84703588"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84703588"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 03:12:55 -0700
X-CSE-ConnectionGUID: b6jwkLHLQGe0V6yhHUJgLw==
X-CSE-MsgGUID: l6AczU1qQfub7TtavWeaIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="249766604"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2026 03:12:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjwbi-00000000Nax-3nyn;
	Wed, 15 Jul 2026 10:12:50 +0000
Date: Wed, 15 Jul 2026 18:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 cbf4a77e77ce7c4a2907a798c7f624dfaf65da57
Message-ID: <202607151814.Mz84k49Y-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35250-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 198B975CD42

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: cbf4a77e77ce7c4a2907a798c7f624dfaf65da57  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202607150855.G7wtKYQ7-lkp@intel.com

    drivers/scsi/zorro7xx.c:53:18: error: 'struct zorro_device_id' has no member named 'driver_data_ptr'; did you mean 'driver_data'?
    drivers/scsi/zorro7xx.c:53:36: error: initialization of 'long unsigned int' from 'struct zorro_driver_data *' makes integer from pointer without a cast [-Wint-conversion]
    drivers/scsi/zorro7xx.c:84:20: error: 'const struct zorro_device_id' has no member named 'driver_data_ptr'; did you mean 'driver_data'?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- m68k-allyesconfig
|   |-- drivers-scsi-zorro7xx.c:error:const-struct-zorro_device_id-has-no-member-named-driver_data_ptr
|   |-- drivers-scsi-zorro7xx.c:error:initialization-of-long-unsigned-int-from-struct-zorro_driver_data-makes-integer-from-pointer-without-a-cast
|   `-- drivers-scsi-zorro7xx.c:error:struct-zorro_device_id-has-no-member-named-driver_data_ptr
`-- m68k-defconfig
    |-- drivers-scsi-zorro7xx.c:error:const-struct-zorro_device_id-has-no-member-named-driver_data_ptr
    |-- drivers-scsi-zorro7xx.c:error:initialization-of-long-unsigned-int-from-struct-zorro_driver_data-makes-integer-from-pointer-without-a-cast
    `-- drivers-scsi-zorro7xx.c:error:struct-zorro_device_id-has-no-member-named-driver_data_ptr

elapsed time: 1119m

configs tested: 153
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                   randconfig-001-20260715    gcc-10.5.0
arc                   randconfig-002-20260715    gcc-10.5.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                   randconfig-001-20260715    gcc-10.5.0
arm                   randconfig-002-20260715    gcc-10.5.0
arm                   randconfig-003-20260715    gcc-10.5.0
arm                   randconfig-004-20260715    gcc-10.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                 randconfig-001-20260715    gcc-16.1.0
arm64                 randconfig-001-20260715    gcc-9.5.0
arm64                 randconfig-002-20260715    gcc-15.2.0
arm64                 randconfig-002-20260715    gcc-16.1.0
arm64                 randconfig-003-20260715    clang-23
arm64                 randconfig-003-20260715    gcc-16.1.0
arm64                 randconfig-004-20260715    gcc-11.5.0
arm64                 randconfig-004-20260715    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                  randconfig-001-20260715    gcc-16.1.0
csky                  randconfig-002-20260715    gcc-13.4.0
csky                  randconfig-002-20260715    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260715    clang-17
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260715    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                  randconfig-001-20260715    clang-22
i386                  randconfig-002-20260715    clang-22
i386                  randconfig-003-20260715    clang-22
i386                  randconfig-004-20260715    clang-22
i386                  randconfig-005-20260715    clang-22
i386                  randconfig-006-20260715    clang-22
i386                  randconfig-007-20260715    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260715    gcc-16.1.0
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260715    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260715    gcc-11.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260715    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260715    gcc-15.2.0
riscv                 randconfig-002-20260715    gcc-15.2.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260715    gcc-15.2.0
s390                  randconfig-002-20260715    gcc-15.2.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260715    gcc-15.2.0
sh                    randconfig-002-20260715    gcc-15.2.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260715    gcc-16.1.0
sparc                 randconfig-002-20260715    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260715    clang-23
sparc64               randconfig-002-20260715    clang-20
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260715    clang-23
um                    randconfig-002-20260715    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260715    clang-22
x86_64      buildonly-randconfig-001-20260715    gcc-14
x86_64      buildonly-randconfig-002-20260715    gcc-14
x86_64      buildonly-randconfig-003-20260715    gcc-14
x86_64      buildonly-randconfig-004-20260715    gcc-14
x86_64      buildonly-randconfig-005-20260715    clang-22
x86_64      buildonly-randconfig-005-20260715    gcc-14
x86_64      buildonly-randconfig-006-20260715    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260715    clang-22
x86_64                randconfig-002-20260715    clang-22
x86_64                randconfig-003-20260715    clang-22
x86_64                randconfig-004-20260715    clang-22
x86_64                randconfig-004-20260715    gcc-14
x86_64                randconfig-005-20260715    clang-22
x86_64                randconfig-006-20260715    clang-22
x86_64                randconfig-006-20260715    gcc-14
x86_64                randconfig-011-20260715    clang-22
x86_64                randconfig-012-20260715    gcc-14
x86_64                randconfig-013-20260715    clang-22
x86_64                randconfig-014-20260715    clang-22
x86_64                randconfig-015-20260715    clang-22
x86_64                randconfig-016-20260715    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260715    gcc-14.3.0
xtensa                randconfig-002-20260715    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

