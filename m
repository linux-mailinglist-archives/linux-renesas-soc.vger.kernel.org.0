Return-Path: <linux-renesas-soc+bounces-30044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFWLKE8evmmsGwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 05:27:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51492E3417
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 05:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44C7C3011F1B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 04:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA392D97A6;
	Sat, 21 Mar 2026 04:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rlgx/LgC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D96B29B200
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774067276; cv=none; b=SaoHKx0DzjqSWjbj2RHKcPPY+2pn4kORTWuu5o9u3QDfkqItXpmBlRUWgd6WV/sOHSPs6HnDZVnUIf2EBWNH8+6YwyD3W6uJBV7lG0pdYsmk6/LL0cR+wPH0MTXNllXPjcvUmJ6r7ZkjUaS1TfVVuA+HxtX8F1IYUcCfCvFHKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774067276; c=relaxed/simple;
	bh=pNN4hBb8lZwBSGAYfJKoU7s49sONueLpgBos8evDX/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GE+a4oiRWWhldhbzhWirlwHpX5yVvm1R2HsbuKUEyrvdH33TLD1DL7CZH5A0rcVm4DW6JzUsutGCFc2biZ5htMGqnoEp4+VusODhhowkVJh/cpvDkLXyay2PKUM03pTd0fa0mHGjO/Pw8gtsm+djK8x8IjuBtSsgO/LQnaqVPxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rlgx/LgC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774067275; x=1805603275;
  h=date:from:to:cc:subject:message-id;
  bh=pNN4hBb8lZwBSGAYfJKoU7s49sONueLpgBos8evDX/8=;
  b=Rlgx/LgCekyyyNt/htiekmRmA+vCwIkTDi1EIk5LB2Ml+H+N/ew4E5h1
   It8IHnM4T3/gKu1jEO1JKZkOb4IQvlkeHwSX3Whmf4KLOlKtFYu4iEWyO
   5yHM/0HlRs6+m1VoxI1uruf8vK0WTFCw7pRT0Pco1n+lJtAaBzFGXAM/y
   Spa4Qz8KBrxd12bDHaEPOWXqrZ3hqeudKHRgqhj/p+Em3iQn8cUTBaPKA
   wYft5V+C+wpcXNUYsi8Fhqpc6L3gdXEHP2WEve6ix00C+KCzKXCpIQG+e
   LWivp6HlZh62SY1VtC0OWkNop2KMI944W394isx4TvyYtcpN/zdad5VY9
   g==;
X-CSE-ConnectionGUID: BrxH1QV7T3SJ7ZArn2IC0w==
X-CSE-MsgGUID: 3VfTfn6OTDSck+Tq+QF/jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75121877"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75121877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 21:27:54 -0700
X-CSE-ConnectionGUID: FHL5clzmRmiVKaXSk73EQA==
X-CSE-MsgGUID: k9pu66oISoWf7T7lBRbSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="261385023"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Mar 2026 21:27:54 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3nwF-000000000IF-18xZ;
	Sat, 21 Mar 2026 04:27:51 +0000
Date: Sat, 21 Mar 2026 12:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.1] BUILD SUCCESS
 cf3a5a77d82cec9f48b4bcb615876d020566e43a
Message-ID: <202603211218.eRomnKAn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30044-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B51492E3417
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.1
branch HEAD: cf3a5a77d82cec9f48b4bcb615876d020566e43a  arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order

elapsed time: 787m

configs tested: 32
configs skipped: 140

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-15.2.0
arc              allnoconfig    gcc-15.2.0
arm              allnoconfig    clang-23
arm              allnoconfig    gcc-15.2.0
arm             allyesconfig    gcc-15.2.0
arm          h3600_defconfig    gcc-15.2.0
arm64           allmodconfig    clang-19
arm64            allnoconfig    gcc-15.2.0
csky             allnoconfig    gcc-15.2.0
hexagon          allnoconfig    gcc-15.2.0
i386             allnoconfig    gcc-15.2.0
loongarch        allnoconfig    gcc-15.2.0
m68k             allnoconfig    gcc-15.2.0
microblaze       allnoconfig    gcc-15.2.0
mips             allnoconfig    gcc-15.2.0
nios2            allnoconfig    clang-23
openrisc         allnoconfig    clang-23
parisc           allnoconfig    clang-23
powerpc          allnoconfig    clang-23
riscv            allnoconfig    clang-23
s390             allnoconfig    clang-23
sh               allnoconfig    clang-23
sh                 defconfig    gcc-14
sparc            allnoconfig    clang-23
sparc64            defconfig    gcc-14
um               allnoconfig    clang-23
um                 defconfig    gcc-14
um            i386_defconfig    gcc-14
um          x86_64_defconfig    gcc-14
x86_64           allnoconfig    clang-23
x86_64             defconfig    gcc-14
xtensa           allnoconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

