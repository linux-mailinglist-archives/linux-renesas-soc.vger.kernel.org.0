Return-Path: <linux-renesas-soc+bounces-32623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ29EJbFBWrDbAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:52:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A53C0541F2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7177E306B3A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 12:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1866D2DD60E;
	Thu, 14 May 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j45x8lE0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D70286D5C;
	Thu, 14 May 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763065; cv=none; b=oJUG2qpx5KM4mwYC++EXEIMHYCtpDCiUIAxRxSpa0oRNLbQgUfisluwIV68OgbnFSg/IhszxMojkk/ek2S0QhGam5PNk8Ogzc1AabvU9PweGwYO5TEEDVCQwpEtaeSzXC9InKtOCrNJ2eemg9JRNtNyFu7ZdiGWCg0CyhbvcVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763065; c=relaxed/simple;
	bh=T6e1Sy8/8NgyzN/WXbmfEYNcRDAnhEjQBXWZGy3LDwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlTA3mwxoFlsOdY5fY+KgcFLFFUpumH6MZxOd08d4jI0eavrIrwSQwfLJdO7lZRzIMFvvKxomOtYZEfSFW6Jhl5L2va5ruA5Qbq/xm/pGdOXTUGtwSUSMIT5BDn4jxqQ6swgSor1AZgbdaVP9Pf8lLqYB0P2/uxiWsZl8FLKR1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j45x8lE0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778763064; x=1810299064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6e1Sy8/8NgyzN/WXbmfEYNcRDAnhEjQBXWZGy3LDwE=;
  b=j45x8lE0t8GVbQZrlylp2KdE47FG4oTEmrXKxuRCdCvCEdFnPwz0+ITd
   bEj8YCyxn1T+sOHNY1NihIjW7f92iFVN7BnCxqxxLAl320FvM42HXbKJd
   A2GzdHTMPAP2hSLuhrYAAgBGUAz5z+k/nuTsZ+Wvokv9JmCIhPGHCiUJ6
   AfZ3VCrzzzsPHS8fSShuB94zN+1M+iou0RVGyr28FjuQrxOtPT+Xp86dp
   9WRHt2YsrBOuxTeGSfwT9xV3+1/2bsGONN9FjvFPLuzbxl4XVpYp2gPLX
   kL7z1WMEsNa34YZ/4nPqiOC1nFlWvbvwrfZQxgMD5JYiwilVS5WcmDbKx
   A==;
X-CSE-ConnectionGUID: cbWJlWolSv+uNGDSypJxkw==
X-CSE-MsgGUID: 2bOk1rGyRoq7hgWmpl9YhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90806968"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90806968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:51:04 -0700
X-CSE-ConnectionGUID: OoEm0waPTuODUxq408AFCA==
X-CSE-MsgGUID: pz6o/H9EThWOPESAHnbf6A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2026 05:50:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNVWi-000000008ob-0WmY;
	Thu, 14 May 2026 12:50:56 +0000
Date: Thu, 14 May 2026 14:50:17 +0200
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, s-vadapalli@ti.com,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
Message-ID: <202605141445.2Ag4i8fZ-lkp@intel.com>
References: <20260506152346.166056-9-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506152346.166056-9-18255117159@163.com>
X-Rspamd-Queue-Id: A53C0541F2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32623-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,ti.com,vger.kernel.org,lists.infradead.org,163.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a293ec25d59dd96309058c70df5a4dd0f889a1e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-Add-pcie_wait_after_link_train-helper/20260514-132815
base:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
patch link:    https://lore.kernel.org/r/20260506152346.166056-9-18255117159%40163.com
patch subject: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link training
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260514/202605141445.2Ag4i8fZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141445.2Ag4i8fZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141445.2Ag4i8fZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/hotplug/pciehp_ctrl.c:24:
   drivers/pci/hotplug/../pci.h: In function 'pcie_wait_after_link_train':
   drivers/pci/hotplug/../pci.h:73:17: error: implicit declaration of function 'msleep' [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^~~~~~
   In file included from drivers/pci/hotplug/pciehp.h:21,
                    from drivers/pci/hotplug/pciehp_ctrl.c:25:
   include/linux/delay.h: At top level:
>> include/linux/delay.h:61:6: warning: conflicting types for 'msleep'; have 'void(unsigned int)'
      61 | void msleep(unsigned int msecs);
         |      ^~~~~~
   drivers/pci/hotplug/../pci.h:73:17: note: previous implicit declaration of 'msleep' with type 'void(unsigned int)'
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^~~~~~


vim +61 include/linux/delay.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  56  
f3f3149f35b919 Alok Kataria     2008-06-23  57  extern unsigned long lpj_fine;
^1da177e4c3f41 Linus Torvalds   2005-04-16  58  void calibrate_delay(void);
ad1a48301f659a Arnd Bergmann    2023-05-17  59  unsigned long calibrate_delay_is_known(void);
8496ecd0bed4c7 Valdis Kletnieks 2019-03-07  60  void __attribute__((weak)) calibration_delay_done(void);
^1da177e4c3f41 Linus Torvalds   2005-04-16 @61  void msleep(unsigned int msecs);
^1da177e4c3f41 Linus Torvalds   2005-04-16  62  unsigned long msleep_interruptible(unsigned int msecs);
e4779015fd5d2f SeongJae Park    2021-12-10  63  void usleep_range_state(unsigned long min, unsigned long max,
e4779015fd5d2f SeongJae Park    2021-12-10  64  			unsigned int state);
e4779015fd5d2f SeongJae Park    2021-12-10  65  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

