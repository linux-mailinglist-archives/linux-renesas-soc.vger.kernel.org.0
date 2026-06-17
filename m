Return-Path: <linux-renesas-soc+bounces-34105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DkYOKi/0MWrPswUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 03:11:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FB695EA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 03:11:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="mz/lPagQ";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D8DF306A9BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 01:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D3F282F25;
	Wed, 17 Jun 2026 01:11:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83148282F16
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 01:11:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781658663; cv=none; b=TlMR13u73w1Dqt6k4LXF3qWgNaYUYqTD/b+VOsmtYsK6Go3744XKEtXeURgs55JoBpwXlZ+iTOqZQQ56ecnPdcrSevWwHXquJm9GhmIE7y7fKNbQrfahiDVXYZESaYB8w1sjZFco+cyy+4uF5oZLmrIzPqxQgg4XIbRrPqr9F1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781658663; c=relaxed/simple;
	bh=YTo7jyNDDPojyrC79opv0HlXWGFuaRe/IqUQqEL5e+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=adHlVv4tk79WtccdngzTEepbOwf9COD8bckZ98nHcaM3BPyeglKL4JMne3TzUAeeVMhar0J++vJTX3FuJMTXP8Riru9Lw+W9Hgb3RxLUV7x1XyUJsDa0EQspEJcyOHlPUL1QihAVQNuiqh5XEyTdCpBkpOUkDk+IucBy9a4f5/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mz/lPagQ; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781658662; x=1813194662;
  h=date:from:to:cc:subject:message-id;
  bh=YTo7jyNDDPojyrC79opv0HlXWGFuaRe/IqUQqEL5e+0=;
  b=mz/lPagQqTkN6Kvyi+XmKHd7e7TXVu5ioTiRm3TgxEX/9BZ3t04ccvkq
   KJRxJYFZ9I0+20I+MTG718qls19a9HGZnmatU5H50PIyrxm7ZHbeUxtve
   rsNdMoANyKNhwl3MOqVnHo9Nh2tksGm0M6snbCbF4blDAN68UTWKB1gjy
   CQrZxWgretBofIogqNE8AEuABXMxkWXL8QzqlODt4I3aO89EuMlgIAPJJ
   sirMtPT7dOQtvSocyCRHrKhuODcXRSKMpzr+HE0VOFuOfdsQlHpCcmna9
   PZF4RmoOiWc1/TZp99y76GzjKvTdVQSpKJg6Gw+i423xukgnER5VOgmHR
   g==;
X-CSE-ConnectionGUID: kCE6xiiJRBCYX7RcXpo/Dw==
X-CSE-MsgGUID: FWLOVxx0TQmlpxLq64lPGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="81573440"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="81573440"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 18:11:01 -0700
X-CSE-ConnectionGUID: UCkXbrwTQ4uaSEK8/jYv4w==
X-CSE-MsgGUID: rXpxqxCdQKmolfEf0UzYjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="249835191"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2026 18:11:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZenx-00000000TyK-2lh7;
	Wed, 17 Jun 2026 01:10:57 +0000
Date: Wed, 17 Jun 2026 09:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v7.3] BUILD
 SUCCESS d81fa6c25e4eac71e14e5bbcdf2964e8c1a12ecb
Message-ID: <202606170924.1dPeetKD-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34105-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A34FB695EA3

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v7.3
branch HEAD: d81fa6c25e4eac71e14e5bbcdf2964e8c1a12ecb  pinctrl: renesas: rza2: Embed pins in the priv struct

elapsed time: 16074m

configs tested: 51
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-23
arm64         allnoconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-23
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-20
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-23
s390         allmodconfig    clang-23
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-23
um            allnoconfig    clang-16
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

