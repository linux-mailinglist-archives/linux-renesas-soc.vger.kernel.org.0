Return-Path: <linux-renesas-soc+bounces-30758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBaZBhCDzmmDoAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 16:54:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8338ADBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 16:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EA8D3028023
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 14:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B663EBF2F;
	Thu,  2 Apr 2026 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLns/IpR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB961BF33;
	Thu,  2 Apr 2026 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141507; cv=none; b=fllhgrty65q14L/0ZYNWhN5n73IJh14TqEP1h1oih3fPCN97krFpC0beEXBoI2ERmXn4feUq98WlpgMOSJYsHlEhoJ/LcfL/4bsSg6H3ugImOK1+TsOFQu/XEQDh+nC1bRWhEGnA3kabo7HGpcFYpGLmb0PTT7/ONeJGA8DblaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141507; c=relaxed/simple;
	bh=VUFh9+TbLYDRaDpO5Wgxz1nvZb9guLri2scnoWJfA4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxPqny+j3/PsFRacqhxfginQPhz6fWJ/LFrKtZg8DMt7CSgQ2k3pUIssanopnmpZnSGNfb9XG5HPEdXl4emGNOWh38h+fECuqoK2VtbpJA52x3+XErFNXonUeoaZBflQSvDXSCKIf/iEnJqt87k8JFPQtp858t3gwiEKs5WDz1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLns/IpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61944C116C6;
	Thu,  2 Apr 2026 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775141506;
	bh=VUFh9+TbLYDRaDpO5Wgxz1nvZb9guLri2scnoWJfA4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLns/IpRHmX45lvd3wX83Sj5xRnzgg1GW3lhr9d3HeGgiomhiD2+7T/HslE71EUQb
	 0cdo1nkPq6oGUythmVqmayojx9zmGkyfpKiv8D7iKiemw+Dui3bccftK924FOCnIX/
	 PhJpR/7QH7dClHtb74PD7N5JHtlTxACOBtonk0wf70lop8PomVT/uLbn/wH2njXicc
	 IcX/LxV1Mdktp5NiheQVGPUHz1M5dnVu9g0stTHk7Iv+no+pMaMR2Cr6aBm88/oKaW
	 UlkttJxe60mqhh1eryY4E8oNFUCCm440U+s7+vxNM2d8Y6JkXbn+D6u8vWukaZLH82
	 OF/V7ItSMfteA==
Date: Thu, 2 Apr 2026 15:51:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"biju.das.au" <biju.das.au@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Message-ID: <fb4a0a18-5fde-43a7-8b2f-3b79656e78eb@sirena.org.uk>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f6fd2e18-d5f8-40fe-a4d2-7894bd232da7@sirena.org.uk>
 <TY3PR01MB11346472F87787030828ACFFE8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aG99h/5xHYPaPpqG"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346472F87787030828ACFFE8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Cookie: <doogie> dpkg has bugs?  no way!
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,renesas.com,glider.be,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-30758-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: B4B8338ADBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--aG99h/5xHYPaPpqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 01:32:29PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: 02 April 2026 14:20
> > Subject: Re: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
> >=20
> > On Thu, Apr 02, 2026 at 01:00:28PM +0000, Biju Das wrote:

> > > Gentle ping.

> > There's strongly negative feedback from Krzysztof...

> I believe Krzysztof is complaining about patch [1] and his
> comments were addressed in [2].

That's really not at all clear from the discussion.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

> > Please don't send content free pings and please allow a reasonable time=
 for review.  People get busy,
> > go on holiday, attend conferences and so on so unless there is some rea=
son for urgency (like critical
> > bug fixes) please allow at least a couple of weeks for review.  If ther=
e have been review comments then
> > people may be waiting for those to be addressed.

> > Sending content free pings adds to the mail volume (if they are seen at
> > all) which is often the problem and since they can't be reviewed direct=
ly if something has gone wrong
> > you'll have to resend the patches anyway, so sending again is generally=
 a better approach though there
> > are some other maintainers who like them - if in doubt look at how patc=
hes for the subsystem are
> > normally handled.

> There is no pending points, everything addressed in [2]. that is the reas=
on for
> sending gentle reminder.

There's more there than just "make sure you've addressed review
comments".

--aG99h/5xHYPaPpqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOgnwACgkQJNaLcl1U
h9DOLwf/Tj1Wo2u7/cGcByY//+fYDSarUqWYxBtOXL8UmDT4ks/oGEqUSpdXqRHw
y+um5uo+EAP5m7oETluG4eR0bNtxEe4Ea0XzGd5aEjCidbFVRn8t/cQP76Augk29
DpXoRNwB4EcwL/jiCCTihzNZqSMaYVQcKWRt2H30p2ccxcFnTHDjz3MK0jQ4Uut8
CTYFXtSjp6UgzdJkwottjg3nJar7/Acn8pnn6+gxc6L2sAYhKxLjSqGfyuZQGsDI
XjOSY5l3pJD2ZdY1+ifSn2/4BfT7pjnwE+wkJlNmUuP8U4QAn6mR6fu5xZDUfxom
NbNclC32mgV1ufbB10VIDYOOq34AHw==
=MguR
-----END PGP SIGNATURE-----

--aG99h/5xHYPaPpqG--

