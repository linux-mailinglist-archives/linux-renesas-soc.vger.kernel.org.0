Return-Path: <linux-renesas-soc+bounces-30799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDFUIpCvzml+pQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 20:04:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD438CDB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 20:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA4063021E6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 18:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3929372EEF;
	Thu,  2 Apr 2026 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGUnavpz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF3372678;
	Thu,  2 Apr 2026 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775152966; cv=none; b=ew0VnuEb9/gsy/elAeU1b5+MaEpHI2x3uOCOMpTnY7wE9VyVXQrcsNmiIvJj/kFuzauD9U2yItfPrWV2yDNh59OtNuuiByMQIr9cHJYhaLul26jsOWieBOoffz15U6CzLKmsu8oCXfuNi9IeIuwnBPHMbFmj1rzRcJDbjDAhRUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775152966; c=relaxed/simple;
	bh=066L7zMjpzgeOvLuayU9mcFisLmUfPjkQIQBLb9Pu58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWLZiOzDANmbS3aZY6kMn5KC7/0Ke2niFdkjLFqM43OixjUdTKqh+Lj9b6K78Bdu9YX1//VvaJESGL1RXfZwsohvtfx7v/JrcQIQy/Mdpfl9Z62UrAiHD2ENEr/9Q86i9HVLP2a8Hk7YLMC8aMutMOHk2GaS/W3i/qcmff+fMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGUnavpz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3B9C116C6;
	Thu,  2 Apr 2026 18:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775152966;
	bh=066L7zMjpzgeOvLuayU9mcFisLmUfPjkQIQBLb9Pu58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGUnavpzpOHgSPmJleCniu/w779JJiUMQOH++66lOM1KDJUxA1G87Z1djFEOvmpT9
	 k4pc5fZLuzA3IbA2XBtsI+Vpm1yx58MFy+jfeRKl9tVQwexJCRUeh0LKbKUmNCRKbo
	 r5ZJ1hftr4JW6S6iD3/wGqeVKczkT4xo70aon4FYwHesii+7wU2dNwCjpOvgmVcguQ
	 KSg6lkiEk1Yri33POyiddyDmiVoXo8c11heNRpgsy5d//nomCoStiOltnmYkMg53Kd
	 Ab64PIfOeWCEdYUeO12LQYgZQ9WtDeL7T9+NfhBwh4By+c6+BOfYxYXC9Ymaclr3Ok
	 O9Ns3KbWNrW1g==
Date: Thu, 2 Apr 2026 19:02:40 +0100
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
 supply clock management
Message-ID: <9182f54f-c413-4337-ad72-4a847dd58fa5@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1pTWsH+DIXZncdur"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30799-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEDD438CDB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--1pTWsH+DIXZncdur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 06:24:32PM +0200, John Madieu wrote:

> @@ -376,6 +431,18 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_=
mod, unsigned int rate)
>  		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
>  			adg->brg_rate[ADG_HZ_441]);
> =20
> +	/*
> +	 * RZ/G3E: enable per-SSI and supply clocks
> +	 * Prepare was done in hw_params
> +	 */
> +	ret =3D clk_enable(adg->clk_adg_ssi[id]);
> +	if (ret)
> +		dev_warn(dev, "Cannot enable adg.ssi.%d ADG clock\n", id);
> +
> +	ret =3D clk_enable(adg->clk_ssif_supply);
> +	if (ret)
> +		dev_warn(dev, "Cannot enable SSIF supply clock\n");
> +

Should we not return an error if we can't start the clocks for some
reason?

--1pTWsH+DIXZncdur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOrz8ACgkQJNaLcl1U
h9CNyQf/XZ/UVaxiCv2d4ZbsnvxeuZP2lUCisCDbHgKeu9ApZwmgHSdvAmQXpIGS
dbV/T10m7Q6sBf5A7n69o1fPA+1RJA8p870WMt5n3mTp/RPtReE1TMyYjpU42LRF
FXckkDGjVkx13cNSW4HDh3JLAcqBDV4yRZIhyDujTUJvEHa0KHhDhtu16llB65cE
Wlm4te4BnDa24uyzm/fNKwEUUGIgC4wnXHglsraBThleljxTCmyX9gl0ywHFobIj
axXAuHHwRk/QWlIMyx7snWQhMtniZKD9ZTuQ1v3TYLemBLjmeqRiWU+baSk/TTDc
TqDNSe/riRwtfid31SXFtf8mO8nOoA==
=1sCt
-----END PGP SIGNATURE-----

--1pTWsH+DIXZncdur--

