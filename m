Return-Path: <linux-renesas-soc+bounces-29865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLgzMOXCu2n1ngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:33:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D7C2C8BA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BEB5332F2D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C7136CE16;
	Thu, 19 Mar 2026 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gS0vfbQV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD85A371892
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911759; cv=none; b=qPhutqe0nLKTCmN59QL0D6SaY0yBEg5a9t0XxJgF9/vlYaAdhaGbJP2rybQRoIp3lt0alcpYOAG+h9vkPX63m5xZ2thISwZtzf1gXiT8Huo2ITAVD+WMY5hA3FIhLhtDtEwsvyqf0zjvvEPmjOUHev4q+Rq9UAQDOdobkffcJRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911759; c=relaxed/simple;
	bh=5MUxlrZvYaO1P9msdYJteUwwsoiIpGtz8pgfb2/6sz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiF2KPFyCEGJrrHFDqq5vNUn9g7R7qKSE7sRBMhYBlFqyMJ+V127CV7GIuMrp/F/dnRwwupTTlg+KHWh53R2xTJBkq08GcbEOb66f38bkBh+sBo/SUcGY1a4duPItWbmmFhYNU6jYWFSgtPTUdAL8bnfPfP5zHdX34zpdrlae04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gS0vfbQV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Y6fO
	rOIyHNqsFQtlmKe2RUHwoMJ5kRFWpE83hWNSuMw=; b=gS0vfbQV0S0dTQ1HVZpg
	+in45mNz5mvP2src+QjYrFSw7DtXkGXQb8rUlare0zeQMmLoP+lDIBcpuPI/6pT5
	SR6TX0nJR8xaNWjC2uKXzjZY8kfYoYTkP7aRhjHqwy4dxCsEyZ+NEyF6idncxSFN
	dDr02YdcvI1ylVowr0FSEtj8i6Eb5TGLxwX+BO7kdyZtRoB9SwdCAseVEx3x1T5C
	gWiWOTU4k5nSDXs9a1NZIVMXbeFUg3Ko9vmiplJe7A2MjOFZiRtlp1Ecml1nLLjZ
	2wHNpVi8dJ8rAsEb6diLPiikdKlpX1Ylyjh44oLRjqHNFyX0USo5yiGLt70mD7Rj
	qQ==
Received: (qmail 1063099 invoked from network); 19 Mar 2026 10:15:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 10:15:51 +0100
X-UD-Smtp-Session: l3s3148p1@BDfSA11NnqUgAwDPXzF+ANZpdrMKUeLI
Date: Thu, 19 Mar 2026 10:15:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding
 documentation
Message-ID: <abu-x5nIyfNAeRmG@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
 <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0vsTkbPapHsCJC3q"
Content-Disposition: inline
In-Reply-To: <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29865-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,glider.be,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,189e0000:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 27D7C2C8BA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--0vsTkbPapHsCJC3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

thanks for the review!

> >=20
> > Checked with 'dt_bindings_check'. Family-compatible values are not
> > introduced here because MFIS is usually very different per SoC.
>=20
> Not sure with what family this would be compatible, but anyway this
> should be explained in commit msg.

The family would be "rcar-gen5". It was a close call where to put this
paragraph. I can put it to the commit messge as well.

> > +description:
> > +  Renesas Multifunctional Interface (MFIS) provides functionality for
> > +  communication between different CPU cores. Those cores can be in var=
ious
>=20
> so kind of remoteproc? The soc directory is dumping ground, so you
> should find something more suitable if possible.

I did this. And this was the conclusion because the IP core *is* kind of
a "dumping ground". This paragraph currently might be biased by what we
want support in Linux as of now, like mailboxes and hwspinlock and
product register. But it actually can have more like boot status, error
injection, error detection... and who knows what will be added in the
future. Since DT is HW description, I will update this paragraph to
mention the extra MFIS features even if there is no Linux support
planned.

> > +  reg:
> > +    minItems: 2
>=20
> Drop

Ack.

> > +    description:
> > +      An interrupt name is constructed with the prefix 'ch'. Then, the
> > +      channel number as specified in the documentation of the SoC. Fin=
ally,
> > +      the letter 'i' if the interrupt is raised by the IICR register. =
Or 'e'
> > +      if it is raised by the EICR register.
>=20
> Describe why is this flexible. These are fixed devices, very specific
> SoCs. They do not come with randomly routed interrupts, usually.

It is not flexible. The interrupts are static and so should be the
naming. The above paragraph aims to describe that. Let me cite part of
the example for "renesas,r8a78000-mfis" from below where all interrupts
(triggered by both, the IICR/EICR registers) are routed to the AP core
interrupt controller. Note the alternating 'i/e' pattern:

	interrupt-names =3D "ch0i", "ch0e", "ch1i", "ch1e", "ch2i", "ch2e", "ch3i"=
, "ch3e",
			  "ch4i", "ch4e", "ch5i", "ch5e", "ch6i", "ch6e", "ch7i", "ch7e",
			  ...

In comparison, "renesas,r8a78000-mfis-scp" where only the interrupts
triggered by the IICR register are routed to the AP (the EICR interrupts
are routed to the firmware controller). 'i' pattern only:

	interrupt-names =3D "ch0i", "ch1i", "ch2i", "ch3i", "ch4i", "ch5i", "ch6i"=
, "ch7i",
			  "ch8i", "ch9i", "ch10i", "ch11i", "ch12i", "ch13i", "ch14i", "ch15i",
			  ...

I think the above description is technically correct. Maybe it is not
easy to understand, though. One improvement I could think of: add the
SCP case to the example section as well, so the difference is more
obvious. Note: I decided to use 'pattern:' for describing the
interrupt-names to avoid 128 const entries for the IICR/EICR case, and
64 const entries per IICR-only or EICR-only case.

> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    mfis: syscon@189e0000 {
>=20
> Drop label and rename node - that's not syscon.

Yes to drop label. Not sure about renaming the node. Given the above of
the "dumping ground IP core", it is way more of a syscon than of a
mailbox controller. If there is a better common name of such a device, I
don't know of it and couldn't find it when grepping around. "remoteproc"
might be somewhat closer but still...

> > diff --git a/include/dt-bindings/mailbox/renesas,r8a78000-mfis.h b/incl=
ude/dt-bindings/mailbox/renesas,r8a78000-mfis.h
> > new file mode 100644
> > index 000000000000..89489c2a4847
> > --- /dev/null
> > +++ b/include/dt-bindings/mailbox/renesas,r8a78000-mfis.h

I am wondering now if this is the right place for the include file. My
original intention was that it should go to the mailbox-dir because it
handles only the mailbox-part (second #mbox-cell) of the MFIS. But
maybe all-in-one is better? Other flags are not in flight currently,
though.

> > +/*
> > + * MFIS HW design before r8a78001 requires a channel to be marked as e=
ither
> > + * TX or RX.
> > + */
> > +#define MFIS_CHANNEL_TX	(0 << 0)
>=20
> 0, bindings constants are abstract (so without dedicated meaning)
> numbers, starting from 0 or 1 and incremented by 1. Shifting this
> implies there is some other logic and that would mean - not a binding.

I'll give in and do it. Using fixed numbers instead of bit numbers
sounds more error prone to me, though. But we don't need to discuss
this, I'll adapt.

And I will change the $subject, too.

Happy hacking,

   Wolfram


--0vsTkbPapHsCJC3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm7vsMACgkQFA3kzBSg
KbZn3RAAqOD/aosdboodul6BMz+njzKXUlP8GCBpuHl9SJbfIt9cuwQEeUnZCJUr
LIYt6QxTP02t+dZ/6jTGHlh7dvEpciuCQncEhe5FAn6hCGhVYlcboOL6S/L72mhU
uqUFIUrzI0zczLqUZvf6klzCPt6V3XS2KeMy6vGg+ZDP8XN4zEIufILPolNjWzCY
8mBSKnM3NtT3gdQadxQzJuHg63pB3JPmwRLj7oHVdvB08qWzdOCT+9xA0t1PgAxE
cyqzlXnSwdFspLiLff9A+/qnkNXfRDzd5SnuM7WbUo0BLBDezpFtvbiZRHfuWp0R
GcQ5RKfy4cS1KvjKbLhXAqtsRGNWryZpJWPkiy7TPe8t74tKNyhnZtNVPcbjdvdH
HmLsw96xtJcQ60BOZ/iGj7laCU5nwnKvMtOKCtRRD/wyugA/GjWd1PjIyFZzVtMq
EzvzIrEa+o9YbDaSDIfP0GgLZUiyYwxcZyNPfgB3tvyW7nuvQh51uBW4ZJGeRiw6
DsfRQQlQys/FGhpr2X6wPxb8w6Gi+3UwS7Gx7P6zFhGR5IxHVuoWjzBMkO/g6qHL
TXe8XqSeKz8CfYBGc4iqSIfAZtzZL8DG34xK/jV0VWBOdcqIfvw6HVIbpIoiV7DZ
CloLV/r/xxo6jv8/ZMuXAV+9fyA/v6hX7kNqZrJ+bCZtB0Nk+jY=
=Pavy
-----END PGP SIGNATURE-----

--0vsTkbPapHsCJC3q--

