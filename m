Return-Path: <linux-renesas-soc+bounces-33319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JivHFA8GWpVtAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:12:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C339C5FE5D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE6EC3001CD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 07:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A74C3A872E;
	Fri, 29 May 2026 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JfaamHv+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269C3557F3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038449; cv=none; b=RPNofUP92RDu5pGpVwQ1+EYCJoKQKdzaoI+SJs+RJu5rB4MNgnNbjA2YAf2KpVEiYO3UqW5KF+TKrYjr7fXXrteIgmH88k0hNXKUz2mXRc7b27l5kundzM7qX9lRqW7Tp94/bPwktzE6KQvj6ex5n0u61aLgWxY+mcLqHN7mE/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038449; c=relaxed/simple;
	bh=ev4ZPPzOorzXF62CoJXzz5vOQqD3Wc84N9i28pkxXh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKERz5HqQLMRKakzOiarZyyLNGevUuWYrh+NaV+K49OLs3JGbvcOFl3DDu2Po4CPo+z+FS6pvujrW+KzC0lZu3Aghs7DTO2xlO9HUNvgHQK71UXu1Uk2y3B28YKWUWoj5YoqGEWvKjnqc5EihZ5A0CSf4FgbmVRCiUXCWIovXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JfaamHv+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2j5o
	Qxr42D/Svkj0wK6A2TbZkELep9wQlgsJU2GP4P4=; b=JfaamHv+QTDG17/lbmy4
	VnYEwX5opPQaG0vat+qOMY9f6a3uhF3PGkhlllJreHJr0jnDz2A2Sor0Ll1EKdc9
	HrTNKfXnFO+oRgQwTI27HTaA7Mvi7NV5NkV3azTD6iJBGVoS9pefLkFihoeGoJMj
	w/HJauZ/9XcAir2zWFb8W7/YRFYDQZeUk3zvFxOnQzJZWZKrSyXXhUbvxTtMc3Bt
	Uql73WdWTqMT9Hy+0IVdq5R8760+bQSXT9xE4PnESgo3FZgJ5mPQI2bsJK7GpRGd
	vI8SBt4LTIQ0q5roBCJXZh8SeHhKg6om5LVMzDJusxtGZRWAllMRZMOGGkzmdRq5
	Iw==
Received: (qmail 1308941 invoked from network); 29 May 2026 09:07:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2026 09:07:23 +0200
X-UD-Smtp-Session: l3s3148p1@7pEPf+9SQuKSABmE
Date: Fri, 29 May 2026 09:07:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] soc: renesas: mfis: add R-Car V4H/V4M support
Message-ID: <ahk7KnHHRFo3T0bE@shikoro>
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ii82VLbWLxabUL8E"
Content-Disposition: inline
In-Reply-To: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33319-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: C339C5FE5D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ii82VLbWLxabUL8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, May 19, 2026 at 09:56:17AM +0200, Wolfram Sang wrote:
> Here are the additions to the MFIS driver in -next to add V4H support.
> A full branch for testing with the SparrowHawk is here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v4h/m=
fis
>=20
> To trigger the mailbox-test instances, I use:
>=20
> $ for f in /sys/kernel/debug/e6300*/message; do echo "Hallo $f!" > $f; do=
ne
>=20
> Looking forward to comments!
>=20
> Happy hacking,
>=20
>    Wolfram

Any chance to get this into 7.2? All tags are there AFAICS.

Thanks and happy hacking,

   Wolfram


--ii82VLbWLxabUL8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoZOyYACgkQFA3kzBSg
KbZpPhAAjMcodMuobAQo3BWQwEO+WMCM79Zh2LA+ShePxZV+DWaWQjBPAL9OD2ZL
KKkctTuoGWY0hOJh3RusrWWBCRNsCNdATEFKuDxwnfxSs7tGkblKX8+bSYIHGRhN
2A+kUJR3TCMHIHWXPJBz7OcryvwvcDYym1MEeCP2T09lf23rc1fahXWqgp2LTfPi
d7GOoCu4+XAqVqlId60h1SXZfCyamzD6dzIU/VLKAh3x75nEyLhqvKkZ+I3Pv4pd
L6qMZTN+Gw+lYonfxAD9Hy2XUXWb9yJKf0HoNdjw6L4exJ32YoB1XJ4bSATs+Que
RVZ9FBiVz0mZyvKyjDV2vZC6SKwlU+ZLj5P9yR6zxByPqyvqem1WdBzXR7N5venc
P0lWbOfvXXTetqvhmEmeas1sK4iGiT8XbRt+C2REmbdlnHFq14Djb1ytxQod1+rM
N1OhBgVA5aoS3B+8XTIqE5Oc94JPCHTMU+sd0HBtTiP4fwJcEWhQj53p4PfpGrg+
D0k4WBHcwPZ9Hnfhc4J8RIfLQeo+h/b0mow1A5OQnIAnjPKuueEkgNYS5xzrHRaK
rDsJgHPTFq4tZOnQDiNEhldPQrwoxO09+Vd5xXYZtZpmdCmbOM4YJ/9ba64HmCfp
cCHMSU5iMws0NmMgeHcUIlrIowCwvxcC/d2rZ2XgyS/O4iEZJ00=
=1Wnl
-----END PGP SIGNATURE-----

--ii82VLbWLxabUL8E--

