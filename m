Return-Path: <linux-renesas-soc+bounces-26695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C34AD1AEDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 20:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 536ED3012268
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 19:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287C12D47E1;
	Tue, 13 Jan 2026 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/rgtU3A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3BA41
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768330961; cv=none; b=ByYfYNATPjXWzMYCtfN0A7x1Ek2G6w1yCU0uyo8OtdixOnv4KJlBNgsW08p4x8LbQS7IoKrXAFbwpm4JEwftEXDlnQZLO2Ugz4xaPBhcghU9eFL+ckxC3VJyTm/KN1ulborT1XylG3X1wHeFO0Quo39hd+BNobTEZNiQAbkUYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768330961; c=relaxed/simple;
	bh=DVG5V6pRmTUH6lRH0AkErLl1PuE7Vum2OnJivBKJnjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nSu42Z+nn6OEjHFIuHlpEy9xUcohJTPx2Amc3UfG7wfZ5wwj1ZPuWETv7P6K4yJRMSvcPlVUHthZ2oubi3AKsxqA5KQBoa91BHw1aTKhXqN9niqORVl7qNWlllzllAkaqWMZHBoNy895uRuaesyuS0lkN8T97pvlUMia/TsLFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/rgtU3A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768330960; x=1799866960;
  h=date:from:to:cc:subject:message-id;
  bh=DVG5V6pRmTUH6lRH0AkErLl1PuE7Vum2OnJivBKJnjI=;
  b=h/rgtU3A6sZE9P+Vebe7CDbAjk9tcnnMa7g6bD0Oxx3niK3163PfEUs+
   Fng2NRlakqI1HypQvr/fCIIIQqwRobkmxfnOD1gS415YbVpMo1prCsdve
   Rl/mDLMJzzGz4URfe3mh/XnnWcsOnsQvyACZUJAZck5AdXG9lKjGqFiE9
   WJ+xW92SK6Pond3EhhWkOVFty/XirgriJTUNj13ukH4AsEJm1lnvhWF8F
   NSMy2CDlRaYkHQ3T3ty1N0jKJDJMcDQcUsQTMMhUwymBh+uhAltvGOvMF
   OLZhqfMPt4TPOlhOcj8WhAp4q8g7H8gCX76EubWmMzcZJK7cIaVUhnjws
   A==;
X-CSE-ConnectionGUID: 9AhrnvqxRjqB67CQ5RmP3Q==
X-CSE-MsgGUID: Rm3gdEBERUW5qDhGiWnqCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69705725"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69705725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:02:39 -0800
X-CSE-ConnectionGUID: mCzowF1aQuKUuK60/L3Ltg==
X-CSE-MsgGUID: wQFznltmT9mtIf77XPqwEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204744075"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 11:02:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfjf1-00000000FFk-3UnP;
	Tue, 13 Jan 2026 19:02:35 +0000
Date: Wed, 14 Jan 2026 03:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a09g077-dt-binding-defs]
 BUILD SUCCESS 481b64376c3fb72557725acf2f4fbc4f73bc3188
Message-ID: <202601140302.ZHnGjRVN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a09g077-dt-binding-defs
branch HEAD: 481b64376c3fb72557725acf2f4fbc4f73bc3188  dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID

elapsed time: 7735m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-22
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-22
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-22
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-22
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-22
um           allmodconfig    clang-19
um            allnoconfig    clang-22
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

