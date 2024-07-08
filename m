Return-Path: <linux-renesas-soc+bounces-7158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C6F929E83
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 10:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D9F1C22776
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 08:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E935E1CAB1;
	Mon,  8 Jul 2024 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az7wP6lP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C479A2D05D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720428813; cv=none; b=sVRKTgI3LpduxkFFB3YgfD0YqS7TuPh6SE8ZyPgTp16mxjzSysbGIW3TLemDdZm2FknE1eNKmJyNC3VchH/ff44is62zyjhRpmOavNget5H3CUbGKj4s2ZW0cCwZpJGqFC6VqZ5TkUOhVrGM9Fgb6GQyDjDr4ccpjU4DcYcYv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720428813; c=relaxed/simple;
	bh=r6OJ9UCaupziUyYIHNank9rLNfRQpHSb6hJHw20AvoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtY5JkCpgaMsmmjKx28hiX8cIyhiqn4qP4069+yS9wb1PehEPsmi67no5oP3U/lOPnPl+gImXVVdIbz2gB262sf3ABEwde8D82jtTYKuspXJpgAm6mvuSuleplQK1vTbxdjPvxF2Ar7bwenDqmPoW+TsdGF5uGE9z8inclGkLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az7wP6lP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016F6C116B1;
	Mon,  8 Jul 2024 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720428813;
	bh=r6OJ9UCaupziUyYIHNank9rLNfRQpHSb6hJHw20AvoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Az7wP6lPdqbHK6DkB3QNNa4ePVFxiEyL8r+tT/9TRlx44wQv3gcUnd9UP0PIe8/y/
	 4lXqG1m2fqCTVDBxzvOFQCAw+ax3O6/N83oQ4uQ74PTJMS35jwN7f3IxgpoBo7pUYR
	 wWYAjLE3RXPNI0EHRi98HalVlh7OAU3A6aLVtIY2qv81I6n5Kb01423NCCgcFQeFYr
	 WG0ZY45r4yL6vjoK4T7TkKq2uEw43e3GXpcPohMZ/V+wt8VUkTtiO8W4S61Tbglkk4
	 6IOHWG5iudH7ICK6MTwUQTnhGdanCbGWt80r5Mrvx/epfYyl0PJWgKUAe5rsO8MQY2
	 qTvSR/uTteDQQ==
Date: Mon, 8 Jul 2024 10:53:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance
 if RPM_ACTIVE is true
Message-ID: <20240708-mighty-squid-of-glamour-6c1af7@houat>
References: <20240708082712.30257-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ef2jjf62nmsyribw"
Content-Disposition: inline
In-Reply-To: <20240708082712.30257-1-biju.das.jz@bp.renesas.com>


--ef2jjf62nmsyribw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 08, 2024 at 09:27:09AM GMT, Biju Das wrote:
> The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> case it won't call a put. This will result in PM imbalance as it
> treat this as an error and propagate this to caller and the caller
> never calls corresponding put(). Fix this issue by checking error
> condition only.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/=
gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 2e2f37b9d0a4..42a5d6876bec 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -208,7 +208,7 @@ static void shmob_drm_crtc_atomic_enable(struct drm_c=
rtc *crtc,
>  	int ret;
> =20
>  	ret =3D pm_runtime_resume_and_get(dev);
> -	if (ret)
> +	if (ret < 0)
>  		return;

The documentation of pm_runtime_resume_and_get says that:

  Resume @dev synchronously and if that is successful, increment its
  runtime PM usage counter. Return 0 if the runtime PM usage counter of
  @dev has been incremented or a negative error code otherwise.

So it looks like it can't return 1, ever. Are you sure you're not
confusing pm_runtime_resume_and_get with pm_runtime_get?

Maxime

--ef2jjf62nmsyribw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZoupBAAKCRAnX84Zoj2+
drR5AXwIybckdv5i3Zud2xBYF2Sehyjt+wab8QcznHJgNmYMY8qB1EuuoFJ/qapn
tIZcFxYBfRRoz4oyRot4Oxa854qAR1kWsCUWCoCrhMFlaOeW0/yj51srlL/EyYdj
GVeEeKR3+g==
=tPMh
-----END PGP SIGNATURE-----

--ef2jjf62nmsyribw--

