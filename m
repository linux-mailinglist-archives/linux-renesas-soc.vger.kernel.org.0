Return-Path: <linux-renesas-soc+bounces-24740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFDEC6ABA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 17:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 82E392BF61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 16:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A24B27AC31;
	Tue, 18 Nov 2025 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBHyHE70"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3B26CE2D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484583; cv=none; b=n2zhHJqYJ/mig8xOU2oqtFgeJIWblLu+j3G6dSyZjR3KJV+qaXrcSRFU7eVoJGThyq7S1RrT320bqbClpCgbNVSgyAOiQ56+wkma/C9hjYLDEeh3zcpvgSt+Lolwjj1NTZS0HqGVTyDQHpFq3o4A7KZlRA3I2QxsIMp9FKVEkgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484583; c=relaxed/simple;
	bh=i8Tsgj/qMoP8iQFAFXkeiyPZiwBea+n+HCYt7T9sGJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQ+JgQJNIIgTvGIQccNqsda2sPnExOHDZ1grKkQBye06aQ2LuTFVBSUMxBVc/M6blyOGM2lp/79QImp1cysua5Rc8WyqAb1OINkux8ONP3B8T/WcnkURlsMrUvpsom3u+TFf7zPugUbSUJNCgdGvMXBKZV0Z5JP3V1A5loOfMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBHyHE70; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D252C16AAE;
	Tue, 18 Nov 2025 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484582;
	bh=i8Tsgj/qMoP8iQFAFXkeiyPZiwBea+n+HCYt7T9sGJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBHyHE700S35tc23A2ybTpgL2BrkbTwYPmf3uAXsfQ7iNy8DYZJXQ6aIafQ8VFfhT
	 zQg9hSmtYV9tNkRx54uDAruoz7miUBrWjqjBZz9zRziTAWtzuC7SlRU51NJv7qjjcv
	 R5ZNRPGBzosVairpAPGOV8zv8MjVxOwnL/a+qEw2acaojJSUfGiv+xs2hqrj3E34Ii
	 kwHOp55tUT3/5jWu7mcTVi9+Epl2vaZJlT2mJ2LCFT0155JKhv3sI9TMSf/qw2YrOH
	 tRHvp+Nn8lfKysmldVORF/vmW5O0dCL1kpFcguo9dyHGws7HbqQWR1PmOSxi1zMelm
	 ZOE+T59Y51ocg==
Date: Tue, 18 Nov 2025 17:49:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU
Message-ID: <2v43kghgrw7qeh7l77czahr5ms34raykviuzetdbda7wuvh2ic@mc5stkequmh3>
References: <20251107230517.471894-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="33wsdvvmpdbglial"
Content-Disposition: inline
In-Reply-To: <20251107230517.471894-1-marek.vasut+renesas@mailbox.org>


--33wsdvvmpdbglial
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU
MIME-Version: 1.0

Hi,

On Sat, Nov 08, 2025 at 12:04:26AM +0100, Marek Vasut wrote:
> Introduce a variant of drm_atomic_helper_commit_modeset_enables()
> which enables CRTC before encoder/bridge. This is needed on R-Car DU,
> where the CRTC provides clock to LVDS and DSI, and has to be started
> before a bridge may call .prepare , which may trigger e.g. DSI transfer.
>=20
> This specifically fixes the case where ILI9881C is connected to R-Car
> DU DSI. The ILI9881C panel driver does DSI command transfer in its
> struct drm_panel_funcs .prepare function, which is currently called
> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
> and the DSI command transfer times out.
>=20
> Fix this by restoring the enable ordering introduced in commit
> c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
> and post-disable"), to enable CRTC early.
>=20
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_atomic_helper.c           | 24 +++++++++++++++++++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
>  include/drm/drm_atomic_helper.h               |  2 ++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 5a473a274ff06..c0cdd36a03df1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(stru=
ct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
> =20
> +/**
> + * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit =
to enable outputs, start CRTC early
> + * @dev: DRM device
> + * @state: atomic state object being committed
> + *
> + * This function is a variant of drm_atomic_helper_commit_modeset_enable=
s()
> + * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
> + * where the CRTC provides clock to LVDS and DSI, and has to be started
> + * before a bridge may call .prepare , which may trigger e.g. DSI transf=
er.
> + */
> +void
> +drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *d=
ev,
> +						    struct drm_atomic_state *state)
> +{
> +	crtc_enable(dev, state);
> +
> +	encoder_bridge_pre_enable(dev, state);
> +
> +	encoder_bridge_enable(dev, state);
> +
> +	drm_atomic_helper_commit_writebacks(dev, state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
> +
>  /*
>   * For atomic updates which touch just a single CRTC, calculate the time=
 of the
>   * next vblank, and inform all the fences of the deadline.
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_kms.c
> index 116ad9605704b..b7e2a735a03ae 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -547,7 +547,7 @@ static void rcar_du_atomic_commit_tail(struct drm_ato=
mic_state *old_state)
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  	drm_atomic_helper_commit_planes(dev, old_state,
>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);

Just like we discussed on Linus' series for MCDE, we don't want to have
an helper variant for every driver variation. If rcar is the only user
of that helper, rename and export the symbols you need, and roll yor own
commit_tail implementation.

Maxime

--33wsdvvmpdbglial
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRyjogAKCRAnX84Zoj2+
dmk6AYD5CsYty/IQaEeXnGws/aqHkXoWfExvsCS1VBPBsnpSLxaRhxPCMlN/VhtA
Q5/KfTcBgI41obEwATFZ87RjN3xbSzhOYaBiRyLc/BTvSnClPR8KyxGqiMd/pNua
9kQNAS9+Zg==
=OOQw
-----END PGP SIGNATURE-----

--33wsdvvmpdbglial--

