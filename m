Return-Path: <linux-renesas-soc+bounces-6771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725891785D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 07:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54905B2116D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 05:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608571442FF;
	Wed, 26 Jun 2024 05:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vj/LXfZO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA5139D10;
	Wed, 26 Jun 2024 05:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719381093; cv=none; b=kq/hsj+yPEhq1ualwRg/aauD/Z0FL2LtocIYqSvxuMOcgxP60E8P3a5e4XXjDc0mY7cM+lzmqOHrslsCPLPbnvEFk1z1LyJkwL0yoKqFfBOZtjv+HZkJtc2lT0qOFGphC7fzbanmeG+rfEgBIxBIJ3tO0X6reLUZiPYVbDVGmpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719381093; c=relaxed/simple;
	bh=MHp/zhusMFMz7uCcBaQsQqttODzjyCKr/GtDgI6hQkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xapskr68LZz1amgK3wFy9ZJEMv137Vnhhss5OjiZJmaUhIK+9XxCEqBSGeK1PYPC2GCqUJr/ZkHd0DGcuXSDhi6fBbAwDjeTrZLXrcYiw0FJQNXL5BR0sNTEU5IqGo4Jy8LFDPJVvpvAq4i0qV/ASePeGWNKOhNglSNTl0HLqHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vj/LXfZO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 072A373E;
	Wed, 26 Jun 2024 07:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719381067;
	bh=MHp/zhusMFMz7uCcBaQsQqttODzjyCKr/GtDgI6hQkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vj/LXfZO2Tl3iAaaoMh7OLzFFO1HNUdCnhr9a+k0O1OxFMxd9kj+Kun2tDEc21lZA
	 4/cp5SoG2Lu0ylCPfGluEO48cOmD4mfO4mog4ieRbpnbvWqi0Spo1E7Y1a/YXa+WB2
	 O225teShT5kSQQxCl4+jpEBd+OMWJ32gGXvfVWUw=
Date: Wed, 26 Jun 2024 08:51:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Message-ID: <20240626055108.GA10453@pendragon.ideasonboard.com>
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Jun 25, 2024 at 01:32:44PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> All the RZ/G2L DU specific components are located under the rz-du folder,
> so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
> keeping it in the rcar-du folder. This change improves the organization
> and modularity of the driver configuration by grouping related settings together.

I was thinking the same the other day. Thanks for beating me at sending
a patch :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Do you or Biju has committer rights to drm-misc to push this patch ?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig                   | 8 --------
>  drivers/gpu/drm/renesas/rcar-du/Makefile                  | 2 --
>  drivers/gpu/drm/renesas/rz-du/Kconfig                     | 8 ++++++++
>  drivers/gpu/drm/renesas/rz-du/Makefile                    | 2 ++
>  .../gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c   | 0
>  .../drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h  | 0
>  6 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c (100%)
>  rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h (100%)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> index 53c356aed5d5..39af73cf2092 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -60,14 +60,6 @@ config DRM_RCAR_MIPI_DSI
>  	select DRM_MIPI_DSI
>  	select RESET_CONTROLLER
>  
> -config DRM_RZG2L_MIPI_DSI
> -	tristate "RZ/G2L MIPI DSI Encoder Support"
> -	depends on DRM && DRM_BRIDGE && OF
> -	depends on ARCH_RENESAS || COMPILE_TEST
> -	select DRM_MIPI_DSI
> -	help
> -	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> -
>  config DRM_RCAR_VSP
>  	bool "R-Car DU VSP Compositor Support" if ARM
>  	default y if ARM64
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
> index b8f2c82651d9..6f132325c8b7 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
> @@ -14,5 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
>  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
> -
> -obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 5f0db2c5fee6..8ec14271ebba 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -10,3 +10,11 @@ config DRM_RZG2L_DU
>  	help
>  	  Choose this option if you have an RZ/G2L alike chipset.
>  	  If M is selected the module will be called rzg2l-du-drm.
> +
> +config DRM_RZG2L_MIPI_DSI
> +	tristate "RZ/G2L MIPI DSI Encoder Support"
> +	depends on DRM && DRM_BRIDGE && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select DRM_MIPI_DSI
> +	help
> +	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
> index 663b82a2577f..2987900ea6b6 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -6,3 +6,5 @@ rzg2l-du-drm-y := rzg2l_du_crtc.o \
>  
>  rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
>  obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
> +
> +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> similarity index 100%
> rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> similarity index 100%
> rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h
> rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart

