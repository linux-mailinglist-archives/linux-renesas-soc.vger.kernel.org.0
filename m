Return-Path: <linux-renesas-soc+bounces-34102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YUbwFHPCMWoYpwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 23:38:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94C69570D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 23:38:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CLSmn5jb;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AE31304B68F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 21:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FD22750ED;
	Tue, 16 Jun 2026 21:38:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D25D331EA5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 21:38:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781645936; cv=none; b=bwpZTq5aMvfDYcnOSjFGoRKYtdrJUrrrl8yUd9zVsM6rvwNYKaedSFGBxC8b6pR1kiVlzmn9oxz5t+auuS/OLG+myUO9Xf5U2B+HUKdzZATnlSStLDy6UGg4hsCu3wMPWPma9K+/c1dAzaNhEtjxuyB28RGFDIT8MYmrXSjbHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781645936; c=relaxed/simple;
	bh=2x7yBApnc7JBCpmohBrNtO7IySFTM/0GpNXFoblJaiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pBO7fe8eUbpv/bWyo95oDNOmIT8zJ1gTXOXqh2BjbcI1UyofjL69VmKjAvpx2evW+DFB6INzuoGvt1V+1gKxrUfNBtYrQwtf/ch6URO2FITfBXdzAN/oDNxiQo8L+d6KG+BHClRbMuKcYSAKM1s03D8plR+1x5e8z9OQ3/c4grk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLSmn5jb; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781645936; x=1813181936;
  h=date:from:to:cc:subject:message-id;
  bh=2x7yBApnc7JBCpmohBrNtO7IySFTM/0GpNXFoblJaiA=;
  b=CLSmn5jbecEUyB2D5NsXvO8P+4tCdDUfqEgkxTGtDqnTpAjtB8Dg4ozs
   uu5UDLvjM5qsfqTaHPyjsOFCQz5MnnjevFObZREbS4mhm9M6MjJF9tkAu
   U8Kj9O5ZrtOFkj8m73pYg4QT7Wpf2jhgiLx2kYsUH84RvU8pJUwP5wvq4
   v4PHWxlMJ3X94kiViXhS8ytMObLodNvvYW/WwL/GHbf6cWFHu+xRHxR7+
   w6d4Wv5Emu1YhwuSEaqyTdet13yHUNkDW1Es/AYYMYu4Opx8Ir/KCyZ0Q
   1hj8ZvKp1NgViJrn0FWpaFricqgX7CUKJyioIk4a2wwvfcbaFxSROYacq
   g==;
X-CSE-ConnectionGUID: QIwg0mAWQcyrZ06zDTfEUg==
X-CSE-MsgGUID: R+EJQT0HSu+MJIyD1CcxIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="107870306"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="107870306"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 14:38:55 -0700
X-CSE-ConnectionGUID: /2WcUkHIS6+JaaT8szdnxQ==
X-CSE-MsgGUID: GkAyXr0ySUm/cKYIbgVy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247972484"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2026 14:38:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZbUg-00000000Tm6-1S2Z;
	Tue, 16 Jun 2026 21:38:50 +0000
Date: Wed, 17 Jun 2026 05:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v7.3] BUILD SUCCESS
 ed0c053a699863795a6523b0bf664179ff2fcab5
Message-ID: <202606170509.KSMAEam5-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34102-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C94C69570D

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.3
branch HEAD: ed0c053a699863795a6523b0bf664179ff2fcab5  clk: renesas: r9a09g047: Add audio clock and reset support

elapsed time: 15863m

configs tested: 36
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-16.1.0
arc          allnoconfig    gcc-16.1.0
arc         allyesconfig    gcc-16.1.0
arm          allnoconfig    clang-23
arm64        allnoconfig    gcc-16.1.0
csky        allmodconfig    gcc-16.1.0
csky         allnoconfig    gcc-16.1.0
hexagon     allmodconfig    clang-23
hexagon      allnoconfig    clang-23
i386         allnoconfig    gcc-14
loongarch   allmodconfig    clang-19
loongarch    allnoconfig    clang-20
m68k         allnoconfig    gcc-16.1.0
microblaze   allnoconfig    gcc-16.1.0
mips        allmodconfig    gcc-16.1.0
mips         allnoconfig    gcc-16.1.0
mips        allyesconfig    gcc-16.1.0
nios2       allmodconfig    gcc-11.5.0
nios2        allnoconfig    gcc-11.5.0
openrisc     allnoconfig    gcc-16.1.0
parisc      allmodconfig    gcc-16.1.0
parisc       allnoconfig    gcc-16.1.0
parisc      allyesconfig    gcc-16.1.0
powerpc     allmodconfig    gcc-16.1.0
powerpc      allnoconfig    gcc-16.1.0
riscv        allnoconfig    gcc-16.1.0
s390         allnoconfig    clang-23
s390        allyesconfig    gcc-16.1.0
sh          allmodconfig    gcc-16.1.0
sh           allnoconfig    gcc-16.1.0
sh          allyesconfig    gcc-16.1.0
sparc        allnoconfig    gcc-16.1.0
um           allnoconfig    clang-16
um          allyesconfig    gcc-14
x86_64       allnoconfig    clang-22
xtensa       allnoconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

