Return-Path: <linux-renesas-soc+bounces-34333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rnlFMFgOWpUrQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 18:20:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E786B1163
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 18:20:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="Y1IY//P9";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 329F03011E8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562F72E2DF2;
	Mon, 22 Jun 2026 16:20:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15761AE877
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 16:20:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145213; cv=none; b=rWt3gUnrYdpsoaWkFnyYJq1KXtqp1dyCpO84YaVclj1VsekP1wF7/RGxTSg0SBWUjbesiFgAPNtk4K1sldQYpU9lIVWE2M/PJ1/JmDGG63a+WjRUjdSHfEuMxTmxh/VAIzfMAC3QDBYz8QJsF50kCR59GGQlStGVO8pR0yROwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145213; c=relaxed/simple;
	bh=v08vXRNGsQyoNz2OBnamN7zvawDR7EWR6KdNDUEWK6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icpx1pMnX1KpFemtGf7RIUCA8bHmiBdoVmt7BywKh45gODEMm/8TCwjbBUaeTesQQpMhAnIeRn+MceCT5BrNGErIoBrWFRckGEt70/h8nFHZYBSk+/54X+ZmhaiWxSo7l41S877tc3qCLW65H2+x92n8mZVZx+Szse2UjJJ/vZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y1IY//P9; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f+vj
	9wHvsyBz3hj1KxQXgatWUI0Ybb1TR0D2MIxnwhc=; b=Y1IY//P9uZCa9yRGQ3Vp
	E+Kw2CA7mLzyPkRbsWNwt4sc9Vm1MKPM1TNd4daL27N26hmk6DTzVwNYs44Bmhz4
	s6ZCt/ZnCzVo/kWVDsG5AC18ReFrICYfZAiE0IcnXLQNbChCIKJI8PHtsgrKoBPl
	1/8VsWgfocgnhdI3kqs47QZBNZAVF2S4//bhWg4nG5nndg7JZfbL7wKFnfyJlXis
	xc8hMWLUW6LV+YJFn0cRwfjuLgsC0QW2spFmLv2XXlYvzS9YmKN8ltdv33gC1Afi
	XSSxr3oWDdvOuTdAafw82ECV9WsOsVmQJeOOpASV18cgPL79nrUY9shQTadvcszM
	KA==
Received: (qmail 2038201 invoked from network); 22 Jun 2026 18:20:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 18:20:06 +0200
X-UD-Smtp-Session: l3s3148p1@8L31A9pUHo4ujnum
Date: Mon, 22 Jun 2026 18:20:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <ajlgtWNBWkCxJjde@ninjato>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34333-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ninjato:mid,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7E786B1163

On Mon, Jun 22, 2026 at 02:59:23PM +0100, Matthew Wilcox wrote:
> On Mon, Jun 22, 2026 at 10:51:59AM +0200, Wolfram Sang wrote:
> > Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
> > R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
> > multiple instances and, thus, multiple spinlock providers. The spinlocks
> > are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
> > development on these systems, it is helpful to have an overview of
> > registered spinlocks in debugfs. This series adds support for that. The
> > first two patches update the radix-tree header to support more lock
> > types. The third patch fixes a missing RCU annotation for the slot
> > pointer. The fourth patch finally adds the desired functionality.
> > 
> > Because the radix tree seems to have no dedicated tree nor maintainer, I
> > suggest that all these patches go in via hwspinlock. This also keeps the
> > dependencies zero.
> 
> The radix tree is deprecated.  I don't want to add any new functionality
> to it.  Here's a replacement patch to convert hwspinlock to use an
> XArray instead of a radix tree.  Compile tested only.

Wow, thanks a ton! I have a conference coming up but I still hope to be
able to test your patch this week. We will see...


