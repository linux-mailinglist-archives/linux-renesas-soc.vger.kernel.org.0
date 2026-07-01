Return-Path: <linux-renesas-soc+bounces-34619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vwf/A/wtRWoa8QoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 17:10:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A606EF219
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 17:10:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=QsOo+ziS;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2674330A037C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 15:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6DE401492;
	Wed,  1 Jul 2026 15:07:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C97F18FC97
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 15:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918467; cv=none; b=lWq8VeWUl6GahutHPHn/KAcgolMyQcIxyJb0CE+pdfnX1IUSv2SGybIM7kegpC9RtBRmo8Zv+h7ycUqnKfnEuBQHf5zZ46u3RInNL72zzFsBBtj4DotiTJY8uneuer1usN1eFMEjyO7s87UKtZMlaFNXO4V36Kxuwepq+E8OG4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918467; c=relaxed/simple;
	bh=vUxrARtMdOQ+zIfzk3+ftAgvIcQK4oG2Shio1HOhiZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4awQiv0gHjAHWZpqt9ZyV0k2ey2JKDaek64Bq5NsTv7m6TrgTNYtEt0FFvZXjaDFiXqFmcGifjlgVxxMaN6U3/XxjrP1ypk8pEbPyLl+A+x1bSTafpvego2ZgE2QTNn+vMPnm2CvG0bKxt6d4YxasQVweb03Cj1g+u+rqiVpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QsOo+ziS; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Eeuw
	SfJtk1TITarN3/jHx8HfAGBgLE56dGoNufN6r9U=; b=QsOo+ziSRV02C2rBOez1
	aaMlqPGpD5utufvq7tIWB2Ol0no2sdGzlQImwrlkpifEnTYHN5MJFmFxbs/bGrkF
	VWM+oTVVlTFBIBgdlLejKdTex9/LGOE3OwA/zKIuUqWr1vwbYq2298CiPRU2fzVk
	Bvt27wZp3AxRu1T8XRcfoLia9R5Fw2kF1srI4GWesKf7UneG7vFuQP0Rt2yYz5FG
	Wkyw3Sm2XkY9dHteJfpjGbrnpem7mufFwET5rzIoDYMVYkyIiH8JxsH2CrZyPwOP
	H2KhqqMDoAvFD5WMU8EJjzBLZaI67I3OnemaEwf7SLrzz4r6suv7vx4y51GksFfj
	fQ==
Received: (qmail 755408 invoked from network); 1 Jul 2026 17:07:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2026 17:07:40 +0200
X-UD-Smtp-Session: l3s3148p1@qWV8DY5VkI9Uhsc0
Date: Wed, 1 Jul 2026 17:07:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akUtOxe8BwFtqv3u@shikoro>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
 <akIzahjROM4GAlOR@ninjato>
 <akK_cc4ebZB29luf@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akK_cc4ebZB29luf@casper.infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-34619-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:from_mime,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98A606EF219

Hi Matthew,

thank you for your help, that is much appreciated!

On Mon, Jun 29, 2026 at 07:54:41PM +0100, Matthew Wilcox wrote:
> On Mon, Jun 29, 2026 at 10:57:14AM +0200, Wolfram Sang wrote:
> > Okay, seems to work so far. Thank you again! Will merge your patch into
> > my series with your credits. Now I just need to wrap XArray into struct
> > seq_operations. Seems no one has needed that in the kernel so far.
> 
> Huh.  I thought I had done that at some point.  But it was pre-pandemic
> that I was looking at it so maybe I either never did it or I never sent
> it out.

I grepped for all users of 'struct seq_operations' if they used
xarray functionality within a seq-file. No hit, sadly.

I am bit struggling with the initial approach. I would think that I need
to return the current xas with start() and next() from seq_operations.
That would mean dynamic allocating xas with kzalloc. However, xarray
documentation says to put xas on the stack. Can't it be done
dynamically?

> Assuming that we don't want to call pm_runtime_get_sync() under the
> spinlock (and maybe for cleanliness we shouldn't anyway?), I would clear
> the HWSPINLOCK_UNUSED mark in hwspin_lock_request_specific(), drop the
> lock, then if __hwspin_lock_request() fails, set the UNUSED mark again.

Yes, I agree. This is also my fav solution to ensure we can use a
spinlock for the xarray. Hope I can work on it later today.

Happy hacking,

   Wolfram


