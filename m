Return-Path: <linux-renesas-soc+bounces-29169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIg5MaTPsGmLnQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 03:12:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AEA25AC3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 03:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C23C3046AAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 02:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114B033B97B;
	Wed, 11 Mar 2026 02:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fN2QPk14"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D8280CC1;
	Wed, 11 Mar 2026 02:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195170; cv=none; b=ktjo1F4ab0wkSC9Z0OxMxbxClJqZ5AYC1+oC32n0YRsJZftE8UHua9mCJeQBYYuAO//2cxrvvSaeLJ3X2nRLNflIK01AJ+gQPwHhzRamGhDeE3b0u4nz8jUZ1FlApN6CV/v5Rd8VLQ/tQrIN8kbiQ3+3WDpeCR2w/r9/ai664B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195170; c=relaxed/simple;
	bh=KB/sq5U3IVt7/eQ9Hys5pK6/LhuDUGAblBCNznNafM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hO1mHuGimX9jbeV/Sz5ri//stWTyg+9W0RQuNGqcukxl3Tnpvh366K/J5+i/G3LApuNm/BZQt8JzBmJTIXDRbZcnYwbHDcKtGEIFLry3EGM7zLEYR94aPTCtYDjFQlLJNvr0yXVP3tWVDFIc/Jv1XZ24Qx8oiGI/FV5cwiawOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fN2QPk14; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773195168; x=1804731168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KB/sq5U3IVt7/eQ9Hys5pK6/LhuDUGAblBCNznNafM4=;
  b=fN2QPk141REsUcgHzPtVeyNcqqaNJFoKkWL7+Aq5OOFphBoB2AfZEFGo
   YginIpyD1m5M5aV+/5QEqdbyKXsgQIu72/XNLxjY2stf/YkNhHTGS3bBq
   2Sxy8NjJljVAkzGwqMEstB8xPyY5bIyoNYG7nahmy/vvH92j8Vwzjf5wg
   JNSFAwIof6IKVIJIsoSA4gS7SW4APJjaeHqlIapaJ8GvGn2QzxnCUud0e
   lRmnjgO+XtXXipXCrGguVETgxJ3ooK1W7vrD1/0T+uMaG+5frOdBj/tTu
   iV7drKoanWkwcEtA59ZRFeqKgGa06iFCs8nROdXtAPxkAqle7jwkOfurp
   A==;
X-CSE-ConnectionGUID: b/eE6XhMSfiPUNtGOu5+ZA==
X-CSE-MsgGUID: Zbtw8EAWRhWhtCqX4dKBZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74153579"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74153579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 19:12:48 -0700
X-CSE-ConnectionGUID: bUUejISQS/COrIPwIlceTQ==
X-CSE-MsgGUID: ulxFzHbPT92p83ES7rbr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220482039"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 19:12:42 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w093v-000000000Z3-1rDo;
	Wed, 11 Mar 2026 02:12:39 +0000
Date: Wed, 11 Mar 2026 10:12:13 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: Re: [PATCH 5/5] watchdog: rzn1: Add support for direct hardware reset
Message-ID: <202603111012.xhKbu8oc-lkp@intel.com>
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
X-Rspamd-Queue-Id: 40AEA25AC3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29169-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url]
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
config: arm-randconfig-002-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111012.xhKbu8oc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111012.xhKbu8oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111012.xhKbu8oc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/watchdog/rzn1_wdt.c:20:
>> include/linux/soc/renesas/r9a06g032-sysctrl.h:17:53: warning: 'enum r9a06g032_sysctrl_rst_src' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/soc/renesas/r9a06g032-sysctrl.h:17:79: error: parameter 1 ('rst_src') has incomplete type
    static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
                                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
>> include/linux/soc/renesas/r9a06g032-sysctrl.h:17:19: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/rzn1_wdt.c: In function 'rzn1_wdt_setup_rst_line':
>> drivers/watchdog/rzn1_wdt.c:105:33: error: storage size of 'rst_src' isn't known
     enum r9a06g032_sysctrl_rst_src rst_src;
                                    ^~~~~~~
>> drivers/watchdog/rzn1_wdt.c:119:13: error: 'R9A06G032_RST_WATCHDOG_CA7_0' undeclared (first use in this function)
      rst_src = R9A06G032_RST_WATCHDOG_CA7_0;
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/rzn1_wdt.c:119:13: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/watchdog/rzn1_wdt.c:122:13: error: 'R9A06G032_RST_WATCHDOG_CA7_1' undeclared (first use in this function)
      rst_src = R9A06G032_RST_WATCHDOG_CA7_1;
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/watchdog/rzn1_wdt.c:105:33: warning: unused variable 'rst_src' [-Wunused-variable]
     enum r9a06g032_sysctrl_rst_src rst_src;
                                    ^~~~~~~
   cc1: some warnings being treated as errors


vim +17 include/linux/soc/renesas/r9a06g032-sysctrl.h

21c34edbcc67b03 Herve Codina (Schneider Electric  2026-03-10  14) 
885525c1e7e27ea Miquel Raynal                     2022-04-27  15  #else
885525c1e7e27ea Miquel Raynal                     2022-04-27  16  static inline int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val) { return -ENODEV; }
21c34edbcc67b03 Herve Codina (Schneider Electric  2026-03-10 @17) static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
21c34edbcc67b03 Herve Codina (Schneider Electric  2026-03-10  18) {
21c34edbcc67b03 Herve Codina (Schneider Electric  2026-03-10  19) 	return -ENODEV;
21c34edbcc67b03 Herve Codina (Schneider Electric  2026-03-10  20) }
885525c1e7e27ea Miquel Raynal                     2022-04-27  21  #endif
885525c1e7e27ea Miquel Raynal                     2022-04-27  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

