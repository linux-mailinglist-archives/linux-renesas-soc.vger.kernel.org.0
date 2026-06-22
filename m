Return-Path: <linux-renesas-soc+bounces-34288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pzNCACENOWrxlwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:23:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC696AEA97
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:23:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EYsMt6Wp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C20C302BA4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BC23A5430;
	Mon, 22 Jun 2026 10:18:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7BA3A4F55;
	Mon, 22 Jun 2026 10:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123508; cv=none; b=bNq/pDwzoqgc+R041oZMBwcdO5gYoP/HhzQAZcNYgWjbyIKcKcGRQLldejuQ54ITzc1KwHDKmxOfN76N9Qlc0REO/J0NnlxF+0AbVzPL+/oseMUgDLRsamN10yLFwsR4/UjEEBCqyJgu1HjgEaMDvGrI0tCE5maIfSieXcUB0cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123508; c=relaxed/simple;
	bh=2gTQljWBh0SqcTnKACPr9/Rs54KsNmEum1/wG8Motio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h314lMgMlQGhIkv/ispBPq/y5b75zRI6RLB+FeSai4JMftCSXFVZ3Cny/MlrhmrhkFw2QtsDXR9363R/zUKENGSLpNLUjB9TtsIWcPspXv2xNr5uS1bqUN0nD0+TWAJRcwbwBqakEuSZl6sFsEvp4Zn5ADOLhP2BKzgnfnkm3r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYsMt6Wp; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782123507; x=1813659507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2gTQljWBh0SqcTnKACPr9/Rs54KsNmEum1/wG8Motio=;
  b=EYsMt6Wpuh6PXJS+CY0ZUGj+OZIHtCWEa4qv0UQyMyhA8an/O+LlOmeM
   HqdELCdg21tXxeCMFkgqf4tLWhj19A8B32h/8+weDb5gsZ+mIqU0GYKa0
   2OGRPzMMSxVayEBqW+dJUnmzWN8PflCH/RFTkR9Q03h4aBci/0Y+gIbrs
   V/KCGs9N0b9bbokno04p+ivpvSHOR4R2MaYzOUmUcfHRyLeA0+d+HWKF1
   J4YgsHatGMpE2/KRIEIMqgNdzrqkSou0e9mBbPPHjWxUqA+Ybarf6YVHG
   wZBMA2muop8q6HrdekH1kNl4gTd92I0k7FKh1Qz75KZ4cutjiqRDBbKpz
   w==;
X-CSE-ConnectionGUID: cPwJoJ/eTBSPUkIg6u3/rw==
X-CSE-MsgGUID: +HLkRUQfR5msCbu1OCNHWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86759544"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86759544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:18:27 -0700
X-CSE-ConnectionGUID: 7vUV20mkSRGYImqVYoiP2g==
X-CSE-MsgGUID: NcXxU8pwTUCdGgYIzUknHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249243640"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:18:26 -0700
Date: Mon, 22 Jun 2026 13:18:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] radix-tree: allow more lock types with
 radix_tree_deref_slot_protected()
Message-ID: <ajkL75AsAeIJUyHl@ashevche-desk.local>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <20260622085204.54248-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622085204.54248-3-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34288-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DC696AEA97

On Mon, Jun 22, 2026 at 10:52:01AM +0200, Wolfram Sang wrote:
> The 'treelock' parameter is type-checked to be of spinlock_t. The lock
> to protect the tree might be something else, though. E.g. the hwspinlock
> subsystem uses a mutex. 'treelock' is simply passed onto
> lockdep_is_held() which supports way more lock types by using a #define
> instead of an inline function. Use the same approach for
> radix_tree_deref_slot_protected() to support more lock types, too.

A pity we should use a macro, but I understand why.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



