Return-Path: <linux-renesas-soc+bounces-33558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B9GhDKlgIGrH2AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 19:13:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DC663A142
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 19:13:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UFEizWzh;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14483311A2A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 16:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F2B426ECD;
	Wed,  3 Jun 2026 16:50:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB24266BA;
	Wed,  3 Jun 2026 16:50:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505416; cv=none; b=GePT03789aV/bY8S5GicizdCAKlvEEKUPBIhgxgf7qPP46xg0Q/g0UBwCyMKKljYdQMIAFnkLMde0dCHgBE5MTZ70nI3gs61pqk45v5BQOjHnfuEPceCAf9tlQ0jbQbl7bnVTjZaTjq+p3y1KrSWI70XAxPVMGGQZVEX/M6pZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505416; c=relaxed/simple;
	bh=DnA2JJz5trPES1DFKq8aSZziMagCnw0o1qTisz8fKiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nua2HLr7Hm/UP+dWbVFaK2dzNMXP0i+PeMWlSqmDgezFLQRifOiLDoHdVhjjv7arMOqOLgIJkltu0XkQT5obPAFmC91rWQ9BCHa1uQ53OQPmyeRNkV2v+koYHRL+31zM7boWkGzXrytin40d7Ln3TZHJa55dY1iTn6M168fQOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFEizWzh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F5D1F00893;
	Wed,  3 Jun 2026 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780505415;
	bh=vG2BviYc/C+MDKHIkeN902tisDjjqwsCpaMZr0/n/NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFEizWzhvrAPdwvfrVrrm2pxizZW5BnXpsG+1r/8Z65vNQuUI0dshzxkfck0K/PNk
	 O3AkFM1n8imanlDuEzm9goAMREiiSNUM4dpqpzyyJoXB6JV3Iu5GRMIY0QwKza5zHr
	 QiFHYZs9hY2Mx/a7yW7di0/1bw4cVgA/Efngm1DltKY7VPgkH/hjPOUeuc4fGS5Gv5
	 jty0Up4HUSx5m/d2iBAInQXvgPf8hJUfJL5s6n+uRLG1GNEywwHHAussS7/ZcvEjer
	 HlJg48Efw8GPOOfnQPYyEpxjcqxc4rRTlzDjGyEicDpXAjYgNUSJ9rujYNKfuK9zrM
	 JCTkdQ0XvYWqg==
Date: Wed, 3 Jun 2026 17:50:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234
 compatible
Message-ID: <20260603-staring-cubbyhole-8f803b3ab30f@spud>
References: <20260603110127.23930-1-naresh.solanki@9elements.com>
 <20260603-deskwork-perch-ae4eaf92368f@spud>
 <CABqG17jzv03U5=1zhVd57zDDWFXpt=mX030HVyLUpm5q0LRW1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dB8g81isTGQRJxN6"
Content-Disposition: inline
In-Reply-To: <CABqG17jzv03U5=1zhVd57zDDWFXpt=mX030HVyLUpm5q0LRW1Q@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33558-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:naresh.solanki@9elements.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:grantpeltier93@gmail.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:patrick.rudolph@9elements.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,glider.be,gmail.com,vger.kernel.org,9elements.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spud:mid,9elements.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8DC663A142


--dB8g81isTGQRJxN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 10:10:14PM +0530, Naresh Solanki wrote:
> Hi
>=20
>=20
> On Wed, 3 Jun 2026 at 21:39, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Wed, Jun 03, 2026 at 11:01:26AM +0000, Naresh Solanki wrote:
> > > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> > >
> > > Add the compatible string for the Renesas RAA228234 8-phase PWM
> > > controller, which shares the same PMBus interface as the RAA228228.
> >
> > Given this, and what the driver change looks like, why is a fallback
> > compatible not used?
> Are you suggesting that the binding should use renesas,raa228228 as a
> fallback compatible, similar to how renesas,raa228942 and
> renesas,raa228943 fall back to renesas,raa228244?

I didn't see that at the time (I commented on this diff alone), but yes.
 	{ .compatible =3D "renesas,raa228228", .data =3D (void *)raa_dmpvr2_2rail=
_nontc },
+	{ .compatible =3D "renesas,raa228234", .data =3D (void *)raa_dmpvr2_2rail=
_nontc },
 	{ .compatible =3D "renesas,raa228244", .data =3D (void *)raa_dmpvr2_2rail=
_nontc },
 	{ .compatible =3D "renesas,raa228246", .data =3D (void *)raa_dmpvr2_2rail=
_nontc },
driver change suggests you're compatible with the ..44 device.

I expect that you'll use a fallback in the next iteration then?
pw-bot: changes-requested

Cheers,
Conor.

> Or is there a
> specific reason you'd expect it not to be used here?
>=20
> Regards,
> Naresh
>=20
> >
> > >
> > > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > ---
> > >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68=
137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > > index 8216cdf758d8..2988bc6300ae 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > > @@ -55,6 +55,7 @@ properties:
> > >            - renesas,raa228004
> > >            - renesas,raa228006
> > >            - renesas,raa228228
> > > +          - renesas,raa228234
> > >            - renesas,raa228244
> > >            - renesas,raa228246
> > >            - renesas,raa229001
> > > --
> > > 2.43.0
> > >

--dB8g81isTGQRJxN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBbQwAKCRB4tDGHoIJi
0mQMAQCGJi8T5FIPVvVa+N8QhldtoUD7PcyQabO+Bj51wRxBTAD+IUs8jZSqjEXW
Dws1Sdwpfjd1OR7qW1NmAMkiBuWyRA4=
=vj0j
-----END PGP SIGNATURE-----

--dB8g81isTGQRJxN6--

