Return-Path: <linux-renesas-soc+bounces-34291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RIXcFEUOOWpZmAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:28:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE176AEAF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:28:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=O9UTMlnL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7BB9302AE21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345EE3A5437;
	Mon, 22 Jun 2026 10:24:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166AB3A4F31;
	Mon, 22 Jun 2026 10:24:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123853; cv=none; b=qd/5xKeo/mg/tAfCA7iff33uqFXtRmleAGrPPdZNBM5+i5sHQovJY/374YW2BhjQilfEZRbJaZSUHPpjCaGwXdkC9A5pDK1xr74VGqjeEU9BWCW61huDK7nuVkcOg2WOqqWGr0x6jVe8wAu1o7bY9ZMxNuh7d3HC1w4RVjIz+tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123853; c=relaxed/simple;
	bh=Pwnn2KFb6Utq3YVr/EQW8/ErhWpCWi8axK9o4kbkGw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obk/ubK40H/u9Z4hbnTKENPIYuU+jTZY9NC+yfcSU1UUGGIsbCYsV1tmcOtbiFOBO5/asNYUzUYecEsaNZij6PEM2UTP0XWpcWU/KQHU2eqLFJ6u77Pz9gxhC6kw5CmgWZwh54ZfjJi24avbaXIikpzhpScmSaC7WqTosXH4P9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9UTMlnL; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782123852; x=1813659852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pwnn2KFb6Utq3YVr/EQW8/ErhWpCWi8axK9o4kbkGw4=;
  b=O9UTMlnLd7mHhT5axi8k6CBG/PTgRYi1rAAyuu4CV414THQNtjwJJDxn
   2IJr8Md3i1BFIXF7r2Dzot/Ah8BT8iqhY8njZZOB1yiUW3B5eDXrF4jAF
   lFMWVgbAy4xhfMN4RrU8fBxFhU6axZHsH2on11TFLalBqCkiUbT3p1NDr
   9GMiUbPnSPtK7WBiWRb2qSMY62k+RXHVzg1u6lUwYk7lxzCbWrKRmFu0l
   BhnnN76GWKp5USsaeXROhLEvWxz5Ubfwvd3WMiQdjWfpCDMkiCU60XrYh
   sOunygfIMcTZAH0M2rZujoYp1YeRNz1de4tJc9Nu4Qp7wehadjXF/fGUg
   g==;
X-CSE-ConnectionGUID: h+TEITkRSPOLsXbv69bVdg==
X-CSE-MsgGUID: C7hnPqJfRkKV89dM9Mw+sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82943461"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="82943461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:24:11 -0700
X-CSE-ConnectionGUID: R5uvWuBvS3mX45xYLeME9w==
X-CSE-MsgGUID: jngyK1+vQu6LoRly++g8FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="246258882"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:24:09 -0700
Date: Mon, 22 Jun 2026 13:24:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 4/4] hwspinlock: add summary in debugfs
Message-ID: <ajkNR6dbdxW3Yzda@ashevche-desk.local>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <20260622085204.54248-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622085204.54248-5-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34291-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ashevche-desk.local:mid,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DE176AEAF2

On Mon, Jun 22, 2026 at 10:52:03AM +0200, Wolfram Sang wrote:
> Add a subsystem entry in debugfs and place a summary file there. It
> informs about registered locks, if they are in use, and to which device
> they belong. The state of the lock itself is usually not accessible
> without modifying the state, so there is no support for that.

...

> +#ifdef CONFIG_DEBUG_FS

Do we really need this? IIRC the compiler would be able to eliminate a dead
code for the cases CONFIG_DEBUG_FS=n.

> +#endif	/* DEBUG_FS */

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



