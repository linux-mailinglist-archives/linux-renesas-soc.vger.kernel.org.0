Return-Path: <linux-renesas-soc+bounces-33229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHyPOmsYF2pR4QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:14:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D665E7918
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97452307F53D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4953E5A06;
	Wed, 27 May 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwlYkvk1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90AE175A77
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898043; cv=none; b=K0B7Ag+0dQkDD9kAMSO2KUOkagQtwgHoYQTcz137wbizXlZb6U+RCoo5DjGnUsr1KWR0jkJtsxB944pWul5m0iW1dmS1TeBgsvBQqUqkkMoArhOp8wHhb1fNkgHW/cRj7MgL9YWT5U9Vt4yeGvJxltwUqRIlKf8SiWUFy5GWhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898043; c=relaxed/simple;
	bh=nJx3n9ML4A9LPq9ruQu2v5x5PuICPTSxT/OjB8H5B6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZ2nF8wYuOMmgXbO4AK0Icnfz0AfG5RuLbPOTLAiI5Mv3KJPdQYytoZTedUZp/SvGelvEZmx4ki2Un844FAELqR6uZRvJtkHmtsd73YILjvj2eLtPedOV9Ff8Jdo4Sin1J3BoYG3Odp+z+yKcrgUSpW6nQO3wC16iC12H+WScNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwlYkvk1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779898041; x=1811434041;
  h=date:from:to:cc:subject:message-id;
  bh=nJx3n9ML4A9LPq9ruQu2v5x5PuICPTSxT/OjB8H5B6U=;
  b=CwlYkvk1nRhHl10xE8gM6p4cnIsK3vHU8szOt72cHZ2uDfKdewTwR+9Z
   eQypEBZD0uArua8W21HCn3nOpOxP3tleuro2NmH2k8KgC1bmaEpRBrG7L
   WtSVTj6Pet+OUj71suDvF70aY8chaqqiZa4Ua9/2anSVSQ+e04X8Nk2yP
   HHbVSQzC5+q0zVTuJ5UL3BT/Y8H1u78CL+ZwBWqo3TE582ri8RMYq4yx2
   pEkG7D5n7YVtELD3Lf+u3vvf2y3NxG0KfmP6xpiZ+R9Tl87NUaOoSTnIq
   mhyhcekFb8ESd0Y2iDvyzLaUEjuR/BnwNhQ9aN6icZt3IASvtyfd9UvPT
   A==;
X-CSE-ConnectionGUID: 3i5HFJ+gSCif0kr0dyAjbA==
X-CSE-MsgGUID: vtejfIL4SpKkxKZUMwezHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="68262105"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="68262105"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 09:07:17 -0700
X-CSE-ConnectionGUID: Hrbvo8j1SqGqbfKu6ABYow==
X-CSE-MsgGUID: XqxVoNHJQWKa/IVo0lAtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="242349281"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 May 2026 09:07:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSGmn-0000000049a-42YN;
	Wed, 27 May 2026 16:07:13 +0000
Date: Thu, 28 May 2026 00:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 56bd75867f26ef97af2b7e3663b36975062e894e
Message-ID: <202605280024.Nh5wlYNq-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33229-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 59D665E7918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 56bd75867f26ef97af2b7e3663b36975062e894e  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1441m

configs tested: 59
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-15.2.0
alpha           allyesconfig    gcc-15.2.0
arc             alldefconfig    gcc-15.2.0
arc             allmodconfig    gcc-15.2.0
arc              allnoconfig    gcc-15.2.0
arc             allyesconfig    gcc-15.2.0
arm              allnoconfig    clang-23
arm             allyesconfig    gcc-15.2.0
arm64           allmodconfig    clang-19
arm64            allnoconfig    gcc-15.2.0
csky            allmodconfig    gcc-15.2.0
csky             allnoconfig    gcc-15.2.0
hexagon         allmodconfig    clang-17
hexagon          allnoconfig    clang-23
i386             allnoconfig    gcc-14
loongarch       allmodconfig    clang-19
loongarch        allnoconfig    clang-23
m68k            allmodconfig    gcc-15.2.0
m68k             allnoconfig    gcc-15.2.0
m68k            allyesconfig    gcc-15.2.0
microblaze       allnoconfig    gcc-15.2.0
microblaze      allyesconfig    gcc-15.2.0
mips            allmodconfig    gcc-15.2.0
mips             allnoconfig    gcc-15.2.0
mips            allyesconfig    gcc-15.2.0
nios2           allmodconfig    gcc-11.5.0
nios2            allnoconfig    gcc-11.5.0
openrisc        allmodconfig    gcc-15.2.0
openrisc         allnoconfig    gcc-15.2.0
openrisc           defconfig    gcc-15.2.0
parisc          allmodconfig    gcc-15.2.0
parisc           allnoconfig    gcc-15.2.0
parisc          allyesconfig    gcc-15.2.0
powerpc         allmodconfig    gcc-15.2.0
powerpc          allnoconfig    gcc-15.2.0
riscv           allmodconfig    clang-23
riscv            allnoconfig    gcc-15.2.0
riscv           allyesconfig    clang-16
s390            allmodconfig    clang-18
s390             allnoconfig    clang-23
s390            allyesconfig    gcc-15.2.0
sh              allmodconfig    gcc-15.2.0
sh               allnoconfig    gcc-15.2.0
sh              allyesconfig    gcc-15.2.0
sh                 defconfig    gcc-15.2.0
sparc            allnoconfig    gcc-15.2.0
sparc              defconfig    gcc-15.2.0
sparc64         allmodconfig    clang-23
sparc64            defconfig    clang-20
um              allmodconfig    clang-19
um               allnoconfig    clang-23
um              allyesconfig    gcc-14
um                 defconfig    clang-23
um            i386_defconfig    gcc-14
um          x86_64_defconfig    clang-23
x86_64           allnoconfig    clang-20
x86_64             defconfig    gcc-14
xtensa           allnoconfig    gcc-15.2.0
xtensa          allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

