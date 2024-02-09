Return-Path: <linux-renesas-soc+bounces-2539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8884F826
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 16:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86751F254CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 15:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A877E71B5A;
	Fri,  9 Feb 2024 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBZzGonE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485271B59
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707491237; cv=none; b=l50/LbG2ATJQFaBssHnF300Txg5YOGdXWDa3D/3Y0G7vBIg9UOVwWV4jJ+jvyuS8X3tddmMlaN/fXQCxtkH6KPNpXqupacy1SfP+kwmMGAZwwebd7oYYPNP/69oCTcIaXAfpIXDKFvdg6CsBTMzkPeR5kQmwd7O3h93nY0muAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707491237; c=relaxed/simple;
	bh=rinS97pjiqsWtLhUSgft+o6SOva2SBJaGuOj+ryFpkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmfdT1AbxnTCVEqkzy/FQCNGwnGuRR2ll92VG15pP+4VVRcvzGVhIsiBoe34p3F2QC8gzcWskNITNaDBQ6EybbIGeoAcXKKNTVWZ/1dpPKlR1s3ChWeOz5cIl3LmpBCkd9XbM65e3Ezzfm3jBPx36gsj3B47W0DXTqXGCyXKx6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBZzGonE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC513C433C7;
	Fri,  9 Feb 2024 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707491237;
	bh=rinS97pjiqsWtLhUSgft+o6SOva2SBJaGuOj+ryFpkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBZzGonEEQyIIm7NlUI1T0TIfsPwn2+p51y4K3zmruvxQEzpLzcGf/BMUDMjWXY8T
	 1fV0biGk3M7z6sr6kAcrRqudgZGX31HUgPtfuz52EzylU4/P4AAsNbZftcAwlgaisH
	 AnW9MeSx7CrscRbuytl8H8oC8yuUaOSYsqlChBm7SZr0NNQ9zgkJj9PgE0Ul0ipxOx
	 cz/tuAjhhV3dp1XC9B7jYYZBIc1uVGirnaJUHiBQ03GYcqFX4vZgjVfjB2g1wctQXS
	 xD/zO3g0kCB+AElQS7/t0u42rdu/EL6dbyU7aGD2EPOd4EKc3w41nKTwHNPvbkAlPS
	 mxW3NvkqY8zKA==
Date: Fri, 9 Feb 2024 16:07:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v16 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <ksm44nhkamq3gdbykn3o3d7xobvhepm44gnwjhtw3xaygvgsn4@5tq7hatvbrd4>
References: <20240122164257.56326-1-biju.das.jz@bp.renesas.com>
 <20240122164257.56326-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwu2odvuxvffijsk"
Content-Disposition: inline
In-Reply-To: <20240122164257.56326-4-biju.das.jz@bp.renesas.com>


--fwu2odvuxvffijsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 04:42:55PM +0000, Biju Das wrote:
> +static const struct drm_gem_object_funcs rzg2l_du_gem_funcs = {
> +	.free = drm_gem_dma_object_free,
> +	.print_info = drm_gem_dma_object_print_info,
> +	.get_sg_table = drm_gem_dma_object_get_sg_table,
> +	.vmap = drm_gem_dma_object_vmap,
> +	.mmap = drm_gem_dma_object_mmap,
> +	.vm_ops = &drm_gem_dma_vm_ops,
> +};
> +
> +struct drm_gem_object *
> +rzg2l_du_gem_prime_import_sg_table(struct drm_device *dev,
> +				   struct dma_buf_attachment *attach,
> +				   struct sg_table *sgt)
> +{
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_gem_object *gem_obj;
> +	int ret;
> +
> +	/* Create a DMA GEM buffer. */
> +	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
> +	if (!dma_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	gem_obj = &dma_obj->base;
> +	gem_obj->funcs = &rzg2l_du_gem_funcs;
> +
> +	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
> +	dma_obj->map_noncoherent = false;
> +
> +	ret = drm_gem_create_mmap_offset(gem_obj);
> +	if (ret) {
> +		drm_gem_object_release(gem_obj);
> +		kfree(dma_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	dma_obj->dma_addr = 0;
> +	dma_obj->sgt = sgt;
> +
> +	return gem_obj;
> +}

It looks like you're just reusing the helpers there, why do you need to
declare a new import_sg_table implementation?

Maxime

--fwu2odvuxvffijsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcY/oQAKCRDj7w1vZxhR
xfXfAP9/s1rUrawgMsN6iFY3i0twov7+iO6YQ+ohbqcgD3mZxgD+Ki8z0f6ucECn
CdAs1qPMF8cxGSMkHPNrv/KBO5uFugw=
=2u3k
-----END PGP SIGNATURE-----

--fwu2odvuxvffijsk--

