Return-Path: <linux-renesas-soc+bounces-33096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHubFAuCFGqnNwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 19:08:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AED5B5CD270
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 19:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B62130265A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 17:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6773F7AA6;
	Mon, 25 May 2026 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQWFmpq8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431AC3F4105;
	Mon, 25 May 2026 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779728865; cv=none; b=jz2z+g9YzfVJUNIqU7TTNKhlxxubw3fbBIHGJvYrigwBbeUcjCi4ENHueok+U5DK3/EVrUYoHw1YwIpZLY0bjnE2cSL74bYaEHv51cA5N3x1iZR9El05q878R95q8u0j4nVdJwi6lZInAK4kh+1crD7kOAmAediYXrJhi7bfZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779728865; c=relaxed/simple;
	bh=2NuiB/7pVZs7/mo6om4ZDvUx5zgg7W0lkmX8dVqOGIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuXcmhmpzZhNWoN2YrG0FamqCUfECzsR0ebOXP6WfTA18teq87Qc99ERFospxjtsE+/uiECU2n4F3NkAVt9Qfsx7tUgFjWx4YsBDI7mAOlE4K0tx7tZkv2ec2giS6hSd0qZ3zacBi1GA7H0TcwIu/Dls0wxedLa/qJt83c6wCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQWFmpq8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5851F00A3E;
	Mon, 25 May 2026 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779728864;
	bh=8qfT/VrLn2tMM7E8cHORdw+2KnFn7ArQRa0hGXS5lDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NQWFmpq8vC+x8uNWDP26EH7FgL5cphbqS7JmqfKxnqGqRshb2DhLEg10AVLewKdaP
	 bUTBWencX3rdpSO7mun4txdyPxT62uFaHNskfz/VAZJGAUX8yQLvARQQXQE1j6c8Va
	 PXOcsB2yt8t4MzdHaMS7kD55ojPBnuOARR0IYRwI9MQDeezVK0XcsZyh7o+DAQieUk
	 UFBQKrE3yiPMIzx26YFfL/b2X/dNI5YLPC6D5u+hWFPNBZGaMmvY7+kYF/oDzl3MlX
	 5lGMTMtJLwzKq0QSQeiRw91njNczx+ffT2KcXlFwbOX3bWdYO/QyHn56rd9ZEufg5V
	 53RhvNV/0jdzQ==
Date: Mon, 25 May 2026 18:07:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.au@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Message-ID: <20260525-camisole-unmasking-3e28b6471a9b@spud>
References: <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
 <20260524195829.960401F000E9@smtp.kernel.org>
 <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vw1OibTdUJGoJ2s2"
Content-Disposition: inline
In-Reply-To: <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33096-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,108a0000:email]
X-Rspamd-Queue-Id: AED5B5CD270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--vw1OibTdUJGoJ2s2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 08:45:00AM +0100, Biju Das wrote:
> Hi Bot,
>=20
> On Sun, May 24, 2026 at 8:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Low] The compatible string 'renesas,r9a08g046-lvds-cmn' is used in t=
he dt-binding example but is not documented.
> > - [Low] The parent node 'lvds-cmn' in the example lacks a 'ranges' prop=
erty, breaking address translation for its child nodes.
> > --
> >
> > commit be595c0db2d85d9ea1396f0f30ac7ad75f4101fe
> > Author: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
> >
> > Documents the LVDS encoder IP found on the RZ/G3L SoC. It supports
> > single-link mode and shares a peripheral clock and reset signal with the
> > MIPI-DSI interface.
> >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas=
,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/ren=
esas,r9a08g046-lvds.yaml
> > > new file mode 100644
> > > index 0000000000000..b1f6d020ae7b1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g=
046-lvds.yaml
> >
> > [ ... ]
> >
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
> > > +
> > > +    lvds-cmn@108a0000 {
> > > +        compatible =3D "renesas,r9a08g046-lvds-cmn",
> > > +                     "simple-mfd", "syscon";
> >
> > [Severity: Low]
> > Is this compatible string documented somewhere else? It looks like
> > renesas,r9a08g046-lvds-cmn isn't present in the tree, which might cause
> > dt_binding_check to fail when it validates the example.
>=20
> This compatible is documented and is in next [1].
>=20
> Q1) Can you please reun the AI review with [1] ?
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/?h=3Dnext-20260522&id=3D51284d8b1dbcd7fa0220c49eeab29b14617e0d88
>=20
> >
> > > +        reg =3D <0x108a0000 0x10000>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <1>;
> >
> > [Severity: Low]
> > Does this parent node need a ranges property? Without it, address trans=
lation
> > for the child node's reg =3D <0x10 0x8> might fail, and dtc often warns=
 about
> > missing ranges in simple-mfd nodes with children.
>=20
> I don't get any error or dtc warnings. Have you ran dt-binding check
> before providing
> such comment?

=46rom what I can establish, it mentions the checks etc but never actually
runs them.

--vw1OibTdUJGoJ2s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahSB3AAKCRB4tDGHoIJi
0qWaAQDXJEWm12vTIZGORwuQfIlkVHJJbCWaKQ7fVBmpRD5ZPQD+Ks8UZvEGOxnU
8OT3fJlAKKQeQDQEeVRruEGe9/AQJQo=
=/8sT
-----END PGP SIGNATURE-----

--vw1OibTdUJGoJ2s2--

