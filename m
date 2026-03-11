Return-Path: <linux-renesas-soc+bounces-29174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9j1NIcAGsWnhpwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 07:08:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6425CA6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 07:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94C3630F837D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 06:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3544D3542DE;
	Wed, 11 Mar 2026 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1zcR9ON"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89FC29B795;
	Wed, 11 Mar 2026 06:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209278; cv=none; b=deyq2hlpt95o4RPk+1EMBHYuu9NDEo0jPZWO+DROWDbEOh7h8RsDObuw6s0+mtffQL8vMVb6O1RLcxSFvNUQT4N979F48cfeEXdTDKcg33Qz74nUZZu7RJC4kU91/8haxqCnr1upM/nmHY+1K18JXB7gEO7np8OP46FZx6AOHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209278; c=relaxed/simple;
	bh=69qFIYtyDr9znxfjTU2cf/MvY/d5dOWbtA3vFY5B9f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7MLvJW5rRjylhLIALxQzVzSEDo/FOBRgv0vnnnUmWD5mhub8e/78SwCEc3rRSeTFN5lV0YvXth6K85QgnY5QggrgiKIURUeqpH/0pBOkBWfipReMfauX07oJaRc3MYSagqcW+Hb1wYHBfM68keCw0zjRrhn05QthZU2F6YkT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1zcR9ON; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773209276; x=1804745276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=69qFIYtyDr9znxfjTU2cf/MvY/d5dOWbtA3vFY5B9f4=;
  b=Q1zcR9ON6pJRl7ibNLcL61NcOTlXUTspS5ZWsWqrAAz16KP4hZklUJ/s
   Z3GDAnO+zFm91d7F/H37Py/uocfB83jnN0ahXtpDBwlAyfrZzIQR7AVK0
   8bvPJH5Siz2vJatmj/6ENUpY4GDil2s19gCUVNVQZ6EVHxbgsVNT7oBTo
   GwoNzWXA1ogUe2YTySg3XMuZjFzR4Zf+Bd6NIvyKzT+QKN+NfeWWoKdM1
   KrULDOpzmuM7OrZsqo26UgswgoOzd0TbF4e95cgC1hSeKPvFUKBhvilmI
   avp5C0OBsnozmqs2MiSFHuzgwxUKualxL2wBd4qB/RXmzhPW+OZURohEn
   A==;
X-CSE-ConnectionGUID: ua5w7RbMQ1uIKfSM6jNB8Q==
X-CSE-MsgGUID: 90B5BJdgRiCThNmz81mB1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84975135"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84975135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 23:07:55 -0700
X-CSE-ConnectionGUID: Xmc022qnT6WtfTEcvw9BXA==
X-CSE-MsgGUID: p4Bvvj27TQ+YgBR+E2RUsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="250861493"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2026 23:07:50 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0CjS-000000000mj-1txg;
	Wed, 11 Mar 2026 06:07:46 +0000
Date: Wed, 11 Mar 2026 14:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: Re: [PATCH 5/5] watchdog: rzn1: Add support for direct hardware reset
Message-ID: <202603111437.eGpzXcOB-lkp@intel.com>
References: <20260310173249.161354-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310173249.161354-6-herve.codina@bootlin.com>
X-Rspamd-Queue-Id: DCB6425CA6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29174-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Herve,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on geert-renesas-drivers/renesas-clk geert-renesas-devel/next groeck-staging/hwmon-next linus/master v7.0-rc3 next-20260310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-Schneider-Electric/watchdog-rzn1-Fix-reverse-xmas-tree-declaration/20260311-015157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260310173249.161354-6-herve.codina%40bootlin.com
patch subject: [PATCH 5/5] watchdog: rzn1: Add support for direct hardware reset
config: x86_64-buildonly-randconfig-003-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111437.eGpzXcOB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111437.eGpzXcOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111437.eGpzXcOB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/watchdog/rzn1_wdt.c:20:
>> include/linux/soc/renesas/r9a06g032-sysctrl.h:17:53: warning: declaration of 'enum r9a06g032_sysctrl_rst_src' will not be visible outside of this function [-Wvisibility]
      17 | static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
         |                                                     ^
>> include/linux/soc/renesas/r9a06g032-sysctrl.h:17:79: error: variable has incomplete type 'enum r9a06g032_sysctrl_rst_src'
      17 | static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
         |                                                                               ^
   include/linux/soc/renesas/r9a06g032-sysctrl.h:17:53: note: forward declaration of 'enum r9a06g032_sysctrl_rst_src'
      17 | static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
         |                                                     ^
>> drivers/watchdog/rzn1_wdt.c:105:33: error: variable has incomplete type 'enum r9a06g032_sysctrl_rst_src'
     105 |         enum r9a06g032_sysctrl_rst_src rst_src;
         |                                        ^
   drivers/watchdog/rzn1_wdt.c:105:7: note: forward declaration of 'enum r9a06g032_sysctrl_rst_src'
     105 |         enum r9a06g032_sysctrl_rst_src rst_src;
         |              ^
>> drivers/watchdog/rzn1_wdt.c:119:13: error: use of undeclared identifier 'R9A06G032_RST_WATCHDOG_CA7_0'
     119 |                 rst_src = R9A06G032_RST_WATCHDOG_CA7_0;
         |                           ^
>> drivers/watchdog/rzn1_wdt.c:122:13: error: use of undeclared identifier 'R9A06G032_RST_WATCHDOG_CA7_1'
     122 |                 rst_src = R9A06G032_RST_WATCHDOG_CA7_1;
         |                           ^
   1 warning and 4 errors generated.


vim +17 include/linux/soc/renesas/r9a06g032-sysctrl.h

21c34edbcc67b0 Herve Codina (Schneider Electric  2026-03-10  14) 
885525c1e7e27e Miquel Raynal                     2022-04-27  15  #else
885525c1e7e27e Miquel Raynal                     2022-04-27  16  static inline int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val) { return -ENODEV; }
21c34edbcc67b0 Herve Codina (Schneider Electric  2026-03-10 @17) static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
21c34edbcc67b0 Herve Codina (Schneider Electric  2026-03-10  18) {
21c34edbcc67b0 Herve Codina (Schneider Electric  2026-03-10  19) 	return -ENODEV;
21c34edbcc67b0 Herve Codina (Schneider Electric  2026-03-10  20) }
885525c1e7e27e Miquel Raynal                     2022-04-27  21  #endif
885525c1e7e27e Miquel Raynal                     2022-04-27  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

