Return-Path: <linux-renesas-soc+bounces-25307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1FFC8FD83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 19:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35A224E21A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 18:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F63B2F7AD1;
	Thu, 27 Nov 2025 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZBFbmT1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1142F747B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 18:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266475; cv=none; b=sx16TqXEZ/FzzfaMgIBXaaZYyIONIw023p0+JD/R3PBN92h1Yymy628CGXQxcF3fWqxYcJuDcQ63bB3N0qEqlPMtWDsv2W1jgPdRFRhKbPM5vDNZW4+A2/5frIofaVBxQaC3O+RU45eHxzdFz3diwD95/eCfAqMdetZW6R51IQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266475; c=relaxed/simple;
	bh=U7xUd/700hfi+Eb66XLB48sYWJGPiDoz1Cn7ILjaGdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umih7WPf1FNxDkHZdvmje7RGBsE64pVusKucKXZfMeJDhhP2n468jb+abP/5zNkb3JhZyfdX52tDtHdv1G8r+o/ISN54CoJdDe0aPaiFuxu/gYmXzVYj/7uVIT8Q17TOeexsmjtjyHXS6lITyK7OX3fs/AVCVvE+4Al/Ms+yvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZBFbmT1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02AAC4CEF8;
	Thu, 27 Nov 2025 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764266474;
	bh=U7xUd/700hfi+Eb66XLB48sYWJGPiDoz1Cn7ILjaGdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZBFbmT1JkjRs2aVb44ZpQNuz8hYZ0vPnx1zVimYbDiE6hIciSUP2ehr4sD2NYPev
	 Jq3LQxhkG04dyXPPYLme8Yvd46f9V6hqQkKJnf3WCHyI3kbqqrNuq3wVZE5mvVFLxW
	 00WYF3qnsTybvUaSVrXdMNeqaa93rOjmJv72e/pbucCF1Kg4EwMLd3a8uW+JXDyWU5
	 bh7a24VFZSvK6jG5IQSfxDFVaIzm3ykE2iD0WwzYiJofP3jabRRsURhSK6GOSXiSU1
	 6lIhg/ojidU4GDwfBk486a/+ztBBCV/EH58f5LWtK3sIi+aY8EIhOk5Jwqvw9YXL8q
	 wu+vO4Ma7wcZA==
Date: Thu, 27 Nov 2025 19:01:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm/mcde: Create custom commit tail
Message-ID: <ltb52hd55qqvx7zgpjmrzk67mii6fyjgrnspbreqymffs3ri6p@tje4bog4xkg2>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
 <20251121-mcde-drm-regression-thirdfix-v4-2-d89bf8c17f85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hpmiitbfpy5j5brk"
Content-Disposition: inline
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-2-d89bf8c17f85@linaro.org>


--hpmiitbfpy5j5brk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] drm/mcde: Create custom commit tail
MIME-Version: 1.0

On Fri, Nov 21, 2025 at 03:08:32PM +0100, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks when used with MCDE.
>=20
> As the CRTC is no longer online at bridge_pre_enable()
> and gone at brige_post_disable() which maps to the panel
> bridge .prepare()/.unprepare() callbacks, any CRTC that
> enable/disable the DSI transmitter in it's enable/disable
> callbacks will be unable to send any DSI commands in the
> .prepare() and .unprepare() callbacks.
>=20
> However the MCDE driver definitely need the CRTC to be
> enabled during .prepare()/.unprepare().
>=20
> Solve this by implementing a custom commit tail function
> in the MCDE driver that always enables the CRTC first
> and disables it last, using the newly exported helpers.
>=20
> Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-=
v2-0-8d799e488cf9@linaro.org/
> Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Br=
enesas%40mailbox.org/
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 37 +++++++++++++++++++++++++++++++++++=
+-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_=
drv.c
> index 5f2c462bad7e..290082c86100 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -100,13 +100,48 @@ static const struct drm_mode_config_funcs mcde_mode=
_config_funcs =3D {
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
> =20
> +/*
> + * This commit tail explicitly copies and changes the behaviour of
> + * the related core DRM atomic helper instead of trying to make
> + * the core helpers overly generic.
> + */
> +static void mcde_atomic_commit_tail(struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev =3D state->dev;
> +
> +	/* Variant of drm_atomic_helper_commit_modeset_disables() */
> +	drm_encoder_bridge_disable(dev, state);
> +	drm_encoder_bridge_post_disable(dev, state);
> +	drm_crtc_disable(dev, state);
> +	drm_atomic_helper_update_legacy_modeset_state(dev, state);
> +	drm_atomic_helper_calc_timestamping_constants(state);
> +	drm_crtc_set_mode(dev, state);
> +
> +	/* Variant of drm_atomic_helper_commit_modeset_enables() */
> +	drm_crtc_enable(dev, state);
> +	drm_encoder_bridge_pre_enable(dev, state);
> +	drm_encoder_bridge_enable(dev, state);
> +	drm_atomic_helper_commit_writebacks(dev, state);

I'd like to have a mention of *what* changes here too, not only that it
changes.

This also applies to the other patch.

But aside from these two comments, the prefix change on the first patch,
and the doc comment Tomi had, I think it's very reasonable and looks
good overall.

Maxime

--hpmiitbfpy5j5brk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSiR5gAKCRAnX84Zoj2+
diX9AX9koPaU95KzTGgg9Dj11IkN9i6RBMqraCnN8MvcU9+j4/b0WGO//Nx0qvGI
6x2/zIwBgOsj9H9qyIKa2eemQul1x/ZYQBu3c/MywNMot9u8DTebVG+9g8BT8dIU
qexk7TESAA==
=rOX4
-----END PGP SIGNATURE-----

--hpmiitbfpy5j5brk--

