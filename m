Return-Path: <linux-renesas-soc+bounces-34161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z6AVL52VMmrY2QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:39:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE8699CBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:39:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="ae/6khS8";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAA8B300C929
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C50C3F1AB2;
	Wed, 17 Jun 2026 12:35:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE26D3F58EA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:35:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699752; cv=none; b=mh6hRVBrI62haf/2Iqhiy5+PPSQ4wyfGFWlIP8PENQnambQPvdI/VouYtLSwQnvp1bnS4B3k691UUOR5vj1T2J8ojAyM+57zPfW+pBRpmtxsn+YYLeuwbo9oIFSgrXhZH7UpoDqJf7KAO32GixB1jIkVU5JacZq8XGRoWO7b4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699752; c=relaxed/simple;
	bh=KC+ZXjDxPZVDDLH76UG2iit2I5xfbD2dPJeQblzuMzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUMovun4oic5/oyARqqkHveepAIPaGe/GnnCjWNlCjSZ0AHdSCdyfLn4c+VxBCX1mwYwXIBMitmLmcc4lyVb3bLS/7vrgljFQUiEBK12VqztWtMieAjwVpJI7CEYImwOFW3IB4ZurUol63JlsM2P9h6HTDzojMA6vx2FUTGdeyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ae/6khS8; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KFZ2
	yxL3BFsZUdUfuDksN6EzE0vGtrKj9GOXVWnTgAQ=; b=ae/6khS8QjY2U7vQdp+u
	b6oR4Vw1pBstNY6z85lzSN2ewUJcujLjiJRcP9OH7Ohvn0dQQFQmR+mVLoCjmpKX
	L3YS15MFbgIUx9vI0XiwEVsIjJmnk/T2iM5d8N76O9R7WK9w8C5pAZv2d3OOHSDK
	nOe8AsOpQQmSa+T5UB1xsPswr6tpWVckUdxqVUKbKiZSG5rOLuiOC+jY9SdKbGwS
	P/wFW1XiXh/4JfHUPTeySddphhQzM/ztwem75571WeO9Vi79mps8lVQKC/DeS2W+
	a6qBWlIo7OASy22EkBWIrQil3HCO3huVHl80pQsTRU5gw54TqNlwj8cwq8mC0lWN
	gQ==
Received: (qmail 165056 invoked from network); 17 Jun 2026 14:35:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 14:35:48 +0200
X-UD-Smtp-Session: l3s3148p1@ufmdTHJUUKkujnvI
Date: Wed, 17 Jun 2026 14:35:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v17 06/17] mmc: renesas_sdhi: Introduce
 renesas_sdhi_hw_info to abstract clock mask
Message-ID: <ajKUpOHCaufy42NH@shikoro>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/uvNf059UeDEhJ6G"
Content-Disposition: inline
In-Reply-To: <20260603065731.93243-7-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-34161-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21BE8699CBF


--/uvNf059UeDEhJ6G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 07:57:06AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC has 11 divider bits and requires a different clock mask in
> renesas_sdhi_set_clock().
>=20
> Add a new renesas_sdhi_hw_info struct to hold hardware-specific
> parameters, starting with clk_mask. This replaces the hardcoded constant
> in renesas_sdhi_set_clock() with a value sourced from the per-device
> hw_info, and widens the clk variable from u32 to u64 accordingly, as
> clk_mask for RZ/G3L exceeds 32 bits.
>=20
> Wire hw_info through renesas_sdhi_of_data_with_quirks (internalDMAC path)
> and a new renesas_sdhi_of_data_with_info wrapper (sysDMAC path), and plumb
> it into renesas_sdhi_probe() so it is stored in the per-instance
> renesas_sdhi struct.
>=20
> All existing users are assigned sdhi_hw_info_generic, preserving current
> behaviour. No functional change.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  drivers/mmc/host/renesas_sdhi.h               | 12 ++++
>  drivers/mmc/host/renesas_sdhi_core.c          |  7 +-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 16 ++++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 66 ++++++++++++++-----
>  4 files changed, 81 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h
> index 09bf9b24a8c3..a7fc525b7218 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -41,6 +41,15 @@ struct renesas_sdhi_of_data {
> =20
>  #define SDHI_CALIB_TABLE_MAX 32
> =20
> +struct renesas_sdhi_hw_info {
> +	u64 clk_mask;
> +};
> +
> +struct renesas_sdhi_of_data_with_info {
> +	const struct renesas_sdhi_of_data *of_data;
> +	const struct renesas_sdhi_hw_info *info;
> +};

? Why don't you put it in renesas_sdhi_of_data and tmio_mmc_data
instead?

You wouldn't even need to put the default value in all other of_data by
using:

In the 'if (of_data)' block of probe():

	mmc_data->clk_mask =3D of_data->clk_mask

and outside of this block:

	if (!mmc_data->clk_mask) mmc_data->clk_mask =3D <default>;

or something similar.

The main thing is that we don't need a hw_info struct IMO. It should be
already all there...

Same for everything which gets added later to hw_info.


--/uvNf059UeDEhJ6G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoylKQACgkQFA3kzBSg
KbbQGA/+K4DFfGUrP0eZsG1su+fQ6V40Th+vxpM8U2EfrAKSPkj9ae4ZH6Ckf7qd
dpjkGAOSzpK/fy5aFqViEFZf004NX33r0ZNRs2WQ+wlvKfMkMR3o21BhqY/raZK3
dtBzq/uy1JHA5kJPKOXldQOyF5tIydfKjHpIxPPwkdU1CilXPVpytLhqISylRYQN
OOl8wBBiFfDP9IkCQRhI/leXt4Y1YeP2h/N6rDRDUTIp0COPd7PeIN0rGuciJgPw
pGVO9M/k3cIpv0Vath3Pt02tOd7TuedEZC0cLviJUHq/E9QAqSHdRsrMYUsyPOYM
c6U1yH9ly5f8evR53fTJ+mSCV8TaveqaTrbCE7U5B/PUr4FJiRUlhRojz4cJKPx8
95VUFa5dB3kowQwK1QxQfP8v8/uxs/+f2PB/m9z9Baq9RsvTihKdw/BAD9ya2kjT
S/DKfRx/QQb9Vv4gL5ZjuirLTduFLQzcSo//08znAP78x1YpVs6j76c0SFALtjra
7il8rL1UxUtFDc3+rD2tC5Ct/7w/e+AzEOm66eVmsKRBSEmB47dTsQepxrkZQVzp
S/bVZIobuE6/gw7geLPssZdGnzfrtl9vkuuzmDM4KkH316kwonai4N7+dsVAF5Iu
khCj0wNuymOxK+x/QZXyRB5ZG9FXaUNPUcvB3nOjzGwHT7L1oa8=
=7dhg
-----END PGP SIGNATURE-----

--/uvNf059UeDEhJ6G--

