Return-Path: <linux-renesas-soc+bounces-34166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id veaGDnSYMmpB2gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:52:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A9699DD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=IGqZm2ZI;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9281B301727B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DFF3F9F58;
	Wed, 17 Jun 2026 12:51:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9C23E320
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:51:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700710; cv=none; b=mY/KGlw1CwTb2XH4OzpOngfMl7vlrqKuGnLBOvDAUmMk/6gNvKqjXxKHVRU2FPXsAUTPovWwWTBDvo8AA/o2Az/1cK5/L/Gl+niKrqySIrW2zv659/NFsww316ThP74r42xI07Uc3Uwa7P99/0wPTO1tNPgYxTA6N7mu9wNXBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700710; c=relaxed/simple;
	bh=3OMSbXXSJBgJuS2aSfLGI/X7EKZScaKZ7Tm/2ckn1p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JShdlRidTQmXrvQEZH30X9sNRFLjTsjZ8ihm6TVCho1tzGH1G0b16nASXOEMCyUXyZd6wLL/4f9c0FSXnp2y8SdVkMPfhlUDrKh4k0fA2EOy9nuIbO/rzg3AYgHDiI+z2IaSgiRxNDTc4PW6G5lNlN02U/mwmHIPu89mKlN06eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IGqZm2ZI; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3OMS
	bXXSJBgJuS2aSfLGI/X7EKZScaKZ7Tm/2ckn1p8=; b=IGqZm2ZIg4DNVVxt7wQd
	r8zalYr8nYxgGWiTip2z8TgF0nrt2TLevSZOOnx7B6sWLpEn7KoFr+udMqvc9Zly
	p3i25pNp5Oa7zOv3fzfqPTIr04f1s+bfTah8STbvawzUIRizRQHpX7Y14x7T/4Q8
	kjlzWuv43EqhJ3ZEYWdUpcA1ebtSXUTQJMSGDcoQ3pCxWjslve4MxAtQoWpLjF3/
	PeYp+l0vZsqWJ2zp2ZSw0LwEcBQtsOPgzFUljGK8sGE0JkRG0yl3l/9aoLB+XOyZ
	jpaU3Guoe/pU8smiBZCFeYY6ovBd1BjdatesKmCX2KttBtDCcYF3CX02Akx1nLn/
	pA==
Received: (qmail 169906 invoked from network); 17 Jun 2026 14:51:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 14:51:45 +0200
X-UD-Smtp-Session: l3s3148p1@sW+ghXJUvtMujnvI
Date: Wed, 17 Jun 2026 14:51:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v17 11/17] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Message-ID: <ajKYYMFV4Xpwq0AR@shikoro>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-12-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ATTgMl+jhbh88ko"
Content-Disposition: inline
In-Reply-To: <20260603065731.93243-12-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34166-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,shikoro:mid,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B0A9699DD2


--2ATTgMl+jhbh88ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 07:57:11AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add support for the RZ/G3L (r9a08g046) SDHI controller, which has a
> new hardware version register and also has different tuning registers,
> internal clk divider, 11 bit divider, 3 resets and 5 clocks compared
> to other SoCs. Similar to RZ/G2L SoCs it need tuning delay.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I need to get myself docs for this one and stop here. But as said, I was
focussing on high-level stuff for now and we have already got some
points to discuss.


--2ATTgMl+jhbh88ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoymFwACgkQFA3kzBSg
KbYq4w/+KMWsmEEeuDE/2Yw95FpmeQmc+UiL3oSO3c6H+ZiMk9/oLR8w9hP16EyV
Ba/1GSmkgLukiqEHxqdppE7N500xNpd+h5of6G7HkCFtBicfsFQfoyOD5oxEYCY/
2JN+fwIzrF9aOYF2SUPO0w9quhZnWZh9/3xMHuf5Go/1Cy4Keic3R9gduW9azku8
SuvxrCj7/5zmwKvAg8VWAQ9M8XTklMVFZQ3R8yjI36QgVzDSh+a4oIi39P/mbEX0
wAWSgzQ/8aeqc3v+AsK92MBM9DxcnZlF+WGHYAvbrQP8Vg12DZnbuKnoYBedzuRr
sWJYKlnDYqxakVArhlWMaRbWVbllHnI3QiGTuEFzv4/iWVnDKHeRoXZhgajRUM9Y
azgbdbiQHPO6Khwr6fDlwla4157PvD9eroeVnEoRb7BltMKKXp4lzbZrGFFWEOWB
nqgEpZeP+dpTsVi81a45t/taZzO09ebXf+qQyjHaaMNEyUw8dGONzCc3xSR6bjFS
4mRfYOHnt7TtOMxzvaFybMlUe31ZsjiRB078EfvW5ziS9A0nrRLY2MtiboND6tWH
kwDe22grN3d7XUs6kHBk05hJKhEdtG2cA9Vh+58Azruzvf6TI/bULQHXwQfwZis1
GqxgIOkzJoN4uKOPUujIlFS27SmE3bT5BTPap2VxCljtvMOQVZg=
=2yYm
-----END PGP SIGNATURE-----

--2ATTgMl+jhbh88ko--

