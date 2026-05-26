Return-Path: <linux-renesas-soc+bounces-33135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIv9CDVNFWoIUQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:35:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BAC5D1BDA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADFE43003484
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 07:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1162B3CB8F4;
	Tue, 26 May 2026 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzKd/TWc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067823CB8E3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780911; cv=none; b=ZsQGKIXl7Qz+1TvIglKrmdrkxDx4+wcNmBKSM4qq7cXE51F+hQdD1msmgs7fV/+yQnnuE4odSV1dXwSti32G+g3Wi/ozrNyUX5Zw+N4LBg3sFq//klxrZHCbFwomQkeQZVwFkhOxy5rUXM07XaHA43GQzNeXWMlbrZNQRGgPFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780911; c=relaxed/simple;
	bh=pM6gb96Uc7J7i5tjT061qzccy4DTtI88BnKwFnoFOXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AbqDkTSAVN/xWo1Td0t5zrZqw6jfZ8x7XiKd8HdjHO+ldYuzaBxCmvnmrTR7Zb6tNp8aY5o/TO27+WK+FW2ZI3U4CwL89jOgfoFITcdg3pw5kdxCePInurgGil65bNNv7jHZheJhKR6CIOf0mm73psrd7zidLdurh0aOQa6khTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzKd/TWc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779780909; x=1811316909;
  h=date:from:to:cc:subject:message-id;
  bh=pM6gb96Uc7J7i5tjT061qzccy4DTtI88BnKwFnoFOXo=;
  b=nzKd/TWcZMD6mBNmPJxW/p6nRMjWCX8CaNjJrkwv18rha2Tj2QZDwvfQ
   2+LKU5oQgx037phbQ3ZXHS55FTpt8WGoxAI7DUx7vjTVIGvX9B07PZL9S
   UFEcbE+fTSY4oKoxnuCf9zoFyZr/JkS3lB9JzovvHPZ4gU4YCHs9MICoo
   ZSZtce9Kov6Z4kkk57yRJwm6FZad3n4ryUPKIQR6s60z8MqBvyGTgFgrZ
   rc7Fp46K19ZseqJlkyQjeg5gstD1Ofg5bQm0c78uhMXdIItNC+UOl+DYm
   Qr0dqGsur/0Q6ClwAF41Nx/95wAQk+RN2suBM4PHvkA6V2csscW7tUGQy
   A==;
X-CSE-ConnectionGUID: RdnCyvSPReuM3Xy82UIXJQ==
X-CSE-MsgGUID: BHqLHRl1R3mOYB86YqF+0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84474088"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="84474088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 00:35:09 -0700
X-CSE-ConnectionGUID: OrPa44/aSM2Omx0wN3OYpw==
X-CSE-MsgGUID: xfY5KIu9Tf2utSMVzLfpZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="243665698"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2026 00:35:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRmJc-000000002DK-1z3G;
	Tue, 26 May 2026 07:35:04 +0000
Date: Tue, 26 May 2026 15:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 e2bc40aa4828ef4c81b7346de1f4e5ef6477a3e5
Message-ID: <202605261543.xiIqDWvq-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33135-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 29BAC5D1BDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: e2bc40aa4828ef4c81b7346de1f4e5ef6477a3e5  Merge branches 'renesas-drivers-for-v7.2' and 'renesas-dts-for-v7.2' into renesas-next

elapsed time: 930m

configs tested: 79
configs skipped: 3

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
arm64                randconfig-001    gcc-8.5.0
arm64       randconfig-002-20260526    gcc-8.5.0
arm64                randconfig-003    clang-23
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260526    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon     randconfig-001-20260526    clang-20
hexagon     randconfig-002-20260526    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch               allnoconfig    clang-23
loongarch   randconfig-001-20260526    gcc-15.2.0
loongarch   randconfig-002-20260526    clang-20
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
nios2       randconfig-001-20260526    gcc-11.5.0
nios2       randconfig-002-20260526    gcc-8.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260526    gcc-15.2.0
parisc      randconfig-002-20260526    gcc-14.3.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260526    clang-23
powerpc     randconfig-002-20260526    clang-19
powerpc64   randconfig-001-20260526    gcc-15.2.0
powerpc64   randconfig-002-20260526    gcc-10.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390                 randconfig-001    gcc-11.5.0
s390        randconfig-002-20260526    clang-23
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                   randconfig-001    gcc-15.2.0
sh          randconfig-001-20260526    gcc-10.5.0
sh                   randconfig-002    gcc-14.3.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64      randconfig-001-20260526    gcc-14
x86_64      randconfig-002-20260526    clang-20
x86_64      randconfig-003-20260526    gcc-14
x86_64      randconfig-004-20260526    clang-20
x86_64      randconfig-005-20260526    gcc-14
x86_64      randconfig-006-20260526    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

