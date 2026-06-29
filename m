Return-Path: <linux-renesas-soc+bounces-34506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N7GTAb1LQmoS4QkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:41:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6A6D9002
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:41:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=bANBICS7;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD485301DEEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6844F3B9D84;
	Mon, 29 Jun 2026 10:40:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3D3B992A;
	Mon, 29 Jun 2026 10:40:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729631; cv=none; b=uyISjMZe3MjQF2ih4FO/X2on6arX8GQiV740beEtlB5aUs6GC8WcjX3sNWWA/qYpNb77sMyNNkJo8H38F9suwaj++wJGuiODfIAMPvl1jh3PwGQCkgQQUVE68PNwsFEVnQbFWhP5JrRQ+7oe3bOfbztOZaM3EwcfkeL0O+WGCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729631; c=relaxed/simple;
	bh=vxYH0dBojRT0Krk1Yd3GbwkK/Gygv0INRhejYhXRifM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdXGDsBbp2U89dlYajYxQwcVmotZwW/ehr2KGKZWzwQoU2PjHMX6UKgjXs3gYUWIyrIfq2BBtLtczhOYq/75Dz+AE+ZJ8mLTNayzGwGVwJGr1/bubvJJNJLcIPmKfwfOTlbNa1/0YOMiXGKCMNDWpd89N/FWC1QYMNxojJ1MN6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bANBICS7; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782729629; x=1814265629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vxYH0dBojRT0Krk1Yd3GbwkK/Gygv0INRhejYhXRifM=;
  b=bANBICS7x/UwQmG/zaMqJ+heZei4VEErQJckQvy/DwVFNDd/Suqy8C9S
   bb/DA8ZkYHi5keDmTOJZ1ijZ/2EHU2Op6uvcjtSu75x09xaYJQ6Q0S9Ba
   qUJKUGEJk4cb7JyafknWW5+w8nMDvcPdzV1fHCHTMzDU1IvUZytoF7JIX
   KrngVuUuExL1kw3rp0CkJzmy+BeRPsgmMusNeMmWv0xMGStqPekQIUBGR
   CuzpMQH5ufxJG3WOKsbHqBs6671Yct3l0YiyKdC3NM2Bhb/Y0FgIDxlAL
   KTs0k6hWZt3W1j/irUI3ba2RO8HRlUjvSRuh6KdzhmJOUfEib8OUw0iRR
   w==;
X-CSE-ConnectionGUID: nzfzRoNTRHGN5GH9RJXRfA==
X-CSE-MsgGUID: 1iA0NDbgROm+KoPV6OH6kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="87252500"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="87252500"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 03:40:29 -0700
X-CSE-ConnectionGUID: 8lZxkRkNSdyKXsFY5D7SIw==
X-CSE-MsgGUID: rxnd8ZR+RLCEjNjo16nXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255870301"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 03:40:27 -0700
Date: Mon, 29 Jun 2026 13:40:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akJLmLwO8IGu5KbP@ashevche-desk.local>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
 <akIzahjROM4GAlOR@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akIzahjROM4GAlOR@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34506-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:willy@infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68F6A6D9002

On Mon, Jun 29, 2026 at 10:57:14AM +0200, Wolfram Sang wrote:

...

> > --- a/drivers/hwspinlock/hwspinlock_core.c
> > +++ b/drivers/hwspinlock/hwspinlock_core.c
> > @@ -16,7 +16,7 @@
> >  #include <linux/types.h>
> >  #include <linux/err.h>
> >  #include <linux/jiffies.h>
> > -#include <linux/radix-tree.h>
> > +#include <linux/xarray.h>
> 
> According to some quick grepping, there are 102 users of XArray
> including this header and 423 users which are not including this header.
> Do you think this is a useful improvement to add the header directly
> (per subsystem to keep the number of patches limited)?

My 2c that we should follow the IWYU principle. XArray header is not generic
enough that we may rely on something else to provide it. And hence I'm fully
with including that explicitly. That mentioned users simply neglected the
principle and I consider that as an inconvenience.

-- 
With Best Regards,
Andy Shevchenko



