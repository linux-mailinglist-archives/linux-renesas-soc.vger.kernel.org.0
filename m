Return-Path: <linux-renesas-soc+bounces-30800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB5mA72wzml+pQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 20:09:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C738CE63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 20:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68020304B511
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 18:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EDA374E4C;
	Thu,  2 Apr 2026 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clKEwWZc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E065371868;
	Thu,  2 Apr 2026 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153095; cv=none; b=Evyfjev7ngD9fVzmAit10KcW/fSX+VK24CYNpjmpBv7uQD2S/aLs1UGA84e91OzqhFYKiVFEsXGDZLW/k4yQSaBSV3lEgV6Mk8JHtTTDwYeWa3v+iMD6W8Z1S24XlhX25kIiRWA7ybJUfBXHFK+cb0mJwl2FWmxec/PojDPaWm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153095; c=relaxed/simple;
	bh=JvwAfFUGdFTpRGEEd+8lioWk8QwjLO7dbiWhcVUbZU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOH84SV8oxCxl71KEVLpdAksM3xsZdJMlD+xDb+Qm2uC0HkivoiXIoD60ObLLydidt/kv7PEtbSPbIxjr7eWgLaDePjUl4v0IwqtOPxszC+b8UpnCR3tMFzSgN7p78YKLFyEUrIbKcXm7KyntM8zbCFLXqjiVVVLXdBq6Q7od3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clKEwWZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB20C19424;
	Thu,  2 Apr 2026 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775153095;
	bh=JvwAfFUGdFTpRGEEd+8lioWk8QwjLO7dbiWhcVUbZU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clKEwWZcLzIbSFh6aja3G7V8AT8Z4O3ygPu0zjjqZIsXKa/k4TViOT6HH5GdLYT54
	 i4XSP7eQlZvYKH0seaKSY6HLMd7juRrsSTnCwdyiRUryqXl4WOptnerNCLL7tFAgwD
	 nPLVZ0fZvqjTMtNuiOxw7S9DcjaXYvGAncgrm8YEY8y0+n55RelJ9remCl7g8cGUd8
	 1UyyLiGnKlvvF5bkFbI0NP3Bfb9gwGaIIEwKBxdSA4bzuO6Wy1MSygO6hKpj6dI18v
	 L/q5ogJGeruyfjD/OmEt2xcu+2AWqwT5PXm9GvVt910j414VIHe+H73nAldBHVnWZR
	 ioEslRDcu1btw==
Date: Thu, 2 Apr 2026 19:04:48 +0100
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
Subject: Re: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock
 support for RZ/G3E
Message-ID: <5098f90c-bdb6-4922-b5d5-3794ebc56ee6@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dE48ky0+VmVyCpTu"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30800-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 2F9C738CE63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--dE48ky0+VmVyCpTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 06:24:33PM +0200, John Madieu wrote:

> @@ -526,6 +527,12 @@ static int rsnd_src_init(struct rsnd_mod *mod,
>  	if (ret < 0)
>  		return ret;
> =20
> +	ret =3D clk_prepare_enable(priv->clk_scu_supply);
> +	if (ret) {
> +		dev_err(dev, "Cannot enable scu_supply_clk\n");
> +		return ret;
> +	}
> +
>  	rsnd_src_activation(mod);
> =20
>  	rsnd_src_init_convert_rate(io, mod);

Shouldn't this have some handling like the adg does for splitting
prepare and enable for the same reasons?

--dE48ky0+VmVyCpTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOr78ACgkQJNaLcl1U
h9Bvtgf/QEBXgMsBbAklJErO3U66DqXH0HVqhyihYynL5/v4ckwbB2FcQwR9yyzL
mGEFQBcUSC+G7mTfNDtlpX5cjkQCHV+RnQIjYOejPj9u/M/JiKqLz7re0nggH62R
5z2jDHsp+5azcA2kp8R6ka7VYe4izl9hrVCQX5w7c1VVdKcqJ37+XCcjGP9mRN/k
4MxUXDQRqAqKqgje3mt/8YZGr2J0g4LwXQtCPQN87WRdTm5ESD0uo9pcZ3oBmevd
t6Z1fOt90eVrfEpUPBmD/kLQgCNPf6uL34xO9Kn/4Fgo563qTMHfzazMyaoKWEp5
FUkRyOUA8ODvY9ePPZ2cvaOAkuxqLw==
=brm1
-----END PGP SIGNATURE-----

--dE48ky0+VmVyCpTu--

