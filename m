Return-Path: <linux-renesas-soc+bounces-8404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C69619E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 00:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B611B22206
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 22:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615F7155303;
	Tue, 27 Aug 2024 22:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CL1Fg7Ru"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C213C08A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 22:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724796484; cv=none; b=kB41UHSyYOgsiInubVGhYBYyCeXwC32zS+mieevDsBqsNd7C1GzsgDFUqMpgMjxl4kz+WbekKTE7+sJV4WsSRl4onMJwf0lWihkba9LnQXRxW/wDdhPNJ55hgT4hTsciKh2Y8cbLoB3I2uu8gD2iNvKlx8r7w0cap9vMPPBeWvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724796484; c=relaxed/simple;
	bh=GwfBdDDBd2G9bTP7LfsBbSl4ezCPOSNJG5zFgL+kz4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soXVvhvFz6XgRANygA+nRVcGyLE7Fxc0diSUgolNoRzRdsFoFwiTJzrlXT8a2lKgSK7dTGCKIC0nZyYx15i7Ur4qJqniWXp5p7dJ4y+ROi51A7h/vJzI8R+Vqp3ZrPNUB5RCW5K4Uq2Z+eenVPMRDiU06jTBbSIvNs3URcrs210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CL1Fg7Ru; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C44E2C5;
	Wed, 28 Aug 2024 00:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724796413;
	bh=GwfBdDDBd2G9bTP7LfsBbSl4ezCPOSNJG5zFgL+kz4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CL1Fg7RuHAgifgypUsKRV5RrpuODBIGnU8pEgfEIjglgGdjwjPheuBOO2nWAj3ymp
	 ZTe3mcEQlqbywlBZzXI47E3QNgMxLn6dkIVOt4SAShrM9HyIFd92g/loSNWJf3FKE+
	 2QnuaLXivTHVDM9L7mws0ZTG7rnOuvv7mB40NP5I=
Date: Wed, 28 Aug 2024 01:07:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Add Kconfig dependency between
 RZG2L_DU and RZG2L_MIPI_DSI
Message-ID: <20240827220756.GG30398@pendragon.ideasonboard.com>
References: <20240827163727.108405-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827163727.108405-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Aug 27, 2024 at 05:37:24PM +0100, Biju Das wrote:
> Add Kconfig dependency between RZG2L_DU and RZG2L_MIPI_DSI, so that
> DSI module has functional dependency on DU. It is similar way that
> the R-Car MIPI DSI encoder is handled.
> 
> While at it drop ARCH_RENESAS dependency as DRM_RZG2L_DU depend on
> ARCH_RZG2L.
> 
> Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 8ec14271ebba..a9488f873436 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -11,10 +11,15 @@ config DRM_RZG2L_DU
>  	  Choose this option if you have an RZ/G2L alike chipset.
>  	  If M is selected the module will be called rzg2l-du-drm.
>  
> -config DRM_RZG2L_MIPI_DSI
> -	tristate "RZ/G2L MIPI DSI Encoder Support"
> -	depends on DRM && DRM_BRIDGE && OF
> -	depends on ARCH_RENESAS || COMPILE_TEST
> -	select DRM_MIPI_DSI
> +config DRM_RZG2L_USE_MIPI_DSI
> +	bool "RZ/G2L MIPI DSI Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	depends on DRM_RZG2L_DU || COMPILE_TEST
> +	default DRM_RZG2L_DU
>  	help
>  	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> +
> +config DRM_RZG2L_MIPI_DSI
> +	def_tristate DRM_RZG2L_DU
> +	depends on DRM_RZG2L_USE_MIPI_DSI
> +	select DRM_MIPI_DSI

-- 
Regards,

Laurent Pinchart

