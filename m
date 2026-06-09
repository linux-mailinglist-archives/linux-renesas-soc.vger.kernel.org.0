Return-Path: <linux-renesas-soc+bounces-33771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b727D2srKGrn/QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 17:04:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBC6617EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 17:04:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ccKBbOOT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6183431640D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 14:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485CC3AC0C0;
	Tue,  9 Jun 2026 14:43:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6BF352C5B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 14:43:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016239; cv=none; b=HpS/gl5iw24K4fwHjuTqyM5DOd0nl50vvrD+82Y/Oh/C8Cl+ChVwH9C3JSuYL4XgJAUQuaG/+dFlwpnNenwHMCb6Cs2vmc8G8GHarUPKpAs8oS4GFexQd1yw7tS+bhD+rrW+oiDLaddSZYju+avBZNyWaxYpLxwV1bvD2uXX3Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016239; c=relaxed/simple;
	bh=JdPsIz5F+QFarI85AB2FSo8S+2UkDPV097Fy5PnBOLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tj1SmSHT1ZfOLtd7SvZB7lKrz7mSDtA3YDMg/vupIsJPEfcI9wVoAHx1zdDcJEXshlaCUydPtEhAH7viLrHLnxP7lWNYnteAd5Kg1p+U33yJzSnz5nbmBL755WEBsFfkB3XEZJwZbVhaWgMzeDHk05o6N1RlOpHPX45je7TBKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccKBbOOT; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781016236; x=1812552236;
  h=date:from:to:cc:subject:message-id;
  bh=JdPsIz5F+QFarI85AB2FSo8S+2UkDPV097Fy5PnBOLw=;
  b=ccKBbOOTwpI6vhCc+QWUuA9V+QJL04u5YCpLA+e5v/5D/4Ejg25SUS0q
   HdDCQf3EcEuhJ4zr9fgJnA9cq26A1fumNFWJwHJ4ROoWKdI47ugyPl/n7
   U/Z4t/7+fSUTLN726no1JFjYvraGSsqo2TKEiFCHPjGGFaP+pjmf0SBH+
   v4Hy8VKstgR0JotmBFSeD2CN+3STF3w6wBKJBXNfhD1NIJcSlfZXHei5W
   3ogULXCimpD2wkDYkZ/lYy8xM4JemfRrx3ZdoCWgsY7hGRr05J8aewszN
   FtnS37FTXFtwKDAtKQ39yjEYzhC183HH7M/S0uZTu9hJElCt2GnOVCboF
   A==;
X-CSE-ConnectionGUID: PQqz5BN3Tf2N+sNRBN6BHw==
X-CSE-MsgGUID: OPqFP9SrS2SZj2T+spxPrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81526389"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81526389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:43:56 -0700
X-CSE-ConnectionGUID: 9c/8W+7fSFCAtAybBW51Nw==
X-CSE-MsgGUID: +pQ2/vGGQvmb6+cbCzWWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="242922707"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2026 07:43:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWxgF-00000000K7W-3Ixo;
	Tue, 09 Jun 2026 14:43:51 +0000
Date: Tue, 09 Jun 2026 22:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 14270179806b876fecefcbf35905e512b56a5867
Message-ID: <202606092241.msUEPA1q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33771-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3EBC6617EE

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 14270179806b876fecefcbf35905e512b56a5867  pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update

elapsed time: 5368m

configs tested: 62
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-16.1.0
alpha                  allyesconfig    gcc-16.1.0
arc                    allmodconfig    gcc-16.1.0
arc                     allnoconfig    gcc-16.1.0
arc                    allyesconfig    gcc-16.1.0
arm                     allnoconfig    clang-23
arm                     allnoconfig    gcc-16.1.0
arm                    allyesconfig    gcc-16.1.0
arm64                  allmodconfig    clang-23
arm64                   allnoconfig    gcc-16.1.0
csky                   allmodconfig    gcc-16.1.0
csky                    allnoconfig    gcc-16.1.0
hexagon                allmodconfig    clang-23
hexagon                 allnoconfig    clang-23
hexagon                 allnoconfig    gcc-16.1.0
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-16.1.0
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-20
loongarch               allnoconfig    gcc-16.1.0
loongarch   randconfig-001-20260609    clang-23
loongarch   randconfig-002-20260609    clang-23
m68k                   allmodconfig    gcc-16.1.0
m68k                    allnoconfig    gcc-16.1.0
m68k                   allyesconfig    gcc-16.1.0
microblaze              allnoconfig    gcc-16.1.0
microblaze             allyesconfig    gcc-16.1.0
mips                   allmodconfig    gcc-16.1.0
mips                    allnoconfig    gcc-16.1.0
mips                   allyesconfig    gcc-16.1.0
nios2                  allmodconfig    clang-20
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    clang-20
openrisc               allmodconfig    gcc-16.1.0
openrisc                allnoconfig    gcc-16.1.0
parisc                 allmodconfig    gcc-16.1.0
parisc                  allnoconfig    gcc-16.1.0
parisc                 allyesconfig    gcc-16.1.0
powerpc                allmodconfig    gcc-16.1.0
powerpc                 allnoconfig    gcc-16.1.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-16.1.0
riscv                  allyesconfig    clang-23
s390                   allmodconfig    clang-23
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-16.1.0
sh                     allmodconfig    gcc-16.1.0
sh                      allnoconfig    gcc-16.1.0
sh                     allyesconfig    gcc-16.1.0
sparc                   allnoconfig    gcc-16.1.0
sparc64                allmodconfig    clang-20
um                     allmodconfig    clang-23
um                      allnoconfig    clang-16
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-22
x86_64                  allnoconfig    clang-22
x86_64                 allyesconfig    clang-22
x86_64                rhel-9.4-rust    clang-22
xtensa                  allnoconfig    gcc-16.1.0
xtensa                 allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

