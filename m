Return-Path: <linux-renesas-soc+bounces-34497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UGP/LKA0Qmo51wkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 11:02:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B386D7D21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 11:02:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=DAR6X1dx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E5C43027DB9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 08:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363D73F86E1;
	Mon, 29 Jun 2026 08:57:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83F3F86F9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 08:57:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723441; cv=none; b=D8w9rqhmg+maUnLZAEQPgUkL0STjglbhjMdeqYfj7Sw/qXRbjvhcqOH2usoPNyaH2n0mLNfzCwAfhcLE/U8qz3sykxyZ9Scyf9WUUWpEMjkQ4cFtZIaAbwB5KH0drgP51UIzj6PnFi36bGnSYNv+8f0Ak8bKktRsMiurD+PUKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723441; c=relaxed/simple;
	bh=Cn0Hdsnc/OYau8eYKqRpxB5lCuUUIKG4vrn2ICVjz3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swSLE211dMEGHv8cyPV/wopzHcyG7R88aJDmKFkVonfnxW4HV/2cRmFzyUxalEgDwLd+1C7hvs0kDVegMp6FRnUIk7CnQWSBV42A6oHTdolz5c4Fo2tol1U7jwqAElXXGkmNrzs4lUydgqfzdblBiAdMKwQM5zBkku9BmuthFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DAR6X1dx; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kWrD
	HiKeyxwtEZPkBVnyaEj82oKV48RkCbwlxtlTE3k=; b=DAR6X1dxI+c9njC5WYif
	IKdw/eDXluaqJ7k+HnfoclL/TJkOCMhdY0VCxlNpKT1avqyoIh5z7VGZHkQLRj4x
	C74XKZNkQLLrxoMBQTQQVZd2j1uy3ySwYhHjFIHtsIYjFaRSDOXdHXp6WCCecK0P
	3T4mcy9f5NCHnAj8apwJ0mGv1GInX3z4kWCa7dCaZNHzUdThyhk8SMRRnE/OcEz4
	gEsbZQJC7qrncwjV5V12IAytX8fqDkirs3OInKMozLMAo28zy1awzSG3k/J0k+3W
	tuEF5C2YYK8Wk6/u5oeti7EdX7qr23GMa/daTPSKoZ/lmKKYJZwzAy6KujEhU6vD
	tg==
Received: (qmail 307330 invoked from network); 29 Jun 2026 10:57:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 10:57:14 +0200
X-UD-Smtp-Session: l3s3148p1@f4UIpWBVrtIujntC
Date: Mon, 29 Jun 2026 10:57:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akIzahjROM4GAlOR@ninjato>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajk_u7TVT-kL8z2A@casper.infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34497-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21B386D7D21

Hi Matthew,

> > Because the radix tree seems to have no dedicated tree nor maintainer, I
> > suggest that all these patches go in via hwspinlock. This also keeps the
> > dependencies zero.
> 
> The radix tree is deprecated.  I don't want to add any new functionality
> to it.  Here's a replacement patch to convert hwspinlock to use an
> XArray instead of a radix tree.  Compile tested only.

Okay, seems to work so far. Thank you again! Will merge your patch into
my series with your credits. Now I just need to wrap XArray into struct
seq_operations. Seems no one has needed that in the kernel so far.

Some comments and questions to get a better understanding.

> From 8ec88ed466e8153f546f7e8e69193cd5389488ee Mon Sep 17 00:00:00 2001
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Date: Mon, 22 Jun 2026 09:38:30 -0400
> Subject: [PATCH] hwspinlock: Convert to XArray
> 
> The radix tree is deprecated.  The XArray uses the same data structure
> with a nicer interface.  The hwspinlock_tree_lock is not needed as the
> spinlock built into the XArray is sufficient for all these cases.
> 
> hwspin_lock_register_single() used to always return 0.  Its caller
> thinks it can return an errno, so I believe this to be a bug and so I
> have restored its ability to return an error.

I sent a patch for that previously and would rebase your patch on mine
to keep the one patch per issue ration.

> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  drivers/hwspinlock/hwspinlock_core.c | 133 ++++++++++-----------------
>  1 file changed, 50 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
> index cc8e952a6772..1dd68b8410dd 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -16,7 +16,7 @@
>  #include <linux/types.h>
>  #include <linux/err.h>
>  #include <linux/jiffies.h>
> -#include <linux/radix-tree.h>
> +#include <linux/xarray.h>

According to some quick grepping, there are 102 users of XArray
including this header and 423 users which are not including this header.
Do you think this is a useful improvement to add the header directly
(per subsystem to keep the number of patches limited)?

> -	void **slot;

Great, this obsoletes a fix concerning RCU annotations I have sent
previously!

> @@ -389,15 +375,9 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
>  	/* Find the hwspinlock device: we need its base_id */
>  	ret = -EPROBE_DEFER;
>  	rcu_read_lock();
> -	radix_tree_for_each_slot(slot, &hwspinlock_tree, &iter, 0) {
> -		hwlock = radix_tree_deref_slot(slot);
> -		if (unlikely(!hwlock))
> -			continue;
> -		if (radix_tree_deref_retry(hwlock)) {
> -			slot = radix_tree_iter_retry(&iter);
> +	xas_for_each(&xas, hwlock, ULONG_MAX) {
> +		if (xas_retry(&xas, hwlock))

So, the unlikely(!hwlock) case cannot happen with XArray?

> -	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
> +	ret = xas_get_mark(&xas, HWSPINLOCK_UNUSED);

xas_get_mark() returns bool, so I will update the code to match that.
Makes it more readable, too, IMO.

The rest I could understand, I think. Looks much leaner, in deed. Will
keep you in the loop once my next iteration is ready.

Happy hacking,

   Wolfram


