Return-Path: <linux-renesas-soc+bounces-11147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52129EAF7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 12:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84672289845
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 11:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EED2080EF;
	Tue, 10 Dec 2024 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U8tXGh05"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E5223E95
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828927; cv=none; b=uyUg/3l9dfNlcfnoF3hrvqadE7URHzQSsFmJf4xPpkMJwWTt6YDbxhuM2hBS+wTwwOwU+iEklxRRFMv4ZX/EAQ0R/jFtyD21Jo2gmn7wM2VqWnzljfZQUvEGrrv5+FvS82Ie6sjADhb6UmkyRNbPf5bO5zYQUbJnKY+yss6HAWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828927; c=relaxed/simple;
	bh=DBnbhjkdJSnKBI/tnnIo1zsbOX9XVkFGe0UVm4dZi6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYnu9HIGKkPDpFXji+uJ+/Jm9gn3QqPDIq7yz/7arKAXGlw8qUIjw5cOeXBvL3nA+BcIKazDWm+Gxq75p3IRnmYWvH3aFUoESVbtxmdVq1Jtzg3DJUB15Jf8I+nwtCOyS4BVe9+BLyifqVb1mpJaZcvPytTLgBxVS+CtMXPs3Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U8tXGh05; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F3EF752;
	Tue, 10 Dec 2024 12:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733828891;
	bh=DBnbhjkdJSnKBI/tnnIo1zsbOX9XVkFGe0UVm4dZi6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8tXGh05b6ghXdhKFpG7CRTTeNJngGryJSdzasrk3K9EpbHS3qtJOg04YslNCwAZl
	 IU6mSe35Cn7xwtuulASj8SAmTaqjJqSasx5ZrhbmIHshr+iJ7qdCXg7CG3QQ7x4l8K
	 4SljSuIVpjZKdZCxEAf58Vbd+IKF3k+lO3nZIBpw=
Date: Tue, 10 Dec 2024 13:08:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
Message-ID: <20241210110827.GE573@pendragon.ideasonboard.com>
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
 <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022082433.32513-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Oct 22, 2024 at 09:24:23AM +0100, Biju Das wrote:
> The DPI_OE bit is removed from the latest RZ/G2UL and RZ/G2L hardware
> manual. So, drop this macro.
> 
> Fixes: b330f1480172 ("drm: renesas: rz-du: Add RZ/G2UL DU Support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * Added Fixes tag.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index c4c1474d487e..6e7aac6219be 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -28,7 +28,6 @@
>  #include "rzg2l_du_vsp.h"
>  
>  #define DU_MCR0			0x00
> -#define DU_MCR0_DPI_OE		BIT(0)
>  #define DU_MCR0_DI_EN		BIT(8)
>  
>  #define DU_DITR0		0x10
> @@ -217,14 +216,9 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
>  
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
> -	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(rcrtc->crtc.state);
>  	struct rzg2l_du_device *rcdu = rcrtc->dev;
> -	u32 val = DU_MCR0_DI_EN;
>  
> -	if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
> -		val |= DU_MCR0_DPI_OE;
> -
> -	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
> +	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
>  }
>  
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)

-- 
Regards,

Laurent Pinchart

