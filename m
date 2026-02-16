Return-Path: <linux-renesas-soc+bounces-28268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIxuAL1Lk2mi3AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:54:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA7146752
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2957F3023310
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9D12C326C;
	Mon, 16 Feb 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RfxDVFCy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C22C2374
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771260853; cv=none; b=KSEEfCAcc6oJnZe46TBzCri+SKhwkKju5rhwQxUuB2BM9zq11jfKDt/7xTXXGqdPdorAi3ZfOmwUxPO3ILaYwQ+bIB88sftZ2TjScpWFRUebl/3doj6Uhuyse45l1Edi4Jmjc3tg+SLxzldJju1Vonkhq1klN4E1LH9fczT+miw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771260853; c=relaxed/simple;
	bh=5fwhS6SYoS4p392aanTsJmmr2054Li8JWmikbdRhKQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6dhpeoIgnnjUCKNuO96HaBNtqZw1Y8LbVrqN4RbYZH/5hN/nCaa+kPkXSyyDLuVXQkXaW0VBppVbpyqPqHcbhJF7IfZeVsOInLMXlOmIO2ZO+c+r4+lvjFXMzA1JXco2bNqI7O5etKyVNsDiGBk2cADHNX82Qt8HLEwMWw4GJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RfxDVFCy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2vvq
	y8Jb4oFrlAJ4lKH5odjJ0nQ4DQWXHmpBeBU8omg=; b=RfxDVFCyayO8eMI5CRHD
	Qdj4eTZZA8Ln4IRNQvRe3M4TD/5EZPK1xyBitEkBPq+zwwsHQcERK5eNoW6vCPa3
	8+2+wqzVReJca72l2WEzRyJbhWEp0DYCfjUIm/Tnzi2Bi0bt8JRWIZdYXAMRyq7+
	3XKkwWKcpVfZSmGfBrwzqyLdZt+9DZRNYyS1gSwYGGdr6RKiqSnh9N/X9YbSh7X9
	JLN5nhZJUVd/LhCbQOcmvz8JLQBWpYzzO/CdFxTucdeO5oaSSdGDV/Uelj4BQbb5
	FJgZCNf2gEEQvCSmX1/BflgbN6z+6LK476VZkbo4jmY7MEZYKHC0XrTfSOhGn0+b
	9Q==
Received: (qmail 3323583 invoked from network); 16 Feb 2026 17:54:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 17:54:06 +0100
X-UD-Smtp-Session: l3s3148p1@p5KMzfNKiB1tKXIY
Date: Mon, 16 Feb 2026 17:54:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
Message-ID: <aZNLrRcMZXv4pdbN@shikoro>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
 <aZLVU9toZRX2vKX7@ninjato>
 <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
 <aZL3M6hT45I2WUaQ@ninjato>
 <5416c451-43fc-4feb-b3be-6d6754720884@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5416c451-43fc-4feb-b3be-6d6754720884@omp.ru>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-28268-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89EA7146752
X-Rspamd-Action: no action

Hi Sergey,

> > That I don't know. I just know that I did build-testing for the whole
> > series and the buildbots reported success. Need to look up why this was
> > not caught.
> 
>    Maybe it just built the kernel after applying the entire series? :-)

My scripts build after every patch. As said, I have to double check why
it did not fail here. I used to think buildbots work the same, but
probably not as I got another success report after this thread already
had started.

>    Perhaps you should update the existing users to just pass NULL as
> init_data in this patch, and only then do the full-blown updates of
> the individual drivers?

That sounds like a good option to me, thanks!

Happy hacking,

   Wolfram


