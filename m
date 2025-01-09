Return-Path: <linux-renesas-soc+bounces-12028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C321FA0830E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 23:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3503A2208
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 22:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB4F205E0F;
	Thu,  9 Jan 2025 22:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="s+jwsQH2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D052054F9;
	Thu,  9 Jan 2025 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736463576; cv=none; b=XrFFtZpKGdJExC8xj65XBisKOGNTO2Q/S9zwnRvL4FAuHpbkhIpdBi0WO1lyDz12I+8rC4tlnc8E7C9OuGF2SZVUtX8Gkv3W719r4WFMDXo3HivPXybqclNy0T42u7LDK7Xt3ecZBts8rIt+Rg1xAwyc2/5T3wTcdOgnzaiteHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736463576; c=relaxed/simple;
	bh=IbAfyCKUbMM4BfqRWRIy3BfY72OJP9ZEtH7KuQecUE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOKESOC3lqRyFLdJZU+dGYQBWA6DjisXHJvpbXNJLwUfgKa6s8eb47OPu/OgerhqNj6W7mJpWJtzoRvrMg4s5yyI0JmMXrEONyHPV1SmctLyyKcFdzfytGCc6Zi6tSKAyNBKz4bOn++mrtRqbCXDWx/xAdS0rHDD5vmCfOb+F4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=s+jwsQH2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5X3Tmvihn3grkA7Jge4RjfqiSvPeilgE9yOD+d9FpVI=; b=s+jwsQH2++ZJTa21jBBjugQMXI
	4bHOZkHr3BtbA6u/uOhHobPv3MGeFWhNFGUl43iw9TYIyTjmoijwv6stOdPuOX44mYtM+Ex4veIlv
	GanP8Ltk9SSPFArY9HIjzDL6w9HBmiDH9lkAf/YRbJ76vQtfeMTBh+9CdrFBgxC6jT1PLksF27MCM
	uT5h6cp1P/vX38GEwJikltALOY4zAv1uVLPRdaX6J8i+zNB6LmK+4A346bu7woaR2Pb1GBGscGht6
	qpjxlF/C8UEv09LkPOGTvCxTCmWsQsAVjWgo7DBUgDUT6zw9zcZF7Od+phqWlT6xPgO3SWYExc5bS
	MfLPLsiA==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW1Uq-0005mI-C2; Thu, 09 Jan 2025 23:59:24 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>
Subject:
 Re: [PATCH v2 19/25] drm/rockchip: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Thu, 09 Jan 2025 23:59:23 +0100
Message-ID: <3227546.fEcJ0Lxnt5@diego>
In-Reply-To: <20250109150310.219442-20-tzimmermann@suse.de>
References:
 <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-20-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 9. Januar 2025, 15:57:13 CET schrieb Thomas Zimmermann:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch to a multiple of 64.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>

I've looked up the patch implementing the new functionality - patch2 of
this series [0] and that looks really nice to get proper helpers and not
having many drivers open-coding the same functionality in different ways.

So for the Rockchip adaptation:

Acked-by: Heiko Stuebner <heiko@sntech.de>

and looking forward to this getting merged :-)

Thanks a lot for working on that
Heiko

[0] https://patchwork.kernel.org/project/linux-rockchip/patch/2025010915031=
0.219442-3-tzimmermann@suse.de/

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_gem.c
> index 6330b883efc3..3bd06202e232 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -9,6 +9,7 @@
>  #include <linux/vmalloc.h>
> =20
>  #include <drm/drm.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -403,13 +404,12 @@ int rockchip_gem_dumb_create(struct drm_file *file_=
priv,
>  			     struct drm_mode_create_dumb *args)
>  {
>  	struct rockchip_gem_object *rk_obj;
> -	int min_pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> +	int ret;
> =20
> -	/*
> -	 * align to 64 bytes since Mali requires it.
> -	 */
> -	args->pitch =3D ALIGN(min_pitch, 64);
> -	args->size =3D args->pitch * args->height;
> +	/* 64-byte alignment required by Mali */
> +	ret =3D drm_mode_size_dumb(dev, args, SZ_64, 0);
> +	if (ret)
> +		return ret;
> =20
>  	rk_obj =3D rockchip_gem_create_with_handle(file_priv, dev, args->size,
>  						 &args->handle);
>=20





