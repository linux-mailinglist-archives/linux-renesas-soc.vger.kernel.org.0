Return-Path: <linux-renesas-soc+bounces-23859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66EC1B91C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95D6D5C0103
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4352C346E64;
	Wed, 29 Oct 2025 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EA5hadol"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DE346E47;
	Wed, 29 Oct 2025 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748664; cv=none; b=FT7MB1iKR7NkOZ4M/MIHBPjFPXG4BMsRygtI/fsEOagWtB3HYaZMvcNhmOuq6xUQAizGrkpOujgm8q1T6IHitUMv9sw2s31mX2XArE4mIPgoio4g5DErHuyrC0oUAsgozEia8eOKL0QAfsBmqMyAew1i6O3KSueiHn6g0D9092s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748664; c=relaxed/simple;
	bh=QD7flLnygd6OxWCHzh3wt/+75KhuG9aLqY8mFe3H+k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5naEpCikrB3JwSkuO6moTfsDVJ4E+yemJSt63OW8q/0TdLtLlO7jOqnkv52uVBRdTgH0Glj0caUUfAbVODvCxx5N/rTn/nF1jz4jvO4964lsLAfmQGvCnzXRsY6pq+v3LVFdqFOVqxZJVWVnS37hteT/Oseih2BRLu4czPm+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EA5hadol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2359EC4CEF7;
	Wed, 29 Oct 2025 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761748663;
	bh=QD7flLnygd6OxWCHzh3wt/+75KhuG9aLqY8mFe3H+k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EA5hadolUlNS8XBLjAbWjWxZqC0mZRQZ4vx+iY8wgUFIFz0+1phLv4YFTCluOltTe
	 17JjmaAJef9oFxATOvD5nbUrVKsFhrBrt7m+5lh2xzLx1eUpTdfE2zOBu5ofXoPPtr
	 bok3jmrCZ+q8qftanlOXjUnBeJpFVyKTrg2Hlm/zf1L9BwC2UU7LD/xQQLBKUgeQUL
	 UYeSNnZyaIFG/cHion4UreRoxeV53dV0EsT9Xez9pGpgnmN3S9X6GgDwp+NurG/zc/
	 O+rSQtk/687yX0OtH3CeDtstB+IHV8E2c5HW6v9tLF2reC5f6AYwNR1AUBAiBaN8Hh
	 JJP63bTgrs98A==
Date: Wed, 29 Oct 2025 14:37:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: Use component driver suspend/resume
Message-ID: <bdb14543-e611-42d0-a603-300c0ea17335@sirena.org.uk>
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
 <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+KE6RXr3vwOlMnlL"
Content-Disposition: inline
In-Reply-To: <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
X-Cookie: Goes (Went) over like a lead balloon.


--+KE6RXr3vwOlMnlL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 04:11:33PM +0200, Claudiu wrote:

> Since snd_soc_suspend() is invoked through snd_soc_pm_ops->suspend(),
> and snd_soc_pm_ops is associated with the soc_driver (defined in
> sound/soc/soc-core.c), and there is no parent-child relationship between
> the soc_driver and the DA7213 codec driver, the power management subsystem
> does not enforce a specific suspend/resume order between the DA7213 driver
> and the soc_driver.

The theory here is that the power management core uses the device
instantiation order for both suspend and resume (reversed on suspend) so
the fact that we use probe deferral to make sure that the card
components are ready should ensure that the card suspends before
anything in the card.  If that is no longer the case then we need to
ensure that all drivers have system PM ops which trigger the card, this
won't be a driver specific issue.

>  static int da7213_runtime_resume(struct device *dev)
>  {
>  	struct da7213_priv *da7213 =3D dev_get_drvdata(dev);
> -	int ret;
> =20
> -	ret =3D regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213->supplies);
> -	if (ret < 0)
> -		return ret;
> -	regcache_cache_only(da7213->regmap, false);
> -	return regcache_sync(da7213->regmap);
> +	return regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213->supplies);
>  }

This seems obviously buggy, we just power on the device and don't sync
the register state.  If the device actually lost power during a runtime
suspend then we'll end up having a bad time.  There was also no mention
of runtime PM in the patch description...

--+KE6RXr3vwOlMnlL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkCJrEACgkQJNaLcl1U
h9AUWgf/T2O7Q4nQj7aLrpOb47HnTCyYTW3KTH0+OvqmSueoik4TrsKBrle3TOWK
kOFFNVbarcfSwmRY2K2x8zbMga1a0oXTAqdcQgt+AuP81HsjP4RE+RYKYd4ZUyYO
XuvALyqZb/u+8MoxJ0nej2YCidGy/7DIZBSnBP4cgXonaYU55Wo6VZUegMGHc3Xo
Vm8zCltflRFLQbQehVBv43k73v3VCn5bHGSvfiPjSVFFpMYDJcKwGCW/AMbe5YMd
XQTWuuVWHyaGor6+t/HoZWepCkAwlmuAqHPtC5jlCFgFZQv2mVsfvD1mkV7MPnLh
/F3FFYrUZSiXdUTxk4LCspWAysAj3g==
=hw/D
-----END PGP SIGNATURE-----

--+KE6RXr3vwOlMnlL--

