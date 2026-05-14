Return-Path: <linux-renesas-soc+bounces-32615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KcTGwy+BWpZaAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:20:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D554183F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7912930302B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 12:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CE43D7D89;
	Thu, 14 May 2026 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vsfs4Hfp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801B3AEF43;
	Thu, 14 May 2026 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761204; cv=none; b=TAFMhKO/zbOL4soCGpmBKgL5bWzMjuTiLTMz4tJVaP2BX6Q1e9bxwdtwKwteWS1tRA77CMrpliLyN12hScQx1GyWn8lm1xUT73Im1V0n5wcyeInvT3TseIGUzr2jCb7GTJ3wmEVYCOW8to2O+NHG55hCYNv4awProMGBKm0vl1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761204; c=relaxed/simple;
	bh=3d8DUSA04YEeeaSJDsq0tBuKoX/EgDy6elaulwtaoYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRglwRoLMOZm03VeZ4UO9cHRwBN1d9Vy14UUFIBu/QR18LxqvJmW5dJLAVoRHki2zcHJJDX9Q0bnRDZUDJjvG82y+e62c+s4PaWThOrQiY0iGvLUzZL/I916xLEZIsWFdwFtXjN0ljKSjVGzl3Bd6Pu/Hjcr6bokHhykDVgCNFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vsfs4Hfp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778761203; x=1810297203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3d8DUSA04YEeeaSJDsq0tBuKoX/EgDy6elaulwtaoYI=;
  b=Vsfs4HfpJFYfuSEAoZIVb7CVcE0vssKbRhW+4EFiGPf6XW4NSPuUU5lt
   6gZ/SP2D0wZGmct9rXa1nxqgs+JCfbS3LB96VrpFk+m/plls7hRm6b5PL
   XjFcxQNAc/yvvfvEwmvJugtTChJa163jd6xhNNpJ6MbiTSQXqft8SElGE
   eREvcDu3SHizNN3MmsoBiFf6DhcuUbqyAkfHL+ITFEgkuEZP3yEwrJMq4
   9X3A258um3rUekKPixgz9S7+BhB8MAAVwx/CmC4c9AKKNXHbOBEZz79Vd
   Tva8ZC6bp/NhDwOOroRszl+m6W94z8dg34WMvDVoV+AQphtCc3rcnqkTv
   w==;
X-CSE-ConnectionGUID: 9960Ek4xQyCqZbBJV2QHXA==
X-CSE-MsgGUID: k2qLps0EROW//u8r6sNivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91087125"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91087125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:20:02 -0700
X-CSE-ConnectionGUID: SgABm03mTjmMHc+nrGJewg==
X-CSE-MsgGUID: EJUbuaw/RnyDNWwkMBfBxQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2026 05:19:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNV2i-000000008oV-0F3n;
	Thu, 14 May 2026 12:19:56 +0000
Date: Thu, 14 May 2026 14:19:35 +0200
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	s-vadapalli@ti.com, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
Message-ID: <202605141426.2RPW8nvf-lkp@intel.com>
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
X-Rspamd-Queue-Id: C56D554183F
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
	TAGGED_FROM(0.00)[bounces-32615-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,ti.com,vger.kernel.org,lists.infradead.org,163.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url]
X-Rspamd-Action: no action

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on a293ec25d59dd96309058c70df5a4dd0f889a1e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-Add-pcie_wait_after_link_train-helper/20260514-132815
base:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
patch link:    https://lore.kernel.org/r/20260506152346.166056-9-18255117159%40163.com
patch subject: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link training
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605141426.2RPW8nvf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141426.2RPW8nvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141426.2RPW8nvf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/access.c:8:
>> drivers/pci/pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
   1 error generated.
--
   In file included from drivers/pci/rebar.c:17:
>> drivers/pci/pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
>> drivers/pci/rebar.c:142:31: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 140737488355328 to 0 [-Wconstant-conversion]
     142 |         if (size < 0 || size > ilog2(SZ_128T) - ilog2(PCI_REBAR_MIN_SIZE))
         |                                ~~~~~~^~~~~~~~
   include/linux/sizes.h:70:20: note: expanded from macro 'SZ_128T'
      70 | #define SZ_128T                         _AC(0x800000000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:37:1: note: expanded from here
      37 | 0x800000000000ULL
         | ^~~~~~~~~~~~~~~~~
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   1 warning and 1 error generated.
--
   In file included from drivers/pci/msi/pcidev_msi.c:5:
>> drivers/pci/msi/../pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
   1 error generated.
--
   In file included from drivers/pci/pcie/portdrv.c:22:
>> drivers/pci/pcie/../pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
   1 error generated.


vim +/msleep +73 drivers/pci/pci.h

    62	
    63	/**
    64	 * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
    65	 * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
    66	 *
    67	 * Must be called after Link training completes and before the first
    68	 * Configuration Request is sent.
    69	 */
    70	static inline void pcie_wait_after_link_train(int max_link_speed)
    71	{
    72		if (max_link_speed > 2)
  > 73			msleep(PCIE_RESET_CONFIG_WAIT_MS);
    74	}
    75	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

