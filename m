Return-Path: <linux-renesas-soc+bounces-34164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wmTxA/eVMmrr2QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:41:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E4A699CE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=aETghjgV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 582453017028
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6153BB110;
	Wed, 17 Jun 2026 12:40:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601633A4539
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:40:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700043; cv=none; b=QUDgcYcFpLeusvZRQGwzam64k+9sjvMGONeQw7lWYkvLzSBT+kKptRRZRLca74T6uHuy9qbhlbaT20SvWzrt202GLys1sGH7XtUscnvRz8dB5hIUFFakS5l2tMvJTB5Qv4ESXq3NWU4nflu91a+2+H8/basbxAeMoDInW17TbYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700043; c=relaxed/simple;
	bh=BPNn79QH6dCOg+WW2W4C8dom87L2+SMHJay5mH3339g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8Q0JSdEJIt/hz2+TfN7fBU91dx53Jdj39mUvd5eel22c/MSLJ+FCknvmO4nNsCfEXpO7oiDMeiNUWrVZd7pv3klqw8KxC6j5Kh8BphqVUKm4TwlwqUBqhvtiEoV1tjSIFhT1HtgdxiP7gyGJv9D0vnJg+7JdFIQO3cwZ1etVP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aETghjgV; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3jmb
	8Z1lzR5MdulTAX2D07+NwS6tRWrrCQ832vHemuY=; b=aETghjgVb9jSoTk1TSX3
	9TiBvV06JbTVFAoUEpURdYF5vJXrs1Zfau52uhSOmIwa0lYBDlx5tDfHyg76nuCZ
	+hwhTqRUjuwHZzOUA6wO2R0pmw/QgEUsg7UJ0GVWoJC/ZnqfGAJ9gEul5Wsg9x3n
	1tuzZOvWFG2kEcmUXX0SVz5VI+csydoyrCjaTaZhoLvVlgXzFyQR0Vwjunhbzo8R
	SKA/okVsN5Wll2FnRHVP3OWOCWDQ5FdHLCRzWoVaGzzzNUWUFoJ+7WyDErB2ib+D
	bXpVLPIH6JYkm81nsT4VZd78S3Hs4uS4OL+m0y3H6NRNefrfw8I7cpO0hcGozNko
	+Q==
Received: (qmail 166700 invoked from network); 17 Jun 2026 14:40:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 14:40:38 +0200
X-UD-Smtp-Session: l3s3148p1@zNHdXXJUcI0ujnvI
Date: Wed, 17 Jun 2026 14:40:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v17 08/17] mmc: renesas_sdhi: Add tuning_delay hw_info
 flag
Message-ID: <ajKVxixgTHaavVfi@shikoro>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-9-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ml/AFwrmDB5Oy2Qt"
Content-Disposition: inline
In-Reply-To: <20260603065731.93243-9-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-34164-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9E4A699CE2


--ml/AFwrmDB5Oy2Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 07:57:08AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> As per the RZ/G2L hardware manual, the TMPOUT bit field in the SCC_TMPPORT
> register needs to be set to 0 when transferring at 3.3V, and to 1 when
> transferring at 1.8V.
>=20
> Add a tuning_delay bitfield to renesas_sdhi_hw_info to indicate hardware
> that requires an adjustment when the signal voltage changes.
>=20
> Add sdhi_hw_info_rzg2l with tuning_delay =3D 1 and assign it to
> of_rzg2l_compatible, enabling the adjustment for RZ/G2L. All other
> platforms retain sdhi_hw_info_generic with tuning_delay =3D 0 and
> are unaffected.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  drivers/mmc/host/renesas_sdhi.h               |  2 +
>  drivers/mmc/host/renesas_sdhi_core.c          | 83 +++++++++++--------
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 +-
>  3 files changed, 58 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h
> index a42934e6d49d..a3c5fa368242 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -44,6 +44,8 @@ struct renesas_sdhi_of_data {
>  struct renesas_sdhi_hw_info {
>  	u64 clk_mask;
>  	unsigned int max_divider;
> +	/* hardware features */
> +	unsigned tuning_delay:1;	/* Has tuning delay */
>  };
> =20
>  struct renesas_sdhi_of_data_with_info {
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 16ed6fd8470d..868ba6a6919e 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -257,40 +257,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *m=
mc)
>  		 TMIO_STAT_DAT0);
>  }
> =20
> -static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
> -						    struct mmc_ios *ios)
> -{
> -	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> -	struct renesas_sdhi *priv =3D host_to_priv(host);
> -	struct pinctrl_state *pin_state;
> -	int ret;
> -
> -	switch (ios->signal_voltage) {
> -	case MMC_SIGNAL_VOLTAGE_330:
> -		pin_state =3D priv->pins_default;
> -		break;
> -	case MMC_SIGNAL_VOLTAGE_180:
> -		pin_state =3D priv->pins_uhs;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * If anything is missing, assume signal voltage is fixed at
> -	 * 3.3V and succeed/fail accordingly.
> -	 */
> -	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
> -		return ios->signal_voltage =3D=3D
> -			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
> -
> -	ret =3D mmc_regulator_set_vqmmc(host->mmc, ios);
> -	if (ret < 0)
> -		return ret;
> -
> -	return pinctrl_select_state(priv->pinctrl, pin_state);
> -}
> -

I don't think this function needs to be moved downwards?


>  /* SCC registers */
>  #define SH_MOBILE_SDHI_SCC_DTCNTL	0x000
>  #define SH_MOBILE_SDHI_SCC_TAPSET	0x002
> @@ -351,6 +317,55 @@ static inline void sd_scc_write32(struct tmio_mmc_ho=
st *host,
>  	writel(val, priv->scc_ctl + (addr << host->bus_shift));
>  }
> =20
> +static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *h=
ost)
> +{
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +
> +	if (!priv->info->tuning_delay)
> +		return;
> +
> +	if (host->mmc->ios.signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_330)
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
> +	else
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
> +}

Isn't it enough to move this upwards? I don't see anything requiring
this function to be so late. Am I overlooking something?


--ml/AFwrmDB5Oy2Qt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoylcUACgkQFA3kzBSg
KbaCdBAAqhh52Jwj80LDuWIci5iozo6qhj5ZUGew5dXD7wPIMbgD0l+6GTB2nDFJ
6/tGlpWXG97NLJuqd75EYK95X1C7BY7XtZewZMH/jh9vyqCZuyYdDMwvtaagALIm
jeMCtsgzeU1KRdEA7RfsxwY8GSlcEqV3n+xuKdOOgyxEdI236/S37+8yAhNGomom
BOFK7OjYOTG7lm23kWRv86oFdFdZDZMFTBl640M8xYTjwZD9xt4HBavbyJGsx8V2
ZaiBaqPsIN+aWbBDorq++aSKau4quZTR1M6abMi+Vf01nYFhRYP0htdwmRUF7jHh
UPwFj8yPyfASalSYzLEWJxvXW14Mg9nh+buQsW1uzrBkbC0rOG5yaqS9oqHguo0f
uaLXl6w/1RRGOBnVkT1XiG7545P3w1a6I4Oho2J2diIQ4CzPqSBS+ENekDUAudkK
2LElyco99EW3R9nscQYWH/JzvqUdNDv57IZev5Nhd1XPxPdH0xz24nPK3ROvEJMX
yroPEBGHyLxQtp3h3TJpE8sw83H0jZhLlDyFwc1yraU6DS8njyy/uCFCWR+paIfD
67dLVTDbgUzT7xtmNi6lQOSYsTuDQQFQ892Q9JxN3z0XxuvaeUA3DHTvaTOyL459
S3dLutg6Vu8k3OgLri07n4+if8I+0J+VcMyvfWGgJ/wqK8ZwRao=
=3op/
-----END PGP SIGNATURE-----

--ml/AFwrmDB5Oy2Qt--

