Return-Path: <linux-renesas-soc+bounces-35230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tH8bHH6VVmrp+AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 22:01:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F137588CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 22:01:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=BW9KuNKO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 618193136690
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 19:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C783F0ABE;
	Tue, 14 Jul 2026 19:49:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AC433047
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 19:49:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058569; cv=none; b=d/0qpz5e3LyGA+IoHxE8bfz3vOw7i/F8gofmPhUu+supYfImbs4sszhJVwgv33gZJq5nNwIRH6lJqeaCcSoJInRtZ3KN7tJeqtWaefE0mTl8jL+L7nAhUuqUUlvw/KVDVB6OwF9HkoC9Omac3XDauNksRtjDJgeRCj5lSzRpcpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058569; c=relaxed/simple;
	bh=k6+VP1SX60/bmY8wSfRpTfm09Y4HS0013REOICnTljs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQBFp0MvQSkMcaUGEswR1xBso22V4FJsjEvE/aFAyUWSt8/mEqfbINuqS2WwpWiU5nkp/TqfvPNKVGY+ef1Y40zt+2M48c0NqHy9DXtLy6viAjtcrPPA5c3+aG7YTOE8cDkHqTh5F66N1t/uM1dGz1CLjt9PKub4wB3PixZJIG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BW9KuNKO; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=q/jo
	yTvNyWzfmfEaywKEK4n2acD6YNyjE4reTwEnX9U=; b=BW9KuNKOnJizdtCVQ4i4
	T7qry5YmjclsWQVY8nqFzCFtCmF+twVGXvSessWREv8PaSMraK0Y9WOn0Sfmbyn5
	IKE7a8l79AeDaB9ilUkz+exJU0NTsPMk9CVeeTEMu0jo5ExKyfBRk1NF510+hD47
	hxjiqVTVdmTAB70QJKfwIfvCbzyJUfTW4PWakqiSUkwZxcxSH+Kx5bLlHJF7pZpA
	EUnRucbWCFMa0zO7b/ybLtmAXhyVRbHfgR2r+BGwr04N3uZRcGub2c/zxHxBPGVb
	p74RX14Sd8U+iQ9sOjVQWbz6CTuddYrXai1vzr5ZsHKFhfMlnBHVk7vuJIUqH/Ax
	Ug==
Received: (qmail 397523 invoked from network); 14 Jul 2026 21:49:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2026 21:49:20 +0200
X-UD-Smtp-Session: l3s3148p1@0Ki/gJdWlOcujnsO
Date: Tue, 14 Jul 2026 21:49:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: 3 XArray questions (was: Re: [PATCH v3 1/2] hwspinlock: Convert to
 XArray)
Message-ID: <alaSvyTylYZ0csVd@shikoro>
References: <20260713124622.63181-1-wsa+renesas@sang-engineering.com>
 <20260713124622.63181-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713124622.63181-2-wsa+renesas@sang-engineering.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:willy@infradead.org,m:andersson@kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-remoteproc@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35230-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,iu.edu:url,sang-engineering.com:from_mime,sang-engineering.com:dkim,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6F137588CC

Hi Matthew,

Sashiko found issues with the XArray conversion[1]. I tried to educate
myself enough to evaluate its findings. Yet, I'd be happy if you could
double-check my reasoning. Note: I left all issues with use-after-free
aside. Reason is that the hwspinlock subsystem has so many problems with
removing locks that I proposed to remove the removal[2].

[1] https://sashiko.dev/#/patchset/20260713124622.63181-1-wsa%2Brenesas%40sang-engineering.com
[2] https://lkml.iu.edu/2605.1/07475.html

Now for the issues:

> > +	xas_lock(&xas);
> > +	existing = xas_load(&xas);
> > +	if (existing) {
> > +		pr_err("hwspinlock id %d already exists!\n", id);
> > +		xas_set_err(&xas, -EBUSY);
> >  	}
> > +	xas_store(&xas, hwlock);
> 
> [Severity: High]
> Could xas_store() fail with -ENOMEM under mild memory fragmentation?
> 
> Because xas_lock() acquires a spinlock, XArray's internal node allocations
> are restricted to GFP_NOWAIT. XArray typically requires callers modifying the
> array under a lock to wrap the operation in a xas_nomem() retry loop,
> similar to:
> 
>     do {
>         xas_lock(&xas);
>         ...
>         xas_store(&xas, hwlock);
>         ...
>         xas_unlock(&xas);
>     } while (xas_nomem(&xas, GFP_KERNEL));
> 
> Without this loop, the GFP_NOWAIT allocation failure would be fatal. Could
> this cause hardware spinlock registration to fail spuriously?

Reading the documentation of xas_nomem(), I think Sashiko is right and
such a loop is needed, or?

> >  	/* mark this hwspinlock as available */
> > -	tmp = radix_tree_tag_set(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
> > +	xas_set_mark(&xas, HWSPINLOCK_UNUSED);
> > +	ret = xas_error(&xas);
> > +	xas_unlock(&xas);
> >  
> > -	/* self-sanity check which should never fail */
> > -	WARN_ON(tmp != hwlock);
> > -
> > -out:
> > -	mutex_lock(&hwspinlock_tree_lock);
> >  	return ret;
> >  }
> >  
> >  static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
> >  {
> > +	XA_STATE(xas, &hwspinlocks, id);
> >  	struct hwspinlock *hwlock = NULL;
> > -	int ret;
> > +	bool unused;
> >  
> > -	mutex_lock(&hwspinlock_tree_lock);
> > +	xas_lock(&xas);
> >  
> > -	/* make sure the hwspinlock is not in use (tag is set) */
> > -	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
> > -	if (ret == 0) {
> > +	/* make sure the hwspinlock is not in use (mark is set) */
> > +	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
> 
> [Severity: High]
> Does xas_get_mark() return the correct value here?
> 
> Since the XA_STATE is freshly initialized and xas_load() hasn't been called
> to walk the tree, xas->xa_node is NULL. In this state, xas_get_mark() queries
> the global root mark of the XArray.
> 
> If any lock in the XArray is unused, won't this return true, potentially
> allowing active locks to be erroneously deleted?

Despite I intend to remove this function in the future anyhow, the fix
for this issue is a simple 'xas_load(&xas);' right before
'xas_get_mark()'?

> > @@ -782,12 +753,12 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
> >  	}
> >  
> >  	dev = hwlock->bank->dev;
> > -	mutex_lock(&hwspinlock_tree_lock);
> > +	xas_lock(&xas);
> > +	xas_set(&xas, hwlock_to_id(hwlock));
> >  
> >  	/* make sure the hwspinlock is used */
> > -	ret = radix_tree_tag_get(&hwspinlock_tree, hwlock_to_id(hwlock),
> > -							HWSPINLOCK_UNUSED);
> > -	if (ret == 1) {
> > +	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
> 
> [Severity: High]
> Will xas_get_mark() silently abort here?
> 
> Calling xas_set() initializes the state to XAS_RESTART, which makes
> xas_invalid() evaluate to true. Because of this, both xas_get_mark() and the
> subsequent xas_set_mark() further down will silently return or abort without
> performing their intended operations.
> 
> Could this prevent the lock from being marked as available again, effectively
> leaking it permanently?

Not sure if I parse this correctly, but I think xas_load() is also
needed after xas_set() and before xas_get_mark()?

Thanks and happy hacking,

   Wolfram


