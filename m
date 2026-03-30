Return-Path: <linux-renesas-soc+bounces-30592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLNmMFOCymkW9gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 16:01:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B035C813
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 16:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A25D304E809
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A2E3D75A2;
	Mon, 30 Mar 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="SRgF+Wg9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE23A381F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878697; cv=none; b=HJk+f40OzHbWWtFlsZK7IDhrqTWvdqpwQs2DvTSufHTVjyJrkVZs0m+nq6XokllxvIPtkvwfuLj6OF4GGN7xkYfrwbkRzWItYMwjmwhoj2aJY39vZkRZOkq+IVCwe4U9of1r/y3vyYxGyRbUl1nI6DBUkREpqoPQ1BGjYMTs/LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878697; c=relaxed/simple;
	bh=RpTMoJ07T2k9URxnFok2qO7MiY1POErpQRQTLJ8TE2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkU9w9pfimPKBk+ZCgzcuxUFT28sTkK1fK2aFhyPxFvy1OM06L5xebQOZi1V0rljY5OMDgMddTVyUzNxG6EnbiFDMA0dcaBi6yW9PCRiMt/I0ETPmWgb4Ag/N9FplE8hOKKbBlvy3cCsME1Hp0hpyYo7pDV3WvjsR4uUEV/yTn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=SRgF+Wg9; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org ([104.135.218.80])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 62UDop2Z011337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 09:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1774878653; bh=Gby/7h3Ke7sH8LKIPI3E1u+BQ5bz9jR7xmEBCvUV8L8=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=SRgF+Wg9+16nDyavXgdFhPDNtCprorFdwueAdDiY37LY1O3jvk0n+REoQYk1nginc
	 9s8sMEC+Fshr9qM1V7utRPLYG96i+pKIf5fnEJR5uetQeX0lGzAktJKKXakxLCCrhA
	 DBD+3fQKD0ASn6T4ejx0uu5ToNuxnhfkt6jO/fXKrfTQPZYdWo3Ncomb3L/PRLGV+E
	 /Tf0OEd22H8NvyQLFzU+MYzmNqltqStSSh7M9ZHhgR2efrHka13i3FPbjNOaIACqWn
	 1uvezCddlQUc+1qVnxo96UruzQCqSsKrDv9DI/VofjNA0dwO0juZE8xJ55wFu1VA9+
	 1CK9JxvghK+Xw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id E069360046CD; Mon, 30 Mar 2026 09:50:50 -0400 (EDT)
Date: Mon, 30 Mar 2026 09:50:50 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
Message-ID: <20260330135050.GD22278@macsyma.local>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <ab-vWbjdlAIt1qaX@ninjato>
 <87a4vyynl2.fsf@linux.dev>
 <acIsrJp2Zq2ntS5f@shikoro>
 <87ikalp9b2.fsf@linux.dev>
 <aco7CM5N3E6A0v8v@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aco7CM5N3E6A0v8v@shikoro>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mit.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mit.edu:s=outgoing];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,gmail.com,renesas.com,glider.be];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30592-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mit.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 294B035C813
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:57:44AM +0200, Wolfram Sang wrote:
> 
> > > Sure thing. Is there a dedicated mailing-list or better email address I
> > > can add?
> > 
> > Not yet, but I think of creating one.
> 
> Until that exists, shall I use your email to add Reported-by tags? In
> another of my series, Sashiko found valid issues which already existed
> before my series. A tag would be proper, I'd think?

I was thinking about proposing some tagging convention such as:

   Suggested-by: Sashiko:Gemini 3.1 Pro
or
   Reviewed-by: Sashiko:Gemini 3.1 Pro

to Documentation/process/coding-assistants.rst.  Alas, neither is
perfect.

Suggested-by: is generlly used when someone inspires a particular
commit.  This might apply if Sashiko found a problem as an incidental
finding, which we then fixed in a subsequent commit.  An example of
this might be[1], or in the case which you suggested above.  But what
if we just fixed one of the issues raised by Sashiko in an earlier
version of the commit.  In that case, Suggested-by: doesn't seem to be
a perfect fit.

[1] https://lore.kernel.org/r/20260327063330.1312426-1-tytso@mit.edu/

Reviewed-by: is generally only applicable once *all* of the issues
identified by the reviewer has been resolved, and it's not clear this
is applicable if not all of the issues rasied by Sashiko were
resolved.  In some cases, these might be false positives, but in the
case of a human reviewer, the human reviewer agrees before saying,
"You can add Reviewed-by: ..." to the commit.  Unfortunately, it will
probably be a while before LLM's have that kind of agency / consciousness.  :-)

What do folks think?  How should we codify a way of giving Sashiko
credit for issues that it has raised?  (Assuming we should, but
hopefully that's not controversial.)

          	     		       	      - Ted




