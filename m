Return-Path: <linux-renesas-soc+bounces-33140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD1BFftUFWqmUQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 10:08:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA055D2394
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 10:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BC33002295
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 08:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CBC3CC9E2;
	Tue, 26 May 2026 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta4oS3MC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A69314B9A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779782772; cv=none; b=hTIMOLwL9HEs/5VK0nseFOdvOY2WAIdODGwpG/U7E/jXFuA7bsaENC97ANsj5yfUdZemA4tkkPX6N0RHR7D/I9uV2HHDCGekmzBJQthqE17r7y1jZoNbqFgm+3iP7bObhmyDVHoLspcSW6aZ6JV3jVG79emXl1wPZreaMM16Nrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779782772; c=relaxed/simple;
	bh=5wOvZT4wlfP05JpMnEOcbqv6MQO7CkyQBMAcg1DaBrw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yhs14sWLTAZllfksyG7RhnFkOY5icHINQPDCQnSMmodXfCu5O2fV4uMpQ+q+pGdBBajuA3BHQ2vfpfL/NJt/Qy+jnwZSstS37I7pDlhyOBwwLT5pQ0KzJAhjPCyIMTfeWiADGxqa719jzMo9Al5hv6v+d9YLeH0IfcNsCnR5uGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta4oS3MC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779782771; x=1811318771;
  h=date:from:to:cc:subject:message-id;
  bh=5wOvZT4wlfP05JpMnEOcbqv6MQO7CkyQBMAcg1DaBrw=;
  b=Ta4oS3MC2XRp/TyBK7rya7TnCJ9I6vzRjs0qAnoTXTt3GlTeny/BqAAN
   UFZ9IMr1Hr2sEtJUsKCEJvjPpVS7Ki7ElCT/WjD2sX6LT2XMAPlrgsfr2
   rgJASqktZjI5Inko/ceIZZxQcqUROrfctiOyrDQm4AGjnMK8qmHHeWIA1
   slAH/3r7u1gj6/oThIq/aPiJXL0a7YHLktqPY1fjSLDMWBZ9yaNJFVNAp
   tvTlky5msFphWjKu2vKI4HruYotCHQx0bos8YLkLUIUJvPACKcMiHBhMt
   cCKZDltXFozzRhQxSu7A5ibN6pVYRDd4Pw6oYhNSmnIHYzVJEy173aqzT
   Q==;
X-CSE-ConnectionGUID: XhE7japiTXyPtl+LAjKdXQ==
X-CSE-MsgGUID: 4F3RKSghR/2TJ2acmS9Kug==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80647631"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80647631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:06:10 -0700
X-CSE-ConnectionGUID: fiZTdbiWStmXa2mQV2ykuQ==
X-CSE-MsgGUID: 0ngV46QuQZChfL+GTYIlig==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 May 2026 01:06:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRmne-000000002Ew-0Uj8;
	Tue, 26 May 2026 08:06:06 +0000
Date: Tue, 26 May 2026 16:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 061918bc2d47cb8fc09c9f54afca875b277993f7
Message-ID: <202605261648.BxOlsDnk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-33140-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4CA055D2394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 061918bc2d47cb8fc09c9f54afca875b277993f7  Merge branch 'renesas-next', tag 'v7.1-rc5' into renesas-devel

elapsed time: 962m

configs tested: 57
configs skipped: 1

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
arm64       randconfig-002-20260526    gcc-8.5.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260526    gcc-15.2.0
csky        randconfig-002-20260526    gcc-13.4.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
powerpc                allmodconfig    gcc-15.2.0
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

