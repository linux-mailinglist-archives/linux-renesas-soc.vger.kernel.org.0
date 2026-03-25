Return-Path: <linux-renesas-soc+bounces-30268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P0VCEkjxGljwwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:02:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C632A3E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D37393004D10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 18:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE41410D36;
	Wed, 25 Mar 2026 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8yRfORe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A727410D26;
	Wed, 25 Mar 2026 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461689; cv=none; b=JPNHXUo6lLflgUPntyjYlPunc2lG+1u5DhqvbB75Sw9zyY6OoRSIiwb6an5DGVuDWEBdrqmUKk5RuOmG5iERYoOD9eU0xbkXttL0NbEGAq0ieH+/VEXKbKHKLHTJbw16mWqA7Hn0BiHS2HwRGSrkS3/puJ0bpfumr4AOiXWT0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461689; c=relaxed/simple;
	bh=cxcEiJdSXDYsfGZThFrx8z5QCeSMFqgQ2jFvleh78SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+FlcpD8AZGq1Ql6TfsxzOMW1whRdGj3xy7L5dw6oqju0ZEPfJV+uqNzGyJhTgN/8WSG6A1qs5FA1HJh+Q5aZ7Mhbv2sJON48B1uGMGR5rULQwmxDE7TaRBQHLp/uqgFHAgDbXa9QUtXvo3pZoGjMw4PH9wayMbP+WmWDX1LdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8yRfORe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774461683; x=1805997683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cxcEiJdSXDYsfGZThFrx8z5QCeSMFqgQ2jFvleh78SM=;
  b=V8yRfOReB0s7i766sFZvhl6r7gQkjyE1KosZnCXOO0vhtUT7/TsTtAcp
   wdjV5THdmI6wP4A+OPmljY73QDLX2T3dGn/ypcPbYqLfrKA6IcoHlxlmn
   Umkaoz1DXqrz9Y97v1M/SlpbOC+oxfZLaV4/hdITE2ytE5ab6gNgqEW1m
   OZgxpWXTJ9cgS2wCkkGxMGkAIitIrWm6R0kjuGnkx0A2xQw/e7usqYtQg
   nqDycY6ceoizY41dvaArMKCuoSjE8zzPEwPxqMCZuvq2L/LG3rPN5+aE2
   23rsCYXDncnaz9Dpb6GvBSmGk4IqBoMMIFnlgQu5jT/6RdFgFlZOrVnKv
   w==;
X-CSE-ConnectionGUID: CJQ+Chi2QnGmOb3CtCtJ1w==
X-CSE-MsgGUID: pqmEgJcQRA2F+oX5kMsIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86203066"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86203066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:01:22 -0700
X-CSE-ConnectionGUID: t08BnS/VTzyDBNZ6Tq8yEA==
X-CSE-MsgGUID: BgBm7Q4eRg+ods3OsmAh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="219914689"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 11:01:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5SXd-000000007RV-1s1s;
	Wed, 25 Mar 2026 18:01:17 +0000
Date: Thu, 26 Mar 2026 02:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Biju <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Message-ID: <202603260117.5j4fMpip-lkp@intel.com>
References: <20260322122421.132474-16-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322122421.132474-16-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30268-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: A28C632A3E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/dt-bindings-interrupt-controller-renesas-rzg2l-irqc-Use-pattern-for-interrupt-names/20260323-002740
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260322122421.132474-16-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260326/202603260117.5j4fMpip-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260117.5j4fMpip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260117.5j4fMpip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/irqchip/irq-renesas-rzg2l.c:111 struct member 'used_irqs' not described in 'rzg2l_irqc_priv'
>> Warning: drivers/irqchip/irq-renesas-rzg2l.c:111 struct member 'used_irqs' not described in 'rzg2l_irqc_priv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

