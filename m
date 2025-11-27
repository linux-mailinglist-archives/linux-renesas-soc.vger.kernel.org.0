Return-Path: <linux-renesas-soc+bounces-25306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DC131C8FD38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 18:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 80022342679
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8624F2F5306;
	Thu, 27 Nov 2025 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hu4hC3Gi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C782F4A0E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266361; cv=none; b=bfT+jHHzHsQYAKDG2spR9DrIv4If+FKWQsNaH8qRZQNnf7Ljod1T8EP+RyOOdF80JGmZHHZ1npyBj6l7I19Wb5OM/EBHvMSuS5hsuFsTXoWrMIA2OK8HFM50Fa3Fp10DJkb1Xoxkbfv5jMGdpCwUmj+LYcwE5+eR1Hqvi5yFEYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266361; c=relaxed/simple;
	bh=P5NP+AMrzLXEuSLMeScxNJqTKmSYfjh1JJJiVnin2z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Whio0n4wOEyaJojYWc4Jc7ZJSrElVy6H8uuOmHS1+aVj8M9Qs0iibeqL+Ephl5GU6jpZ9ZZoAe6kqATrsgauIIpc+WB9T0tOJgZKmgA+sOjx5iAjzw/EJD/ekMwxYW4Y15NDCVKMYLmF6JCUUXFr6a0h5YzCWcs4qXq1zsQel1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hu4hC3Gi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D172C4CEF8;
	Thu, 27 Nov 2025 17:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764266360;
	bh=P5NP+AMrzLXEuSLMeScxNJqTKmSYfjh1JJJiVnin2z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hu4hC3GieK5BZk4r0g1ObTX2XhAXlN7WLNdYvFc6lF1FOeZtWv/VslWLeGwJy3DrK
	 2POmEF1LqO5UXVV/PW+tAcY3/X0eAKj6Dqt9KSkMCCW/F6JIuWrqFhIB16nObYfx3J
	 cbbfgGHp45CauOqyy+iRIXXjXGrQcKcsc0GQxe3qt4M1b3MFiO0Lh1+EZ8asEorfeu
	 Eigyb2s8re0YjB4ogh60qpw+qFS0bTwkU+lM0tipwkhI26TtdvoNJC6J9xZbs4PNiL
	 L4cZvZwC5i/Dv6atrFFu552iliXQL7ZOy69dDgXR40WL3tOjjhevuqlUzFooF6rmT6
	 GD5a//rmCTPAg==
Date: Thu, 27 Nov 2025 18:59:16 +0100
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
Subject: Re: [PATCH v4 1/3] drm/atomic-helper: Export and namespace some
 functions
Message-ID: <zkmtvm37dizdohaffyvg5oouhtzgki3xy4mbo5epgihgg7yitj@7jcxcctryzhu>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
 <20251121-mcde-drm-regression-thirdfix-v4-1-d89bf8c17f85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rb3nteomg2rqcwfq"
Content-Disposition: inline
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-1-d89bf8c17f85@linaro.org>


--rb3nteomg2rqcwfq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/3] drm/atomic-helper: Export and namespace some
 functions
MIME-Version: 1.0

Hi Linus,

Thanks for following-up on that

On Fri, Nov 21, 2025 at 03:08:31PM +0100, Linus Walleij wrote:
> Export and namespace those not prefixed with drm_* so
> it becomes possible to write custom commit tail functions
> in individual drivers using the helper infrastructure.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 54 +++++++++++++++++++++----------=
------
>  include/drm/drm_atomic_helper.h     | 19 +++++++++++++
>  2 files changed, 50 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index d5ebe6ea0acb..906eb4b0852c 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1162,8 +1162,8 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>  	       new_state->self_refresh_active;
>  }
> =20
> -static void
> -encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *=
state)
> +void
> +drm_encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_sta=
te *state)

I think the prefix should rather be drm_atomic_helper_commit_* to remain
consistent, so drm_atomic_helper_commit_encoder_bridge_disable in this
particular case.

This applies to the other functions here too, but it looks good to me
otherwise.

Maxime

--rb3nteomg2rqcwfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSiRcwAKCRAnX84Zoj2+
dtoWAYD33K7Z+FuVrKq4nxWsDeMGW8xIsJOcvOcOp76w9ugYP0FcA/eWxRiHm49r
AZIMMXsBgNGZeqCrMcViFq9mok28Y9hQTO4ebkCWQws1aoKS607HUQyIICawfZd8
M7rQyG8MKg==
=mP+o
-----END PGP SIGNATURE-----

--rb3nteomg2rqcwfq--

