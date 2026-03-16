Return-Path: <linux-renesas-soc+bounces-29531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPPgFfSQuGkUgAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 00:23:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 037392A1EBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 00:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB2D30571A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 23:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FCA372B37;
	Mon, 16 Mar 2026 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igNReghP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6760359A76;
	Mon, 16 Mar 2026 23:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773703361; cv=none; b=SsmCaSH6Uc90RpYgMdv0E1FBba29v8pjv/o0PXQQXQOWAkNYUrrPibnd/sgHyAlgtEdpsoXDDHZipi/e/g0P71E+ZSjmi6q4A8PmP/MHwEpObWGHbguBtHBUahuRai0cbwdbW91GG6xYj+YwfSRuayxByogw1qTCKvKRsfOVZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773703361; c=relaxed/simple;
	bh=cQlrLztk/fNWxwJS7iqCXIHtdzfjmWRGZfLUfKYcmJg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=suE2SpZ1tNlMWlx2pEAmJKL/H+iIwjvVx2JVVj7MHtyLiztJp4jHaehJS4AEhGQCa/XorWI0FrE6hf0WyEJDPtSbirWpQJwA1ekHDpu3MOLBz2PG3d52U0Cpx/98vYEq5/GlVKSrxTfwqBTMli0J051HVOBfsUmw87gT3Y/tUlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igNReghP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DA0C19421;
	Mon, 16 Mar 2026 23:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773703361;
	bh=cQlrLztk/fNWxwJS7iqCXIHtdzfjmWRGZfLUfKYcmJg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=igNReghPGzZ2+oqgMoDN4fAkoHOEC3ysz9+83AwzVJxAplaxiPUblrJw6LcHHKgEJ
	 tzO7FEFnKokBe9JKMATJBKj0rZ7P67EruGUtYnPJL20dJgTaZ2E35/nfW3HKLIf/y2
	 lywGuS73AgNfiz3GYxFUyCd5BraVdAe5TJ3nBIbdhWBV4EVXaoScnC05fRjzRzG1L1
	 OB1PYKMFaRteOSqEYjXjQuwbVBqXWDdhrCcKpD7m7NMWStImT6S9YuII0ksoXW0Jqp
	 zjDLkZ9Xdz7bYD7d0qCJ2qXfWeB9zRTf5T4B0qqPStbOEXOjuwF4PF2COUK1urByGz
	 hb1jiEltgsBCA==
Date: Mon, 16 Mar 2026 16:22:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, eichest@gmail.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
 robh@kernel.org, davem@davemloft.net, netdev@vger.kernel.org
Subject: Re: [2/2] dt-bindings: net: micrel: KSZ8041RNLI supports LED mode
Message-ID: <20260316162240.3e0873c2@kernel.org>
In-Reply-To: <CAMuHMdW7TJoDTYRtca1Y86pVuvUbnDX_x3MUYtvEbgPu915Yhg@mail.gmail.com>
References: <6ccda7a00f250e87b0457e276ac1070cb0708d71.1773321267.git.geert+renesas@glider.be>
	<20260314020107.2241383-1-kuba@kernel.org>
	<CAMuHMdW7TJoDTYRtca1Y86pVuvUbnDX_x3MUYtvEbgPu915Yhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29531-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,gmail.com,kernel.org,lunn.ch,davemloft.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 037392A1EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 09:22:19 +0100 Geert Uytterhoeven wrote:
> > > diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
> > > --- a/Documentation/devicetree/bindings/net/micrel.yaml
> > > +++ b/Documentation/devicetree/bindings/net/micrel.yaml
> > > @@ -54,6 +54,7 @@
> > >        KSZ8021: register 0x1f, bits 5..4
> > >        KSZ8031: register 0x1f, bits 5..4
> > >        KSZ8041: register 0x1e, bits 15..14
> > > +      KSZ8041RLNI: register 0x1e, bits 15..14  
> >                   ^^^^
> > This isn't a bug, but there's a typo here. Should this be KSZ8041RNLI
> > instead of KSZ8041RLNI?  
> 
> Yes, it is a typo. Shall I send a v2 with this fixed?

Yes, please

