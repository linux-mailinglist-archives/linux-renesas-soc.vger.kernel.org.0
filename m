Return-Path: <linux-renesas-soc+bounces-33435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hN7rK3j4HmoxbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:36:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BE62FD53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:36:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NnCevYMK;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8222E30B089E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 15:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B172D3EBF0C;
	Tue,  2 Jun 2026 15:06:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B063E866C;
	Tue,  2 Jun 2026 15:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412780; cv=none; b=AM5z3+3FVwTbxC3CBYT/cEPc3aoSU6NAFtsRX+R7EPnAmj9FxAYbK73tLei3ndhrmwVrsl6QXCq3OOTH/3IRmi0/utQGzYpxXmgvGvycZ7c2nFC3gPiyw1tYjPOYxdS0r38Fag2B2EKSTGEiEJ7EbnM49dZw4Twcio7EfUHy67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412780; c=relaxed/simple;
	bh=/qDh6glUqJG9/CGdc2rsf6urAuT/oRosIX/vQk+S0Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2ZuQBbjamcA+PoPChVnpoR1qK+Qxo47p9re50iMonT9RxAZz06/sPfXvAIVWK9KMIlYceHhrwuGTGJMJDTHlZIZRQbnlgwxXmLxD0xgifqf2MwFC7kqHXO7n9qdWk//iTAzsiDROKTIbybTU662RMXup+84sVEw0599IIh9G/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnCevYMK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04011F00893;
	Tue,  2 Jun 2026 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780412779;
	bh=6pKmZ/dzoUsp0qMEiTbEP3JNPcfP6yeX1skgJisax60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NnCevYMKe3vepac/omn2XU8h8dP4YVML0a+aXS1aBG6L21OGpNRroEkZcE1v8IWcY
	 Jr8GigbO2ydOsupOwgEYVRH4KxEhEll+rUkbmYf1e8BG80wHC/Kysccw4pKGE8i8KP
	 0Xh9GHB56tTDoflogwpC7WVMebaJUJYUG+9ufOFt0OHT7cN1Ip2bu8ffakMw32r9y1
	 AShcnvWkD2n2ioO1O9rAxmAmgkpwL8BDNDa/Tv6uuDtTUsVUx/DcUlsKWyz+YfeDr1
	 jMlO6yvdjc2H6MPVUK7kBp9l1DuoqhPz4WiaM0XeoynwTiyQwx4kR5cE44t/KWisZq
	 YHxFbQreG0vvw==
Date: Tue, 2 Jun 2026 16:06:13 +0100
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 01/18] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Message-ID: <e4eb9d9d-9bc5-464e-a73e-f6871c5e0582@sirena.org.uk>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
 <20260525110230.4014435-2-john.madieu.xa@bp.renesas.com>
 <20260602145527.GA211368-robh@kernel.org>
 <987befcc-2fd2-4d4f-8293-72df4dbc03f3@sirena.org.uk>
 <TY6PR01MB173772D84C91DA67CDD557D66FF122@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rCN1v4T/e48+g5p5"
Content-Disposition: inline
In-Reply-To: <TY6PR01MB173772D84C91DA67CDD557D66FF122@TY6PR01MB17377.jpnprd01.prod.outlook.com>
X-Cookie: The wages of sin are unreported.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-33435-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:robh@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:perex@perex.cz,m:tiwai@suse.com,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A92BE62FD53


--rCN1v4T/e48+g5p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 03:01:19PM +0000, John Madieu wrote:

> > Please delete unneeded context from mails when replying.  Doing this makes
> > it much easier to find your reply in the message, helping ensure it won't
> > be missed by people scrolling through the irrelevant quoted material.

> Noted.

That was more for Rob than for you.

--rCN1v4T/e48+g5p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe8WQACgkQJNaLcl1U
h9ARVwf/aiY9DSoMbmhzDZg0L79q/J6m0X/uNlaRb6HTBXNl2X3ghP6UT4MHxCPl
WgHOqnNbwOySPtnNmWKLA9DPDAATJmfC6OJYnHXA63wo26vpAdlRF2MTu8s2CBxx
DChE7MGiaRb2OazQfDIbCjWZD/ur6MQ9cCiXmelV2jIvGVcK3HZsQGSeboiEcsGp
lthsQlRF09hjqWy9Hggf34Xc6LM3wf7jHUJPQljS8Sp5LwVzknURcTtO4So/fD6q
zLpryzonhScF3jZBtICV4cEBsS85W1pzkt7C3i68JaUBWkgoJNS1npSz3SU6V2dS
unZL5o1QGczFU4yygdFXF15z+64yEQ==
=9QJJ
-----END PGP SIGNATURE-----

--rCN1v4T/e48+g5p5--

