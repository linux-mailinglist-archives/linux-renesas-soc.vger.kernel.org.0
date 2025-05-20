Return-Path: <linux-renesas-soc+bounces-17257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630FABDB2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48CD1BA0B03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9B2245038;
	Tue, 20 May 2025 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VspSBnyQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F812F37;
	Tue, 20 May 2025 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749924; cv=none; b=qinIm93fBfdsNfovLOFaMV9dKPLNxaS/8t90K1w67jEoV03s0FSdZK5AB+qZmGjHSdIC5CVOrz4C3aSCKFXy5NkXfICvfEbBNrYDF7BorGp9fMECI4rfENUT+TPl2G0pUxqYzJi9mTv+liPGFZa3bIOYxmUFg4sx2Q/i+IvxNh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749924; c=relaxed/simple;
	bh=aFjA4hr5J+CI0Kp3gKA3bDQFHu0RiCSC/H0GYSVxbnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bze7B7W+Vp8Og4/Q2ei1HalxbfjXA5uc69PCTasIUWfSrzMnfcC+BnszaevWGeeBssTE1kLiI75NbfDi1VRdPdNy3O8a7vxw70Z09gDCc8BocRAF48zheGJYBfE46OGBLfhBnNvfWBmwS2ntIAm8Pa1P05ETDDvPJBNCscZwxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VspSBnyQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7952EC;
	Tue, 20 May 2025 16:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747749900;
	bh=aFjA4hr5J+CI0Kp3gKA3bDQFHu0RiCSC/H0GYSVxbnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VspSBnyQktAx62F++sBRhCIQrHY3QVApCMawDHNAb7OAt+yH+f47X4xsKznjuBxLg
	 +yBhzgWmYYk4Z5svrKbV7gq1ecAEzKOB8Sw2bhyHJUQCXtJfaU9DhLFDT8TybHbgxL
	 jlqbkAGVNh6cpphXkatdqYF8c6XcJRXDP2ciqcro=
Date: Tue, 20 May 2025 16:05:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Message-ID: <20250520140514.GD13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, May 12, 2025 at 07:23:22PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Simplify the high-speed clock frequency (HSFREQ) calculation by removing
> the redundant multiplication and division by 8. The updated equation:
> 
>     hsfreq = (mode->clock * bpp) / (dsi->lanes);

You can drop the parentheses around the second factor. You can actuall
drop all prentheses.

> 
> produces the same result while improving readability and clarity.
> 
> Additionally, update the comment to clarify the relationship between HS
> clock bit frequency, HS byte clock frequency, and HSFREQ.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - No changes
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - Added Reviewed-by tag from Biju
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index ec8baecb9ba5..c5f698cd74f1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	 *       hsclk: DSI HS Byte clock frequency (Hz)
>  	 *       lanes: number of data lanes
>  	 *
> -	 * hsclk(bit) = hsclk(byte) * 8
> +	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
>  	 */
>  	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
> +	hsfreq = (mode->clock * bpp) / dsi->lanes;

You can drop the parentheses here too.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	ret = pm_runtime_resume_and_get(dsi->dev);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart

