Return-Path: <linux-renesas-soc+bounces-33940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HWoLBtgpLGotMgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 17:46:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D81567A99F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 17:46:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qi2zcq2u;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C7D03210C55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 15:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5EA388E76;
	Fri, 12 Jun 2026 15:45:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0A39891D;
	Fri, 12 Jun 2026 15:45:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279130; cv=none; b=X6UHE4QynUw3zf2VLR591FjyaGV4C2G9D3BseM8iqOor+8F7A5KvotI388fOHNi+p3cmuuOlA1qAdE/xB6/eIRaJW55JUguDBUjg+ir9JhwePpusP9N/+XLMzY91kouyK9lFzs37I9PlH0KOUzSz+BiYYK/nmlQfA7BRRUi045Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279130; c=relaxed/simple;
	bh=nssTccH/fom4WxtJhBNQyeipR0ibvOC5NoS4H7s0qZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfzXlMxkdMgPgu1EQ7ACX+QhzvRm/TxIdRINmphDAIAB5aeU+dpKHlVvVIh6UL02BBfLuY2UaeH70tjqrwjF3xe5W5ALEFcaCO1H62IZF1ejOzqGAi+tZ9/7TE1WK4FJgZXadO8z/DpveupkHHig+IMsvOkraiEp4S/Pk3KNRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi2zcq2u; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70881F00A3A;
	Fri, 12 Jun 2026 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279129;
	bh=yksJgZT1TIIqAj+SwsimufQX/7BGhemntFDwwyJfiVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qi2zcq2uapaQitk//jYJWR4MfBAvvIusIGAWr1pjDA2uoRmRwy4sJJZtxEejWAw0q
	 1PlzVmCOYHZ8icQCWusRsZy7ZHPtI24ufJsIsRxcZozjD2cPi+ymZAWCVV7F+OqYkN
	 O2xYUN67Y4Y72f9M0kNnatGM9/oBFjLrmKrJg5tCiuUS4ppnTPF2/sd0M9E9i6eTyu
	 iqH1cH+fpyBoR1ZnO4K7ZNNcP6+6uA7iercyB6NGrhNh7xoRlbbf5Am3SeE/SqoC0A
	 voo57Owtkvyyh9GONlRW0HT+DhGjv0ZaVcgzuUhjjpIfI0BhP/WBb9qADsledAhmYD
	 IUQhZBkE1WxSA==
Date: Fri, 12 Jun 2026 16:45:25 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
Message-ID: <20260612-unmanned-lankiness-3d48b43f4bfd@spud>
References: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
 <178127350175.916476.16317522760209240659.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T1We9rblDBdisqj3"
Content-Disposition: inline
In-Reply-To: <178127350175.916476.16317522760209240659.robh@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jic23@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33940-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D81567A99F


--T1We9rblDBdisqj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 09:11:42AM -0500, Rob Herring (Arm) wrote:
>=20
> On Wed, 10 Jun 2026 17:29:20 +0200, Geert Uytterhoeven wrote:
> > On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
> > Controller is located in a controllable power area.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This fixes "make dtbs_check":
> >=20
> >     arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: cache-contro=
ller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the =
regexes: '^pinctrl-[0-9]+$'
> > 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
> >     arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: cache-controller@f01000=
00 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
> > 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
> > ---
> >  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
>=20
> Applied, thanks!

Thanks Rob, was at an awkward time for me and would've probably sat til
rc1.

--T1We9rblDBdisqj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiwplQAKCRB4tDGHoIJi
0p2vAQDbkVb43B8FyxcRpYlkxaEtWJo8tOl2iytGMKCtRrdLcgEAzmSlrTs0apxM
XyTOs0uAWpgY5L5WEw41TLOF6W6Ekw8=
=KpFr
-----END PGP SIGNATURE-----

--T1We9rblDBdisqj3--

