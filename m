Return-Path: <linux-renesas-soc+bounces-33433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8TJaInv2HmpTagAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:27:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 104D162FBEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:27:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=npJJyFao;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8D81308E2D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 14:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0C7361675;
	Tue,  2 Jun 2026 14:57:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4483B35B63D;
	Tue,  2 Jun 2026 14:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412252; cv=none; b=DlRq8O/i/ThifMk6mSnkIC42DKNZowjrSXB23a56Krw6eUrNB9L8RW0y9yV17SaDYvBlVeG3e2OYYFfRBs0TPfNntZb4GdJB3+UqYHqvT2tw1oCAKcjTsDMKCPfugEcFj2WFfhmjX646qYMbDaw6PVYIPMJymTYTbdI8A2Y5VfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412252; c=relaxed/simple;
	bh=eqpH0nyL53s/21n69fGW1x8ZHBGKlYJaeY4mUd9dFj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXfsMaPir5MtGTW7m0qeN1g/bSLX+sTgGlDSUux5L24B35LdHsYJgKELfNhbEOq7Y/MgaLWjKX73Me9d+d5PUQzMBd338WLCdSSzJc9i5lUNj0gJKQTnNQDpHHQI3+uAfxpS3Hk/2yfwaNhCWFibnH2FrN9aRR5xW0lcnwlYbis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npJJyFao; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440DD1F00893;
	Tue,  2 Jun 2026 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780412250;
	bh=QwDMgOgpL3mVlYn34KX0TOu+AZpH5iwZqb0/XkZgXTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=npJJyFaoLZ7ytddVQ8aR6rJB7jVbR0rA7aPCeDcr0BvlhFQnPYLeGgcNgZBSeccae
	 AjRFMhTlYuU8PvAX/JLTMKakNBIb6Lywpxh9ECdmZQOx9UHn0sBtTM/2o0nokNYnp4
	 LztgVUSdzA35V3iQ683tJd01klq60X6JvR61IspCzSRkAW6H9ZtmZRby0M9slBFyKM
	 hJ0ta2/Spu3J6xTTtSXYmiYUxCdK7yb3LlP51MB1SOcDjRLSl9ilvcvsFzoQBBDwLm
	 pjMQ+RwKTrw28kYLNzKLKbUON5OHSw7b3OV8OEPHvnDDpQCKafsIlCIvFGBF+eSCNa
	 jhuzLWw8GzY+g==
Date: Tue, 2 Jun 2026 15:57:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/18] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Message-ID: <987befcc-2fd2-4d4f-8293-72df4dbc03f3@sirena.org.uk>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
 <20260525110230.4014435-2-john.madieu.xa@bp.renesas.com>
 <20260602145527.GA211368-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IbneGTeFWohgL8Hm"
Content-Disposition: inline
In-Reply-To: <20260602145527.GA211368-robh@kernel.org>
X-Cookie: The wages of sin are unreported.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33433-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:john.madieu.xa@bp.renesas.com,m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:perex@perex.cz,m:tiwai@suse.com,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,renesas.com,gmail.com,kernel.org,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 104D162FBEB


--IbneGTeFWohgL8Hm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 09:55:27AM -0500, Rob Herring wrote:
> On Mon, May 25, 2026 at 11:02:13AM +0000, John Madieu wrote:
> > Add a standalone device tree binding for the Renesas RZ/G3E (R9A09G047)
> > sound controller.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

John, please send incremental fixes for the issues Rob identified.

--IbneGTeFWohgL8Hm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe71MACgkQJNaLcl1U
h9DsLQf+J8JQb4gwc+Wk63U2sM3edMRillwnhFj0hOJPDffuGkyE4z07HScO5V9T
GU3jSoQ28vSqr1sJfB6kFkblBltbB0oOi+/iPrMEHo/YyF9A0M4RPcJpQXnf2mmv
JOB8UDvqih5T0zfzwb0GzB3wkQ3DvU3knwSO3wgXSXqzMvTfOXp0CA1OyDj+F52y
/Z2S3wAd7U81wsGvRbsrS7x4dEB9IpvgUhZhQCndmngxnsX+zJWe4qq52aSPB29Q
UEOQrnvrm8MnrmkSLooD5pyw8BW4YyPTGesLrt/0aeMafKXyC0p0A2mrmXk2EQPO
Zx/WEn6i47M5aQ4U4gWEjPyNB6QTvQ==
=TaIU
-----END PGP SIGNATURE-----

--IbneGTeFWohgL8Hm--

