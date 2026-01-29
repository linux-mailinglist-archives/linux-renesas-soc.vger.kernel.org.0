Return-Path: <linux-renesas-soc+bounces-27636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPzlMQChe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 19:03:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28518B358F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 19:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D658F3006B47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697AD35580B;
	Thu, 29 Jan 2026 18:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfL9fx5+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4233A030;
	Thu, 29 Jan 2026 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709822; cv=none; b=cYcDvLiVJUaKjYwT839tB7IXpdqEmgpqHaV+9Ei/PE6ly4GeC7HDJdKsW5CRCqiTOMVjrVgv2wW86yKDQ+FSTnRuATWoRKJFBJjFrpTS8GOQDcmLDO38Vvfg+KugHS7fEOoBDQe6Qg6TAAVSyKOnVGdexs9tCoSXzw2vAFpD7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709822; c=relaxed/simple;
	bh=3O7Y/S97E5duVlrX6M/yG0izyWqf2Qifd5CMxnuNiF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lerrQB538dUMX/iAfMLrOurDhj/C5yx/vCzmWMc96hE+2vLOcZA3277CMKHXpiWs9ZQKeRAyFVvwNPTKLQfHJUIXQC/5IaglDZiLR1uBjZcaYXdPtpv0M6bE7Pk8FenFL/7zWxkvQORujnJ3O1ewDz565v7zUTzp8MayPxaG738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfL9fx5+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7180DC4CEF7;
	Thu, 29 Jan 2026 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769709821;
	bh=3O7Y/S97E5duVlrX6M/yG0izyWqf2Qifd5CMxnuNiF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfL9fx5+lQewpdkTzaj1s5eyS1c9LqSSReSvPsf0Aq2CBbP1OXis6zBj7KfkZA0g/
	 8jGjzNv7xh5Ftkl7t3HaVhgDzP3wwFOLl1wrAC3ro1aKThAY2Mxd/Modi9/qXwGood
	 K6QlcfxBempLyyCaQF0DYpuNev04pMqI7Pp0T5XGqlHECjVodT6cT53mMJVDXrz/NI
	 pydSKk4FFTAuSf/cb6ed6DFmaWRTDaQmWxTNThF61tFohu5hg2KwKAwcDEPfPUZpkG
	 bd1WhuzMYD/SNXivEFqIDt4n3pZgLks8gclhQGpVgeSLNiFctBIdRMXEa/8MCoBgsr
	 10gMC3DNzE2aQ==
Date: Thu, 29 Jan 2026 18:03:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Message-ID: <20260129-crispness-fit-4b573b563070@spud>
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260129-thigh-yoyo-b1e6cf9d455d@spud>
 <TYRPR01MB156199346D508EFE1F0F94349859EA@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bnIP9adUZ7t6O9FV"
Content-Disposition: inline
In-Reply-To: <TYRPR01MB156199346D508EFE1F0F94349859EA@TYRPR01MB15619.jpnprd01.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27636-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 28518B358F
X-Rspamd-Action: no action


--bnIP9adUZ7t6O9FV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 05:55:21PM +0000, Cosmin-Gabriel Tanislav wrote:
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Thursday, January 29, 2026 7:45 PM
> >=20
> > On Wed, Jan 28, 2026 at 11:51:30PM +0200, Cosmin Tanislav wrote:
> > > All supported SoCs have multiple DMA controllers that can be used with
> > > the RSPI peripheral. The current bindings only allow a single pair of=
 RX
> > > and TX DMAs.
> > >
> > > The DMA core allows specifying multiple DMAs with the same name, and =
it
> > > will pick the first available one.
> > >
> > > There is an exception in the base dt-schema rules specifically for
> > > allowing this behavior (dtschema/schemas/dma/dma.yaml).
> > >
> > > dma-names:
> > >   anyOf:
> > >     - uniqueItems: true
> > >     - items:
> > >         # Hack around Renesas bindings which repeat entries to support
> > >         # multiple possible DMA providers
> > >         enum: [rx, tx]
> > >
> > > Allow multiple DMAs to have the same name and only restrict the possi=
ble
> > > names of the DMA channels, not their count.
> > >
> > > For RZ/T2H and RZ/N2H SoCs, limit the number of DMA channels to 6, as
> > > they have 3 DMA controllers.
> >=20
> > What's the rationale behind not setting minItems to 6 here
> >=20
> > >
> > > For RZ/V2H and RZ/V2N SoCs, limit the number of DMA channels to 10, as
> > > they have 5 DMA controllers.
> >=20
> > and to 10 here? Do any of the spi controllers on these SoCs not have the
> > ability to use all of the available dma controllers?
> >=20
>=20
> I left minItems to 2 in case it is necessary to wire up SPI to only a
> subset of the DMA controllers, maybe for performance reasons in a
> board-specific dts?
>=20
> I know that dts is only supposed to describe the hardware itself, but for
> now this would be the only way to pre-select which DMA controller is used
> for a specific IP.
>=20
> Let me know your thoughts.

Yeah, I can buy that argument.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bnIP9adUZ7t6O9FV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXug+QAKCRB4tDGHoIJi
0mL1AP49Fq3/vN9HHhJMRmS/NgEAnh6bLOkFJHUl2185ybN+egD/RtCKuSyULCPV
/PnJlykI1VIvTL0mw/zg9kWCicOCqQg=
=XzvV
-----END PGP SIGNATURE-----

--bnIP9adUZ7t6O9FV--

