Return-Path: <linux-renesas-soc+bounces-34284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8i2vJXgLOWp6lwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:16:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4266AE94D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:16:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lGCPMiSe;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF23C30125CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2EE355057;
	Mon, 22 Jun 2026 10:16:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032034EF1F;
	Mon, 22 Jun 2026 10:16:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123382; cv=none; b=KzMQz5VOZp1hz4umfL3eZZMKOSs/i0qk+JaWk5ng1Fv9TpEsJRGlxWZomCTUWxAaTIfv2KT1nW0mPKEF/x9UJSfoArck94hnnaT6US7j5+2brjo0Y4Zaw1AOnnhOpX9N7+yPE7oh+TdFsy/NMxyJQcVKsts1vrj+9a7e0OEAT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123382; c=relaxed/simple;
	bh=7bx/8kCnvlkgy1MTA0DRMn+LreWQeqdEC6FFpkhw6cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQskgXgGotMOyvW07xbORm8lp2WPF8zbkdKBFtLdCaCVCClL0RxJDxt517+N7CNoEqgww4YPNwgZE8MpTkalGBMzexd3ccJiUMDt5glFcHAW4ZKDgY0Jind3tExtLRreu00F2qbBPgRFw8I38s2FNt5sTUX2VKrkSbNPlnAYUAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGCPMiSe; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782123380; x=1813659380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7bx/8kCnvlkgy1MTA0DRMn+LreWQeqdEC6FFpkhw6cM=;
  b=lGCPMiSemZzxLr3Q+Ot52HDvssjHKq+MWQNgEH1ZmSTkNCj6rCD1LdGh
   oCrwdwRF/74AyDnsaDR6MBUgFxSxdLyOBXzfICr7s1bhJ3cobldEacHNJ
   VXo6nMhCM70+F/O8oIgL79vgdy0HAih3zhn9C0l/LZj7yYbmH1It+KOC5
   +0ao3oGwZMBQaux6knLtdQM8SF+5+LfceMzPRnIW9bGHxaWT6hqoeGTaz
   eQ9kUebXdsm0jgl7y0GInpU9oqQfvH6vyJ/+qX/T/naX60T+OEph4bCZ/
   lnNZaFt7+jEpAEvjT0/6hWsqVDwf1jmnREe13VvYmlaJuHta8UIOfuzeu
   A==;
X-CSE-ConnectionGUID: s6aZJ/PVSqaqKnwTea7lEw==
X-CSE-MsgGUID: jBSUbEZYQsW7Lc4Li75U3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86759414"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86759414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:16:20 -0700
X-CSE-ConnectionGUID: SJJXlP+VSSOvavM2V0a7zA==
X-CSE-MsgGUID: L+XmsUOkQbyw0+kxNOI4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249243366"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:16:19 -0700
Date: Mon, 22 Jun 2026 13:16:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] radix-tree: add parameter doc for
 radix_tree_deref_slot_protected()
Message-ID: <ajkLcIEwug2aFZal@ashevche-desk.local>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <20260622085204.54248-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622085204.54248-2-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34284-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B4266AE94D

On Mon, Jun 22, 2026 at 10:52:00AM +0200, Wolfram Sang wrote:
> Add the missing documentation for the 'treelock' parameter.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



