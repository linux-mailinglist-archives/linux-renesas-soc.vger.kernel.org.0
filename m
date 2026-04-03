Return-Path: <linux-renesas-soc+bounces-30853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K9jILvEz2lH0QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:46:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C4394A87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E7623013780
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C532F24887E;
	Fri,  3 Apr 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTQUVR2s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217F1A9FBA;
	Fri,  3 Apr 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223922; cv=none; b=I2tn/OWzSZ75FLDDlqv4V2+ZeCKXizrc9MxZw460EIDL/nKoSMtjpanagSVC+rKLf5YQZxb/wv29SS++9TcmbO/fXVfJbwPXbpPim4O1dLccUNSrgs1ocnLCw7LL8Oil5WPiX7PPETmET0S/z4RtEJvMmauYh00VK6/S4xC/VlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223922; c=relaxed/simple;
	bh=8GdJC0f9dgkYeurjPypI7j7QB5DMsXCIWJKiidfLKKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmK6+Ji01bl6v7SvowhuHF5nupFyeQ4T0mnadIBQ2+0Xq+727L9rtUQMz2GasK8zwmRTXR3C0uhZnnYm+Mj7fTKR03QyqrdlDQFb+3juFfXRlhqzIfKsDKrSKntfIEFH335hOCqXl/vRMUx2nsFga0jtcwTxA+KGMdE5IgDT9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTQUVR2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7723C4CEF7;
	Fri,  3 Apr 2026 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775223922;
	bh=8GdJC0f9dgkYeurjPypI7j7QB5DMsXCIWJKiidfLKKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTQUVR2se3smB4h7J9yKnKkFTdztROpgRCbnuL3juSSeiY05YWwTRTEbkzLZWHRU3
	 SkEGFUdDhbnHS79n5+02JqlJJ30Mf+UdNumEseA1cL3hMP/ek1cpaD3P+s8ay0lu+4
	 QfLeYKBWCQ3Osr7CNaaH9AvOfXAZBtL+/eIzzepM7N4kapwCrZ5axaEljkNT4NyZ8M
	 4LkZpUTiLD6gl2ZnShCvowxyejNXBmOyXSgjpM+kO7Mp5HakXr6hhTGnpdB1m5wY4X
	 PM3ehTPfT2o/kYlSSIzTvApAQUtybmwZNAHGhzJIiJsA4hUx4GoE3dCasFYYP7v1Xm
	 t005wEIipftew==
Date: Fri, 3 Apr 2026 14:45:17 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
Message-ID: <2de5ff3a-fd23-4d26-a06b-749ab6d3e990@sirena.org.uk>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qaZK7qokCKKffDWt"
Content-Disposition: inline
In-Reply-To: <20260403112655.167593-4-phucduc.bui@gmail.com>
X-Cookie: The Korean War must have been fun.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30853-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: D05C4394A87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qaZK7qokCKKffDWt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 06:26:55PM +0700, phucduc.bui@gmail.com wrote:

> @@ -1554,6 +1555,11 @@ static int fsi_dai_startup(struct snd_pcm_substrea=
m *substream,
>  			   struct snd_soc_dai *dai)
>  {
>  	struct fsi_priv *fsi =3D fsi_get_priv(substream);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(fsi->master->clk_spu);
> +	if (ret)
> +		return ret;
> =20

Should we also be managing the clock during system suspend, or if the
power consumption doesn't really matter should we just keep it enabled
all the time and not worry about starting and stopping it?

> +	/* SPU clock is required for FSI register access */
> +	master->clk_spu =3D devm_clk_get(&pdev->dev, "spu");
> +	if (IS_ERR(master->clk_spu)) {
> +		dev_err(&pdev->dev, "Failed to get spu clock\n");
> +		return PTR_ERR(master->clk_spu);
> +	}
> +

This is going to unconditionally require a clock called "spu" on all
devices using this driver, not just the one SoC you mentioned as
requiring it.  Presumably this worked at least somewhere (possibly the
clock is always on, or they're just lucky that something else enables
it) and this will cause regressions for those platforms?

This should either (ideally) be conditional, or use _optional.

--qaZK7qokCKKffDWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPxGwACgkQJNaLcl1U
h9B26wf7BKYCzK60pRqnpNOSbpxRukDcC80JyxjYX745AHt2uGxKiA01znXczDBe
qgIYYPBJWwgrAjAhqv9YBj6ya9xT21+REm1qGbD8ISTO2E1iqCfTUnndUGfs2gQd
7FW1Pr6ZboxPS11+wiFDijT45mXY1VO8jJtrOfIoIJmt4RBzNbbCCCV1gZ/fUU4N
dajltmH5YXofA4o/QHZ19GiQvjCPJ5o43FCV7fjceyQo1awZfaDKWSdF4751fyCU
b512XEBPoxyrrB6gmFrFKu0pIMrdy0hOpnQJ6DcoXRzZkdUI05VHuemLcwuaTmks
qKonZ/JLfWLk4Qs29ilwYppGx5yQXQ==
=l0dP
-----END PGP SIGNATURE-----

--qaZK7qokCKKffDWt--

